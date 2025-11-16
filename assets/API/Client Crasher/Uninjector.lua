-- BW Client Crasher Uninjector

local C = getgenv().ClientCrasher
if not C then
    warn("ClientCrasher not active.")
    return
end

C.Enabled = false
getgenv().ClientCrasherInjected = false
getgenv().ClientCrasher = nil

print("ClientCrasher un-injected and stopped.")
