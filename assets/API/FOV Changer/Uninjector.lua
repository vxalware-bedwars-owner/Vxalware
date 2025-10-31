-- Advanced FOV Changer [Uninjector]
local MODULE = "VXAL_FOV_CHANGER"
local state = getgenv()[MODULE]

if not state or type(state) ~= "table" then
    warn("[FOV Uninjector] No active FOV changer found under getgenv()." .. MODULE)
    return
end

-- stop loop
state.Running = false

-- Disconnect any connections
if state.Connections then
    for _, c in ipairs(state.Connections) do
        pcall(function() if c and c.Disconnect then c:Disconnect() end end)
    end
end

-- small delay to finish cleanup
task.wait(0.2)

-- Restore original FOV
local cam = workspace.CurrentCamera
if cam and state.OriginalFOV ~= nil then
    pcall(function() cam.FieldOfView = state.OriginalFOV end)
    print("[FOV Uninjector] Restored original FOV:", state.OriginalFOV)
else
    print("[FOV Uninjector] No original FOV recorded; nothing to restore.")
end

-- Remove module record
getgenv()[MODULE] = nil
print("[FOV Uninjector] Uninjection complete.")
