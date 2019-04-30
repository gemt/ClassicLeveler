-- Author      : G3m7
-- Create Date : 4/26/2019 7:18:13 PM

--GetNumQuestLeaderBoards([index]) number of objectives of a quest. If no index, the selected quest, or index in questlog.
-- GossipFrameGreetingGoodbyeButton:Click() -- close a dialogue with goodbye button
--[[
AbandonQuest - Abandon the specified quest.
AcceptQuest - Accept the specified quest.
AddQuestWatch(x)   - Add a quest to the watch list.
CloseQuest - ?.
CollapseQuestHeader - Collapses a quest header.
CompleteQuest - Complete the specified quest.
ConfirmAcceptQuest - Accept the quest. Yes. Really accept it.
DeclineQuest - Declines the currently offered quest.
ExpandQuestHeader - Expands a quest header.
GetAbandonQuestName - Gets the name of a quest while it is being abandoned.
GetActiveLevel(index) - Gets the level of an active quest (only available after QUEST_GREETING event).
GetActiveTitle(index) - Gets the title of an active quest (only available after QUEST_GREETING event).
GetAvailableLevel(index) - Gets the level of an available quest (only available after QUEST_GREETING event).
GetAvailableTitle(index) - Gets the title of an available quest (only available after QUEST_GREETING event).
GetGreetingText()
GetNumActiveQuests - Gets the number of currently active quests from this NPC (only available after QUEST_GREETING event).
GetNumAvailableQuests - Gets the number of currently available quests from this NPC (only available after QUEST_GREETING event).
GetNumQuestChoices - Returns the number of rewards for a completed quest.
GetNumQuestItems - Returns the number of items nessecary to complete a particular quest.
GetNumQuestLeaderBoards([questIndex])   - Returns the number of available quest objectives.
GetNumQuestLogChoices - Returns the number of options someone has when getting a quest item.
GetNumQuestLogEntries - Returns the number of entries in the quest log.
GetNumQuestLogRewards - Returns the count of the rewards for a particular quest.
GetNumQuestRewards - ?.
GetNumQuestWatches()   - Returns the number of quest watches active.
GetObjectiveText()   - Gets the objective of the current quest.
GetProgressText()
GetQuestBackgroundMaterial - Returns the material string associated with the particular quest.
GetQuestGreenRange()   - Return for how many levels below you quests and mobs remain "green" (i.e. yield xp)
GetQuestIndexForTimer - ?.
GetQuestIndexForWatch(watchIndx)   - Return the quest index for the specified watch
GetQuestItemInfo - Returns basic information about the quest items.
GetQuestItemLink - Returns an itemLink for a quest reward item.
GetQuestLogChoiceInfo - Returns a bunch of data about a quest reward choice from the quest log.
GetQuestLogItemLink - ?.
GetQuestLogLeaderBoard(ldrIndex[, questIndex])   - Gets information about the objectives for a quest.
GetQuestLogPushable - Returns true if the currently loaded quest in the quest window can be shared.
GetQuestLogQuestText - Returns the description and objectives required for the specified quest.
GetQuestLogRequiredMoney - ?.
GetQuestLogRewardInfo - Returns a pile of reward item info.
GetQuestLogRewardMoney - Returns a number representing the amount of copper returned by a particular quest.
GetQuestLogRewardSpell - ?.
GetQuestLogSelection - Returns a number associated with the QuestLogSelection index.
GetQuestLogTimeLeft - ?.
GetQuestLogTitle - Returns the string which is associated with the specific QuestLog Title in the game.
GetQuestMoneyToGet - ?
GetQuestReward - Gets the quest reward specified.
GetQuestText - Gets the description of the current quest.
GetQuestTimers - Returns all of the quest timers currently in progress.
GetRewardMoney - Returns a number representing the amount of copper returned by a particular quest.
GetRewardSpell - ?.
GetRewardText - ?.
GetTitleText - Retrieves the title of the quest while talking to the NPC about it.
IsCurrentQuestFailed - ?.
IsQuestCompletable - Returns true if a quest is possible to complete.
IsQuestWatched(questIndex)   - Determine if the specified quest is watched.
IsUnitOnQuest(questIndex, "unit")   - Determine if the specified unit is on the given quest.
QuestChooseRewardError - Throws an error when the quest choose reward method doesn't work.
QuestLogPushQuest - Initiates the sharing of the currently viewed quest in the quest log.
RemoveQuestWatch(index)   - Remove a quest watch (Is the index a quest or watch index?).
SelectQuestLogEntry - ?.
SetAbandonQuest - Called before AbandonQuest.
UI ToggleQuestLog - Opens/closes the quest log.
]]
function QRP_Print(msg)
	if not DEFAULT_CHAT_FRAME then 
		return 
	end
    DEFAULT_CHAT_FRAME:AddMessage ( msg )
    ChatFrame3:AddMessage ( msg )
    ChatFrame4:AddMessage ( msg )
end

local version = GetBuildInfo();
local QRPF_AvailableQuestIndex = 1
local QRPF_ActiveQuestIndex = 1
local QRPF_PrevGossipNpc = nil
CLQuestRewardChoices = {}
function QRPFrame_OnLoad()
	QRPFrame:RegisterEvent("QUEST_COMPLETE")
	QRPFrame:RegisterEvent("QUEST_PROGRESS")
	QRPFrame:RegisterEvent("QUEST_GREETING")
    QRPFrame:RegisterEvent("GOSSIP_SHOW")
	QRPFrame:RegisterEvent("GOSSIP_CLOSED")
	QRPFrame:RegisterEvent("GOSSIP_CONFIRM_CANCEL")
    QRPFrame:RegisterEvent("QUEST_ACCEPTED")
	QRPFrame:RegisterEvent("QUEST_ACCEPT_CONFIRM")
	--QRPFrame:RegisterEvent("QUEST_QUERY_COMPLETE")
	QRPFrame:RegisterEvent("QUEST_POI_UPDATE")
	QRPFrame:RegisterEvent("QUEST_DETAIL")
	QRPFrame:RegisterEvent("QUEST_LOG_UPDATE")
	QRPFrame:RegisterEvent("QUEST_ITEM_UPDATE")
	QRPFrame:RegisterEvent("QUEST_WATCH_UPDATE")
	QRPFrame:RegisterEvent("UNIT_QUEST_LOG_CHANGED")
	QRPFrame:RegisterEvent("QUEST_LOG_UPDATE")
	QRPFrame:RegisterEvent("PLAYER_TARGET_CHANGED")


	--QRPFrame:RegisterEvent("ADDON_LOADED")

end

function QRPFrame_OnEvent(event, arg1)
	--QRP_Print("QuestPicker Event: "..event)
	if event == "QUEST_COMPLETE" then -- when the quest complete dialogue is shown at an npc
		QRPF_QuestComplete();
	elseif event == "GOSSIP_SHOW" or event == "QUEST_GREETING" then -- after opening dialogue with an npc. Also after clicking cancel, and being sent back to initial gossip screen
		QRPF_GossipShow(event);
	elseif event == "QUEST_DETAIL" then -- after selecting an unaccepted quest on an npc
		QRPF_QuestDetail();
	elseif event == "QUEST_PROGRESS" then -- after selecting an active quest on an npc
		QRPF_QuestProgress();
	elseif event == "GOSSIP_CLOSED" then
		QRPF_GossipClose()
	elseif event == "UNIT_QUEST_LOG_CHANGED" or event == "QUEST_LOG_UPDATE" then
		QRP_Print("Quest log changed. Resetting available/active gossip indexes")
		QRPF_PrevGossipNpc = nil
		QRPF_AvailableQuestIndex = 1
		QRPF_ActiveQuestIndex = 1
	elseif event == "PLAYER_TARGET_CHANGED" then
		QRPF_PrevGossipNpc = nil
		QRPF_AvailableQuestIndex = 1
		QRPF_ActiveQuestIndex = 1
	elseif event == "ADDON_LOADED" then

	end

end


-- after closing dialogue with an npc
function QRPF_GossipClose()
end

-- after opening dialogue with an npc
local NumActiveFunc = GetNumActiveQuests -- GetGossipActiveQuests
local NumAvailableFunc = GetNumAvailableQuests -- GetGossipAvailableQuests
local SelectActiveFunc = SelectActiveQuest --SelectGossipActiveQuest
local SelectAvailableFunc = SelectAvailableQuest --SelectGossipAvailableQuest 

function QRPF_GossipShow(event)
	local gossipNpcName = UnitName("Target")
	--QRP_Print("npcname: "..gossipNpcName)
	if QRPF_PrevGossipNpc == nil or gossipNpcName ~= QRPF_PrevGossipNpc then
		QRP_Print("resetting indexes")
		QRPF_AvailableQuestIndex = 1
		QRPF_ActiveQuestIndex = 1
		QRPF_PrevGossipNpc = gossipNpcName
	end
	--QRP_Print("prevNpc: "..QRPF_PrevGossipNpc)
	if IsShiftKeyDown() then return end

	if event == "GOSSIP_SHOW" then
		SelectActiveFunc	= SelectGossipActiveQuest
		SelectAvailableFunc = SelectGossipAvailableQuest 
	elseif event == "QUEST_GREETING" then
		SelectActiveFunc	= SelectActiveQuest
		SelectAvailableFunc = SelectAvailableQuest
	end

	QRP_Print("QRPF_AvailableQuestIndex: "..QRPF_AvailableQuestIndex)
	QRP_Print("QRPF_ActiveQuestIndex: "..QRPF_ActiveQuestIndex)
	local numActive = 0;
	local numAvail = 0;
	if event == "GOSSIP_SHOW" then
		numActive = ProcessGossipNumActiveQuest(GetGossipActiveQuests())--GetGossipActiveQuests
		numAvail  = ProcessGossipNumAvailableQuest(GetGossipAvailableQuests())--GetGossipAvailableQuests
	elseif event == "QUEST_GREETING" then
		numActive = GetNumActiveQuests()
		numAvail  = GetNumAvailableQuests()
	end
	--local numActive = NumActiveFunc();
	--local numAvail = NumAvailableFunc();
	QRP_Print("Active Quests: "..numActive);
	QRP_Print("Available Quests: "..numAvail);

	if numAvail ~= 0 and QRPF_AvailableQuestIndex <= numAvail then
		QRP_Print("Selecting Available quest "..QRPF_AvailableQuestIndex)
		QRPF_AvailableQuestIndex = QRPF_AvailableQuestIndex + 1;
		SelectAvailableFunc(QRPF_AvailableQuestIndex - 1)
	elseif numActive ~= 0 and QRPF_ActiveQuestIndex <= numActive then
		QRP_Print("Selecting Active quest "..QRPF_ActiveQuestIndex)
		QRPF_ActiveQuestIndex = QRPF_ActiveQuestIndex + 1;
		SelectActiveFunc(QRPF_ActiveQuestIndex - 1)
	end
	-- SelectGossipActiveQuest(QRPF_GossipIndex)

	--SelectGossipActiveQuest(index) - Selects an active quest.
	--SelectGossipAvailableQuest(index) - Selects an available quest.
	--[[
	First turn inn any completed quests, then accept new ones? how???

	]]

	-- LazyPig_ReplyQuest(event);
end

function ProcessGossipNumActiveQuest(...)
	local arg = { GetGossipActiveQuests() };
	if arg == nil then return 0 end
	if version == "1.12.1" then
		return table.getn(arg)/2
	elseif version == "8.1.5" then
		return table.getn(arg)/6
	end
end

function ProcessGossipNumAvailableQuest(...)
	local arg = { GetGossipAvailableQuests() };
	if arg == nil then return 0 end
	if version == "1.12.1" then
		return table.getn(arg)/2
	elseif version == "8.1.5" then
		return table.getn(arg)/7
	end
	QRP_Print(1/"") -- "assert", need to test other versions
end

-- after selecting an unaccepted quest on an npc
function QRPF_QuestDetail()
	if IsShiftKeyDown() then return end

	local title = GetTitleText()
	local ignoreQ = CLIgnoreQuests[title]
	if ignoreQ ~= nil then
		if ignoreQ.Objective == nil then 
			QRP_Print(title.." Ignored.")
			return
		else
			local objective = GetObjectiveText()
			if string.find(objective, quest.Objective) then
				QRP_Print(title.." Ignored.")
				return
			end
		end
	end
	QRP_Print("AutoAccepting "..GetTitleText())
	AcceptQuest();
end

-- after selecting an active quest on an npc
function QRPF_QuestProgress()
	if IsShiftKeyDown() then return end
	-- DeclineQuest/CompleteQuest triggers GOSSIP_CLOSED, even if gossip isent actually closed, 
	-- at least in 1.12 client. So in order to not reset QRPF_GossipIndex, we set QRPF_DeclineQuestGossipClose
	-- which is checked by QRPF_GossipClose(), and when it's 1, QRPF_GossipIndex is not reset to 1
	local comparator = 1
	if version ~= "1.12.1" then
		comparator = true
	end
	if IsQuestCompletable() == comparator then -- TODO: might return true/false on BFA
		CompleteQuest() -- emulates clicking continue
	else
		QRP_Print(GetTitleText().." Not yet completed")
		DeclineQuest() -- emulates clicking cancel button, taking us back to main gossip menu if there is one
	end
end

-- when the quest complete dialogue is shown at an npc
function QRPF_QuestComplete()
	if IsShiftKeyDown() then return end

	--GetNumQuestChoices() Gets the number of rewards for a quest that you are currently turning in successfully.
	-- numEntries, numQuests = GetNumQuestLogEntries() num quests in log. 
	-- GetNumQuestLogChoices() the same as above?
	--GetQuestLogTitle(index) -- name of a quest in the questlog
	-- GetTitleText() -- trieves the title of the quest while talking to the NPC about it.
	-- IsQuestCompletable() -- returns 1 if current npc questdialogue thing can be completed
	local numChoices = GetNumQuestChoices();
	local title = GetTitleText()
	QRP_Print("Autocompleting: "..title..", Choices: "..numChoices);
	
	if numChoices == 0 then
		GetQuestReward()
		return
	elseif numChoices == 1 then
		GetQuestReward(1)
		return
	end
	local questIndex = title.."|"..GetQuestItemInfo("choice", 1)
	QRP_Print(questIndex)
	local quest = CLQuestRewardChoices[questIndex]
	if quest == nil then
		QRP_Print("Unknown quest. No autoaccepting reward")
		return
	end
	
	for i=1, numChoices do
		local itemName = GetQuestItemInfo("choice", i);
		if quest.Item == itemName then
			QRP_Print("Choosing Item:"..itemName)
			GetQuestReward(i);
			if quest.Use == 1 then
				QRPF_EquipItem() -- how?
			end
			return
		end
	end
	QRP_Print("Multiple choices, none configured for autocompletion")
end

function QRPF_EquipItem()

end


function QRPF_AddonLoaded()
	
end

CLIgnoreQuests = {
	[""] = {Objective=""},
}

CLQuestRewardChoices = {
	["Timberling Sprouts|Gardening Gloves"] = {
		["Item"] = "Graystone Bracers",
	},
	["Iverron's Antidote|Sedgeweed Britches"] = {
		["Item"] = "Barkmail Vest",
	},
	["Washed Ashore|Sandcomber Boots"] = {
		["Item"] = "Dryweed Belt",
		["Use"] = 1,
	},
	["Twisted Hatred|Feral Bracers"] = {
		["Item"] = "Feral Bracers",
		["Use"] = 1,
	},
	["The Enchanted Glade|Shackled Girdle"] = {
		["Item"] = "Rain-spotted Cape",
		["Use"] = 1,
	},
	["The Balance of Nature|Draped Cloak"] = {
		["Item"] = "Blackened Leather Belt",
		["Use"] = 1,
	},
	["Sathrah's Sacrifice|Lace Pants"] = {
		["Item"] = "Cushioned Boots",
		["Use"] = 1,
	},
	["Dolanaar Delivery|Darnassian Bleu"] = {
		["Item"] = "Darnassian Bleu",
	},
	["Deep Ocean, Vast Sea|Welldrip Gloves"] = {
		["Item"] = "Noosegrip Gauntlets",
	},
	["Webwood Egg|Woodland Shield"] = {
		["Item"] = "Woodland Tunic",
		["Use"] = 1,
	},
	["Bashal'Aran|Explorer's Vest"] = {
		["Item"] = "Vagabond Leggings",
		["Use"] = 1,
	},
	["Crown of the Earth|Ashwood Bow"] = {
		["Item"] = "Thicket Hammer",
	},
	["The Balance of Nature|Archery Training Gloves"] = {
		["Item"] = "Archery Training Gloves",
		["Use"] = 1,
	},
	["Webwood Venom|Thistlewood Maul"] = {
		["Item"] = "Thistlewood Dagger",
		["Use"] = 1,
	},
	["Oakenscowl|Dirtwood Belt"] = {
		["Item"] = "Moss-covered Gauntlets",
	},
	["The Woodland Protector|Canopy Leggings"] = {
		["Item"] = "Canopy Leggings",
		["Use"] = 1,
	},
}