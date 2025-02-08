local player = game:GetService("Players").LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Parent = player:FindFirstChild("PlayerGui") or player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0.5, 0, 0.2, 0)  -- 50% width, 20% height (less wide, taller)
frame.Position = UDim2.new(0.25, 0, 0.4, 0) -- Centered
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
frame.BorderSizePixel = 0
frame.Parent = gui

local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, 0, 1, 0) -- Fills the frame
textLabel.Text = "Vxalware is down until further notice"
textLabel.TextColor3 = Color3.fromRGB(255, 255, 255) -- White text
textLabel.BackgroundTransparency = 1
textLabel.TextScaled = true
textLabel.Font = Enum.Font.SourceSansBold
textLabel.Parent = frame

-- Show message for 5 seconds, then remove it
task.wait(5)
gui:Destroy()

line that ensures the code doesnt continiue to be executed.
-----------------------------------------------------------------------------------------------------------------------------------------------------

local UserInputService = game:GetService("UserInputService")

if UserInputService.TouchEnabled then
    -- Vxalware Rewrite (mobile)
    getgenv().CAK = "CAK_KZ7DiDSB5-viNcjC-5AKdwKjP0EmqopL"
    loadstring(game:HttpGet("https://raw.githubusercontent.com/qwertyui-is-back/CatV5/main/init.lua"))()

    loadstring(game:HttpGet('https://raw.githubusercontent.com/vxalware-bedwars-owner/Vxalware-Rewrite/refs/heads/main/Vxalware%20Extension'))()
    loadstring(game:HttpGet('https://gitlab.com/-/snippets/4774635/raw/main/BedwarsScript.lua'))()
else
    -- Vxalware Rewrite (PC)
    getgenv().CAK = "CAK_KZ7DiDSB5-viNcjC-5AKdwKjP0EmqopL"
    loadstring(game:HttpGet("https://raw.githubusercontent.com/qwertyui-is-back/CatV5/main/init.lua"))()

    loadstring(game:HttpGet('https://raw.githubusercontent.com/vxalware-bedwars-owner/Vxalware-Rewrite/refs/heads/main/Vxalware%20Extension'))()
    loadstring(game:HttpGet('https://pastebin.com/raw/gZhGD17A'))()
end
