
function CLGuide_LevelReached()
    -- not bothering checking which event we get here. Just check it on anything

	if CLGuide_CurrentStep.Lvl == nil then return end
    if UnitLevel("player") < CLGuide_CurrentStep.Lvl.lvl then return end

    if CLGuide_CurrentStep.xp ~= nil then
        if UnitXP("player") < CLGuide_CurrentStep.xp then return end
    end
    CLGuide_CompleteCurrentStep()
end
