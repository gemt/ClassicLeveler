
local function OnItemLooted(itemlink) -- itemLINK, not just the name
	if string.find(itemlink, CLGuide_CurrentStep.Item.Name) ~= nil then
		-- think there is a race condition when calling CLGuide_GetItemInventoryCount during CHAT_MSG_LOOT event
		GuidePrint("the looted item was stepitem, have "..CLGuide_GetItemInventoryCount(CLGuide_CurrentStep.Item.Name).."/"..CLGuide_CurrentStep.Item.Count)
		if CLGuide_GetItemInventoryCount(CLGuide_CurrentStep.Item.Name) >= CLGuide_CurrentStep.Item.Count then
			CLGuide_CompleteCurrentStep()
		end
	end
end

local function OnChatMsgLoot(arg1)
	local arg1Lower = string.lower(arg1)
	if string.find(arg1Lower, "you receive loot: ") ~= nil then -- looting a mob
		OnItemLooted(string.sub(arg1, 19, string.len(arg1)-1))
	elseif string.find(arg1Lower, "you receive item: ") ~= nil then -- buying from vendor
		OnItemLooted(string.sub(arg1, 19, string.len(arg1)-1))
	end
end

function CLGuide_HaveItem()
	if CLGuide_CurrentStep.Item == nil then return end

	if event == "CHAT_MSG_LOOT" then
		OnChatMsgLoot(arg1)
	end
end

