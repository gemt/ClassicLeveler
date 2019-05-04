
function CLGuide_TakeTaxi()
	if CLGuide_CurrentStep.Taxi == nil then return end
	if IsShiftKeyDown() then return end -- disabling taxi logic when holding shift down

	-- todo: handle CLGuide_CurrentStep.ReqPrev. Dont wanna fly away automatically if we havent completed prevstep!
	
	if event == "GOSSIP_SHOW" then
		for i=1, NumTaxiNodes() do
			if string.lower(TaxiNodeName(i)) == string.lower(CLGuide_CurrentStep.Taxi) then
				TakeTaxiNode(i)
				CLGuide_CompleteCurrentStep()
			end
		end
	elseif event == "TAXIMAP_OPENED" then
		local taxiIdx = CLGuide_GetGossipIndex("taxi")
		if taxiIdx ~= nil then
			-- TODO: CHECK THAT LAST N STEPS ARE PROPERLY COMPLETED BEFORE FLYING AWAY!!!
			-- ALTERNATIVELY, or additionally, popupbox with confirm button 
			SelectGossipOption(taxiIdx)
		end
	end
	
end