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
        {Text="Accept Jarl Needs Eyes", At="Jarl Needs Eyes", point={x=5544,y=2627}},

        {Text="Accept The Orc Report (dirtpile next to Jarls house)", At="The Orc Report", point={x=5544,y=2593}},

        {Text="Deliver The Missing Diplomat (outside Northern tower)", Dt={q="The Missing Diplomat"}, point={x=4522,y=2464},
            PinAdd="On Accepting followup, Hendel+2x 35 guards attack. One Frost trap, nuke hendel or kite?"},

        {Text="Accept The Missing Diplomat", At="The Missing Diplomat", point={x=4522,y=2464}},
        {Text="Deliver The Missing Diplomat Archmage that spawns", Dt={q="The Missing Diplomat"}, point={x=4519,y=2427}},
        {Text="Accept The Missing Diplomat", At="The Missing Diplomat", point={x=4519,y=2427}},
        {Text="Deliver The Missing Diplomat to Jaina next to him", Dt={q="The Missing Diplomat"}, point={x=4519,y=2427}},

        -- TODO: lvl 36-37 mobs, possibly wait until later, but are we ever getting back exactly here in a nice way?
        {Text="Accept Stinky's Escape", At="Stinky's Escape", point={x=4688,y=1753}},
        {Text="Complete Stinky's Escape (finishes at point)", Ct="Stinky's Escape", point={x=4885,y=2460}},

        {Text="Accept Hungry!", At="Hungry!", point={x=3515,y=3827}},

        {Text="Accept Suspicious Hoofprints", At="Suspicious Hoofprints", point={x=2969,y=4763}, PinAdd="Need 3 bagspace for this"},
        {Text="Accept Lieutenant Paval Reethe", At="Lieutenant Paval Reethe", point={x=2983,y=4824}},
        {Text="Accept The Black Shield", At="The Black Shield", point={x=2963,y=4859}},


        {Text="Enter Barrens, run to 1KN elevator", Proximity=50, point={x=4422,y=9142}},

        {Text="Loot Henrig Lonebrow's Journal from corpse below elevator", Item={Name="Henrig Lonebrow's Journal", Count=1}, point={x=3073,y=2434}},
        {Text="Accept Lonebrow's Journal from book", At="Lonebrow's Journal", UseItem="Henrig Lonebrow's Journal"},

        {Text="Run West to Feralas, ==get FP== and turn inn Lonebrow's Journal", Dt={q="Lonebrow's Journal"}, point={x=846,y=1781}},
        {Text="Complete Highperch Venom at gryphon place. Skip if crowded by horde", Ct="Highperch Venom", point={x=1413,y=3328}},

        {Text="Run all the way to shimmering flats"},


    }
}