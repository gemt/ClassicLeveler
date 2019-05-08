-- SecureActionButtonTemplate https://code.google.com/archive/p/autobar/wikis/AutoBarTest.wiki
-- Read https://wowwiki.fandom.com/wiki/API_PickupContainerItem

function CLGuide_ItemButton_OnClick()
    ClearCursor() -- to make sure we dont accidentally work with some other item the player has on cursor
    local bag,slot,texture,count = CLGuide_GetInventoryItemInfo(CLGuide_ItemButton_Button.itemName)
    if bag == nil then
        GuidePrint(CLGuide_ItemButton_Button.itemName.." Not found in inventory")        
        return
    end
    UseContainerItem(bag, slot)
    CLGuide_ItemButton_Button.itemName = nil
    CLGuide_ItemButton:Hide()
end

-- Initializes the button with an item that **Already exist in the bag**
function CLGuide_SetupItemButton(itemName)
    local bag,slot,texture,count = CLGuide_GetInventoryItemInfo(itemName)
    if bag == nil then
        GuidePrint(itemName.." Not found in inventory. Unable to initialize button")        
        return
    end
    CLGuide_ItemButton_ButtonIcon:SetTexture(texture)
    --CLGuide_ItemButton_Button.CountText:SetText(tostring(count)) 
    CLGuide_ItemButton:Show()
end

-- Initializes the button with an item that **does not yet exist in bag**
-- therefore also needs texture
function CLGuide_SetupItemButton(itemName, itemTexture)
    CLGuide_ItemButton_Button.itemName = itemName
    CLGuide_ItemButton_ButtonIcon:SetTexture(itemTexture)
    --CLGuide_ItemButton_Button.CountText:SetText(tostring(count)) 
    CLGuide_ItemButton:Show()
end