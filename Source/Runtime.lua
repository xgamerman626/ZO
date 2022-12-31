-- @author xGamerman626

-- Disconnections
if getgenv().Activated == true then
    pcall(function()
        getgenv().Connections.RenderStepped:Disconnect()
        getgenv().Connections.RenderStepped = nil
    end)
end

-- Services
local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local Run = game:GetService("RunService")

-- Requires
local UI = loadstring(readfile("xGamer626Zo/Libraries/UI.lua"))()
local ACB = loadstring(readfile("xGamer626Zo/Libraries/ACB.lua"))()

-- Locals
local Runtime = {}

getgenv().Activated = true
getgenv().Connections = {
    RenderStepped = nil,
}
getgenv().Sliders = {
    -- ZO
    PingAdjustment = 0,
    AutoParryDistance = 1,
    
    -- Visuals
    Brightness = 1,
}
getgenv().Toggles = {
    -- ZO
    AutoParry = false,

    -- Visuals
    FullBright = false,
    NoFog = false,
    NoBlur = false,
}
getgenv().AnimationIds = {
    -- Single

    -- Katana
    ["rbxassetid://6678908798"] = "1",
    ["rbxassetid://6678909967"] = "2",
    ["rbxassetid://6678913068"] = "3",
    ["rbxassetid://6678914641"] = "4",

    -- Naginata
    ["rbxassetid://6708118912"] = "1",
    ["rbxassetid://6835409260"] = "2",
    ["rbxassetid://6708121991"] = "3",
    ["rbxassetid://6708121121"] = "4",

    -- Tanto
    ["rbxassetid://7845695759"] = "1",
    ["rbxassetid://7845695236"] = "2",
    ["rbxassetid://7845696985"] = "3",
    ["rbxassetid://7845696360"] = "4",

    -- Caestus
    ["rbxassetid://11752087150"] = "1",
    ["rbxassetid://11752098805"] = "2",
    ["rbxassetid://11752104735"] = "3",
    ["rbxassetid://11752111783"] = "4",

    -- Kanabo
    ["rbxassetid://6995852606"] = "1",
    ["rbxassetid://6995853850"] = "2",
    ["rbxassetid://6996771877"] = "3",
    ["rbxassetid://7011157033"] = "4",

    -- Dual Katana
    ["rbxassetid://10845243083"] = "1",
    ["rbxassetid://10845245059"] = "2",
    ["rbxassetid://10845246818"] = "3",
    ["rbxassetid://10845248893"] = "4",

    -- Dual Naginata
    ["rbxassetid://10894792030"] = "1",
    ["rbxassetid://10894797599"] = "2",
    ["rbxassetid://10894802358"] = "3",
    ["rbxassetid://10894812313"] = "4",

    -- Dual Tanto
    ["rbxassetid://10895051471"] = "1",
    ["rbxassetid://10895055618"] = "2",
    ["rbxassetid://10895060290"] = "3",
    ["rbxassetid://10895066920"] = "4",

    -- Dual Caestus
    ["rbxassetid://11752190345"] = "1",
    ["rbxassetid://11752197951"] = "2",
    ["rbxassetid://11752204771"] = "3",
    ["rbxassetid://11752212272"] = "4",

    -- Dual Kanabo
    ["rbxassetid://10894691030"] = "1",
    ["rbxassetid://10894698435"] = "2",
    ["rbxassetid://10894703742"] = "3",
    ["rbxassetid://10894707648"] = "4",
}

local L_Player = Players.LocalPlayer
local Holding = false

-- Functions
local function DistanceCheck(Target)
    if Target:FindFirstChild("HumanoidRootPart") then
        if L_Player:DistanceFromCharacter(Target.HumanoidRootPart.Position) < getgenv().Sliders.AutoParryDistance then
            return true
        end
    end
end

-- Main
function Runtime:Init()

    ACB:Init()
    UI:Init()

    getgenv().Connections.RenderStepped = Run.RenderStepped:Connect(function()
        if L_Player.Character:FindFirstChild("Humanoid") == false then
            return
        end
    
        -- Auto Parry
        if getgenv().Toggles.AutoParry == true then
            for _, Player in pairs(Players:GetPlayers()) do
    
                if Player ~= L_Player and L_Player.Character:FindFirstChildOfClass("Tool") and L_Player.Character:FindFirstChildOfClass("Tool").Blocking.Value == false and Player.Character:FindFirstChild("Humanoid") then
        
                    -- Locals
                    local Character = Player.Character
        
                    -- Main
                    for _, Anim in pairs(Character.Humanoid.Animator:GetPlayingAnimationTracks()) do
                        if getgenv().AnimationIds[Anim.Animation.AnimationId] and DistanceCheck(Character) then
                            if Holding == false then
                                Holding = true
                                mouse2press()
                                task.spawn(function()
                                    task.wait(L_Player.Character:FindFirstChildOfClass("Tool").PerfectBlockWindow.Value)
                                    mouse2release()
                                    Holding = false
                                end)
                            end
                        end
                    end
        
                end
            end
        end
    
        -- -- Full Brightness
        -- if getgenv().Toggles.FullBright == true then
        --     Lighting.Brightness = getgenv().Sliders.Brightness
        -- else
        --     Lighting.Brightness = 3.25
        -- end
    
        -- -- No Fog
        if getgenv().Toggles.NoFog == true then
            Lighting.Atmosphere.Density = 0
        else
            Lighting.Atmosphere.Density = 0.35
        end
    
        -- -- No Blur
        if getgenv().Toggles.NoBlur == true then
            Lighting.DepthOfField.Enabled = false
        else
            Lighting.DepthOfField.Enabled = true
        end
    
    end)

end

-- Return
return Runtime