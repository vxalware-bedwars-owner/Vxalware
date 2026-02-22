-- Advanced FOV Changer [Disabler]
local orig = getgenv().VXAL_FOV_CHANGER_ORIGINAL_FOV

if orig ~= nil then
    local cam = workspace.CurrentCamera
    if cam then
        pcall(function()
            cam.FieldOfView = orig
        end)
    end
end
