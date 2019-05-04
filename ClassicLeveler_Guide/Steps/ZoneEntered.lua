
function CLGuide_ZoneEntered()
	if event ~= "ZONE_CHANGED_NEW_AREA" then return end
	if CLGuide_CurrentStep.Zone == nil then return end
	
	if CLGuide_CurrentStep.Zone == GetRealZoneText() then
		CLGuide_CompleteCurrentStep()
	end

end