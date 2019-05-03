
local function OnMerchantShow()
	--GuidePrint(Guide.CurrentStep.BuyItem.Item..", "..Guide.CurrentStep.BuyItem.Npc..", "..UnitName("target"))
	local invCount = CLGuide_GetItemInventoryCount(Guide.CurrentStep.BuyItem.Item)
	if invCount < Guide.CurrentStep.BuyItem.Count then
		local itemCountToBuy = Guide.CurrentStep.BuyItem.Count - invCount
		for i=1, GetMerchantNumItems() do
			local itmName,_,_,quantity = GetMerchantItemInfo(i)
			if itmName == Guide.CurrentStep.BuyItem.Item then
				-- stackable items like arrows cant be bought one by one (as in, you cant get less than 200)
				-- but we let the itemCountToBuy/quantity round down to never buy MORE items than specified
				itemCountToBuy = itemCountToBuy/quantity
				BuyMerchantItem(i, itemCountToBuy)
				Guide_CompleteStep(Guide.CurrentStepIndex)
				break
			end
		end
	end
end

function CLGuide_BuyItem() 
	if Guide.CurrentStep.BuyItem == nil then return end
	if UnitName("target") ~= Guide.CurrentStep.BuyItem.Npc then return end

	if event == "MERCHANT_SHOW" then
		SelectGossipOption(GetGossipIndex("vendor"))
	elseif event == "GOSSIP_SHOW" then 
		OnMerchantShow()
	end
end