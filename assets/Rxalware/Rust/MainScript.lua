-- Remove folder
local basePath = "rust"
if isfolder(basePath) then
    delfolder(basePath)
end

-- Detect device
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

-- Create base folder (idk why)
makefolder(basePath)

-- PC
if device == "PC" then
    local success, err = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/vxalware-bedwars-owner/Vxalware/refs/heads/main/assets/Rxalware/Rust/PC/PC.lua",true))()
    end)
    if not success then
        warn("Failed to load PC script: " .. tostring(err))
    end

-- Mobile
elseif device == "Mobile" then
    local profilePath = basePath .. "/profiles"
    makefolder(profilePath)

    local fileList = {
        "2619619496.gui.txt",
        "6016588693.gui.txt",
        "commit.txt",
        "default6872265039.txt",
        "default6872274481.txt",
        "gui.txt"
    }

    for _, fileName in ipairs(fileList) do
        local fileUrl = "https://raw.githubusercontent.com/vxalware-bedwars-owner/Vxalware/refs/heads/main/assets/Rxalware/Rust/Mobile/" .. fileName
        local success, content = pcall(function()
            return game:HttpGet(fileUrl, true)
        end)
        if success then
            writefile(profilePath .. "/" .. fileName, content)
        else
            warn("Failed to download file: " .. fileName)
        end
    end
end

print("Successfully Loaded Config")
task.wait(6.7)
loadstring(game:HttpGet("https://raw.githubusercontent.com/0xEIite/rust/main/NewMainScript.lua",true))()
