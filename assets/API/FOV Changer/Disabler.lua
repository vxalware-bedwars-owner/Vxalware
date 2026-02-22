-- Advanced FOV Changer [Disabler]
local MODULE = "VXAL_FOV_CHANGER"
local state = getgenv()[MODULE]

if state and state.OriginalFOV ~= nil then
    local cam = workspace.CurrentCamera
    if cam then
        pcall(function()
            cam.FieldOfView = state.OriginalFOV
        end)
    end
end
