-- Author      : G3m7
-- Create Date : 5/5/2019 9:29:51 AM

CLGuide_Darkshore = {
    Title="11-20 Darkshore",
    Pinboard = {},
    Steps = {
	    {Text="Accept washed ashore (by FP)", At="Washed Ashore", point={x=3662,y=4559}},
	    {Text="Turn inn Flight to Auberdine", Dt={q="Flight to Auberdine"}, point={x=3677,y=4428}},
	    {Text="Accept Return to Nessa", At="Return to Nessa", point={x=3677,y=4428}},
	    {Text="==== RESTOCK On Longjaw Mud Snapper ====", BuyItem={Npc="Laird", Item="Longjaw Mud Snapper", Count=20}, point={x=3674,y=4429}},
	    {Text="Accept buzzbox (second floor innkeeper)", At="Buzzbox 827", point={x=3697,y=4413}},
	    {Text="Accept Bashal'Aran (Thundris Windweaver, north mainhouse)", At="Bashal'Aran", point={x=3740,y=4013}},
	    {Text="=== RESTOCK Sharp Arrow ===", BuyItem={Npc="Dalmond", Item="Sharp Arrow", Count=1200}, point={x=3744,y=4051}},
	    {Text="Accept Plagued Lands (bear quest dude)", At="Plagued Lands", point={x=3884,y=4341}},
	    {Text="Accept How Big a Threat?", At="How Big a Threat?", point={x=3938,y=4348}},
	    {Text="Tame a moonstalker", point={x=4418,y=3630}},
	    {Text="Turn inn Bashal'Aran", Dt={q="Bashal'Aran"}, point={x=4418,y=3630}, PinAdd="Grind as much as you can here if alone"},
	    {Text="Accept Bashal'Aran pt2", At="Bashal'Aran", point={x=4418,y=3630}},
	    {Text="Complete Bashal'Aran pt2 (rings)", Ct="Bashal'Aran" },
	    {Text="Turn inn Bashal'Aran pt2", Dt={q="Bashal'Aran"}, point={x=4418,y=3630}},
	    {Text="Accept Bashal'Aran p3", At="Bashal'Aran", point={x=4418,y=3630}},
	    {Text="Complete Bashal'Aran pt3 (Ancient Moonstone from satyrs)", Ct="Bashal'Aran" },
	    {Text="Turn inn Bashal'Aran pt3", Dt={q="Bashal'Aran"}, point={x=4418,y=3630}},
	    {Text="Accept Bashal'Aran pt4", At="Bashal'Aran", point={x=4418,y=3630}, PinRemove="Grind as much as you can here if alone"},
	    {Text="trap a grizzly bear (Plagued Lands)", Ct="Plagued Lands", point={x=4421,y=3196}},
	    {Text="Grind to close to 13 on moonkins, have at leas 9 eggs", Item={Name="Small Egg", Count=9}, point={x=4517,y=4519}},
	    {Text="Swing my furbolog camp for How big a threat", Ct="How Big a Threat?", point={x=3985,y=5393}},
	    {Text="can kill striders too for strider meat (cooking quest)"},
	    {Text="Turn inn plagued lands", Dt={q="Plagued Lands"}, point={x=3884,y=4341}},
	    {Text="Accept Cleansing of the Infected", At="Cleansing of the Infected", point={x=3884,y=4341}},
	    {Text="Turn inn how big a threat", Dt={q="How Big a Threat?"}, point={x=3938,y=4348}},
	    {Text="Accept how big a threat ", At="How Big a Threat?", point={x=3938,y=4348}},
	    {Text="Accept Thundris Windweaver", At="Thundris Windweaver", point={x=3938,y=4348}},
	    {Text="Turn inn thundris windweaver", Dt={q="Thundris Windweaver"}, point={x=3739,y=4011}},
	    {Text="Accept The Cliffspring River", At="The Cliffspring River", point={x=3739,y=4011}},
	    {Text="Accept Tools of the Highborne", At="Tools of the Highborne", point={x=3739,y=4011}},
	    {Text="Train cooking to 10. Mild Spices from Gorbold Steelhand by forge"},
	    {Text="Accept easy strider living (cooking)", At="Easy Strider Living", point={x=3769,y=4065}},
	    {Text="Accept the red crystal (outside inn)", point={x=3771,y=4339}, At="The Red Crystal"},
	    {Text="Accept cave mushroms (outside inn)", point={x=3732,y=4365}, At="Cave Mushrooms"},
	    {Text="Complete Washed Ashore by looting beached seacreature", point={x=3640,y=5090}, Ct="Washed Ashore"},
	    {Text="Finish Buzzbox 827 (Pygmy Tide Crawlers)", Ct="Buzzbox 827"},
			
	    {Text="Turn inn buzzbox 827", Dt={q="Buzzbox 827"}, point={x=3665,y=4627}},
	    {Text="Accept Buzzbox 411", At="Buzzbox 411", point={x=3665,y=4627}},

	    {Text="Turn inn washed ashore", Dt={q="Washed Ashore"}, point={x=3662,y=4558}},
	    {Text="Accept washed ashore. Accept pt2", At="Washed Ashore", point={x=3662,y=4558}},

	    {Text="Accept for love eternal (pier)", At="For Love Eternal", point={x=3574,y=4371}},
	    {Text="Loot Sea Turtle Remains (jump in water by boat to menethil)", Ct="Washed Ashore", point={x=3187,y=4628}},
	    {Text="Turn inn Washed Ashore", Dt={q="Washed Ashore", Item="Dryweed Belt", Use=1}, point={x=3662,y=4559}},
	
	    {Text="Complete How Big a Threat?", Ct="How Big a Threat?", point={x=3937,y=5293}},
	    {Text="Accept The Fall of Ameth'Aran", At="The Fall of Ameth'Aran", point={x=4029,y=5973}},
	    {Text="Complete: Bashal'Aran, For Love Eternal, The Fall of Ameth'Aran", Mct={"The Fall of Ameth'Aran", "For Love Eternal", "Bashal'Aran"}},
	    {Text="Deliver The fall of Ameth'Aran", Dt={q="The Fall of Ameth'Aran"}, point={x=4029,y=5973}},

	    {Text="kill rabid thistle bears (20 kills for Cleansing the infected)", Ct="Cleansing of the Infected"},
	    {Text="kill foreststriders (5 strider meat for Easy Strider Lliving)", Item={Name="Small Egg", Count=9}},
	    {Text="SHOULD DING 14 DURING THIS GRIND (but not required)"},
	    {Text="Buzzbox 411 Threshers in water west of ameth'aran", Item={Name="Thresher Eye", Count=3}, point={x=3471,y=5941}},
	    {Text="Loot beached sea turtle at 37,62, south-west of ameth'aran", At="Beached Sea Turtle", point={x=3712,y=6211}},
	    {Text="Loot beached sea creature at 36,70, north-west of onu place", At="Beached Sea Creature",  point={x=3604,y=7089}},

	    {Text="GRIND/RUN BACK TO AUBERDINE - Turn inn Beached Sea turtle", Dt={q="Beached Sea Turtle"}, point={x=3662,y=4559}},
	    {Text="Turn inn Beached Sea creature", Dt={q="Beached Sea Creature"}, point={x=3662,y=4559}},
	
	    {Text="==== RESTOCK On Longjaw Mud Snapper ====", BuyItem={Npc="Laird", Item="Longjaw Mud Snapper", Count=20}, point={x=3674,y=4429}},

	    {Text="Turn inn For love eternal", Dt={q="For Love Eternal"}, point={x=3574,y=4371}},
	    {Text="Make sure you have Quest: The Red Crystal", Ht="The Red Crystal", point={x=3771,y=4339}},

	    {Text="Turn inn Easy Strider Living", Dt={q="Easy Strider Living"}, point={x=3769,y=4065}},
	    {Text="Turn inn Tools of the highborne", Dt={q="Tools of the Highborne"}, point={x=3739,y=4011}},
	    {Text="=== RESTOCK Sharp Arrow ===", BuyItem={Npc="Dalmond", Item="Sharp Arrow", Count=1200}, point={x=3744,y=4051}},
	    {Text="Accept Deep Ocean, Vast Sea (by forge)", At="Deep Ocean, Vast Sea", point={x=3811,y=4118}},
	
	
	    {Text="Turn inn Cleansing the infected", Dt={q="Cleansing of the Infected"}, point={x=3885,y=4342}},
        {Text="Accept Tharnariun's Hope", At="Tharnariun's Hope", point={x=3885,y=4342}},


	    {Text="Turn inn How big a threat", Dt={q="How Big a Threat?"}, point={x=3937,y=4348} },
        {Text="Accept A Lost Master", At="A Lost Master", point={x=3937,y=4348} },

	    {Text="Accept The Tower of Althalaxx (SECOND FLOOR)", At="The Tower of Althalaxx", point={x=3905,y=4356}},
	
	
	    {Text="GRIND to the red crystal. If possible, grind to 15, or close to.", Ct="The Red Crystal", point={x=4737,y=4870}},
	    {Text="GRIND to Bashal'aran and turn in Bashal'Aran", Dt={q="Bashal'Aran", Item="Vagabond Leggings", Use=1}, point={x=4418,y=3630}},

	    {Text="Accept Beached Sea Creature at 42,31 (nw of Bashal'aran)", At="Beached Sea Creature", point={x=4192,y=3155} },
	    {Text="Do Deep ocean, vast sea west of sea creature", Ct="Deep Ocean, Vast Sea", point={x=3884,y=2941}},
			
        {Text="Turn inn buzzbox 411 at 42,28 (close to sea creature above)", Dt={q="Buzzbox 411"}, point={x=4194,y=2862}},
        {Text="Accept 323", At="Buzzbox 323", point={x=4194,y=2862}, PinAdd="Look for moonstalkers for Buzzbox323"},


	    {Text="Grind close to the shore towards auberdine, looking for Moonstalkers for moonstalker fangs (Buzzbox 323)"},

	    {Text="Should be 14 by now"},
	    {Text="Turn inn Deep ocean, vast sea", Dt={q="Deep Ocean, Vast Sea", Item="Noosegrip Gauntlets"}, point={x=3811,y=4115}},
	
	    {Text="=== RESTOCK Sharp Arrow ===", BuyItem={Npc="Dalmond", Item="Sharp Arrow", Count=1200}, point={x=3744,y=4051}},
	    {Text="Turn inn the red crystal", Dt={q="The Red Crystal"}, point={x=3771,y=4339}},
	    {Text="Accept as water cascades", At="As Water Cascades", point={x=3771,y=4339}},
	    {Text="Fill empty water tube in the moonwell", UseItem="Empty Water Tube", Ct="As Water Cascades", point={x=3777,y=4408}},
		
	    {Text="Turn inn beached sea creature", Dt={q="Beached Sea Creature"}, point={x=3662,y=4559}},
	
	    {Text="Grind to the Red Crystal and As Water Cascades, look for moonstalkers", Dt={q="As Water Cascades"}, point={x=4737,y=4870}},
	    {Text="Accept The Fragment Within", At="The Fragments Within", point={x=4737,y=4870}},
	
	    {Text="GRIND SOME OF THE HIGHER LVL MOONKINS HERE, SHOULD BE AT LEAST 15"},

	    {Text="Grind up north and do Tharnariun's Hope (The den mother).", Ct="Tharnariun's Hope", point={x=5231,y=3572}},
	    {Text="Do Cave Mushrooms (careful with pulls, 2x=dead)", Ct="Cave Mushrooms", point={x=5439,y=3167}},

	    {Text="Fill Empty Sampling Tube (kill moonstalkers on the way)", Ct="The Cliffspring River", UseItem="Empty Sampling Tube", point={x=5086,y=2559}},



        {Text="Grind Moonstalkers towards the beached sea Turtle north-east of river", At="Beached Sea Turtle", point={x=5310,y=1808}},
	    {Text="Grind Moonstalkers towards the beached sea Turtle west of river", At="Beached Sea Turtle", point={x=4417,y=2064}},
	
	    {Text="Keep grinding this area, looking for moonstalkers until hitting lvl 15", Lvl={lvl=15}},

	    {Text="MAKE SURE YOU ARE 15 (unless beta shows you can take prospector quest at 14)"},
	
	    {Text="maybe grind until empty arrows at althalaxx?"},
	    {Text="maybe do the althalaxx quest now to ding 16 faster"},
	    {Text="could even be 16 here and it would not hurt."},
	
	    {Text="== HEARTSTONE TO DARNASSUS ==", Zone="Darnassus"},
        -- add a vendor step in darnassus before training perhaps, if gold is tight?
	    {Text="Train Hunter skills", 
            TrainSkill={
                {n="Mend Pet",r="Rank 1", Actionbar=1},
                {n="Arcane Shot",r="Rank 2"},
                {n="Distracting Shot",r="Rank 1"},
                {n="Wing Clip",r="Rank 1"},
            }, point={x=3981,y=1614}
        },
        {Text="Train Pet skills (up the ramp)", 
            TrainSkill={
                {n="Great Stamina",r="Rank 2"},
                {n="Natural Armor",r="Rank 2"},
            }, point={x=4284,y=1006}
        },
			
	    {Text="Buy Reinforced Bow (lvl 16) at wep masters", BuyItem={Npc="Ariyell Skyshadow", Item="Reinforced Bow", Count=1}, 
            point={x=5871,y=4459}, PinAdd="Equip Reinforced Bow at lvl 16"},
			
        {Text="Train staves", 
            TrainSkill={
                {n="Staves"},
            }, point={x=5756,y=4673}
        },

        {Text="Accept Trouble in darkshore (outside temple of moon)", At="Trouble In Darkshore?", point={x=3116,y=8467}},

	    {Text="Run to FP", Zone="Teldrassil", point={x=3060,y=4152}},
	    {Text="Turn inn Return to Nessa", Dt={q="Return to Nessa"}, point={x=5625,y=9245}},
	    {Text="Fly to Auberdine", Taxi="Auberdine, Darkshore", point={x=5841,y=9403}},
	    {Text="Turn inn Beached Sea Turtle", Dt={q="Beached Sea Turtle"}, point={x=3662,y=4560}},
        {Text="Accept Fruit of the sea (fishing dude under FP)", At="Fruit of the Sea", point={x=3609,y=4492}},
			
        {Text="==== RESTOCK On Longjaw Mud Snapper ====", BuyItem={Npc="Laird", Item="Longjaw Mud Snapper", Count=20}, point={x=3674,y=4429}},
			
        {Text="Put HS in Auberdine", SetHs="Innkeeper Shaussiy", point={x=3705,y=4413}},
	    {Text="Turn inn Cave Mushrooms (outside inn)", Dt={q="Cave Mushrooms"}, point={x=3732,y=4365}},
        {Text="Accept Onu", At="Onu", point={x=3732,y=4365}},
	    {Text="Turn inn The Fragment Within", Dt={q="The Fragments Within", Item="Oakthrush Staff", Use=1}, point={x=3771,y=4338}},
	    {Text="Accept Wanted: Murkdeep (outside inn, wanted poster)", At="WANTED: Murkdeep!", point={x=3722,y=4420}},
	    {Text="Turn inn Trouble in Darkshore", Dt={q="Trouble In Darkshore?"}, point={x=3744,y=4183}},
        {Text="Accept The Absent Minded Prospector", At="The Absent Minded Prospector", point={x=3744,y=4183}},
	    {Text="=== RESTOCK Sharp Arrow ===", BuyItem={Npc="Dalmond", Item="Sharp Arrow", Count=1200}, point={x=3744,y=4051}},
	    {Text="Turn inn The Cliffspring River", Dt={q="The Cliffspring River"}, point={x=3740,y=4012}},
        {Text="Accept The Blackwood Corrupted", At="The Blackwood Corrupted", point={x=3740,y=4012}},

	    {Text="Turn inn Tharnariun's Hope", Dt={q="Tharnariun's Hope", Item="Evergreen Gloves", Use=1}, point={x=3884,y=4342}},

	    {Text="=>RUN TO THE MOONWELL IN AUBERDINE AND FILL THE BOWN FROM the blackwood corrupted",Item={Name="filled cleansing bowl", Count=1}, point={x=3777,y=4406}},
	
	    {Text="Almost 15.5 here"},
        {Text="Grind to Onu, turn inn Onu", Dt={q="Onu"}, point={x=4358,y=7626}},
        {Text="Accept The Master's Glaive", At="The Master's Glaive", point={x=4358,y=7626}, PinAdd="MAKE SURE YOU GOT A PHIAL OF SCRYING"},
        {Text="Turn inn Grove of the Ancients (may not have it, no big deal)", Dt={q="Grove of the Ancients"}, point={x=4358,y=7626}},
            
        {Text="Vendor to clean bags", point={x=4369,y=7663}, Proximity=5},
        {Text="Master's Glaive 1: Discover the area to complete quest", Ct="The Master's Glaive", point={x=3908,y=8558} },
        {Text="Master's Glaive 2: Use Phial of Scrying in water and turnin", Dt={q="The Master's Glaive"}, UseItem="Phial of Scrying"},
        {Text="Accept The Twilight Camp from Phial of Scrying you spawned", At="The Twilight Camp"},
            
        {Text="Deliver The Twilight Camp at the small book next to altar", Dt={q="The Twilight Camp"}, point={x=3854,y=8605}},
        {Text="Accept Return to Onu from the book", At="Return to Onu", point={x=3854,y=8605}},
            
	    {Text="Grind for a while, try to get drop: Book: The Powers Below",Item={Name="Book: The Powers Below", Count=1} },
        {Text="Do Therylune's Escape (escort) if npc spawns", Ct="Therylune's Escape", point={x=3864,y=8734}},
	    {Text="Keep grinding if alone. Can go to 17 or even 18 if nice", Lvl={lvl=17}},

        {Text="Turn inn The Absent Minded Prospector. Skip followup unless lvl 18+ or with someone else", 
            point={x=3573,y=8369}, PinAdd="Kill highlvl moonstalkers for A Lost Master and Buzzbox 323", Dt={q="The Absent Minded Prospector"}},
        {Text="Only do Murkdeep if lvl 18++ or with someone else"},

        {Text="Accept Beached Sea Creature (can kill crabs here too for Fruit of the Sea)", At="Beached Sea Creature", point={x=3279,y=8105}},
        {Text="Accept Beached Sea Turtle", At="Beached Sea Turtle", point={x=3169,y=8363}},
        {Text="Accept Beached Sea Turtle #2", At="Beached Sea Turtle", point={x=3121,y=8551}},
        {Text="Accept Beached Sea Creature #2", At="Beached Sea Creature", point={x=3129,y=8744}},

        {Text="Complete A Lost Master and Buzzbox 323 around Master's Glaive", Mct={"A Lost Master", "Buzzbox 323"}, point={x=3419,y=8951}, PinRemove="Kill highlvl moonstalkers for A Lost Master and Buzzbox 323"},
            
        {Text="Turn inn Return to Onu", Dt={q="Return to Onu"}, point={x=4357,y=7629}, PinAdd="Delete Phial of Scrying"},
        {Text="WAIT FOR RP, then accept Mathystra Relics", At="Mathystra Relics", point={x=4357,y=7629}},

        -- Uncertain if we can HS here, or if we need to save it for trip to the north.
        -- Is it even ready after darnassus trip earlier?
        {Text="Heartstone to Auberdine", Proximity=20, point={x=3701,y=4412}, Useitem="Hearthstone"},
            
        {Text="==== RESTOCK On Longjaw Mud Snapper ====", BuyItem={Npc="Laird", Item="Longjaw Mud Snapper", Count=20}, point={x=3674,y=4429}},

        {Text="Turn inn Beached Sea Creature #1", Dt={q="Beached Sea Creature"}, point={x=3662,y=4559}},
        {Text="Turn inn Beached Sea Creature #2", Dt={q="Beached Sea Creature"}, point={x=3662,y=4559}},
        {Text="Turn inn Beached Sea Turtle #1", Dt={q="Beached Sea Turtle"}, point={x=3662,y=4559}},
        {Text="Turn inn Beached Sea Turtle #1", Dt={q="Beached Sea Turtle"}, point={x=3662,y=4559}},

        {Text="Turn inn Fruit of the sea (if complete, can also be done later)", Dt={q="Fruit of the Sea", Item="Shucking Gloves", Use=1, SkipIfUncomplete=1}, point={x=3609,y=4493}},
        {Text="Turn inn WANTED: Murkdeep! (if complete, can also be done later)", Dt={q="WANTED: Murkdeep!", Item="Ridgeback Bracers", Use=1, SkipIfUncomplete=1}, point={x=3770,y=4340}},
            

        {Text="Turn inn A Lost Master", Dt={q="A Lost Master"}, point={x=3937,y=4347}},
        {Text="Accept A Lost Master pt2", At="A Lost Master", point={x=3937,y=4347}},

        {Text="=== RESTOCK Sharp Arrow ===", BuyItem={Npc="Dalmond", Item="Sharp Arrow", Count=1200}, point={x=3744,y=4051}},

        {Text="Loot Blackwood Grain Stores", Item={Name="Blackwood Grain Sample", Count=1}, point={x=5062,y=3496}},
        {Text="Loot Blackwood Nut Stores", Item={Name="Blackwood Nut Sample", Count=1}, point={x=5181,y=3356}},
        {Text="Loot Blackwood Fruit Stores", Item={Name="Blackwood Fruit Sample", Count=1}, point={x=5285,y=3343}},

        {Text="Use Filled Cleansing Bowl (by fire) to summon Xabraxxis. Kill and loot Demon Bag on ground",
                Ct="The Blackwood Corrupted", point={x=5241,y=3338}, UseItem="Filled Cleansing Bowl"},
            
        {Text="Turn inn Buzzbox 323", Dt={q="Buzzbox 323"}, point={x=5127,y=2457}},
        {Text="Accept Buzzbox 525", At="Buzzbox 525", point={x=5127,y=2457}},

        {Text="Turn inn The Tower of Althalaxx", Dt={q="The Tower of Althalaxx"}, point={x=5497,y=2488}},
        {Text="Accept The Tower of Althalaxx pt2", At="The Tower of Althalaxx", point={x=5497,y=2488}},
        {Text="Complete The Tower of Althalaxx pt2.", Ct="The Tower of Althalaxx", point={x=5536,y=2655}},

        {Text="Turn inn The Tower of Althalaxx pt2", Dt={q="The Tower of Althalaxx"}, point={x=5497,y=2488}},
        {Text="Accept The Tower of Althalaxx pt3", At="The Tower of Althalaxx", point={x=5497,y=2488}},
            
        {Text="Grind here to 19 if possible", Lvl={lvl=19} },
                  
        {Text="Complete Mathystra Relics (small statues scattered around)", Ct="Mathystra Relics", point={x=5783,y=2137}, PinAdd="Look for Lady Vespira (rare), almost center of map-icon"},
        {Text="If still not lvl 19, do it here on nagas", Lvl={lvl=19} },
        {Text="Accept Gyromast's Retrieval", At="Gyromast's Retrieval", point={x=5666,y=1348}},
            
        {Text="If did not complete Buzzbox or A Lost Master (pelts), do it now", point={x=6019,y=1195}},
            
        {Text="Complete Gyromast's Retrieval (murlocs, Forestriders and crabs)", Ct="Gyromast's Retrieval"},

        {Text="Deliver Gyromast's Retrieval", Dt={q="Gyromast's Retrieval"}, point={x=5666,y=1348}},
        {Text="Accept Gyromast's Revenge", At="Gyromast's Revenge", point={x=5666,y=1348}},
        {Text="Talk to the Treshwackonator 4100", Proximity=10, point={x=5582,y=1823}},
        {Text="Move back to Gyromast. Prepare kill with Immolation Trap. Pot ready. Pet on passive.", Proximity=20, point={x=5667,y=1437}},
        {Text="Kill and loot to complete. Deliver quest", Dt={q="Gyromast's Revenge"}, point={x=5666,y=1348}},

        {Text="If didnt do before Darnassus, get beached sea Turtle north-east of river", At="Beached Sea Turtle", point={x=5310,y=1808}},
        {Text="Make sure Fruit of the sea is complete now. (not from the lvl 20 crabs maybe)", Ct="Fruit of the Sea"},
            
        {Text="How is heartstone looking?"},
            
        {Text="=== RESTOCK Sharp Arrow ===", BuyItem={Npc="Dalmond", Item="Sharp Arrow", Count=1200}, point={x=3744,y=4051}},
        {Text="Deliver The Blackwood Corrupted", Dt={q="The Blackwood Corrupted", Item="Wildkeeper Leggings", Use=1}, point={x=3740,y=4016}},
        {Text="==== RESTOCK On Longjaw Mud Snapper ====", BuyItem={Npc="Laird", Item="Longjaw Mud Snapper", Count=20}, point={x=3674,y=4429}},
        {Text="Deliver Fruit of the Sea (make sure have boots already)", Dt={q="Fruit of the Sea", Item="Crustacean Boots", Vendor=1}, point={x=3609,y=4493}},
        {Text="Deliver Beached Sea Turtle", Dt={q="Beached Sea Turtle"}, point={x=3662,y=4560}},


        -- need some work on these last steps
        {Text="Do WANTED: Murkdeep! (clear camp of murlocks to spawn him)", Ct="WANTED: Murkdeep!", point={x=3653,y=7649}},
        {Text="Complete Buzzbox 525 (area between onu, Murkdeep and glaive)", Ct="Buzzbox 525", point={x=3653,y=7649}},
        {Text="Do The Absent Minded Prospector", At="The Absent Minded Prospector", point={x=3574,y=8371}},

        {Text="Deliver Buzzbox 525", Dt={q="Buzzbox 525"}, point={x=4136,y=8053}},
        {Text="Deliver Mathystra Relics (vendor too)", Dt={q="Mathystra Relics", Item="Woodsman Sword", Vendor=1}, point={x=4356,y=7631}},

        {Text="Accept The Sleeper Has Awakened if it's up",At="The Sleeper Has Awakened", point={x=4440,y=7643}},
            
        {Text="Turn inn A Lost Master", Dt={q="A Lost Master"}, point={x=4505,y=8534}},
        {Text="Accept Escape Through Force", At="Escape Through Force", point={x=4505,y=8534}},
        {Text="Complete Escape Through Force", Ct="Escape Through Force"},

        {Text="Accept One Shot. One Kill", At="One Shot. One Kill.", point={x=4595,y=9028}},
        {Text="Complete One Shot. One Kill (takes a few minutes)", Ct="One Shot. One Kill."},

        {Text="Grind to 19+ 17700 (3600 xp from quests)", Lvl={lvl=19,xp=17700}},
            
        {Text="Turn inn The Sleeper Has Awakened", Dt={q="The Sleeper Has Awakened", Item="Owlsight Rifle", Vendor=1}, point={x=2728,y=3554}},
        {Text="Turn inn One Shot. One Kill.", Dt={q="One Shot. One Kill."}, point={x=2659,y=3670}},
        {Text="Turn inn The Tower of Althalaxx", Dt={q="The Tower of Althalaxx"}, point={x=2619,y=3872}},

    }
}
--[[
    sleeper 1550
    oneshot 1050
    tower 1000
    fullxp - 3600
]]
	