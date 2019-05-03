
local function OnItemLooted(itemlink) -- itemLINK, not just the name
	if string.find(itemlink, Guide.CurrentStep.Item.Name) ~= nil then
		GuidePrint("the looted item was stepitem, have "..Guide_GetItemInventoryCount(Guide.CurrentStep.Item.Name).."/"..Guide.CurrentStep.Item.Count)
		if Guide_GetItemInventoryCount(Guide.CurrentStep.Item.Name) >= Guide.CurrentStep.Item.Count then
			Guide_CompleteStep(Guide.CurrentStepIndex)
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
	if Guide.CurrentStep.Item == nil then return end

	if event == "CHAT_MSG_LOOT" then
		OnChatMsgLoot(arg1)
	end
end

