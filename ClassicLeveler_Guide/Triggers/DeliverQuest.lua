local function OnDtCompleted(texture)
    -- Adding CLGuide_CurrentStepTable.Dt.Vendor to CLGuide_QuestCompleteVendorCache list, if any is specified
    if CLGuide_CurrentStepTable.Dt.Vendor ~= nil then
        table.insert(CLGuide_QuestCompleteVendorCache,-1, CLGuide_CurrentStepTable.Dt.Vendor)
    end
    
    if CLGuide_CurrentStepTable.Dt.Use and CLGuide_CurrentStepTable.Dt.Use == 1 then
        CLGuide_SetupItemButtonNewItem(CLGuide_CurrentStepTable.Dt.Item, texture)
    end
	-- only go to next step if had bagspace and got item?
    -- EDIT: sortof nvm, we now check this inside OnQuestComplete(), so it should be handled
	CLGuide_CompleteCurrentStep()
end

local function ChooseQuestRewardAndGoNextStep(rewardIdx)

	if rewardIdx == nil then
		GetQuestReward()
        OnDtCompleted(nil) -- todo: some annoyingly elaborate way of finding texture of CLGuide_CurrentStepTable.Dt.Item when it is not nil
	else
        local _,texture = GetQuestItemInfo("choice", rewardIdx)
		GetQuestReward(rewardIdx)
        OnDtCompleted(texture)
	end
	
end

-- returns the index of a quest reward in the currently open quest complete dialogue
-- if none is open, or the itemName is not found, returns nil
local function GetQuestRewardIndex(guideSpecifiedItem)
	local guideItemLower = string.lower(guideSpecifiedItem)
	local numChoices = GetNumQuestChoices();
	for i=1, numChoices do
		local itemName = string.lower(GetQuestItemInfo("choice", i))
		if guideItemLower == itemName then
			return i
		end
	end
	return nil
end

-- This function is called when you get to the Complete Quest button page, not when the quest ACTUALLY is delivered.
-- If we call GetQuestReward() in here, we can assume the quest completes (unless inventory is full).
-- We can jump to next guidestep after calling GetQuestReward if we can find a reliable way to check amount of available bagspace
-- and number of items received by the quest.
local function OnQuestComplete()
	-- GetNumQuestChoices() Gets the number of rewards for a quest that you are currently turning in successfully.
	-- GetNumQuestLogChoices() Documented similarly to GetNumQuestChoices...

	local numChoices = GetNumQuestChoices();
	local title = GetTitleText()
	
	-- extra double triple control check that we're actually looking at the correct quest here
	if string.lower(title) ~= string.lower(CLGuide_CurrentStepTable.Dt.q) then
		GuidePrint("Selected quest ("..title..") does not match Guide quest ("..CLGuide_CurrentStepTable.Dt.q..")");
		GuidePrint("This should not happen, and something is broken. Turn inn the quest manually (hold shift to disable addon)")
		return
	end

	GuidePrint("Autocompleting: "..title..", Choices: "..numChoices);
	
	local numRewardsToGet = GetNumQuestRewards()
	if numChoices > 1 then 
		numRewardsToGet = numRewardsToGet + 1
	end
	if CLGuide_GetNumFreeBagspace() < numRewardsToGet then
		GuidePrint("Not enough bagspace to receive all reward items. Not autocompleting");
		return
	end

	if numChoices == nil or numChoices == 0 then
		ChooseQuestRewardAndGoNextStep(nil)
	elseif numChoices == 1 then
		ChooseQuestRewardAndGoNextStep(1)
	elseif CLGuide_CurrentStepTable.Dt.Item ~= nil then
		local rewardIdx = GetQuestRewardIndex(CLGuide_CurrentStepTable.Dt.Item)
		if rewardIdx == nil then
			GuidePrint("Could not find reward specified ("..CLGuide_CurrentStepTable.Dt.Item.."). Complete the quest manually")
		else 
			ChooseQuestRewardAndGoNextStep(rewardIdx)
		end
	else
		GuidePrint("No quest reward specified in Guide, but multiple options. Complete the quest manually.")
	end
end

local function CLGuide_IsQuestCompletable()
	CLGuide_AssertOnClassic("CLGuide_IsQuestCompletable()")
	local comparator = 1
	if CLGuide_GameVersion ~= "1.12" then
		comparator = true
	end
	if IsQuestCompletable() == comparator then
		return 1
	else
		return 0
	end
end

local function OnQuestProgress()
	if CLGuide_IsQuestCompletable() == 1 then
		CompleteQuest() -- emulates clicking continue
	else
		GuidePrint(GetTitleText().." - Not yet completed")
		if CLGuide_CurrentStepTable.Dt.SkipIfUncomplete ~= nil then
            GuideWarning("SkipIfUncomplete flag set. Skipping step")
            CLGuide_CompleteCurrentStep()
        end
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
	local stepQuestnameLower = string.lower(CLGuide_CurrentStepTable.Dt.q)
	for i=1, numActiveQuests do
		local questName = string.lower(activeQuestInfo[i*questStep-(questStep-1)])
		if string.lower(questName) == stepQuestnameLower then
			SelectGossipActiveQuest(i)
			return
		end
	end
	GuidePrint("DeliverQuest OnGossipShow <"..CLGuide_CurrentStepTable.Dt.q.."> not found")
end

local function OnQuestGreeting()
	for i=1, GetNumActiveQuests() do
		if string.lower(GetActiveTitle(i)) == string.lower(CLGuide_CurrentStepTable.Dt.q) then
			SelectActiveQuest(i)
			return
		end
	end
	GuidePrint("DeliverQuest OnQuestGreeting <"..CLGuide_CurrentStepTable.Dt.q.."> not found")
end

local function HaveQuestInQuestlog(qtitle)
	local e = GetNumQuestLogEntries()
    local qlower = string.lower(qtitle)
	for q=1, e do
		if string.lower(GetQuestLogTitle(q)) == qlower then 
			return 1
		end
	end
	--QRP_Print("CL_HasQuest: <"..qtitle.."> not found")
	return 0
end

function CLGuide_DeliverQuest()
	if CLGuide_CurrentStepTable.Dt == nil then return end
	if IsShiftKeyDown() then return end

    --TODO: Complete the step if you don't have the quest in questlog here, but NOT sure if this can ever cause
    -- a race condition and make you skip a step due to quick automatic deliver+accept followup
    -- ACTUALLY: "race condition" confirmed when you deliver->accept->deliver a quest of the same name in 3 consecutive steps
    -- trying without this for a while to see how things work now
    --if HaveQuestInQuestlog(CLGuide_CurrentStepTable.Dt.q) == 0 then
    --    GuidePrint("DeliverQuest-step: <"..CLGuide_CurrentStepTable.Dt.q.."> did not exist in questlog. Completing step.")
    --    CLGuide_CompleteCurrentStep()
    --    return
    --end
	-- QUEST_FINISHED: Fired whenever the quest frame changes (Detail to Progress to Reward, etc.) or is closed.
	-- QUEST_DETAIL: do we not need to check this here?

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
	elseif event == "CHAT_MSG_SYSTEM" then
        -- if quest is turned inn manually, we look for the "questname Completed" system msg
        local msglower = string.lower(arg1)
        if string.find(msglower, "completed") ~= nil and string.find(msglower, string.lower(CLGuide_CurrentStepTable.Dt.q)) ~= nil then
            OnDtCompleted()
        end
    end
end