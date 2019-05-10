CLGuide_GuideTable = {
	CLGuide_Teldrassil,
	CLGuide_DunMorogh,
	CLGuide_Darkshore,
    CLGuide_Ashenvale,
    CLGuide_Stonetalon,
    CLGuide_Ashenvale_Redridge,
    CLGuide_Redridge,
    CLGuide_Duskwood1,
    CLGuide_Wetlands,
    CLGuide_Duskwood2
}


--[[
CLGuide_GuideTable = {
	{ 
		Title="Section Title",
		PinBoard = {"pinboardItem1", "pinboardItem"}
		Steps = {
			{
                Text="Do Quest1 and Quest3", 
                [TriggerItem], 
                [Point], 
                [UseItem="itemname"], 
                [PinAdd="pinboardItem1"], 
                [PinRemove="pinboardItem1"]
            }
		}
	}
}
TriggerItem (a step can only have ONE trigger):
	*At="questname"										quest Accepted: system message
	*Ct="questname"										quest is completed in questlog
	*Ht="questname"										quest is in the questlog
	*Dt={q="questname", [Item="itemname"], [Use=1],[Vendor="itemname"],[SkipIfUncomplete=1]}
														quest is delivered. If quest has multiple rewards to choose from, 
													    you can optionally specify which reward to choose.
														(TODO) If use=1, the item will also be equipped after receiving it
														(TODO) if Vendor is specified with an itemname, that item will be vendored after this step is complete
                                                        if SkipIfUncomplete=1 specified, step is skipped if the quest is not completed at this stage

    *Mct={"quest1","quest","quest3"...}                 All mentioned quests are complete in questlog

	Lvl={lvl=1 [,xp=500]}								goto next step when level is reached. Optionally add xp requirement as well 
	
    Item={Name="itemname", Count=1}						goto next step when inventory contains >= Count of Name
	
    Proximity=5											goto next step when distance to [Point] is <= Proximity
	
    Zone="zonename"										goto next step when zone changed to Zone
	
    *Taxi="taxidest"									start flying to taxidest and goto next step
	
    *SetHs="innkeeper-name"								set hs on innkeeper-name and goto next step
	
    *BuyItem={Npc="npcName", Item="itemname", Count=1}	buys the item from a vendor until inventory contains Count and goto next step

	*TrainSkill={{n="skill1",r="Rank 1"},{n="skill2",r="Rank 2"}, }           
                                                        trains the specified skills at a trainer and goto next step
	

Point:
	Point={x=1,y=1}

UseItem: (TODO)
	When a itemname is specified here, show a clickable button for the specified item
PinAdd/PinRemove:
	The step will Add a new item to the pinboard, or remove an existing one (removed if strings of a pinboard item matches the specified PinRemove string)

Step Text: (TODO)
	You can wrap {} around quest names. When currentStep contains one or more quests wrapped in {}, the quest tracker will be updated
	to track those quests

Triggers marked with * are disabled as long as SHIFT modifier is pressed
]]
