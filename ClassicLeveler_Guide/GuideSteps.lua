-- Author      : G3m7
-- Create Date : 4/30/2019 8:59:06 PM
--[[
Guide_GuideSteps = {
	{ 
		Title="Section Title",
		PinBoard = {"pinboardItem1", "pinboardItem"}
		Steps = {
			{Text="Do Quest1, {Quest2} and Quest3", [TriggerItem], [Point], [PinAdd="pinboardItem1"], [PinRemove="pinboardItem1"]}
		}
	}
}
TriggerItem (a step can only have ONE trigger):
	At="questname"										quest Accepted: system message
	Ct="questname"										quest is completed in questlog
	Ht="questname"										quest is in the questlog
	Dt={q="questname", [item="itemname"], [use=1]}		quest is delivered. If quest has multiple rewards to choose from, 
													    you can optionally specify which reward to choose.
														If use=1, the item will also be equipped after receiving it
	Lvl={lvl=1 [,xp=500]}								goto next step when level is reached. Optionally add xp requirement as well 
	Item={Name="itemname", Count=1}						goto next step when inventory contains >= Count of Name
	Proximity=5											goto next step when distance to [Point] is <= Proximity
	Zone="zonename"										goto next step when zone changed to Zone
	Taxi="taxidest"										start flying to taxidest and goto next step
	SetHs="innkeeper-name"								set hs on innkeeper-name and goto next step
	BuyItem={Npc="npcName", Item="itemname", Count=1}	buys the item from a vendor until inventory contains Count and goto next step
	

Point:
	Point={x=1,y=1}

Step Text:
	You can wrap {} around quest names. When currentStep contains one or more quests wrapped in {}, the quest tracker will be updated
	to track those quests
]]

Guide_GuideSteps = {
	{
		Title="Darkshore 1-19",
		PinBoard = {"9 Small eggs for lvling cooking", "5 Strider Meats for cooking quest"},
		{
			{Text="Accept washed ashore (by FP)", At="Washed Ashore", Point={x=3662,y=4559}},
			{Text="Turn inn Flight to Auberdine. Accept Return to Nessa", At="Return to Nessa", Point={x=3677,y=4428}},
			{Text="Accept buzzbox (second floor innkeeper)", At="Buzzbox 827", Point={x=3697,y=4413}},
		}
	},
	{
		Title="Ashenvale/Stonetalon 20-22",
		{

		}
	}
}

CL_GuideSteps = {
	{Text="Accept washed ashore (by FP)", At="Washed Ashore", point={x=3662,y=4559}},
	{Text="Turn inn Flight to Auberdine. Accept Return to Nessa", At="Return to Nessa", point={x=3677,y=4428}},
	{Text="==== RESTOCK ON Longjaw Mud Snapper ====", Item={Name="Longjaw Mud Snapper", Count=20}, point={x=3674,y=4429}},
	{Text="Accept buzzbox (second floor innkeeper)", At="Buzzbox 827", point={x=3697,y=4413}},
	{Text="Accept Bashal'Aran (Thundris Windweaver, north mainhouse)", At="Bashal'Aran", point={x=3740,y=4013}},
	{Text="=== RESTOCK Sharp Arrow ===", Item={Name="Sharp Arrow", Count=1000}, point={x=3744,y=4051}},
	{Text="Accept Plagued Lands (bear quest dude)", At="Plagued Lands", point={x=3884,y=4341}},
	{Text="Accept How Big a Threat?", At="How Big a Threat?", point={x=3938,y=4348}},
	
	{Text="Tame a moonstalker", point={x=4418,y=3630}},

	{Text="Turn inn Bashal'Aran quests", point={x=4418,y=3630}},
	{Text="trap a grizzly bear (Plagued Lands)", Ct="Plagued Lands", point={x=4421,y=3196}},
	{Text="Grind to close to 13 on moonkins, have at least 9 eggs", point={x=4517,y=4519}},
	{Text="Swing my furbolog camp for How big a threat", Ct="How Big a Threat?", point={x=3985,y=5393}},
	{Text="can kill striders too for strider meat (cooking quest)"},

	{Text="Turn inn plagued lands. Accept Cleansing of the Infected", At="Cleansing of the Infected", point={x=3884,y=4341}},
	{Text="Turn inn how big a threat, accept pt2 & Thundris Windweaver", At="Thundris Windweaver", point={x=3938,y=4348}},
	{Text="Turn inn thundris windweaver. Accept The Cliffspring River & Tools of the Highborne", At="The Cliffspring River", point={x=3739,y=4011}},
	{Text="Train cooking to 10. Mild Spices from Gorbold Steelhand by forge"},
	{Text="Accept easy strider living (cooking)", At="Easy Strider Living", point={x=3769,y=4065}},
	{Text="Accept the red crystal (outside inn)", point={x=3771,y=4339}, At="The Red Crystal"},
	{Text="Accept cave mushroms (outside inn)", point={x=3732,y=4365}, At="Cave Mushrooms"},
	{Text="Accept for love eternal (pier)"},

	{Text="Complete Washed Ashore by looting beached seacreature", point={x=3640,y=5090}, Ct="Washed Ashore"},
	{Text="Finish Buzzbox 827 (Pygmy Tide Crawlers)", Ct="Buzzbox 827"},
	{Text="Turn inn buzzbox 827, Accept Buzzbox 411", At="Buzzbox 411", point={x=3665,y=4627}},
	{Text="turn inn washed ashore. Accept pt2", At="", point={x=3662,y=4558}},
	{Text="accept washed ashore pt2"},
	{Text="run out on pier and do washed ashore pt2, run back and turn inn"},
	{Text="do how big a threat"},
	{Text="accept the fall of ameth'aran"},
	{Text="do ameth'aran quests"},
	{Text="deliver The fall of Ameth'Aran"},
	{Text="kill rabid thistle bears (20 kills for Cleansing the infected)"},
	{Text="kill foreststriders (5 strider meat for Easy Strider Lliving)"},
	{Text="SHOULD DING 14 DURING THIS GRIND (but not required)"},
	{Text="kill threshers in water west of ameth'aran"},
	{Text="Loot beached sea turtle at 37,62, south-west of ameth'aran"},
	{Text="loot beached sea creature at 36,70, north-west of onu place"},

	{Text="=== GRIND/RUN BACK TO AUBERDINE ==="},

	{Text="Turn inn Beached Sea turtle"},
	{Text="Turn inn Beached Sea creature"},
	{Text="Turn inn For love eternal"},
	{Text="Turn inn Easy Strider Living"},
	{Text="Turn inn Tools of the highborne"},
	{Text="ACCEPT Deep Ocean, Vast Sea (by forge)"},
	{Text="Turn inn Cleansing the infected"},
	{Text="ACCEPT THarnariun's Hope (the den mother)"},
	{Text="Turn inn How big a threat."},
	{Text="ACCEPT A lost master."},
	{Text="ACCEPT The tower of althalaxx (floor above how a big threat)"},
	
	{Text="=== vendor and restock on food/arrows ===="},
	
	{Text="GRIND to the red crystal. If possible, grind to 15, or close to."},
	{Text="GRIND to Bashal'aran"},
	{Text="Turn inn Bashal'Aran"},
	{Text="Accept Beached sea creature at 42,31 (nw of Bashal'aran)"},
	{Text="Do Deep ocean, vast sea west of sea creature"},
	{Text="Turn inn buzzbox 411 at 42,28 (close to sea creature above)"},
	{Text="Accept buzzbox 323"},
	{Text="Grind close to the shore towards auberdine, looking for Moonstalkers for moonstalker fangs (Buzzbox 323)"},

	{Text="Should be 14 by now"},
	{Text="Turn inn Deep ocean, vast sea"},
	
	{Text="STOCK UP MAX ON ARROWS NOW"},
	
	{Text="Turn inn the red crystal"},
	{Text="ACCEPT as water cascades, FILL THE VIAL IN THE MOONWELL"},
	{Text="Turn inn beached sea creature"},
	
	{Text="Grind back up to red crystal, look for moonstalkers"},
	{Text="Turn inn as water cascades (at red crystal)"},
	{Text="Accept the fragments within"},
	
	{Text="GRIND SOME OF THE HIGHER LVL MOONKINS HERE,SHOULD BE AT LEAST 15"},

	{Text="grind up north to Tharnariun's Hope (The den mother). Look for moonstalkers"},
	{Text="Continue north to cliffspring falls"},
	
	{Text="Complete Cave Mushrooms"},
	{Text="careful with pulls here. Pull 2 and you're dead"},
		
	{Text="run north-west to the waterfall and Look for Moonstalkers on the way"},
	{Text="fill the vial for The cliffspring river."},
	
	{Text="Keep grinding here, looking for moonstalkers until hitting lvl 15"},
	
	{Text="Take the beached sea creature west of river"},
	{Text="If completing buzzbox 323, turn it inn"},

	{Text="MAKE SURE YOU ARE 15 (unless beta shows you can take prospector quest at 14)"},
	
	{Text="maybe grind until empty arrows at althalaxx?"},
	{Text="maybe do the althalaxx quest now to ding 16 faster"},
	
	{Text="could even be 16 here and it would not hurt."},
	
	{Text="== HEARTSTONE TO DARNASSUS =="},
	{Text="BUY A LVL 16 BOW AT WEP MASTERS"},
	{Text="15:"},
	{Text="train skills (remember pet)"},
	{Text="accept Trouble in darkshore (outside temple of moon)"},
	{Text="Run to FP"},
	{Text="Turn inn Return to Nessa on the way"},
	{Text="Fly to Auberdine"},
	{Text="Put HS in Auberdine"},
	
	{Text="Restock on food and arrows"},
	{Text="Accept Fruit of the sea (fishing dude under FP)"},
	{Text="Turn inn Cave Mushrooms (outside inn)"},
	{Text="Accept Wanted: Murkdeep (outside inn, wanted poster)"},
	{Text="Accept Onu"},
	{Text="Turn inn Tharnariun's Hope"},
	{Text="Turn inn Trouble in Darkshore"},
	{Text="Accept the absent minded prospector"},
	{Text="Turn inn The Cliffspring River"},
	{Text="Accept The Blackwood Corrupted"},
	{Text="=>RUN TO THE MOONWELL IN AUBERDINE AND FILL THE BOWN FROM the blackwood corrupted"},
	
	{Text="Almost 15.5 here"},
	{Text="=== run towards onu. =="},

	{Text="grind mobs when they are high enough level, esp look for moonstalkers"},
	{Text="do glaive quests. Hit 16 minimum during that grind. Do escort early (make sure escort is easy on beta too)"},
	{Text="keep grinding until book drops(abyssmal droprate). Can safely grind to 17 here"},
	{Text="Can also hunt for moonstalker sires"},
}


--[[

>>>>>>>>>>>>>>>>>>>>>

ding 17
absent minded prospector (possibly too hard)
pick seacreatures
do crab quest 
do murkdeep. 
deliver q at onu REMEMBER TO GET FOLLOWUP
get fine moonstalker pelts 
>>>>>>>>>>>>>>>>>>>>>>>

turn inn quests at onu, accept followup
HS TO Auberdine

====

Do blackwood corruption REMEMBER TO FILL BOWL IF NOT ALREADY
do tower of althrax. Kill all mobs
Turn inn
Do Mythystra Relics
grind some more at tower of althrax
keep trying to finish buzzbox
Do fruit of the sea
get to lvl 18
Deliver buzzbox
grind moonstalkers in the north to finish buzzbox if no luck
go to pirate and do that chain

lvl 18 +30%
HS to auberdine BUT BE SURE TO HAVE BUZZBOX 525

turn inn all quests
make sure to accept a lost master
make sure has quests:
the absent minded prospector
a lost master
wanted: murkdeep
buzzbox 525

=== Stock up on arrows/food ===

do Buzzbox 525
Grind more for Book at glaive if still dont have it 
go loot 4 beached sea creatures
finish up buzzbox, deliver it
Do Accept Escape through Force	

Do The Absent Minded Prospector (need 18 here, its hard)
Do Wanted: Murkdeep

Start escort to ashenvale when like 85-90% into lvl 19	
do: One Shot, One kill (46,90) while doing escort
	
need to be 19.75% aprox to ding from delivery xp 	
	
	
	
	
	
	
	
	
xxxx dont go auberdine yet	
Turn inn The Absent Minded Prospector
Accept The Absent Minded Prospectorm
Turn Inn Escape through force
Accept Trek to Ashenvale (wait a few sec for NPC to spawn)
Turn inn Wanted: Murkdeep
Turn inn Beached Sea creature x4
	
lvl 18.5 now 

=== Probably dont go darnassus for spells until 20 === 
	

??? Mathystra Relics (in north), from Onu, followup from glaive place quests (1950 XP)

========
Run to maestra's post
Turn inn The sleeper has awakened
Turn inn One Shot. One Kill
Turn inn The Tower Of Althalaxx	
Accept The Tower Of Althalaxx	
Grind the mobs for The Tower of Althalaxx until 19
When 19, get 


]]