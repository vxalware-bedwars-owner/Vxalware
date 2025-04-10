loadstring(game:HttpGet('https://pastebin.com/raw/5KyjL3Y1'))()
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "🛏️Vxalware Bedwars🛏️",
   Icon = 0,
   LoadingTitle = "Vxalware Extension",
   LoadingSubtitle = "Made by A Nerd",
   Theme = "DarkBlue",

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,

   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil,
      FileName = "Vxalware"
   },

   Discord = {
      Enabled = false,
      Invite = "Gam32vXVCW",
      RememberJoins = true
   },

   KeySystem = false,
   KeySettings = {
      Title = "Key System",
      Subtitle = "VX KYS",
      Note = "Get key from discord: discord.gg/Gam32vXVCW",
      FileName = "Key_For_VX",
      SaveKey = true,
      GrabKeyFromSite = true,
      Key = {"Vxalware On Top!"}
   }
})

Rayfield:Notify({
   Title = "Thanks for using Vxalware!",
   Content = "Hope you enjoy using this script",
   Duration = 6.5,
   Image = nil,
})

local MainTab = Window:CreateTab("🛠️ Utilities", nil)
local MainSection = MainTab:CreateSection("Animation Changer")

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

local MainTab = Window:CreateTab("🌏 Universal GUIs", nil)
local MainSection = MainTab:CreateSection("Universal GUIs")

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
   Name = "Night - No lagback fly :D",
   Callback = function()

loadstring(game:HttpGet("https://raw.githubusercontent.com/warprbx/NightRewrite/refs/heads/main/Night/Loader.luau"))()
   end,
})

local MainTab = Window:CreateTab("⚔️ Other stuff", nil)
local MainSection = MainTab:CreateSection("Other stuff")

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

local Button = MainTab:CreateButton({
   Name = "Best No Fall DMG script",
   Callback = function()

loadstring(game:HttpGet('https://pastebin.com/raw/uvBGvDXB'))()
   end,
})
