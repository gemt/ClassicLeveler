-- Author      : G3m7
-- Create Date : 5/11/2019 12:39:06 PM

CLGuide_Badlands = {
    Title="39-41 Badlands",
    Pinboard = {},
    Steps = {
    
        {Text="Fly to Thelsamar", Taxi="Thelsamar, Loch Modan", point={x=5548,y=4777}},
        {Text="Accept Badlands Reagent Run (in thelsamar)", At="Badlands Reagent Run", point={x=3707,y=4935}},
        {Text="Deliver Ironband Wants You! (Excavation site SE in Loch Modan)", Dt={q="Ironband Wants You!"}, point={x=6593,y=6562}},
        {Text="Accept Find Agmond", At="Find Agmond", point={x=6593,y=6562}},
        
        --todo Point
        {Text="Run into Badlands", Zone="Badlands",
            PinAdd="Cayotes and Buzzards for reagent run whenever suitable"},
        {Text="Accept A Dwarf and His Tools", At="A Dwarf and His Tools", point={x=5342,y=4340}},
        {Text="Accept Mirages", At="Mirages", point={x=5380,y=4330}},


        {Text="Accept A Sign of Hope (note under tent at dwarves)", At="A Sign of Hope", point={x=5303,y=3394}},

        {Text="Complete A Dwarf and His Tools", Ct="A Dwarf and His Tools", point={x=5323,y=3216},
            PinAdd="If no drop after clearing camp, do next step and come back for respawns"},
        {Text="Complete Mirages", Ct="Mirages", point={x=6690,y=2342}},

        {Text="Deliver A Dwarf and His Tools", Dt={q="A Dwarf and His Tools"}, point={x=5342,y=4340}},
        {Text="Deliver A Sign of Hope", Dt={q="A Sign of Hope"}, point={x=5342,y=4340}},
        {Text="Accept A Sign of Hope", At="A Sign of Hope", point={x=5342,y=4340}},
        {Text="Deliver Mirages", Dt={q="Mirages"}, point={x=5380,y=4330}},
        {Text="Accept Scrounging", At="Scrounging", point={x=5380,y=4330}},
        
        -- todo: this requires lvl 40 and Mirages completed. Can we put in a requirement to hit 40 before doing other quests?
        -- would be super, so we dont have to do a dedicated trip all over the map looking for ogre boss dude
        -- also not sure if its a dwarf at the camp who starts it or the elf to the south
        {Text="Accept Tremors of the Earth", At="Tremors of the Earth", point={x=6195,y=5427}},
        
        {Text="Deliver Martek the Exiled", Dt={q="Martek the Exiled"}, point={x=4221,y=5268}},
        {Text="Accept Indurium", At="Indurium", point={x=4221,y=5268}},

        {Text="Accept Barbecued Buzzard Wings", At="Barbecued Buzzard Wings", point={x=4239,y=5293}},
        {Text="Accept Power Stones", At="Power Stones", point={x=4239,y=5293}},

        {Text="Deliver Find Agmond (corpse)", Dt={q="Find Agmond"}, point={x=5090,y=6240}},
        {Text="Accept Murdaloc", At="Murdaloc", point={x=5090,y=6240}},


        {Text="Complete Murdaloc and Indurium", Mct={"Murdaloc", "Indurium"}, point={x=4963,y=6632}},
        {Text="Accept Solution to Doom", At="Solution to Doom", point={x=5139,y=7687}},

        {Text="Deliver Indurium", Dt={q="Indurium"}, point={x=4221,y=5268}},
        {Text="Accept News for Fizzle (Wait for RP)", At="News for Fizzle", point={x=4221,y=5268}},

        {Text="Accept Study of the Elements: Rock", At="Study of the Elements: Rock", point={x=2595,y=4486}},
        {Text="> IF Frostoil mats etc; Accept Coolant Heads Prevail", At="Coolant Heads Prevail", point={x=2595,y=4486}},
        {Text="> Deliver Coolant Heads Prevail", Dt={q="Coolant Heads Prevail"}, point={x=2595,y=4486}},
        {Text="> Accept Gyro... What?", At="Gyro... What?", point={x=2595,y=4486}},
        {Text="> Deliver Gyro... What?", Dt={q="Gyro... What?"}, point={x=2595,y=4486}},
        
        -- does it req study of rock?
        {Text="> Accept Liquid Stone", At="Liquid Stone", point={x=2595,y=4486}},
        {Text="> Deliver Liquid Stone", Dt={q="Liquid Stone"}, point={x=2595,y=4486}},
     

        {Text="Complete Study of the Elements: Rock (Only Lesser elementals)", Ct="Study of the Elements: Rock", 
            point={x=2228,y=4454}, PinAdd="Dont need 5/5 rock elem shards here"},
        {Text="Deliver Study of the Elements: Rock", Dt={q="Study of the Elements: Rock"}, point={x=2595,y=4486}},
        {Text="Accept Study of the Elements: Rock", At="Study of the Elements: Rock", point={x=2595,y=4486}},

        
        -- south-mid elementals
        {Text="Complete Study of the Elements: Rock (Only Lesser elementals)", Ct="Study of the Elements: Rock", point={x=3776,y=7544}},

        
        {Text="Deliver Study of the Elements: Rock", Dt={q="Study of the Elements: Rock"}, point={x=2595,y=4486}},
        {Text="Accept Study of the Elements: Rock", At="Study of the Elements: Rock", point={x=2595,y=4486}},

        {Text="Clear out the Buzzards at point for Wings/Gizzards",Point=20, point={x=1700,y=6040}},

        -- south-west elementals
        {Text="Complete Study of the Elements: Rock (Only Lesser elementals)", Ct="Study of the Elements: Rock", point={x=3776,y=7544},
            PinAdd="Make sure you have 5/5 Rock Elemental Shards after this"},
        {Text="Complete Scrounging (ogres by elementals)", Ct="Scrounging", point={x=1238,y=7605}},

        {Text="Deliver Study of the Elements: Rock", Dt={q="Study of the Elements: Rock"}, point={x=2595,y=4486}},

        -- req finish study of rock & frost oil chain
        {Text="> Accept This Is Going to be Hard", At="This Is Going to be Hard", point={x=2595,y=4486}},
        {Text="> Deliver This Is Going to be Hard", Dt={q="This Is Going to be Hard"}, point={x=2582,y=4424}},
        {Text="> Accept This Is Going to be Hard", At="This Is Going to be Hard", point={x=2582,y=4424}},
        {Text="> Deliver This Is Going to be Hard", Dt={q="This Is Going to be Hard"}, point={x=2595,y=4486}},
        {Text="> Accept This Is Going to be Hard", At="This Is Going to be Hard", point={x=2595,y=4486}},
        {Text="> Kill the lvl 45 mob that spawns & loot", Ct="This Is Going to Be Hard", point={x=2595,y=4486}},
        {Text="> Deliver This Is Going to be Hard", Dt={q="This Is Going to be Hard"}, point={x=2595,y=4486}},

        {Text="> Accept Liquid Stone", At="Liquid Stone", point={x=2582,y=4424}},
        {Text="> Deliver Liquid Stone", Dt={q="Liquid Stone"}, point={x=2582,y=4424}},
        {Text="> Accept Stone Is Better than Cloth", At="Stone Is Better than Cloth", point={x=2582,y=4424}},
        {Text="> Deliver Stone Is Better than Cloth", Dt={q="Stone Is Better than Cloth"}, point={x=2582,y=4424}},

        {Text="Deliver Scournging", Dt={q="Scrounging", Item="Salbac Shield", Vendor="Salbac Shield"}, point={x=5381,y=4330}},
        -- skip Accept Fiery Blaze Enchantments (2% droprate..) 

      
        -- at uldaman do
        -- a sign of hope
        -- solution of doom
        -- power stones
        {Text="---"},
    }
}