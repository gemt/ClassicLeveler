-- Author      : G3m7
-- Create Date : 5/5/2019 5:18:53 PM

CLGuide_Wetlands = {
    Title="26-28 Wetlands",
    Pinboard = {},
    Steps = {
        {Text="Deliver Claws from the Deep at pier", Dt={q="Claws from the Deep"}, point={x=832,y=5855}},
        {Text="Accept Reclaiming Goods", At="Reclaiming Goods", point={x=832,y=5855}},

        {Text="Buy lvl 25 food from Stuart Flemming (Rockscale Cod)", BuyItem={Npc="Stuart Fleming", Item="Rockscale Cod", Count=20}, point={x=804,y=5833}},

        {Text="Deliver Daily Delivery (may not have it due to IF Rep)", Dt={q="Daily Delivery"}, point={x=854,y=5574}},
        {Text="Deliver Young Crocolisk Skins (may not have it due to IF Rep)", Dt={q="Young Crocolisk Skins"}, point={x=854,y=5574}},
        {Text="Accept Apprentice's Duties (same as with Qs above)", At="Apprentice's Duties", point={x=854,y=5574}},
        
        {Text="Accept Report to Captain Stoutfist (just inside Keep)", At="Report to Captain Stoutfist", point={x=1009,y=5690},
            PinAdd="Check for Bronze Tube again (left,left)"},
        {Text="Deliver the report at keep mainhall (second floor)", Dt={q="Report to Captain Stoutfist"}, point={x=985,y=5750}},
        {Text="Accept War Banners", At="War Banners", point={x=985,y=5750}},

        {Text="Accept Digging Through Ooze (go out again)", At="Digging Through the Ooze", point={x=1179,y=5798}},
        
        {Text="Buy Razor Arrows.", BuyItem={Npc="Naela Trance", Item="Razor Arrow", Count=2000}, point={x=1129,y=5830}},

        {Text="Accept The Third Fleet", At="The Third Fleet", point={x=1089,y=5967}},
        {Text="Buy Flagon of Mead from innkeeper for Q", BuyItem={Npc="Innkeeper Helbrek", Item="Flagon of Mead", Count=1}, point={x=1069,y=6089}},

        {Text="Accept The Absent Minded Prospector (second floor Inn)", At="The Absent Minded Prospector", point={x=1084,y=6042}},

        {Text="Deliver The Third Fleet", Dt={q="The Third Fleet"}, point={x=1089,y=5967}},
        {Text="Accept The Cursed Crew", At="The Cursed Crew", point={x=1089,y=5967}},

        {Text="Accept In Search of The Excavation Team (at the bridge out)", At="In Search of The Excavation Team", point={x=1150,y=5213},
            PinAdd="Always kill Oozes in wetlands for Digging through the Ooze"},

        {Text="Run to excavation site (only kill oozes on the way) Accept Ormer's Revenge", At="Ormer's Revenge", point={x=3818,y=5089}},
        {Text="Accept Uncovering the Past", At="Uncovering the Past", point={x=3880,y=5237}},

        {Text="Deliver In Search of The Excavation Team", Dt={q="In Search of The Excavation Team"}, point={x=3891,y=5234}},

        {Text="Accept In Search of The Excavation Team", At="In Search of The Excavation Team", point={x=3891,y=5234}},
        {Text="Loot Flagonaut's Fossil", Item={Name="Glagongut's Fossil", Count=1}, point={x=3885,y=5219}},


        {Text="Run out of Excavation Site and complete Ormer's Revenge and Prospector", Mct={"Ormer's Revenge", "The Absent Minded Prospector"},
            point={x=3357,y=4078}},
        {Text="Turn inn Accept Ormer's Revenge back in Excavation Site", Dt={q="Ormer's Revenge"}, point={x=3818,y=5089}},
        {Text="Accept Accept Ormer's Revenge", At="Ormer's Revenge", point={x=3818,y=5089}},

        {Text="Complete Ormer's Revenge and Uncovering the Past below", Mct={"Ormer's Revenge", "Uncovering the Past"}},

        {Text="Turn inn Accept Ormer's Revenge back up top", Dt={q="Ormer's Revenge"}, point={x=3818,y=5089}},
        {Text="Accept Accept Ormer's Revenge", At="Ormer's Revenge", point={x=3818,y=5089}},
        {Text="Turn inn Uncovering the Past", Dt={q="Uncovering the Past"}, point={x=3881,y=5239}},

        {Text="Kill Sarltooth (NEED TO LOOT IT). Jump down to the left to avoid going around", Ct="Ormer's Revenge", point={x=3398,y=5227}},
        {Text="Turn inn Accept Ormer's Revenge back up top", Dt={q="Ormer's Revenge", Item="Raptor's End", Use=1}, point={x=3818,y=5089}},

        {Text="Complete War Banners to the east", Ct="War Banners", point={x=4317,y=4145}},
        --lvl 26, 13h51min
        {Text="Clean bags at vendor by xroads. May sell Healing Potion", Proximity=20, point={x=5019,y=3776}},

        {Text="Deliver Tramping Paws at the Greenwarden", Dt={q="Tramping Paws"}, point={x=5636,y=4040}},
        {Text="Accept Fire Taboo", At="Fire Taboo", point={x=5636,y=4040}},
        {Text="Complete Fire Taboo to the south (Fenrunner, Mistweaver, Trapper only)", Ct="Fire Taboo", point={x=6132,y=5925}},
        {Text="Continue south to below the dam and loot Musquash Root", Item={Name="Musquash Root", Count=1}, point={x=6479,y=7531}},

        {Text="Deliver Fire Taboo", Dt={q="Fire Taboo"}, point={x=5636,y=4040}},
        {Text="Accept Blisters on The Land", At="Blisters on The Land", point={x=5636,y=4040}},

        -- grind oozes at ironbrands tomb or not ?
        -- check engineer dude for copper thingie if missing

        {Text="Complete Blisters on The Land while running all the way west (can complete later too)", Ct="Blisters on The Land", point={x=1398,y=3051}},
        {Text="Complete Apprentice's Duties around the ships", Ct="Apprentice's Duties", point={x=1398,y=3051}},

        {Text="Complete The Cursed Crew (Can use water-breathing here). Snuffbox from Snelling in southern ship (below)", Ct="The Cursed Crew", 
            point={x=1398,y=3051}, UseItem="Elixir of Water Breathing"},
        --[[
        Careful with this, pull properly back and take it slow
        TIP: go southern ship. Clear around outside first. Then use the crack entrance in the rear of the ship and carefully move upwards.
	        pet on passive, even stay some places.
	        Always palce a frost trap
	        Also enter from water in the front
        ]]
        
        {Text="Deliver Reclaming Goods (crate in mid of murloc camp)", Dt={q="Reclaiming Goods"}, point={x=1350,y=4139}},
        {Text="Accept The Search Continues", At="The Search Continues", point={x=1350,y=4139}},

        {Text="Deliver In Search of The Excavation Team", Dt={q="In Search of The Excavation Team"}, point={x=1153,y=5215}},

        -- TODO: Do we get a better cloak (5stam) anytime soon? Would be nice to choose the mail legs for vendor instead
        {Text="Deliver Apprentice's Duties", Dt={q="Apprentice's Duties", Item="Resilient Poncho", Use=1}, point={x=854,y=5574}},

        {Text="Deliver War Banners (in the keep)", Dt={q="War Banners"}, point={x=991,y=5738}},
        {Text="Accept Nek'rosh's Gambit", At="Nek'rosh's Gambit", point={x=991,y=5738}},


        {Text="Deliver The Cursed Crew", Dt={q="The Cursed Crew"}, point={x=1091,y=5964}},
        {Text="Accept Lifting the Curse", At="Lifting the Curse", point={x=1091,y=5964}},
        {Text="Deliver The Absent Minded Prospector (2nd floor Inn) - No followup", Dt={q="The Absent Minded Prospector", Item="Skullchipper", Vendor=1}, point={x=1082,y=6041}},
        
        {Text="Buy Razor Arrows (outside)", BuyItem={Npc="Naela Trance", Item="Razor Arrow", Count=2000}, point={x=1129,y=5830}},

        --14h35m 26+80%

        {Text="Turn inn The Search Continues", Dt={q="The Search Continues"}, point={x=1360,y=3820}},
        {Text="Accept Search More Hovels", At="Search More Hovels", point={x=1360,y=3820}},

        {Text="Turn inn Search More Hovels", Dt={q="Search More Hovels"}, point={x=1398,y=3477}},
        {Text="Accept Return the Statuette", At="Return the Statuette", point={x=1398,y=3477}},


        {Text="Kill Captain Halyndor on northern ship. Use rudder north to access him. Loot Key", 
            Item={Name="Intrepid Strongbox Key", Count=1}, point={x=1607,y=2306}},
        --[[
        run on the rudder on the back. Put pet on stay. 
	    go into water close to shore. 
	    Send pet on boss
	    call back and kite boss up on land
        ]]
        {Text="Deliver Lifting the Curse on box under boat. Enter towards ocean", Dt={q="Lifting the Curse"}, point={x=1441,y=2401}},

        {Text="Accept The Eye of Paleth", At="The Eye of Paleth", point={x=1441,y=2401}},
        
        {Text="Complete Blisters on The Land towards vendor at xroads", Ct="Blisters on The Land", Proximity=20, point={x=5019,y=3776}},
        {Text="Clean bags at vendor by xroads. May sell Healing Potion", Proximity=20, point={x=5019,y=3776}},
        {Text="Deliver Blisters on The Land", Dt={q="Blisters on The Land", Item="Fen Keeper Robe", Use=1}, point={x=5636,y=4040}},

        {Text="Enter orc place this way", Proximity=40, point={x=5133,y=4620}},
        {Text="Deliver Nek'rosh's Gambit the catapult (careful pulls, they net)", Dt={q="Nek'rosh's Gambit"}, point={x=4745,y=4706}},
        {Text="Accept Defeat Nek'rosh", At="Defeat Nek'rosh", point={x=4745,y=4706}},
        {Text="Run out and around to the South-East. Pull Nek'Rosh from the hill and kite to Menethil. Care for crocs. Prep pots", Ct="Defeat Nek'rosh", point={x=5492,y=5614}},

        -- TODO: any chance we want to use this 2h sword instead of wendor?
        {Text="Deliver Nek'Rosh (in the keep)", Dt={q="Defeat Nek'rosh", Item="Ancient War Sword", Vendor=1}, point={x=986,y=5749}},
        -- TOOD: any chance we got better boots already? big gold from staff reward instead
        {Text="Deliver Return the Statuette", Dt={q="Return the Statuette", Item="Mariner Boots", Use=1}, point={x=830,y=5854}},
        {Text="Deliver Digging Through the Ooze", Dt={q="Digging Through the Ooze", Use=1}, point={x=1179,y=5799}},
        
        {Text="Buy Razor Arrows (outside)", BuyItem={Npc="Naela Trance", Item="Razor Arrow", Count=2000}, point={x=1129,y=5830}},

        {Text="Deliver The Eye of Paleth (in the Inn, 1st floor)", Dt={q="The Eye of Paleth"}, point={x=1060,y=6057}},
        {Text="Accept Cleansing the Eye", At="Cleansing the Eye", point={x=1060,y=6057}},

        {Text="Heartstone to Duskwood", Zone="Duskwood", UseItem="Hearthstone"},
        -- was 27.5 during test run here
    }
}
--[[

27.5 here

????
======= HEARTSTONE TO DUSKWOOD ===========

]]