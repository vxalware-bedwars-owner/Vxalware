-- Advanced FOV Changer [Injector]
-- Specially modified for slider implementation
local FovSaved = config.slider["Fov Changer"] or 100
local MODULE = "VXAL_FOV_CHANGER"
local cam = workspace.CurrentCamera
local existing = getgenv()[MODULE]
if not existing then
    getgenv()[MODULE] = {
        Running = true,
        DesiredFOV = nil,
        OriginalFOV = cam and cam.FieldOfView or 70,
        Connections = {},
    }
end

task.delay(0.5, function()
    local camera = workspace.CurrentCamera
    local state = getgenv()[MODULE]
    if camera and FovSaved then
        state.DesiredFOV = FovSaved
        pcall(function()
            camera.FieldOfView = FovSaved
        end)
    end
end)

print("[FOV Injector] Successfully hijacked FOV response")
local Slider = OthersTab:Slider({
    Title = "Fov Changer",
    Desc = "This element is in beta. Please expect bugs!",
    Step = 10,
    Value = {
        Min = 60,
        Max = 120,
        Default = FovSaved,
    },
    Callback = function(value)
        runWithNotify("Fov Changer", function()
            local state = getgenv()[MODULE]
            if not state then
                local cam = workspace.CurrentCamera
                state = {
                    Running = true,
                    DesiredFOV = value,
                    OriginalFOV = cam and cam.FieldOfView or nil,
                    Connections = {},
                }

                task.spawn(function()
                    while state.Running do
                        local cam = workspace.CurrentCamera
                        if cam and state.OriginalFOV == nil then
                            state.OriginalFOV = cam.FieldOfView
                        end
                        if cam then
                            pcall(function()
                                cam.FieldOfView = state.DesiredFOV
                            end)
                        end
                        task.wait(0.1)
                    end

                    local cam = workspace.CurrentCamera
                    if cam and state.OriginalFOV ~= nil then
                        pcall(function()
                            cam.FieldOfView = state.OriginalFOV
                        end)
                    end
                end)

                local conn = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
                    local cam = workspace.CurrentCamera
                    if cam and state.Running then
                        pcall(function()
                            cam.FieldOfView = state.DesiredFOV
                        end)
                    end
                end)
                table.insert(state.Connections, conn)
                getgenv()[MODULE] = state
            else
                state.DesiredFOV = value
            end

            local cam = workspace.CurrentCamera
            if cam then
                pcall(function()
                    cam.FieldOfView = value
                end)
            end
        end, {
            kind = "slider",
            getValue = function() return value end
        })
        config.slider["Fov Changer"] = value
        safeWriteConfig()
    end
})
