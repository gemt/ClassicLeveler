-- ClassicLeveler = LibStub("AceAddon-3.0"):NewAddon("ClassicLeveler", "AceConsole-3.0", "AceEvent-3.0" )

function OnInitialize()
		-- Called when the addon is loaded

		-- Print a message to the chat frame
		--self:Print("OnInitialize Event Fired: Hello")


end

function OnEnable()
		-- Called when the addon is enabled

		-- Print a message to the chat frame
		--self:Print("OnEnable Event Fired: Hello, again )")
		--self:Print("Setting binds")
		-- https://wowwiki.fandom.com/wiki/BindingID

		--self:Print("Finished Setting Binds")

end

function OnDisable()
		-- Called when the addon is disabled
end

function ToggleMFVisibility()
    local frame = getglobal("VG_MainFrame")
	local fSettings = getglobal("VG_SettingsFrame")
    if frame:IsVisible() then
        frame:Hide()
		if fSettings:IsVisible() then
			fSettings.showthis = true
			fSettings:Hide()
		end
    else
        frame:Show()
		if fSettings.showthis then
			fSettings:Show()
		end
    end
end

function _print( msg )
    if not DEFAULT_CHAT_FRAME then return end
    DEFAULT_CHAT_FRAME:AddMessage ( msg )
    ChatFrame3:AddMessage ( msg )
    ChatFrame4:AddMessage ( msg )
end
