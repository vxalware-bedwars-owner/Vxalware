-- Option A: load WindUI from remote (same pattern you used)
local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()

-- Option B: require WindUI from a ModuleScript in ReplicatedStorage
-- local WindUI = require(game:GetService("ReplicatedStorage"):WaitForChild("WindUI"))

WindUI:SetTheme("Dark")
WindUI.TransparencyValue = 0.15

local Window = WindUI:CreateWindow({
    Title  = "Vxalware Rewrite",
    Icon   = "geist:window",
    Folder = "Vxalware",
    Size   = UDim2.fromOffset(640, 480),
    Theme  = "Dark",
})

-- Helper to make loading buttons (keeps code tidy)
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
                    Duration = 4
                })
            end
        end
    })
end

-- Voidpaste tab
local VoidTab = Window:Tab({ Title = "🌌 Voidpaste", Icon = "star" })
makeButton(VoidTab, "Voidware Old", "clock", "https://raw.githubusercontent.com/VapeVoidware/vapevoidware/main/NewMainScript.lua")
makeButton(VoidTab, "Voidware Rewrite", "refresh-cw", "https://raw.githubusercontent.com/VapeVoidware/VWRewrite/main/NewMainScript.lua")
makeButton(VoidTab, "Voidware Rise", "zap", "https://raw.githubusercontent.com/0xEIite/rust/main/NewMainScript.lua")
makeButton(VoidTab, "Voidware Packet", "package", "https://raw.githubusercontent.com/VapeVoidware/VWPacket/main/NewMainScript.lua")

-- CatVape tab
local CatTab = Window:Tab({ Title = "🐈 CatVape", Icon = "cat" })
makeButton(CatTab, "CatVape", "paw", "https://raw.githubusercontent.com/new-qwertyui/CatV5/main/init.lua")

-- Night tab
local NightTab = Window:Tab({ Title = "✨ Night", Icon = "moon" })
makeButton(NightTab, "Night", "sun", "https://raw.githubusercontent.com/null-wtf/Night/refs/heads/main/Night/Loader.luau")

-- AlSploit tab
local AlSploitTab = Window:Tab({ Title = "🦤 AlSploit", Icon = "shield" })
makeButton(AlSploitTab, "AlSploit", "shield-check", "https://raw.githubusercontent.com/vxalware-bedwars-owner/Vxalware/refs/heads/main/assets/Rxalware/AlSploit/Fix.lua")

-- Rust tab
local RustTab = Window:Tab({ Title = "⚔️ Rust", Icon = "sword" })
makeButton(RustTab, "Rust", "sword", "https://raw.githubusercontent.com/0xEIite/rust/main/NewMainScript.lua")

-- Others tab with sections
local OthersTab = Window:Tab({ Title = "⚙️ Others", Icon = "settings" })
local guiSection = OthersTab:Section({ Title = "GUI Scripts" })

makeButton(OthersTab, "Anim. Changer gui", "sliders", "https://rawscripts.net/raw/Universal-Script-Selenix-Animation-Changer-V1-17880")
makeButton(OthersTab, "Mobile Keyboard", "smartphone", "https://raw.githubusercontent.com/AZYsGithub/Delta-Scripts/refs/heads/main/MobileKeyboard.txt")
makeButton(OthersTab, "Script Hub GUI", "grid", "https://rawscripts.net/raw/Universal-Script-FE-Animation-Changer-16049")
makeButton(OthersTab, "Infinite Yield", "terminal", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source")

local elementSection = OthersTab:Section({ Title = "Element Scripts" })
makeButton(OthersTab, "Fov Changer", "eye", "https://pastebin.com/raw/g5azNFjf")
makeButton(OthersTab, "Sword Texture", "image", "https://pastebin.com/raw/fdmZVrFF")
makeButton(OthersTab, "Atmosphere [IN PROGRESS]", "cloud", "https://pastebin.com/raw/5KyjL3Y1")
makeButton(OthersTab, "Player Attach [NOT WORKING]", "link", "https://pastebin.com/raw/N0t1z4pT")
makeButton(OthersTab, "Chat Bypasser [NOT WORKING]", "message-circle", "https://pastebin.com/raw/BvPaPChX")

-- Best Scripts tab
local BestTab = Window:Tab({ Title = "📜 Best Scripts", Icon = "award" })
local catSection = BestTab:Section({ Title = "CatVxpe" })
makeButton(BestTab, "CatVxpe Config Loader", "save", "https://raw.githubusercontent.com/vxalware-bedwars-owner/Vxalware/refs/heads/main/assets/CatVape/CatV5/MainScript.lua")
makeButton(BestTab, "CatVxpe Script", "play", "https://raw.githubusercontent.com/new-qwertyui/CatV5/main/init.lua")

local rustSection = BestTab:Section({ Title = "Rust modified" })
makeButton(BestTab, "Rxalware Config Loader", "save-2", "https://raw.githubusercontent.com/vxalware-bedwars-owner/Vxalware/refs/heads/main/assets/Rxalware/AlSploit/MainScipt.lua")
makeButton(BestTab, "Rxalware Script", "layers", "https://raw.githubusercontent.com/0xEIite/rust/main/NewMainScript.lua")

-- final loaded notification
WindUI:Notify({
    Title = "Successfully Loaded!",
    Content = "Thank you for using Vxalware",
    Duration = 5,
    Icon = "check"
})
