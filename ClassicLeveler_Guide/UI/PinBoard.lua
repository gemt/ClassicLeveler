local CLGuide_PinBoardFrames = {}
local EmptyPinFrames = 0
local PinFrameAmount = 0
local useFrame = 0
--Move this to Saved Vars
CLGuide_PinText = {}

--============================
-- Add & Remove Pins Functions
--============================
function CLGuide_AddPin(text)
	for k, v in pairs(CLGuide_PinText) do
		if v == text then 
			return
		end
	end
	if EmptyPinFrames > 0 then
		useFrame = PinFrameAmount - EmptyPinFrames + 1
		for k, v in pairs(CLGuide_PinBoardFrames) do
			if k == useFrame then 
				CLGuide_PinBoardFrames[useFrame].text:SetText(text)
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
		CLGuide_PinBoardFrames[PinNumber].text:SetFont("Interface\\AddOns\\ClassicLeveler_Guide\\Artwork\\Inconsolata.ttf", CLGuide_Options.FontSize)
		CLGuide_PinBoardFrames[PinNumber].text:SetPoint("LEFT", CLGuide_PinBoardFrames[PinNumber], "LEFT", 0, 8)
		CLGuide_PinBoardFrames[PinNumber].text:SetText(text)

		CLGuide_PinBoardFrames[PinNumber]:SetScript("OnClick", CLGuide_PinBoardFrames.OnClick)
		CLGuide_PinBoardFrames[PinNumber]:SetScript("OnMouseDown", CLGuide_PinBoardFrames.Moving)
		CLGuide_PinBoardFrames[PinNumber]:SetScript("OnDragStart", CLGuide_PinBoardFrames.Moving)
		CLGuide_PinBoardFrames[PinNumber]:SetScript("OnDragStop", CLGuide_PinBoardFrames.StopMoving)
		CLGuide_PinBoardFrames[PinNumber]:SetScript("OnMouseUp", CLGuide_PinBoardFrames.StopMoving)
		-- Set PinBoard height depending on amount of frames, this should be changed later 
		-- to check for amount of text to change height of individual frame heights of PinBoardFrame
		-- This would then need to check the total height of all frames to setheight instead of amount of frames
		CLGuide_PinBoard:SetHeight(40*PinNumber)
		PinFrameAmount = PinFrameAmount + 1
	end
	table.insert(CLGuide_PinText, text)
	CLGuide_PinBoard:Show()
end

function CLGuide_RemovePin(frameText)
	for k, v in pairs(CLGuide_PinText) do
		if v == frameText then 
			EmptyPinFrames = EmptyPinFrames + 1
			CLGuide_PinBoard:SetHeight(CLGuide_PinBoard:GetHeight()-40)
			table.remove(CLGuide_PinText, k)
			local PinTextLength = getn(CLGuide_PinText)
			for i = 1, PinTextLength do 
				CLGuide_PinBoardFrames[i].text:SetText(CLGuide_PinText[i])
			end
			for i = PinTextLength+1, PinFrameAmount do
				CLGuide_PinBoardFrames[i].text:SetText(" ")
				CLGuide_PinBoardFrames[i]:Hide()
			end
		end
	end
end

--================
-- Mouse Functions
--================
function CLGuide_PinBoardFrames.OnClick()
	if not IsShiftKeyDown() then 
		return 
	end
	CLGuide_RemovePin(this.text:GetText())
end

function CLGuide_PinBoardFrames.Moving()
	CLGuide_PinBoard:StartMoving()
end

function CLGuide_PinBoardFrames.StopMoving()
	CLGuide_PinBoard:StopMovingOrSizing()
end