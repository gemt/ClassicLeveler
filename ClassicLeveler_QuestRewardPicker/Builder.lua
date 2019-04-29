-- Author      : G3m7
-- Create Date : 4/27/2019 3:52:42 PM

function Builder_OnLoad()
	Builder:RegisterForDrag("LeftButton");
	Builder:RegisterEvent("QUEST_COMPLETE")
	Builder:RegisterEvent("GOSSIP_CLOSE")
	Builder.Title = Builder:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
	Builder.Title:SetPoint("TOPLEFT", Builder, "TOPLEFT", 10, -25)
	Builder.Title:SetText("")
	asd = CreateFrame("Button")
	Builder.CLB_ItemButtons = {}
	Builder.CLB_ItemButtons[1] = CLQ_CreateBtn("ItemChoice1Btn", -50, 1)
	Builder.CLB_ItemButtons[2] = CLQ_CreateBtn("ItemChoice2Btn", -80, 2)
	Builder.CLB_ItemButtons[3] = CLQ_CreateBtn("ItemChoice3Btn", -110, 3)
	Builder.CLB_ItemButtons[4] = CLQ_CreateBtn("ItemChoice4Btn", -140, 4)
	Builder.CLB_ItemButtons[5] = CLQ_CreateBtn("ItemChoice5Btn", -170, 5)
	Builder.CLB_Items = {}


	Builder.EquipTT = Builder:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
	Builder.EquipTT:SetPoint("TOPLEFT", Builder, "TOPLEFT", 10, -200)
	Builder.EquipTT:SetText("Equip:")

	Builder.CLB_Equip = CreateFrame("CheckButton", "CLB_Equip", Builder, "UICheckButtonTemplate")
	Builder.CLB_Equip:SetPoint("TOPLEFT", Builder, "TOPLEFT", 50, -200)
	Builder.CLB_Equip:SetWidth(32)
	Builder.CLB_Equip:SetHeight(32)

	QRP_Print("Builder loaded")
	btn:Hide();
end

function CLQ_CreateBtn(name, ypos, idx)
	btn = CreateFrame("Button", name, Builder, "UIPanelButtonTemplate");
	btn:SetPoint("TOPLEFT", Builder, "TOPLEFT", 10, ypos)
	btn:SetWidth(300)
	btn:SetHeight(32)
	btn:SetScript("OnClick", function()
		QRP_Print(idx.." Clicked")
		GetQuestReward(idx)
		local itm = Builder.CLB_Items[idx]
		local equip = Builder.CLB_Equip:GetChecked()
		
		local mapIdx = Builder.QuestTitleText.."|"..Builder.CLB_Items[1]

		local existing = CLQuestRewardChoices[mapIdx]
		QRP_Print("Saving Quest: "..mapIdx..", Item="..itm)
		CLQuestRewardChoices[mapIdx] = {Item=itm, Use=equip }
		Builder:Hide()
	end)
	return btn
end

function Builder_OnEvent(event)
	Builder:Show()
	Builder.numChoices = GetNumQuestChoices();
	local title = GetTitleText()
	Builder.Title:SetText(title)
	Builder.QuestTitleText = title
	for i=1,5 do
		Builder.CLB_ItemButtons[i]:Hide()
	end
	for i=1,Builder.numChoices do
		local b = Builder.CLB_ItemButtons[i];
		b:Show();
		local itmName = GetQuestItemInfo("choice", i)
		Builder.CLB_Items[i] = itmName
		b:SetText(Builder.CLB_Items[i]);
	end
end