
function CL_IsQuestComplete(qtitle)
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
	QRP_Print("CL_IsQuestComplete: <"..qtitle.."> not found")
    return nil
end

function CL_HasQuest(qtitle)
	local e = GetNumQuestLogEntries()
	for q=2, e do
		if GetQuestLogTitle(q) == qtitle then 
			return 1
		end
	end
	QRP_Print("CL_HasQuest: <"..qtitle.."> not found")
	return 0
end
