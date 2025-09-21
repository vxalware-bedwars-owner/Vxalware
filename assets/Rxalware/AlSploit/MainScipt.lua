local HttpService = game:GetService("HttpService")

-- Detect platform
local UserInputService = game:GetService("UserInputService")
local platform = UserInputService.TouchEnabled and "Mobile/Tablet" or "PC"

if platform == "PC" then
    print("PC user")
    return -- Stop the script here for PC users
end

-- If not PC, continue with config loading
local configName = "AlSploitConfiguration.json"
local configUrl = "https://raw.githubusercontent.com/vxalware-bedwars-owner/Vxalware/refs/heads/main/assets/Rxalware/AlSploit/AlSploitConfiguration.json"

-- Check and delete the file if it exists
if isfile(configName) then
    delfile(configName)
    print("Existing configuration file deleted:", configName)
end

-- Fetch and write the new configuration file
local success, response = pcall(function()
    return game:HttpGet(configUrl, true)
end)

if not success then
    warn("Failed to fetch configuration JSON:", response)
    return
end

-- Optionally validate JSON
local ok, decoded = pcall(function()
    return HttpService:JSONDecode(response)
end)

if not ok then
    warn("Fetched data is not valid JSON. Saving raw content anyway.")
end

-- Write the file
writefile(configName, response)
print("Configuration file created:", configName)

task.wait(1.5)
loadstring(game:HttpGet("https://raw.githubusercontent.com/vxalware-bedwars-owner/Vxalware/refs/heads/main/assets/Rxalware/AlSploit/Fix.lua", true))() -- AlSploit Fix
