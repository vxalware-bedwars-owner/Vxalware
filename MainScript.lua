local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

local Window = WindUI:CreateWindow({
    Title = "Vxalware Rewrite",
    Icon = "moon-star",
    Author = "Update 3.2.8 Beta",
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

-- ConfigManager API
local ConfigManager = Window.ConfigManager
local VXConfig = ConfigManager:CreateConfig("VXConfig")

-- runWithNotify API
local _runWithNotify_firstRun = {}
local function runWithNotify(title, fn, opts)
    -- API Directions:
    -- kind = "dropdown" | "toggle" | nil
    -- getLabel = function() -> string  (for dropdowns)
    -- getState = function() -> boolean (for toggles)
    -- suppressNone = true|false (for dropdowns)
    opts = opts or {}
    local kind = opts.kind
    local getLabel = opts.getLabel
    local getState = opts.getState
    local suppressNone = opts.suppressNone

    -- Silent run | Error run
    if not _runWithNotify_firstRun[title] then
        _runWithNotify_firstRun[title] = true

        if kind == "dropdown" or kind == "toggle" then
            local ok, err = pcall(fn)
            if not ok then
                WindUI:Notify({
                    Title = "Error",
                    Content = "Failed to run "..tostring(title).."\n"..tostring(err),
                    Duration = 5,
                    Icon = "x",
                })
            end
            return
        end
    end

    -- Normal run | Error run
    local ok, err = pcall(fn)
    if not ok then
        WindUI:Notify({
            Title = "Error",
            Content = "Failed to run "..tostring(title).."\n"..tostring(err),
            Duration = 5,
            Icon = "x",
        })
        return
    end

    -- Success run | Dropdown
    if kind == "dropdown" and type(getLabel) == "function" then
        local label = getLabel()
        if suppressNone and tostring(label) == "None" then
            return
        end
        WindUI:Notify({
            Title = "Success",
            Content = "Successfully executed "..tostring(label),
            Duration = 1.5,
        })
        return
    end

    -- Success run | Toggle
    if kind == "toggle" and type(getState) == "function" then
        local state = getState()
        if state then
            WindUI:Notify({
                Title = "Success",
                Content = "Successfully executed "..tostring(title),
                Duration = 1.5,
            })
        else
            WindUI:Notify({
                Title = "Success",
                Content = "Successfully unexecuted "..tostring(title),
                Duration = 1.5,
            })
        end
        return
    end

    -- Success run | Universal
    WindUI:Notify({
        Title = "Success",
        Content = "Successfully ran "..tostring(title),
        Duration = 1.5,
    })
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
        end, {
            kind = "dropdown",
            getLabel = function() return option end,
            suppressNone = true,
        })
    end
})
VXConfig:Register("AnimDpdwn", DropdownElement)

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
local Toggle = OthersTab:Toggle({
    Title = "Fov Changer",
    Type = "Toggle",
    Default = false,
    Callback = function(state)
        runWithNotify("Fov Changer", function()
            if state then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/vxalware-bedwars-owner/Vxalware/refs/heads/main/assets/API/FOV%20Changer/Injector.lua", true))()
            else
                loadstring(game:HttpGet("https://raw.githubusercontent.com/vxalware-bedwars-owner/Vxalware/refs/heads/main/assets/API/FOV%20Changer/Uninjector.lua", true))()
            end
        end, {
            kind = "toggle",
            getState = function() return state end,
        })
    end
})
VXConfig:Register("fovtggle", ToggleElement)

local Dropdown = OthersTab:Dropdown({
    Title = "Sword Texture",
    Values = { "None", "Fury", "Makima", "Marin", "Onyx", "PastaaWare", "Random", "VioletDreams", "Wichtiger" },
    Value = "Onyx",
    Callback = function(option)
        runWithNotify("Sword Texture", function()
            if option == "None" then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/vxalware-bedwars-owner/Vxalware/refs/heads/main/assets/API/Sword%20Texture/Uninjector.lua",true))()
            elseif option == "Fury" then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/vxalware-bedwars-owner/Vxalware/refs/heads/main/assets/API/Sword%20Texture/Fury.lua",true))()
            elseif option == "Makima" then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/vxalware-bedwars-owner/Vxalware/refs/heads/main/assets/API/Sword%20Texture/Makima.lua",true))()
            elseif option == "Marin" then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/vxalware-bedwars-owner/Vxalware/refs/heads/main/assets/API/Sword%20Texture/Marin.lua",true))()
            elseif option == "Onyx" then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/vxalware-bedwars-owner/Vxalware/refs/heads/main/assets/API/Sword%20Texture/Onyx.lua",true))()
            elseif option == "PastaaWare" then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/vxalware-bedwars-owner/Vxalware/refs/heads/main/assets/API/Sword%20Texture/PastaaWare.lua",true))()
            elseif option == "Random" then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/vxalware-bedwars-owner/Vxalware/refs/heads/main/assets/API/Sword%20Texture/Random.lua",true))()
            elseif option == "VioletDreams" then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/vxalware-bedwars-owner/Vxalware/refs/heads/main/assets/API/Sword%20Texture/VioletDreams.lua",true))()
            elseif option == "Wichtiger" then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/vxalware-bedwars-owner/Vxalware/refs/heads/main/assets/API/Sword%20Texture/Wichtiger.lua",true))()
            end
        end, {
            kind = "dropdown",
            getLabel = function() return option end,
            suppressNone = true,
        })
    end
})
VXConfig:Register("txtdrpdwn", DropdownElement)

local Dropdown = OthersTab:Dropdown({
    Title = "Dark Atmosphere",
    Values = { "None", "Blue", "Green", "Orange", "Pink", "Purple", "Red", "Yellow" },
    Value = "None",
    Callback = function(option)
        runWithNotify("Dark Atmosphere", function()
            if option == "None" then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/vxalware-bedwars-owner/Vxalware/refs/heads/main/assets/API/Atmosphere/Uninjector.lua",true))()
            elseif option == "Blue" then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/vxalware-bedwars-owner/Vxalware/refs/heads/main/assets/API/Atmosphere/Blue.lua",true))()
            elseif option == "Green" then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/vxalware-bedwars-owner/Vxalware/refs/heads/main/assets/API/Atmosphere/Green.lua",true))()
            elseif option == "Orange" then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/vxalware-bedwars-owner/Vxalware/refs/heads/main/assets/API/Atmosphere/Orange.lua",true))()
            elseif option == "Pink" then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/vxalware-bedwars-owner/Vxalware/refs/heads/main/assets/API/Atmosphere/Pink.lua",true))()
            elseif option == "Purple" then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/vxalware-bedwars-owner/Vxalware/refs/heads/main/assets/API/Atmosphere/Purple.lua",true))()
            elseif option == "Red" then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/vxalware-bedwars-owner/Vxalware/refs/heads/main/assets/API/Atmosphere/Red.lua",true))()
            elseif option == "Yellow" then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/vxalware-bedwars-owner/Vxalware/refs/heads/main/assets/API/Atmosphere/Yellow.lua",true))()
            end
        end, {
            kind = "dropdown",
            getLabel = function() return option end,
            suppressNone = true,
        })
    end
})

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
