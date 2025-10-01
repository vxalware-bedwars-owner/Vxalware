local HttpService = game:GetService("HttpService")

-- Detect platform
local UserInputService = game:GetService("UserInputService")
local platform = UserInputService.TouchEnabled and "Mobile/Tablet" or "PC"

-- PC
if platform == "PC" then
    print("PC user")
    return
end

-- Mobile
local configName = "AlSploitConfiguration.json"
local configUrl = "https://raw.githubusercontent.com/vxalware-bedwars-owner/Vxalware/refs/heads/main/assets/Rxalware/AlSploit/AlSploitConfiguration.json"

-- File cleanup
if isfile(configName) then
    delfile(configName)
    print("Existing configuration file deleted:", configName)
end

-- write new config file
local success, response = pcall(function()
    return game:HttpGet(configUrl, true)
end)

if not success then
    warn("Failed to fetch configuration JSON:", response)
    return
end

-- validate JSON
local ok, decoded = pcall(function()
    return HttpService:JSONDecode(response)
end)

if not ok then
    warn("Fetched data is not valid JSON. Saving raw content anyway.")
end

-- Write file
writefile(configName, response)
print("Configuration file created:", configName)

task.wait(1.5)
loadstring(game:HttpGet("https://raw.githubusercontent.com/vxalware-bedwars-owner/Vxalware/refs/heads/main/assets/Rxalware/AlSploit/Fix.lua",true))()
