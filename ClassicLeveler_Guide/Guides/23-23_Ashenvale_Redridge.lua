-- Author      : G3m7
-- Create Date : 5/5/2019 5:17:26 PM

CLGuide_Ashenvale_Redridge = {
    Title="23-23 Ashenvale-Redridge",
    Pinboard = {},
    Steps = {
        {Text="Take the boat to menethil", Zone="Wetlands", point={x=3242,y=4383}},
        {Text="Accept Young Crocolisk Skins (may not be avail. due to rep)", At="Young Crocolisk Skins", point={x=855,y=5574}},
        {Text="Accept Claws from the Deep", At="Claws from the Deep", point={x=832,y=5852}},

        {Text="Discover the FP", Proximity=15, point={x=949,y=5968}},

        {Text="Accept The Greenwarden (outside the inn)", At="The Greenwarden", point={x=1089,y=5967}},
        {Text="Deliver The Absent Minded Prospector (second floor, Inn) Skip followup.", Dt={q="The Absent Minded Prospector"}, point={x=1084,y=6042}},
        
        {Text="Restock on Arrows. Buy Heavy Recurve Bow and Medium Quiver if not done yet",
            BuyItem={Npc="Naela Trance", Item="Sharp Arrow", Count=1200}, point={x=1128,y=5834}},

        {Text="Enter the keep, take left 2 times, buy Bronze Tube from Neal Allen", 
            BuyItem={Npc="Neal Allen", Item="Bronze Tube", Count=1}, point={x=1074,y=5678}},
        
        {Text="Complete Claws from the Deep (Gobbler is point). KEEP THE MURLOC FINS", Ct="Claws from the Deep", point={x=1807,y=3974}},
        
        {Text="If you do not have a Bronze Tube, run NE and check Fradd Swiftgear", 
            BuyItem={Npc="Fradd Swiftgear", Item="Bronze Tube", Count=1}, point={x=2640,y=2576}},
        {Text="If you went for bronze tube: Check Wenna Silkbeard inside house for Saber Leggings", 
            BuyItem={Npc="Wenna Silkbeard", Item="Saber Leggings", Count=1}, point={x=2561,y=2581}},


        {Text="Accept Daily Delivery (may not be avail. due to rep)", At="Daily Delivery", point={x=4992,y=3937},
            PinAdd="Try to get 4x Young Crocolisk skins if you got the quest"},
        {Text="Turn inn The Greenwarden", Dt={q="The Greenwarden"}, point={x=5643,y=4042}},
        {Text="Accept Tramping Paws", At="Tramping Paws", point={x=5643,y=4042}},
        {Text="Complete Tramping Paws (SE)", Ct="Tramping Paws", point={x=6112,y=5717}},

        {Text="Run to Loch Modan", Zone="Loch Modan", point={x=5385,y=7034}},


        {Text="Accept Stormpike's Order (Mountaineer Stormpike inside building)", At="Stormpike's Order", point={x=2467,y=1835}},
        {Text="Accept Stonegear's Search (Mountaineer Kadrell, patrolling)", At="Stonegear's Search", point={x=3384,y=4831}},
        {Text="Get the FP", Proximity=15, point={x=3394,y=5096}},

        {Text="Run to Dun Morogh", Zone="Dun Morogh", point={x=2173,y=6892}},

        {Text="Turn inn Stonegear's Search (skip followup) at Steelgrill's Depot", Dt={q="Stonegear's Search"}, point={x=4965,y=4856}},
        {Text="Run to Ironforge", Zone="Ironforge", point={x=4724,y=4178}},

        {Text="Train 2H Axe. Anything else needed?", 
            TrainSkill={
                {n="Two-Handed Axes"},
            }, point={x=6121,y=8947}
        },

        {Text="Discover FP", Proximity=50, point={x=5549,y=4770}},

        {Text="Turn inn Wool cloth if have 60", Proximity=200, point={x=4321,y=3166}},

        {Text="Run to Forlorn Cavern for Book: The Powers Below(The Powers Below)", 
           Dt={q="The Powers Below"}, UseItem="Book: The Powers Below", point={x=5100,y=958}},

         {Text="If you do not have a Bronze Tube. Gearcutter Cogspinner at Tinker Town", 
            BuyItem={Npc="Gearcutter Cogspinner", Item="Bronze Tube", Count=1}, point={x=6783,y=4251}},

        {Text="Turn inn An Old Colleague by Tram", Dt={q="An Old Colleague"}, point={x=7206,y=5185}},

        {Text="Take Tram to SW", Zone="Stormwind City"},

         {Text="Train Hunter skills", 
            TrainSkill={
                {n="Hunter's Mark", "Rank 2", Actionbar=11},
            }, point={x=6166,y=1519}
        },

        {Text="Turn Stormpike's Order", Dt={q="Stormpike's Order"}, point={x=5809,y=1655}},

        {Text="If you do not have a Bronze Tube. Billibub Cogspinner", 
            BuyItem={Npc="Billibub Cogspinner", Item="Bronze Tube", Count=1}, point={x=5521,y=705}},

        {Text="Turn inn A Scroll from Mauren (Mage Quarter) Skip Followup", Dt={q="A Scroll from Mauren"}, point={x=4309,y=8038}},

        {Text="Train 2H Swords (across AH). Polearms?", 
            TrainSkill={
                {n="Two-Handed Swords"},
            }, point={x=5706,y=5751}
        },

        {Text="Discover FP", Proximity=50, point={x=6629,y=6215}},
        
        {Text="Run out of SW", Zone="Elwynn Forest", point={x=7051,y=8763}},

        {Text="Run out of SW to Tower of Azora. Accept A Watchful Eye (top)", At="A Watchful Eye", point={x=6522,y=6971}},

        {Text="Run to Redridge", Zone="Redridge Mountains", point={x=9384,y=7221}},
    }
}

--[[

Turn in An Old Colleague (Tinker Town) - NOTE: IF possible to get 4 minor mana pot and 2 elixir of minor fortitude, do that followup
These quests probably wont work on classic (seasonal)
	find Courier Hammerfall (patroll anti-clockwise?) around entire outer circle. Accept The reason for the season (CHECK BETA ON THIS ONE; IS SEASONAL)
	Turnin The reason for the season (if found) innermost in hall of explorers 
	Deliver followup to king

]]