
function CLGuide_SetHs()
	if CLGuide_CurrentStep.SetHs == nil then return end
	if IsShiftKeyDown() then return end

	if event == "GOSSIP_SHOW" then 
        if UnitName("target") ~= CLGuide_CurrentStep.SetHs then return end
        SelectGossipOption(CLGuide_GetGossipIndex("binder"))
    elseif event == "CONFIRM_BINDER" then
        if UnitName("target") ~= CLGuide_CurrentStep.SetHs then return end
	    ConfirmBinder()
        CLGuide_CompleteCurrentStep()
    end

end