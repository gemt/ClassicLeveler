-- Author      : G3m7
-- Create Date : 4/28/2019 10:52:05 AM


function Guide_OnLoad()
	Guide:RegisterForDrag("LeftButton");
	Guide:SetScript("OnUpdate", Guide_OnUpdate)

	Guide.MAX_STEPS = 5
	Guide.Steps = {}
	Guide.StepHeight = Guide:GetHeight()/Guide.MAX_STEPS

	for i=1,Guide.MAX_STEPS-1 do
		Guide.Steps[i] = {
			Bg = CreateFrame("Frame"),
			Text = Guide:CreateFontString(nil,"ARTWORK")
		}

		--Guide.Steps[i].Bg:SetWidth(100)
		if i == 1 then
			Guide.Steps[i].Bg:SetPoint("TOPLEFT", Guide, "TOPLEFT", 3, -3)
		else
			Guide.Steps[i].Bg:SetPoint("TOPLEFT", Guide.Steps[i-1].Bg, "BOTTOMLEFT", 0, 0)
		end
		Guide.Steps[i].Bg:SetPoint("RIGHT", Guide, "RIGHT", -3,0)
		Guide.Steps[i].Bg:SetHeight(Guide.StepHeight)
		

		Guide.Steps[i].Bg:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background", 
												edgeFile = "Interface\AddOns\ClassicLeveler_Guide\Textures\Borders\fer6", 
												tile = false, tileSize = 1, edgeSize = 1, 
												insets = { left = 0, right = 0, top = 0, bottom = 0 }});
		

		Guide.Steps[i].Text:SetFont("Fonts\\ARIALN.ttf", 13, "OUTLINE")
		Guide.Steps[i].Text:SetPoint("TOPLEFT", Guide.Steps[i].Bg, "TOPLEFT", 10, -10)
		Guide.Steps[i].Text:SetPoint("BOTTOMRIGHT", Guide.Steps[i].Bg, "BOTTOMRIGHT", -10, -10)
		Guide.Steps[i].Text:SetJustifyV("TOP");
		Guide.Steps[i].Text:SetJustifyH("LEFT");

		Guide.Steps[i].Text:SetText("Step number "..i)
	end
	Guide.Steps[1].Bg:SetBackdropColor(0.5,0.5,0.5);
	Guide.Steps[2].Bg:SetBackdropColor(0.9,0.9,0.9);
	Guide.Steps[3].Bg:SetBackdropColor(0.5,0.5,0.5);
	Guide.Steps[4].Bg:SetBackdropColor(0.5,0.5,0.5);
	--[[

	Guide.text1 = Guide:CreateFontString(nil,"ARTWORK") 
	Guide.text1:SetFont("Fonts\\ARIALN.ttf", 13, "OUTLINE")
	Guide.text1:SetPoint("TOPLEFT", Guide, "TOPLEFT", 0, 0)
	Guide.text1:SetPoint("RIGHT", Guide, "RIGHT", 0, 0)
	Guide.text1:SetHeight(100)
	Guide.text1:SetJustifyV("TOP");
	Guide.text1:SetJustifyH("LEFT");
	Guide.text1:SetText("text 1111 text 1111 text 1111 text 1111 text 1111 text 1111text 1111 text 1111 text 1111 text 1111 text 1111 text 1111 ")

	Guide.bg1 = CreateFrame("Frame")
	Guide.bg1:SetWidth(100)
	Guide.bg1:SetHeight(100)
	Guide.bg1:SetPoint("TOPLEFT", Guide.text1, "TOPLEFT", 0, 0)
	Guide.bg1:SetPoint("BOTTOMRIGHT", Guide.text1, "BOTTOMRIGHT", 0,0)
	Guide.bg1:SetBackdrop(BACKDROP)
	Guide.bg1:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background", 
                                            edgeFile = "Interface/Tooltips/UI-Tooltip-Border", 
                                            tile = false, tileSize = 1, edgeSize = 1, 
                                            insets = { left = 0, right = 0, top = 0, bottom = 0 }});
	Guide.bg1:SetBackdropColor(0.5,0.5,0.5);
	Guide.bg1:Show();
	
	Guide.text2 = Guide:CreateFontString(nil,"ARTWORK") 
	Guide.text2:SetFont("Fonts\\ARIALN.ttf", 13, "OUTLINE")
	Guide.text2:SetPoint("TOPLEFT", Guide.text1, "BOTTOMLEFT", 0, 0)
	Guide.text2:SetPoint("RIGHT", Guide, "RIGHT", 0, 0)
	Guide.text2:SetHeight(100)
	Guide.text2:SetJustifyV("TOP");
	Guide.text2:SetJustifyH("LEFT");
	Guide.text2:SetText("222222 222222222222 222222222222 222222222222 222222222222 222222222222 222222222222 222222 ")
	
	Guide.bg2 = CreateFrame("Frame")
	Guide.bg2:SetWidth(100)
	Guide.bg2:SetHeight(100)
	Guide.bg2:SetPoint("TOPLEFT", Guide.text2, "TOPLEFT", 0, 0)
	Guide.bg2:SetPoint("BOTTOMRIGHT", Guide.text2, "BOTTOMRIGHT", 0,0)
	Guide.bg2:SetBackdrop(BACKDROP)
	Guide.bg2:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background", edgeFile = "Interface/Tooltips/UI-Tooltip-Border", tile = false, tileSize = 1, edgeSize = 1, insets = { left = 0, right = 0, top = 0, bottom = 0 }});
	Guide.bg2:SetBackdropColor(0.7,0.7,0.7);
	Guide.bg2:Show();
	
	Guide:Show();
	return
	--Guide:Hide()
	local f2 = CreateFrame("Frame",nil,UIParent)
	f2:SetWidth(1) 
	f2:SetHeight(1) 
	f2:SetAlpha(.90);
	f2:SetPoint("TOPLEFT", Guide, "TOPLEFT", 10, ypos)
	--f2:SetPoint("CENTER", ,650,-100)
	
	f2.text = f2:CreateFontString(nil,"ARTWORK") 
	f2.text:SetFont("Fonts\\ARIALN.ttf", 13, "OUTLINE")
	--f2.text:SetPoint("CENTER",0,0)
	f2:Hide()
	
	local function displayupdate(show, message)
		if show == 1 then
			Guide.text:SetText(message)
			Guide:Show()
			f2:Hide()
		elseif show == 2 then
			f2.text:SetText(message)
			f2:Show()
			Guide:Hide()
		else
			Guide:Hide()
			f2:Hide()
		end
	end
 
	displayupdate(1, "1")
	--or 
	--displayupdate(2, "2")
	
	--or 
	--displayupdate() -- to just hide both

	--or possibly display both objectives in the one fontstring
	--displayupdate(1, "myobjective1\nmyobjective2")
 
	--To use variables:
	local objective1 = "myobjective1"
	local objective2 = "myobjective2"
	--displayupdate(1, objective1.."\n"..objective2)
	]]
end

function Guide_OnEvent(event)

end

function Guide_OnUpdate()
	if Guide.IsDragging == 1 then
		Guide.StepHeight = Guide:GetHeight()/Guide.MAX_STEPS
		for i=1,Guide.MAX_STEPS-1 do
			Guide.Steps[i].Bg:SetHeight(Guide.StepHeight)
		end
		_print(Guide:GetHeight()..", "..Guide.StepHeight..", "..Guide.Steps[1].Bg:GetHeight())
		--Guide.text1:SetHeight(Guide:GetHeight()/3)
		--Guide.text2:SetHeight(Guide:GetHeight()/3)
	end
end
