-- @author xGamerman626

-- Requires
local Loader = loadstring(game:HttpGet("https://raw.githubusercontent.com/topitbopit/dollarware/main/library.lua"))

-- Locals
local UI = {}

-- Main
function UI:Init()

    AutoParry_Toggle:bindToEvent("onToggle", function(State)
        getgenv().Toggles.AutoParry = State
        UI.notify({
            title = "Toggle",
            message = "Auto Parry was toggled to " .. tostring(State),
            duration = 1.5
        })
    end)
    
    FullBright_Toggle_Misc:bindToEvent("onToggle", function(State)
        getgenv().Toggles.FullBright = State
        UI.notify({
            title = "Toggle",
            message = "Full Bright was toggled to " .. tostring(State),
            duration = 1.5
        })
    end)
    
    NoFog_Toggle_Misc:bindToEvent("onToggle", function(State)
        getgenv().Toggles.NoFog = State
        UI.notify({
            title = "Toggle",
            message = "No Fog was toggled to " .. tostring(State),
            duration = 1.5
        })
    end)
    
    NoBlur_Toggle_Misc:bindToEvent("onToggle", function(State)
        getgenv().Toggles.NoBlur = State
        UI.notify({
            title = "Toggle",
            message = "No Blur was toggled to " .. tostring(State),
            duration = 1.5
        })
    end)

end

-- Return
return UI