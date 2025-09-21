-- Initial cleanup: remove 'rust' folder and AlSploitConfiguration.json if they exist
if isfolder("rust") then
    delfolder("rust")
end
if isfile("AlSploitConfiguration.json") then
    delfile("AlSploitConfiguration.json")
end

-- Services
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Helper to create gradient GUI
local function createStatusGui()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "RxalwareStatusGui"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0.5, 0, 0.15, 0)
    frame.Position = UDim2.new(0.5, 0, 0.5, 0)
    frame.AnchorPoint = Vector2.new(0.5, 0.5)
    frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    frame.BorderSizePixel = 0
    frame.ClipsDescendants = true
    frame.Parent = screenGui

    local gradient = Instance.new("UIGradient")
    gradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 170, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(170, 0, 255))
    }
    gradient.Rotation = 45
    gradient.Parent = frame

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 18)
    corner.Parent = frame

    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, -20, 1, -20)
    textLabel.Position = UDim2.new(0, 10, 0, 10)
    textLabel.BackgroundTransparency = 1
    textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    textLabel.TextScaled = true
    textLabel.TextWrapped = true
    textLabel.Font = Enum.Font.GothamBold
    textLabel.TextStrokeTransparency = 0.7
    textLabel.Text = "Starting..."
    textLabel.Parent = frame

    local function updateText(newText)
        local tweenOut = TweenService:Create(textLabel, TweenInfo.new(0.25, Enum.EasingStyle.Sine), {TextTransparency = 1})
        tweenOut:Play()
        tweenOut.Completed:Wait()
        textLabel.Text = newText
        local tweenIn = TweenService:Create(textLabel, TweenInfo.new(0.25, Enum.EasingStyle.Sine), {TextTransparency = 0})
        tweenIn:Play()
    end

    -- Dragging
    local dragging, dragInput, dragStart, startPos = false
    local function update(input)
        local delta = input.Position - dragStart
        frame.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end

    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and input == dragInput then
            update(input)
        end
    end)

    return screenGui, updateText
end

local statusGui, updateStatus = createStatusGui()

-- Detect device type
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
updateStatus("Detected device: " .. device)
task.wait(1.2)

-- Load AlSploit
updateStatus("Loading Rxalware AlSploit...")
local success, err = pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/vxalware-bedwars-owner/Vxalware/refs/heads/main/assets/Rxalware/AlSploit/MainScipt.lua", true))()
end)
if not success then
    updateStatus("Failed to load AlSploit:\n" .. tostring(err))
end

-- Wait exactly 4.1 seconds before Rust load
task.wait(4.1)

-- Load Rust
updateStatus("Loading Rxalware Rust...")
local success2, err2 = pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/vxalware-bedwars-owner/Vxalware/refs/heads/main/assets/Rxalware/Rust/MainScript.lua", true))()
end)
if not success2 then
    updateStatus("Failed to load Rust:\n" .. tostring(err2))
else
    updateStatus("Done! 🎉")
end

-- Keep GUI for 5 seconds
task.wait(5)
statusGui:Destroy()
