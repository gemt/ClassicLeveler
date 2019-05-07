-- Author      : G3m7
-- Create Date : 5/5/2019 5:16:34 PM

CLGuide_Stonetalon = {
    Title="22-23 Stonetalon",
    Pinboard = {},
    Steps = {
        {Text="Run through Windshear Crag, past goblin quest", Proximity=50, point={x=5962,y=6958}},
        {Text="Deliver On Guard in Stonetalon to Nelf", Dt={q="On Guard in Stonetalon"}, point={x=5991,y=6684}},
        {Text="Accept On Guard in Stonetalon from Nelf", At="On Guard in Stonetalon", point={x=5991,y=6684}},
        {Text="Deliver On Guard in Stonetalon to Gnome", Dt={q="On Guard in Stonetalon"}, point={x=5951,y=6715}},

        {Text="Accept A Gnome's Respite from the Gnome", At="A Gnome's Respite", point={x=5951,y=6715}},


        {Text="Accept Super Reaper 6000 at the Goblin hut", At="Super Reaper 6000", point={x=5899,y=6260}},

        {Text="Complete the two quests in the crag. Blueprints only from Operators", Mct={"Super Reaper 6000", "A Gnome's Respite"}, point={x=6260,y=5402},
            PinAdd="Operators can also be found at 66,45"},

        {Text="Deliver Super Reaper 6000 (skip followup)", Dt={q="Super Reaper 6000"}, point={x=5899,y=6260}},
        {Text="Deliver A Gnome's Respite", Dt={q="A Gnome's Respite"}, point={x=5951,y=6715}},

        {Text="Accept An Old Colleague", At="An Old Colleague", point={x=5951,y=6715}},
        {Text="Accept A Scroll from Mauren", At="A Scroll from Mauren", point={x=5951,y=6715}},

        {Text="Run north towards xroads to Charred Vale",Proximity=75, point={x=5146,y=4857}},
        {Text="Complete Pridewings of Stonetalon, Wyverns in area NE", Ct="Pridewings of Stonetalon"},
        {Text="Run north towards Stonetalon Peak",Proximity=75, point={x=4286,y=1632}},
        {Text="Deliver Journey to Stonetalon Peak (skip followup)", Dt={q="Journey to Stonetalon Peak"}, point={x=3711,y=811}},
        
        {Text="Fly to Astranaar (OF HS IF READY)", Taxi="Astranaar, Ashenvale", point={x=3643,y=718}},
        
        {Text="Turn inn Pridewings of Stonetalon", Dt={q="Pridewings of Stonetalon"}, point={x=3467,y=4884}},
        {Text="Turn An Aggressive Defense (vendor first on the left)", Dt={q="An Aggressive Defense"}, point={x=3661,y=4959}},
        {Text="Turn inn The Ruins of Stardust (skip followup)", Dt={q="The Ruins of Stardust"}, point={x=3734,y=5180}},

        {Text="Fly to Auberdine", Taxi="Auberdine, Darkshore", point={x=3440,y=4798}},
        {Text="RESTOCK On Longjaw Mud Snapper (then boat)", BuyItem={Npc="Laird", Item="Longjaw Mud Snapper", Count=20}, point={x=3674,y=4429}},
    }
}
