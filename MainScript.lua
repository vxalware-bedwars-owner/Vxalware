local Version = "1.6.61"
local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/download/" .. Version .. "/main.lua"))()

local Window = WindUI:CreateWindow({
    Title = "Vxalware CC",
    Icon = "moon-star",
    Author = "Update 3.3.5",
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
            local Players = game:GetService("Players")
            local player = Players.LocalPlayer
            if player then
                local username = player.Name
                local displayName = player.DisplayName
                print("Username: " .. username .. "\nDisplay Name: " .. displayName)
            end
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

-- WindUI VC API
local HttpService = game:GetService("HttpService")
local Version = "3.3.5"
local folderName = "Vxalware"
local versionFilePath = folderName .. "/version.json"
local windUIFolder = "WindUI"

local hasFileApi = (type(isfolder) == "function")
               and (type(makefolder) == "function")
               and (type(isfile) == "function")
               and (type(readfile) == "function")
               and (type(writefile) == "function")
               and (type(delfolder) == "function")

local function safeMakeFolder(name)
    if not hasFileApi then return false end
    return pcall(makefolder, name)
end

local function safeDelFolder(name)
    if not hasFileApi then return false end
    return pcall(delfolder, name)
end

local function writeVersionFile()
    if not hasFileApi then return false end
    local ok, err = pcall(function()
        if not isfolder(folderName) then
            makefolder(folderName)
        end
        writefile(versionFilePath, HttpService:JSONEncode({ version = tostring(Version) }))
    end)
    return ok
end

if not hasFileApi then
    print("[WindUI VC API] error 503: WindUI VC API Unreachable! Please create a support ticket in our discord server!")
else
    if not isfile(versionFilePath) then
        pcall(function()
            safeDelFolder(folderName)
            safeDelFolder(windUIFolder)
            safeMakeFolder(folderName)
            writeVersionFile()
        end)
        print("[WindUI VC API] Successfully implemented Version check!")
    else
        local ok, data = pcall(readfile, versionFilePath)
        local parsed = nil
        if ok and data then
            local succ, dec = pcall(HttpService.JSONDecode, HttpService, data)
            if succ and type(dec) == "table" then
                parsed = dec
            end
        end

        if not parsed or tostring(parsed.version) ~= tostring(Version) then
            pcall(function()
                safeDelFolder(folderName)
                safeDelFolder(windUIFolder)
                safeMakeFolder(folderName)
                writeVersionFile()
            end)
            print("[WindUI VC API] Successfully updated script to Version " .. Version)
        else
            print("[WindUI VC API] Script is running on the latest Version!")
        end
    end
end

-- safeWriteConfig API
local HttpService = game:GetService("HttpService")
local folderName = "Vxalware"
local configFilePath = folderName .. "/VXConfig.json"

local hasFileApi = (type(isfolder) == "function")
               and (type(makefolder) == "function")
               and (type(isfile) == "function")
               and (type(readfile) == "function")
               and (type(writefile) == "function")

local config = {
    dropdown = {},
    toggle = {},
    slider = {},
}

local function safeWriteConfig()
    if not hasFileApi then return false end
    local ok, err = pcall(function()
        writefile(configFilePath, HttpService:JSONEncode(config))
    end)
    return ok
end

local function loadConfig()
    if not hasFileApi then return end
    if not isfolder(folderName) then
        pcall(makefolder, folderName)
    end
    if isfile(configFilePath) then
        local ok, data = pcall(readfile, configFilePath)
        if ok and data then
            local succ, decoded = pcall(HttpService.JSONDecode, HttpService, data)
            if succ and type(decoded) == "table" then
                -- keep defaults
                config.dropdown = decoded.dropdown or config.dropdown
                config.toggle = decoded.toggle or config.toggle
                config.slider = decoded.slider or config.slider
            end
        end
    else
        safeWriteConfig()
    end
end
loadConfig()

if not hasFileApi then
    WindUI:Notify({
        Title = "Config Disabled",
        Content = "API Unreachable — config will not be saved.",
        Duration = 5,
        Icon = "x",
    })
end

-- runWithNotify API
local _APIFirstRun = {}
local _sliderNotifHandler = {}
local function runWithNotify(title, fn, opts)
    opts = opts or {}
    local kind = opts.kind
    local getLabel = opts.getLabel
    local getState = opts.getState
    local getValue = opts.getValue
    local suppressNone = opts.suppressNone

    -- Silent run | Error run
    if not _APIFirstRun[title] then
        _APIFirstRun[title] = true

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
                Content = "Successfully enabled "..tostring(title),
                Duration = 1.5,
            })
        else
            WindUI:Notify({
                Title = "Success",
                Content = "Successfully disabled "..tostring(title),
                Duration = 1.5,
            })
        end
        return
    end

    -- Success run | Slider
    if kind == "slider" and type(getValue) == "function" then
        if _sliderNotifHandler[title] then
            task.cancel(_sliderNotifHandler[title])
        end

        _sliderNotifHandler[title] = task.delay(0.25, function()
            local value = getValue()
            local valueStr = tostring(value)
            if type(value) == "number" then
                valueStr = tostring(tonumber(string.format("%.6f", value))):gsub("%.?0+$", "")
            end

            WindUI:Notify({
                Title = "Success",
                Content = tostring(title) .. " set to " .. valueStr,
                Duration = 1.5,
            })

            _sliderNotifHandler[title] = nil
        end)
        return
    end

    -- Success run | Universal
    WindUI:Notify({
        Title = "Success",
        Content = "Successfully ran "..tostring(title),
        Duration = 1.5,
    })
end

-- Voidware tab
local VoidTab = Window:Tab({ Title = "Voidware", Icon = "aperture" })
local voidSection = VoidTab:Section({ Title = "Voidware Old" })
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

local voidSection = VoidTab:Section({ Title = "Voidware Rewrite" })
local Button = VoidTab:Button({
    Title = "Config Loader",
    Icon = "save",
    Callback = function()
        runWithNotify("VW Rewrite Config Loader", function()
            print("This feature has not been implemented yet!")
        end)
    end
})

local Button = VoidTab:Button({
    Title = "Script",
    Icon = "terminal",
    Callback = function()
        runWithNotify("VW Rewrite Script", function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/VapeVoidware/VWRewrite/main/NewMainScript.lua",true))()
        end)
    end
})

local voidSection = VoidTab:Section({ Title = "Voidware Rise" })
local Button = VoidTab:Button({
    Title = "Config Loader",
    Icon = "save",
    Callback = function()
        runWithNotify("VW Rise Config Loader", function()
            print("This feature has not been implemented yet!")
        end)
    end
})

local Button = VoidTab:Button({
    Title = "Script",
    Icon = "terminal",
    Callback = function()
        runWithNotify("VW Rise Script", function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/VapeVoidware/VWRise/refs/heads/main/NewMainScript.lua",true))()
        end)
    end
})

local voidSection = VoidTab:Section({ Title = "Voidware Packet" })
local Button = VoidTab:Button({
    Title = "Config Loader",
    Icon = "save",
    Callback = function()
        runWithNotify("VW Packet Config Loader", function()
            print("This feature has not been implemented yet!")
        end)
    end
})

local Button = VoidTab:Button({
    Title = "Script",
    Icon = "terminal",
    Callback = function()
        runWithNotify("VW Packet Script", function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/VapeVoidware/VWPacket/main/NewMainScript.lua",true))()
        end)
    end
})

-- CatVape tab
local CatTab = Window:Tab({ Title = "CatVape", Icon = "cat" })
local catSection = CatTab:Section({ Title = "CatVape" })
local Button = CatTab:Button({
    Title = "Config Loader",
    Icon = "save",
    Callback = function()
        runWithNotify("CatVape Config Loader", function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/vxalware-bedwars-owner/Vxalware/refs/heads/main/assets/CatVape/CatVape/MainScript.lua",true))()
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
local nightSection = NightTab:Section({ Title = "Night" })
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
local rustSection = RustTab:Section({ Title = "Rust" })
local Button = RustTab:Button({
    Title = "Config Loader",
    Icon = "save",
    Callback = function()
        runWithNotify("Rust Config Loader", function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/vxalware-bedwars-owner/Vxalware/refs/heads/main/assets/Rust/Rust/MainScript.lua",true))()
        end)
    end
})

local Button = RustTab:Button({
    Title = "Script",
    Icon = "terminal",
    Callback = function()
        runWithNotify("Rust Script", function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/vxalware-bedwars-owner/Vxalware/refs/heads/main/assets/Rust/Rust.lua",true))()
        end)
    end
})

-- AlSploit tab
local SploitTab = Window:Tab({ Title = "AlSploit", Icon = "bird" })
local sploitSection = SploitTab:Section({ Title = "AlSploit" })
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

-- Scripts tab
local ScriptTab = Window:Tab({ Title = "Scripts", Icon = "atom" })
local scriptSection = ScriptTab:Section({ Title = "Voidware" })
local Button = ScriptTab:Button({
    Title = "Voidware Old",
    Icon = "aperture",
    Callback = function()
        runWithNotify("Voidware Old", function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/VapeVoidware/vapevoidware/main/NewMainScript.lua",true))()
        end)
    end
})

local Button = ScriptTab:Button({
    Title = "Voidware Rewrite",
    Icon = "rotate-cw",
    Callback = function()
        runWithNotify("Voidware Rewrite", function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/VapeVoidware/VWRewrite/main/NewMainScript.lua",true))()
        end)
    end
})

local Button = ScriptTab:Button({
    Title = "Voidware Rise",
    Icon = "asterisk",
    Callback = function()
        runWithNotify("Voidware Rise", function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/VapeVoidware/VWRise/refs/heads/main/NewMainScript.lua",true))()
        end)
    end
})

local Button = ScriptTab:Button({
    Title = "Voidware Packet",
    Icon = "blocks",
    Callback = function()
        runWithNotify("Voidware Packet", function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/VapeVoidware/VWPacket/main/NewMainScript.lua",true))()
        end)
    end
})

local scriptSection = ScriptTab:Section({ Title = "CatVape" })
local Button = ScriptTab:Button({
    Title = "CatVape",
    Icon = "cat",
    Callback = function()
        runWithNotify("CatVape", function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/vxalware-bedwars-owner/Vxalware/refs/heads/main/assets/CatVape/CatVape.lua",true))()
        end)
    end
})

local scriptSection = ScriptTab:Section({ Title = "Night" })
local Button = ScriptTab:Button({
    Title = "Night",
    Icon = "moon",
    Callback = function()
        runWithNotify("Night", function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/null-wtf/NewNight/refs/heads/main/Loader.luau",true))()
        end)
    end
})

local scriptSection = ScriptTab:Section({ Title = "Rust" })
local Button = ScriptTab:Button({
    Title = "Rust",
    Icon = "sword",
    Callback = function()
        runWithNotify("Rust", function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/vxalware-bedwars-owner/Vxalware/refs/heads/main/assets/Rust/Rust.lua",true))()
        end)
    end
})

local scriptSection = ScriptTab:Section({ Title = "AlSploit" })
local Button = ScriptTab:Button({
    Title = "AlSploit",
    Icon = "bird",
    Callback = function()
        runWithNotify("AlSploit", function()
            loadstring(game:HttpGet("https://alsploit.bedwars.workers.dev/AlSploitPurpleBlastReborn.lua",true))()
        end)
    end
})
Window:Divider() -- Divider
-- Others tab
local OthersTab = Window:Tab({ Title = "Others", Icon = "settings" })
local elementSection = OthersTab:Section({ Title = "Element Scripts" })
local Button = OthersTab:Button({
    Title = "CC Scripts",
    Callback = function()
        runWithNotify("CC Scripts", function()
            loadstring(game:HttpGet("https://pastebin.com/raw/TKNY3nTF",true))()
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

local custoSection = OthersTab:Section({ Title = "Customization" })
local FovSaved = config.slider["Fov Changer"] or 100
local MODULE = "VXAL_FOV_CHANGER"
task.delay(0.5, function()
    local camera = workspace.CurrentCamera
    if camera and FovSaved then
        pcall(function()
            camera.FieldOfView = FovSaved
        end)
    end
end)

print("[FOV Injector] Successfully hijacked FOV response")
local Slider = OthersTab:Slider({
    Title = "Fov Changer",
    Desc = "This element is in beta. Please expect bugs!",
    Step = 10,
    Value = {
        Min = 60,
        Max = 120,
        Default = FovSaved,
    },
    Callback = function(value)
        local state = getgenv()[MODULE]
        if not state then
            local cam = workspace.CurrentCamera
            state = {
                Running = true,
                DesiredFOV = value,
                OriginalFOV = cam and cam.FieldOfView or nil,
                Connections = {},
            }

            task.spawn(function()
                while state.Running do
                    local cam = workspace.CurrentCamera
                    if cam and state.OriginalFOV == nil then
                        state.OriginalFOV = cam.FieldOfView
                    end
                    if cam then
                        pcall(function()
                            cam.FieldOfView = state.DesiredFOV
                        end)
                    end
                    task.wait(0.1)
                end

                local cam = workspace.CurrentCamera
                if cam and state.OriginalFOV ~= nil then
                    pcall(function()
                        cam.FieldOfView = state.OriginalFOV
                    end)
                end
            end)

            local conn = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
                local cam = workspace.CurrentCamera
                if cam and state.Running then
                    pcall(function()
                        cam.FieldOfView = state.DesiredFOV
                    end)
                end
            end)

            table.insert(state.Connections, conn)
            getgenv()[MODULE] = state
        else
            state.DesiredFOV = value
        end

        local cam = workspace.CurrentCamera
        if cam then
            pcall(function()
                cam.FieldOfView = value
            end)
        end
        config.slider["Fov Changer"] = value
        safeWriteConfig()
    end
})

local AnimSaved = config.dropdown["Anim Changer"]
local Dropdown = OthersTab:Dropdown({
    Title = "Animation Changer",
    Values = { "None", "Gazer", "Selenix" },
    Value = AnimSaved or "None",
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
        config.dropdown["Anim Changer"] = option
        safeWriteConfig()
    end
})

local SwordSaved = config.dropdown["Sword Texture"]
local Dropdown = OthersTab:Dropdown({
    Title = "Sword Texture",
    Values = { "None", "Fury", "Makima", "Marin", "Onyx", "PastaaWare", "Random", "VioletDreams", "Wichtiger" },
    Value = SwordSaved or "None",
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
        config.dropdown["Sword Texture"] = option
        safeWriteConfig()
    end
})

local AtmosSaved = config.dropdown["Dark Atmosphere"]
local Dropdown = OthersTab:Dropdown({
    Title = "Dark Atmosphere",
    Values = { "None", "Blue", "Green", "Orange", "Pink", "Purple", "Red", "Yellow" },
    Value = AtmosSaved or "None",
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
        config.dropdown["Dark Atmosphere"] = option
        safeWriteConfig()
    end
})

-- Credits tab
local CreditsTab = Window:Tab({ Title = "Credits", Icon = "star" })
local Paragraph = CreditsTab:Paragraph({
    Title = "Wind UI",
    Desc = "This script is made by SynthX. All credits go to footagesus for making the UI Library",
})

local Paragraph = CreditsTab:Paragraph({
    Title = "Scripts",
    Desc = "All credits go to the various owners of the given scripts used in this script",
})

local Paragraph = CreditsTab:Paragraph({
    Title = "Keybind",
    Desc = "If you didn't read the message at the start of the script execution, press 'K' to toggle the GUI",
})

-- Notification
WindUI:Notify({
    Title = "Successfully Loaded!",
    Content = "Thank you for using Vxalware. Press 'K' to toggle GUI",
    Duration = 5,
    Icon = "check"
})
