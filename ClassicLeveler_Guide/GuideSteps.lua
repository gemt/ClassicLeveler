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
														Holding shift down while talking to a quest npc will disable this trigger.
	Lvl={lvl=1 [,xp=500]}								goto next step when level is reached. Optionally add xp requirement as well 
	Item={Name="itemname", Count=1}						goto next step when inventory contains >= Count of Name
	Proximity=5											goto next step when distance to [Point] is <= Proximity
	Zone="zonename"										goto next step when zone changed to Zone
	Taxi="taxidest"										start flying to taxidest and goto next step
	SetHs="innkeeper-name"								set hs on innkeeper-name and goto next step
	BuyItem={Npc="npcName", Item="itemname", Count=1}	buys the item from a vendor until inventory contains Count and goto next step
	

Point:
	Point={x=1,y=1}

PinAdd/PinRemove:
	The step will Add a new item to the pinboard, or remove an existing one (removed if strings of a pinboard item matches the specified PinRemove string)

Step Text: (TODO)
	You can wrap {} around quest names. When currentStep contains one or more quests wrapped in {}, the quest tracker will be updated
	to track those quests
]]

CLGuide_GuideTable = {
	{
		Title = "TEST",
		Pinboard = {},
		Steps = {
			{Text="TEST Rat Catching TEST", Dt={q="Rat Catching"}, point={x=5625,y=9245}},
			{Text="TEST Mountaineer Stormpike's Task TEST", At="Mountaineer Stormpike's Task", point={x=5625,y=9245}},
		}
	},
	
	{
		Title="1-11 Teldrassil",
		Pinboard = {},
		Steps = {
			{Text="Run towards FP", Zone="Teldrassil", point={x=3060,y=4152}},
			{Text="Turn inn Rut'Theran Village, Accept The Bounty of Teldrassil", At="The Bounty of Teldrassil", point={x=5625,y=9245}},
		
			{Text="Turn inn The Bounty of Teldrassil", Dt="The Bounty of Teldrassil", point={x=5841,y=9403}},
			{Text="Fly to Auberdine", Taxi="Auberdine, Darkshore", point={x=5841,y=9403}},
		}
	},
}
