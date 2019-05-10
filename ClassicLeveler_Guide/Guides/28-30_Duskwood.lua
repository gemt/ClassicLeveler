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
        {Text="Turn inn Morgan Ladimore (outside town hall)", Dt={q="Morgan Ladimore"}, point={x=7360,y=4689}},
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
                {n="Aspect of the Hawk", "Rank 3", Actionbar=49},
                {n="Mend Pet", "Rank 3", Actionbar=62},
                {n="Rapid Fire", Actionbar=11},
                {n="Arcane Shot", "Rank 4", Actionbar=3},
                {n="Serpent Sting",r="Rank 4", Actionbar=1},
                {n="Raptor Strike", "Rank 4", Actionbar=2},
                {n="Immolation Trap",r="Rank 2", Actionbar=65},
            }, point={x=6153,y=1650}
        },
        {Text="Train Pet skills", 
            TrainSkill={
                --{n="Great Stamina", "Rank 4"}, -- can we still keep training stamina?
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

        {Text="Watcher Backus, patrolling from darkshire to north on road. Diplomat", Dt={q="The Missing Diplomat"}, point={x=5990,y=6414}},
        {Text="Accept The Missing Diplomat", At="The Missing Diplomat", point={x=5990,y=6414}},
--[[
Fly to SW 
Fly back to Duskwood
	4: Watcher Backus - patrolling road north of Darkshire.
		(this is the find the defias docket part)
	
]]

        
        {Text="Complete Look to the stars (Zzarc'Vul in orgre cave)", Ct="Look To The Stars", point={x=3402,y=7669}},
        
        {Text="Accept The Daughter Who Lived", At="The Daughter Who Lived", point={x=7360,y=4689}},
        {Text="Turn inn The Daughter Who Lived (patrolls inside Darkshire)", Dt={q="The Daughter Who Lived"}, point={x=7474,y=4686}},
        {Text="Accept A Daughter's Love", At="A Daughter's Love"},
    }
}

--[[

4: Watcher Backus - patrolling road north of Darkshire.
	(this is the find the defias docket part)
	
=================================

Turn inn Worgen in the woods pt 2
accept worgen in the woods pt3 (vile fang and tained ones)
Turn inn The Night Watch (15 skeletal fiend and horror)
Accept The Night Watch (20 plague spreader)
turn inn the shadowy figure
accept the shadowy search continues
turn in zombie juice
turn inn the shadowy search continue
accept inquire at the inn
turn inn inquire at the inn
accept finding the shadowy figure

deliver gather rot blossoms
accept juice delivery


turn inn the weathered grave
accept morgan ladimore
turn inn morgan ladimore
accept mor'ladim
	
=========

Do Worgen in the woods pt 3 (Vile fang and tainted ones). Remember there may not be enough tainted ones, so start with those

turn inn worgen in the woods as well


=== RUN WEST ===
The missing diplomat - Find the defias docket south of raven hill (73,32, house at south-eastern corner of the farm)

=== RAVEN HILL ===
turn inn finding the shadowy figure
accept return to sven

== run to sven (nw corner) === 

turn inn return to sven
accept proving your worth

run to the hermit 
turn inn juice delivery
accept ghoulish effigy

IN RAVEN HILL, COMPLETE:
	Ghoulish Effigy
	The Totem of Infliction (10 ghoul fang, 10 skeleton finger)
	Proving your worth (15 skeletal raider, 3 skeletal healer, 3 skeletal warder)
	Gather Rot Blossoms (drops from skeletals)
	The night watch (20 plague spreaders)
	
FOCUS skeletal raiders outside the crypt and house on top of hill first. Not many easily accessible. Circle back to them after respawn

turn inn ghoulish effingy when it's done (should be fast)
accept ogre thieves

run down to ogres and loot abercrombie's crate for Ogre thieves
run back to hermit 

KITE-KILL MOR'LADIM TOWARDS OGRES

turn inn ogre thieves
accept note to the mayor

continue finishing raven hill quests

Svens camp:
	Turn inn Proving your worth 
	Accept seeking wisdom
	
KILL MOR'LADIM NOW IF HAVE NOT DONE ALREADY

CONSIDER running westfall to fly to darkshire again instead of running east

run back to darkshire 
	turn inn worgen in the woods pt3
	turn inn the night watch ??? FIGURE OUT IF QUIVER OR 10 SLOT ???
	Turn inn the totem of infliction
	Turn inn Mor'Ladim
		Accept the daugther who lived. Do some talking. End up with: 
		A daughter's Love
	Turn inn Note to the mayor, do that whole talking with different people
	After doing all talking, Accept 
		Bride of the Embalmer


Turn inn The missing diplomat at Watcher Backus (patrol at road)		
Go north-east to manor mistmantle
clear camp
loot tear of tilloa on the small farmpatch
Kite stalvan on to the road. Get help from the patrolling watchman, use fences along road to kite easier
Turn inn Legend of stalvan


GRIND UNTIL 42000/44300 (95%)

17h37m, 29+74% (32819/44300)

=== FLY SW ===
Cheese vendor:
	Turn inn The missing Diplomat at cheese vendor (sw entrance, on the right)

Warlock Trainer (west in mage quarter)
	Turn inn a Noble Brew
	Accept a noble brew pt2
	
Cathedral:
	Turn inn Seeking Wisdom
	Accept The Doomed Fleet
	Turn inn Cleansing the eye

SW Keep:
	Turn inn a Noble Brew - Corridor to the right while running towards faction boss
	
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