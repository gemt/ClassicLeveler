
function CLGuide_DeathWarp()
    if CLGuide_CurrentStepTable.DeathWarp == nil then return end
	if IsShiftKeyDown() then return end

	if event == "GOSSIP_SHOW" then 
        SelectGossipOption(CLGuide_GetGossipIndex("healer"))
    elseif event == "CONFIRM_XP_LOSS" then
	    AcceptXPLoss()
        CLGuide_CompleteCurrentStep()
    elseif event == "PLAYER_DEAD" then
        RepopMe()
    end
end