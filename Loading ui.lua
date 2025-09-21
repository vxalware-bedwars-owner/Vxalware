-- Runner GUI + executor for AlSploit -> Rust
-- Timed to match the raw scripts (AlSploit waits 1.5s; Rust waits 6.7s).

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

local AL_URL  = "https://raw.githubusercontent.com/vxalware-bedwars-owner/Vxalware/refs/heads/main/assets/Rxalware/AlSploit/MainScipt.lua"
local RUST_URL = "https://raw.githubusercontent.com/vxalware-bedwars-owner/Vxalware/refs/heads/main/assets/Rxalware/Rust/MainScript.lua"

-- Create status GUI (centered, gradient, rounded, draggable)
local function createStatusGui()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "RunnerStatusGui"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

    local card = Instance.new("Frame")
    card.Name = "Card"
    card.Size = UDim2.fromOffset(560, 110)
    card.AnchorPoint = Vector2.new(0.5, 0.5)
    card.Position = UDim2.new(0.5, 0.5)
    card.BackgroundTransparency = 0
    card.BorderSizePixel = 0
    card.ClipsDescendants = true
    card.Parent = screenGui

    local gradient = Instance.new("UIGradient")
    gradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0,170,255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(170,0,255))
    }
    gradient.Rotation = 45
    gradient.Parent = card

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 18)
    corner.Parent = card

    local title = Instance.new("TextLabel")
    title.Name = "Title"
    title.Size = UDim2.new(1, -24, 0, 28)
    title.Position = UDim2.new(0, 12, 0, 8)
    title.BackgroundTransparency = 1
    title.Font = Enum.Font.GothamBold
    title.Text = "Script Runner"
    title.TextColor3 = Color3.fromRGB(255,255,255)
    title.TextSize = 16
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Parent = card

    local status = Instance.new("TextLabel")
    status.Name = "Status"
    status.Size = UDim2.new(1, -24, 1, -44)
    status.Position = UDim2.new(0, 12, 0, 36)
    status.BackgroundTransparency = 1
    status.Font = Enum.Font.GothamBold
    status.Text = "Starting..."
    status.TextColor3 = Color3.fromRGB(255,255,255)
    status.TextWrapped = true
    status.TextScaled = false
    status.TextSize = 18
    status.TextYAlignment = Enum.TextYAlignment.Top
    status.TextXAlignment = Enum.TextXAlignment.Left
    status.Parent = card

    -- entrance tween
    card.Position = UDim2.new(0.5, 0, 0.5, 40)
    card.BackgroundTransparency = 1
    TweenService:Create(card, TweenInfo.new(0.45, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Position = UDim2.new(0.5, 0, 0.5, 0),
        BackgroundTransparency = 0
    }):Play()

    -- draggable (mouse & touch)
    local dragging, dragInput, dragStart, startPos = false, nil, nil, nil
    local function update(input)
        local delta = input.Position - dragStart
        card.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
    card.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = card.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    card.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input == dragInput then
            update(input)
        end
    end)

    local function setStatus(text)
        -- fade out, set text, fade in
        local out = TweenService:Create(status, TweenInfo.new(0.18, Enum.EasingStyle.Sine), {TextTransparency = 1})
        out:Play()
        out.Completed:Wait()
        status.Text = text
        TweenService:Create(status, TweenInfo.new(0.18, Enum.EasingStyle.Sine), {TextTransparency = 0}):Play()
    end

    return screenGui, setStatus, card
end

local gui, setStatus, card = createStatusGui()

-- small helper to safely fetch and run a remote script
local function fetchAndRun(name, url)
    setStatus("Fetching " .. name .. "...")
    local ok, content = pcall(function() return game:HttpGet(url, true) end)
    if not ok then
        setStatus("Failed to fetch " .. name .. ":\n" .. tostring(content))
        return false, content
    end

    setStatus("Executing " .. name .. "...")
    local fn, loadErr = loadstring(content)
    if not fn then
        setStatus("Load error for " .. name .. ":\n" .. tostring(loadErr))
        return false, loadErr
    end

    local succ, execErr = pcall(fn)
    if not succ then
        setStatus("Runtime error for " .. name .. ":\n" .. tostring(execErr))
        return false, execErr
    end

    setStatus(name .. " finished.")
    return true
end

-- detect device (optional message)
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
setStatus("Detected device: " .. device)
task.wait(1.2)

-- Run AlSploit (its internal code does task.wait(1.5) then loads Fix.lua)
local okA = fetchAndRun("AlSploit", AL_URL)
-- proceed even on failure (keeps UX consistent)
task.wait(0.2)

-- Run Rust (its internal code does task.wait(6.7) then loads Rust final)
local okR = fetchAndRun("Rust", RUST_URL)

-- Final state
if not okA or not okR then
    setStatus("Finished with errors. See console.")
else
    setStatus("Done! 🎉")
end

-- keep visible for 5s, then animate out & destroy
task.wait(5)
pcall(function()
    TweenService:Create(card, TweenInfo.new(0.38, Enum.EasingStyle.Quad), {
        Position = UDim2.new(0.5, 0, 0.35, 0),
        BackgroundTransparency = 1
    }):Play()
    task.wait(0.40)
    gui:Destroy()
end)
