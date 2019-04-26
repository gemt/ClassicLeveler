-- Author      : G3m7
-- Create Date : 4/26/2019 4:54:32 PM

function Frame1_OnLoad()
	Frame1:RegisterForDrag("LeftButton");
	Frame1:RegisterEvent("PLAYER_LEVEL_UP")
end

function Frame1_OnEvent(event)
	_print(event..", "..arg1)
	if event == "PLAYER_LEVEL_UP" and arg1 > 9 then
		TrainButton:SetText(TalentPicker_Talents[tonumber(arg1)].Name)
		Frame1:Show()
	end
end

function Button1_OnClick()
	local lvl = UnitLevel("player");
	_print(tonumber(lvl))
	local talent = TalentPicker_Talents[tonumber(lvl)]
	_print("Learning "..talent.Name.." ("..talent.tab..","..talent.idx..")")
	LearnTalent(talent.tab, talent.idx);
	Frame1:Hide();
end

TalentPicker_Talents = {
	[10] = {Name="Imp Aspect of Hawk", tab=1,idx=1},
	[11] = {Name="Imp Aspect of Hawk", tab=1,idx=1},
	[12] = {Name="Imp Aspect of Hawk", tab=1,idx=1},
	[13] = {Name="Imp Aspect of Hawk", tab=1,idx=1},
	[14] = {Name="Imp Aspect of Hawk", tab=1,idx=1},

	[15] = {Name="Thick Hide", tab=1,idx=5},
	[16] = {Name="Thick Hide", tab=1,idx=5},
	[17] = {Name="Thick Hide", tab=1,idx=5},

	[18] = {Name="imp revive pet", tab=1,idx=6},
	[19] = {Name="imp revive pet", tab=1,idx=6},

	[20] = {Name="Pathfinding", tab=1,idx=7},
	[21] = {Name="Pathfinding", tab=1,idx=7},

	[22] = {Name="Beastail Swiftness", tab=1,idx=8},

	[23] = {Name="Unleashed fury", tab=1,idx=9},
	[24] = {Name="Unleashed fury", tab=1,idx=9},
	[25] = {Name="Unleashed fury", tab=1,idx=9},
	[26] = {Name="Unleashed fury", tab=1,idx=9},
	[27] = {Name="Unleashed fury", tab=1,idx=9},

	[28] = {Name="Ferocity", tab=1,idx=11},
	[29] = {Name="Ferocity", tab=1,idx=11},
	
	[30] = {Name="Intimidation", tab=1,idx=13},
	
	[31] = {Name="Ferocity", tab=1,idx=11},
	[32] = {Name="Ferocity", tab=1,idx=11},
	[33] = {Name="Ferocity", tab=1,idx=11},

	[34] = {Name="Bestial Discipline", tab=1,idx=14},

	[35] = {Name="Frenzy", tab=1,idx=15},
	[36] = {Name="Frenzy", tab=1,idx=15},
	[37] = {Name="Frenzy", tab=1,idx=15},

	[38] = {Name="Bestial Discipline", tab=1,idx=14},

	[39] = {Name="imp mend pet", tab=1,idx=10},

	[40] = {Name="Bestial Wrath", tab=1,idx=16},

	[41] = {Name="Efficiency", tab=2,idx=2},
	[42] = {Name="Efficiency", tab=2,idx=2},
	[43] = {Name="Efficiency", tab=2,idx=2},
	[44] = {Name="Efficiency", tab=2,idx=2},
	[45] = {Name="Efficiency", tab=2,idx=2},

	[46] = {Name="Lethal Shots", tab=2,idx=4},
	[47] = {Name="Lethal Shots", tab=2,idx=4},
	[48] = {Name="Lethal Shots", tab=2,idx=4},
	[49] = {Name="Lethal Shots", tab=2,idx=4},
	[50] = {Name="Lethal Shots", tab=2,idx=4},

	[51] = {Name="Hawkeye", tab=2,idx=7},
	[52] = {Name="Hawkeye", tab=2,idx=7},
	[53] = {Name="Hawkeye", tab=2,idx=7},

	[54] = {Name="Imp concussive shot", tab=2,idx=1},
	[55] = {Name="Imp concussive shot", tab=2,idx=1},

	[56] = {Name="Mortal Shots", tab=2,idx=9},
	[57] = {Name="Mortal Shots", tab=2,idx=9},
	[58] = {Name="Mortal Shots", tab=2,idx=9},
	[59] = {Name="Mortal Shots", tab=2,idx=9},
	[60] = {Name="Mortal Shots", tab=2,idx=9},
}

function _print( msg )
    if not DEFAULT_CHAT_FRAME then return end
    DEFAULT_CHAT_FRAME:AddMessage ( msg )
    ChatFrame3:AddMessage ( msg )
    ChatFrame4:AddMessage ( msg )
end
