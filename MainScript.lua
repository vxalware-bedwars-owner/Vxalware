local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()

WindUI:SetTheme("Dark")
WindUI.TransparencyValue = 0.15

local Window = WindUI:CreateWindow({
    Title  = "Vxalware Rewrite",
    Icon   = "geist:window",
    Folder = "Vxalware",
    Size   = UDim2.fromOffset(640, 480),
    Theme  = "Dark",
})

Window:Tag({
    Title = "v3.0.7",
    Color = Color3.fromHex("#30ff6a"),
    Radius = 0,
})

Window:SetToggleKey(Enum.KeyCode.K)

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
makeButton(VoidTab, "Voidware Old", "terminal", "https://raw.githubusercontent.com/VapeVoidware/vapevoidware/main/NewMainScript.lua")
makeButton(VoidTab, "Voidware Rewrite", "terminal", "https://raw.githubusercontent.com/VapeVoidware/VWRewrite/main/NewMainScript.lua")
makeButton(VoidTab, "Voidware Rise", "terminal", "https://raw.githubusercontent.com/0xEIite/rust/main/NewMainScript.lua")
makeButton(VoidTab, "Voidware Packet", "terminal", "https://raw.githubusercontent.com/VapeVoidware/VWPacket/main/NewMainScript.lua")

-- CatVape tab
local CatTab = Window:Tab({ Title = "🐈 CatVape", Icon = "cat" })
makeButton(CatTab, "CatVape", "terminal", "https://raw.githubusercontent.com/new-qwertyui/CatV5/main/init.lua")

-- Night tab
local NightTab = Window:Tab({ Title = "✨ Night", Icon = "moon" })
makeButton(NightTab, "Night", "terminal", "https://raw.githubusercontent.com/null-wtf/Night/refs/heads/main/Night/Loader.luau")

-- AlSploit tab
local AlSploitTab = Window:Tab({ Title = "🦤 AlSploit", Icon = "shield" })
makeButton(AlSploitTab, "AlSploit", "terminal", "https://raw.githubusercontent.com/vxalware-bedwars-owner/Vxalware/refs/heads/main/assets/Rxalware/AlSploit/Fix.lua")

-- Rust tab
local RustTab = Window:Tab({ Title = "⚔️ Rust", Icon = "sword" })
makeButton(RustTab, "Rust", "terminal", "https://raw.githubusercontent.com/0xEIite/rust/main/NewMainScript.lua")

-- Others tab with sections
local OthersTab = Window:Tab({ Title = "⚙️ Others", Icon = "settings" })
local guiSection = OthersTab:Section({ Title = "GUI Scripts" })

makeButton(OthersTab, "Anim. Changer gui", "terminal", "https://rawscripts.net/raw/Universal-Script-Selenix-Animation-Changer-V1-17880")
makeButton(OthersTab, "Mobile Keyboard", "terminal", "https://raw.githubusercontent.com/AZYsGithub/Delta-Scripts/refs/heads/main/MobileKeyboard.txt")
makeButton(OthersTab, "Script Hub GUI", "terminal", "https://rawscripts.net/raw/Universal-Script-FE-Animation-Changer-16049")
makeButton(OthersTab, "Infinite Yield", "terminal", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source")

local elementSection = OthersTab:Section({ Title = "Element Scripts" })
makeButton(OthersTab, "Fov Changer", "terminal", "https://pastebin.com/raw/g5azNFjf")
makeButton(OthersTab, "Sword Texture", "terminal", "https://pastebin.com/raw/fdmZVrFF")
makeButton(OthersTab, "Atmosphere [IN PROGRESS]", "terminal", "https://pastebin.com/raw/5KyjL3Y1")
makeButton(OthersTab, "Player Attach [NOT WORKING]", "terminal", "https://pastebin.com/raw/N0t1z4pT")
makeButton(OthersTab, "Chat Bypasser [NOT WORKING]", "terminal", "https://pastebin.com/raw/BvPaPChX")

-- Best Scripts tab
local BestTab = Window:Tab({ Title = "📜 Best Scripts", Icon = "award" })
local catSection = BestTab:Section({ Title = "CatVxpe" })
makeButton(BestTab, "CatVxpe Config Loader", "save", "https://raw.githubusercontent.com/vxalware-bedwars-owner/Vxalware/refs/heads/main/assets/CatVape/CatV5/MainScript.lua")
makeButton(BestTab, "CatVxpe Script", "play", "https://raw.githubusercontent.com/new-qwertyui/CatV5/main/init.lua")

local rustSection = BestTab:Section({ Title = "Rust modified" })
makeButton(BestTab, "Rxalware Config Loader", "save", "https://raw.githubusercontent.com/vxalware-bedwars-owner/Vxalware/refs/heads/main/assets/Rxalware/AlSploit/MainScipt.lua")
makeButton(BestTab, "Rxalware Script", "play", "https://raw.githubusercontent.com/0xEIite/rust/main/NewMainScript.lua")

-- Notification
WindUI:Notify({
    Title = "Successfully Loaded!",
    Content = "Thank you for using Vxalware. Press 'K' to toggle GUI",
    Duration = 5,
    Icon = "check"
})
