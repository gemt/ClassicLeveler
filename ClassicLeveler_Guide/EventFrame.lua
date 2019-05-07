
local EventFrame = CreateFrame("Frame", "EventFrame")

	EventFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
	EventFrame:RegisterEvent("CHAT_MSG_SYSTEM")
	EventFrame:RegisterEvent("QUEST_COMPLETE")
	EventFrame:RegisterEvent("UNIT_QUEST_LOG_CHANGED") 
	EventFrame:RegisterEvent("CHAT_MSG_LOOT")
	EventFrame:RegisterEvent("QUEST_ACCEPTED")
	EventFrame:RegisterEvent("GOSSIP_SHOW")
	EventFrame:RegisterEvent("TAXIMAP_OPENED")
	EventFrame:RegisterEvent("MERCHANT_SHOW")
	EventFrame:RegisterEvent("ZONE_CHANGED_NEW_AREA") 
	EventFrame:RegisterEvent("PLAYER_XP_UPDATE")
	
function EventFrame.OnEvent()

	if event == "PLAYER_ENTERING_WORLD" then
		--Hacky fix for Frame Scaling
		Guide_FrameIsScaling = true
		EventFrame.OnUpdate()
		Guide_FrameIsScaling = false
		EventFrame:UnregisterEvent("PLAYER_ENTERING_WORLD")
		--Set Step Stuff
		GuidePrint(CLGuide_GuideTable[3].Title)
		CLGuide_CurrentSectionTable = CLGuide_GuideTable[CLGuide_CurrentSection]
		CLGuide_SetStep(CLGuide_CurrentStep)
		CLGuide_StepFrameSizer()
		CLGuide_Frame_GuideList:SetText(CLGuide_CurrentSectionTable.Title)

	elseif event == "MERCHANT_SHOW" then
        -- AutoVendor.lua
        -- Note: We want this to run before the Step handlers below as this will clean out bags
        -- before we potentially want to buy new items in a step or similar
        CLGuide_SellItems() 
	elseif event == "PLAYER_ENTERING_WORLD" then
        if CLGuide_Options["RunSetupBinds"] then
            CLGuide_SetupBinds()
            CLGuide_CreateMacros()
        end
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
    CLGuide_TrainSkill()
	CLGuide_ZoneEntered()
end
EventFrame:SetScript("OnEvent", EventFrame.OnEvent)

-- See Guide_UnitQuestLogChanged documentation
local function CLGuide_DelayedCheckHasQuest()
	if DelayedCheckHasQuest == 1 then
		if CLGuide_CurrentStepTable.Ct ~= nil and CL_IsQuestComplete(CLGuide_CurrentStepTable.Ct) == 1 then
			CLGuide_CompleteCurrentStep()
		elseif CLGuide_CurrentStepTable.Dt ~= nil and CL_HasQuest(CLGuide_CurrentStepTable.At) == 0 then
			CLGuide_CompleteCurrentStep()
		elseif CLGuide_CurrentStepTable.Ht ~= nil and CL_HasQuest(CLGuide_CurrentStepTable.At) == 1 then
			CLGuide_CompleteCurrentStep()
		end
		-- If we have passed DelayedCheckHasQuestStop, stop looking
		if DelayedCheckHasQuestStop < GetTime() then
			DelayedCheckHasQuest = 0
		end
	end
end

function EventFrame.OnUpdate()
 	CLGuide_DelayedCheckHasQuest()
    CLGuide_CompleteQuestOnUpdate()
    CLGuide_TrainSkillOnUpdate()

    if CLGuide_CurrentStepTable.Proximity ~= nil then
        if CLGuide_GetDistToActivePoint() < CLGuide_CurrentStepTable.Proximity then
            CLGuide_CompleteCurrentStep()
        end
    end
    
end

EventFrame:SetScript("OnUpdate", EventFrame.OnUpdate)

