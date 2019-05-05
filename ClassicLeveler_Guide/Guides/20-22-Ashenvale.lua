-- Author      : G3m7
-- Create Date : 5/5/2019 2:32:24 PM


CLGuide_Ashenvale = {
	Title="11-20 Darkshore",
	Pinboard = {},
	Steps = {
        {Text="Accept The Tower of Althalaxx", At="The Tower of Althalaxx", point={x=2619,y=3872}},

        {Text="Train Hunter skills", 
            TrainSkill={
                {n="Mend Pet",r="Rank 2", Actionbar=1},
                {n="Arcane Shot",r="Rank 2"},
                {n="Distracting Shot",r="Rank 1"},
                {n="Wing Clip",r="Rank 1"},
            }, point={x=3981,y=1614}
        },
        {Text="Train Pet skills (up the ramp)", 
            TrainSkill={
                {n="Great Stamina",r="Rank 2"},
                {n="Natural Armor",r="Rank 2"},
            }, point={x=4284,y=1006}
        },
    }
}