-- Author      : G3m7
-- Create Date : 5/5/2019 5:17:52 PM

CLGuide_Redridge = {
    Title="23-24 Redridge",
    Pinboard = {},
    Steps = {
        {Text="Accept Encroaching Gnolls", At="Encroaching Gnolls", point={x=1528,y=7139}},
        {Text="Deliver Encroaching Gnolls (Skip Followup)", Dt={q="Encroaching Gnolls"}, point={x=3070,y=5995}},

        {Text="Discover FP", Proximity=15, point={x=3058,y=5940}},

        {Text="Accept The Lost Tools (north side of bridge)", At="The Lost Tools", point={x=3215,y=4864}},
        {Text="Accept The Price of Shoes (outside stables)", At="The Price of Shoes", point={x=3097,y=4728}},
        {Text="Accept Hilary's Necklace (at the pier)", At="Hilary's Necklace", point={x=2931,y=5359}},
        
        {Text="Accept Selling Fish", At="Selling Fish", point={x=2772,y=4737}},
        {Text="Accept Murloc Poachers", At="Murloc Poachers", point={x=2772,y=4737}, 
            PinAdd="Do Bellygrub now if its up. Might be camped later"},

        {Text="Complete Hilary's Necklace (can be at point, and far west in lake)", Ct="Hilary's Necklace", point={x=3807,y=5444},
            PinAdd="Look for Rare Squiddic in lake"},
        
        {Text="Complete The Lost Tools", Ct="The Lost Tools", point={x=4157,y=5460}},

        {Text="Accept Selling Fish and Murloc Poachers. More murlocs NE on lake", Mct={"Selling Fish", "Murloc Poachers"}, point={x=4052,y=4740}},
        
        
        {Text="Deliver The Lost Tools (north side of bridge, skip followup)", Dt={q="The Lost Tools"}, point={x=3215,y=4864}},
        {Text="Deliver Selling Fish", Dt={q="Selling Fish"}, point={x=2772,y=4737}},
        {Text="Deliver Murloc Poachers", Dt={q="Murloc Poachers"}, point={x=2772,y=4737}},

        {Text="Deliver Hilary's Necklace", Dt={q="Hilary's Necklace"}, point={x=2925,y=5363}},

        {Text="Run to Duskwood", Zone="Duskwood", point={x=653,y=9105}},
    }
}

--[[

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

]]