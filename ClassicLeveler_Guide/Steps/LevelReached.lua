
function CLGuide_LevelReached()
    -- step wont autocomplete ON levelup event because UnitLevel("player") returns previous lvl during the event
    -- However, on the first event after levelup, we will always get the correct lvl
	if CLGuide_CurrentStep.Lvl == nil then return end
    
    if event == "PLAYER_LEVEL_UP" and CLGuide_CurrentStep.Lvl.xp == nil then
        if arg1 < CLGuide_CurrentStep.Lvl.lvl then return end
        CLGuide_CompleteCurrentStep()
    elseif event == "PLAYER_XP_UPDATE" and CLGuide_CurrentStep.Lvl.xp ~= nil then
        if UnitLevel("player") < CLGuide_CurrentStep.Lvl.lvl then return end
        if UnitXP("player") >= CLGuide_CurrentStep.Lvl.xp then
            CLGuide_CompleteCurrentStep()
        end
    end
end