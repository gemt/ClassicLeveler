
function CLGuide_TakeTaxi()
	if CLGuide_CurrentStepTable.Taxi == nil then return end
	if IsShiftKeyDown() then return end -- disabling taxi logic when holding shift down

	-- todo: handle CLGuide_CurrentStepTable.ReqPrev. Dont wanna fly away automatically if we havent completed prevstep!
	
	if event == "GOSSIP_SHOW" then
		local taxiIdx = CLGuide_GetGossipIndex("taxi")
		if taxiIdx ~= nil then
			-- TODO: CHECK THAT LAST N STEPS ARE PROPERLY COMPLETED BEFORE FLYING AWAY!!!
			-- ALTERNATIVELY, or additionally, popupbox with confirm button 
			SelectGossipOption(taxiIdx)
		end
	elseif event == "TAXIMAP_OPENED" then
		for i=1, NumTaxiNodes() do
			if string.lower(TaxiNodeName(i)) == string.lower(CLGuide_CurrentStepTable.Taxi) then
				TakeTaxiNode(i)
				CLGuide_CompleteCurrentStep()
				return
			end
		end
        GuidePrint("Taxi Destination not found: "..CLGuide_CurrentStepTable.Taxi)
	end
end