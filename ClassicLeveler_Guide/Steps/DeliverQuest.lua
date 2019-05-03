
-- TODO: We want to equip itemName when calling this function.
-- Typically we call it after completing a quest where we have specified we wish
-- to use the item after getting it. Not sure if it works to equip during handling of the event
-- so maybe we need a popupframe u can click afterwards?
function EquipItem(itemName)

end

local function Guide_ChooseQuestReward(rewardIdx)
	if rewardIdx == nil then
		GetQuestReward()
	else
		-- todo: check that we have bagspace for the item before
		-- completing the quest and going to next step. 
		-- If no bagspace, show a warning?
		GetQuestReward(rewardIdx)
		EquipItem(Guide.CurrentStep.Dt.item)
	end
	
	-- only go to next step if had bagspace and got item?
	Guide_CompleteStep(Guide.CurrentStepIndex)
end

-- returns the index of a quest reward in the currently open quest complete dialogue
-- if none is open, or the itemName is not found, returns nil
local function GetQuestRewardIndex(itemName)
	local numChoices = GetNumQuestChoices();
	for i=1, numChoices do
		local itemName = GetQuestItemInfo("choice", i);
		if quest.Item == itemName then
			return i
		end
	end
	return nil
end


-- This function is called when you get to the Complete Quest button page, not when the quest ACTUALLY is delivered
-- though, if we call GetQuestReward() in here, we can assume the quest completes (unless inventory is full), which can 
-- be used to complete the current step
local function OnQuestComplete()
	

	-- GetNumQuestChoices() Gets the number of rewards for a quest that you are currently turning in successfully.
	-- numEntries, numQuests = GetNumQuestLogEntries() num quests in log. 
	-- GetNumQuestLogChoices() the same as above?
	-- GetQuestLogTitle(index) -- name of a quest in the questlog
	-- GetTitleText() -- trieves the title of the quest while talking to the NPC about it.
	-- IsQuestCompletable() -- returns 1 if current npc questdialogue thing can be completed
	local numChoices = GetNumQuestChoices();
	local title = GetTitleText()
	GuidePrint("Autocompleting: "..title..", Choices: "..numChoices);
	
	if Guide.CurrentStep.Dt.q == title then
		if numChoices == 0 then
			ChooseQuestReward(nil)
		elseif numChoices == 1 then
			ChooseQuestReward(1)
			return
		elseif Guide.CurrentStep.Dt.item ~= nil then
			local rewardIdx = GetQuestRewardIndex(Guide.CurrentStep.Dt.item)
			if rewardIdx == nil then
				GuidePrint("Could not find reward specified ("..Guide.CurrentStep.Dt.item.."). Not autocompleting")
			else 
				ChooseQuestReward(rewardIdx)
			end
		end
	else
		-- scan nearby steps to see if this is a later or earlier step?
		GuidePrint("Unknown quest. No autoaccepting reward")
	end

end

local function OnQuestProgress()
	if CLGuide_IsQuestCompletable() == 1 then
		CompleteQuest() -- emulates clicking continue
	else
		GuidePrint(GetTitleText().." - Not yet completed")
		DeclineQuest() -- emulates clicking cancel button, taking us back to main gossip menu if there is one
	end
end

local function OnGossipShow()
	local activeQuestInfo = { GetGossipActiveQuests() };

	-- this is a hack where we assume (based on documentation) that regardless of how many values are returned
	-- for each quest (seems to be 2 in 1.12 and 6 in 8.x), only ONE string value is returned. In other words,
	-- the number of strings should equal the number of quests
	-- ALTERNATIVELY, GetNumGossipAvailableQuests() was added to the API at some point. Maybe we can use it in classic
	local numActiveQuests = CLGuide_GetNumStrings(activeQuestInfo) 
	local questStep = getn(activeQuestInfo) / numActiveQuests
	local stepQuestnameLower = string.lower(CLGuide_CurrentStep.Dt.q)
	for i=1, numActiveQuests do
		local questName = string.lower(activeQuestInfo[i*questStep])
		if string.lower(questName) == stepQuestnameLower then
			SelectGossipActiveQuest(i)
			return
		end
	end
	GuidePrint("Guide_Dt_OnQuestGreetingOrGossipShow <"..Guide.CurrentStep.Dt.q.."> not found")
end

local function OnQuestGreeting()
	for i=1, GetNumActiveQuests() do
		if string.lower(GetActiveTitle(i)) == string.lower(CLGuide_CurrentStep.Dt.q) then
			SelectActiveQuest(i)
			return
		end
	end
	GuidePrint("Guide_Dt_OnQuestGreetingOrGossipShow <"..Guide.CurrentStep.Dt.q.."> not found")
end

function CLGuide_DeliverQuest()
	if CLGuide_CurrentStep.Dt == nil then return end
	if IsShiftKeyDown() then return end -- disabling quest completion logic when holding shift down

	-- QUEST_FINISHED: Fired whenever the quest frame changes (Detail to Progress to Reward, etc.) or is closed.

	if event == "QUEST_GREETING" then
		OnQuestGreeting()
	elseif event == "GOSSIP_SHOW" then
		OnGossipShow()
	elseif event == "QUEST_COMPLETE" then
		-- Fired after the player hits the "Continue" button in the quest-information page, 
		-- and the Complete Quest button is shown.
		OnQuestComplete()
	elseif event == "QUEST_PROGRESS" then
		-- continue button screen
		OnQuestProgress()
	end
end