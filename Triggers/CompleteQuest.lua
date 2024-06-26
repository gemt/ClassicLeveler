
function CLGuide_IsQuestComplete(qtitle)
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
	--QRP_Print("CLGuide_IsQuestComplete: <"..qtitle.."> not found")
    return nil
end

-- Quests like As Water Cascades (filling a vial, spawning a new item) dosent seem to 
-- report completed on QUEST_LOG_UPDATE. 
local nextOnUpdateTriggerCheck = GetTime()
function CLGuide_CompleteQuestOnUpdate()
    if nextOnUpdateTriggerCheck < GetTime() then
        nextOnUpdateTriggerCheck = GetTime() + 1
        if CLGuide_CurrentStepTable.Ct ~= nil then 
            if CLGuide_IsQuestComplete(CLGuide_CurrentStepTable.Ct) == 1 then
    		    CLGuide_CompleteCurrentStep()
    	    end
        elseif CLGuide_CurrentStepTable.Mct ~= nil then
            for i=1,getn(CLGuide_CurrentStepTable.Mct) do
                if CLGuide_IsQuestComplete(CLGuide_CurrentStepTable.Mct[i]) ~= 1 then
                    return
    	        end
            end
            CLGuide_CompleteCurrentStep()
        end
    end
end

function CLGuide_CompleteQuest()
	if event ~= "QUEST_LOG_UPDATE" then return end
    if IsShiftKeyDown() then return end
	-- is there a reason to also check UNIT_QUEST_LOG_CHANGED?
    -- There is a race condition here. Quest objectives may not return complete on query
    -- during QUEST_LOG_UPDATE after looting the last item
    -- May need a delayed ccheck
	if CLGuide_CurrentStepTable.Ct ~= nil then
    	-- todo: can we check this when we receive QUEST_LOG_UPDATE, or do we need to do a delayed check?
    	if CLGuide_IsQuestComplete(CLGuide_CurrentStepTable.Ct) == 1 then
    		CLGuide_CompleteCurrentStep()
    	end
    elseif CLGuide_CurrentStepTable.Mct ~= nil then
        -- loop through all quests that must be completed and check if they are.
        -- Return as soon as one quest is NOT completed.
        -- If we do not return, all quests are complete, and we complete the step.
        for i=1,getn(CLGuide_CurrentStepTable.Mct) do
            if CLGuide_IsQuestComplete(CLGuide_CurrentStepTable.Mct[i]) ~= 1 then
                return
    	    end
        end
        CLGuide_CompleteCurrentStep()
    end
end