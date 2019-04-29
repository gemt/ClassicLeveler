
function CL_IsQuestComplete(qtitle)
	local objectives = nil   
	local e = GetNumQuestLogEntries()
	for q=2, e do
        if qtitle == GetQuestLogTitle(q) then
			local n = GetNumQuestLeaderBoards(q)
			for x=1, n do
				local l = GetQuestLogLeaderBoard(x, q)    
                if string.find(l, "%d+/%d+") ~= nil then
					local a = string.sub(l, string.find(l, "%d+/%d+"))
					local b = string.sub(a, string.find(a, "%d+"))
					local c = string.sub(a, string.find(a, "%d+$"))
                    if b ~= c then 
						return 0 -- one objective is not complete. Return 0
                    end                                                         
                end
			end
			return 1 -- all objectives were n/n
		end
	end
	QRP_Print(qtitle.." not found")
    return nil
end

function CL_HasQuest(qtitle)
	local e = GetNumQuestLogEntries()
	for q=2, e do
		if GetQuestLogTitle(q) == qtitle then 
			return 1
		end
	end
	return 0
end
