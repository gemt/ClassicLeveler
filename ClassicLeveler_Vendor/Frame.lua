-- Author      : G3m7
-- Create Date : 4/27/2019 11:35:25 PM

local merchantstatus = false

function Vendor_OnLoad()
	Vendor:RegisterEvent("MERCHANT_SHOW")
	Vendor:RegisterEvent("MERCHANT_CLOSED")
end

function Vendor_OnEvent(event)
	if(event == "MERCHANT_SHOW") then
		merchantstatus = true
		GreySell = {}
	elseif(event == "MERCHANT_CLOSED") then
		merchantstatus = false
end

function Vendor_OnUpdate()
	local current_time = GetTime();
	local shiftstatus = IsShiftKeyDown();
	local ctrlstatus = IsControlKeyDown();
	local altstatus = IsAltKeyDown();

	if merchantstatus and shiftstatus and current_time > last_click and not CursorHasItem() then
		last_click = current_time + 0.25
		GreySellRepair();
	end
end

function GreySellRepair()
	local bag, slot = LazyPig_BagReturn("ff9d9d9d")
	if bag and slot then
		local _, _, locked = GetContainerItemInfo(bag, slot)
		if bag and slot and not locked then	
			UseContainerItem(bag,slot)
			if not(GreySell.bag == bag and GreySell.slot == slot) then
				DEFAULT_CHAT_FRAME:AddMessage("Selling "..GetContainerItemLink(bag, slot))
				GreySell.bag = bag
				GreySell.slot = slot
			end	
		end
	elseif CanMerchantRepair() then
		--[[
		local rcost = GetRepairAllCost()
		if rcost and rcost ~= 0 then
			if rcost > GetMoney() then 
				DEFAULT_CHAT_FRAME:AddMessage("Not Enough Money to Repair")
				return
			end
			GreySell.repair = rcost
			RepairAllItems();
		elseif GreySell.repair and	rcost == 0 then
			local gold = floor(abs(GreySell.repair / 10000))
			local silver = floor(abs(mod(GreySell.repair / 100, 100)))
			local copper = floor(abs(mod(GreySell.repair, 100)))	
			local COLOR_COPPER = "|cffeda55f"
			local COLOR_SILVER = "|cffc7c7cf"
			local COLOR_GOLD = "|cffffd700"
			
			DEFAULT_CHAT_FRAME:AddMessage("LazyPig: Repairing All Items "..COLOR_GOLD..gold.."g "..COLOR_SILVER..silver.."s "..COLOR_COPPER..copper.."c")
			GreySell.repair = nil
		end
		]]
	end	
end

function LazyPig_BagReturn(find)
	local link = nil
	local bagslots = nil
	for bag=0,NUM_BAG_FRAMES do
		bagslots = GetContainerNumSlots(bag)
		if bagslots and bagslots > 0 then
			for slot=1,bagslots do
				link = GetContainerItemLink(bag, slot)
				if not find and not link or find and link and string.find(link, find) then
					return bag, slot
				end
			end
		end
	end
	return nil
end