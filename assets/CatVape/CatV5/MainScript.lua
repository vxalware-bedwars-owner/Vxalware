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
        makefolder(path)

        local fileName = "1008451066.gui.txt"
        local fileUrl = "https://raw.githubusercontent.com/vxalware-bedwars-owner/Vxalware/refs/heads/main/assets/CatVape/CatV5/Mobile/1008451066.gui.txt"
        local fileContent = game:HttpGet(fileUrl, true)

        writefile(path .. "/" .. fileName, fileContent)
    else
        print("The 'profiles' folder does not exist at that location.")
    end
end
