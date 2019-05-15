-- Author      : G3m7
-- Create Date : 5/11/2019 12:38:40 PM

CLGuide_Arathi_Alterac = {
    Title="37-39 Arathi/Alterac",
    Pinboard = {},
    Steps = {
        -- fly to arathi highlands
        {Text="Buy Razor Arrows", BuyItem={Npc="Vikki Lonsav", Item="Razor Arrow", Count=2000}, point={x=4644,y=4760}},
        {Text="Accept Worth Its Weight in Gold", At="Worth Its Weight in Gold", point={x=4620,y=4775}},
        {Text="Accept Wanted! Marez Cowl", At="Wanted! Marez Cowl", point={x=4605,y=4777}},
        -- GROUPS:
        --{Text="Accept Wanted! Otto and Falconcrest", At="Otto and Falconcrest", point={x=4605,y=4777}},
        -- pick up on hints of a new plague chain where u left off at 32
        {Text="Attempt Hints of a new plague again", PinAdd="If not killed courier, be on lookup during zone"},
        {Text="Accept The Princess Trapped", At="The Princess Trapped", point={x=6242,y=3369}},
        {Text="Complete The Princess Trapped to the east", At="The Princess Trapped", point={x=6242,y=3369}},
        {Text="Deliver The Princess Trapped (in the cave)", Dt={q="The Princess Trapped"}, point={x=8431,y=3095}},
        {Text="Complete Stones of Binding", At="Stones of Binding", point={x=8431,y=3095}},
        
        {Text="Get Cresting Key (NE)", Item={Name="Cresting Key", Count=1}, point={x=6670,y=2977}},
        {Text="Complete Worth Its Weight in Gold (SE) (do mobs in cave)", Ct="Worth Its Weight in Gold", point={x=6610,y=6224}},
        
        {Text="Get Thundering Key (east of refuge pointe)", Item={Name="Thundering Key", Count=1}, point={x=5202,y=5068}},

        {Text="Deliver Worth Its Weight in Gold (Refuge Pointe)", Dt={q="Worth Its Weight in Gold"}, point={x=6610,y=6224}},
        {Text="Accept Wand over Fist", At="Wand over Fist", point={x=4665,y=4702}},
        {Text="Buy Razor Arrows", BuyItem={Npc="Vikki Lonsav", Item="Razor Arrow", Count=2000}, point={x=4644,y=4760}},

        {Text="Complete Wand over Fist (Kor'gresh in ogre cave south)", Ct="Wand over Fist", point={x=5476,y=8190}},
        {Text="Deliver Wand over Fist", Dt={q="Wand over Fist"}, point={x=4665,y=4702}},
        -- Groups: accept Trelane's Defenses

        {Text="Get Burning Key (far west). Stones of binding should now be completed", Ct="Stones of Binding", point={x=2548,y=3015}},
        
        -- what you do here depends on grp or not
        {Text="Complete Stormgarde Badges and attempt Marez Cowl", Mct={"Stormgarde Badges"}, point={x=2977,y=6236}},
        
        {Text="Deliver Stones of Binding", Dt={q="Stones of Binding"}, point={x=3622,y=5739}},
        -- Maybe only for grps, unless can kite solo as  hunter
        {Text="Accept Breaking the Keystone", Dt={q="Breaking the Keystone"}, point={x=3622,y=5739}},
        
        -- TODO: are we doing water quests or not. They are a bit SHIT

        {Text="Deliver any quests you did at stormgarde in Refuge Pointe, then fly to Southshore", point={x=4618,y=4639}},

        -- fly southshore
        -- TODO: open question if we will still have the perenolde tiara/preserving knowledge here
        -- TODO: as a group you will want to have Crushridge Warmongers instead of Crushridge Bounty, which should have been done at 30_32 section
        {Text="Accept Preserving Knowledge", At="Preserving Knowledge", point={x=5057,y=5709}},
        {Text="Accept Crushridge Bounty", At="Crushridge Bounty", point={x=4947,y=5870}},
        {Text="Accept Noble Deaths", At="Noble Deaths", point={x=4814,y=5911}},
        {Text="Deliver Further Mysteries", Dt={q="Further Mysteries"}, point={x=4814,y=5911}},
        {Text="Accept Dark Council", At="Dark Council", point={x=4814,y=5911}},
        {Text="Deliver Down the scarlet path (if done. Seconf floor inn)", Dt={q="Down the Scarlet Path"}, point={x=5145,y=5840}},
        -- If doing SM, accept in the name of the light...

        -- todo: any way we can set HS in wetlands when coming from theramore instead,
        -- use a deathwarp back to southshore and hs? 
        {Text="Set HS at Innkeeper Anderson", SetHs="Innkeeper Anderson", point={x=5117,y=5892}},

        --todo: forgot to bring this quest from BB on first iteration. Need to find best spot to put it:
        {Text="Deliver Magical Analysis (by dalaran in Alterac Mountains)", Dt={q="Magical Analysis"}, point={x=1883,y=7849}},
        {Text="Accept Ansirem's Key", At="Ansirem's Key", point={x=1883,y=7849}},

        {Text="Run into Alterac Mountains. Kill Ogres towards elites."},
        {Text="Get Worn Leather Book for Preserving Knowledge. Try loot through wall at point", point={x=3822,y=4632}},
        {Text="Try to find Grel'Borg (The Perenolde Tiara). Patrolls from cellar in keep and out to entrance of ogre place", 
            Ct="The Perenolde Tiara", point={x=3725,y=5298}},
        {Text="Make sure Preserving Knowledge and Crushridge Bounty is complete", Mct={"Preserving Knowledge","Crushridge Bounty"}},
        {Text="Get Chillwind Camp FP"},
        {Text="Complete Noble Deaths and Dark Council (Generally 1 Shadow mage in each camp/house)", 
            Mct={"Noble Deaths", "Dark Council"}, PinAdd="Remember need Nagaz all the way NW to complete dark council", point={x=5661,y=4815}},
        
        -- heartstone or deathwarp to southshore
        {Text="Deathwarp back to Southshore", DeathWarp=1},

        {Text="Deliver Preserving Knowledge", Dt={q="Preserving Knowledge"}, point={x=5057,y=5709}},
        {Text="Accept Return to Milton", At="Return to Milton", point={x=5057,y=5709}},
        {Text="Deliver Crushridge Bounty (skip followup)", Dt={q="Crushridge Bounty"}, point={x=4947,y=5870}},
        {Text="Deliver Noble Deaths", Dt={q="Noble Deaths"}, point={x=4814,y=5911}},
        {Text="Deliver Dark Council", Dt={q="Dark Council"}, point={x=4814,y=5911}},

        -- HS menethil/fly IF
        {Text="Get to IF. Either HS menethil or fly directly to IF"},
        {Text="Fly to IF", Taxi="Ironforge, Dun Morogh"},

        {Text="Deliver The Karnitol Shipwreck (Hall of Explorers)", Dt={q="The Karnitol Shipwreck", Item="Hellion Boots", Use=1}, point={x=6790,y=1754}},
        {Text="Deliver Reagents for Reclaimers Inc.", Dt={q="Reagents for Reclaimers Inc.", Item="Auric Bracers", Vendor="Auric Bracers"}, point={x=6790,y=1754}},

        {Text="Accept Ironband Wants You! (prospector stormpike in hall of explorers)", At="Ironband Wants You!", point={x=7466,y=1173}},
        -- groups: get uldaman q too
        -- todo: arrows?
        -- todo: class/pet skills
        -- todo: check AH for frost oil
        -- todo: buy Gyrochronatom (engineer vendor) IF got frost oil
        -- todo: healing potion & lesser invisibility potion (if got did gyrochronatom)
        -- todo: bank cloth and/or deliver cloth donation
    }
}