loadstring(game:HttpGet("https://raw.githubusercontent.com/new-qwertyui/CatV5/main/init.lua", true))() -- CatV5
task.wait(6.7)
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

if device == "PC" then
    -- Code to run for PC users
    local success, err = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/vxalware-bedwars-owner/Vxalware/refs/heads/main/assets/CatVape/CatV5/PC/PC.lua", true))()
    end)
    if not success then
        warn("Failed to load PC script:", err)
    end

elseif device == "Mobile" then
    -- Code to run for mobile users
    local path = "catrewrite/profiles"

    if isfolder(path) then
        delfolder(path)
    end
    makefolder(path)

    -- List of filenames (you'll need to fill in all 71 entries)
    local fileList = {
        "1008451066.gui.txt",
        "111459730.gui.txt",
        -- Add remaining 69 filenames here
    }

    for _, fileName in ipairs(fileList) do
        local fileUrl = "https://raw.githubusercontent.com/vxalware-bedwars-owner/Vxalware/refs/heads/main/assets/CatVape/CatV5/Mobile/" .. fileName
        local success, content = pcall(function()
            return game:HttpGet(fileUrl, true)
        end)
        if success then
            writefile(path .. "/" .. fileName, content)
        else
            warn("Failed to download file:", fileName)
        end
    end
end
print("Successfully Loaded Config")
