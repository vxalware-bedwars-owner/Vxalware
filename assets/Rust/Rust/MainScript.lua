--> Delete file <--
local basePath = "rust"
if isfolder(basePath) then
    delfolder(basePath)
end

--> Load instances <--
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

--> Create GUI <--
local function createStatusGui()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "Rust_sGUI"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0.5, 0, 0.15, 0)
    frame.Position = UDim2.new(0.5, 0, 0.5, 0)
    frame.AnchorPoint = Vector2.new(0.5, 0.5)
    frame.BackgroundTransparency = 0
    frame.BorderSizePixel = 0
    frame.ClipsDescendants = true
    frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
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

    --> Draggability <--
    local dragging, dragInput, dragStart, startPos = false, nil, nil, nil
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

--> Detect device <--
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

-- PC
if device == "PC" then
    updateStatus("Loading profiles...")
    local success, err = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/vxalware-bedwars-owner/Vxalware/refs/heads/main/assets/Rust/Rust/PC/PC.lua",true))()
    end)
    if not success then
        updateStatus("Failed to load PC script:\n" .. tostring(err))
    end

-- Mobile
elseif device == "Mobile" then
    local profilePath = basePath .. "/profiles"
    makefolder(basePath)
    makefolder(profilePath)

    local fileList = {
        "2619619496.gui.txt", "6016588693.gui.txt",
        "commit.txt", "default6872265039.txt",
        "default6872274481.txt", "gui.txt"
    }

    updateStatus("Loading profiles...")
    for _, fileName in ipairs(fileList) do
        local fileUrl = "https://raw.githubusercontent.com/vxalware-bedwars-owner/Vxalware/refs/heads/main/assets/Rust/Rust/Mobile/" .. fileName
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

updateStatus("Loading Rust...")
task.wait(1.2)

local success, err = pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/vxalware-bedwars-owner/Vxalware/refs/heads/main/assets/Rust/Rust.lua",true))()
end)
if not success then
    updateStatus("Failed to load Rust:\n" .. tostring(err))
else
    updateStatus("Done! 🎉")
end

task.wait(5)
statusGui:Destroy()
