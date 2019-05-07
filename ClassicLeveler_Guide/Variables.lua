--=========
--Variables
--=========
CLGuide_DelayCheckHasQuest = 0
CLGuide_DelayCheckHasQuestStop = 0
CLGuide_CurrentStepTable = {}
CLGuide_CurrentSectionTable = {}
CLGuide_StepFrame = {}
CLGuide_FrameIsScaling = false
CLGuide_QuestCompleteVendorCache = {}

--==========
--Saved Vars
--==========
CLGuide_Options = {
    ["Rows"] = 5,
    ["FontSize"] = 14,
    ["PreviousSteps"] = 1,
    ["Locked"] = false,
    ["RunSetupBinds"] = false,         
    ["DisableAddon"] = false,           -- not implemented
    ["AutoChooseQuestReward"] = false,  -- not implemented
    ["AutoVendorGreyItems"] = true,     -- not implemented
    ["UseAutoVendorList"] = false,      -- not implemented
    ["ShowTalentPicker"] = false,        -- not implemented
    ["EnablePoints"] = false,            -- not fully implemented 
    ["EnableAutomaticTaxi"] = true,     -- not implemented

}
CLGuide_CurrentStep = 1
CLGuide_CurrentSection = 1