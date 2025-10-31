-- Advanced FOV Changer [Injector]
local MODULE = "VXAL_FOV_CHANGER"
local DesiredFOV = 150
local LoopDelay = 0.1

local player = game.Players.LocalPlayer
local camera = workspace.CurrentCamera

-- terminate any old instances
if getgenv()[MODULE] and type(getgenv()[MODULE]) == "table" then
    getgenv()[MODULE].Running = false
    -- allow previous loop to exit
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

-- enforce FOV in safe loop
state.Thread = task.spawn(function()
    while state.Running do
        local cam = workspace.CurrentCamera
        if cam then
            -- ensure FOV is kept at DesiredFOV
            pcall(function() cam.FieldOfView = state.DesiredFOV end)
        end
        task.wait(LoopDelay)
    end

    -- restore original FOV
    local cam = workspace.CurrentCamera
    if cam and state.OriginalFOV ~= nil then
        pcall(function() cam.FieldOfView = state.OriginalFOV end)
    end
end)

-- Watch for camera replacement
local ok, conn = pcall(function()
    return workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
        camera = workspace.CurrentCamera
        if camera then
            -- if haven't captured original FOV (nil), record it now
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

-- Expose control globally for uninjector or future checks
getgenv()[MODULE] = state

-- print status
print("[FOV Changer] injected. DesiredFOV =", DesiredFOV, "OriginalFOV =", state.OriginalFOV)
