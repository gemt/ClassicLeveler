-- Author      : G3m7
-- Create Date : 5/5/2019 2:32:24 PM


CLGuide_Ashenvale = {
	Title="11-20 Darkshore",
	Pinboard = {},
	Steps = {
    --[[
        {Text="Accept The Tower of Althalaxx", At="The Tower of Althalaxx", point={x=2619,y=3872}},
        {Text="Accept Bathran's Hair", At="Bathran's Hair", point={x=2642,y=3854}},
        
        {Text="Grind cultist mobs until Glowing Soul Gem Drops", Ct="The Tower of Althalaxx", point={x=3038,y=3181}},
        {Text="Finish Bathran's Hair to the north (bags on ground)", Ct="Bathran's Hair", point={x=3114,y=2470}},
        {Text="Deliver Bathran's Hair", Dt={q="Bathran's Hair"}, point={x=2643,y=3860}},
        {Text="Deliver The Tower of Althalaxx (skip followup)", Dt={q="The Tower of Althalaxx"}, point={x=2617,y=3870}},
        {Text="Accept Orendil's Cure (may need to wait for RP)", At="Orendil's Cure", point={x=2642,y=3854}},

        {Text="Deliver Therylune's Escape (if you did it)", Dt={q="Therylune's Escape"}, point={x=2263,y=5191}},
        {Text="Run to Astranaar", Proximity=40, point={x=3379,y=4802}},
        {Text="Accept The Zoram Strand", At="The Zoram Strand", point={x=3467,y=4883}},
        {Text="Accept On Guard in Stonetalon", At="On Guard in Stonetalon", point={x=3491,y=4979}},
        {Text="Accept Journey to Stonetalon Peak", At="Journey to Stonetalon Peak", point={x=3576,y=4910}},

        {Text="Accept Culling the Threat", At="Culling the Threat", point={x=3663,y=4961}},
        {Text="Accept Raene's Cleansing", At="Raene's Cleansing", point={x=3663,y=4961}},
        
        {Text="Set HS in Astranaar", SetHs="Innkeeper Kimlya", point={x=3699,y=4922}},

        {Text="Deliver Orendil's Cure", Dt={q="Orendil's Cure"}, point={x=3733,y=5182}},
        {Text="Accept Elune's Tear (few seconds of RP)", At="Elune's Tear", point={x=3733,y=5182}},
        
        
        -- 3min to run to silverwind refugee
        -- ~2min 18sec fligth to auberdine
        {Text="Fly to Auberdine", Taxi="Auberdine, Darkshore", point={x=3440,y=4798}},
        {Text="==== RESTOCK On Longjaw Mud Snapper ====", BuyItem={Npc="Laird", Item="Longjaw Mud Snapper", Count=20}, point={x=3674,y=4429}},

        --{Text="Deliver WANTED: Murkdeep!", Dt={q="WANTED: Murkdeep!"}, point={x=3771,y=4339}},
        {Text="Deliver WANTED: Murkdeep! (can abandon now if still not done)", Dt={q="WANTED: Murkdeep!", Item="Ridgeback Bracers", Use=1}, point={x=3771,y=4339}},
        
        {Text="Deliver The Absent Minded Prospector", Dt={q="The Absent Minded Prospector"}, point={x=3745,y=4186}},
        {Text="Accept The Absent Minded Prospector", At="The Absent Minded Prospector", point={x=3745,y=4186}},
        
        {Text="=== RESTOCK Sharp Arrow ===", BuyItem={Npc="Dalmond", Item="Sharp Arrow", Count=1200}, point={x=3744,y=4051}},
        {Text="Deliver Escape Through Force (new belt)", Dt={q="Escape Through Force"}, point={x=3937,y=4348}},

        {Text="Accept Trek To Ashenvale from mob that comes running into the house", At="Trek to Ashenvale"},

        ]]
        
        {Text="Fly to Rut'Theran Village", Taxi="Rut'Theran Village, Teldrassil", point={x=3634,y=4558}},
        
        {Text="Deliver The Absent Minded Prospector", Dt={q="The Absent Minded Prospector", Item="Windfelt Gloves", Use=1}, point={x=3745,y=4186}},



        {Text="Accept Elemental Bracers", At="Elemental Bracers", point={x=4979,y=6721}},

--[[        
	
Turn inn Therylune's Escape
Run to Astranaar
get FP
accept:
	The zoram Strand
	On guard in stonetalon
	Joruney to stonetalon peak
	Raene's Cleansing
	Culling the threat
turn inn:
	orendil's cure - wait for RP and accept Elune's Tear

=== Set heartstone in Astranaar === 

fly to auberdine
===== START SETTING UP BANK CHAR NOW ======
turn inn all quests in 
	when turning inn at grizzly quest place, a mob comes running that gives Trek To AShenvale. Accept this
BUY MORE FISH FOOD IF OUT
fly to darnassus, learn spells (remember beast spells)
train staffs 
BUY LVL 20 BOW AT VENDOR - Bow merchant, south of warriors terrace, third house on the left, heavy recurve bow
remember to turn inn the quest outside temple of the moon and accept followup


=== Heart back to astranaar === 


go to lake falathim to the west and do Raene's cleansing
go to the zoram strand
get and do the ancient statuette
deliver and do followup (Ruuzel) (RP, need to wait to pick) out at the isle to northwest
finish wrathtail head farm at isle and while walking back and fourth for these quests
deliver ruuzel
make sure you're close enough to 21 to ding from quest deliveries (need to be 21 to tame 21 bear after)
run back to astranaar. Maybe heartstone if ready?

Turn inn:
	The zoram strand, accept Pridewings of stonetalon
	Raene's Cleansing, accept An Aggressive Defense and Raene's cleansing pt3

8h 40min, lvl 21+15%
=== Stable pet ===
tame an ashenvale bear, lvl 21 or 22 REMEMBER ENOUGH FOOD. Potentially from Auberdine (fish)
Loot Elune's Tear
Kill Dal Bloodclaw for Culling the threat
make sure claw rank 3 is learned from the bear
run back to astranaar, abandon pet and take old pet out again
Turn inn both quests
Accept The ruins of stardust
run south and do the ruins of stardust
Run east to Silverwind Refuge
Accept and do Elemental Bracers. Skip followup

Complete An aggressive defense
Probably skip running up to turn in Raene's Cleansing (825 XP), the followup WONT be done so its just a detour
	The run up and down from the road takes 3 minutes + killing 2 mobs. Maybe not so bad after all?
	
	
    ]]



        {Text="Train Hunter skills", 
            TrainSkill={
                {n="Aspect of the Hawk",r="Rank 2", Actionbar=49},
                {n="Aspect of the Cheetah", Actionbar=51},
                {n="Mend Pet",r="Rank 2", Actionbar=62},
                {n="Dual Wield"},
                {n="Multi-Shot",r="Rank 1", Actionbar=4},
                {n="Arcane Shot",r="Rank 3", Actionbar=3},
                {n="Immolation Trap",r="Rank 1", Actionbar=65},
                {n="Raptor Strike",r="Rank 3", Actionbar=2},
                {n="Raptor Strike",r="Rank 3", Actionbar=2},
                {n="Disengage",r="Rank 1", Actionbar=10},
                
                {n="Track Beasts", Actionbar=47},
                {n="Track Humanoids", Actionbar=46},
                {n="Track Undead", Actionbar=48},
            }, point={x=3981,y=1614}
        },
        {Text="Train Pet skills (up the ramp)", 
            TrainSkill={
                {n="Great Stamina",r="Rank 2"},
                {n="Natural Armor",r="Rank 3"},
                {n="Growl",r="Rank 3"},
                -- resistances?? what am i going to be grinding most of to 30? shadow in duskwood? 
            }, point={x=4284,y=1006}
        },
    }
}
--[[
== === RUN TO STONETALON MOUNTAINS ====

kill pridewings as you pass them
turn in On guard in stonetalon at 60,66. Accept followup, talk to gnome
accept a gnome's respite
go accept super reaper 6000
do these 2 quest
Use the vendor at the area to empty bags
turn inn super reaper 6000. Skip followup
turn inn gnomes respite, accept both followups
Run all the way north to stonetalon peak. Stop at the lake halfway north to kill pridewings and finish Pridewings of stonetalon

Turn in journey to stonetalon peak. Skip followup

==== Fly or HS to astranaar ==== 

Turn in:
	the ruins of stardust (skip followup)
	An aggressive defense
	Pridewings whatever

===== Fly to Auberdine ======
===== Boat to wetlands ======

Get FP
Check Neal ALlen (enter keep, left 2 times) for Bronze tubes

see if u can get the crocolisk queston n-w side of harbor
Take Murloc quest on pier
Turn inn the absent minded prospector at the inn. Skip followup for now
Accep the greenwarden outside the inn

kill murlocs (keep fins, or something rather, for redridge)
run to engineering hut (26,25) check for bronze tube. Also check Wenna Silkbeard down in bunker for Saber Leggings
run to the greenwarden
accept daily delivery on the way
Turn inn the greenwarden
accept tramping paws
do tramping paws
continue running to IF

Acccept Stormpike order when entering loch modan
accept stonegear's search from patrol in thelsamar
take FP

keep running to IF
stop by kharanos to turn inn stonegear's search

==== IF ======

Get FP
Train weaponskills (by BG masters, house towards AH)

If have 60 wool cloth, turnin donation next
Turn inn The powers below in forlorn cavern
Turn in An Old Colleague (Tinker Town) - NOTE: IF possible to get 4 minor mana pot and 2 elixir of minor fortitude, do that followup
Gearcutter Cogspinner for Bronze Tube

These quests probably wont work on classic (seasonal)
	find Courier Hammerfall (patroll anti-clockwise?) around entire outer circle. Accept The reason for the season (CHECK BETA ON THIS ONE; IS SEASONAL)
	Turnin The reason for the season (if found) innermost in hall of explorers 
	Deliver followup to king


====== TAKE TRAM TO SW ======
check Billibub Cogspinner for Bronze Tube 
turn inn stormpiek orders outside tram
TRAIN HUNTER SKILLS (just south of tram entrance)
Go to the mage quarter and turn inn A scroll for mauren. Skip followup i think
Train weapons (across AH)
Get FP

Run to redridge mountains
accept quest A watchful eye (tower of azora in elwynn)


Redridge:
pick Encroaching Gnolls on road to city
Turn in Encroaching Gnolls by FP
Get FP
Quests to do:
	The price of shoes
	Hillary's Necklace (on the pier)
	The Lost tools (from Foreman Oslow by the bridge)
	An unwelcome Guest (bellygrub)
	Selling Fish
	Murloc Poachers

	
do hillary's necklace and an unwelcome guest
turn in
kill murlocs to finish selling fish and murloc poachers
Loot the lost tools

11h13min
====== RUN DUSKWOOD ======


continue east on norther part of lake to finish up murlocs, then go up north and finish blackrock menace
conitnue east and do solomon's law and Wanted: Lieutenant Fangore
Turn inn Looking Further all the way east by the gnolls (84,46) Skip followup, need to kill mass elites


Run to Darkshire




]]