--=========
--DEV STUFF
--=========
-- Put this anywhere you want to throw an error if the game CLGuide_GameVersion is not 1.12.x or 8.x
CLGuide_GameVersion = GetBuildInfo();
CLGuide_GameVersion = string.sub(CLGuide_GameVersion,1,4)
CLGuide_CurrentStep = {}
CLGuide_CurrentSection = {}
function CLGuide_AssertOnClassic(msg)
	if CLGuide_GameVersion ~= "1.12" and string.sub(CLGuide_GameVersion,1,1) ~= "8" then
		GuidePrint(msg)
		GuidePrint(1/"")
	end
end

function CLGuide_PrintStepInfo()
    local step = CLGuide_Options.CurrentStep--GuideSteps[Guide.CurrentStepIndex]
    if step == nil then
        GuidePrint("nil")
        return
    end
    GuidePrint("Step: "..step)
    GuidePrint("Text: "..CL_GuideSteps[step].Text)
    if CL_GuideSteps[step].At ~= nil then
        GuidePrint("AcceptQuestTrigger: "..CL_GuideSteps[step].At)
    end
    if CL_GuideSteps[step].Ct ~= nil then
        GuidePrint("CompletedTrigger: "..CL_GuideSteps[step].Ct)
    end
    if CL_GuideSteps[step].Dt ~= nil then
        GuidePrint("DeliveredTrigger: "..CL_GuideSteps[step].Dt)
    end
    

end
function Guide_PrintStepInfo()
    local step = CLGuide_CurrentStepTable--GuideSteps[CLGuide_Options"CurrentStep"]]
    if step == nil then
        GuidePrint("nil")
        return
    end
    
    GuidePrint("Section: "..CLGuide_CurrentSectionTable.Title.."("..CLGuide_CurrentSection..")")
    GuidePrint("Step: "..CLGuide_CurrentStep)
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

-- Use this when printing warnings we wish to keep, even on launch
function GuideWarning(msg)
    if not DEFAULT_CHAT_FRAME then 
        return 
    end
    DEFAULT_CHAT_FRAME:AddMessage("|cffff0000"..msg)
end

function GuidePrint( msg )
    if not DEFAULT_CHAT_FRAME then 
        return 
    end
    DEFAULT_CHAT_FRAME:AddMessage ( msg )
    ChatFrame3:AddMessage ( msg )
    ChatFrame4:AddMessage ( msg )
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

