-- Author      : G3m7
-- Create Date : 5/5/2019 5:19:05 PM

CLGuide_Duskwood2 = {
    Title="28-30 Duskwood",
    Pinboard = {"Keep an eye out for \"An Old History Book\""},
    Steps = {
        -- should have already bought arrows in menethil
        --[[
        going into this section should already have:
            gather rot blossoms
            sven's camp
            the totem of infliction
            the night watch (plague spreaders)
            the legend of stalvan (final part)
        ]]
        --potentially finish legend of stalvan here
        --advantage: get ring early & less competition
        --disadvantage: lvl 32 mob, mob could reset due to misses if unlucky
        -- TOOD: Test kite him at 27 and 28
        {Text="Complete A Noble Brew by looting Tear of Tiloa at Manor Mistmantle", Ct="A Noble Brew", point={x=7836,y=3595}},
        {Text="Complete The Legend of Stalvan. Kite him towards Darkshire", Ct="The Legend of Stalvan"},
        {Text="Deliver The Legend of Stalvan", Dt={q="The Legend of Stalvan", Item="Ring of Forlorn Spirits", Use=1}, point={x=7581,y=4530}},

        {Text="Accept Worgen in the Woods (pt1)", At="Worgen in the Woods", point={x=7558,y=4791}},
        {Text="If had Bronze Tube: Accept Look To The Stars, otherwise check vendor", At="Look To The Stars", point={x=7980,y=4798}},
        
        {Text="Complete worgen in the woods (6 shadowcasters) to the west", Ct="Worgen in the Woods", point={x=6280,y=4560}},
        {Text="Turn Worgen in the Woods.", Dt={q="Worgen in the Woods"}, point={x=7558,y=4791}},
        {Text="Accept Worgen in the Woods (pt2)", At="Worgen in the Woods", point={x=7558,y=4791}},
        
        {Text="Accept Look To The Stars", At="Look To The Stars", point={x=7980,y=4802}},

        {Text="Complete Worgen in the Woods pt2 (runners)", Ct="Worgen in the Woods", point={x=6240,y=6990}},

        -- could delay this one round, especially if still 27. Main reason to do now is if HS has long cd and we need to wait for it anyway
        -- CORRECTION: Definitely delay. WE get another quest to go down there later (Ogre Thieves)
        --{Text="IF lvl 28+: Complete Look to the stars (Zzarc'Vul in orgre cave)", Ct="Look To The Stars", point={x=3402,y=7669}},
        
        {Text="Turn Sven's Camp. (grind rot blossoms on any skeleton on the way through cemetary)", Dt={q="Sven's Camp"}, point={x=778,y=3406}},
        {Text="Accept The Shadowy Figure.", At="The Shadowy Figure", point={x=778,y=3406}},

        -- TODO: also complete the night watch (plague spreaders) and totem of infliction? or do we get a third quest for them later?
        {Text="Complete Gather Rot Blossoms (any skeleton, west crypt raiders/healers etc)", Ct="Gather Rot Blossoms"},
        --24-25 skeletons ~30k xph
	    --ghouls about the same
        {Text="Grind to lvl 28", Lvl={lvl=28}},

        {Text="Accept The Weathered Grave from grave behind house on top of hill", At="The Weathered Grave", point={x=1773,y=2909}},
        {Text="Keep grinding until heartstone is ready, then HS to Darkshire", Zone="Scarlet Raven Tavern", UseItem="Hearthstone"},
        --16h3min

        {Text="Turn inn Gather Rot Blossoms (in the inn)", Dt={q="Gather Rot Blossoms"}, point={x=7377,y=4448}},
        {Text="Accept Juice Delivery", At="Juice Delivery", point={x=7377,y=4448}},
        
        {Text="Turn The Shadowy Figure (Madam Eva)", Dt={q="The Shadowy Figure"}, point={x=7581,y=4530}},
        {Text="Accept The Shadowy Search Continues", At="The Shadowy Search Continues", point={x=7581,y=4530}},

        {Text="Turn Worgen in the Woods pt2", Dt={q="Worgen in the Woods"}, point={x=7558,y=4791}},
        {Text="Accept Worgen in the Woods pt3", At="Worgen in the Woods", point={x=7558,y=4791}},

        {Text="Turn inn The Shadowy Search Continues (town hall)", Dt={q="The Shadowy Search Continues"}, point={x=7252,y=4685}},
        {Text="Accept Inquire at the Inn", At="Inquire at the Inn", point={x=7252,y=4685}},	

        {Text="Turn The Weathered Grave (town hall)", Dt={q="The Weathered Grave"}, point={x=7263,y=4761}},
        {Text="Accept Morgan Ladimore", At="Morgan Ladimore", point={x=7263,y=4761}},
        {Text="Turn inn Morgan Ladimore (outside town hall)", Dt={q="Morgan Ladimore"}, point={x=7360,y=4689}, PinAdd="Can delete The Story of Morgan Ladimore (book)"},
        {Text="Accept Mor'Ladim", At="Mor'Ladim", point={x=7360,y=4689}},
        

        {Text="Turn inn Inquire at the Inn", Dt={q="Inquire at the Inn"}, point={x=7377,y=4448}},
        {Text="Accept Finding the Shadowy Figure", At="Finding the Shadowy Figure", point={x=7377,y=4448}},
        	
        {Text="Buy Razor Arrows (west outside inn)", BuyItem={Npc="Avette Fellwood", Item="Razor Arrow", Count=2000}, point={x=7302,y=4448}},

        {Text="Complete A Noble Brew by looting Tear of Tiloa at Manor Mistmantle", Ct="A Noble Brew", point={x=7836,y=3595}},
        {Text="Complete The Legend of Stalvan. Kite him towards Darkshire", Ct="The Legend of Stalvan"},

        {Text="Fly to SW", Taxi="Stormwind, Elwynn", point={x=7750,y=4428}},

        {Text="If you found \"An Old History Book\", accept the quest", At="An Old History Book", UseItem="An Old History Book"},
        {Text="Get cloth 60 Wool and (if have) Silk cloth from bank", PutInBank={"Silk Cloth", "Wool Cloth", "Mageweave Cloth", "Runecloth"}},
        {Text="(if had cloth) Turn inn A Donation of Wool (second floor)", Dt={q="A Donation of Wool", SkipIfUncomplete=1}, point={x=4418,y=7379}},
        {Text="(if had cloth) Turn inn A Donation of Silk (second floor)", Dt={q="A Donation of Silk", SkipIfUncomplete=1}, point={x=4418,y=7379}},
        {Text="test", Dt={q="The Totem of Infliction", SkipIfUncomplete=1}, point={x=4418,y=7379}},
        
        {Text="Deliver A Noble Brew at lock trainer", Dt={q="A Noble Brew"}, point={x=2922,y=7399}},
        {Text="Accept A Noble Brew pt2", At="A Noble Brew"},

        {Text="Deliver Cleansing the Eye (cathedral)", Dt={q="Cleansing the Eye"}, point={x=3960,y=2721}},

        {Text="Accept The Missing Diplomat from Thomas, patrolling in cathedral", At="The Missing Diplomat"},
        
        {Text="Accept Speaking of Fortitude (outside cathedral)", At="Speaking of Fortitude", point={x=4569,y=3841}},
        
        {Text="Train Hunter skills", 
            TrainSkill={
                {n="Aspect of the Hawk", r="Rank 3", Actionbar=49},
                {n="Mend Pet", r="Rank 3", Actionbar=62},
                {n="Rapid Fire", Actionbar=11},
                {n="Arcane Shot", r="Rank 4", Actionbar=3},
                {n="Serpent Sting",r="Rank 4", Actionbar=1},
                {n="Raptor Strike", r="Rank 4", Actionbar=2},
                {n="Immolation Trap",r="Rank 2", Actionbar=65},
            }, point={x=6153,y=1650}
        },
        {Text="Train Pet skills", 
            TrainSkill={
                {n="Great Stamina", "Rank 4"}, -- TODO: Last rank of great stamina?
                {n="Natural Armor", "Rank 4"},
            }, point={x=6153,y=1650}
        },

        {Text="Enter keep, first right, deliver A Noble Brew (No followup)", Dt={q="A Noble Brew"}, point={x=7522,y=3170}},
        {Text="Back to main hallway, first left to library. Deliver An Old History Book", Dt={q="An Old History Book"}, point={x=7416,y=748}},
        {Text="Accept Southshore (if you had old history book)", At="Southshore", point={x=7416,y=748}},
        {Text="Speaking of Fortitude", Dt={q="Speaking of Fortitude"}, point={x=7416,y=748}},
        {Text="Back to corridor, to king and first right for Missing Diplomat", Dt={q="The Missing Diplomat"}, point={x=7830,y=2547}},
        {Text="Accept The Missing Diplomat", At="The Missing Diplomat", point={x=7830,y=2547}},
        {Text="Jorgen, fishing at gates of SW, deliver Diplomat (jump from FP)", Dt={q="The Missing Diplomat"}, point={x=7312,y=7840}},
        {Text="Accept The Missing Diplomat", At="The Missing Diplomat", point={x=7312,y=7840}},

        {Text="Elling Trias, cheese vendor, first building on right side when entering SW (second floor)", Dt={q="The Missing Diplomat"}, point={x=5990,y=6414}},
        {Text="Accept The Missing Diplomat", At="The Missing Diplomat", point={x=5990,y=6414}},
        {Text="Fly to Darkshire", Taxi="Darkshire, Duskwood", point={x=6627,y=6218}},

        {Text="Watcher Backus, patrolling from darkshire to north on road. Diplomat", Dt={q="The Missing Diplomat"}, point={x=7318,y=3248}},
        {Text="Accept The Missing Diplomat", At="The Missing Diplomat", point={x=7318,y=3248}},

        {Text="Complete Worgen in the Woods pt3 (track undead)", Ct="Worgen in the Woods", point={x=7256,y=6710}},
        {Text="If not enough mobs => goto point to find more.", Ct="Worgen in the Woods", point={x=6539,y=8029}},

        {Text="Turn inn Finding the Shadowy Figure at raven hill", Dt={q="Finding the Shadowy Figure"}, point={x=1835,y=5631}},
        {Text="Accept Return to Sven", At="Return to Sven", point={x=1835,y=5631}},
        {Text="Turn inn Return to Sven (NW corner of map)", Dt={q="Return to Sven"}, point={x=775,y=3405}},
        {Text="Accept Proving Your Worth", At="Proving Your Worth", point={x=775,y=3405}},
        
        {Text="Grind over to Abercrombie (kill some raiders, too few of them) and turn inn Juice Delivery", Dt={q="Juice Delivery"}, point={x=2812,y=3146}},
        {Text="Accept Ghoulish Effigy", At="Ghoulish Effigy", point={x=2812,y=3146}},
        
        {Text="Complete: Ghoulish Effingy, Totem of Infliction, Proving your Worth, The Night Watch",
            Mct={"Ghoulish Effigy", "The Totem of Infliction", "Proving Your Worth", "The Night Watch"},
            PinAdd="Can do Mor'Ladim kite (or grp) anytime now"},

        {Text="Turn inn Proving Your Worth (At Sven, NW)", Dt={q="Proving Your Worth"}, point={x=775,y=3405}},
        {Text="Accept Seeking Wisdom", At="Seeking Wisdom", point={x=775,y=3405}},

        {Text="Deliver Ghoulish Effigy (Abercrombie)", Dt={q="Ghoulish Effigy"}, point={x=2812,y=3146}},
        {Text="Accept Ogre Thieves", At="Ogre Thieves", point={x=2812,y=3146}, PinAdd="Now is a good time to kite Mor'Ladim towards ogres"},
        
        {Text="Missing diplomat, loot defias locket in house on farm south of raven hill. (Skip if kiting mor'ladim)", Ct="The Missing Diplomat", point={x=2392,y=7204}},

        {Text="Complete Ogre Thieves outside ogre cave (loot box)", Ct="Ogre Thieves", point={x=3344,y=7636}},
        {Text="Complete Look to the stars (Zzarc'Vul in orgre cave)", Ct="Look To The Stars", point={x=3402,y=7669}},

        {Text="Missing diplomat, loot defias locket in house on farm south of raven hill. (If skipped earlier)", Ct="The Missing Diplomat", point={x=2392,y=7204}},

        {Text="Turn inn Ogre Thieves (Abercrombie)", Dt={q="Ogre Thieves"}, point={x=2812,y=3146}},
        {Text="Accept Note to the Mayor", At="Note to the Mayor", point={x=2812,y=3146}, PinAdd="Another chance to kite Mor'Ladim towards darkshire now, but not necessary"},
        
         -- TODO: how much xp from these quests? grind so dinging 30 from them
        {Text="Grind to 29+27000(29050 if no mor'ladim)", Lvl={lvl=29,xp=27000}},
        
        {Text="Heartstone to Darkshire", UseItem="Hearthstone", Proximity=100, point={x=7394,y=4453}},

        {Text="Turn in The Totem of Infliction", Dt={q="The Totem of Infliction"}, point={x=7581,y=4530}},

        {Text="Mor'Ladim", Dt={q="Mor'Ladim"}, point={x=7359,y=4688},
            PinAdd="Night's Watch turnin will autoaccept normal bag (10slot), if already have, SHIFT ON TURNIN to select Quiver"},
        {Text="Accept The Daughter Who Lived", At="The Daughter Who Lived", point={x=7360,y=4689}},

        {Text="Turn inn The Night Watch", Dt={q="The Night Watch", Item="Gunnysack of the Night Watch"}, point={x=7359,y=4688}},


        {Text="Turn in Note to the Mayor (town hall)", Dt={q="Note to the Mayor"}, point={x=7193,y=4653}},
        {Text="Accept Translate Abercrombie's Note", At="Translate Abercrombie's Note", point={x=7193,y=4653}},
        {Text="Deliver Translate Abercrombie's Note (on way out of Town Hall)", Dt={q="Translate Abercrombie's Note"}, point={x=7264,y=4763}},
        {Text="Accept Wait for Sirra to Finish", At="Wait for Sirra to Finish", point={x=7264,y=4763}},
        {Text="Turn in Wait for Sirra to Finish (wait for RP)", Dt={q="Wait for Sirra to Finish"}, point={x=7264,y=4763}},
        {Text="Accept Translation to Ello", At="Translation to Ello", point={x=7264,y=4763}},
        {Text="Turn in Translation to Ello (back to prev. guy)", Dt={q="Translation to Ello"}, point={x=7193,y=4653}},
        {Text="Accept Bride of the Embalmer", At="Bride of the Embalmer", point={x=7193,y=4653}},

        {Text="Turn in Worgen in the Woods", Dt={q="Worgen in the Woods"}, point={x=7533,y=4796}},
        {Text="Accept Worgen in the Woods", At="Worgen in the Woods", point={x=7533,y=4796}},
        {Text="Turn in Worgen in the Woods", Dt={q="Worgen in the Woods", Item="Cloak of the Faith", Use=1, VendorItem="Resilient Poncho"}, point={x=7532,y=4884}},

        {Text="Turn in Look To The Stars", Dt={q="Look To The Stars", Item="Zodiac Gloves", Use=1, Vendor="Windfelt Gloves"}, point={x=7982,y=4794}},

        {Text="Turn inn The Daughter Who Lived (patrolls inside Darkshire)", Dt={q="The Daughter Who Lived"}, point={x=7474,y=4686}},
        {Text="Accept A Daughter's Love", At="A Daughter's Love"},

        {Text="Watcher Backus, patrolling from darkshire to north on road. Diplomat", Dt={q="The Missing Diplomat"}, point={x=7318,y=3248}},
        {Text="Accept The Missing Diplomat", At="The Missing Diplomat", point={x=7318,y=3248}},

        -- 17h37m, 29+74% (32819/44300)

        {Text="Fly to SW", Taxi="Stormwind, Elwynn", point={x=7750,y=4428}},

        {Text="Elling Trias, cheese vendor, first building on right side when entering SW (second floor)", Dt={q="The Missing Diplomat"}, point={x=5990,y=6414}},
        {Text="Accept The Missing Diplomat", At="The Missing Diplomat", point={x=5990,y=6414}},

        {Text="Buy Razor Arrows", BuyItem={Npc="Marda Weller", Item="Razor Arrow", Count=2000}, point={x=5737,y=5679}},
        {Text="Buy Heavy Quiver", BuyItem={Npc="Marda Weller", Item="Heavy Quiver", Count=1}, point={x=5737,y=5679}},
        
        {Text="Accept Malin's Request (outside mage tower in mage quarter)", At="Malin's Request", point={x=3977,y=8146}},
        {Text="Accept James Hyal (Connor Rivers in Inn next to Malin)", At="James Hyal", point={x=4061,y=9183}},

        {Text="Deliver Seeking Wisdom (cathedral)", Dt={q="Seeking Wisdom"}, point={x=3910,y=2788}},
        {Text="Accept The Doomed Fleet", At="The Doomed Fleet", point={x=3910,y=2788}},

        {Text="Train Hunter skills", 
            TrainSkill={
                {n="Feign Death", Actionbar=70},
                {n="Multi-Shot", r="Rank 2", Actionbar=4},
            }, point={x=6153,y=1650}
        },
        {Text="Train Pet skills", 
            TrainSkill={
                --{n="Great Stamina", "Rank 5"}, -- TODO: First rank of great stamina that we don't train?
                {n="Growl", r="Rank 4"},
                {n="Natural Armor", r="Rank 5"},
                {n="Fire Resistance", r="Rank 2"},
                {n="Frost Resistance", r="Rank 2"},
                {n="Nature Resistance", r="Rank 2"},
                {n="Shadow Resistance", r="Rank 2"},
            }, point={x=6153,y=1650}
        },

        {Text="Center of Old Town, Dashel Stonefist Diplomat (freeze trap down for addspawn, CDs and nuke Dashel)", Dt={q="The Missing Diplomat"}, point={x=7050,y=4484}},
        {Text="Accept The Missing Diplomat", At="The Missing Diplomat", point={x=7050,y=4484}},
        {Text="Turn inn The Missing Diplomat (same guy)", Dt={q="The Missing Diplomat"}, point={x=7050,y=4484}},
        {Text="Accept The Missing Diplomat", At="The Missing Diplomat", point={x=7050,y=4484}},
        {Text="Elling Trias, cheese vendor, Turn inn The Missing Diplomat", Dt={q="The Missing Diplomat"}, point={x=5990,y=6414}},
        {Text="Accept The Missing Diplomat", At="The Missing Diplomat", point={x=5990,y=6414}},
        
        {Text="Fly to Wetlands", Taxi="Menethil Harbor, Wetlands", point={x=6627,y=6218}},
    }
}

--[[
=================================

	
Cathedral:
	Turn inn Seeking Wisdom
	Accept The Doomed Fleet
	Turn inn Cleansing the eye

Old Town (center):
	The missing Diplomat, talk to Dashel
	Place trap. 2 ads spawn. Tank boss and non-trapped add with pet. Nuke Dashel

35169/44300
	
Go back to cheese vendor at SW entrance. 
	Should now have part that leads to wetlands
	
	
Questlog:
The doomed fleet
The missing diplomat

TODO: Figure out how close to lvl 30 need to be in order to ding 30 in SW
Train spells if 30

lvl QUIVER IN SW: https://vanillawowdb.com/?item=7371#comments

=== FLY TO WETLANDS ===



]]