local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()

local Window = WindUI:CreateWindow({
    Title = "Vxalware Rewrite",
    Icon = "moon-star",
    Author = "Update 3.2.3",
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

local function makeButton(tab, title, icon, url)
    tab:Button({
        Title = title,
        Icon = icon,
        Callback = function()
            WindUI:Notify({
                Title = "Loading",
                Content = "Fetching: " .. title,
                Duration = 1.5,
            })
            local ok, err = pcall(function()
                loadstring(game:HttpGet(url, true))()
            end)
            if not ok then
                WindUI:Notify({
                    Title = "Error",
                    Content = "Failed to run "..title.."\n"..tostring(err),
                    Icon = "x",
                    Duration = 5
                })
            end
        end
    })
end

-- Voidpaste tab
local VoidTab = Window:Tab({ Title = "Voidpaste", Icon = "aperture" })
makeButton(VoidTab, "Voidware Old", "terminal", "https://raw.githubusercontent.com/VapeVoidware/vapevoidware/main/NewMainScript.lua")
makeButton(VoidTab, "Voidware Rewrite", "terminal", "https://raw.githubusercontent.com/VapeVoidware/VWRewrite/main/NewMainScript.lua")
makeButton(VoidTab, "Voidware Rise", "terminal", "https://raw.githubusercontent.com/0xEIite/rust/main/NewMainScript.lua")
makeButton(VoidTab, "Voidware Packet", "terminal", "https://raw.githubusercontent.com/VapeVoidware/VWPacket/main/NewMainScript.lua")

-- CatVape tab
local CatTab = Window:Tab({ Title = "CatVape", Icon = "cat" })
makeButton(CatTab, "CatVape", "terminal", "https://raw.githubusercontent.com/vxalware-bedwars-owner/Vxalware/refs/heads/main/assets/CatVape/CatVape.lua")

-- Night tab
local NightTab = Window:Tab({ Title = "Night", Icon = "moon" })
makeButton(NightTab, "Night", "terminal", "https://raw.githubusercontent.com/null-wtf/NewNight/refs/heads/main/Loader.luau")

-- Rust tab
local RustTab = Window:Tab({ Title = "Rust", Icon = "sword" })
makeButton(RustTab, "Rust", "terminal", "https://raw.githubusercontent.com/0xEIite/rust/main/NewMainScript.lua")

-- Configs tab
local ConfigsTab = Window:Tab({ Title = "Configs", Icon = "atom" })

local catSection = ConfigsTab:Section({ Title = "CatVape" })
makeButton(ConfigsTab, "CatVape Config Loader", "save", "https://raw.githubusercontent.com/vxalware-bedwars-owner/Vxalware/refs/heads/main/assets/CatVape/CatV5/MainScript.lua")
makeButton(ConfigsTab, "CatVape Script", "play", "https://raw.githubusercontent.com/vxalware-bedwars-owner/Vxalware/refs/heads/main/assets/CatVape/CatVape.lua")

local rustSection = ConfigsTab:Section({ Title = "Rust config" })
makeButton(ConfigsTab, "Rxalware Config Loader", "save", "https://raw.githubusercontent.com/vxalware-bedwars-owner/Vxalware/refs/heads/main/assets/Rxalware/Rxalware%20CFL.lua")
makeButton(ConfigsTab, "Rxalware Script", "play", "https://raw.githubusercontent.com/vxalware-bedwars-owner/Vxalware/refs/heads/main/assets/Rxalware.lua")
Window:Divider() -- Divider
-- Others tab
local OthersTab = Window:Tab({ Title = "Others", Icon = "settings" })

local guiSection = OthersTab:Section({ Title = "GUI Scripts" })
makeButton(OthersTab, "Gazer Anim. Changer", "terminal", "https://raw.githubusercontent.com/Gazer-Ha/Animated/main/G") -- dropdown
makeButton(OthersTab, "Mobile Keyboard", "terminal", "https://raw.githubusercontent.com/AZYsGithub/Delta-Scripts/refs/heads/main/MobileKeyboard.txt")
makeButton(OthersTab, "Script Hub GUI", "terminal", "https://rawscripts.net/raw/Universal-Script-FE-Animation-Changer-16049")
makeButton(OthersTab, "Infinite Yield", "terminal", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source")

local elementSection = OthersTab:Section({ Title = "Element Scripts" })
makeButton(OthersTab, "Fov Changer", "terminal", "https://pastebin.com/raw/g5azNFjf") -- toggle
makeButton(OthersTab, "Sword Texture", "terminal", "https://pastebin.com/raw/fdmZVrFF") -- dropdown
makeButton(OthersTab, "Atmosphere [DARK]", "terminal", "https://pastebin.com/raw/5KyjL3Y1") -- dropdown
makeButton(OthersTab, "Sirius Menu", "terminal", "https://sirius.menu/sirius")

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
