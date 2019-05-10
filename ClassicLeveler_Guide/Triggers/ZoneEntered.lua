
-- ZONE_CHANGED_NEW_AREA new map basically (stv, duskwood, ashenvale, etc)
-- ZONE_CHANGED subzones, i.e when the text on minimap changes

function CLGuide_ZoneEntered()
	if event ~= "ZONE_CHANGED_NEW_AREA" and event ~= "ZONE_CHANGED" then return end
	if CLGuide_CurrentStepTable.Zone == nil then return end
    	
	if CLGuide_CurrentStepTable.Zone == GetRealZoneText() then
		CLGuide_CompleteCurrentStep()
    end
end