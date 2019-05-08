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

-----------------------------------------
-- ITEM BUTTON EXAMPLE/WIP IMPLEMENTATION
-----------------------------------------

local function CLGuide_GetInventoryItemInfo(itemName)
    for bag = 0,4 do
		for slot = 1,GetContainerNumSlots(bag) do
			local item = GetContainerItemLink(bag,slot)
			if item ~= nil and string.find(item,itemName) then
				local texture, count = GetContainerItemInfo(bag, slot)
                return bag, slot, texture, count
			end
		end
	end
    return nil
end


-- Initializes the given buttton the texture of itemName 
-- Read https://wowwiki.fandom.com/wiki/API_PickupContainerItem
function CLGuide_SetupItemButton(button, itemName)
    local bag,slot,texture,count = CLGuide_GetInventoryItemInfo(itemName)
    if bag == nil then
        GuidePrint(itemName.." Not found in inventory. Unable to initialize button")        
        return
    end
    button:Settexture(texture)
    button.CountText:SetText(tostring(count)) 
    button.bag = bag
    button.slot = slot
    button:Show()
end

-- example/wip implementation of what happens when you click an itemButton
-- Seems on retail you can only UseContainerItem() for vendoring or equipping items.
-- It cannot be used to heartstone or (most likely) use quest items
function CLGuide_OnItemButtonClicked(button)
    ClearCursor() -- to make sure we dont accidentally work with some other item the player has on cursor
    UseContainerItem(button.bag, button.slot)
end

-----------------------------------------