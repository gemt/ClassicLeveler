-- Author      : G3m7
-- Create Date : 5/5/2019 2:32:24 PM


CLGuide_Ashenvale = {
	Title="11-20 Darkshore",
	Pinboard = {},
	Steps = {
        {Text="Accept The Tower of Althalaxx", At="The Tower of Althalaxx", point={x=2619,y=3872}},

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