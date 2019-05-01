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

function Guide_RegisterEvents()
	Guide:RegisterEvent("PLAYER_ENTERING_WORLD")
	Guide:RegisterEvent("CHAT_MSG_SYSTEM")
	Guide:RegisterEvent("QUEST_COMPLETE")
	Guide:RegisterEvent("UNIT_QUEST_LOG_CHANGED") 
	Guide:RegisterEvent("CHAT_MSG_LOOT")
	Guide:RegisterEvent("QUEST_ACCEPTED")
	Guide:RegisterEvent("GOSSIP_SHOW")
	Guide:RegisterForDrag("LeftButton");
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

-- need something like, if you move guide forward due to a completion, start the iteration over again
function Guide_ScanCompleteTriggers()
	for i=1,Guide.MAX_STEPS do
		local stepOffset = Guide.CurrentStepIndex-Guide.CURRENT_STEP_IDX+i
		local step = CL_GuideSteps[stepOffset]
		-- if a step is complete
		if step.At ~= nil and CL_HasQuest(step.At) == 1 then
			Guide_CompleteStep(stepOffset)
		elseif step.Ct ~= nil and CL_IsQuestComplete(step.Ct) == 1 then
			Guide_CompleteStep(stepOffset)
		elseif step.Dt ~= nil and CL_HasQuest(step.At) == 0 then
			Guide_CompleteStep(stepOffset)
		end
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
	elseif event == "QUEST_COMPLETE" then
	elseif event == "QUEST_ACCEPTED" then
		-- dosent exist in vanilla i think
		local questTitle = GetQuestLogTitle(arg1)
		GuidePrint(questTitle)
	elseif event == "CHAT_MSG_SYSTEM" then
		local arg1Lower = string.lower(arg1)
		if string.find(arg1Lower, "quest accepted:") ~= nil then
			GuideOnQuestAccepted(questname)
		end
	elseif event == "CHAT_MSG_LOOT" then
		local arg1Lower = string.lower(arg1)
		if string.find(arg1Lower, "you receive loot: ") ~= nil then
			GuidePrint("i do receive loot")
			GuideOnItemLooted(string.sub(arg1, 19, string.len(arg1)-1))
		end
	end


	-- "hacking" the UI in place. Without this, scaling wont look right until you have rescaled the frame...
	if event == "PLAYER_ENTERING_WORLD" then
		Guide.IsDragging = 1
		Guide_OnUpdate()
		Guide.IsDragging = 0
	end
end

function GuideOnItemLooted(itemlink)
	GuidePrint(itemlink)
	if Guide.CurrentStep.Item ~= nil then
		if string.find(itemlink, Guide.CurrentStep.Item.ItemName) ~= nil then
			GuidePrint("the looted item was stepitem, have "..GetItemInventoryCount(itemlink).."/"..Guide.CurrentStep.Item.Count)
			if GetItemInventoryCount(itemlink) >= Guide.CurrentStep.Item.Count then
				GuidePrint("had enough of item")
				Guide_CompleteStep(Guide.CurrentStepIndex)
			end
		end
	end
end

function GetItemInventoryCount(itemlink)
	local count = 0
	for bag = 0,4 do
		for slot = 1,GetContainerNumSlots(bag) do
			local item = GetContainerItemLink(bag,slot)
			if item ~= nil and item == itemlink then
				local _,slotCount = GetContainerItemInfo(bag, slot);
				count = slotCount + count
				return count
			end
		end
	end
	return count
end

function GuideOnQuestAccepted(questname)
	if Guide.CurrentStep.At ~= nil and Guide.CurrentStep.At == questname then
		Guide_CompleteStep(Guide.CurrentStepIndex)
	end
end

function Guide_UnitQuestLogChanged()
	-- Questlog updates quite delayed, and checking CL_HasQuest in this 
	-- function is too early, so if currentStep has At or Ct, queue 
	-- up a delayed check for OnUpdate.
	GuidePrint("checking queueing delayed quest check")
	if Guide.CurrentStep.At ~= nil or Guide.CurrentStep.Ct ~= nil or Guide.CurrentStep.Dt ~= nil then
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