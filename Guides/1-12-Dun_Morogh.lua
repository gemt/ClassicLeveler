-- Author      : Ryts
-- Create Date : Work in progress

CLGuide_DunMorogh = {
	Title="1-12 Dun Morogh",
	Pinboard = {},
	Steps = {
			-- Coldridge Valley
			{Text="Accept \"Dwarven Outfitters\" from Sten Stoutarm", At="Dwarven Outfitters", point={x=2993,y=7120}},
			{Text="Complete \"Dwarven Outfitters\"", Ct="Dwarven Outfitters"},
			{Text="Turn in \"Dwarven Outfitters\"", Dt={q="Dwarven Outfitters", Item="Boar Handler Gloves", Use=1}, point={x=2993,y=7120}},
			{Text="Accept \"Coldridge Valley Mail Delivery\" from Sten Stoutarm", At="Coldridge Valley Mail Delivery", point={x=2993,y=7120}},
			{Text="Accept \"Consecrated Rune\" from Sten Stoutarm", At="Consecrated Rune", point={x=2993,y=7120}}, 								                    -- pala
			{Text="Accept \"A New Threat\" from Balir Frosthammer", At="A New Threat", point={x=2971,y=7125}},
			{Text="Turn in \"Consecrated Rune\" and learn Devotion Aura R1", Dt={q="Consecrated Rune"}, point={x=2883,y=6833}}, 									-- pala
			{Text="Kill 6 Burly Rockjaw Troggs", point={x=2686,y=7273}, Proximity=20},
			{Text="Turn in \"Coldridge Valley Mail Delivery\"", Dt={q="Coldridge Valley Mail Delivery"}, point={x=2260,y=7143}},
			{Text="Accept \"Coldridge Valley Mail Delivery\" from Talin Keeneye", At="Coldridge Valley Mail Delivery", point={x=2260,y=7143}},
			{Text="Accept \"The Boar Hunter\" from Talin Keeneye", At="The Boar Hunter", point={x=2260,y=7143}},
			{Text="Complete \"The Boar Hunter\"", Ct="The Boar Hunter"},
			{Text="Turn in \"The Boar Hunter\"", Dt={q="The Boar Hunter", Item="Dwarven Leather Pants", Use=1}, point={x=2260,y=7143}},
			{Text="Turn in \"Coldridge Valley Mail Delivery\"", Dt={q="Coldridge Valley Mail Delivery"}, point={x=2508,y=7572}},
			{Text="Accept \"The Troll Cave\" from Grelin Whitebeard", At="The Troll Cave", point={x=2508,y=7572}},
			{Text="Kill Frostmane Troll Whelp until level 4", point={x=2656,y=7925}, Lvl={lvl=4}}, 																	-- test lvl when implemented
			{Text="Accept \"Scalding Mornbrew Delivery\" from Nori Pridedrift", At="Scalding Mornbrew Delivery", point={x=2497,y=7595}},
			{Text="Hearthstone", point={x=2987,y=7198}, Proximity=15},
			{Text="Accept \"A Refugee's Quandary\" from Felix Whindlebolt", At="A Refugee's Quandary", point={x=2855,y=6765}},
			{Text="Turn in \"Scalding Mornbrew Delivery\"", Dt={q="Scalding Mornbrew Delivery"}, point={x=2877,y=6637}},
			{Text="Accept \"Bring Back the Mug\" from Durnan Furcutter", At="Bring Back the Mug", point={x=2877,y=6637}},
			-- train 4 step
			{Text="Complete \"A New Threat\"", Ct="A New Threat", point={x=3112,y=7400}},
			{Text="Turn in \"A New Threat\"", Dt={q="A New Threat", Item="Rustic Belt", Use=1}, point={x=2971,y=7125}},
			{Text="Get Felix's Bucket of Bolts", point={x=2642,y=7932}, Proximity=15},
			{Text="Get Felix's Chest", point={x=2277,y=8000}, Proximity=15},
			{Text="Get Felix's Box", point={x=2088,y=7606}, Proximity=15},
			{Text="Turn in \"Bring Back the Mug\"", Dt={q="Bring Back the Mug"}, point={x=2498,y=7595}},
			{Text="Turn in \"The Troll Cave\"", Dt={q="The Troll Cave", Item="Anvilmar Sledge", Use=1}, point={x=2508,y=7572}},
			{Text="Accept \"The Stolen Journal\" from Grelin Whitebeard", At="The Stolen Journal", point={x=2508,y=7572}},
			{Text="Complete \"The Stolen Journal\" (Hug left wall)", Ct="The Stolen Journal", point={x=3048,y=8016}},
			{Text="Turn in \"The Stolen Journal\"", Dt={q="The Stolen Journal", Item="Smooth Walking Staff"}, point={x=2508,y=7572}},
			{Text="Accept \"Senir's Observations\" from Grelin Whitebeard", At="Senir's Observations", point={x=2508,y=7572}},
			{Text="Turn in \"A Refugee's Quandary\"", Dt={q="A Refugee's Quandary"}, point={x=2855,y=6765}},
			{Text="Turn in \"Senir's Observations\"", Dt={q="Senir's Observations"}, point={x=3348,y=7184}},
			{Text="Accept \"Senir's Observations\" from Mountaineer Talos", At="Senir's Observations", point={x=3348,y=7184}},
			{Text="Accept \"Supplies to Tannok\" from Hands Springsprocket", At="Supplies to Tannok", point={x=3388,y=7224}},
			-- Dun Morogh
			-- ...
	}
}