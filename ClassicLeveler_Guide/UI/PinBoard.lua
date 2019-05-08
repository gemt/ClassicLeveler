local CLGuide_PinBoardFrames = {}
local EmptyPinFrames = 0
local PinFrameAmount = 0
local useFrame = 0
--Move this to Saved Vars
CLGuide_PinText = {}

function CLGuide_AddPin(text)
	if EmptyPinFrames > 0 then
		useFrame = PinFrameAmount - EmptyPinFrames + 1
		for k, v in pairs(CLGuide_PinBoardFrames) do
			if k == useFrame then 
				CLGuide_PinBoardFrames[useFrame].text:SetText("EmptyAdd")
				CLGuide_PinBoardFrames[useFrame]:Show()
				EmptyPinFrames = EmptyPinFrames - 1
			end
		end
		CLGuide_PinBoard:SetHeight(CLGuide_PinBoard:GetHeight()+40)
	elseif EmptyPinFrames == 0 then
		local PinNumber = PinFrameAmount+1
		CLGuide_PinBoardFrames[PinNumber] = CreateFrame("Button", "CLGuide_PinBoardFrames"..PinNumber, CLGuide_PinBoard)
	    CLGuide_PinBoardFrames[PinNumber]:SetPoint("TOPLEFT", CLGuide_PinBoard, "TOPLEFT", 10, -40*(PinNumber-1))
	    CLGuide_PinBoardFrames[PinNumber]:SetWidth(180)
	    CLGuide_PinBoardFrames[PinNumber]:SetHeight(40)
	    -- Texture Test
	    --CLGuide_PinBoardFrames[PinNumber]:SetNormalTexture("Interface/Buttons/UI-Panel-Button-Up")

	    CLGuide_PinBoardFrames[PinNumber].text = CLGuide_PinBoardFrames[PinNumber]:CreateFontString(nil,"ARTWORK") 
		CLGuide_PinBoardFrames[PinNumber].text:SetFont("Fonts\\ARIALN.ttf", CLGuide_Options.FontSize)
		CLGuide_PinBoardFrames[PinNumber].text:SetPoint("LEFT", CLGuide_PinBoardFrames[PinNumber], "LEFT", 0, 8)
		CLGuide_PinBoardFrames[PinNumber].text:SetText(text)

		CLGuide_PinBoardFrames[PinNumber]:SetScript("OnClick", CLGuide_PinBoardFrames.OnClick)

		-- Set PinBoard height depending on amount of frames, this should be changed later 
		-- to check for amount of text to change height of individual frame heights of PinBoardFrame
		-- This would then need to check the total height of all frames to setheight instead of amount of frames
		CLGuide_PinBoard:SetHeight(40*PinNumber)
		PinFrameAmount = PinFrameAmount + 1
		table.insert(CLGuide_PinText, text)
		GuidePrint(CLGuide_PinText[PinFrameAmount])
	end
	CLGuide_PinBoard:Show()
end

function CLGuide_PinBoardFrames.OnClick()
	CLGuide_RemovePin(this)
	GuidePrint(this:GetName())
end

function CLGuide_RemovePin(frameName)
	frameName:Hide()
	frameName.text:SetText("")
	EmptyPinFrames = EmptyPinFrames + 1
	if EmptyPinFrames == PinFrameAmount then 
		CLGuide_PinBoard:Hide()
	-- This needs fixing, only works if you remove frames in order
	-- Need to table.remove CLGuide_PinText
	else 
		for i = 1, PinFrameAmount do 
			-- use CLGuide_PinText table saved var where text ~= nil
		end
	end

	CLGuide_PinBoard:SetHeight(CLGuide_PinBoard:GetHeight()-40)

end