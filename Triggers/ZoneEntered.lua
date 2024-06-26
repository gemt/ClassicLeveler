
-- ZONE_CHANGED_NEW_AREA new map basically (stv, duskwood, ashenvale, etc)
-- ZONE_CHANGED subzones, i.e when the text on minimap changes
-- None of this really works well (except ZONE_CHANGED_NEW_AREA) because the api functions returns the previous zone
-- on event......
function CLGuide_ZoneEntered()
	if CLGuide_CurrentStepTable.Zone == nil then return end
	if      event ~= "ZONE_CHANGED_NEW_AREA" 
        and event ~= "ZONE_CHANGED" 
        and event ~= "ZONE_CHANGED_INDOORS" then 
        return 
    end
    local zoneLower = string.lower(CLGuide_CurrentStepTable.Zone)
    if event == "ZONE_CHANGED_NEW_AREA" and zoneLower == string.lower(GetRealZoneText()) then
		CLGuide_CompleteCurrentStep()
    elseif event == "ZONE_CHANGED" and zoneLower == string.lower(GetMinimapZoneText()) then
        CLGuide_CompleteCurrentStep()
    elseif event == "ZONE_CHANGED_INDOORS" and zoneLower == string.lower(GetMinimapZoneText()) then
        CLGuide_CompleteCurrentStep()
    end
end