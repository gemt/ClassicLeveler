-- Author      : G3m7
-- Create Date : 4/26/2019 7:18:13 PM

--GetNumQuestLeaderBoards([index]) number of objectives of a quest. If no index, the selected quest, or index in questlog.

function QRPFrame_OnLoad()
	QRPFrame:RegisterEvent("QUEST_COMPLETE")
	QRPFrame:RegisterEvent("QUEST_PROGRESS")
	QRPFrame:RegisterEvent("QUEST_GREETING")
    QRPFrame:RegisterEvent("GOSSIP_SHOW")
	QRPFrame:RegisterEvent("GOSSIP_CLOSED")
	QRPFrame:RegisterEvent("GOSSIP_CONFIRM_CANCEL")
    QRPFrame:RegisterEvent("QUEST_ACCEPTED")
	QRPFrame:RegisterEvent("QUEST_ACCEPT_CONFIRM")
	QRPFrame:RegisterEvent("QUEST_QUERY_COMPLETE")
	QRPFrame:RegisterEvent("QUEST_POI_UPDATE")
	QRPFrame:RegisterEvent("QUEST_DETAIL")
	QRPFrame:RegisterEvent("QUEST_LOG_UPDATE")
	QRPFrame:RegisterEvent("QUEST_ITEM_UPDATE")
	QRPFrame:RegisterEvent("QUEST_WATCH_UPDATE")
	QRPFrame:RegisterEvent("UNIT_QUEST_LOG_CHANGED")
end

function QRPFrame_OnEvent(event, arg1)
	_print("QuestPicker Event: "..event)
	if event == "QUEST_COMPLETE" then -- when the quest complete dialogue is shown at an npc
		QRPF_QuestComplete();
	elseif event == "GOSSIP_SHOW" then -- after opening dialogue with an npc. Also after clicking cancel, and being sent back to initial gossip screen
		QRPF_GossipShow();
	elseif event == "QUEST_DETAIL" then -- after selecting an unaccepted quest on an npc
		QRPF_QuestDetail();
	elseif event == "QUEST_PROGRESS" then -- after selecting an active quest on an npc
		QRPF_QuestProgress();
	elseif event == "GOSSIP_CLOSED" then
		QRPF_GossipClose()
	end

end

local QRPF_GossipIndex = 1
local QRPF_DeclineQuestGossipClose = 0
-- after closing dialogue with an npc
function QRPF_GossipClose()
	if QRPF_DeclineQuestGossipClose == 1 then
		QRPF_DeclineQuestGossipClose = 0
		return
	end

	QRPF_GossipIndex = 1
	_print("QRPF_GossipIndex: "..QRPF_GossipIndex)
end

-- after opening dialogue with an npc
function QRPF_GossipShow()
	if IsShiftKeyDown() then return end
	_print("SelectGossipActiveQuest("..QRPF_GossipIndex..")")
	SelectGossipActiveQuest(QRPF_GossipIndex)
	--SelectGossipActiveQuest(index) - Selects an active quest.
	--SelectGossipAvailableQuest(index) - Selects an available quest.
end

-- after selecting an unaccepted quest on an npc
function QRPF_QuestDetail()
	if IsShiftKeyDown() then return end
	
	if CLQuestAcceptQuest[GetTitleText()] == nil then 
		_print(GetTitleText().." Not in auto-accept list.")
		return;
	end

	_print("AutoAccepting "..GetTitleText())
	AcceptQuest();
end

-- after selecting an active quest on an npc
function QRPF_QuestProgress()
	if IsShiftKeyDown() then return end
	if IsQuestCompletable() == 1 then -- TODO: might return true/false on BFA
		CompleteQuest() -- emulates clicking continue
	else
		_print(GetTitleText().." Not yet completed")
		QRPF_GossipIndex = QRPF_GossipIndex + 1
		DeclineQuest() -- emulates clicking cancel button, taking us back to main gossip menu if there is one
		-- DeclineQuest triggers GOSSIP_CLOSED on DeclineQuest(), even if gossip isent actually close, 
		-- at least in 1.12 client.
		QRPF_DeclineQuestGossipClose = 1
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
	_print("Autocompleting: "..GetTitleText()..", Choices: "..numChoices);
	
	if numChoices == 0 then
		GetQuestReward()
		return
	end

	local reward = CLQuestRewardChoices[GetTitleText()];
	if reward ~= nil then
		_print("Choosing Item:"..reward.Index)
		_print(GetTitleText())
		_print(pickReward);
		GetQuestReward(reward.Index);
		if reward.Use == 1 then
			QRPF_EquipItem() -- how?
		end
	else
		_print("Multiple choices, none configured for autocompletion")
	end
end

function QRPF_EquipItem()

end

CLQuestRewardChoices = {
	["The Balance of Nature"] = {Index=1,Use=1},
	["WANTED: Murkdeep!"] = {Index=2,Use=1}
}
CLQuestAcceptQuest = {
	["Webwood Venom"] = {},
}