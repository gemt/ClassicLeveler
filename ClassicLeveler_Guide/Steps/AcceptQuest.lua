local function OnGossipShow()
	GuidePrint("GossipShow:")
	local availableQuestInfo = { GetGossipAvailableQuests() };
	for i=1,getn(availableQuestInfo) do
		GuidePrint(availableQuestInfo[i])
	end
	GuidePrint("")
	-- this is a hack where we assume (based on documentation) that regardless of how many values are returned
	-- for each quest (seems to be 2 in 1.12 and 6 in 8.x), only ONE string value is returned. In other words,
	-- the number of strings should equal the number of quests
	-- ALTERNATIVELY, GetNumGossipAvailableQuests() was added to the API at some point. Maybe we can use it in classic
	local numAvailableQuest = CLGuide_GetNumStrings(availableQuestInfo) 
	GuidePrint("NumAvail: "..numAvailableQuest)
	local questStep = getn(availableQuestInfo) / numAvailableQuest
	GuidePrint("questStep: "..questStep)
	local stepQuestnameLower = string.lower(CLGuide_CurrentStepTable.At)
	GuidePrint("stepQuestnameLower: "..stepQuestnameLower)
	for i=1, numAvailableQuest do
		local questName = string.lower(availableQuestInfo[i*questStep-(questStep-1)])
		GuidePrint("gossip quest "..i..": "..questName)
		if string.lower(questName) == stepQuestnameLower then
			SelectGossipAvailableQuest(i)
			return
		end
	end
	GuidePrint("AcceptQuest OnGossipShow <"..CLGuide_CurrentStepTable.At.."> not found")
end

local function OnQuestGreeting()
	for i=1, GetNumAvailableQuests() do
		if string.lower(GetAvailableTitle(i)) == string.lower(CLGuide_CurrentStepTable.At) then
			SelectAvailableQuest(i)
			return
		end
	end
	GuidePrint("AcceptQuest OnGossipShow <"..CLGuide_CurrentStepTable.At.."> not found")
end

local function IsQuestlogFull()
	local numEntries,numQuests = GetNumQuestLogEntries()
	if numQuests < 20 then return 0
	else return 1 end
end

local function OnQuestDetail()
	if string.lower(CLGuide_CurrentStepTable.At) == string.lower(GetTitleText()) then
		AcceptQuest();
		CLGuide_CompleteCurrentStep()
	else
		GuidePrint(GetTitleText().." - not current guideStep. If you get sent to this page as a bug, disable automation by holding shift.")
	end
end


function CLGuide_AcceptQuest()
	if CLGuide_CurrentStepTable.At == nil then return end
	if IsShiftKeyDown() then return end -- disabling quest completion logic when holding shift down
	GuidePrint("At: "..event)
	if IsQuestlogFull() == 1 then
		GuidePrint("Questlog is full. Cannot autoaccept any quests.")
		return
	end

	if event == "QUEST_GREETING" then
		OnQuestGreeting()
	elseif event == "GOSSIP_SHOW" then
		OnGossipShow()
	elseif event == "QUEST_DETAIL" then
		-- When you are on the UI frame showing "continue" button?
		-- When you are on the UI frame where you can accept a new quest
		OnQuestDetail()
	elseif event == "QUEST_PROGRESS" then
		-- continue button screen
		OnQuestProgress()
	elseif event == "CHAT_MSG_SYSTEM" then
        -- This event is not reliable on 1.12, if you accept multiple quests in quick succession, they may not show
        -- Ideally we don't need to rely on this event to know when a quest is accepted, instead we should 
        -- know it when we "click" the accept quest button. But this is still a decent control check 
        local arg1Lower = string.lower(arg1)
        if string.find(arg1Lower, "quest accepted:") ~= nil then
            if string.find(arg1Lower, string.lower(CLGuide_CurrentStepTable.At)) ~= nil then
                CLGuide_CompleteCurrentStep()
            end
        end
    elseif event == "QUEST_ACCEPTED" then
		-- dosent exist in vanilla i think
		GuidePrint("QUEST_ACCEPTED EXISTS!!!")
	end
	
end