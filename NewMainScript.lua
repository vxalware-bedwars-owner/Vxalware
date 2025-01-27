-- LocalScript (Client-side)

local player = game.Players.LocalPlayer  -- Get the local player

-- Manually create a list of usernames
local allowedUsernames = {
    "Roadto_BWRanked5",
    "User123",
    "CoolPlayer",
    "ExampleUsername"
}

-- Get the player's username
local username = player.Name

-- Check if the player's username is in the allowedUsernames table
local isOwner = false
for _, allowedUsername in ipairs(allowedUsernames) do
    if username == allowedUsername then
        isOwner = true
        break
    end
end

-- Print the result
if isOwner then
    loadstring(game:HttpGet('https://pastebin.com/raw/pMTdQRb5'))() -- Atmosphere Script
    getgenv().CAK = "CAK_KZ7DiDSB5-viNcjC-5AKdwKjP0EmqopL" -- This is your key, please dont send it to anybody
    loadstring(game:HttpGet("https://raw.githubusercontent.com/qwertyui-is-back/CatV5/main/init.lua"))() -- CatVape
    loadstring(game:HttpGet('https://pastebin.com/raw/08HHpB92'))() -- Vxalware Extension
    loadstring(game:HttpGet('https://gitlab.com/-/snippets/4774635/raw/main/BedwarsScript.lua'))() -- AlSploit
else
    loadstring(game:HttpGet('https://pastebin.com/raw/pMTdQRb5'))() -- Atmosphere Script
    loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua", true))() -- Vape
    loadstring(game:HttpGet('https://pastebin.com/raw/08HHpB92'))() -- Vxalware Extension
    loadstring(game:HttpGet('https://pastebin.com/raw/gZhGD17A'))() -- Old Alsploit
end
