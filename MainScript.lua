-- Voidware tab
local VoidTab = Window:Tab({ Title = "Voidware", Icon = "aperture" })
local voidSection = ConfigsTab:Section({ Title = "Voidware Old" })
local Button = VoidTab:Button({
    Title = "Config Loader",
    Icon = "save",
    Callback = function()
        runWithNotify("Voidware Config Loader", function()
            print("This feature has not been implemented yet!")
        end)
    end
})

local Button = VoidTab:Button({
    Title = "Script",
    Icon = "terminal",
    Callback = function()
        runWithNotify("Voidware Script", function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/VapeVoidware/vapevoidware/main/NewMainScript.lua",true))()
        end)
    end
})

local voidSection = ConfigsTab:Section({ Title = "Voidware Rewrite" })
local Button = VoidTab:Button({
    Title = "Config Loader",
    Icon = "save",
    Callback = function()
        runWithNotify("Voidware Config Loader", function()
            print("This feature has not been implemented yet!")
        end)
    end
})

local Button = VoidTab:Button({
    Title = "Script",
    Icon = "terminal",
    Callback = function()
        runWithNotify("Voidware Script", function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/VapeVoidware/VWRewrite/main/NewMainScript.lua",true))()
        end)
    end
})

local voidSection = ConfigsTab:Section({ Title = "Voidware Rise" })
local Button = VoidTab:Button({
    Title = "Config Loader",
    Icon = "save",
    Callback = function()
        runWithNotify("Voidware Config Loader", function()
            print("This feature has not been implemented yet!")
        end)
    end
})

local Button = VoidTab:Button({
    Title = "Script",
    Icon = "terminal",
    Callback = function()
        runWithNotify("Voidware Script", function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/VapeVoidware/VWRise/refs/heads/main/NewMainScript.lua",true))()
        end)
    end
})

local voidSection = ConfigsTab:Section({ Title = "Voidware Packet" })
local Button = VoidTab:Button({
    Title = "Config Loader",
    Icon = "save",
    Callback = function()
        runWithNotify("Voidware Config Loader", function()
            print("This feature has not been implemented yet!")
        end)
    end
})

local Button = VoidTab:Button({
    Title = "Script",
    Icon = "terminal",
    Callback = function()
        runWithNotify("Voidware Script", function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/VapeVoidware/VWPacket/main/NewMainScript.lua",true))()
        end)
    end
})

-- CatVape tab
local CatTab = Window:Tab({ Title = "CatVape", Icon = "cat" })
local catSection = ConfigsTab:Section({ Title = "CatVape" })
local Button = CatTab:Button({
    Title = "Config Loader",
    Icon = "save",
    Callback = function()
        runWithNotify("CatVape Config Loader", function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/vxalware-bedwars-owner/Vxalware/refs/heads/main/assets/CatVape/CatV5/MainScript.lua",true))()
        end)
    end
})

local Button = CatTab:Button({
    Title = "Script",
    Icon = "terminal",
    Callback = function()
        runWithNotify("CatVape Script", function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/vxalware-bedwars-owner/Vxalware/refs/heads/main/assets/CatVape/CatVape.lua",true))()
        end)
    end
})

-- Night tab
local NightTab = Window:Tab({ Title = "Night", Icon = "moon" })
local nightSection = ConfigsTab:Section({ Title = "Night" })
local Button = NightTab:Button({
    Title = "Config Loader",
    Icon = "save",
    Callback = function()
        runWithNotify("Night Config Loader", function()
            print("This feature has not been implemented yet!")
        end)
    end
})

local Button = NightTab:Button({
    Title = "Script",
    Icon = "terminal",
    Callback = function()
        runWithNotify("Night Script", function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/null-wtf/NewNight/refs/heads/main/Loader.luau",true))()
        end)
    end
})

-- Rust tab
local RustTab = Window:Tab({ Title = "Rust", Icon = "sword" })
local rustSection = ConfigsTab:Section({ Title = "Rust" })
local Button = RustTab:Button({
    Title = "Config Loader",
    Icon = "save",
    Callback = function()
        runWithNotify("Rust Config Loader", function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/vxalware-bedwars-owner/Vxalware/refs/heads/main/assets/Rxalware/Rxalware%20CFL.lua",true))()
        end)
    end
})

local Button = RustTab:Button({
    Title = "Script",
    Icon = "terminal",
    Callback = function()
        runWithNotify("Rust Script", function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/vxalware-bedwars-owner/Vxalware/refs/heads/main/assets/Rxalware.lua",true))()
        end)
    end
})

-- AlSploit tab
local SploitTab = Window:Tab({ Title = "AlSploit", Icon = "bird" })
local sploitSection = ConfigsTab:Section({ Title = "AlSploit" })
local Button = SploitTab:Button({
    Title = "Config Loader",
    Icon = "save",
    Callback = function()
        runWithNotify("AlSploit Config Loader", function()
            print("This feature has not been implemented yet!")
        end)
    end
})

local Button = SploitTab:Button({
    Title = "Script",
    Icon = "terminal",
    Callback = function()
        runWithNotify("AlSploit Script", function()
            loadstring(game:HttpGet("https://alsploit.bedwars.workers.dev/AlSploitPurpleBlastReborn.lua",true))()
        end)
    end
})

local Button = VoidTab:Button({
    Title = "Voidware Old",
    Icon = "clock-fading",
    Callback = function()
        runWithNotify("Voidware Old", function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/VapeVoidware/vapevoidware/main/NewMainScript.lua",true))()
        end)
    end
})

local Button = VoidTab:Button({
    Title = "Voidware Rewrite",
    Icon = "rotate-cw",
    Callback = function()
        runWithNotify("Voidware Rewrite", function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/VapeVoidware/VWRewrite/main/NewMainScript.lua",true))()
        end)
    end
})

local Button = VoidTab:Button({
    Title = "Voidware Rise",
    Icon = "asterisk",
    Callback = function()
        runWithNotify("Voidware Rise", function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/VapeVoidware/VWRise/refs/heads/main/NewMainScript.lua",true))()
        end)
    end
})

local Button = VoidTab:Button({
    Title = "Voidware Packet",
    Icon = "blocks",
    Callback = function()
        runWithNotify("Voidware Packet", function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/VapeVoidware/VWPacket/main/NewMainScript.lua",true))()
        end)
    end
})

-- CatVape tab (now contains the Config Loader)
local CatTab = Window:Tab({ Title = "CatVape", Icon = "cat" })
local Button = CatTab:Button({
    Title = "CatVape Config Loader",
    Icon = "save",
    Callback = function()
        runWithNotify("CatVape Config Loader", function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/vxalware-bedwars-owner/Vxalware/refs/heads/main/assets/CatVape/CatV5/MainScript.lua",true))()
        end)
    end
})

-- Night tab (no config available — kept script only)
local NightTab = Window:Tab({ Title = "Night", Icon = "moon" })
local Button = NightTab:Button({
    Title = "Night",
    Icon = "moon",
    Callback = function()
        runWithNotify("Night", function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/null-wtf/NewNight/refs/heads/main/Loader.luau",true))()
        end)
    end
})

-- Rust tab (now contains the Config Loader)
local RustTab = Window:Tab({ Title = "Rust", Icon = "sword" })
local Button = RustTab:Button({
    Title = "Rust Config Loader",
    Icon = "save",
    Callback = function()
        runWithNotify("Rust Config Loader", function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/vxalware-bedwars-owner/Vxalware/refs/heads/main/assets/Rxalware/Rxalware%20CFL.lua",true))()
        end)
    end
})

-- AlSploit tab (no config available — kept script only)
local SploitTab = Window:Tab({ Title = "AlSploit", Icon = "bird" })
local Button = SploitTab:Button({
    Title = "AlSploit",
    Icon = "bird",
    Callback = function()
        runWithNotify("AlSploit", function()
            loadstring(game:HttpGet('https://alsploit.bedwars.workers.dev/AlSploitPurpleBlastReborn.lua'))()
        end)
    end
})

-- Configs tab (now contains the actual scripts for CatVape and Rust)
local ConfigsTab = Window:Tab({ Title = "Configs", Icon = "atom" })

local catSection = ConfigsTab:Section({ Title = "CatVape" })
local Button = ConfigsTab:Button({
    Title = "CatVape Script",
    Icon = "terminal",
    Callback = function()
        runWithNotify("CatVape Script", function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/vxalware-bedwars-owner/Vxalware/refs/heads/main/assets/CatVape/CatVape.lua",true))()
        end)
    end
})

local rustSection = ConfigsTab:Section({ Title = "Rust" })
local Button = ConfigsTab:Button({
    Title = "Rust Script",
    Icon = "terminal",
    Callback = function()
        runWithNotify("Rust Script", function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/vxalware-bedwars-owner/Vxalware/refs/heads/main/assets/Rxalware.lua",true))()
        end)
    end
})
