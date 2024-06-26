--=======================
--Frame Scripts & Buttons
--=======================
function CLGuide_Frame_OnLoad()
	CLGuide_StepFrameRows(CLGuide_Options.Rows)
	CLGuide_CurrentSectionTable = CLGuide_GuideTable[CLGuide_CurrentSection]
	CLGuide_SetStep(CLGuide_CurrentStep, 0)
end

-- Called by all Triggers when a step completes automatically
-- Kept seperate from CLGuide_NextStep() in case we wish to 
-- handle automatic NextStep different from clicked NextStep
function CLGuide_CompleteCurrentStep()
    CLGuide_NextStep()
end

--These are run OnClick on Next / Previous Step Buttons
function CLGuide_NextStep()
	if CLGuide_CurrentStep == getn(CLGuide_CurrentSectionTable.Steps) then 
		GuidePrint("Guide Finished")
		CreateGuideList()
	else
		CLGuide_SetStep(CLGuide_CurrentStep + 1, 0)
	end
end
function CLGuide_PrevStep()
	if CLGuide_CurrentStep > 1 then 
		CLGuide_SetStep(CLGuide_CurrentStep - 1, 1)
	end
end

function CLGuide_GuideList()
	if CLGuide_GuideListFrame:IsVisible() then 
		CLGuide_GuideListFrame:Hide()
	else 
		CLGuide_GuideListFrame:Show()
		CreateGuideList()
	end
end

function CLGuide_Config()
	if CLGuide_ConfigFrame:IsVisible() then
		CLGuide_ConfigFrame:Hide()
	else
		CLGuide_ConfigFrame:Show()
	end
end

function CLGuide_Lock()
	--currently just hides resize frame, need to sort out the rest
	if CLGuide_Options.Locked == true then
		CLGuide_Frame_ResizeButton:Hide()
	end

end

--====================
--Guide Step Functions
--====================
function CLGuide_SetStep(step, wasPrevBtn)

	DelayedCheckHasQuest = 0 -- if step is changed, manual or otherwise, we stop any delayed hasQuest checking
	CLGuide_CurrentStep = step
	CLGuide_CurrentStepTable = CLGuide_CurrentSectionTable.Steps[step]

    -- Skip the step if it is a quest delivery trigger, the quest is not completed, and SkipIfUncomplete is set
    -- need the wasPrevBtn 1/0 so that if it WAS the PreviousStep button which called this function we ignore
    -- this logic so that it is possible to go back past the step
    if wasPrevBtn ~= 1 and CLGuide_CurrentStepTable.Dt ~= nil and CLGuide_CurrentStepTable.Dt.SkipIfUncomplete ~= nil then
        if CLGuide_IsQuestComplete(CLGuide_CurrentStepTable.Dt.q) == 0 then
            GuideWarning(CLGuide_CurrentStepTable.Dt.q.." > not completed, and SkipIfUncomplete flag set. Skipping step")
            CLGuide_NextStep()
            return
        end
    end

    if wasPrevBtn ~= 1 and CLGuide_CurrentStepTable.Dt ~= nil and CLGuide_CurrentStepTable.Dt.SkipIfNotHaveQuest ~= nil then
        if CLGuide_HaveQuestInQuestlog(CLGuide_CurrentStepTable.Dt.q) == 0 then
            GuideWarning(CLGuide_CurrentStepTable.Dt.q.." > not in qlog, and SkipIfNotHaveQuest flag set. Skipping step")
            CLGuide_NextStep()
            return
        end
    end

    

	--Set StepFrame text
	for i = 1, CLGuide_Options.Rows do 
		local StepOffset = step - CLGuide_Options.PreviousSteps + i - 1
		local s = CLGuide_CurrentSectionTable.Steps[StepOffset]
		if s ~= nil then 
			CLGuide_StepFrame[i].text:SetText(s.Text)
		else 
			CLGuide_StepFrame[i].text:SetText("")
		end
	end

	--Set Arrow
	if CLGuide_CurrentStepTable.point ~= nil then
		SetCrazyArrow(CLGuide_CurrentStepTable.point, CLGuide_CurrentStepTable.Text)
	else
		SetCrazyArrow(CLGuide_CurrentStepTable.point, CLGuide_CurrentStepTable.Text)
	end
    
    
    -- check if any pins to add/remove
    if CLGuide_CurrentStepTable.PinAdd ~= nil then
        CLGuide_AddPin(CLGuide_CurrentStepTable.PinAdd)
    elseif CLGuide_CurrentStepTable.PinRemove ~= nil then
        CLGuide_RemovePin(CLGuide_CurrentStepTable.PinRemove)
    end

    if CLGuide_CurrentStepTable.UseItem ~= nil then
        CLGuide_SetupItemButtonExistingItem(CLGuide_CurrentStepTable.UseItem)
    end


	Guide_PrintStepInfo()
	CLGuide_UpdateColors()
end

function CLGuide_SetSection(sectionNum)
	CLGuide_CurrentSection = sectionNum
	CLGuide_CurrentSectionTable = CLGuide_GuideTable[sectionNum]
    if CLGuide_CurrentSectionTable.Pinboard ~= nil then
        for i=1, getn(CLGuide_CurrentSectionTable.Pinboard) do
            CLGuide_AddPin(CLGuide_CurrentSectionTable.Pinboard[i])
        end
    end
	CLGuide_SetStep(1, 0)
	CLGuide_Frame_GuideList:SetText(CLGuide_CurrentSectionTable.Title)
end

--The cheat solution that assumes previous steps to be completed
function CLGuide_UpdateColors()
	CLGuide_StepFrame[1+CLGuide_Options.PreviousSteps]:SetBackdropColor(0.3, 0.3, 0.3, 0.5)
	--If you want to actually check previous steps for completion, you can just add the check in the for loop
	if CLGuide_Options.PreviousSteps > 0 then 
		for i = 1, CLGuide_Options.PreviousSteps do 
			CLGuide_StepFrame[i]:SetBackdropColor(0.1, 0.3, 0.1, 0.5)
		end
	end
	CLGuide_StepFrameSizer()
end

--=====================
--Frame Creator & Sizer
--=====================
function CLGuide_StepFrameRows(rows)
	if rows > getn(CLGuide_StepFrame) then
		CLGuide_Options.Rows = rows
		for i = getn(CLGuide_StepFrame)+1, rows do 
			CLGuide_StepFrame[i] = CreateFrame("FRAME", "CLGuide_StepFrame"..i, CLGuide_Frame)
			CLGuide_StepFrame[i]:Show()
			--texture
			CLGuide_StepFrame[i]:SetBackdrop{
				bgFile = "Interface\\BUTTONS\\WHITE8X8",
				insets = { left = 1, right = 1, top = 1, bottom = 1	 }
			}
			CLGuide_StepFrame[i]:SetBackdropColor(0, 0, 0, 0.5)
			--Text 
			CLGuide_StepFrame[i].text = CLGuide_StepFrame[i]:CreateFontString(nil,"ARTWORK") 
			CLGuide_StepFrame[i].text:SetFont("Interface\\AddOns\\ClassicLeveler_Guide\\Artwork\\Inconsolata.ttf", CLGuide_Options.FontSize)
			CLGuide_StepFrame[i].text:SetPoint("TOPLEFT", CLGuide_StepFrame[i], "TOPLEFT", 10, -5)
			CLGuide_StepFrame[i].text:SetPoint("BOTTOMRIGHT", CLGuide_StepFrame[i], "BOTTOMRIGHT", -10, -5)
			CLGuide_StepFrame[i].text:SetJustifyV("TOP")
			CLGuide_StepFrame[i].text:SetJustifyH("LEFT")
			CLGuide_StepFrame[i].text:SetText("Step "..i)
		end
	elseif rows < getn(CLGuide_StepFrame) then
		CLGuide_Options.Rows = rows
		for i = rows+1, getn(CLGuide_StepFrame) do
			CLGuide_StepFrame[i]:Hide()
		end
	end
	CLGuide_UpdateColors()
end
--This is called OnUpdate when it is being resized
--Also run once at OnLoad because reasons
function CLGuide_StepFrameSizer()
	local FrameNumber = CLGuide_Options.Rows
	local h = CLGuide_Frame:GetHeight()
	for i = 1, FrameNumber do
		local topOffset = (i-1)*(h/FrameNumber)
		local bottomOffset = h-(i*(h/FrameNumber))
		CLGuide_StepFrame[i]:SetPoint("TOPLEFT", CLGuide_Frame, "TOPLEFT", 0, -topOffset)
		CLGuide_StepFrame[i]:SetPoint("BOTTOMRIGHT", CLGuide_Frame, "BOTTOMRIGHT", 0, bottomOffset)
	end
end

--========
--OnUpdate
--========

function CLGuide_Frame_OnUpdate() 
	if CLGuide_FrameIsScaling then 
		CLGuide_StepFrameSizer()
	end
	UpdateCoordBox()
end

function CLGuide_Frame_OnMouseWheel()
    if not IsShiftKeyDown() or not IsControlKeyDown() then return end

    if arg1 == 1 then   -- up
        CLGuide_PrevStep()
    else                -- down
        CLGuide_NextStep()
    end

end