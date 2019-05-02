-- Author      : G3m7
-- Create Date : 4/28/2019 10:52:05 AM

function GuidePrint( msg )
    if not DEFAULT_CHAT_FRAME then 
		return 
	end
    DEFAULT_CHAT_FRAME:AddMessage ( msg )
    ChatFrame3:AddMessage ( msg )
    ChatFrame4:AddMessage ( msg )
end

Guide_CompletedGuideSteps = {}

function Guide_OnLoad()
	Guide.CurrentStepIndex = 1
	
	Guide.DelayedCheckHasQuest = 0
	Guide.DelayedCheckHasQuestStop = 0

	Guide:SetScript("OnEvent", function() Guide_OnEvent()end)
	Guide_SetupGuide()
	Guide_RegisterEvents()
	Guide:SetScript("OnUpdate", Guide_OnUpdate)
	
	Guide_SetStep(Guide.CurrentStepIndex)
end



function Guide_SetupGuide()
	nextButton:SetPoint("BOTTOMLEFT", Guide, "BOTTOMLEFT", 32, -22)
	prevButton:SetPoint("BOTTOMLEFT", Guide, "BOTTOMLEFT", 0, -22)
	
	coordBox:SetPoint("BOTTOMLEFT", Guide, "BOTTOMLEFT", 68, -32)

	Guide:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background", 
		edgeFile = "Interface\AddOns\ClassicLeveler_Guide\Textures\Borders\fer1", 
		tile = false, tileSize = 1, edgeSize = 2, 
		insets = { left = 0, right = 0, top = 0, bottom = 1 }});
	Guide:SetBackdropColor(0,0,0);
	Guide:SetScale(1.2)
	Guide.CURRENT_STEP_IDX = 3
	Guide.MAX_STEPS = 10
	Guide.StepFrames = {}
	Guide.StepHeight = Guide:GetHeight()/Guide.MAX_STEPS
	Guide.UNCOMPLETE_BACKDROP = {r=0.9, g=0.9, b=0.9, a=1}
	Guide.COMPLETED_BACKDROP = {r=0.0, g=1, b=0.0, a=1}
	Guide.CURRENT_BACKDROP = {r=0.3, g=0.3, b=0.3, a=1}
	local h = Guide:GetHeight()*Guide:GetEffectiveScale()
	local fifth = h/Guide.MAX_STEPS
	for i=1,Guide.MAX_STEPS do
		Guide.StepFrames[i] = {
			Bg = CreateFrame("Frame"),
			Text = Guide:CreateFontString(nil,"ARTWORK")
		}
		Guide.StepFrames[i].Bg:SetPoint("LEFT", Guide, "LEFT", 3, 0)
		Guide.StepFrames[i].Bg:SetPoint("RIGHT", Guide, "RIGHT", -3, 0)
		
		local topOffset = (i-1)*fifth
		local bottomOffset = i*fifth
		GuidePrint(topOffset..", "..bottomOffset)
		Guide.StepFrames[i].Bg:SetPoint("TOP", Guide, "TOP", 0, -topOffset)
		Guide.StepFrames[i].Bg:SetPoint("BOTTOM", Guide, "TOP", 0, -bottomOffset)

		Guide.StepFrames[i].Bg:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background", 
			edgeFile = "Interface\AddOns\ClassicLeveler_Guide\Textures\Borders\fer1", 
			tile = false, tileSize = 1, edgeSize = 2, 
			insets = { left = 0, right = 0, top = 1, bottom = 1 }});
		

		Guide.StepFrames[i].Text:SetFont("Fonts\\ARIALN.ttf", 13, "OUTLINE")
		Guide.StepFrames[i].Text:SetPoint("TOPLEFT", Guide.StepFrames[i].Bg, "TOPLEFT", 10, -5)
		Guide.StepFrames[i].Text:SetPoint("BOTTOMRIGHT", Guide.StepFrames[i].Bg, "BOTTOMRIGHT", -10, -5)
		Guide.StepFrames[i].Text:SetJustifyV("TOP");
		Guide.StepFrames[i].Text:SetJustifyH("LEFT");
	end
	Guide.StepFrames[Guide.CURRENT_STEP_IDX].Bg:SetBackdropColor(0.3, 0.3, 0.3, 1);
	Guide_UpdateColors()
end

function Guide_NextStep()
	Guide_SetStep(Guide.CurrentStepIndex + 1)
end

function Guide_PrevStep()
	Guide_SetStep(Guide.CurrentStepIndex - 1)
end

function Guide_CompleteStep(step)
    Guide_CompletedGuideSteps[step] = 1
    if Guide.CurrentStepIndex == step then
        Guide_NextStep()
    end
end

function Guide_HasCompletedStep(step)
    local cs = Guide_CompletedGuideSteps[step]
    if cs ~= nil and cs == 1 then 
        return 1
    else
        return 0
    end
end

function Guide_UpdateColors()
	for i=1,Guide.MAX_STEPS do
		local stepOffset = Guide.CurrentStepIndex-Guide.CURRENT_STEP_IDX+i
		local s = CL_GuideSteps[stepOffset]
		local isComplete = Guide_HasCompletedStep(stepOffset)
		if i == Guide.CURRENT_STEP_IDX then
			Guide.StepFrames[i].Bg:SetBackdropColor(Guide.CURRENT_BACKDROP.r, Guide.CURRENT_BACKDROP.g, Guide.CURRENT_BACKDROP.b, Guide.CURRENT_BACKDROP.a);
		elseif s ~= nil and Guide_HasCompletedStep(stepOffset) == 1 then
			Guide.StepFrames[i].Bg:SetBackdropColor(Guide.COMPLETED_BACKDROP.r, Guide.COMPLETED_BACKDROP.g, Guide.COMPLETED_BACKDROP.b, Guide.COMPLETED_BACKDROP.a);
		else
			Guide.StepFrames[i].Bg:SetBackdropColor(Guide.UNCOMPLETE_BACKDROP.r, Guide.UNCOMPLETE_BACKDROP.g, Guide.UNCOMPLETE_BACKDROP.b, Guide.UNCOMPLETE_BACKDROP.a);
		end
	end
end

function Guide_SetStep(step)
	
	Guide.DelayedCheckHasQuest = 0 -- if step is changed, manual or otherwise, we stop any delayed hasQuest checking

	Guide.CurrentStepIndex = step
	Guide.CurrentStep = CL_GuideSteps[Guide.CurrentStepIndex]
	if Guide.CurrentStep.point ~= nil then
		SetCrazyArrow(Guide.CurrentStep.point, Guide.CurrentStep.Text)
	else
		SetCrazyArrow(Guide.CurrentStep.point, Guide.CurrentStep.Text)
	end

	for i=1,Guide.MAX_STEPS do
		local stepOffset = Guide.CurrentStepIndex-Guide.CURRENT_STEP_IDX+i
		local s = CL_GuideSteps[stepOffset]
		if s ~= nil then
			Guide.StepFrames[i].Text:SetText(s.Text)
			if Guide_HasCompletedStep(stepOffset) == 1 then
				Guide.StepFrames[i].Bg:SetBackdropColor(0.0,0.8,0.0,1);
			end
		else
			Guide.StepFrames[i].Text:SetText("")
		end
	end
	Guide_UpdateColors()
	Guide_PrintStepInfo()
end

function Guide_RegisterEvents()
	Guide:RegisterEvent("PLAYER_ENTERING_WORLD")
	Guide:RegisterEvent("CHAT_MSG_SYSTEM")
	Guide:RegisterEvent("QUEST_COMPLETE")
	Guide:RegisterEvent("UNIT_QUEST_LOG_CHANGED") 
	Guide:RegisterEvent("CHAT_MSG_LOOT")
	Guide:RegisterEvent("QUEST_ACCEPTED")
	Guide:RegisterEvent("QUEST_DETAIL")
	Guide:RegisterEvent("GOSSIP_SHOW")
	Guide:RegisterEvent("QUEST_GREETING")
	--Guide:RegisterAllEvents()
	Guide:RegisterEvent("TAXIMAP_OPENED")
	Guide:RegisterEvent("MERCHANT_SHOW")
	
	Guide:RegisterEvent("ZONE_CHANGED_NEW_AREA")
	
	Guide:RegisterForDrag("LeftButton");
end

local PreviousQuestDetail = nil

function Guide_OnEvent()
	if arg2 ~= nil then 
		GuidePrint(event..", "..arg1..", "..arg2) 
	elseif arg1 ~= nil then 
		GuidePrint(event..", "..arg1) 
	else
		GuidePrint(event)
	end
	
	if event == "UNIT_QUEST_LOG_CHANGED" then
		Guide_UnitQuestLogChanged()
	elseif event == "QUEST_DETAIL" then
		-- When you are on the UI frame showing "continue" button
		PreviousQuestDetail = GetTitleText()
	elseif event == "QUEST_COMPLETE" then
		-- When you are at the UI frame showing "Complete Quest" button
		Guide_OnQuestComplete()
	elseif event == "QUEST_ACCEPTED" then
		-- dosent exist in vanilla i think
		local questTitle = GetQuestLogTitle(arg1)
		GuidePrint(questTitle)
	elseif event == "CHAT_MSG_SYSTEM" then	
		-- TODO: This event is not reliable on 1.12, if you accept multiple quests in quick succession, they may not show
		local arg1Lower = string.lower(arg1)
		if string.find(arg1Lower, "quest accepted:") ~= nil then
			Guide_OnQuestAccepted(arg1Lower)
		end
	elseif event == "CHAT_MSG_LOOT" then
		local arg1Lower = string.lower(arg1)
		if string.find(arg1Lower, "you receive loot: ") ~= nil then -- looting a mob
			GuideOnItemLooted(string.sub(arg1, 19, string.len(arg1)-1))
		elseif string.find(arg1Lower, "you receive item: ") ~= nil then -- buying from vendor
			GuideOnItemLooted(string.sub(arg1, 19, string.len(arg1)-1))
		end
	elseif event == "ZONE_CHANGED_NEW_AREA" then
		if Guide.CurrentStep.Zone ~= nil and Guide.CurrentStep.Zone == GetRealZoneText() then
			Guide_CompleteStep(Guide.CurrentStepIndex)
		end
	elseif event == "GOSSIP_SHOW" then
		if Guide.CurrentStep.Taxi ~= nil then
			SelectGossipOption(GetGossipIndex("taxi"))
		elseif Guide.CurrentStep.SetHs ~= nil and UnitName("target") == Guide.CurrentStep.SetHs then
			ConfirmBinder() -- TODO: in 1.12, we can call this without selecting gossip option. Test on retail
		elseif Guide.CurrentStep.BuyItem ~= nil and UnitName("target") == Guide.CurrentStep.BuyItem.Npc then
			SelectGossipOption(GetGossipIndex("vendor"))
		elseif Guide.CurrentStep.At ~= nil then
			Guide_At_OnQuestGreetingOrGossipShow(SelectGossipAvailableQuest, Guide_GetGossipNumAvailQuests, Guide_GetGossipAvailableQuestName)
		elseif Guide.CurrentStep.Dt ~= nil then
			Guide_Dt_OnQuestGreetingOrGossipShow(SelectGossipActiveQuest, Guide_GetGossipNumActiveQuests, Guide_GetGossipActiveQuestName)
		end
	elseif event == "QUEST_GREETING" then
		if Guide.CurrentStep.Dt ~= nil then
			Guide_Dt_OnQuestGreetingOrGossipShow(SelectActiveQuest, GetNumActiveQuests, GetActiveTitle)
		elseif Guide.CurrentStep.At ~= nil then
			Guide_At_OnQuestGreetingOrGossipShow(SelectAvailableQuest, GetNumAvailableQuests, GetAvailableTitle)
		end
	elseif event == "MERCHANT_SHOW" then
		-- When a vendor window opens
		Guide_OnMerchantShow()
	elseif event == "TAXIMAP_OPENED" then
		-- when the flightmaster map opens
		Guide_OnTaximapOpened()
	end

	-- "hacking" the UI in place. Without this, scaling wont look right until you have rescaled the frame...
	if event == "PLAYER_ENTERING_WORLD" then
		Guide.IsDragging = 1
		Guide_OnUpdate()
		Guide.IsDragging = 0
	end
end

-- handle an At trigger on quest greeting or gossip show
local function Guide_At_OnQuestGreetingOrGossipShow(selectFunction, numAvailableFunction, getQuestNameFunction)
	-- assuming CurrentStep.At exist here, function shouldnt be called otherwise
	for i=1, numAvailableFunction() do
		if getQuestNameFunction(i) == Guide.CurrentStep.At then
			selectFunction(i)
			return
		end
	end
	GuidePrint("Guide_At_OnQuestGreetingOrGossipShow <"..Guide.CurrentStep.At.."> not found")
end

-- handle a Dt trigger on quest greeting or gossip show
local function Guide_Dt_OnQuestGreetingOrGossipShow(selectFunction, numActiveFunction, getQuestNameFunction)
	-- assuming CurrentStep.Dt exist here, function shouldnt be called otherwise
	for i=1, numActiveFunction() do
		if getQuestNameFunction(i) == Guide.CurrentStep.Dt.q then
			selectFunction(i)
			return
		end
	end
	GuidePrint("Guide_Dt_OnQuestGreetingOrGossipShow <"..Guide.CurrentStep.Dt.q.."> not found")
end

local function Guide_QuestGreetingGetQuestIndex(questname)

end

function Guide_GetGossipNumActiveQuests()
	local activeQuestsInfo = { GetGossipActiveQuests() };
	if activeQuestsInfo == nil or activeQuestsInfo == 0 then return 0 end
	if version == "1.12.1" then
		return table.getn(activeQuestsInfo)/2
	elseif version == "8.1.5" then
		return table.getn(activeQuestsInfo)/6
	end
	GuidePrint(1/"") -- "assert", need to test other versions
end
function Guide_GetGossipActiveQuestName(index)
	local availQuestsInfo = { GetGossipAvailableQuests() };
	if availQuestsInfo == nil or availQuestsInfo == 0 then return nil end
	local iterSkip = 0
	if version == "1.12.1" then
		return availableQuestInfo[(index*2)/2]
	elseif version == "8.1.5" then
		return availableQuestInfo[(index*6)/6]
	end
	GuidePrint(1/"") -- "assert", need to test other versions
end

function Guide_GetGossipNumAvailQuests()
	local availQuestsInfo = { GetGossipAvailableQuests() };
	if availQuestsInfo == nil or availQuestsInfo == 0 then return 0 end
	if version == "1.12.1" then
		return table.getn(availQuestsInfo)/2
	elseif version == "8.1.5" then
		return table.getn(availQuestsInfo)/7
	end
	GuidePrint(1/"") -- "assert", need to test other versions
end

function Guide_GetGossipAvailableQuestName(index)
	local availQuestsInfo = { GetGossipAvailableQuests() };
	if availQuestsInfo == nil or availQuestsInfo == 0 then return nil end
	local iterSkip = 0
	if version == "1.12.1" then
		return availableQuestInfo[(index*2)/2]
	elseif version == "8.1.5" then
		return availableQuestInfo[(index*7)/7]
	end
	GuidePrint(1/"") -- "assert", need to test other versions
end




local function Guide_GetGossipOrGreetingQuestIndex()

end

local function Guide_OnMerchantShow()
	--GuidePrint(Guide.CurrentStep.BuyItem.Item..", "..Guide.CurrentStep.BuyItem.Npc..", "..UnitName("target"))
	if Guide.CurrentStep.BuyItem ~= nil and UnitName("target") == Guide.CurrentStep.BuyItem.Npc then
		local invCount = Guide_GetItemInventoryCount(Guide.CurrentStep.BuyItem.Item)
		if invCount < Guide.CurrentStep.BuyItem.Count then
			local itemCountToBuy = Guide.CurrentStep.BuyItem.Count - invCount
			for i=1, GetMerchantNumItems() do
				local itmName,_,_,quantity = GetMerchantItemInfo(i)
				if itmName == Guide.CurrentStep.BuyItem.Item then
					-- stackable items like arrows cant be bought one by one (as in, you cant get less than 200)
					-- but we let the itemCountToBuy/quantity round down to never buy MORE items than specified
					itemCountToBuy = itemCountToBuy/quantity
					BuyMerchantItem(i, itemCountToBuy)
					Guide_CompleteStep(Guide.CurrentStepIndex)
					break
				end
			end
		end
	end
end

local function Guide_OnTaximapOpened()
	if Guide.CurrentStep.Taxi ~= nil then
		for i=1, NumTaxiNodes() do
			if TaxiNodeName(i) == Guide.CurrentStep.Taxi then
				TakeTaxiNode(i)
				Guide_CompleteStep(Guide.CurrentStepIndex)
			end
		end
	end
end



-- This function is called when you get to the Complete Quest button page, not when the quest ACTUALLY is delivered
-- though, if we call GetQuestReward() in here, we can assume the quest completes (unless inventory is full), which can 
-- be used to complete the current step
local function Guide_OnQuestComplete()
	if IsShiftKeyDown() then return end -- disabling quest completion logic when holding shift down


	--GetNumQuestChoices() Gets the number of rewards for a quest that you are currently turning in successfully.
	-- numEntries, numQuests = GetNumQuestLogEntries() num quests in log. 
	-- GetNumQuestLogChoices() the same as above?
	--GetQuestLogTitle(index) -- name of a quest in the questlog
	-- GetTitleText() -- trieves the title of the quest while talking to the NPC about it.
	-- IsQuestCompletable() -- returns 1 if current npc questdialogue thing can be completed
	local numChoices = GetNumQuestChoices();
	local title = GetTitleText()
	GuidePrint("Autocompleting: "..title..", Choices: "..numChoices);
	
	if Guide.CurrentStep.Dt ~= nil then
		if Guide.CurrentStep.Dt.q == title then
			if numChoices == 0 then
				Guide_ChooseQuestReward(nil)
			elseif numChoices == 1 then
				Guide_ChooseQuestReward(1)
				return
			elseif Guide.CurrentStep.Dt.item ~= nil then
				local rewardIdx = Guide_GetQuestRewardIndex(Guide.CurrentStep.Dt.item)
				if rewardIdx == nil then
					GuidePrint("Could not find reward specified ("..Guide.CurrentStep.Dt.item.."). Not autocompleting")
				else 
					Guide_ChooseQuestReward(rewardIdx)
				end
			end
		else
			-- scan nearby steps to see if this is a later or earlier step?
			GuidePrint("Unknown quest. No autoaccepting reward")
		end
	end
end

function Guide_ChooseQuestReward(rewardIdx)
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

-- TODO: We want to equip itemName when calling this function.
-- Typically we call it after completing a quest where we have specified we wish
-- to use the item after getting it. Not sure if it works to equip during handling of the event
-- so maybe we need a popupframe u can click afterwards?
function EquipItem(itemName)

end

-- returns the index of a quest reward in the currently open quest complete dialogue
-- if none is open, or the itemName is not found, returns nil
function Guide_GetQuestRewardIndex(itemName)
	local numChoices = GetNumQuestChoices();
	for i=1, numChoices do
		local itemName = GetQuestItemInfo("choice", i);
		if quest.Item == itemName then
			return i
		end
	end
	return nil
end

-- Return index of a particular gossip type (binder, taxi, etc) on an NPC. If none is found, return nil
function GetGossipIndex(type) 
	local gossipOptions = {GetGossipOptions()} -- TODO: Make sure GetGossipOptions() returns same num of args on retail (2 in 1.12)
	for i=1,table.getn(gossipOptions) do
		GuidePrint(gossipOptions[(i*2)]..", "..gossipOptions[(i*2)-1]) -- TODO: "attempt to concatinate field ? (a nill value) 
		if gossipOptions[(i*2)] == type then
			return i
		end
	end
	return nil
end

function GuideOnItemLooted(itemlink) -- itemLINK, not just the name
	if Guide.CurrentStep.Item ~= nil then
		if string.find(itemlink, Guide.CurrentStep.Item.Name) ~= nil then
			GuidePrint("the looted item was stepitem, have "..Guide_GetItemInventoryCount(Guide.CurrentStep.Item.Name).."/"..Guide.CurrentStep.Item.Count)
			if Guide_GetItemInventoryCount(Guide.CurrentStep.Item.Name) >= Guide.CurrentStep.Item.Count then
				Guide_CompleteStep(Guide.CurrentStepIndex)
			end
		end
	end
end

function Guide_GetItemInventoryCount(itemName) -- itemName, not link
	local count = 0
	for bag = 0,4 do
		for slot = 1,GetContainerNumSlots(bag) do
			local item = GetContainerItemLink(bag,slot)
			if item ~= nil and string.find(item,itemName) then
				local _,slotCount = GetContainerItemInfo(bag, slot);
				count = slotCount + count
			end
		end
	end
	return count
end

function Guide_OnQuestAccepted(questname) -- questname is tolower'ed in event handler
	if Guide.CurrentStep.At ~= nil and string.lower(Guide.CurrentStep.At) == questname then
		Guide_CompleteStep(Guide.CurrentStepIndex)
	end
end

function Guide_UnitQuestLogChanged()
	-- Questlog updates quite delayed, and checking CL_HasQuest in this 
	-- function is too early, so if currentStep has At or Ct, queue 
	-- up a delayed check for OnUpdate.
	GuidePrint("checking queueing delayed quest check")
	if Guide.CurrentStep.At ~= nil 
	or Guide.CurrentStep.Ct ~= nil 
	or Guide.CurrentStep.Dt ~= nil 
	or Guide.CurrentStep.Ht ~= nil then
		GuidePrint("queueing delayed quest check")
		Guide.DelayedCheckHasQuest = 1
		Guide.DelayedCheckHasQuestStop = GetTime() + 2.0 -- stop checking after 2 sec
	end
end

function Guide_OnUpdate()
	UpdateCoordBox()
	Guide_UpdateDragging()
	Guide_DelayedCheckHasQuest()
end

function Guide_DelayedCheckHasQuest()
	if Guide.DelayedCheckHasQuest == 1 then
		if Guide.CurrentStep.Ct ~= nil and CL_IsQuestComplete(Guide.CurrentStep.Ct) == 1 then
			Guide_CompleteStep(Guide.CurrentStepIndex)
		elseif Guide.CurrentStep.Dt ~= nil and CL_HasQuest(Guide.CurrentStep.At) == 0 then
			Guide_CompleteStep(Guide.CurrentStepIndex)
		elseif Guide.CurrentStep.Ht ~= nil and CL_HasQuest(Guide.CurrentStep.At) == 1 then
			Guide_CompleteStep(Guide.CurrentStepIndex)
		end
		-- If we have passed DelayedCheckHasQuestStop, stop looking
		if Guide.DelayedCheckHasQuestStop < GetTime() then
			Guide.DelayedCheckHasQuest = 0
		end
	end
end

function Guide_UpdateDragging()
	if Guide.IsDragging == 1 then
		local h = Guide:GetHeight()*Guide:GetEffectiveScale()
		local fifth = h/Guide.MAX_STEPS
		for i=1,Guide.MAX_STEPS do
			local topOffset = (i-1)*fifth
			local bottomOffset = i*fifth
			Guide.StepFrames[i].Bg:SetPoint("TOP", Guide, "TOP", 0, -topOffset)
			Guide.StepFrames[i].Bg:SetPoint("BOTTOM", Guide, "TOP", 0, -bottomOffset)
		end
	end
end

function Guide_PrintStepInfo()
	local step = Guide.CurrentStep--GuideSteps[Guide.CurrentStepIndex]
	if step == nil then
		GuidePrint("nil")
		return
	end
	GuidePrint("Step: "..Guide.CurrentStepIndex)
	GuidePrint("Text: "..step.Text)
	if step.At ~= nil then
		GuidePrint("AcceptQuestTrigger: "..step.At)
	end
	if step.Ct ~= nil then
		GuidePrint("CompletedTrigger: "..step.Ct)
	end
	if step.Dt ~= nil then
		GuidePrint("DeliveredTrigger: "..step.Dt)
	end
	

end

local oldX, oldY = 0,0
function UpdateCoordBox()
	local x, y = GetPlayerMapPosition("player")
	x = x*10000
	y = y*10000
	if x ~= oldX and y ~= oldY then
		oldX = x;
		oldY = y
		coordBox:SetText(", point={x="..string.format("%.0f", x)..",y="..string.format("%.0f", y).."}")
	end
end