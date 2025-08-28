local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "🛏️Vxalware Rewrite🛏️",
   Icon = 0,
   LoadingTitle = "🛏️Vxalware Rewrite🛏️",
   LoadingSubtitle = "Made by Vxalware",
   ShowText = "Rayfield",
   Theme = "DarkBlue",

   ToggleUIKeybind = "K",

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,

   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil,
      FileName = "Vxalware"
   },

   Discord = {
      Enabled = false,
      Invite = "noinvitelink",
      RememberJoins = true
   },

   KeySystem = false,
   KeySettings = {
      Title = "Vxalware",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided",
      FileName = "VX_Key",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"7966922476"}
   }
})

local Tab = Window:CreateTab("Voidware", bed)

local Button = Tab:CreateButton({
   Name = "Voidware Old",
   Callback = function()
       loadstring(game:HttpGet('https://raw.githubusercontent.com/VapeVoidware/vapevoidware/main/NewMainScript.lua', true))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Voidware Rewrite",
   Callback = function()
       loadstring(game:HttpGet('https://raw.githubusercontent.com/VapeVoidware/VWRewrite/main/NewMainScript.lua', true))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Voidware Rise",
   Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/0xEIite/rust/main/NewMainScript.lua", true))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Voidware Packet",
   Callback = function()
       loadstring(game:HttpGet('https://raw.githubusercontent.com/VapeVoidware/VWPacket/main/NewMainScript.lua', true))()
   end,
})

local Tab = Window:CreateTab("CatVape", bed)

local Button = Tab:CreateButton({
   Name = "CatVape",
   Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/new-qwertyui/CatV5/main/init.lua", true))()
   end,
})

local Tab = Window:CreateTab("Night", bed)

local Button = Tab:CreateButton({
   Name = "Night",
   Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/null-wtf/Night/refs/heads/main/Night/Loader.luau", true))()
   end,
})

local Tab = Window:CreateTab("AlSploit", bed)

local Button = Tab:CreateButton({
   Name = "AlSploit",
   Callback = function()
       loadstring(game:HttpGet("https://r2.packetroblox.xyz/alsploit.lua", true))()
   end,
})

local Tab = Window:CreateTab("Rust", bed)

local Button = Tab:CreateButton({
   Name = "Rust",
   Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/0xEIite/rust/main/NewMainScript.lua", true))()
   end,
})

local Tab = Window:CreateTab("Others", settings)

local Button = MainTab:CreateButton({
   Name = "Anim. Changer gui",
   Callback = function()

loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Selenix-Animation-Changer-V1-17880"))()
   end,
})

local Button = MainTab:CreateButton({
   Name = "AntiHit Counter [BETA]",
   Callback = function()

loadstring(game:HttpGet("https://pastebin.com/raw/N0t1z4pT"))()
   end,
})

local Button = MainTab:CreateButton({
   Name = "Mobile Keyboard",
   Callback = function()

loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/Delta-Scripts/refs/heads/main/MobileKeyboard.txt"))()
   end,
})

local Button = MainTab:CreateButton({
   Name = "Script Hub GUI",
   Callback = function()

loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-FE-Animation-Changer-16049"))()
   end,
})

local Button = MainTab:CreateButton({
   Name = "Infinite Yield",
   Callback = function()

loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
   end,
})

local Button = MainTab:CreateButton({
   Name = "Sword Texture",
   Callback = function()

loadstring(game:HttpGet("https://pastebin.com/raw/fdmZVrFF"))()
   end,
})

local Button = MainTab:CreateButton({
   Name = "Chat Bypasser [BETA]",
   Callback = function()

loadstring(game:HttpGet('https://pastebin.com/raw/BvPaPChX'))()
   end,
})

Rayfield:Notify({
   Title = "Successfully Loaded!",
   Content = "Thank you for using Vxalware",
   Duration = 6.5,
   Image = thumbs-up,
})
