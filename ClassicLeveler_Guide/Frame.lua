--==========
--Functions
--==========
function CLGuide_GetNumFreeBagspace()
	local numFreeBagspace = 0
	for bag=0,4 do
		local bagname = GetBagName(bag)
		if bagname ~= nil then
			local bagnamelower = string.lower(bagname)
			-- ignoring soulbags and quivers
			if string.find(bagnamelower, "quiver") == nil and string.find(bagnamelower, "soul") == nil then
				for slot=1,GetContainerNumSlots(bag)  do
					if GetContainerItemInfo(bag, slot) == nil then
						numFreeBagspace = numFreeBagspace + 1
					end
				end
			end
		end
	end
	return numFreeBagspace
end

-- Return index of a particular gossip type (binder, taxi, etc) on an NPC. If none is found, return nil
function CLGuide_GetGossipIndex(type) 
	local gossipOptions = {GetGossipOptions()} -- TODO: Make sure GetGossipOptions() returns same num of args on retail (2 in 1.12)
	for i=1,table.getn(gossipOptions) do
		GuidePrint(gossipOptions[(i*2)]..", "..gossipOptions[(i*2)-1]) -- TODO: "attempt to concatinate field ? (a nill value) 
		if gossipOptions[(i*2)] == type then
			return i
		end
	end
	return nil
end

function CLGuide_GetNumStrings(data)
	if data == nil then return 0 end
	local ret = 0
	for i=1,getn(data) do
		if type(data[i]) == "string" then 
			ret = ret + 1 
		end
	end
	return ret
end

function CLGuide_GetItemInventoryCount(itemName) -- itemName, not link
	local count = 0
	for bag = 0,4 do
		for slot = 1,GetContainerNumSlots(bag) do
			local item = GetContainerItemLink(bag,slot)
			if item ~= nil and string.find(item,itemName) then
				local _,slotCount = GetContainerItemInfo(bag, slot);
				count = slotCount + count
			end
		end
	end
	return count
end

function CLGuide_CompleteStep(step)
    --Guide_CompletedGuideSteps[step] = 1
    if CLGuide_Options["CurrentStep"] == step then
        CLGuide_NextStep()
    end
end

function CLGuide_CompleteCurrentStep()
    CLGuide_CompleteStep(CLGuide_Options["CurrentStep"])
end

function Guide_HasCompletedStep(step)
    local cs = Guide_CompletedGuideSteps[step]
    if cs ~= nil and cs == 1 then 
        return 1
    else
        return 0
    end
end

-- See Guide_UnitQuestLogChanged documentation
function CLGuide_DelayedCheckHasQuest()
	if DelayedCheckHasQuest == 1 then
		if CLGuide_CurrentStep.Ct ~= nil and CL_IsQuestComplete(CLGuide_CurrentStep.Ct) == 1 then
			CLGuide_CompleteCurrentStep()
		elseif CLGuide_CurrentStep.Dt ~= nil and CL_HasQuest(CLGuide_CurrentStep.At) == 0 then
			CLGuide_CompleteCurrentStep()
		elseif CLGuide_CurrentStep.Ht ~= nil and CL_HasQuest(CLGuide_CurrentStep.At) == 1 then
			CLGuide_CompleteCurrentStep()
		end
		-- If we have passed DelayedCheckHasQuestStop, stop looking
		if DelayedCheckHasQuestStop < GetTime() then
			DelayedCheckHasQuest = 0
		end
	end
end