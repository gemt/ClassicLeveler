-- Author      : G3m7
-- Create Date : 4/30/2019 8:59:06 PM

--At = AcceptTrigger (quest is in questlog)
--Ct = CompleteTrigger (quest is completed in questlog, only works for quest with n/x objectives)
--Dt = DeliveredTrigger (quest is delivered, no longer in questlog)
CL_GuideSteps = {
	{Text="Turn inn Flight to Auberdine. Accept Return to Nessa", At="Return to Nessa", point={x=3677,y=4428}},
	{Text="Accept washed ashore (by FP)", At="Washed Ashore", point={x=3662,y=4559}},
	{Text="Accept buzzbox (second floor innkeeper)", At="Buzzbox 827", point={x=3697,y=4413}},
	{Text="Accept Bashal'Aran (Thundris Windweaver, north mainhouse)", At="Bashal'Aran", point={x=3740,y=4013}},
	{Text="Accept Plagued Lands (bear quest dude)", At="Plagued Lands", point={x=3884,y=4341}},
	{Text="Accept How Big a Threat?", At="How Big a Threat?", point={x=3938,y=4348}},

	{Text="Turn inn Bashal'Aran quests", point={x=4418,y=3630}},
	{Text="trap a grizzly bear (Plagued Lands)", Ct="Plagued Lands", point={x=4421,y=3196}},
	{Text="grind to close to 13 on moonkins, have at least 9 eggs", point={x=4517,y=4519}},
	{Text="swing my furbolog camp for How big a threat", Ct="How Big a Threat?", point={x=3985,y=5393}},
	{Text="can kill striders too for strider meat (cooking quest)"},
}