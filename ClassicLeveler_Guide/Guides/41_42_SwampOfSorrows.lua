-- Author      : G3m7
-- Create Date : 5/11/2019 12:39:27 PM

CLGuide_SwampOfSorrows = {
    Title="41-42 Swamp of Sorrows",
    Pinboard = {},
    Steps = {
        {Text="Deliver The Perenolde Tiara in the keep if completed (first right)", Dt={q="The Perenolde Tiara", SkipIfNotHaveQuest=1}, point={x=7401,y=3024}},
        {Text="Deliver Return to Milton if completed (first left in keep)", Dt={q="Return to Milton", SkipIfNotHaveQuest=1}, point={x=7418,y=749}},
        {Text="Accept In Search of The Temple (bar next to hunter trainer in dwarf district)", At="In Search of The Temple", point={x=6433,y=2066}},
        
        -- todo: train hunter spells
        {Text="Get/put cloth from bank and deliver SW turnins", PutInBank={"Silk Cloth", "Wool Cloth", "Mageweave Cloth", "Runecloth"}, point={x=5702,y=7299}},
        
        {Text="Accept Mazen's Behest (oposite of stockades)", At="Mazen's Behest", point={x=4153,y=6439}},
        {Text="Deliver Mazen's Behest (second floor)", Dt={q="Mazen's Behest"}, point={x=4097,y=6385}},
        {Text="Accept Mazen's Behest", At="Mazen's Behest", point={x=4153,y=6439}},

        {Text="Accept Vital Supplies (in mage tower)", At="Vital Supplies", point={x=3753,y=8168}},

        {Text="Do cloth donations if any possible (second floor)", point={x=4428,y=7400}},
        
        {Text="Fly to Darkshire", Taxi="Darkshire, Duskwood", point={x=6626,y=6214}},

        {Text="Deliver Vital Supplies", Dt={q="Vital Supplies"}, point={x=7578,y=4616}},
        
        -- tood: HS in SW, darkshire or what?
        
        -- todo: will we be able to complete the SoS before timer expires?
        -- with the ... and bugs quest possibly not
        {Text="Accept Supplies for Nethergarde", At="Supplies for Nethergarde", point={x=7578,y=4616},
            PinAdd="You're now on a 60 min timer!"},
        -- groups doing ZF:
        --{Text="Accept Tabetah's Task (through portal in mage tower)", At="Tabetah's Task"},

        {Text="---"},
    }
}