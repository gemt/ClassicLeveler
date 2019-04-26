-- Author      : Gemt
-- Create Date : 4/23/2019 6:02:28 PM




function MainFrame_OnLoad()
	MainFrame:RegisterForDrag("LeftButton");

	MainFrame:RegisterEvent("PLAYER_LEVEL_UP")
	MainFrame:RegisterEvent("QUEST_COMPLETE")
	MainFrame:RegisterEvent("QUEST_PROGRESS")
	
	MainFrame:SetPoint("TOPLEFT", nil, "TOPLEFT", 250, -50)
	MainFrame:SetBackdrop( {
			bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background", 
			edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border", 
			tile = true, 
			tileSize = 32, 
			edgeSize = 32, 
			insets = { left = 11, right = 12, top = 12, bottom = 11 }
		} );
	MainFrame:SetBackdropColor(.01, .01, .01, .91)

	message("loaded")
end

function MainFrame_OnUpdate()

end

-- CompleteQuest() "continue" button
function MainFrame_OnEvent(event)
	_print(event)
	if event == "PLAYER_LEVEL_UP" then
		OnLevelup(arg1);
	elseif event == "QUEST_COMPLETE" then
		ChooseQuestItem();
	elseif event == "QUEST_PROGRESS" then
		TalkToQuestNpc();
	end
end

function OnLevelup(lvl)
	_print("reached lvl "..lvl)
	if lvl < 10 then return end

	talent:Show();
end

function Button1_OnClick()
		--self:Print("Setting binds")
		-- https://wowwiki.fandom.com/wiki/BindingID
		SetBinding("1","ACTIONBUTTON1")
		SetBinding("2","ACTIONBUTTON2")
		SetBinding("3","ACTIONBUTTON3")
		SetBinding("4","ACTIONBUTTON4")
		SetBinding("5","ACTIONBUTTON5")
		SetBinding("F1","ACTIONBUTTON6")
		SetBinding("F2","ACTIONBUTTON7")
		SetBinding("F3","ACTIONBUTTON8")
		SetBinding("F4","ACTIONBUTTON9")
		SetBinding("T","ACTIONBUTTON10")
		SetBinding("G","ACTIONBUTTON11")
		SetBinding("|","ACTIONBUTTON12")
		SetBinding("ALT-1","MULTIACTIONBAR1BUTTON1")
		SetBinding("ALT-2","MULTIACTIONBAR1BUTTON2")
		SetBinding("ALT-3","MULTIACTIONBAR1BUTTON3")
		SetBinding("ALT-4","MULTIACTIONBAR1BUTTON4")
		SetBinding("SHIFT-1","MULTIACTIONBAR1BUTTON5")
		SetBinding("SHIFT-2","MULTIACTIONBAR1BUTTON6")
		SetBinding("SHIFT-3","MULTIACTIONBAR1BUTTON7")
		SetBinding("SHIFT-4","MULTIACTIONBAR1BUTTON8")
		SetBinding("SHIFT-5","MULTIACTIONBAR1BUTTON9")
		SetBinding("SHIFT-R","MULTIACTIONBAR1BUTTON10")
		SetBinding("BUTTON5","MULTIACTIONBAR1BUTTON11")
		SetBinding("BUTTON4","MULTIACTIONBAR1BUTTON12")
		SetBinding("CTRL-1","MULTIACTIONBAR2BUTTON1")
		SetBinding("CTRL-2","MULTIACTIONBAR2BUTTON2")
		SetBinding("CTRL-3","MULTIACTIONBAR2BUTTON3")
		SetBinding("CTRL-4","MULTIACTIONBAR2BUTTON4")
		SetBinding("SHIFT-X","MULTIACTIONBAR2BUTTON5")
		SetBinding("SHIFT-F","MULTIACTIONBAR2BUTTON6")
		SetBinding("ALT-CTRL-1","MULTIACTIONBAR2BUTTON8")
		SetBinding("ALT-CTRL-2","MULTIACTIONBAR2BUTTON9")
		SetBinding("ALT-CTRL-3","MULTIACTIONBAR2BUTTON10")
		--self:Print("Finished Setting Binds")
end

function TalkToQuestNpc()
	CompleteQuest()
end

function ChooseQuestItem()
	_print("Quest: "..GetTitleText()..", Choices: "..GetNumQuestChoices());
	reward = CLQuestRewardChoices[GetTitleText()];
	_print("Choosing Item:"..reward)
	if reward ~= nil then
		_print(GetTitleText())
		_print(pickReward);
		GetQuestReward(reward.Index);
		if reward.Use == 1 then
			EquipItem() -- how?
		end
	end
end

function EquipItem()

end

CLQuestRewardChoices = {
	["WANTED: Murkdeep!"] = {Index=2,Use=1}
}

CLQuests = {
[1] = {
	Quest="The Balance of Nature",
	x = 10329,
	y = 826
}
};
