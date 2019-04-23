-- Author      : Gemt
-- Create Date : 4/23/2019 6:02:28 PM

function MainFrame_OnLoad()
	MainFrame:SetMovable(true)
	MainFrame:EnableMouse(true)
	MainFrame:RegisterForDrag("LeftButton");
	MainFrame:RegisterEvent("PLAYER_LEVEL_UP")
end

function MainFrame_OnEvent(event)
	if event == "PLAYER_LEVEL_UP" then
		OnLevelup(event);
	end
end

function OnLevelup(lvl)
	if lvl >
	talent:Show();
end

function MainFrame_OnUpdate(lvl)
	
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
