-- Author      : G3m7
-- Create Date : 5/5/2019 9:54:09 AM

function CLGuide_PrintQuestCompleteVendorCache()
    for i=1, getn(CLGuide_QuestCompleteVendorCache) do
        GuidePrint(CLGuide_QuestCompleteVendorCache[i])
    end
end

-- Sell the item [itemLink] if it exists in CLguide_VendorList
local function CLGuide_TrySellVendorListItem(bag, slot, itemName)
    if CLGuide_VendorList[itemName] ~= nil then
        DEFAULT_CHAT_FRAME:AddMessage("Selling "..GetContainerItemLink(bag, slot).." (CLGuide_VendorList)")
        UseContainerItem(bag,slot)
    end
end
local function GetItemnameFromLink(link)
    local x = string.find(link, "%[") +1;
    local y = string.find(link, "%]", x) -1;
    return string.sub(link, x, y)
end

-- returns index of item in CLGuide_QuestCompleteVendorCache if it exist, otherwise 0
local function IsInQuestCompleteVendorCache(itemName)
    for i=1, getn(CLGuide_QuestCompleteVendorCache) do
        if itemName == CLGuide_QuestCompleteVendorCache[i] then return i end
    end
    return 0
end

local function CLGuide_TryVendorBagItem(bag, slot)
    local link = GetContainerItemLink(bag, slot)
    if link == nil then return end

    -- if item is locked, it probably cant be vendored
    local _, _, locked = GetContainerItemInfo(bag, slot)
    if locked == 1 then return end -- does it return 1/0 or true/fals on classic?

    -- "ff9d9d9d" is the colorcode of a grey item
    local isGreyItem = (string.find(link, "ff9d9d9d") ~= nil)
    
    
    if isGreyItem then
        DEFAULT_CHAT_FRAME:AddMessage("Selling "..GetContainerItemLink(bag, slot))
        UseContainerItem(bag,slot)
        CLGuide_TrySellVendorListItem(bag, slot, link)
    else
        local itemName = GetItemnameFromLink(link)
        local vendorCacheIdx = IsInQuestCompleteVendorCache(itemName)
        if vendorCacheIdx > 0 then
            GuidePrint("<"..itemName.."> was in vendor cache. Vendoring")
            table.remove(CLGuide_QuestCompleteVendorCache, vendorCacheIdx)
            UseContainerItem(bag,slot)
        else
            CLGuide_TrySellVendorListItem(bag, slot, itemName)
        end
    end
end

function CLGuide_SellItems()
    local bagslots = nil
    for bag=0,4 do
        local bagname = GetBagName(bag)
        if bagname ~= nil then
            bagslots = GetContainerNumSlots(bag)
            if bagslots and bagslots > 0 then
                for slot=1,bagslots do
                    CLGuide_TryVendorBagItem(bag, slot)
                end
            end
        end
    end
end