loadstring(game:HttpGet('https://pastebin.com/raw/XTHUF65V'))()
loadstring(game:HttpGet('https://pastebin.com/raw/5KyjL3Y1'))() -- Atmosphere Script
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "🛏️Vxalware Bedwars🛏️",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Vxalware Extension",
   LoadingSubtitle = "Made by A Nerd",
   Theme = "DarkBlue", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = False,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Vxalware"
   },

   Discord = {
      Enabled = true, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "Gam32vXVCW", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Key System",
      Subtitle = "VX KYS",
      Note = "Get key from discord: discord.gg/Gam32vXVCW", -- Use this to tell the user how to get a key
      FileName = "Key_For_VX", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = true, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Vxalware On Top!"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

Rayfield:Notify({
   Title = "Thanks for using Vxalware!",
   Content = "Hope you enjoy using this script",
   Duration = 6.5,
   Image = nil,
})

local MainTab = Window:CreateTab("🛠️ Utilities", nil) -- Title, Image
local MainSection = MainTab:CreateSection("Animation Changer")

local Button = MainTab:CreateButton({
   Name = "Anim. Changer gui",
   Callback = function()

loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Selenix-Animation-Changer-V1-17880"))()
   end,
})

local Button = MainTab:CreateButton({
   Name = "Lagback detector [BETA]",
   Callback = function()

loadstring(game:HttpGet("https://pastebin.com/raw/F4VHZiMF"))()
   end,
})

local Button = MainTab:CreateButton({
   Name = "Mobile Keyboard",
   Callback = function()

loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/Delta-Scripts/refs/heads/main/MobileKeyboard.txt"))()
   end,
})

local MainTab = Window:CreateTab("🌏 Universal GUIs", nil) -- Title, Image
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

local MainTab = Window:CreateTab("⚔️ Other stuff", nil) -- Title, Image
local MainSection = MainTab:CreateSection("Other stuff")

local Button = MainTab:CreateButton({
   Name = "Sword Texture",
   Callback = function()

loadstring(game:HttpGet("https://pastebin.com/fdmZVrFF"))()
   end,
})

local Button = MainTab:CreateButton({
   Name = "Chat Bypasser [BETA]",
   Callback = function()

loadstring(game:HttpGet('https://pastebin.com/raw/BvPaPChX'))()
   end,
})
