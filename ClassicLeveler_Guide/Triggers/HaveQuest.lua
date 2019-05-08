local function HaveQuestInQuestlog(qtitle)
	local e = GetNumQuestLogEntries()
	for q=2, e do
		if GetQuestLogTitle(q) == qtitle then 
			return 1
		end
	end
	--QRP_Print("CL_HasQuest: <"..qtitle.."> not found")
	return 0
end

function CLGuide_HaveQuest()
	-- currently not sure if we need this anymore
    -- HaveQuestInQuestlog exists in DeliverQuest.lua
    if CLGuide_CurrentStepTable.Ht ~= nil then
        GuidePrint("CLGuide_HaveQuest not implemented")
    end
end