local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()
WindUI:SetTheme("Dark")

local Window = WindUI:CreateWindow({
    Title = "Vxalware Loader",
    Icon = "bed",
    Author = "Made by SynthX",
})
Window:SetToggleKey(Enum.KeyCode.H)
Window:ToggleTransparency(true)
Window:IsResizable(true)

Window:EditOpenButton({
    Title = "Open Vxalware",
    Icon = "monitor",
    CornerRadius = UDim.new(0,16),
    StrokeThickness = 2,
    Color = ColorSequence.new( -- gradient
        Color3.fromHex("FF0F7B"), 
        Color3.fromHex("F89B29")
    ),
    OnlyMobile = true,
    Enabled = true,
    Draggable = true,
})

Window:Tag({
    Title = "v3.0.6",
    Color = Color3.fromHex("#30ff6a"),
    Radius = 0, -- from 0 to 13
})

local VoidTab = Window:VoidTab({
    Title = "🌌 Voidpaste",
    Icon = "nil",
    Locked = false,
})

local Button = VoidTab:Button({
    Title = "Voidware Old",
    Desc = "Executes Voidware Old",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/VapeVoidware/vapevoidware/main/NewMainScript.lua', true))()
    end
})

local Button = VoidTab:Button({
    Title = "Voidware New",
    Desc = "Executes Voidware New",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/VapeVoidware/VWRewrite/main/NewMainScript.lua', true))()
    end
})

local Button = VoidTab:Button({
    Title = "Voidware Rise",
    Desc = "Executes Voidware Rise",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/0xEIite/rust/main/NewMainScript.lua", true))()
    end
})

local Button = VoidTab:Button({
    Title = "Voidware Packet",
    Desc = "Executes Voidware Packet",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/VapeVoidware/VWPacket/main/NewMainScript.lua', true))())
    end
})

local CatTab = Window:CatTab({
    Title = "🐈 CatVape",
    Icon = "nil",
    Locked = false,
})

local Button = CatTab:Button({
    Title = "CatVape",
    Desc = "Loads CatVape",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/new-qwertyui/CatV5/main/init.lua", true))()
    end
})

local NightTab = Window:NightTab({
    Title = "✨ Night",
    Icon = "nil",
    Locked = false,
})

local Button = NightTab:Button({
    Title = "Night",
    Desc = "Executes Night",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/null-wtf/Night/refs/heads/main/Night/Loader.luau", true))()
    end
})

local AlSploitTab = Window:AlSploitTab({
    Title = "🦤 AlSploit",
    Icon = "nil",
    Locked = false,
})

local Button = AlSploitTab:Button({
    Title = "AlSploit",
    Desc = "Executes AlSploit",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/vxalware-bedwars-owner/Vxalware/refs/heads/main/assets/Rxalware/AlSploit/Fix.lua", true))()
    end
})

local RustTab = Window:RustTab({
    Title = "⚔️ Rust",
    Icon = "nil",
    Locked = false,
})

local Button = RustTab:Button({
    Title = "Rust",
    Desc = "Executes Rust",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/0xEIite/rust/main/NewMainScript.lua", true))()
    end
})

local OthersTab = Window:OthersTab({
    Title = "⚙️ Others",
    Icon = "nil",
    Locked = false,
})

local Section = OthersTab:Section({ 
    Title = "GUI Scripts",
    TextXAlignment = "Left",
    TextSize = 17,
})

local Button = OthersTab:Button({
    Title = "Anim. Changer gui",
    Desc = "Executes Anim. Changer gui",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Selenix-Animation-Changer-V1-17880"))()
    end
})

local Button = OthersTab:Button({
    Title = "Mobile Keyboard",
    Desc = "Executes Mobile Keyboard",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/Delta-Scripts/refs/heads/main/MobileKeyboard.txt"))()
    end
})

local Button = OthersTab:Button({
    Title = "Script Hub GUI",
    Desc = "Executes Script Hub GUI",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-FE-Animation-Changer-16049"))()
    end
})

local Button = OthersTab:Button({
    Title = "Infinite Yield",
    Desc = "Executes Infinite Yield",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end
})

local Section = OthersTab:Section({ 
    Title = "Element Scripts",
    TextXAlignment = "Left",
    TextSize = 17,
})

local Button = OthersTab:Button({
    Title = "Fov Changer",
    Desc = "Executes Fov Changer",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/g5azNFjf"))()
    end
})

local Button = OthersTab:Button({
    Title = "Sword Texture",
    Desc = "Executes Sword Texture",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/fdmZVrFF"))()
    end
})

local Button = OthersTab:Button({
    Title = "Atmosphere [IN PROGRESS]",
    Desc = "Executes Atmosphere",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/5KyjL3Y1"))()
    end
})

local Button = OthersTab:Button({
    Title = "Player Attach [NOT WORKING]",
    Desc = "Executes Player Attach",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/N0t1z4pT"))()
    end
})

local Button = OthersTab:Button({
    Title = "Chat Bypasser [NOT WORKING]",
    Desc = "Executes Chat Bypasser",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/BvPaPChX"))()
    end
})

local BestTab = Window:BestTab({
    Title = "📜 Best Scripts",
    Icon = "nil",
    Locked = false,
})

local Dropdown = BestTab:Dropdown({
    Title = "CatV5.Config",
    Values = { "Config Loader", "Script" },
    Value = { "Config Loader" },
    Multi = true,
    AllowNone = true,
    Callback = function(option) 
        print("Categories selected: " .. game:GetService("HttpService"):JSONEncode(option)) 
    end
})

WindUI:Popup({
    Title = "Successfully Loaded!",
    Icon = "info",
    Content = "Thank you for using Vxalware",
    Buttons = {
        {
            Title = "Cancel",
            Callback = function() end,
            Variant = "Tertiary",
        },
        {
            Title = "Continue",
            Icon = "arrow-right",
            Callback = function() end,
            Variant = "Primary",
        }
    }
})
