-- Advanced FOV Changer [Injector]
local MODULE = "VXAL_FOV_CHANGER"
local DesiredFOV = 150
local LoopDelay = 0.1

local player = game.Players.LocalPlayer
local camera = workspace.CurrentCamera

-- Uninject oldies
if getgenv()[MODULE] and type(getgenv()[MODULE]) == "table" then
    getgenv()[MODULE].Running = false
    -- exitation
    task.wait(0.15)
end

-- Module state
local state = {
    Running = true,
    DesiredFOV = DesiredFOV,
    OriginalFOV = (camera and camera.FieldOfView) or nil,
    Thread = nil,
    Connections = {},
}

-- enforce FOV so it doesn't bug
state.Thread = task.spawn(function()
    while state.Running do
        local cam = workspace.CurrentCamera
        if cam then
            -- DesiredFOV would be kept at all times (i think)
            pcall(function() cam.FieldOfView = state.DesiredFOV end)
        end
        task.wait(LoopDelay)
    end

    -- restore FOV
    local cam = workspace.CurrentCamera
    if cam and state.OriginalFOV ~= nil then
        pcall(function() cam.FieldOfView = state.OriginalFOV end)
    end
end)

-- camera replacement counter
local ok, conn = pcall(function()
    return workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
        camera = workspace.CurrentCamera
        if camera then
            -- record FOV for good measure
            if state.OriginalFOV == nil then
                state.OriginalFOV = camera.FieldOfView
            end
            if state.Running then
                pcall(function() camera.FieldOfView = state.DesiredFOV end)
            end
        end
    end)
end)
if ok and conn then table.insert(state.Connections, conn) end

-- uninjector moment
getgenv()[MODULE] = state

-- status check
print("[FOV Changer] injected. DesiredFOV =", DesiredFOV, "OriginalFOV =", state.OriginalFOV)
