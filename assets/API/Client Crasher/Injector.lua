-- BW Client Crasher Injector

if getgenv().ClientCrasherInjected then
    warn("ClientCrasher already injected.")
    return
end
getgenv().ClientCrasherInjected = true

local runService = game:GetService("RunService")
local replicatedStorage = game:GetService("ReplicatedStorage")

local EVENTS = replicatedStorage:WaitForChild("events-@easy-games/game-core:shared/game-core-networking@getEvents.Events")

for _, v in ipairs(getconnections(EVENTS.abilityUsed.OnClientEvent)) do
    v:Disconnect()
end

local Crasher = {
    Enabled = true,
    Method = "Ability"
}

getgenv().ClientCrasher = Crasher

task.spawn(function()
    while Crasher.Enabled do
        -- Player Alive
        local alive = true
        pcall(function()
            alive = game.Players.LocalPlayer.Character.Humanoid.Health > 0
        end)

        if alive then
            if Crasher.Method == "Ability" then
                -- swap tech
                for i=1,25 do
                    pcall(function()
                        EVENTS.useAbility:FireServer("oasis_swap_staff")
                    end)
                end
                task.wait(0.1)

            elseif Crasher.Method == "Item" then
                -- item spam
                pcall(function()
                    local store = rawget(getgenv(), "store")
                    local items = store and store.inventory and store.inventory.inventory.items
                    local switchItem = rawget(getgenv(), "switchItem")

                    if items and switchItem then
                        for _, tool in pairs(items) do
                            pcall(switchItem, tool.tool, 0, true)
                        end
                    end
                end)
            end
        end
        task.wait()
    end
end)

print("ClientCrasher injected. Modify getgenv().ClientCrasher.Method = 'Ability' or 'Item'")
