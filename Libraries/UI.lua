-- @author xGamerman626

-- Requires
local Loader = loadstring(game:HttpGet("https://raw.githubusercontent.com/topitbopit/dollarware/main/library.lua"))

-- Locals
local UI = {}

local User_Interface = Loader({
    rounding = false,
    theme = "cherry",
    smoothDragging = false
})

local Window = User_Interface.newWindow({
    text = "ZO ぞ by xgamer626#1683",
    resize = true,
    size = Vector2.new(550, 376),
    position = nil
})

--[

local Main_Menu = Window:addMenu({
    text = "ZO ぞ"
})

local Main_Section_Main = Main_Menu:addSection({
    text = "Main",
    side = "auto",
    showMinButton = true,
})

local Test_Toggle_Main = Main_Section_Main:addToggle({
    text = "Test", 
    state = false
})

local Main_Section_AutoParry = Main_Menu:addSection({
    text = "Auto Parry",
    side = "auto",
    showMinButton = true,
})

local AutoParry_Toggle = Main_Section_AutoParry:addToggle({
    text = "Auto Parry", 
    state = false
})

Main_Section_AutoParry:addSlider({
    text = "Ping Adjustment",
    min = 0,
    max = 200,
    step = 1,
    val = 0,
}, function(Value)
    getgenv().Sliders.PingAdjustment = Value
end)

Main_Section_AutoParry:addSlider({
    text = "Distance",
    min = 1,
    max = 8,
    step = 1,
    val = 6,
}, function(Value)
    getgenv().Sliders.AutoParryDistance = Value
end)

--]

--[

local Visuals_Menu = Window:addMenu({
    text = "Visuals"
})

local Visuals_Section_Esp = Visuals_Menu:addSection({
    text = "Esp",
    side = "auto",
    showMinButton = true,
})

local Visuals_Section_Misc = Visuals_Menu:addSection({
    text = "Misc",
    side = "auto",
    showMinButton = true,
})

Visuals_Section_Esp:addLabel({text = "WIP"})

local FullBright_Toggle_Misc = Visuals_Section_Misc:addToggle({
    text = "Full Brightness", 
    state = false
})

Visuals_Section_FullBright:addSlider({
    text = "Brightness",
    min = 1,
    max = 5,
    step = 1,
    val = 1,
}, function(Value)
    getgenv().Sliders.Brightness = Value
end)

local NoFog_Toggle_Misc = Visuals_Section_Misc:addToggle({
    text = "No Fog", 
    state = false
})

local NoBlur_Toggle_Misc = Visuals_Section_Misc:addToggle({
    text = "No Blur", 
    state = false
})

--]

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