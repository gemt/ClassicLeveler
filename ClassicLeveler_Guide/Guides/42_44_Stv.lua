-- Author      : G3m7
-- Create Date : 5/11/2019 12:39:45 PM

CLGuide_Stv2 = {
    Title="42-44 STV",
    Pinboard = {},
    Steps = {
        -- booty bay:
        {Text="Accept Skullsplitter Tusks (Inn, 3rd floor)", At="Skullsplitter Tusks", point={x=2700,y=7712}}, 
        
        {Text="Deliver Ansirem's Key (Inn, 2nd floor)", Dt={q="Ansirem's Key"}, point={x=2728,y=7753}},
        {Text="Accept \"Pretty Boy\" Duncan", At="\"Pretty Boy\" Duncan", point={x=2728,y=7753}}, 

        {Text="Set HS in BB (1st floor)", SetHs="Innkeeper Skindle", point={x=2704,y=7731}},

        {Text="Accept Venture Company Mining (Inn, 1st floor)", At="Venture Company Mining", point={x=2712,y=7721}}, 
        {Text="Accept Zanzil's Secret (Inn, 1st floor)", At="Zanzil's Secret", point={x=2712,y=7721}}, 

        {Text="Accept Akiris by the Bundle (by bank)", At="Akiris by the Bundle", point={x=2676,y=7638}}, 
        {Text="Bank any cloth you may have", PutInBank={"Silk Cloth", "Wool Cloth", "Mageweave Cloth", "Runecloth"}, point={x=2654,y=7657}},

        {Text="Accept Scaring Shaky", At="Scaring Shaky", point={x=2778,y=7707}}, 
        {Text="Accept Stoley's Debt", At="Stoley's Debt", point={x=2778,y=7707}}, 

        {Text="Accept Stranglethorn Fever", At="Stranglethorn Fever", point={x=2761,y=7674}}, 

        {Text="Accept The Bloodsail Buccaneers", At="The Bloodsail Buccaneers", point={x=2809,y=7622}}, 
        {Text="Accept The Captain's Chest", At="The Captain's Chest", point={x=2670,y=7361}}, 

        {Text="Complete \"Pretty Boy\" Duncan (Exit BB, then left)", Ct="\"Pretty Boy\" Duncan", point={x=2739,y=6942}}, 
        {Text="Deliver The Bloodsail Buccaneers (note at the barrel)", Dt={q="The Bloodsail Buccaneers"}, point={x=2728,y=6952}}, 
        {Text="Accept The Bloodsail Buccaneers", At="The Bloodsail Buccaneers", point={x=2728,y=6952}}, 

        {Text="Complete Scaring Shaky (drops from gorillas)", Ct="Scaring Shaky", point={x=3175,y=6752}}, 

        -- TODO: will there be enough space in questlog to keep raptor/panter mastery + troll witchery + colonel kurzen?
        {Text="Accept Raptor Mastery pt3", At="Raptor Mastery", point={x=3566,y=1081}}, 
        {Text="Accept Panther Mastery pt4", At="Panther Mastery", point={x=3555,y=1055}},
        -- venture company mining, by innkeeper
        -- skullsplitter tusks
        -- Excelsior (LW dude)

        --troll witchery from rebel camp


        -- repick from 34_36 stv section if we are going to shimmering later
        {Text="Accept Goblin Sponsorship", At="Goblin Sponsorship", point={x=2722,y=7687}},
        -- q to go to tanaris
        {Text="Accept Tran'rek", At="Tran'rek", point={x=2695,y=7721}}, 
        -- remember whiskey slim's lost grog

        {Text="---"},
    }
}