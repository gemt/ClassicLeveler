-- Author      : G3m7
-- Create Date : 5/11/2019 12:37:59 PM

CLGuide_Desolace = {
    Title="36-37 Desolace",
    Pinboard = {},
    Steps = {
        {Text="Turn in any cloth you can at gnomes", point={x=7405,y=4813}},
        {Text="Turn in Sully Balloo's Letter if you have it (from arathi border, in water)", Dt={q="Sully Balloo's Letter"}, point={x=6380,y=6774}},
        {Text="(if above) Accept Sara Balloo's Plea", At="Sara Balloo's Plea", point={x=6380,y=6774}},
        {Text="(if above) Turn in Sara Balloo's Plea (at king)", Dt={q="Sara Balloo's Plea"}, point={x=3911,y=5616}},
        {Text="(if above) Accept A King's Tribute", At="A King's Tribute", point={x=6380,y=6774}},
        {Text="(if above) Turn inn A King's Tribute", Dt={q="A King's Tribute"}, point={x=3968,y=8522}},
        {Text="(if above) Accept A King's Tribute", At="A King's Tribute", point={x=3968,y=8522}},

        {Text="Turn inn Letter to Stormpike (Hall of Explorers)", Dt={q="Letter to Stormpike"}, point={x=7465,y=1173}},
        {Text="Accept Further Mysteries", At="Further Mysteries", point={x=7465,y=1173}},

        {Text="Accept Reclaimers' Business in Desolace", At="Reclaimers' Business in Desolace", point={x=6792,y=1750}},

        -- todo: triggers to get to desolace
        -- fly to menethil
        -- boat to theramore
        {Text="Turn inn Morgan Stern (At the Inn). Skip followup for now", Dt={q="Morgan Stern"}, point={x=6634,y=4547}},

        -- fly to stonetalon peak, or otherwise get there through astranaar
        -- run to Nijel's Point
        {Text="Accept Vahlarriel's Search", At="Vahlarriel's Search", point={x=6644,y=1182}},

        {Text="Accept Centaur Bounty", At="Centaur Bounty", point={x=6674,y=1087},
            PinAdd="If you are far behind lvl 36, do one of the Alliance quests too"},
        
        {Text="Deliver Reclaimers' Business in Desolace", Dt={q="Reclaimers' Business in Desolace"}, point={x=6620,y=962}},
        {Text="Accept The Karnitol Shipwreck", At="The Karnitol Shipwreck", point={x=6620,y=962}},
        {Text="Accept Reagents for Reclaimers Inc.", At="Reagents for Reclaimers Inc.", point={x=6620,y=962}},
        {Text="Discover the FP", Proximity=15, point={x=6466,y=1054}},
        {Text="Set HS in Desolace", SetHs="Innkeeper Lyshaerya", point={x=6628,y=655}},
        {Text="Buy Razor Arrows", BuyItem={Npc="Christi Galvanis", Item="Razor Arrow", Count=2000}, point={x=6662,y=698}},
        
        -- this step may become optional (SM prequest)
        {Text="Deliver Brother Anton", Dt={q="Brother Anton"}, point={x=6652,y=791}},
        {Text="Accept Down the Scarlet Path", At="Down the Scarlet Path", point={x=6652,y=791}},
        

        -- exit nijels point
        {Text="Deliver Vahlarriel's Search. Exit Nijels and go west", Dt={q="Vahlarriel's Search"}, point={x=5654,y=1782}},
        {Text="Accept Vahlarriel's Search", At="Vahlarriel's Search", point={x=5654,y=1782}},

        {Text="Complete Reagents for Reclaimers Inc (Satyrs SE of Nijels)", Ct="Reagents for Reclaimers Inc.", point={x=7546,y=2410}},
        
        -- only worth if we can HS already now. Main reason for doing is because its a green quest already at 36
        -- if hs is not ready, just wait with completing centaur bounty and run to nijels after Reagents is done
        {Text="Complete Centaur Bounty (further south)", Ct="Centaur Bounty", point={x=7201,y=4324}},
        {Text="Hearthstone to Nijels", UseItem="Hearthstone", Proximity=50, point={x=6626,y=662}},
        {Text="Buy Razor Arrows", BuyItem={Npc="Christi Galvanis", Item="Razor Arrow", Count=2000}, point={x=6662,y=698}},
        {Text="Deliver Reagents for Reclaimers Inc", Dt={q="Reagents for Reclaimers Inc."}, point={x=6620,y=963}},
        {Text="Accept Reagents for Reclaimers Inc.", At="Reagents for Reclaimers Inc.", point={x=6620,y=962}},
        -- if we did the early HS
        {Text="Deliver Centaur Bounty", Dt={q="Centaur Bounty"}, point={x=6674,y=1087}},
        {Text="Deliver Vahlarriel's Search", Dt={q="Vahlarriel's Search"}, point={x=6644,y=1182}},
        {Text="Accept Vahlarriel's Search", At="Vahlarriel's Search", point={x=6644,y=1182}},

        
        -- Exit nijels again
        {Text="Accept Bone Collector (to the south)", At="Bone Collector", point={x=6233,y=3898},
            PinAdd="Kill scorpions on the way for venom"},
        

        -- kodo roundup/bone collector/aged kodo for reagents
        {Text="Accept Kodo Roundup", At="Kodo Roundup", point={x=6087,y=6186},
            PinAdd="Keep an eye out for Aged Kodos now until got 3 hides"},
        {Text="Complete Kodo Roundup and Bone Collector", Mct={"Kodo Roundup", "Bone Collector"}, point={x=5418,y=6171},
            PinAdd="If doing down the scarlet path; get Ghost-o-Plasm Round Up SW corner of kodo GY"},
        {Text="Deliver Kodo Roundup", Dt={q="Kodo Roundup", Item="Wrangling Spaulders", Vendor="Wrangling Spaulders"}, point={x=6087,y=6186}},

        -- run to shipwreck
        {Text="Deliver The Karnitol Shipwreck", Dt={q="The Karnitol Shipwreck"}, point={x=3611,y=3046}},
        {Text="Accept The Karnitol Shipwreck", At="The Karnitol Shipwreck", point={x=3611,y=3046}},
        {Text="Accept Claim Rackmore's Treasure (book on barrel)", At="Claim Rackmore's Treasure", point={x=3607,y=3040}},
        {Text="Farm the Drysnaps in the water for Rackmore's Silver Key", Item={Name="Rackmore's Silver Key", Count=1}},

        --lighthouse
        -- must come before thunder axe fortress
        {Text="Accept Sceptre of Light (by the lighthouse)", At="Sceptre of Light", point={x=3888,y=2717}},


        -- run to thunder axe fortress
        --thunder axe fortress
        {Text="Complete Sceptre of Light (Burning Blade Seer in tower)", Ct="Sceptre of Light", point={x=5517,y=3015}},
        {Text="Deliver Vahlarriel's Search (inside thunder axe fortress)", Dt={q="Vahlarriel's Search"}, point={x=5486,y=2613}},
        {Text="Accept Search for Tyranis", At="Search for Tyranis", point={x=5486,y=2613}},
        {Text="Complete Search for Tyranis by killing Tyranis Malem (go out, building on right)", Ct="Search for Tyranis", point={x=5301,y=2908}},
        {Text="Deliver Search for Tyranis (back in other building)", Dt={q="Search for Tyranis"}, point={x=5486,y=2613}},
        {Text="Accept Return to Vahlarriel (ESCORT QUEST)", At="Return to Vahlarriel", point={x=5486,y=2613}},
        -- Ct scorpions/kodos on way back to nijel if not yet done

        {Text="Delliver Bone Collector (to the south)", Dt={q="Bone Collector"}, point={x=6233,y=3898}, PinAdd="Equip the new neck"},
        {Text="Complete Reagents for Reclaimers Inc before returning to Nijel", Ct="Reagents for Reclaimers Inc.", point={x=6665,y=2435}},


        -- run to nijel, deliver stufff
        {Text="Deliver Return to Vahlarriel", Dt={q="Return to Vahlarriel"}, point={x=6645,y=1182}},
        {Text="Deliver The Karnitol Shipwreck", Dt={q="The Karnitol Shipwreck"}, point={x=6620,y=963}},
        {Text="Accept The Karnitol Shipwreck", At="The Karnitol Shipwreck", point={x=6620,y=963}},
        {Text="Deliver Reagents for Reclaimers Inc.", Dt={q="Reagents for Reclaimers Inc."}, point={x=6620,y=963}},
        {Text="Accept Reagents for Reclaimers Inc.", At="Reagents for Reclaimers Inc.", point={x=6620,y=963}},
        {Text="Buy Razor Arrows", BuyItem={Npc="Christi Galvanis", Item="Razor Arrow", Count=2000}, point={x=6662,y=698}},


        -- water outside lighthouse quests
        {Text="Deliver Sceptre of Light (by the lighthouse)", Dt={q="Sceptre of Light"}, point={x=3888,y=2717}},
        {Text="Accept Book of the Ancients", At="Book of the Ancients", point={x=3888,y=2717}},
        {Text="Complete Claim Rackmore's Treasure by finding the Golden Key on nagas close to shore", 
            Ct="Claim Rackmore's Treasure", point={x=3686,y=2551}},

        {Text="Turn inn Claim Rackmore's Treasure (at outer isle)", Dt={q="Claim Rackmore's Treasure"}, point={x=3000,y=871}},
        {Text="Complete Book of the Ancients; Click statue, kill 38 mob that spawns for loot", Ct="Book of the Ancients", point={x=2820,y=662}},
        {Text="Complete The Kernitol Shipwreck. Drops from Sea Witch and Tidehunter on and around the isle", Ct="The Kernitol Shipwreck"},
        {Text="Deliver Book of the Ancients (by the lighthouse)", Dt={q="Book of the Ancients", Item="Silkstream Cuffs", Use=1}, point={x=3888,y=2717}},

        -- THIS IS NOT A GOOD QUEST FOR GROUPS
        {Text="Complete Reagents for Reclaimers Inc. (at demon ruins)", Ct="Reagents for Reclaimers Inc.", point={x=5142,y=8266},
            PinAdd="Can clear out, then go next step, and complete on way back to deliver Ghost-o-plasm"},
        {Text="Complete Down the Scarlet Path and Ghost-o-plasm Round Up", Mct={"Down the Scarlet Path", "Ghost-o-plasm Round Up"}, point={x=6383,y=9177}},
        {Text="Deliver Ghost-o-plasm Round Up", Dt={q="Ghost-o-plasm Round Up", Item="Condor Bracers", Use=1}, point={x=4783,y=6183}},
        -- not doing UseItem hs so the condor bracers button will be shown instead
        {Text="Hearthstone to Nijels", Proximity=50, point={x=6626,y=662}},
        

        {Text="Buy Razor Arrows/Vendor", BuyItem={Npc="Christi Galvanis", Item="Razor Arrow", Count=2000}, point={x=6662,y=698}},
        {Text="Deliver Down the Scarlet Path", Dt={q="Down the Scarlet Path"}, point={x=6652,y=791}},
        {Text="Accept Down the Scarlet Path", At="Down the Scarlet Path", point={x=6652,y=791}},

        {Text="Deliver The Karnitol Shipwreck", Dt={q="The Karnitol Shipwreck"}, point={x=6620,y=963}},
        {Text="Accept The Karnitol Shipwreck", At="The Karnitol Shipwreck", point={x=6620,y=963}},
        {Text="Deliver Reagents for Reclaimers Inc.", Dt={q="Reagents for Reclaimers Inc."}, point={x=6620,y=963}},
        {Text="Accept Reagents for Reclaimers Inc.", At="Reagents for Reclaimers Inc.", point={x=6620,y=963}},
        
        {Text="Fly to Theramore, Dustwallow Marsh", Taxi="Theramore, Dustwallow Marsh", point={x=6466,y=1053}},

        {Text="---"},
        -- after finishing desolace, fly back to theramore
        -- accept various quests
        --{Text="Accept Morgan Stern (At the Inn)", At="Morgan Stern", point={x=6634,y=4547}},
    }
}