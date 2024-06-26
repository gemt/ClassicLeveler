----------------------------------------------------------------------------
--  TomTom: A navigational assistant for World of Warcraft
--  CrazyTaxi: A crazy-taxi style arrow used for waypoint navigation.
--  concept taken from MapNotes2 (Thanks to Mery for the idea, along
--  with the artwork.)
----------------------------------------------------------------------------
--Lua5 doesnt support mod math via the % operator
function Questie_Modulo(val, by)
    return val - math.floor(val/by)*by;
end
math.modf = function(number)
    local fractional = Questie_Modulo(number, 1)
    local integral = number - fractional
    return integral, fractional
end
---------------------------------------------------------------------------------------------------
function GetPlayerFacing()
    local p = Minimap
    local m = ({p:GetChildren()})[9]
    return m:GetFacing()
end
---------------------------------------------------------------------------------------------------
local sformat = string.format
local function ColorGradient(perc, tablee)
    local num = table.getn(tablee)
    local hexes = tablee[1] == "string"
    if perc == 1 then
        return tablee[num-2], tablee[num-1], tablee[num]
    end
    num = num / 3
    local segment, relperc = math.modf(perc*(num-1))
    local r1, g1, b1, r2, g2, b2
    r1, g1, b1 = tablee[(segment*3)+1], tablee[(segment*3)+2], tablee[(segment*3)+3]
    r2, g2, b2 = tablee[(segment*3)+4], tablee[(segment*3)+5], tablee[(segment*3)+6]
    if not r1 then return end
    if not r2 or not g2 or not b2 then
        return r1, g1, b1
    else
        return r1 + (r2-r1)*relperc,
            g1 + (g2-g1)*relperc,
            b1 + (b2-b1)*relperc
    end
end
---------------------------------------------------------------------------------------------------
local twopi = math.pi * 2
function WayFrame_OnClick()
    if (MouseIsOver(TomTomCrazyArrow) ~= nil) and (arg1 == "RightButton") then
        TomTomCrazyArrow:Hide()
    end
end
---------------------------------------------------------------------------------------------------
wayframe = CreateFrame("Button", "TomTomCrazyArrow", UIParent)
wayframe:SetHeight(42)
wayframe:SetWidth(56)
wayframe:SetPoint("CENTER", 0, 0)
wayframe:EnableMouse(true)
wayframe:SetMovable(true)
-- Frame used to control the scaling of the title and friends
local titleframe = CreateFrame("Frame", nil, wayframe)
wayframe.title = titleframe:CreateFontString("OVERLAY", nil, "GameFontHighlightSmall")
wayframe.status = titleframe:CreateFontString("OVERLAY", nil, "GameFontNormalSmall")
wayframe.title:SetPoint("TOP", wayframe, "BOTTOM", 0, 0)
wayframe.status:SetPoint("TOP", wayframe.title, "BOTTOM", 0, 0)
---------------------------------------------------------------------------------------------------
local function OnDragStart(self, button)
    if IsControlKeyDown() and IsShiftKeyDown() then
        this:StartMoving()
        wayframe:SetClampedToScreen(true);
    end
end
---------------------------------------------------------------------------------------------------
local function OnDragStop(self, button)
    this:StopMovingOrSizing()
end
---------------------------------------------------------------------------------------------------
local function OnEvent(self, event, ...)
    if event == "ZONE_CHANGED_NEW_AREA" then
        self:Show()
    end
end
---------------------------------------------------------------------------------------------------
wayframe:SetScript("OnDragStart", OnDragStart)
wayframe:SetScript("OnDragStop", OnDragStop)
wayframe:RegisterForDrag("LeftButton")
wayframe:RegisterEvent("ZONE_CHANGED_NEW_AREA")
wayframe:SetScript("OnEvent", OnEvent)
wayframe.arrow = wayframe:CreateTexture("OVERLAY")
wayframe.arrow:SetTexture("Interface\\AddOns\\ClassicLeveler_Guide\\images\\Arrow")
wayframe.arrow:SetAllPoints()
---------------------------------------------------------------------------------------------------
local active_point, arrive_distance, showDownArrow, point_title, arrow_objective, isHide
local TestPoint = {
x = 324, 
y = 495
}

function SetCrazyArrow(point, title)

    active_point = point
    arrive_distance = 999999
    point_title = title
    if active_point and not isHide then
        wayframe.title:SetText(point_title or "Unknown waypoint")
        wayframe:Show()
		wayframe.arrow:Show()
    else
        wayframe:Hide()
    end
end
function HideCrazyArrow()
	wayframe:Hide()
end
---------
local status = wayframe.status
local arrow = wayframe.arrow
local arrowLastUpdate = 0;
local LastPlayerPosition = {};
local count = 0

function CLGuide_GetDistToActivePoint()
	if active_point == nil then
		return nil
	end
	return arrive_distance
end

local function OnUpdate(self, elapsed)
	if active_point == nil then
		return
	end
    if GetTime() - arrowLastUpdate >= .04 then
        self = this
        local dist,x,y
        if (TomTomCrazyArrow:IsVisible() ~= nil) then
            local dist,x,y = Arrow_GetDistanceToPoint(active_point)
            arrive_distance = dist
            if not dist or IsInInstance() then
                if not active_point.x and not active_point.y then
                    active_point = nil
                end
                self:Hide()
                return
            end
            status:SetText(sformat("%d yards", dist))
            local cell
            -- Showing the arrival arrow?
            --[[
			if dist <= 5 then
                if not showDownArrow then
                    arrow:SetHeight(70)
                    arrow:SetWidth(53)
                    arrow:SetTexture("Interface\\AddOns\\ClassicLeveler_Guide\\images\\Arrow-UP")
                    arrow:SetVertexColor(0, 1, 0)
                    showDownArrow = true
                end
                count = count + 1
                if count >= 55 then
                    count = 0
                end
                cell = count
                local column = Questie_Modulo(cell, 9)
                local row = floor(cell / 9)
                local xstart = (column * 53) / 512
                local ystart = (row * 70) / 512
                local xend = ((column + 1) * 53) / 512
                local yend = ((row + 1) * 70) / 512
                arrow:SetTexCoord(xstart,xend,ystart,yend)
            else
			]]
                if showDownArrow then
                    arrow:SetHeight(56)
                    arrow:SetWidth(42)
                    arrow:SetTexture("Interface\\AddOns\\ClassicLeveler_Guide\\images\\Arrow")
                    showDownArrow = false
                end
                local degtemp = Arrow_GetDirectionToPoint(active_point);
                if degtemp < 0 then degtemp = degtemp + 360; end
                local angle = math.rad(degtemp)
                local player = GetPlayerFacing() + 0.1
                angle = angle - player
                local perc = 1-  math.abs(((math.pi - math.abs(angle)) / math.pi))
                local gr,gg,gb = 1, 1, 1
                local mr,mg,mb = 0.75, 0.75, 0.75
                local br,bg,bb = 0.5, 0.5, 0.5
                local tablee = {};
                table.insert(tablee, gr)
                table.insert(tablee, gg)
                table.insert(tablee, gb)
                table.insert(tablee, mr)
                table.insert(tablee, mg)
                table.insert(tablee, mb)
                table.insert(tablee, br)
                table.insert(tablee, bg)
                table.insert(tablee, bb)
                local r,g,b = ColorGradient(perc,tablee)
                if not g then
                    g = 0;
                end
                arrow:SetVertexColor(1-g,-1+g*2,0)
                cell = Questie_Modulo(floor(angle / twopi * 108 + 0.5), 108);
                local column = Questie_Modulo(cell, 9)
                local row = floor(cell / 9)
                local xstart = (column * 56) / 512
                local ystart = (row * 42) / 512
                local xend = ((column + 1) * 56) / 512
                local yend = ((row + 1) * 42) / 512
                arrow:SetTexCoord(xstart,xend,ystart,yend)
            --end
        end
        arrowLastUpdate = GetTime()
    end
end
---------------------------------------------------------------------------------------------------
wayframe:SetScript("OnUpdate", OnUpdate)
wayframe:RegisterForClicks("RightButtonUp")
wayframe:SetScript("OnClick", WayFrame_OnClick)
local function getCoords(column, row)
    local xstart = (column * 56) / 512
    local ystart = (row * 42) / 512
    local xend = ((column + 1) * 56) / 512
    local yend = ((row + 1) * 42) / 512
    return xstart, xend, ystart, yend
end
---------------------------------------------------------------------------------------------------
--this is where texcoords are extracted incorrectly (I think), leading the arrow to not point in the correct direction
local texcoords = setmetatable({}, {__index = function(t, k)
    -- this was k:match("(%d+):(%d+)") - so we need string.match, but that's not in Lua 5.0
    local fIndex, lIndex = string.find(k, "(%d+)")
    local col = string.sub(k, fIndex, lIndex)
    fIndex2, lIndex2 = string.find(k, ":(%d+)")
    local row = string.sub(k, fIndex2+1, lIndex2)
    col,row = tonumber(col), tonumber(row)
    local obj = {getCoords(col, row)}
    rawset(t, k, obj)
    return obj
end})
---------------------------------------------------------------------------------------------------
wayframe:RegisterEvent("ADDON_LOADED")
local runonce = true
wayframe:SetScript("OnEvent", function(self, event, arg1, ...)
    if runonce == true then
        local feed_crazy = CreateFrame("Frame")
        local crazyFeedFrame = CreateFrame("Frame")
        local throttle = 1
        local counter = 0
        crazyFeedFrame:SetScript("OnUpdate", function(self, elapsed)
            elapsed = 1/GetFramerate()
            counter = counter + elapsed
            if counter < throttle then
                return
            end
            counter = 0
            local angle = Arrow_GetDirectionToPoint(active_point)
            local player = GetPlayerFacing()
            if not angle or not player then
                feed_crazy.iconCoords = texcoords["1:1"]
                feed_crazy.iconR = 0.2
                feed_crazy.iconG = 1.0
                feed_crazy.iconB = 0.2
                feed_crazy.text = "No waypoint"
                return
            end
            angle = angle - player
            local perc = math.abs((math.pi - math.abs(angle)) / math.pi)
            local gr,gg,gb = 1, 1, 1
            local mr,mg,mb = 0.75, 0.75, 0.75
            local br,bg,bb = 0.5, 0.5, 0.5
            local tablee = {};
            table.insert(tablee, gr)
            table.insert(tablee, gg)
            table.insert(tablee, gb)
            table.insert(tablee, mr)
            table.insert(tablee, mg)
            table.insert(tablee, mb)
            table.insert(tablee, br)
            table.insert(tablee, bg)
            table.insert(tablee, bb)
            local r,g,b = ColorGradient(perc, tablee)
            feed_crazy.iconR = r
            feed_crazy.iconG = g
            feed_crazy.iconB = b
            cell = Questie_Modulo(floor(angle / twopi * 108 + 0.5) ,108)
            local column = Questie_Modulo(cell, 9)
            local row = floor(cell / 9)
            local key = column .. ":" .. row
            feed_crazy.iconCoords = texcoords[key]
            feed_crazy.text = point_title or "Unknown waypoint"
        end)
    end
    runonce = false
end)

---------------------------------------------------------------------------------------------------
function Arrow_GetDirectionToPoint( point )
    if not point then return end
    local x, y = GetPlayerMapPosition("player")
	x = x*10000
	y = y*10000
    local dist, xDelta, yDelta = Arrow_GetDistanceToPoint(point)
    if not xDelta or not yDelta then return end
    local dir = atan2(xDelta, -(yDelta))
    if ( dir > 0 ) then
        return twopi - dir;
    else
        return -dir;
	end
end
function Arrow_GetDistanceToPoint( point )
    local x, y = GetPlayerMapPosition("player")
	x = x*10000
	y = y*10000
    local dist, xDelta, yDelta = Arrow_ComputeDistance(x, y, point.x, point.y)
    return dist, xDelta, yDelta
end

function Arrow_ComputeDistance(x1, y1, x2, y2)
    local xDelta = x2 - x1
    local yDelta = y2 - y1
    local dist = sqrt(xDelta*xDelta + yDelta*yDelta);
    return dist, xDelta, yDelta;
end
function ArrowPrint()
	GuidePrint(active_point.x..", "..active_point.y)
end
--SetCrazyArrow(TestPoint, title)