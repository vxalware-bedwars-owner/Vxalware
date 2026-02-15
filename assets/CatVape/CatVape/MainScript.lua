--> Delete file <--
local basePath = "catrewrite"
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
    screenGui.Name = "CatVape_sGUI"
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
        loadstring(game:HttpGet("https://raw.githubusercontent.com/vxalware-bedwars-owner/Vxalware/refs/heads/main/assets/CatVape/CatVape/PC/PC.lua", true))()
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
		"0.gui.txt", "1008451066.gui.txt", "111459730.gui.txt",
		"1390601379.gui.txt", "1430993116.gui.txt", "169302362.gui.txt", "2380077519.gui.txt",
		"2619619496.gui.txt", "3258873704.gui.txt", "372226183.gui.txt", "3808081382.gui.txt",
		"4124008017.gui.txt", "4348829796.gui.txt", "4777817887.gui.txt", "6016588693.gui.txt",
		"6035872082.gui.txt", "6079884123.gui.txt", "66654135.gui.txt", "6701277882.gui.txt",
		"7326934954.gui.txt", "7709344486.gui.txt", "7781392706.gui.txt", "7822444776.gui.txt",
		"80461030.gui.txt", "8316902627.gui.txt", "994732206.gui.txt", "autowinn6872265039.txt",
		"autowinn6872274481.txt", "billionaire client16008862571.txt", "billionaire client6872265039.txt",
		"billionaire client6872274481.txt", "billionaire v26872265039.txt", "billionaire v26872274481.txt",
		"cc17625359962.txt", "closet client6872265039.txt", "closet client6872274481.txt",
		"closet16008862571.txt", "closet6872265039.txt", "closet6872274481.txt",
		"closet8444591321.txt", "color.txt", "commit.txt", "default0.txt",
		"default10449761463.txt", "default11630038968.txt", "default11979315221.txt",
		"default121864768012064.txt", "default12355337193.txt", "default124596094333302.txt",
		"default126509999114328.txt", "default127742093697776.txt", "default13772394625.txt",
		"default137925884276740.txt", "default142823291.txt", "default168556275.txt",
		"default17574618959.txt", "default17625359962.txt", "default17750024818.txt",
		"default2788229376.txt", "default283721918.txt", "default443406476.txt",
		"default4442272183.txt", "default4483381587.txt", "default6872265039.txt",
		"default6872274481.txt", "default8768229691.txt", "default893973440.txt",
		"default95004353881831.txt", "default96342491571673.txt", "gui.txt", "hud.txt",
		"language.txt", "non.txt", "panic v26872274481.txt", "panic6872265039.txt",
		"panic6872274481.txt", "pistonaire nut6872265039.txt", "pistonaire nut6872274481.txt",
		"pistonaire nut8444591321.txt", "silent (only legit reach)6872265039.txt",
		"silent (only legit reach)6872274481.txt", "spotify.txt", "trillionaire config6872265039.txt",
		"trillionaire config6872274481.txt", "whitelist.json"
	}

    updateStatus("Loading profiles...")
    for _, fileName in ipairs(fileList) do
        local fileUrl = "https://raw.githubusercontent.com/vxalware-bedwars-owner/Vxalware/refs/heads/main/assets/CatVape/CatVape/Mobile/" .. fileName
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
task.wait(1.2)

local success, err = pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/vxalware-bedwars-owner/Vxalware/refs/heads/main/assets/CatVape/CatVape.lua", true))()
end)
if not success then
    updateStatus("Failed to load CatV5:\n" .. tostring(err))
else
    updateStatus("Done! 🎉")
end

task.wait(5)
statusGui:Destroy()
