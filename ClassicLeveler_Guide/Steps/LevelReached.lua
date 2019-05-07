
function CLGuide_LevelReached()
    -- step wont autocomplete ON levelup event because UnitLevel("player") returns previous lvl during the event
    -- However, on the first event after levelup, we will always get the correct lvl
	if CLGuide_CurrentStepTable.Lvl == nil then return end
    
    if event == "PLAYER_LEVEL_UP" and CLGuide_CurrentStepTable.Lvl.xp == nil then
        if arg1 < CLGuide_CurrentStepTable.Lvl.lvl then return end
        CLGuide_CompleteCurrentStep()
    elseif event == "PLAYER_XP_UPDATE" and CLGuide_CurrentStepTable.Lvl.xp ~= nil then
        if UnitLevel("player") < CLGuide_CurrentStepTable.Lvl.lvl then return end
        if UnitXP("player") >= CLGuide_CurrentStepTable.Lvl.xp then
            CLGuide_CompleteCurrentStep()
        end
    end
end