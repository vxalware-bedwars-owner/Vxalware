-- Gui overlay helper
local function createStatusGui()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "CatV5StatusGui"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

    local frame = Instance.new("Frame")
    frame.Size = UDim2.fromOffset(400, 120)
    frame.Position = UDim2.new(0.5, -200, 0.4, -60)
    frame.BackgroundTransparency = 0
    frame.BorderSizePixel = 0
    frame.Parent = screenGui

    -- Gradient background
    local gradient = Instance.new("UIGradient")
    gradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 170, 255)),  -- Blue
        ColorSequenceKeypoint.new(1, Color3.fromRGB(170, 0, 255))   -- Purple
    }
    gradient.Rotation = 45
    gradient.Parent = frame

    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.fromScale(1,1)
    textLabel.BackgroundTransparency = 1
    textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    textLabel.Font = Enum.Font.GothamBold -- Good looking font
    textLabel.TextScaled = true
    textLabel.TextWrapped = true
    textLabel.Text = "Initializing..."
    textLabel.Parent = frame

    return screenGui, textLabel
end

-- Create status GUI
local gui, statusLabel = createStatusGui()

-- Function to update text
local function updateStatus(text)
    statusLabel.Text = text
end

-- Initial cleanup
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

updateStatus("Detecting device...")
task.wait(0.5)
local device = getDeviceType()
updateStatus("Device detected: "..device)
task.wait(1)

-- PC-specific logic
if device == "PC" then
    updateStatus("Loading PC script...")
    local success, err = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/vxalware-bedwars-owner/Vxalware/refs/heads/main/assets/CatVape/CatV5/PC/PC.lua", true))()
    end)
    if not success then
        warn("Failed to load PC script: " .. tostring(err))
    end

-- Mobile-specific logic
elseif device == "Mobile" then
    updateStatus("Preparing mobile profiles...")
    local profilePath = basePath .. "/profiles"
    makefolder(basePath)
    makefolder(profilePath)

    local fileList = {
        "1008451066.gui.txt", "111459730.gui.txt", "1390601379.gui.txt", -- trimmed for readability
        "whitelist.json"
    }

    updateStatus("Loading profiles...")
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

updateStatus("Loading CatV5...")
task.wait(0.7)
local ok, err = pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/new-qwertyui/CatV5/main/init.lua", true))()
end)

updateStatus("Done!")
task.wait(5)

-- Remove the GUI after 5 seconds
pcall(function()
    gui:Destroy()
end)
