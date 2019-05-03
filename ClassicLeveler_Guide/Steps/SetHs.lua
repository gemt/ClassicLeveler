
function CLGuide_SetHs()
	if Guide.CurrentStep.SetHs == nil then return end
	if event ~= "GOSSIP_SHOW" then return end
	if UnitName("target") ~= Guide.CurrentStep.SetHs then return end
	
	ConfirmBinder() -- TODO: in 1.12, we can call this without selecting gossip option. Test on retail
end