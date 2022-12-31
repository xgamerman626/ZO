-- Services
local Players = game:GetService("Players")

-- Locals
local ACB = {}

local oldNamecall
local oldIndex

-- Main
function ACB:Init()

    oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
    
        local Method = getnamecallmethod()
        local Args = {...}
    
        if not checkcaller() and Method == "FireServer" and self.Name == "" then
            return
        end

        if not checkcaller() and Method == "FireServer" and self.Name == "14qowq2\226\128\139mZOZO" then
            -- JumpPower
            if Args[1] == "ZCXZCASCASCAWECASDCWASCAW" then
                return print("JumpPower Remote attempted to fire.")
            else
                return namecall(self, table.unpack(Args))
            end
    
            -- HBE
            if Args[1] == "ASDFASFILIKETOEXPANDMYHITBOXES" then
                return
            else
                return namecall(self, table.unpack(Args))
            end
    
            if Args[1] == "SAFCEADSCWEACS" then
                return print("HBE Remote attempted to fire.")
            else
                return namecall(self, table.unpack(Args))
            end
    
            -- WalkSpeed
            if Args[1] == "gEDSFGSEDF" then
                return
            else
                return namecall(self, table.unpack(Args))
            end
            
            if Args[2] == "ASDGFDcvEFACS" then
                return print("WalkSpeed Remote attempted to fire.")
            else
                return namecall(self, table.unpack(Args))
            end
    
            -- HPP
            if Args[1] == "HPP" then
                return print("HPP Remote attempted to fire.")
            else
                return namecall(self, table.unpack(Args))
            end
    
            -- PlatformStand
            if Args[1] == "LLLLNLLLPLTSFTGA" then
                return print("PlatformStand Remote attempted to fire.")
            else
                return namecall(self, table.unpack(Args))
            end
    
            -- Input
            if Args[1] == "yolo!!143tg5" then
                return print("Input Remote attempted to fire.")
            else
                return namecall(self, table.unpack(Args))
            end
    
            -- ??
            if Args[1] == "dsfersFEesfcesCSEDcseeFeS" then
                return print("?? Remote attempted to fire.")
            else
                return namecall(self, table.unpack(Args))
            end
        end
    
        return oldNamecall(self, ...)
    end)

    -- Credits to HamstaGang
    oldIndex = hookmetamethod(game, "__index", newcclosure(function(...)
    
        local self, k = ...
        
        if not checkcaller() and k == "ChildAdded" and self.Name == "game" then
            return
        elseif not checkcaller() and k == "Changed" and self.Name == "Humanoid" and self.Parent == Players.LocalPlayer.Character then
            return
        end
        
        return oldIndex(...)
    
    end))

end


-- Return
return ACB