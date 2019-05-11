-- Author      : G3m7
-- Create Date : 5/11/2019 10:52:13 AM

CLGuide_TheramoreShimmering = {
    Title="32-34 Theramore to Shimmering Flats",
    Pinboard = {},
    Steps = {
        {Text="Take boat to Theramore (left pier)", Zone="Dustwallow Marsh", point={x=503,y=6344}},
        {Text="Discover FP in Theramore", Proximity=20, point={x=6748,y=5130}},

        {Text="Deliver James Hyal (citadel, main room second floor)", Dt={q="James Hyal"}, point={x=6788,y=4823}},

        {Text="Deliver The Missing Diplomat (same room)", Dt={q="The Missing Diplomat"}, point={x=6803,y=4871}},
        {Text="Accept The Missing Diplomat", At="The Missing Diplomat", point={x=6803,y=4871}},

        {Text="Set HS in Theramore", SetHs="Innkeeper Janene", point={x=6659,y=4522}},
        {Text="Accept Highperch Venom (in the Inn)", At="Highperch Venom", point={x=6640,y=4562}},

        {Text="Deliver The Missing Diplomat At Sentry Point (first tower outside theramore)", Dt={q="The Missing Diplomat"}, point={x=5970,y=4119},
            PinAdd="Archmage Tervosh may spawn when you enter and the quest complete. Otherwise may need to go back to theramore center tower to turnin"},
        {Text="Accept The Missing Diplomat", At="The Missing Diplomat", point={x=5970,y=4119}},

        {Text="Accept Soothing Spices (jarl dude)", At="Soothing Spices", point={x=5544,y=2627}},
        {Text="Deliver Soothing Spices", Dt={q="Soothing Spices"}, point={x=5544,y=2627}},
        -- skip taking this quest now. We take it again after desolace
        --{Text="Accept Jarl Needs Eyes", At="Jarl Needs Eyes", point={x=5544,y=2627}},

        {Text="Accept The Orc Report (dirtpile next to Jarls house)", At="The Orc Report", point={x=5544,y=2593}},

        {Text="Deliver The Missing Diplomat (outside Northern tower)", Dt={q="The Missing Diplomat"}, point={x=4522,y=2464},
            PinAdd="On Accepting followup, Hendel+2x 35 guards attack. One Frost trap, nuke hendel or kite?"},

        {Text="Accept The Missing Diplomat", At="The Missing Diplomat", point={x=4522,y=2464}},
        {Text="Deliver The Missing Diplomat Archmage that spawns", Dt={q="The Missing Diplomat"}, point={x=4519,y=2427}},
        {Text="Accept The Missing Diplomat", At="The Missing Diplomat", point={x=4519,y=2427}},
        {Text="Deliver The Missing Diplomat to Jaina next to him", Dt={q="The Missing Diplomat"}, point={x=4519,y=2427}},

        -- skip stinky's escape here unless super overleveled. Its unnecessarily high lvl mobs
        
        {Text="Accept Hungry!", At="Hungry!", point={x=3515,y=3827}},

        {Text="Accept Suspicious Hoofprints", At="Suspicious Hoofprints", point={x=2969,y=4763}, PinAdd="Need 3 bagspace for this"},
        {Text="Accept Lieutenant Paval Reethe", At="Lieutenant Paval Reethe", point={x=2983,y=4824}},
        {Text="Accept The Black Shield", At="The Black Shield", point={x=2963,y=4859}},


        {Text="Enter Barrens, run to 1KN elevator", Proximity=50, point={x=4422,y=9142}},

        {Text="Loot Henrig Lonebrow's Journal from corpse below elevator", Item={Name="Henrig Lonebrow's Journal", Count=1}, point={x=3073,y=2434}},
        {Text="Accept Lonebrow's Journal from book", At="Lonebrow's Journal", UseItem="Henrig Lonebrow's Journal"},

        {Text="Run West to Feralas, ==get FP== and turn inn Lonebrow's Journal", Dt={q="Lonebrow's Journal"}, point={x=846,y=1781}},
        {Text="Complete Highperch Venom at gryphon place. Skip if crowded by horde", Ct="Highperch Venom", point={x=1413,y=3328}},

        {Text="Run all the way to shimmering flats. Accept Rocket Car Parts", At="Rocket Car Parts", point={x=7779,y=7725},
            PinAdd="Prepare bags for vendoring while running"},
        {Text="Accept Salt Flat Venom", At="Salt Flat Venom", point={x=7806,y=7713}},
        {Text="Accept Hardened Shells", At="Hardened Shells", point={x=7814,y=7712}},
        {Text="Accept Load Lightening", At="Load Lightening", point={x=8018,y=7588}},
        {Text="Accept A Bump in the Road", At="A Bump in the Road", point={x=8164,y=7795}},

        -- XXX: No arrow vendor in 1kn. Must go all the way to tanaris port place if run out
        {Text="Do the whole shimmering Grind. Do regular vendoring when convenient"},

        {Text="Deliver A Bump in the Road", Dt={q="A Bump in the Road"}, point={x=8164,y=7795}},
        {Text="Deliver Load Lightening",    Dt={q="Load Lightening"}, point={x=8018,y=7588}},
        {Text="Accept Goblin Sponsorship",  At="Goblin Sponsorship", point={x=8018,y=7588}},

        {Text="Deliver Hardened Shells",    Dt={q="Hardened Shells"}, point={x=7814,y=7712}},
        {Text="Deliver Salt Flat Venom",    Dt={q="Salt Flat Venom"}, point={x=7806,y=7713}},

        {Text="Accept Martek the Exiled",  At="Martek the Exiled", point={x=7806,y=7713}},
        {Text="Accept Encrusted Tail Fins",  At="Encrusted Tail Fins", point={x=7814,y=7712}},

        {Text="Deliver Rocket Car Parts",   Dt={q="Rocket Car Parts"}, point={x=7779,y=7725}},
        {Text="Accept Wharfmaster Dizzywig",  At="Wharfmaster Dizzywig", point={x=7779,y=7725}},
        {Text="Accept Hemet Nesingwary",  At="Hemet Nesingwary", point={x=7779,y=7725}},

        {Text="Run to Tanaris", Zone="Tanaris", point={x=7434,y=9553}},
        {Text="Get Sarah's Ring from bank.", Proximity=15, point={x=5230,y=2891}},
        {Text="Discover the FP", Proximity=20, point={x=5101,y=2935}},
        {Text="Hearthstone to Theramore", Zone="Dustwallow Marsh", UseItem="Hearthstone" },

        {Text="Deliver Highperch Venom", Dt={q="Highperch Venom"}, point={x=6640,y=4562}},
        {Text="Deliver Stinky's Escape just besides (if done)", Dt={q="Stinky's Escape"}, point={x=6634,y=4547}},

        {Text="Deliver The Orc Report (by entrace to theramore)", Dt={q="The Orc Report"}, point={x=6515,y=4719}},
        {Text="Accept Captain Vimes", At="Captain Vimes", point={x=6515,y=4719}},

        {Text="Enter main keep, second floor mainroom. Deliver Captain Vimes", Dt={q="Captain Vimes"}, point={x=6821,y=4862}},
        
        {Text="Deliver Lieutenant Paval Reethe", Dt={q="Lieutenant Paval Reethe"}, point={x=6821,y=4862}},
        {Text="Accept Lieutenant Paval Reethe", At="Lieutenant Paval Reethe", point={x=6821,y=4862}},
        
        {Text="Deliver The Black Shield", Dt={q="The Black Shield"}, point={x=6821,y=4862}},
        {Text="Accept The Black Shield", At="The Black Shield", point={x=6821,y=4862}},

        {Text="Deliver Suspicious Hoofprints", Dt={q="Suspicious Hoofprints"}, point={x=6821,y=4862}},

        {Text="Deliver Lieutenant Paval Reethe (just behind you)", Dt={q="Lieutenant Paval Reethe"}, point={x=6805,y=4811}},
        {Text="Accept Daelin's Men", At="Daelin's Men", point={x=6805,y=4811}},

        {Text="Deliver Daelin's Men (back to previous guy)", Dt={q="Daelin's Men"}, point={x=6821,y=4862}},
        {Text="Accept The Deserters", At="The Deserters", point={x=6821,y=4862}},

        {Text="Across theramore, at the BS, Deliver The Black Shield", Dt={q="The Black Shield"}, point={x=6476,y=5043}},
        {Text="Accept The Black Shield", At="The Black Shield", point={x=6476,y=5043}},

        {Text="Back to captain in keep. Deliver The Black Shield", Dt={q="The Black Shield"}, point={x=6821,y=4862}},
        {Text="Accept The Black Shield", At="The Black Shield", point={x=6821,y=4862}},


        {Text="Follow the shore to Barrens. Can complete murlocs for Hungry! if convenient", Zone="The Barrens", point={x=5372,y=1110}},

        {Text="Keep running to Ratchet. Discover FP", Proximity=15, point={x=6308,y=3716}},
        {Text="Deliver Goblin Sponsorship", Dt={q="Goblin Sponsorship"}, point={x=6268,y=3627}},
        {Text="Accept Goblin Sponsorship", At="Goblin Sponsorship", point={x=6268,y=3627}},

        {Text="Deliver Wharfmaster Dizzywig (at the pier)", Dt={q="Wharfmaster Dizzywig"}, point={x=6335,y=3846}},
        
        -- TODO: Can we wait with accepting this until we are going back to shimmering flats, or are we not
        -- going by ratchet next time?
        {Text="Accept Parts for Kravel", At="Parts for Kravel", point={x=6268,y=3627}},
        {Text="Take boat to Booty Bay", Zone="Stranglethorn Vale"},
    }
}