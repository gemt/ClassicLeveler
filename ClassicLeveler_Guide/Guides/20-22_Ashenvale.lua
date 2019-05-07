-- Author      : G3m7
-- Create Date : 5/5/2019 2:32:24 PM


CLGuide_Ashenvale = {
	Title="20-22 Ashenvale",
	Pinboard = {},
	Steps = {

        {Text="Accept The Tower of Althalaxx", At="The Tower of Althalaxx", point={x=2619,y=3872}},
        {Text="Accept Bathran's Hair", At="Bathran's Hair", point={x=2642,y=3854}},
        
        {Text="Grind cultist mobs until Glowing Soul Gem Drops", Ct="The Tower of Althalaxx", point={x=3038,y=3181}},
        {Text="Finish Bathran's Hair to the north (bags on ground)", Ct="Bathran's Hair", point={x=3114,y=2470}},
        {Text="Deliver Bathran's Hair", Dt={q="Bathran's Hair"}, point={x=2643,y=3860}},
        {Text="Deliver The Tower of Althalaxx (skip followup)", Dt={q="The Tower of Althalaxx"}, point={x=2617,y=3870}},
        {Text="Accept Orendil's Cure (may need to wait for RP)", At="Orendil's Cure", point={x=2642,y=3854}},

        {Text="Deliver Therylune's Escape (if you did it)", Dt={q="Therylune's Escape"}, point={x=2263,y=5191}},
        {Text="Run to Astranaar", Proximity=40, point={x=3379,y=4802}},
        {Text="Accept The Zoram Strand", At="The Zoram Strand", point={x=3467,y=4883}},
        {Text="Accept On Guard in Stonetalon", At="On Guard in Stonetalon", point={x=3491,y=4979}},
        {Text="Accept Journey to Stonetalon Peak", At="Journey to Stonetalon Peak", point={x=3576,y=4910}},

        {Text="Accept Culling the Threat", At="Culling the Threat", point={x=3663,y=4961}},
        {Text="Accept Raene's Cleansing", At="Raene's Cleansing", point={x=3663,y=4961}},
        
        {Text="Set HS in Astranaar", SetHs="Innkeeper Kimlya", point={x=3699,y=4922}},

        {Text="Deliver Orendil's Cure", Dt={q="Orendil's Cure"}, point={x=3733,y=5182}},
        {Text="Accept Elune's Tear (few seconds of RP)", At="Elune's Tear", point={x=3733,y=5182}},
        
        
        -- 3min to run to silverwind refugee
        -- ~2min 18sec fligth to auberdine
        {Text="Fly to Auberdine", Taxi="Auberdine, Darkshore", point={x=3440,y=4798}},
        {Text="==== RESTOCK On Longjaw Mud Snapper ====", BuyItem={Npc="Laird", Item="Longjaw Mud Snapper", Count=20}, point={x=3674,y=4429}},

        --{Text="Deliver WANTED: Murkdeep!", Dt={q="WANTED: Murkdeep!"}, point={x=3771,y=4339}},
        {Text="Deliver WANTED: Murkdeep! (can abandon now if still not done)", Dt={q="WANTED: Murkdeep!", Item="Ridgeback Bracers", Use=1}, point={x=3771,y=4339}},
        
        {Text="Deliver The Absent Minded Prospector", Dt={q="The Absent Minded Prospector"}, point={x=3745,y=4186}},
        {Text="Accept The Absent Minded Prospector", At="The Absent Minded Prospector", point={x=3745,y=4186}},
        {Text="Deliver Escape Through Force (new belt)", Dt={q="Escape Through Force"}, point={x=3937,y=4348}},
        {Text="Accept Trek To Ashenvale from mob that comes running into the house", At="Trek to Ashenvale"},

        
        -- ca 1min20s
        {Text="Fly to Rut'Theran Village", Taxi="Rut'Theran Village, Teldrassil", point={x=3634,y=4558}},
        
        -- ===== START SETTING UP BANK CHAR NOW WHILE FLYING ======
        
        {Text="Enter Darnassus", Zone="Darnassus", point={x=5599,y=8966}},
        
        {Text="Train Hunter skills", 
            TrainSkill={
                {n="Aspect of the Hawk",r="Rank 2", Actionbar=49},
                {n="Aspect of the Cheetah", Actionbar=51},
                {n="Mend Pet",r="Rank 2", Actionbar=62},
                {n="Dual Wield"},
                {n="Serpent Sting",r="Rank 3", Actionbar=1},
                {n="Multi-Shot",r="Rank 1", Actionbar=4},
                {n="Arcane Shot",r="Rank 3", Actionbar=3},
                {n="Distracting Shot",r="Rank 1", Actionbar=8},
                {n="Immolation Trap",r="Rank 1", Actionbar=65},
                {n="Raptor Strike",r="Rank 3", Actionbar=2},
                {n="Raptor Strike",r="Rank 3", Actionbar=2},
                {n="Disengage",r="Rank 1", Actionbar=10},
                
                {n="Track Beasts", Actionbar=47},
                {n="Track Humanoids", Actionbar=46},
                {n="Track Undead", Actionbar=48},
            }, point={x=3981,y=1614}
        },
        {Text="Train Pet skills (up the ramp)", 
            TrainSkill={
                {n="Great Stamina",r="Rank 2"},
                {n="Natural Armor",r="Rank 3"},
                {n="Growl",r="Rank 3"},
                
                {n="Fire Resistance",r="Rank 1"},
                {n="Frost Resistance",r="Rank 1"},
                {n="Nature Resistance",r="Rank 1"},
                {n="Shadow Resistance",r="Rank 1"},

                -- resistances?? what am i going to be grinding most of to 30? shadow in duskwood? 
            }, point={x=4284,y=1006}
        },
        
        {Text="Use Aspect of Cheetah, Buy Heavy Recurve Bow from Bow Merchant (south of warriors terrace, third house left)", 
            BuyItem={Npc="Landria", Item="Heavy Recurve Bow", Count=1}, point={x=6326,y=6620}, PinAdd="Can train staves again now if forgot earlier"},

        {Text="=== RESTOCK Sharp Arrow ===", BuyItem={Npc="Landria", Item="Sharp Arrow", Count=1200}, point={x=6326,y=6620}},

        {Text="Deliver The Absent Minded Prospector", Dt={q="The Absent Minded Prospector", Item="Windfelt Gloves", Use=1}, point={x=3127,y=8444}},
        {Text="Accept The Absent Minded Prospector", At="The Absent Minded Prospector", point={x=3127,y=8444}},

        {Text="Heartstone to Astranaar", Zone="Ashenvale", UseItem="Hearthstone"},

        {Text="Deliver Trek to Ashenvale", Dt={q="Trek to Ashenvale"}, point={x=3662,y=4958}},

        {Text="Deliver Raene's Cleansing", Dt={q="Raene's Cleansing"}, point={x=2031,y=4235}},
        {Text="Accept Raene's Cleansing", At="Raene's Cleansing", point={x=2031,y=4235}},
        {Text="Complete Raene's Cleansing (Grind murlocs until Glowing Gem drops)", Ct="Raene's Cleansing"},

        {Text="Accept The Ancient Statuette", At="The Ancient Statuette", point={x=1479,y=3129}},
        {Text="Loot Ancient Statuette", Ct="The Ancient Statuette", point={x=1419,y=2064}, PinAdd="Need 20 Wrathtail Heads here. Casters are squishy"},
        {Text="Deliver The Ancient Statuette", Dt={q="The Ancient Statuette"}, point={x=1479,y=3129}},
        {Text="Accept Ruuzel (May need to wait for RP)", At="Ruuzel", point={x=1479,y=3129}, PinAdd="Need lvl 21 after Zoram, so grind extra if needed"},

        {Text="Kill Ruuzel. Careful with pulls. Priests heal, Myrmidons are tanky", Ct="Ruuzel", point={x=783,y=1377}},
        {Text="Deliver Ruuzel. Make sure to finish 20 Wrathtail Heads on way back", Dt={q="Ruuzel"}, point={x=1479,y=3129}},
        {Text="Reminder again, finish The Zoram Strand (Wrathtail Heads)", Ct="The Zoram Strand"},
        {Text="Make sure to be lvl 21 before going back to Astranaar", Lvl={lvl=21, xp=1000}},
        
        {Text="Run to Astranaar. Use the new robe. Can Heartstone if available", Proximity=40, point={x=3379,y=4802}},
        {Text="Deliver The Zoram Strand", Dt={q="The Zoram Strand"}, point={x=3467,y=4883}},
        {Text="Accept Pridewings of Stonetalon", At="Pridewings of Stonetalon", point={x=3467,y=4883}},

        {Text="Deliver Raene's Cleansing", Dt={q="Raene's Cleansing"}, point={x=3663,y=4958}},
        {Text="Accept Raene's Cleansing", At="Raene's Cleansing", point={x=3663,y=4958}},
        {Text="Accept An Aggressive Defense", At="An Aggressive Defense", point={x=3663,y=4958}},
        -- 8h 40min, lvl 21+15%
        
        {Text="Stable pet", Proximity=10, point={x=3651,y=5036}},
        {Text="Make sure to have Elune's Tear (followup from Orendil's Cure)", Proximity=15, point={x=3733,y=5182}},

        {Text="Tame an Ashenvale Bear lvl 21-22", Proximity=50, point={x=4422,y=5498}},

        {Text="Run north towards Iris Lake", Proximity=50, point={x=4342,y=4585}},
        {Text="Complete Elune's Tear (white thing on ground on the isle)", Ct="Elune's Tear", point={x=4623,y=4592}},
        
        {Text="Grind to Dal Bloodclaw. Make sure new Claw is learned", Ct="Culling the Threat", point={x=3773,y=3473}},
        
        {Text="Run back to Astranaar, deliver Culling the Threat", Dt={q="Culling the Threat"}, point={x=3662,y=4958}},
        
        {Text="Abandon bear, get pet back from stable master", Proximity=10, point={x=3649,y=5034}},
        {Text="Deliver Elune's Tear", Dt={q="Elune's Tear"}, point={x=3734,y=5180}},
        {Text="Accept The Ruins of Stardust (few sec of RP)", At="The Ruins of Stardust", point={x=3734,y=5180}},
        {Text="Complete The Ruins of Stardust (careful with pulls)", Ct="The Ruins of Stardust", point={x=3434,y=6484}},

 
        {Text="Run east and Accept Elemental Bracers", At="Elemental Bracers", point={x=4981,y=6722}},
        {Text="Loot 5 Intact Elemental Bracer in the lake", Item={Name="Intact Elemental Bracer", Count=5}},
        {Text="Use Divining Scroll to complete Elemental Bracer", Ct="Elemental Bracers", UseItem="Divining Scroll"},
        {Text="Deliver Elemental Bracers (skip followup)", Dt={q="Elemental Bracers"}, point={x=4981,y=6722}},
        
        {Text="Complete An Aggressive Defense to the north", Ct="An Aggressive Defense", point={x=5069,y=6122}},

        {Text="Deliver Raene's Cleansing to the north (skip followup)", Dt={q="Raene's Cleansing"}, point={x=5354,y=4621}},

        {Text="Run into Stonetalon Mountains", Proximity=50, point={x=4301,y=7139}},
--[[        

Probably skip running up to turn in Raene's Cleansing (825 XP), the followup WONT be done so its just a detour
	The run up and down from the road takes 3 minutes + killing 2 mobs. Maybe not so bad after all?
	
    ]]



    }
}
--[[

Redridge:
pick Encroaching Gnolls on road to city
Turn in Encroaching Gnolls by FP
Get FP
Quests to do:
	The price of shoes
	Hillary's Necklace (on the pier)
	The Lost tools (from Foreman Oslow by the bridge)
	An unwelcome Guest (bellygrub)
	Selling Fish
	Murloc Poachers

	
do hillary's necklace and an unwelcome guest
turn in
kill murlocs to finish selling fish and murloc poachers
Loot the lost tools

11h13min
====== RUN DUSKWOOD ======


continue east on norther part of lake to finish up murlocs, then go up north and finish blackrock menace
conitnue east and do solomon's law and Wanted: Lieutenant Fangore
Turn inn Looking Further all the way east by the gnolls (84,46) Skip followup, need to kill mass elites


Run to Darkshire




]]