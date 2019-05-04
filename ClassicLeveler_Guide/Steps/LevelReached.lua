
function CLGuide_LevelReached()
	if CLGuide_CurrentStep.Lvl ~= nil then
    if UnitLevel("player") < CLGuide_CurrentStep.Lvl.lvl then return end
    if CLGuide_CurrentStep.xp ~= nil then
        if UnitXP("player") < CLGuide_CurrentStep.xp then return end
    end
    CLGuide_CompleteCurrentStep()
end
