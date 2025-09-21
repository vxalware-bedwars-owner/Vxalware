-- Initial cleanup: remove 'catrewrite' folder if it exists
local basePath = "catrewrite"
if isfolder(basePath) then
    delfolder(basePath)
end

-- Detect device type
local UserInputService = game:GetService("UserInputService")

local function getDeviceType()
    if UserInputService.TouchEnabled and not UserInputService.GamepadEnabled then
        return "Mobile"
    elseif UserInputService.KeyboardEnabled or UserInputService.MouseEnabled then
        return "PC"
    else
        return "Unknown"
    end
end

local device = getDeviceType()
print("The user's device is:", device)

-- PC-specific logic
if device == "PC" then
    local success, err = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/vxalware-bedwars-owner/Vxalware/refs/heads/main/assets/CatVape/CatV5/PC/PC.lua", true))()
    end)
    if not success then
        warn("Failed to load PC script: " .. tostring(err))
    end

-- Mobile-specific logic
elseif device == "Mobile" then
    local profilePath = basePath .. "/profiles"

    -- Ensure both folders are created
    makefolder(basePath)
    makefolder(profilePath)

    local fileList = {
        "1008451066.gui.txt", "111459730.gui.txt", "1390601379.gui.txt", "1430993116.gui.txt",
        "169302362.gui.txt", "2380077519.gui.txt", "2619619496.gui.txt", "3258873704.gui.txt",
        "372226183.gui.txt", "3808081382.gui.txt", "4124008017.gui.txt", "4348829796.gui.txt",
        "4777817887.gui.txt", "6035872082.gui.txt", "6079884123.gui.txt", "66654135.gui.txt",
        "6701277882.gui.txt", "7326934954.gui.txt", "7709344486.gui.txt", "7781392706.gui.txt",
        "7822444776.gui.txt", "80461030.gui.txt", "994732206.gui.txt", "billionaire client16008862571.txt",
        "billionaire client6872265039.txt", "billionaire client6872274481.txt", "billionaire v26872265039.txt",
        "billionaire v26872274481.txt", "cc17625359962.txt", "closet client6872265039.txt",
        "closet client6872274481.txt", "closet6872265039.txt", "closet6872274481.txt", "color.txt",
        "commit.txt", "default10449761463.txt", "default11630038968.txt", "default11979315221.txt",
        "default121864768012064.txt", "default12355337193.txt", "default124596094333302.txt",
        "default126509999114328.txt", "default13772394625.txt", "default137925884276740.txt",
        "default142823291.txt", "default168556275.txt", "default17625359962.txt", "default17750024818.txt",
        "default2788229376.txt", "default283721918.txt", "default443406476.txt", "default4442272183.txt",
        "default4483381587.txt", "default6872265039.txt", "default6872274481.txt", "default8768229691.txt",
        "default893973440.txt", "default95004353881831.txt", "default96342491571673.txt", "gui.txt",
        "hud.txt", "language.txt", "non.txt", "panic6872265039.txt", "panic6872274481.txt",
        "pistonaire nut6872265039.txt", "pistonaire nut6872274481.txt", "silent (only legit reach)6872265039.txt",
        "silent (only legit reach)6872274481.txt", "spotify.txt", "trillionaire config6872265039.txt",
        "trillionaire config6872274481.txt", "whitelist.json"
    }


    for _, fileName in ipairs(fileList) do
        local fileUrl = "https://raw.githubusercontent.com/vxalware-bedwars-owner/Vxalware/refs/heads/main/assets/CatVape/CatV5/Mobile/" .. fileName
        local success, content = pcall(function()
            return game:HttpGet(fileUrl, true)
        end)
        if success then
            writefile(profilePath .. "/" .. fileName, content)
        else
            warn("Failed to download file:", fileName)
        end
    end
end

print("Successfully Loaded Config")
task.wait(6.7)
loadstring(game:HttpGet("https://raw.githubusercontent.com/new-qwertyui/CatV5/main/init.lua", true))() -- Loads CatV5
