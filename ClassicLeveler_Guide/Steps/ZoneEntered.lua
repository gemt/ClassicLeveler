
function CLGuide_ZoneEntered()
	if event ~= "ZONE_CHANGED_NEW_AREA" then return end
	if Guide.CurrentStep.Zone == nil then return end
	
	if Guide.CurrentStep.Zone == GetRealZoneText() then
		Guide_CompleteStep(Guide.CurrentStepIndex)
	end

end