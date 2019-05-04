local GuideFrame_Options = {
    ["Rows"] = 8,
    ["FontSize"] = 16,
    --This whole mess needs fixing, leave it at 0 atm
    ["PreviousSteps"] = 0,
    ["CurrentSection"] = 1,
    ["CurrentStep"] = 1,
    ["Locked"] = false

}

-- Put this anywhere you want to throw an error if the game CLGuide_GameVersion is not 1.12.x or 8.x
CLGuide_GameVersion = GetBuildInfo();
CLGuide_GameVersion = string.sub(CLGuide_GameVersion,1,4)
CLGuide_CurrentStep = {}
CLGuide_CurrentSection = {}

-- TODO: Loop through this list when visiting a vendor, and sell anything in it. 
-- Idea is the list is populated with questrewards you have specified you wish to vendor in a guidestep
CLGuide_VendorList = {} 

function GuidePrint( msg )
    if not DEFAULT_CHAT_FRAME then 
		return 
	end
    DEFAULT_CHAT_FRAME:AddMessage ( msg )
    ChatFrame3:AddMessage ( msg )
    ChatFrame4:AddMessage ( msg )
end

function CLGuide_AssertOnClassic(msg)
	if CLGuide_GameVersion ~= "1.12" and string.sub(CLGuide_GameVersion,1,1) ~= "8" then
		GuidePrint(msg)
		GuidePrint(1/"")
	end
end

function CLGuide_GetNumFreeBagspace()
	local numFreeBagspace = 0
	for bag=0,4 do
		local bagname = GetBagName(bag)
		if bagname ~= nil then
			local bagnamelower = string.lower(bagname)
			-- ignoring soulbags and quivers
			if string.find(bagnamelower, "quiver") == nil and string.find(bagnamelower, "soul") == nil then
				for slot=1,GetContainerNumSlots(bag)  do
					if GetContainerItemInfo(bag, slot) == nil then
						numFreeBagspace = numFreeBagspace + 1
					end
				end
			end
		end
	end
	return numFreeBagspace
end

-- Return index of a particular gossip type (binder, taxi, etc) on an NPC. If none is found, return nil
function CLGuide_GetGossipIndex(type) 
	local gossipOptions = {GetGossipOptions()} -- TODO: Make sure GetGossipOptions() returns same num of args on retail (2 in 1.12)
	for i=1,table.getn(gossipOptions) do
		GuidePrint(gossipOptions[(i*2)]..", "..gossipOptions[(i*2)-1]) -- TODO: "attempt to concatinate field ? (a nill value) 
		if gossipOptions[(i*2)] == type then
			return i
		end
	end
	return nil
end

function CLGuide_GetNumStrings(data)
	if data == nil then return 0 end
	local ret = 0
	for i=1,getn(data) do
		if type(data[i]) == "string" then 
			ret = ret + 1 
		end
	end
	return ret
end

function CLGuide_GetItemInventoryCount(itemName) -- itemName, not link
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

Guide_CompletedGuideSteps = {}

function Guide_OnLoad()
	Guide.DelayedCheckHasQuest = 0
	Guide.DelayedCheckHasQuestStop = 0

	Guide_SetupGuide()
	Guide_RegisterEvents()
	Guide:SetScript("OnUpdate", Guide_OnUpdate)
end



function Guide_SetupGuide()
	nextButton:SetPoint("BOTTOMLEFT", Guide, "BOTTOMLEFT", 32, -22)
	prevButton:SetPoint("BOTTOMLEFT", Guide, "BOTTOMLEFT", 0, -22)
	
	coordBox:SetPoint("BOTTOMLEFT", Guide, "BOTTOMLEFT", 68, -32)

	Guide:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background", 
		edgeFile = "Interface\\AddOns\\ClassicLeveler_Guide\\Textures\\Borders\\fer1", 
		tile = false, tileSize = 1, edgeSize = 2, 
		insets = { left = 0, right = 0, top = 0, bottom = 1 }});
	Guide:SetBackdropColor(0,0,0);
	Guide:SetScale(1.2)
	Guide.CURRENT_STEP_IDX = 3
	Guide.StepFrames = {}
	Guide.StepHeight = Guide:GetHeight()/GuideFrame_Options["Rows"]
	Guide.UNCOMPLETE_BACKDROP = {r=0.9, g=0.9, b=0.9, a=1}
	Guide.COMPLETED_BACKDROP = {r=0.0, g=1, b=0.0, a=1}
	Guide.CURRENT_BACKDROP = {r=0.3, g=0.3, b=0.3, a=1}
	local h = Guide:GetHeight()*Guide:GetEffectiveScale()
	local fifth = h/GuideFrame_Options["Rows"]
	for i=1,GuideFrame_Options["Rows"] do
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
end

function Guide_NextStep()
	CLGuide_SetStep(GuideFrame_Options["CurrentStep"] + 1)
end

function Guide_PrevStep()
	CLGuide_SetStep(GuideFrame_Options["CurrentStep"] - 1)
end

function CLGuide_CompleteStep(step)
    Guide_CompletedGuideSteps[step] = 1
    if GuideFrame_Options["CurrentStep"] == step then
        Guide_NextStep()
    end
end

function CLGuide_CompleteCurrentStep()
    CLGuide_CompleteStep(GuideFrame_Options["CurrentStep"])
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
	for i=1,GuideFrame_Options["Rows"] do
		local stepOffset = GuideFrame_Options["CurrentStep"]-Guide.CURRENT_STEP_IDX+i
		local s = CLGuide_CurrentSection.Steps[stepOffset]
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

function CLGuide_SetSection(sectionNum)
	GuideFrame_Options["CurrentSection"] = sectionNum
	CLGuide_CurrentSection = CLGuide_GuideTable[sectionNum]
	CLGuide_SetStep(1)
end

function CLGuide_SetStep(step)
	
	Guide.DelayedCheckHasQuest = 0 -- if step is changed, manual or otherwise, we stop any delayed hasQuest checking

	if getn(CLGuide_CurrentSection.Steps) < step then
		GuidePrint("finished current section. Going to next")
		CLGuide_SetSection(GuideFrame_Options["CurrentSection"] + 1)
		return -- Guide_SetSection() will call CLGuide_SetStep(1)
	end

	GuideFrame_Options["CurrentStep"] = step

	CLGuide_CurrentStep = CLGuide_CurrentSection.Steps[step]
	if CLGuide_CurrentStep.point ~= nil then
		SetCrazyArrow(CLGuide_CurrentStep.point, CLGuide_CurrentStep.Text)
	else
		SetCrazyArrow(CLGuide_CurrentStep.point, CLGuide_CurrentStep.Text)
	end

	for i=1,GuideFrame_Options["Rows"] do
		local stepOffset = step-Guide.CURRENT_STEP_IDX+i
		local s = CLGuide_CurrentSection.Steps[stepOffset]
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



local EventFrame = CreateFrame("Frame", "EventFrame")
EventFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
EventFrame:RegisterEvent("CHAT_MSG_SYSTEM")
EventFrame:RegisterEvent("QUEST_COMPLETE")
EventFrame:RegisterEvent("QUEST_LOG_UPDATE")
--EventFrame:RegisterEvent("UNIT_QUEST_LOG_CHANGED") -- can we live with only QUEST_LOG_UPDATE?
EventFrame:RegisterEvent("CHAT_MSG_LOOT")
EventFrame:RegisterEvent("QUEST_ACCEPTED")
EventFrame:RegisterEvent("QUEST_DETAIL")
EventFrame:RegisterEvent("GOSSIP_SHOW")
EventFrame:RegisterEvent("QUEST_GREETING")
EventFrame:RegisterEvent("TAXIMAP_OPENED")
EventFrame:RegisterEvent("MERCHANT_SHOW")
EventFrame:RegisterEvent("ZONE_CHANGED_NEW_AREA")
EventFrame:RegisterEvent("QUEST_PROGRESS")

EventFrame:SetScript("OnUpdate", function() 
    if CLGuide_CurrentStep.Proximity ~= nil then
        if CLGuide_GetDistToActivePoint() < CLGuide_CurrentStep.Proximity then
            CLGuide_CompleteCurrentStep()
        end
    end
end)

function CLGuide_AllEvents()
	EventFrame:RegisterAllEvents()
end

function CLGuide_SellItems()
    local find = "ff9d9d9d"
    local link = nil
    local bagslots = nil
    for bag=0,4 do
        local bagname = GetBagName(bag)
        if bagname ~= nil then
            bagslots = GetContainerNumSlots(bag)
            if bagslots and bagslots > 0 then
                for slot=1,bagslots do
                    link = GetContainerItemLink(bag, slot)
                    if link ~= nil and string.find(link, find) then
                        local _, _, locked = GetContainerItemInfo(bag, slot)
                        if bag and slot and not locked then	
                            DEFAULT_CHAT_FRAME:AddMessage("Selling "..GetContainerItemLink(bag, slot))
                            UseContainerItem(bag,slot)
                        end
                    else
                        -- go through CLGuide_VendorList
                    end
                end
            end
        end
    end
end

EventFrame:SetScript("OnEvent", function()
	if arg2 ~= nil then 
		GuidePrint("EventFrame: "..event..", "..arg1..", "..arg2) 
	elseif arg1 ~= nil then 
		GuidePrint("EventFrame: "..event..", "..arg1) 
	else
		GuidePrint("EventFrame: "..event)
	end

	if event == "MERCHANT_SHOW" then
		CLGuide_SellItems()
	end

	CLGuide_AcceptQuest()
	CLGuide_BuyItem()
	CLGuide_CompleteQuest()
	CLGuide_DeliverQuest()
	CLGuide_HaveItem()
	CLGuide_HaveQuest()
	CLGuide_LevelReached()
	CLGuide_PointReached()
	CLGuide_SetHs()
	CLGuide_TakeTaxi()
	CLGuide_ZoneEntered()
end)

function Guide_RegisterEvents()
	Guide:RegisterEvent("PLAYER_ENTERING_WORLD")
	Guide:SetScript("OnEvent", function() Guide_OnEvent()end)
	Guide:RegisterForDrag("LeftButton");
end

local PreviousQuestDetail = nil

-- this is a hacky, yet effective, fallback for checking quest related triggers
-- in a delayed way. Some events seems to be received by the event before the API
-- returns up-to-date information, in which case a delayed check in OnUpdate
-- may be able to catch a missed change that could complete a current step.
function CLGuide_UnitQuestLogChanged()
	---GuidePrint("checking queueing delayed quest check")
	if CLGuide_CurrentStep.At ~= nil 
	or CLGuide_CurrentStep.Ct ~= nil 
	or CLGuide_CurrentStep.Dt ~= nil 
	or CLGuide_CurrentStep.Ht ~= nil then
		--GuidePrint("queueing delayed quest check")
		Guide.DelayedCheckHasQuest = 1
		-- stop checking after 2 sec. This may be a bit long, but the idea here is
		-- if there is huge serverlag on launch day, you may even want it higher
		Guide.DelayedCheckHasQuestStop = GetTime() + 2.0 
	end
end

function Guide_OnEvent()
	if event == "UNIT_QUEST_LOG_CHANGED" then
		CLGuide_UnitQuestLogChanged()
	end
	
	-- "hacking" the UI in place. Without this, scaling wont look right until you have rescaled the frame...
	if event == "PLAYER_ENTERING_WORLD" then
		CLGuide_CurrentSection = CLGuide_GuideTable[GuideFrame_Options["CurrentSection"]] 
		CLGuide_CurrentStep = CLGuide_CurrentSection.Steps[GuideFrame_Options["CurrentStep"]]
		CLGuide_SetStep(GuideFrame_Options["CurrentStep"])
		Guide.IsDragging = 1
		Guide_OnUpdate()
		Guide.IsDragging = 0
	end
end

-- See Guide_UnitQuestLogChanged documentation
function CLGuide_DelayedCheckHasQuest()
	if Guide.DelayedCheckHasQuest == 1 then
		if CLGuide_CurrentStep.Ct ~= nil and CL_IsQuestComplete(CLGuide_CurrentStep.Ct) == 1 then
			CLGuide_CompleteCurrentStep()
		elseif CLGuide_CurrentStep.Dt ~= nil and CL_HasQuest(CLGuide_CurrentStep.At) == 0 then
			CLGuide_CompleteCurrentStep()
		elseif CLGuide_CurrentStep.Ht ~= nil and CL_HasQuest(CLGuide_CurrentStep.At) == 1 then
			CLGuide_CompleteCurrentStep()
		end
		-- If we have passed DelayedCheckHasQuestStop, stop looking
		if Guide.DelayedCheckHasQuestStop < GetTime() then
			Guide.DelayedCheckHasQuest = 0
		end
	end
end

function Guide_OnUpdate()
	UpdateCoordBox()
	Guide_UpdateDragging()
	CLGuide_DelayedCheckHasQuest()
end

function Guide_UpdateDragging()
	if Guide.IsDragging == 1 then
		local h = Guide:GetHeight()*Guide:GetEffectiveScale()
		local fifth = h/GuideFrame_Options["Rows"]
		for i=1,GuideFrame_Options["Rows"] do
			local topOffset = (i-1)*fifth
			local bottomOffset = i*fifth
			Guide.StepFrames[i].Bg:SetPoint("TOP", Guide, "TOP", 0, -topOffset)
			Guide.StepFrames[i].Bg:SetPoint("BOTTOM", Guide, "TOP", 0, -bottomOffset)
		end
	end
end

function Guide_PrintStepInfo()
	local step = CLGuide_CurrentStep--GuideSteps[GuideFrame_Options["CurrentStep"]]
	if step == nil then
		GuidePrint("nil")
		return
	end
	GuidePrint("Step: "..GuideFrame_Options["CurrentStep"])
	GuidePrint("Text: "..step.Text)
	if step.At ~= nil then
		GuidePrint("AcceptQuestTrigger: "..step.At)
	end
	if step.Ct ~= nil then
		GuidePrint("CompletedTrigger: "..step.Ct)
	end
	if step.Dt ~= nil then
		--GuidePrint("DeliveredTrigger: "..step.Dt.q)
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



