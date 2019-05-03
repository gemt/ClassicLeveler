





function CLGuide_AcceptQuest()
	if event == "CHAT_MSG_SYSTEM" then
		-- TODO: This event is not reliable on 1.12, if you accept multiple quests in quick succession, they may not show
		local arg1Lower = string.lower(arg1)
		if string.find(arg1Lower, "quest accepted:") ~= nil then
			if Guide.CurrentStep.At ~= nil and string.lower(Guide.CurrentStep.At) == questname then
				Guide_CompleteStep(Guide.CurrentStepIndex)
			end
		end
	end
	
end





--[[
-- This is a reference implementation for a less bruteforce way of accepting/delivering quests

-- handle an At trigger on quest greeting or gossip show
local function Guide_At_OnQuestGreetingOrGossipShow(selectFunction, numAvailableFunction, getQuestNameFunction)
	-- assuming CurrentStep.At exist here, function shouldnt be called otherwise
	for i=1, numAvailableFunction() do
		if getQuestNameFunction(i) == Guide.CurrentStep.At then
			selectFunction(i)
			return
		end
	end
	GuidePrint("Guide_At_OnQuestGreetingOrGossipShow <"..Guide.CurrentStep.At.."> not found")
end

function Guide_GetGossipNumAvailQuests()
	local availQuestsInfo = { GetGossipAvailableQuests() };
	if availQuestsInfo == nil or availQuestsInfo == 0 then return 0 end
	
	if version == "1.12.1" then
		return table.getn(availQuestsInfo)/2
	elseif version == "8.1.5" then
		return table.getn(availQuestsInfo)/7
	end
	GuidePrint(1/"") -- "assert", need to test other versions
end

function Guide_GetGossipAvailableQuestName(index)
	local availQuestsInfo = { GetGossipAvailableQuests() };
	if availQuestsInfo == nil or availQuestsInfo == 0 then return nil end
	local iterSkip = 0
	if version == "1.12.1" then
		return availableQuestInfo[(index*2)/2]
	elseif version == "8.1.5" then
		return availableQuestInfo[(index*7)/7]
	end
	GuidePrint(1/"") -- "assert", need to test other versions
end

]]