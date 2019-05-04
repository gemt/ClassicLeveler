
local function OnItemLooted(linklower) -- itemLINK, not just the name
    local steplower = string.lower(CLGuide_CurrentStep.Item.Name)
	if string.find(linklower, steplower) ~= nil then
		-- think there is a race condition when calling CLGuide_GetItemInventoryCount during CHAT_MSG_LOOT event
        -- it may or may not include the item that was just looted. Therefore, if Item.count==1, complete step regardless
		GuidePrint("the looted item was stepitem, have "..CLGuide_GetItemInventoryCount(CLGuide_CurrentStep.Item.Name).."/"..CLGuide_CurrentStep.Item.Count)
        if CLGuide_CurrentStep.Item.Count == 1 or CLGuide_GetItemInventoryCount(CLGuide_CurrentStep.Item.Name) >= CLGuide_CurrentStep.Item.Count then
			CLGuide_CompleteCurrentStep()
		end
	end
end

local function OnChatMsgLoot(arg1)
	local arg1Lower = string.lower(arg1)
	if string.find(arg1Lower, "you receive loot: ") ~= nil then -- looting a mob
		OnItemLooted(arg1Lower)
	elseif string.find(arg1Lower, "you receive item: ") ~= nil then -- buying from vendor
		OnItemLooted(arg1Lower)
    elseif string.find(arg1Lower, "you create: ") ~= nil then -- craft/some on-use questitems
		OnItemLooted(arg1Lower)
	end
end

function CLGuide_HaveItem()
	if CLGuide_CurrentStep.Item == nil then return end

	if event == "CHAT_MSG_LOOT" then
		OnChatMsgLoot(arg1)
	end
end

