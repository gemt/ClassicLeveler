
function CLGuide_LevelReached()
    -- not bothering checking which event we get here. Just check it on anything
    -- step wont autocomplete ON levelup event because UnitLevel("player") returns previous lvl during the event
    -- However, on the first event after levelup, we will always get the correct lvl
	if CLGuide_CurrentStepTable.Lvl == nil then return end
    if UnitLevel("player") < CLGuide_CurrentStepTable.Lvl.lvl then return end

    if CLGuide_CurrentStepTable.xp ~= nil then
        if UnitLevel("player") > CLGuide_CurrentStepTable.Lvl.lvl or UnitXP("player") < CLGuide_CurrentStepTable.xp then return end
    end
    CLGuide_CompleteCurrentStep()
end
