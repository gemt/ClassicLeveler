-- Author      : G3m7
-- Create Date : 4/23/2019 8:37:41 PM

function TPButton_OnClick()
	local tab,idx = getTpIdx();
	_print(tab..idx)
	LearnTalent(tab, idx);
	talent:Hide();
end

function getTpIdx()
	-- imp aspect of hawk
	local lvl = UnitLevel("player");
	if lvl == 10 then return 1,1 end
	if lvl == 11 then return 1,1 end
	if lvl == 12 then return 1,1 end
	if lvl == 13 then return 1,1 end
	if lvl == 14 then return 1,1 end

	-- thick hide
	if lvl == 15 then return 1,5 end
	if lvl == 16 then return 1,5 end
	if lvl == 17 then return 1,5 end
	
	-- imp revive pet
	if lvl == 18 then return 1,6 end
	if lvl == 19 then return 1,6 end

	-- pathfinding
	if lvl == 20 then return 1,7 end
	if lvl == 21 then return 1,7 end

	--beastail swiftness
	if lvl == 22 then return 1,8 end

	-- unleashed fury
	if lvl == 23 then return 1,9 end
	if lvl == 24 then return 1,9 end
	if lvl == 25 then return 1,9 end
	if lvl == 26 then return 1,9 end
	if lvl == 27 then return 1,9 end

	-- Ferocity
	if lvl == 28 then return 1,11 end
	if lvl == 29 then return 1,11 end

	-- Intimidation
	if lvl == 30 then return 1,13 end

	-- ferocity
	if lvl == 31 then return 1,11 end
	if lvl == 32 then return 1,11 end
	if lvl == 33 then return 1,11 end

	-- Bestial Discipline
	if lvl == 34 then return 1,14 end

	-- Frenzy
	if lvl == 35 then return 1,15 end
	if lvl == 36 then return 1,15 end
	if lvl == 37 then return 1,15 end

	-- Bestial Discipline
	if lvl == 38 then return 1,14 end

	-- imp mend pet
	if lvl == 39 then return 1,10 end


	-- Bestial Wrath
	if lvl == 40 then return 1,16 end


	-- efficiency
	if lvl == 41 then return 2,2 end
	if lvl == 42 then return 2,2 end
	if lvl == 43 then return 2,2 end
	if lvl == 44 then return 2,2 end
	if lvl == 45 then return 2,2 end
	
	-- Lethal Shots
	if lvl == 46 then return 2,4 end
	if lvl == 47 then return 2,4 end
	if lvl == 48 then return 2,4 end
	if lvl == 49 then return 2,4 end
	if lvl == 50 then return 2,4 end

	-- Hawkeye
	if lvl == 51 then return 2,7 end
	if lvl == 52 then return 2,7 end
	if lvl == 53 then return 2,7 end

	-- Imp concussive shot
	if lvl == 54 then return 2,1 end
	if lvl == 55 then return 2,1 end

	-- Mortal Shots
	if lvl == 56 then return 2,9 end
	if lvl == 57 then return 2,9 end
	if lvl == 58 then return 2,9 end
	if lvl == 59 then return 2,9 end
	if lvl == 60 then return 2,9 end
end

function CloseBtn_OnClick()
	talent:Hide();
end
