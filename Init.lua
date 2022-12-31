-- @author xGamerman626

--[[
MMM"""AMV           
M'   AMV            
'   AMV    ,pW"Wq.  
   AMV    6W'   `Wb 
  AMV   , 8M     M8 
 AMV   ,M YA.   ,A9 
AMVmmmmMM  `Ybmd9'  

Tested Executors :
• Synapse

Features Coming Soon :
• Nil                                  
]]

-- Functions
local function Import_Files()
    -- Check for folder.
    if isfolder("xGamer626Zo") then
        -- If there is a folder then remove it to update it to current version.
        delfolder("xGamer626Zo")
        Import_Files()
        return
    end

    -- Make the folders.
    makefolder("xGamer626Zo")
    makefolder("xGamer626Zo/Libraries")
    makefolder("xGamer626Zo/Source")

    -- Make the files.
    writefile("xGamer626Zo/Libraries/ACB.lua", game:HttpGetAsync("https://raw.githubusercontent.com/xgamerman626/ZO/main/Libraries/ACB.lua"))
    writefile("xGamer626Zo/Libraries/UI.lua", game:HttpGetAsync("https://raw.githubusercontent.com/xgamerman626/ZO/main/Libraries/UI.lua"))
    writefile("xGamer626Zo/Source/Runtime.lua", game:HttpGetAsync("https://raw.githubusercontent.com/xgamerman626/ZO/main/Source/Runtime.lua"))
end

local function Init()
    Import_Files()

    repeat
        task.wait()
    until isfile("xGamer626Zo/Source/Runtime.lua")

    local Runtime = loadstring(readfile("xGamer626Zo/Source/Runtime.lua"))()
    Runtime:Init()
end

-- Main
Init()