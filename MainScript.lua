--[[
local Dropdown = Tab:Dropdown({
    Title = "",
    Values = { "None", "", "" },
    Value = "None",
    Callback = function(option)
        runWithNotify("", function()
            if option == "None" then
                print("nil")
            elseif option == "" then
                -- your first option logic here
            elseif option == "" then
                -- your second option logic here
            end
        end)
    end
})
]]
local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()

local Window = WindUI:CreateWindow({
    Title = "Vxalware Rewrite",
    Icon = "moon-star",
    Author = "Update 3.2.4",
    Folder = "Vxalware",
    
    Size = UDim2.fromOffset(580, 460),
    MinSize = Vector2.new(560, 350),
    MaxSize = Vector2.new(850, 560),
    Transparent = false,
    Theme = "Dark",
    Resizable = true,
    SideBarWidth = 200,
    BackgroundImageTransparency = 0.42,
    HideSearchBar = true,
    ScrollBarEnabled = true,
    
    User = {
        Enabled = true,
        Anonymous = false,
        Callback = function()
            print("user check")
        end,
    },
})

Window:SetToggleKey(Enum.KeyCode.K)
Window:SetIconSize(26)
Window:EditOpenButton({
    Title = "Open Vxalware",
    Icon = "monitor",
    CornerRadius = UDim.new(0,16),
    StrokeThickness = 2,
    Color = ColorSequence.new(
        Color3.fromHex("FFFFFF"), 
        Color3.fromHex("FFFFFF")
    ),
    OnlyMobile = true,
    Enabled = true,
    Draggable = true,
})

-- runWithNotify helper
local function runWithNotify(title, fn)
    WindUI:Notify({
        Title = "Loading",
        Content = "Fetching: " .. tostring(title),
        Duration = 1.5,
    })

    -- pcall
    local ok, err = pcall(fn)

    if ok then
        WindUI:Notify({
            Title = "Success",
            Content = "Successfully ran "..tostring(title),
            Duration = 1.5,
        })
    else
        -- error notification
        WindUI:Notify({
            Title = "Error",
            Content = "Failed to run "..tostring(title).."\n"..tostring(err),
            Duration = 5,
            Icon = "x",
        })
    end
end

-- Voidpaste tab
local VoidTab = Window:Tab({ Title = "Voidpaste", Icon = "aperture" })
local Button = VoidTab:Button({
    Title = "Voidware Old",
    Callback = function()
        runWithNotify("Voidware Old", function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/VapeVoidware/vapevoidware/main/NewMainScript.lua",true))()
        end)
    end
})

local Button = VoidTab:Button({
    Title = "Voidware Rewrite",
    Callback = function()
        runWithNotify("Voidware Rewrite", function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/VapeVoidware/VWRewrite/main/NewMainScript.lua",true))()
        end)
    end
})

local Button = VoidTab:Button({
    Title = "Voidware Rise",
    Callback = function()
        runWithNotify("Voidware Rise", function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/0xEIite/rust/main/NewMainScript.lua",true))()
        end)
    end
})

local Button = VoidTab:Button({
    Title = "Voidware Packet",
    Callback = function()
        runWithNotify("Voidware Packet", function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/VapeVoidware/VWPacket/main/NewMainScript.lua",true))()
        end)
    end
})

-- CatVape tab
local CatTab = Window:Tab({ Title = "CatVape", Icon = "cat" })
local Button = CatTab:Button({
    Title = "CatVape",
    Callback = function()
        runWithNotify("CatVape", function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/vxalware-bedwars-owner/Vxalware/refs/heads/main/assets/CatVape/CatVape.lua",true))()
        end)
    end
})

-- Night tab
local NightTab = Window:Tab({ Title = "Night", Icon = "moon" })
local Button = NightTab:Button({
    Title = "Night",
    Callback = function()
        runWithNotify("Night", function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/null-wtf/NewNight/refs/heads/main/Loader.luau",true))()
        end)
    end
})

-- Rust tab
local RustTab = Window:Tab({ Title = "Rust", Icon = "sword" })
local Button = RustTab:Button({
    Title = "Rust",
    Callback = function()
        runWithNotify("Rust", function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/0xEIite/rust/main/NewMainScript.lua",true))()
        end)
    end
})

-- Configs tab
local ConfigsTab = Window:Tab({ Title = "Configs", Icon = "atom" })
local catSection = ConfigsTab:Section({ Title = "CatVape" })
local Button = ConfigsTab:Button({
    Title = "CatVape Config Loader",
    Callback = function()
        runWithNotify("CatVape Config Loader", function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/vxalware-bedwars-owner/Vxalware/refs/heads/main/assets/CatVape/CatV5/MainScript.lua",true))()
        end)
    end
})

local Button = ConfigsTab:Button({
    Title = "CatVape Script",
    Callback = function()
        runWithNotify("CatVape Script", function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/vxalware-bedwars-owner/Vxalware/refs/heads/main/assets/CatVape/CatVape.lua",true))()
        end)
    end
})

local rustSection = ConfigsTab:Section({ Title = "Rust config" })
local Button = ConfigsTab:Button({
    Title = "Rxalware Config Loader",
    Callback = function()
        runWithNotify("Rxalware Config Loader", function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/vxalware-bedwars-owner/Vxalware/refs/heads/main/assets/Rxalware/Rxalware%20CFL.lua",true))()
        end)
    end
})

local Button = ConfigsTab:Button({
    Title = "Rxalware Script",
    Callback = function()
        runWithNotify("Rxalware Script", function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/vxalware-bedwars-owner/Vxalware/refs/heads/main/assets/Rxalware.lua",true))()
        end)
    end
})
Window:Divider() -- Divider
-- Others tab
local OthersTab = Window:Tab({ Title = "Others", Icon = "settings" })
local guiSection = OthersTab:Section({ Title = "GUI Scripts" })
local Dropdown = OthersTab:Dropdown({
    Title = "Animation Changer",
    Values = { "None", "Gazer", "Selenix" },
    Value = "None",
    Callback = function(option)
        runWithNotify("Animation Changer", function()
            if option == "None" then
                print("nil")
            elseif option == "Gazer" then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/vxalware-bedwars-owner/Vxalware/refs/heads/main/assets/API/Animation%20Changer/Gazer.lua",true))()
            elseif option == "Selenix" then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/vxalware-bedwars-owner/Vxalware/refs/heads/main/assets/API/Animation%20Changer/Selenix.lua",true))()
            end
        end)
    end
})

local Button = OthersTab:Button({
    Title = "Mobile Keyboard",
    Callback = function()
        runWithNotify("Mobile Keyboard", function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/Delta-Scripts/refs/heads/main/MobileKeyboard.txt",true))()
        end)
    end
})

local Button = OthersTab:Button({
    Title = "Script Hub GUI",
    Callback = function()
        runWithNotify("Script Hub GUI", function()
            loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-FE-Animation-Changer-16049",true))()
        end)
    end
})

local Button = OthersTab:Button({
    Title = "Infinite Yield",
    Callback = function()
        runWithNotify("Infinite Yield", function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source",true))()
        end)
    end
})

local elementSection = OthersTab:Section({ Title = "Element Scripts" })
local Button = OthersTab:Button({
    Title = "Fov Changer",
    Callback = function()
        runWithNotify("Fov Changer", function()
            loadstring(game:HttpGet("https://pastebin.com/raw/g5azNFjf",true))()
        end)
    end
}) -- toggle

local Button = OthersTab:Button({
    Title = "Sword Texture",
    Callback = function()
        runWithNotify("Sword Texture", function()
            loadstring(game:HttpGet("https://pastebin.com/raw/fdmZVrFF",true))()
        end)
    end
}) -- dropdown

local Button = OthersTab:Button({
    Title = "Atmosphere [DARK]",
    Callback = function()
        runWithNotify("Atmosphere [DARK]", function()
            loadstring(game:HttpGet("https://pastebin.com/raw/5KyjL3Y1",true))()
        end)
    end
}) -- dropdown

local Button = OthersTab:Button({
    Title = "Sirius Menu",
    Callback = function()
        runWithNotify("Sirius Menu", function()
            loadstring(game:HttpGet("https://sirius.menu/sirius",true))()
        end)
    end
})

-- Credits tab
local CreditsTab = Window:Tab({ Title = "Credits", Icon = "star" })
local Paragraph = CreditsTab:Paragraph({
    Title = "Wind UI",
    Desc = "This script is made by SynthX. All credits go to footagesus for making the UI Library",
    Locked = false,
})

local Paragraph = CreditsTab:Paragraph({
    Title = "Scripts",
    Desc = "All credits go to the various owners of the given scripts used in this script",
    Locked = false,
})

local Paragraph = CreditsTab:Paragraph({
    Title = "Keybind",
    Desc = "If you didn't read the message at the start of the script execution, press 'K' to toggle the GUI",
    Locked = false,
})

-- Notification
WindUI:Notify({
    Title = "Successfully Loaded!",
    Content = "Thank you for using Vxalware. Press 'K' to toggle GUI",
    Duration = 5,
    Icon = "check"
})
