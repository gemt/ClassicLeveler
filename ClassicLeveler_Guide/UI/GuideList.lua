local ListCreated = false
local CLGuide_TableLength = getn(CLGuide_GuideTable)
local CLGuide_GuideListFrames = {}

function CreateGuideList()
	if ListCreated == false then 
		for i = 1, CLGuide_TableLength do
			CLGuide_GuideListFrames[i] = CreateFrame("Button", "ListCLGuide_GuideListFrames"..i, CLGuide_GuideListFrame)
	        CLGuide_GuideListFrames[i]:SetPoint("TOPLEFT", CLGuide_GuideListFrame, "TOPLEFT", 10, -40*i)
	        CLGuide_GuideListFrames[i]:SetWidth(280)
	        CLGuide_GuideListFrames[i]:SetHeight(50)

	        CLGuide_GuideListFrames[i].text = CLGuide_GuideListFrames[i]:CreateFontString(nil,"ARTWORK") 
			CLGuide_GuideListFrames[i].text:SetFont("Interface\\AddOns\\ClassicLeveler_Guide\\Artwork\\Inconsolata.ttf", CLGuide_Options.FontSize)
			CLGuide_GuideListFrames[i].text:SetPoint("LEFT", CLGuide_GuideListFrames[i], "LEFT", 0, 8)

			CLGuide_GuideListFrames[i].text:SetText(CLGuide_GuideTable[i].Title)

			CLGuide_GuideListFrames[i]:SetScript("OnClick", GuideListFrames_OnClick)
		end
		ListCreated = true
	end
	CLGuide_GuideListFrame:SetHeight(40*((CLGuide_TableLength+1)))
	CLGuide_GuideListFrame:Show()
end

function GuideListFrames_OnClick()
	local Guide = this.text:GetText()
	for i = 1, CLGuide_TableLength do
		if CLGuide_GuideTable[i].Title == Guide then
			CLGuide_SetSection(i)
			CLGuide_GuideListFrame:Hide()
		end
	end

end