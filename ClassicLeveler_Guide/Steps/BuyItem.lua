
local function OnMerchantShow()
	--GuidePrint(CLGuide_CurrentStep.BuyItem.Item..", "..CLGuide_CurrentStep.BuyItem.Npc..", "..UnitName("target"))
	local invCount = CLGuide_GetItemInventoryCount(CLGuide_CurrentStep.BuyItem.Item)
	if invCount < CLGuide_CurrentStep.BuyItem.Count then
		local itemCountToBuy = CLGuide_CurrentStep.BuyItem.Count - invCount
		for i=1, GetMerchantNumItems() do
			local itmName,_,price,quantity = GetMerchantItemInfo(i)
			if itmName == CLGuide_CurrentStep.BuyItem.Item then
				-- stackable items like arrows cant be bought one by one (as in, you cant get less than 200)
				-- but we let the itemCountToBuy/quantity round down to never buy MORE items than specified
				itemCountToBuy = itemCountToBuy/quantity
				if itemCountToBuy*price > GetMoney() then
					GuidePrint("You do not have enough money to buy the required items")
					return
				end
				BuyMerchantItem(i, itemCountToBuy)
				CLGuide_CompleteCurrentStep()
				break
			end
		end
	else -- if we already have the amount of items required, keep going
        CLGuide_CompleteCurrentStep()
    end
end

function CLGuide_BuyItem() 
	if CLGuide_CurrentStep.BuyItem == nil then return end
	if UnitName("target") ~= CLGuide_CurrentStep.BuyItem.Npc then return end
    if IsShiftKeyDown() then return end

	if event == "MERCHANT_SHOW" then
		OnMerchantShow()
	elseif event == "GOSSIP_SHOW" then 
		SelectGossipOption(CLGuide_GetGossipIndex("vendor"))
	end
end