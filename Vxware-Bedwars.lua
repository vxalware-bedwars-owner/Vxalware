local Players = game:GetService("Players")
local player = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")

-- Function to create the GUI
local function createGui(text)
    local screenGui = Instance.new("ScreenGui")
    screenGui.Parent = player:WaitForChild("PlayerGui")
    screenGui.Name = "VxalwareGui"

    local frame = Instance.new("Frame")
    frame.Parent = screenGui
    frame.Size = UDim2.new(0.2, 0, 0.05, 0) -- Adjust size
    frame.Position = UDim2.new(0, 10, 1, -50) -- Bottom-left corner
    frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20) -- Dark mode
    frame.BorderSizePixel = 0
    frame.Visible = true

    local uiCorner = Instance.new("UICorner")
    uiCorner.CornerRadius = UDim.new(0.2, 0)
    uiCorner.Parent = frame

    local textLabel = Instance.new("TextLabel")
    textLabel.Parent = frame
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = text
    textLabel.TextColor3 = Color3.fromRGB(255, 255, 255) -- White text
    textLabel.Font = Enum.Font.GothamBold
    textLabel.TextSize = 14
    textLabel.TextScaled = true

    return screenGui
end

-- Show "Loading Vxalware..."
local loadingGui = createGui("Loading Vxalware...")
task.wait(1.9) -- Wait for 1.9 seconds
loadingGui:Destroy() -- Remove GUI

-- Start execution timer
local startTime = tick()

local UserInputService = game:GetService("UserInputService")

if UserInputService.TouchEnabled then
    -- Vxalware Rewrite (mobile)
    getgenv().CAK = "CAK_KZ7DiDSB5-viNcjC-5AKdwKjP0EmqopL"
    loadstring(game:HttpGet("https://raw.githubusercontent.com/qwertyui-is-back/CatV5/main/init.lua"))()

    loadstring(game:HttpGet("https://raw.githubusercontent.com/vxalware-bedwars-owner/Vxalware-Rewrite/refs/heads/main/Assets/Vxalware%20Extension.lua"))()
    loadstring(game:HttpGet("https://alsploit.bedwars.workers.dev/MainScript.lua?Key=yyy7eG1DjWIulkrfnzDrFP2No1H3si8YVODj93SqCd0jFh1CVk", true))()
else
    -- Vxalware Rewrite (PC)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/QP-Offcial/VapeV4ForRoblox/main/NewMainScript.lua", true))()

    loadstring(game:HttpGet("https://raw.githubusercontent.com/vxalware-bedwars-owner/Vxalware-Rewrite/refs/heads/main/Assets/Vxalware%20Extension.lua"))()
    loadstring(game:HttpGet("https://pastebin.com/raw/g5azNFjf",true))() -- Extra Modules
end

-- Calculate execution time
local endTime = tick()
local totalTime = math.floor(endTime - startTime) -- Calculate total time

-- Show "Finished loading Vxalware! Took: X seconds"
local finishedGui = createGui("Finished loading Vxalware! Took: " .. totalTime .. " seconds")
task.wait(2) -- Keep the final message visible for a bit
finishedGui:Destroy() -- Remove final GUI
