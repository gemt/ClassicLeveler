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
	[1] =  {Text="Turn inn Flight to Auberdine. Accept Return to Nessa", At="Return to Nessa"},
		
	[2] =  {Text="accept washed ashore (by FP)"},
	[3] =  {Text="accept buzzbox (second floor innkeeper)"},
	[4] =  {Text="accept bashal'aran (where)"},
	[5] =  {Text="do Bashal'aran quests"},
	[6] =  {Text="trap a grizzly bear (Plagued Lands)"},
	[7] =  {Text="grind to close to 13 on moonkins, have at least 9 eggs"},
	[8] =  {Text="swing my furbolog camp for How big a threat"},
	[9] = {Text="can kill striders too for strider meat (cooking quest)"},
}

function Guide_OnLoad()
	Guide.CurrentStepIndex = 1

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
	Guide.CurrentStepIndex = step
	for i=1,Guide.MAX_STEPS do
		local stepOffset = -3+i
		Guide.CurrentStep = GuideSteps[Guide.CurrentStepIndex+stepOffset]
		if Guide.CurrentStep ~= nil then
			Guide.StepFrames[i].Text:SetText(Guide.CurrentStep.Text)
		else
			Guide.StepFrames[i].Text:SetText("")
		end
	end
end

function Guide_OnEvent()
	GuidePrint(event)
	if arg1 ~= nil then GuidePrint(arg1) end
	if arg2 ~= nil then GuidePrint(arg2) end


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
	local step = GuideSteps[Guide.CurrentStepIndex]
	GuidePrint("Checking step: "..step.Text.. " - HasQuest: "..CL_HasQuest(step.At))
	if step.At ~= nil and CL_HasQuest(step.At) == 1 then
		Guide_NextStep()
	elseif step.Ct ~= nil and CL_HasQuest(step.Ct) == 0 then
		Guide_NextStep()
	end
end

function Guide_OnUpdate()
	Guide_UpdateDragging()


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
	local step = GuideSteps[Guide.CurrentStepIndex]
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
