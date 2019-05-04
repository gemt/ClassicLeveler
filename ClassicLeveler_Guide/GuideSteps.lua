-- Author      : G3m7
-- Create Date : 4/30/2019 8:59:06 PM
--[[
Guide_GuideSteps = {
	{ 
		Title="Section Title",
		PinBoard = {"pinboardItem1", "pinboardItem"}
		Steps = {
			{Text="Do Quest1, {Quest2} and Quest3", [TriggerItem], [Point], [UseItem="itemname"], [PinAdd="pinboardItem1"], [PinRemove="pinboardItem1"]}
		}
	}
}
TriggerItem (a step can only have ONE trigger):
	At="questname"										quest Accepted: system message
	Ct="questname"										quest is completed in questlog
	Ht="questname"										quest is in the questlog
	Dt={q="questname", [item="itemname"], [use=1],[vendor=1]}
														quest is delivered. If quest has multiple rewards to choose from, 
													    you can optionally specify which reward to choose.
														(TODO) If use=1, the item will also be equipped after receiving it
														(TODO) if vendor=1, the item will be vendored next time you visit a vendor
														Holding shift down while talking to a quest npc will disable this trigger.

	Lvl={lvl=1 [,xp=500]}								goto next step when level is reached. Optionally add xp requirement as well 
	Item={Name="itemname", Count=1}						goto next step when inventory contains >= Count of Name
	Proximity=5											goto next step when distance to [Point] is <= Proximity
	Zone="zonename"										goto next step when zone changed to Zone
	Taxi="taxidest"										start flying to taxidest and goto next step
	SetHs="innkeeper-name"								set hs on innkeeper-name and goto next step
	BuyItem={Npc="npcName", Item="itemname", Count=1}	buys the item from a vendor until inventory contains Count and goto next step
	TrainSkill
	SellItem

Point:
	Point={x=1,y=1}

UseItem: (TODO)
	When a itemname is specified here, show a clickable button for the specified item
PinAdd/PinRemove:
	The step will Add a new item to the pinboard, or remove an existing one (removed if strings of a pinboard item matches the specified PinRemove string)

Step Text: (TODO)
	You can wrap {} around quest names. When currentStep contains one or more quests wrapped in {}, the quest tracker will be updated
	to track those quests
]]

CLGuide_GuideTable = {
--[[
	{
		Title = "TEST",
		Pinboard = {},
		Steps = {
			{Text="TEST Rat Catching TEST", Dt={q="Rat Catching"}, point={x=5625,y=9245}},
			{Text="TEST Mountaineer Stormpike's Task TEST", At="Mountaineer Stormpike's Task", point={x=5625,y=9245}},
		}
	},
]]
	
	{
		Title="1-11 Teldrassil",
		Pinboard = {},
		Steps = {
			{Text="Accept The Balance of Nature", At="The Balance of Nature", point={x=5869,y=4427}},
			{Text="Complete {The Balance of Nature}", Ct="The Balance of Nature"},
			{Text="Deliver The Balance of Nature", Dt={q="The Balance of Nature", Item="archery training gloves", Use=1}, point={x=5869,y=4427}},
			{Text="Accept The Balance of Nature pt2", At="The Balance of Nature", point={x=5869,y=4427}},
			{Text="Accept Etched Sigil", At="Etched Sigil", point={x=5869,y=4427}},
			{Text="Accept The Woodland Protector", At="The Woodland Protector", point={x=5993,y=4248}},
			-- vendor + buy arrows. bow?
			{Text="Accept A Good Friend", At="A Good Friend", point={x=6088,y=4196}},
			
			{Text="Complete The Balance of Nature p2", Ct="The Balance of Nature", point={x=6184,y=3555}},
			{Text="Deliver A Good Friend", Dt={q="A Good Friend"}, point={x=5458,y=3298}},
			{Text="Accept A Friend in Need", At="A Friend in Need", point={x=5458,y=3298}},
			{Text="Accept Webwood Venom", At="Webwood Venom", point={x=5781,y=4164}},
			-- vendor + buy bow?
			{Text="Deliver A Friend in Need", Dt={q="A Friend in Need"}, point={x=6088,y=4195}},
			{Text="Accept Iverron's Antidote", At="Iverron's Antidote", point={x=6088,y=4195}},
			{Text="Deliver The Balance of Nature pt2", Dt={q="The Balance of Nature", Item="Blackened Leather Belt"}, point={x=5869,y=4427}},
			{Text="Deliver The Woodland Protector", Dt={q="The Woodland Protector"}, point={x=5783,y=4521}},
			{Text="Accept The Woodland Protector pt2", At="The Woodland Protector", point={x=5783,y=4521}},
			
			{Text="Get 8 Fel Moss for The Woodland Protector pt2", Ct="The Woodland Protector", point={x=5469,y=4398}},
			{Text="Make sure you also get 7 Hyacinth Mushroom (only from highlvl grells?)", Item={Name="Hyacinth Mushroom", Count=7}, point={x=5469,y=4398}},
			{Text="Get 4 Moonpetal Lily", Item={Name="Moonpetal Lily", Count=4}, point={x=5772,y=3710}},
			{Text="Complete Webwood Venom", Ct="Webwood Venom", point={x=5649,y=3031}},
			{Text="Make sure you got 1 Webwood Ichor to complete Iverron's Antidode", Ct="Iverron's Antidote", point={x=5649,y=3031}},
			
			{Text="Suecide, GY ress in Shadowglen. Turn inn Iverron's Antidode", Dt={q="Iverron's Antidote"}, point={x=6085,y=4200}},
			{Text="Accept Iverron's Antidote pt2", At="Iverron's Antidote", point={x=6085,y=4200}},
			-- vendor
			{Text="Turn in The Woodland Protector pt2", Dt={q="The Woodland Protector", Item="Canopy leggings", Use=1}, point={x=5782,y=4522}},
			{Text="Turn in Webwood Venom", Dt={q="Webwood Venom", Item="Thistlewood Dagger", Use=1}, point={x=5781,y=4164}},
			{Text="Accept Webwood Egg", At="Webwood Egg", point={x=5781,y=4164}},
			{Text="Turn inn Iverron's Antidote", Dt={q="Iverron's Antidote", Item="Barkmail Vest", Vendor=1}, point={x=5458,y=3298}},
			{Text="Complete (loot a) Webwood Egg", Ct="Webwood Egg", point={x=5669,y=2645}},
			
			{Text="Suecide, GY ress in Shadowglen. Turn inn Webwood Egg", Dt={q="Webwood Egg", Item="Woodland Tunic", Use=1}, point={x=5780,y=4165}},
			{Text="Accept Tenaron's Summons", At="Tenaron's Summons", point={x=5780,y=4165}},
			
			{Text="Turn inn Etched Sigil (hunter trainer, halfway up tower)", Dt={q="Etched Sigil"}, point={x=5866,y=4045}},
			-- train skills Serpent Sting, Aspect of the Monkey
			{Text="Turn inn Tenaron's Summons (top of tower)", Dt={q="Tenaron's Summons"}, point={x=5906,y=3943}},
			{Text="Accept Crown of the Earth", At="Crown of the Earth", point={x=5906,y=3943}},
			{Text="Complete Crown of the Earth (fill vial in moonwell)", Ct="Crown of the Earth", UseItem="Crystal Phial", point={x=5994,y=3303}},
			{Text="Turn inn Crown of the Earth (top of tower)", Dt={q="Crown of the Earth"}, point={x=5906,y=3943}},
			{Text="Accept Crown of the Earth p2", At="Crown of the Earth", point={x=5906,y=3943}},
			{Text="Accept Dolanaar Delivery", At="Dolanaar Delivery", point={x=6115,y=4765}},

			{Text="Turn inn Rut'Theran Village, Accept The Bounty of Teldrassil", At="The Bounty of Teldrassil", point={x=5625,y=9245}},
			{Text="Turn inn The Bounty of Teldrassil", Dt="The Bounty of Teldrassil", point={x=5841,y=9403}},
			{Text="Fly to Auberdine", Taxi="Auberdine, Darkshore", point={x=5841,y=9403}},
		}
	},
}
