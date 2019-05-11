-- Author      : G3m7
-- Create Date : 5/11/2019 12:37:17 PM

CLGuide_Stv1 = {
    Title="34-36 STV",
    Pinboard = {"Get Sarah's Ring from bank if didnt do in STV!"},
    Steps = {

        -- arrow merchant https://vanillawowdb.com/?npc=2839
        {Text="Turn inn Goblin Sponsorship right as you exit boat", Dt={q="Goblin Sponsorship"}, point={x=2635,y=7356}},
        {Text="Accept Goblin Sponsorship", At="Goblin Sponsorship", point={x=2635,y=7356}},

        {Text="Accept Supply and Demand (Tan-Your-Hide Leatherworks)", At="Supply and Demand", point={x=2829,y=7759}},

        {Text="Accept Singing Blue Shards (in the Inn)", At="Singing Blue Shards", point={x=2712,y=7721}},
        
        {Text="Set HS in BB", SetHs="Innkeeper Skindle", point={x=2704,y=7731}},
        -- TODO: Most likely set HS here!

        {Text="Accept Supplies to Private Thorsen (third floor inn)", At="Supplies to Private Thorsen", point={x=2694,y=7721}},
        {Text="Accept Investigate the Camp", At="Investigate the Camp", point={x=2694,y=7721}},
        {Text="Accept The Haunted Isle", At="The Haunted Isle", point={x=2694,y=7721}},

        {Text="Accept Bloodscalp Ears (next to him)", At="Bloodscalp Ears", point={x=2700,y=7713}},
        {Text="Accept Hostile Takeover", At="Hostile Takeover", point={x=2700,y=7713}},

        {Text="Deliver The Haunted Isle (baron dude)", Dt={q="The Haunted Isle"}, point={x=2722,y=7687}},
        {Text="Accept The Stone of the Tides", At="The Stone of the Tides", point={x=2722,y=7687}},
        {Text="Deliver Goblin Sponsorship", Dt={q="Goblin Sponsorship"}, point={x=2722,y=7687}},
        {Text="Accept Goblin Sponsorship", At="Goblin Sponsorship", point={x=2722,y=7687}},

        {Text="Fly to Stormwind", Taxi="Stormwind, Elwynn", point={x=2753,y=7778}},

        {Text="Train Hunter skills", 
            TrainSkill={
                {n="Serpent Sting",r="Rank 5", Actionbar=1},
                {n="Disengage",r="Rank 2", Actionbar=10},
            }, point={x=6153,y=1650}
        },
        
        {Text="Deliver Blessed Arm in Dwarven District", Dt={q="Blessed Arm"}, point={x=5169,y=1217}},
        {Text="Accept Armed and Ready", At="Armed and Ready", point={x=5169,y=1217}},
        
        {Text="Deliver Reassignment (Keep, king's room, first left)", Dt={q="Reassignment"}, point={x=7260,y=1586}},

        {Text="Fly to Sentinel Hill, Westfall", Taxi="Sentinel Hill, Westfall", point={x=2753,y=7778},},

        {Text="Run east to NW corner of Duskwood", Zone="Duskwood", point={x=6596,y=4660}},
        
        {Text="Deliver Armed and Ready at Sven", Dt={q="Armed and Ready"}, point={x=778,y=3407}},
        {Text="Accept Morbent Fel", At="Morbent Fel", point={x=778,y=3407}},
        {Text="Kill Morbent Fel. Use offhand on him (must be close)", Ct="Morbent Fel", UseItem="Morbent's Bane", point={x=1690,y=3342}},
        {Text="Turn inn Morbent Fel", Dt={q="Morbent Fel", Item="Sparkmetal Coif"}, point={x=778,y=3407}},

        {Text="Turn inn A Daughter's Love (at the GY behind house on top of hill)", Dt={q="A Daughter's Love"}, point={x=1770,y=2910}},

        {Text="Go to Abercrombie, click Pile of dirt to spawn Elza", Dt={q="Digging Through the Dirt"}, point={x=2886,y=3072},
            PinAdd="THOUGH ONE! Get ready with immolation trap and go full nuke on boss with all CDs"},

        {Text="Kill Elza and loot to complete Bride of the Embalmer", Ct="Bride of the Embalmer"},
        -- delivering bride of the embalmer after HS to BB later

        {Text="Run into STV", Zone="Stranglethorn Vale", point={x=4474,y=8543},
            PinAdd="If Private Thorsen is not in Rebel Camp, he could be patrolling towards first bridge to the south. Potentially dead"},
        




        {Text="Deliver Supplies to Private Thorsen (Private Thorsen)", Dt={q="Supplies to Private Thorsen"}, point={x=3801,y=343}},
        {Text="Accept Jungle Secrets (Private Thorsen)", At="Jungle Secrets", point={x=3801,y=343}},

        {Text="Accept The Second Rebellion (Sergent Yohwa)", At="The Second Rebellion", point={x=3802,y=333}},
        {Text="Accept Bad Medicine (Sergent Yohwa)", At="Bad Medicine", point={x=3802,y=333}},

        {Text="Deliver Jungle Secrets (Lieutenant Doren)", Dt={q="Jungle Secrets"}, point={x=3804,y=302}},
        {Text="Accept Bookie Herod (Lieutenant Doren)", At="Bookie Herod", point={x=3804,y=302}},

        {Text="Buy Razor Arrows in Rebel Camp", BuyItem={Npc="Corporal Bluth", Item="Razor Arrow", Count=2800}, point={x=3796,y=298}},
        
        {Text="Accept Krazek's Cookery (Corporal Kaleb)", At="Krazek's Cookery", point={x=3774,y=330}},



        -- tiger/panther 1 + crocs
        {Text="Accept Welcome to the Jungle (Nesingwary camp)", At="Welcome to the Jungle", point={x=3566,y=1053}},
        {Text="Turn in Hemet Nesingwary", Dt={q="Hemet Nesingwary"}, point={x=3566,y=1081}},
        {Text="Turn in Welcome to the Jungle", Dt={q="Welcome to the Jungle"}, point={x=3566,y=1081}},

        {Text="Accept Raptor Mastery", At="Raptor Mastery", point={x=3566,y=1081}},
        {Text="Accept Tiger Mastery", At="Tiger Mastery", point={x=3562,y=1062}},
        {Text="Accept Panther Mastery", At="Panther Mastery", point={x=3555,y=1055}},
        
        {Text="Complete Tiger and Panther Mastery and Supply and Demand (crocolisks)", Mct={"Panther Mastery", "Tiger Mastery", "Supply and Demand"}},



        -- do kurzen 1
        {Text="Go to Kurzen => Deliver Bookie Herod (second floor of house)", Dt={q="Bookie Herod"}, point={x=4367,y=938}},
        {Text="Accept The Hidden Key", At="The Hidden Key", point={x=4367,y=938}},

        {Text="Complete Kurzen Quests: 15 Fighers, 7 Remedies + box(outside house, by fire or by stables)",
            Mct={"Bad Medicine", "The Second Rebellion"}, PinAdd="Several basilisks for Singing Blue Shards E/NE of Kurzen"},


        {Text="Deliver Tiger Mastery", Dt={q="Tiger Mastery"}, point={x=3562,y=1062}},
        {Text="Accept Tiger Mastery pt2", At="Tiger Mastery", point={x=3562,y=1062}},

        {Text="Deliver Panther Mastery", Dt={q="Panther Mastery"}, point={x=3555,y=1055}},
        {Text="Accept Panther Mastery pt2", At="Panther Mastery", point={x=3555,y=1055}},


        -- tiger/panther 2 + raptor 1 + discover isle + some basilisks
        {Text="Complete Tiger and Panther Mastery pt2, and Raptor mastery pt1", Mct={"Panther Mastery", "Tiger Mastery", "Raptor Mastery"},
            point={x=3141,y=1142}, PinAdd="Snipe the Basilisks below raptors for Singing Blue Shards & can kill some trolls for ears"},
        
        {Text="Discover The Haunted Isle (south of ZG isle) to complete \"The Stone of the Tides\"", Ct="The Stone of the Tides", point={x=2029,y=2151}},



        -- hearthstone, get crocs pt2 and isle pt2
        -- TODO: Not sure if HS will be ready in time here
        -- IF IT IS NOT ready. Do some kurzen stuff when doing panther pt1?
        {Text="Hearthstone to Booty Bay", UseItem="Hearthstone", Proximity=20, point={x=2704,y=7735}},
        
        {Text="Deliver Investigate the Camp (third floor)", Dt={q="Investigate the Camp"}, point={x=2694,y=7721}},
        {Text="Deliver Krazek's Cookery", Dt={q="Krazek's Cookery"}, point={x=2694,y=7721}},
        {Text="Accept Favor for Krazek", At="Favor for Krazek", point={x=2694,y=7721}},

        {Text="Deliver The Stone of the Tides (at Baron)", Dt={q="The Stone of the Tides"}, point={x=2722,y=7687}},
        {Text="Accept Water Elementals", At="Water Elementals", point={x=2722,y=7687}},

        {Text="Deliver Supply and Demand (out of inn, to leatherwork place)", Dt={q="Supply and Demand"}, point={x=2829,y=7759}},
        {Text="Accept Some Assembly Required", At="Some Assembly Required", point={x=2829,y=7759}},


        -- fly darkshire, deliver bride of embalmer
        {Text="Fly to Darkshire", Taxi="Darkshire, Duskwood", point={x=2753,y=7778}},
        {Text="Turn inn Bride of the Embalmer (town hall)", Dt={q="Bride of the Embalmer", Item="Mantle of Honor", Use=1, Vendor="Silk Mantle of Gamn"}, point={x=7193,y=4642}},
        {Text="Run into STV, to the Rebel Camp", Zone="Stranglethorn Vale"},



         -- deliver kurzen 1, get kurzen 2
        {Text="Deliver The Second Rebellion (Rebel Camp)", Dt={q="The Second Rebellion"}, point={x=3802,y=333}},
        {Text="Deliver Bad Medicine (Take shoulders if don't have Mantle of Honor)", Dt={q="Bad Medicine"}, point={x=3802,y=333}},
        {Text="Accept Special Forces", At="Special Forces", point={x=3802,y=333}},
        {Text="Accept Kurzen's Mystery", At="Kurzen's Mystery", point={x=3783,y=356}},
        {Text="Buy Razor Arrows in Rebel Camp", BuyItem={Npc="Corporal Bluth", Item="Razor Arrow", Count=2800}, point={x=3796,y=298}},



        -- deliver tiger/panter 2 & raptor 1, get tiger/panther 3 and raptor 2
        {Text="Deliver Raptor Mastery pt1", Dt={q="Raptor Mastery"}, point={x=3566,y=1081}, PinAdd="Remember to vendor"},
        {Text="Accept Raptor Mastery pt2", At="Raptor Mastery", point={x=3566,y=1081}},

        {Text="Deliver Tiger Mastery pt2", Dt={q="Tiger Mastery"}, point={x=3562,y=1062}},
        {Text="Accept Tiger Mastery pt3", At="Tiger Mastery", point={x=3562,y=1062}},

        {Text="Deliver Panther Mastery pt2", Dt={q="Panther Mastery"}, point={x=3555,y=1055}},
        {Text="Accept Panther Mastery pt3", At="Panther Mastery", point={x=3555,y=1055}},





        -- do kurzen pt2
        {Text="Deliver The Hidden Key (in the cave)", Dt={q="The Hidden Key"}, point={x=4962,y=756}},
        {Text="Accept The Spy Revealed!", At="The Spy Revealed!", point={x=4962,y=756}},
        {Text="Complete Special Forces (Kurzen cave)", Ct="Special Forces", point={x=4560,y=826}},
        

        
        {Text="Complete Tiger Mastery pt2 if did not already. Many south of Kurzen", Ct="Tiger Mastery", point={x=4683,y=1457}},



        -- oil rig/goblin stuff, panther 3, croc2, raptor 3 and tiger 3
        {Text="Kill Foreman Cozzle at top of oil rig at venture co. people. Loot key", Item={Name="Cozzle's Key", Count=1}, point={x=4263,y=1835},
            PinAdd="Kill Snapjaw crocs along shore around oilrig when here"},

        {Text="Loot Fuel Regulator Plans in little house to the south. Make sure bagspace so key is not wasted", Ct="Goblin Sponsorship", point={x=4334,y=2033}},
        {Text="Complete Hostile Takeover (Tumbled Crystal from geologists in area)", Ct="Hostile Takeover"},
        {Text="Complete Panther Mastery pt3 to the south and east (stealthed mobs)", Ct="Panther Mastery", point={x=4732,y=2283}},
        {Text="Complete Some Assembly Required (snapjaw crocs around water at oil rig)", Ct="Some Assembly Required"},
        {Text="Complete Raptor Mastery pt2 to the west", Ct="Raptor Mastery", point={x=3905,y=2193}},
        {Text="Complete Tiger Mastery pt3 north of Grom'Gol", Ct="Tiger Mastery", point={x=3153,y=1652},
            PinAdd="If still on pt2, deliver it first, then do pt3. Also check for Basilisks again"},

        {Text="Clear out Singing Blue Shards bazilisks (below raptor pt1) on the way back to Nessingwary camp", Ct="Singing Blue Shards", point={x=2849,y=1762},
            PinAdd="Getting another pass by the basilisks later, so dont wait for respawn"},

        
        -- deliver panther/tiger 3, raptor 2 and get tiger 4
        {Text="Deliver Raptor Mastery pt2 (skip pt3 for later)", Dt={q="Raptor Mastery"}, point={x=3566,y=1081}, PinAdd="Remember to vendor"},
        
        {Text="Deliver Tiger Mastery pt3", Dt={q="Tiger Mastery"}, point={x=3562,y=1062}},
        {Text="Accept Tiger Mastery pt4", At="Tiger Mastery", point={x=3562,y=1062}},
        
        {Text="Deliver Panther Mastery pt3 (skip pt4 for later)", Dt={q="Panther Mastery"}, point={x=3555,y=1055}},

        
        -- tiger 4
        {Text="Complete Tiger Mastery pt4 (Sin'Dall, SW)", Ct="Tiger Mastery", point={x=3222,y=1730}},

        -- tablets, isle pt2, troll necks, blue shards
        {Text="Get first Troll legend for Kurzen's Mystery (closest camp to Grom'Gol)", Item={Name="The First Troll Legend", Count=1}, point={x=2946,y=1913},
            PinAdd="Expecting to finish Bloodscalp Ears during Kurzen's Mystery"},

        {Text="Get Second Troll legend for Kurzen's Mystery (out by murlocs)", Item={Name="The Second Troll Legend", Count=1}, point={x=2483,y=2303}},

        {Text="(TEST IF WORTH) Encrusted Tail Fins SE of Haunted isle", Ct="Encrusted Tail Fins"},

        {Text="Complete Water Elementals at the isle", Ct="Water Elementals", point={x=2029,y=2151}},
        
        {Text="Get Third Troll legend for Kurzen's Mystery (SW part of trollplace)", Item={Name="The Third Troll Legend", Count=1}, point={x=2294,y=1198},
            PinAdd="Last chance to finish Singing Blue Shards now"},
        {Text="Get Fourth Troll legend for Kurzen's Mystery (out by murlocs)", Item={Name="The Fourth Troll Legend", Count=1}, point={x=2473,y=891}},
        
        {Text="Complete Bloodscalp Ears here before leaving", Ct="Bloodscalp Ears"},

        -- tiger 4
        {Text="Deliver Tiger Mastery pt4", Dt={q="Tiger Mastery"}, point={x=3562,y=1062}},
        
        -- deliver kurzen 2 + tablet
        {Text="Deliver Special Forces (skip kurzen pt3)", Dt={q="Special Forces"}, point={x=3804,y=301}},
        {Text="Deliver The Spy Revealed!", Dt={q="The Spy Revealed!"}, point={x=3804,y=301}},
        
        {Text="Accept Patrol Schedules", At="Patrol Schedules", point={x=3804,y=301}},
        {Text="Deliver Patrol Schedules!", Dt={q="Patrol Schedules"}, point={x=3767,y=339}},
        {Text="Accept Report to Doren", At="Report to Doren", point={x=3767,y=339}},
        {Text="Deliver Report to Doren", Dt={q="Report to Doren", Item="Junglewalker Sandals", Use=1}, point={x=3804,y=301}},

        {Text="Deliver Kurzen's Mystery (skip troll witchery)", Dt={q="Kurzen's Mystery"}, point={x=3783,y=356}},


        -- HS BB, deliver remaining stuff
        {Text="Hearthstone to Booty Bay", UseItem="Hearthstone", Proximity=20, point={x=2704,y=7735}},
        {Text="Deliver Singing Blue Shards (next to innkeeper). Skip followup", Dt={q="Singing Blue Shards"}, point={x=2712,y=7721}},
        {Text="Deliver Bloodscalp Ears (third floor)", Dt={q="Bloodscalp Ears"}, point={x=2700,y=7713}},
        {Text="Deliver Hostile Takeover", Dt={q="Hostile Takeover"}, point={x=2700,y=7713}},

        {Text="Deliver Goblin Sponsorship", Dt={q="Goblin Sponsorship"}, point={x=2722,y=7687}},
        {Text="Accept Goblin Sponsorship", At="Goblin Sponsorship", point={x=2722,y=7687}},

        {Text="Deliver Water Elementals", Dt={q="Water Elementals"}, point={x=2722,y=7687}},
        {Text="Accept Magical Analysis", At="Magical Analysis", point={x=2722,y=7687}},
        
        {Text="Deliver Some Assembly Required. Skip followup (leatherwork place)", Dt={q="Some Assembly Required"}, point={x=2829,y=7759}},
        

        -- train spells needed?
        -- any intro quests to desolace?
        {Text="---"},
    }
}