local UserInputService = game:GetService("UserInputService")

-- Function to detect device type
local function detectDevice()
    if UserInputService.TouchEnabled then
        -- The player is on a mobile device
        loadstring(game:HttpGet('https://pastebin.com/raw/pMTdQRb5'))() -- Atmosphere Script

        -- COPY THE ENTIRE MESSAGE OR CATVAPE WILL NOT WORK FOR YOU.
        getgenv().CAK = "CAK_KZ7DiDSB5-viNcjC-5AKdwKjP0EmqopL" -- This is your key, please dont send it to anybody
        loadstring(game:HttpGet("https://raw.githubusercontent.com/qwertyui-is-back/CatV5/main/init.lua"))() -- CatVape

        loadstring(game:HttpGet('https://pastebin.com/raw/08HHpB92'))() -- Vxalware Extension
        loadstring(game:HttpGet('https://gitlab.com/-/snippets/4774635/raw/main/BedwarsScript.lua'))() -- AlSploit
    else
        -- The player is on a PC
        loadstring(game:HttpGet('https://pastebin.com/raw/pMTdQRb5'))() -- Atmosphere Script

        -- COPY THE ENTIRE MESSAGE OR CATVAPE WILL NOT WORK FOR YOU.
        getgenv().CAK = "CAK_KZ7DiDSB5-viNcjC-5AKdwKjP0EmqopL" -- This is your key, please dont send it to anybody
        loadstring(game:HttpGet("https://raw.githubusercontent.com/qwertyui-is-back/CatV5/main/init.lua"))() -- CatVape

        loadstring(game:HttpGet('https://pastebin.com/raw/08HHpB92'))() -- Vxalware Extension
        loadstring(game:HttpGet('https://pastebin.com/raw/gZhGD17A'))() -- Old AlSploit
    end
end

-- Run the detection when the script starts
detectDevice()
