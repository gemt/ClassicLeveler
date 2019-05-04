
local function OnMerchantShow()
	--GuidePrint(CLGuide_CurrentStep.BuyItem.Item..", "..CLGuide_CurrentStep.BuyItem.Npc..", "..UnitName("target"))
	local invCount = CLGuide_GetItemInventoryCount(CLGuide_CurrentStep.BuyItem.Item)
	if invCount < CLGuide_CurrentStep.BuyItem.Count then
		local itemCountToBuy = CLGuide_CurrentStep.BuyItem.Count - invCount
		for i=1, GetMerchantNumItems() do
			local itmName,_,_,quantity = GetMerchantItemInfo(i)
			if itmName == CLGuide_CurrentStep.BuyItem.Item then
				-- stackable items like arrows cant be bought one by one (as in, you cant get less than 200)
				-- but we let the itemCountToBuy/quantity round down to never buy MORE items than specified
				itemCountToBuy = itemCountToBuy/quantity
				BuyMerchantItem(i, itemCountToBuy)
				CLGuide_CompleteCurrentStep()
				break
			end
		end
	end
end

function CLGuide_BuyItem() 
	if CLGuide_CurrentStep.BuyItem == nil then return end
	if UnitName("target") ~= CLGuide_CurrentStep.BuyItem.Npc then return end

	if event == "MERCHANT_SHOW" then
		SelectGossipOption(GetGossipIndex("vendor"))
	elseif event == "GOSSIP_SHOW" then 
		OnMerchantShow()
	end
end