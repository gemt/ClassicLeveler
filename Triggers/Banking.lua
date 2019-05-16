-- Author      : G3m7
-- Create Date : 5/10/2019 7:19:02 PM
local function GetAllItemsInBag(itemName)
    local items = {}
    for bag = 0,4 do
		for slot = 1,GetContainerNumSlots(bag) do
			local item = GetContainerItemLink(bag,slot)
			if item ~= nil and string.find(item,itemName) then
                table.insert(items, {b=bag,s=slot})
			end
		end
	end
    return items
end

local function PutItemsInBank(items)
    for i=1,getn(items) do
        local itemIndexes = GetAllItemsInBag(items[i])
        for x=1,getn(itemIndexes) do
            UseContainerItem(itemIndexes[x].b, itemIndexes[x].s)
        end
    end
end

function CLGuide_HandleBanking()
    if CLGuide_CurrentStepTable.PutInBank == nil then return end

    if event == "GOSSIP_SHOW" then
        local bankIdx = CLGuide_GetGossipIndex("banker")
        if bankIdx ~= nil then
            SelectGossipOption(bankIdx)
        end
    elseif event == "BANKFRAME_OPENED" then
        PutItemsInBank(CLGuide_CurrentStepTable.PutInBank)
        CLGuide_CompleteCurrentStep()
    end
end