-- Author      : G3m7
-- Create Date : 5/11/2019 12:39:27 PM

CLGuide_SwampOfSorrows = {
    Title="41-42 Swamp of Sorrows",
    Pinboard = {},
    Steps = {
        {Text="Deliver The Perenolde Tiara in the keep if completed (first right)", Dt={q="The Perenolde Tiara", SkipIfNotHaveQuest=1}, point={x=7401,y=3024}},
        {Text="Deliver Return to Milton if completed (first left in keep)", Dt={q="Return to Milton", SkipIfNotHaveQuest=1}, point={x=7418,y=749}},
        {Text="Accept In Search of The Temple (bar next to hunter trainer in dwarf district)", At="In Search of The Temple", point={x=6433,y=2066}},
        
        -- todo: train lvl 40 hunter spells

        {Text="Get/put cloth from bank and deliver SW turnins", PutInBank={"Silk Cloth", "Wool Cloth", "Mageweave Cloth", "Runecloth"}, point={x=5702,y=7299}},
        {Text="Set HS in SW", SetHs="Innkeeper Allison", point={x=5261,y=6572}},

        {Text="Accept Mazen's Behest (oposite of stockades)", At="Mazen's Behest", point={x=4153,y=6439}},
        {Text="Deliver Mazen's Behest (second floor)", Dt={q="Mazen's Behest"}, point={x=4097,y=6385}},
        {Text="Accept Mazen's Behest", At="Mazen's Behest", point={x=4153,y=6439}},

        {Text="Accept Vital Supplies (in mage tower)", At="Vital Supplies", point={x=3753,y=8168}},
        -- groups doing ZF:
        --{Text="Accept Tabetah's Task (through portal in mage tower)", At="Tabetah's Task"},

        {Text="Do cloth donations if any possible (second floor)", point={x=4428,y=7400}},
        
        {Text="Fly to Darkshire", Taxi="Darkshire, Duskwood", point={x=6626,y=6214}},

        {Text="Deliver Vital Supplies", Dt={q="Vital Supplies"}, point={x=7578,y=4616}},
        
        -- todo: will we be able to complete the SoS before timer expires?
        -- with the ... and bugs quest possibly not
        -- edit: dosent matter much. Can do it again in the ~lvl 50 section, but try anyway
        {Text="Accept Supplies for Nethergarde", At="Supplies for Nethergarde", point={x=7578,y=4616},
            PinAdd="You're now on a 60 min timer!"},

        {Text="Run into Deadwind Pass", Zone="Deadwind pass", point={x=9113,y=4158}},
        {Text="Run into Swamp of Sorrows", Zone="Swamp of Sorrows", point={x=5978,y=4105}},

        {Text="Accept Encroaching Wildlife", At="Encroaching Wildlife", point={x=2675,y=5983}},
        {Text="Complete Encroaching Wildlife", At="Encroaching Wildlife", point={x=2675,y=5983},
            PinAdd="Search for Noboru the Cudgel (drops queststarter)"},

        {Text="Grind swampwalkers etc (NW corner) for Mazen's Behest (5% droprate?)", Ct="Mazen's Behest", point={x=1662,y=4025}},
        
        {Text="Deliver Encroaching Wildlife", Dt={q="Encroaching Wildlife"}, point={x=2675,y=5983}},
        {Text="Accept The Lost Caravan", At="The Lost Caravan", point={x=2675,y=5983}},

        {Text="Search for Noboru the Cudgel, get his wep for q", point={x=4707,y=3886}},

        {Text="Accept Draenethyst Crystals", At="Draenethyst Crystals", point={x=2598,y=3140}},

        {Text="Complete The Lost Caravan (loot chest at broken wagon)", At="The Lost Caravan", point={x=6447,y=1830},
            PinAdd="Loot Draenthyst crystals while here"},

        {Text="Accept Galen's Escape (if hes up in his cage). Escort him", At="Galen's Escape", point={x=6540,y=1820}},

        {Text="Complete Draenethyst Crystals", Ct="Draenethyst Crystals"},
        {Text="Deliver Galen's Escape The little box by the tent", Dt={q="Galen's Escape"}, point={x=4784,y=3976}},
        {Text="Deliver Draenethyst Crystals", Dt={q="Draenethyst Crystals"}, point={x=2598,y=3140}},

        {Text="Deliver The Lost Caravan ", Dt={q="The Lost Caravan"}, point={x=2675,y=5983}},
        {Text="Accept Driftwood", At="Driftwood", point={x=2675,y=5983}},

        {Text="Complete In Search of The Temple (just swim towards Sunken temple)", Ct="In Search of The Temple", point={x=5630,y=7600}},

        {Text="Complete ... and bugs, and Driftwood", Mct={"... and Bugs", "Driftwood"}, point={x=9477,y=4573}},
        
        {Text="Deliver Driftwood", Dt={q="Driftwood"}, point={x=2675,y=5983}},
        {Text="Accept Deliver the Shipment", At="Deliver the Shipment", point={x=2675,y=5983}},

        {Text="Run into Blasted Lands", Zone="Blasted Lands", point={x=3346,y=6687}},

        {Text="Deliver Mazen's Behest (top of the tower)", Dt={q="Mazen's Behest", Item="Wanderlust Boots"}, point={x=6765,y=1917},
            PinAdd="Compare the boots to what you have, may be upgrade if not have Hellion Boots"},

        {Text="Deliver Supplies for Nethergarde (if had enough time)", Dt={q="Supplies for Nethergarde"}, point={x=6652,y=2138},
            PinAdd="If you didnt have enough time, abandon/delete item. Will do again at ~50"},

        {Text="Deliver Deliver the Shipment", Dt={q="Deliver the Shipment"}, point={x=6652,y=2138}},

        {Text="Hearthstone to SW", UseItem="Hearthstone", Zone="Stormwind City"},
        {Text="Deliver In Search of The Temple (bar next to hunter trainer in dwarf district)", Dt={q="In Search of The Temple"}, point={x=6433,y=2066}},
        {Text="Accept To The Hinterlands", At="To The Hinterlands", point={x=6433,y=2066}},

        -- todo: put a copy of the lvl 40 training of spells here in case were somehow not 40 before SoR

        {Text="Fly to Booty Bay", Taxi="Booty Bay, Stranglethorn", point={x=6630,y=6217}},
        -- 5 quests in qlog atm correct?
    }
}