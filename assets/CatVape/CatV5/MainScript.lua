loadstring(game:HttpGet("https://raw.githubusercontent.com/new-qwertyui/CatV5/main/init.lua", true))() -- CatV5
task.wait(5)
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

    -- File 1
    local file1Name = "1008451066.gui.txt"
    local file1Url = "https://raw.githubusercontent.com/vxalware-bedwars-owner/Vxalware/refs/heads/main/assets/CatVape/CatV5/Mobile/1008451066.gui.txt"
    local file1Content = game:HttpGet(file1Url, true)
    writefile(path .. "/" .. file1Name, file1Content)

    -- File 2
    local file2Name = "111459730.gui.txt"
    local file2Url = "https://raw.githubusercontent.com/vxalware-bedwars-owner/Vxalware/refs/heads/main/assets/CatVape/CatV5/Mobile/111459730.gui.txt"
    local file2Content = game:HttpGet(file2Url, true)
    writefile(path .. "/" .. file2Name, file2Content)
end
