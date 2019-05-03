local function IsQuestComplete(qtitle)
	local objectives = nil   
	local e = GetNumQuestLogEntries()
	for q=2, e do
        if qtitle == GetQuestLogTitle(q) then
			local n = GetNumQuestLeaderBoards(q)
			if n == 0 then  
				return 1 -- no objectives on quest. Think this always means it's completed right away
			end
			for x=1, n do
				local desc, type, done = GetQuestLogLeaderBoard(x, q)    
				if done == nil then -- documentation says done is nil when it's not done
					return 0 -- one (or more) objective is not complete. Return 0
				end
			end
			return 1 -- all objectives were done
		end
	end
	--QRP_Print("CL_IsQuestComplete: <"..qtitle.."> not found")
    return nil
end

function CLGuide_CompleteQuest()
	if event ~= "QUEST_LOG_UPDATE" then return end
	-- is there a reason to also check UNIT_QUEST_LOG_CHANGED?

	if CLGuide_CurrentStep.Ct == nil then return end

	-- todo: can we check this when we receive QUEST_LOG_UPDATE, or do we need to do a delayed check?
	if CL_IsQuestComplete(Guide.CurrentStep.Ct) == 1 then
		Guide_CompleteStep(Guide.CurrentStepIndex)
	end
end