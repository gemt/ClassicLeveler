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

--At = AcceptTrigger
--Ct = CompleteTrigger
local GuideSteps = {
	{Text="Turn inn Flight to Auberdine. Accept Return to Nessa", At="Return to Nessa"},
	{Text="Accept washed ashore (by FP)", At="Washed Ashore"},
	{Text="Accept buzzbox (second floor innkeeper)", At="Buzzbox 827"},
	{Text="Accept Bashal'Aran (Thundris Windweaver, north mainhouse)", At="Bashal'Aran"},
	{Text="Accept Plagued Lands (bear quest dude)", At="Plagued Lands"},


	{Text="do Bashal'Aran quests"},
	{Text="trap a grizzly bear (Plagued Lands)"},
	{Text="grind to close to 13 on moonkins, have at least 9 eggs"},
	{Text="swing my furbolog camp for How big a threat"},
	{Text="can kill striders too for strider meat (cooking quest)"},
}

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

	Guide:RegisterEvent("QUEST_COMPLETE")
	 
	Guide:RegisterEvent("UNIT_QUEST_LOG_CHANGED") -- seems to be only on accept/abandon quest, or at least not on ALL status updates

	Guide:RegisterEvent("QUEST_ACCEPTED")
	Guide:RegisterEvent("GOSSIP_SHOW")
	Guide:RegisterForDrag("LeftButton");
end

function Guide_SetupGuide()
	nextButton:SetPoint("BOTTOMLEFT", Guide, "BOTTOMLEFT", 32, -22)
	prevButton:SetPoint("BOTTOMLEFT", Guide, "BOTTOMLEFT", 0, -22)

	Guide:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background", 
					edgeFile = "Interface\AddOns\ClassicLeveler_Guide\Textures\Borders\fer1", 
					tile = false, tileSize = 1, edgeSize = 2, 
					insets = { left = 0, right = 0, top = 0, bottom = 1 }});
	Guide:SetBackdropColor(0,0,0);


	Guide.MAX_STEPS = 7
	Guide.StepFrames = {}
	Guide.StepHeight = Guide:GetHeight()/Guide.MAX_STEPS
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
		Guide.StepFrames[i].Text:SetPoint("TOPLEFT", Guide.StepFrames[i].Bg, "TOPLEFT", 10, -10)
		Guide.StepFrames[i].Text:SetPoint("BOTTOMRIGHT", Guide.StepFrames[i].Bg, "BOTTOMRIGHT", -10, -10)
		Guide.StepFrames[i].Text:SetJustifyV("TOP");
		Guide.StepFrames[i].Text:SetJustifyH("LEFT");
		Guide.StepFrames[i].Bg:SetBackdropColor(0.9,0.9,0.9,1);
	end
	Guide.StepFrames[3].Bg:SetBackdropColor(0.3, 0.3, 0.3, 1);

end

function Guide_NextStep()
	Guide_SetStep(Guide.CurrentStepIndex + 1)
end
function Guide_PrevStep()
	Guide_SetStep(Guide.CurrentStepIndex - 1)
end

function Guide_SetStep(step)
	
	Guide.DelayedCheckHasQuest = 0 -- if step is changed, manual or otherwise, we stop any delayed hasQuest checking

	Guide.CurrentStepIndex = step
	Guide.CurrentStep = GuideSteps[Guide.CurrentStepIndex]

	for i=1,Guide.MAX_STEPS do
		local stepOffset = Guide.CurrentStepIndex-3+i
		local s = GuideSteps[stepOffset]
		if s ~= nil then
			Guide.StepFrames[i].Text:SetText(s.Text)
		else
			Guide.StepFrames[i].Text:SetText("")
		end
	end

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
		local questTitle = GetQuestLogTitle(arg1)
		GuidePrint(questTitle)
	end


	-- "hacking" the UI in place. Without this, scaling wont look right until you have rescaled the frame...
	if event == "PLAYER_ENTERING_WORLD" then
		Guide.IsDragging = 1
		Guide_OnUpdate()
		Guide.IsDragging = 0
	end
end

function Guide_UnitQuestLogChanged()
	-- Questlog updates quite delayed, and checking CL_HasQuest in this 
	-- function is too early, so if currentStep has At or Ct, queue 
	-- up a delayed check for OnUpdate
	if Guide.CurrentStep.At ~= nil or Guide.CurrentStep.Ct ~= nil then
		Guide.DelayedCheckHasQuest = 1
		Guide.DelayedCheckHasQuestStop = GetTime() + 2.0 -- stop checking after 2 sec
	end
	
end

function Guide_OnUpdate()
	Guide_UpdateDragging()
	Guide_DelayedCheckHasQuest()
end

function Guide_DelayedCheckHasQuest()
	if Guide.DelayedCheckHasQuest == 1 then
		if Guide.CurrentStep.At ~= nil and CL_HasQuest(Guide.CurrentStep.At) == 1 then
			Guide_NextStep()
		elseif Guide.CurrentStep.Ct ~= nil and CL_HasQuest(Guide.CurrentStep.Ct) == 0 then
			Guide_NextStep()
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
		GuidePrint("AcceptQuestTrigger: "..step.Ct)
	end
	

end
