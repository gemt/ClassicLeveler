-- Author      : G3m7
-- Create Date : 5/11/2019 7:51:10 AM

CLGuide_WetlandsSouthshore = {
    Title="30-32 Wetlands to Southshore",
    Pinboard = {},
    Steps = {
        {Text="Enter the Inn Place frost trap at entrance, Turn inn The Missing Diplomat at Mikhail", Dt={q="The Missing Diplomat"}, point={x=1059,y=6079}},
        {Text="Accept The Missing Diplomat, GO STRAIGHT TO ENTRANCE AND DEFEAT Tapoke", At="The Missing Diplomat", point={x=1059,y=6079}},
        {Text="Defeat Tapoke outside (maybe kite if needed)", Ct="The Missing Diplomat", point={x=1078,y=5946}},
        {Text="Turn inn The Missing Diplomat at Mikhail again", Dt={q="The Missing Diplomat"}, point={x=1059,y=6079}},
        {Text="Accept The Missing Diplomat (From Tapoke at entrance)", At="The Missing Diplomat", point={x=1055,y=6025}},
        {Text="Turn inn The Missing Diplomat at Mikhail again", Dt={q="The Missing Diplomat"}, point={x=1059,y=6079}},
        {Text="Accept The Missing Diplomat", At="The Missing Diplomat", point={x=1059,y=6079}},

        {Text="Turn inn The Doomed Fleet next to Mikhail (Glorin Steelbrow)", Dt={q="The Doomed Fleet"}, point={x=1058,y=6058}},
        {Text="Accept Lightforge Iron", At="Lightforge Iron", point={x=1058,y=6058}},
        
        {Text="Turn inn James Hyal by the fireplace", Dt={q="James Hyal"}, point={x=1082,y=6042}},
        {Text="Accept James Hyal", At="James Hyal", point={x=1082,y=6042}},

        {Text="Go out, behind Inn, loot Waterlogged Chest for Lightforge Iron", Dt={q="Lightforge Iron"}, point={x=1210,y=6420}},
        {Text="Accept The Lost Ingots", At="The Lost Ingots", point={x=1210,y=6420}},
        
        {Text="Complete The Lost Ingots (drop from Murlocs in area) (check for Sludginn, rare, at point)", Ct="The Lost Ingots", point={x=1265,y=6753}},
        {Text="Turn inn The Lost Ingots (Back in the Inn)", Dt={q="The Lost Ingots"}, point={x=1058,y=6058}},
        {Text="Accept Blessed Arm", At="Blessed Arm", point={x=1058,y=6058}},


        {Text="Buy Razor Arrows (outside)", BuyItem={Npc="Naela Trance", Item="Razor Arrow", Count=2800}, point={x=1129,y=5830}},
        {Text="Accept Fall of Dun Modr (dead guy outside keep)", At="Fall of Dun Modr", point={x=1085,y=5590}},

        {Text="Run to Dun'Modr (Arathi border), turn inn Fall of Dun Modr", Dt={q="Fall of Dun Modr"}, point={x=4980,y=1826}},
        {Text="Accept A Grim Task", At="A Grim Task", point={x=4980,y=1826}},
        {Text="Accept The Thandol Span (on the right)", At="The Thandol Span", point={x=4995,y=1821}},

        {Text="Kill Balgaras for A Grim Task. Nuke pet first, then kite Balgaras back to delivery", Ct="A Grim Task", point={x=6247,y=2843}},
        {Text="Deliver A Grim Task (Make sure to switch correct ring)", Dt={q="A Grim Task", Item="Tranquil Ring", Use=1}, point={x=4980,y=1826}},

        {Text="On Bridge, enter right door, get to bottom floor and turnin The Thandol Span. Use pet to tank mobs", 
            Dt={q="The Thandol Span"}, point={x=5128,y=795}},
        {Text="Accept The Thandol Span pt2", At="The Thandol Span", point={x=5128,y=795}},
        {Text="Deliver The Thandol Span back at previous place", Dt={q="The Thandol Span"}, point={x=4995,y=1821}},
        {Text="Accept The Thandol Span pt3", At="The Thandol Span", point={x=4995,y=1821}},

        -- todo: test if enough time to accept run to southshore quest before completing the thandol span
        
        {Text="Destroy Cache of Explosives for The Thandol Span (Across Bridge)", Ct="The Thandol Span", point={x=4874,y=8806}},
        
        {Text="Deliver The Thandol Span back at previous place", Dt={q="The Thandol Span", Item="Swampland Trousers", Use=1}, point={x=4995,y=1821}},
        {Text="Accept Plea To The Alliance", At="Plea To The Alliance", point={x=4995,y=1821}},
        
        -- This step only works reliably with some runspeed increase. Hunter improved aspect is reliable
        {Text="Enter Arathi across bridge, go on broken bridge to left, jump over on pillar and accept MacKreel's Moonshine", 
            At="MacKreel's Moonshine", point={x=4294,y=9157}, Class="Hunter"},

        {Text="Jump into water, towards East, Loot Waterlogged Letter", Item={Name="Waterlogged Envelope", Count=1}, 
            point={x=4429,y=9288}, Class="Hunter"},
        {Text="Get up again by running to the EAST, then run to Refuge Pointe. Accept the item quest", 
            At="Sully Balloo's Letter", UseItem="Waterlogged Envelope", point={x=5677,y=687}, Class="Hunter"},
        ---------------------------

        {Text="Run to Refuge Pointe (Arathi). Deliver Plea to the alliance", Dt={q="Plea To The Alliance"}, point={x=4584,y=4756}},
        {Text="Accept Northfold Manor", At="Northfold Manor", point={x=4584,y=4756}},

        {Text="Deliver Malin's Request", Dt={q="Malin's Request"}, point={x=4667,y=4701}},

        {Text="Discover FP", Proximity=20, point={x=4576,y=4612}},

        {Text="Run West on road to Hillsbrad Foothills", Zone="Hillsbrad Foothills", point={x=2012,y=2942},
            PinAdd="If First Aid: Stormgarde Keep, at the first intersection go right and hug the wall around over the bridge"},

        {Text="Run to Southshore. Accept Costly Menace (at barn)", At="Costly Menace", point={x=5242,y=5596}},

        -- once again, only if you jumped on the pillar 
        {Text="Enter the Inn, Cellar, Deliver MacKreel's Moonshine", Dt={q="MacKreel's Moonshine"}, point={x=5215,y=5868}, Class="Hunter"},
        --------------------------
        
        {Text="Accept Soothing Turtle Bisque (inn, cook)", At="Soothing Turtle Bisque", point={x=5188,y=5868}},
        {Text="Accept Down the Coast (inn)", At="Down the Coast", point={x=5146,y=5839}},

        -- TODO: Is it the right call to set HS here, or do we need it elsewhere? 
        {Text="Set HS at Innkeeper Anderson", SetHs="Innkeeper Anderson", point={x=5117,y=5892}},
        {Text="Accept Hints of a New Plague? (outside Inn)", At="Hints of a New Plague?", point={x=5034,y=5905}},
        {Text="Accept Syndicate Assassins (in town hall)", At="Syndicate Assassins", point={x=4814,y=5911}},
        
        {Text="Complete Down the Coast (kill murlocs on SW coast)", Ct="Down the Coast", point={x=4530,y=6667}},
        {Text="Deliver Down the Coast (Inn)", Dt={q="Down the Coast"}, point={x=5146,y=5839}},

        {Text="Accept Farren's Proof", At="Farren's Proof", point={x=5146,y=5839}},
        {Text="Complete Farren's Proof (murloc heads from the same murlocs)", Ct="Farren's Proof", point={x=4530,y=6667}},
        {Text="Deliver Farren's Proof (Inn)", Dt={q="Farren's Proof"}, point={x=5146,y=5839}},
        {Text="Accept Farren's Proof pt2", At="Farren's Proof", point={x=5146,y=5839}},

        {Text="Deliver Farren's Proof pt2 (outside Inn)", Dt={q="Farren's Proof"}, point={x=4947,y=5873}},
        {Text="Accept Farren's Proof pt3", At="Farren's Proof", point={x=4947,y=5873}},

        {Text="Deliver Farren's Proof (Inn)", Dt={q="Farren's Proof"}, point={x=5146,y=5839}},
        {Text="Accept Stormwind Ho!", At="Stormwind Ho!", point={x=5146,y=5839}},

        {Text="Complete Stormwind Ho! on the SE shore (nagas)", Ct="Stormwind Ho!", point={x=5702,y=6719}},

        {Text="Get 10 Turtle meat by following the river North", Item={Name="Turtle Meat", Count=10},
            PinAdd="There may be Hulking Lions to kill Around Cyclonian area" },

        {Text="Accept Foreboding Plans (northernmost syndicate camp, maybe also southern)", At="Foreboding Plans", point={x=5832,y=6795}, 
            PinAdd="Make sure you actually get the 2 quests. Need 2 bagspace"},
        {Text="Accept Encrypted Letter (northernmost syndicate camp, maybe also southern)", At="Foreboding Plans", point={x=5832,y=6795},
            PinAdd="Can vendor at alterac valley place (second furthest SW hill)"},
        

        {Text="Complete Syndicate Assassins and Costly Menace on the 4 different \"hills\"", 
            Mct={"Syndicate Assassins", "Costly Menace"}},
        
        {Text="Hearthstone to Southshore", UseItem="Hearthstone", Zone="Hillsbrad Foothills"},

        {Text="Deliver Stormwind Ho! (Inn)", Dt={q="Stormwind Ho!"}, point={x=5146,y=5839}},
        {Text="Accept Reassignment", At="Reassignment", point={x=5146,y=5839}},
        

        {Text="Deliver Southshore to Loremaster Dibbs (skip followup)", Dt={q="Southshore"}, point={x=5057,y=5710}},
        {Text="Deliver Encrypted Letter (same dude)", Dt={q="Encrypted Letter"}, point={x=5057,y=5710}},
        {Text="Accept Letter to Stormpike", At="Letter to Stormpike", point={x=5057,y=5710}},

        {Text="Deliver Costly Menace (at barn) (check that belt is upgrade)", Dt={q="Costly Menace", Item="Shepherd's Girdle", Use=1}, point={x=5242,y=5596}},

        {Text="Discover FP", Proximity=20, point={x=4933,y=5226}},

        -- for turtle meats
        {Text="Buy Soothing Spices x1 from Micha Yance", BuyItem={Npc="Micha Yance", Item="Soothing Spices", Count=1}, point={x=4893,y=5503}},
        {Text="Buy Razor Arrows (second floor)", BuyItem={Npc="Sarah Raycroft", Item="Razor Arrow", Count=2800}, point={x=4914,y=5505}},
        
        {Text="Turn inn Foreboding Plans (town hall)", Dt={q="Foreboding Plans"}, point={x=4814,y=5911}},
        
        {Text="Turn inn Syndicate Assassins (town hall)", Dt={q="Syndicate Assassins", Item="Crusader Belt", Vendor="Crusader Belt"}, point={x=4814,y=5911}},

        {Text="Turn inn Soothing Turtle Bisque (inn, cook)", Dt={q="Soothing Turtle Bisque"}, point={x=5188,y=5868}},

        {Text="Run to Arathi Highlands", Zone="Arathi Highlands", point={x=8170,y=5694}},

        {Text="Complete Northfold Manor. Can also grind here until 32 if nice", Ct="Northfold Manor", point={x=3045,y=2751}},
        {Text="Deliver Northfold Manor (Refuge Pointe)", Dt={q="Northfold Manor"}, point={x=4584,y=4756}},

        {Text="Fly to Wetlands", Taxi="Menethil Harbor, Wetlands", point={x=4576,y=4611}},
    }
}