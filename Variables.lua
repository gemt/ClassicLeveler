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
    ["Rows"] = 7,
    ["FontSize"] = 14,
    ["PreviousSteps"] = 2,
    ["Locked"] = false,
    ["RunSetupBinds"] = true,         
    ["DisableAddon"] = false,           -- not implemented
    ["AutoChooseQuestReward"] = true,  -- not implemented
    ["AutoVendorGreyItems"] = true,     -- not implemented
    ["UseAutoVendorList"] = true,      -- not implemented
    ["ShowTalentPicker"] = true,       -- not implemented
    ["EnablePoints"] = true,           -- not fully implemented 
    ["EnableAutomaticTaxi"] = true,     -- not implemented

}
CLGuide_CurrentStep = 1
CLGuide_CurrentSection = 1