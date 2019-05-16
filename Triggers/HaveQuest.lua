function CLGuide_HaveQuest()
	-- currently not sure if we need this anymore
    -- HaveQuestInQuestlog exists in DeliverQuest.lua
    if CLGuide_CurrentStepTable.Ht ~= nil and CLGuide_HaveQuestInQuestlog(CLGuide_CurrentStepTable.Ht) then
        CLGuide_CompleteCurrentStep()
    end
end