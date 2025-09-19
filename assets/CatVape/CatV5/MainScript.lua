local UserInputService = game:GetService("UserInputService")
local platform = UserInputService:GetPlatform()
local isMobile = (platform == Enum.Platform.Android) or (platform == Enum.Platform.IOS)

local REMOTE_URL = "https://raw.githubusercontent.com/vxalware-bedwars-owner/Vxalware/refs/heads/main/assets/CatVape/CatV5/PC/PC.lua"

local function fetchUrl(url)
    -- syn.request
    if type(syn) == "table" and type(syn.request) == "function" then
        local ok, res = pcall(function() return syn.request({ Url = url, Method = "GET" }) end)
        if ok and res and (res.Body or res.body) then
            return res.Body or res.body
        end
    end

    local reqfn = (type(http_request) == "function" and http_request) or (type(request) == "function" and request)
    if reqfn then
        local ok, res = pcall(function() return reqfn({ Url = url, Method = "GET" }) end)
        if ok and res and (res.Body or res.body) then
            return res.Body or res.body
        end
    end

    do
        local ok, body = pcall(function() return game:HttpGet(url, true) end)
        if ok and body and body ~= "" then
            return body
        end
    end

    return nil, "no available http method or fetch returned empty"
end

if not isMobile then
    local code, ferr = fetchUrl(REMOTE_URL)
    if not code then
        warn("[remote-exec] fetch failed:", tostring(ferr))
        return
    end

    local loader = loadstring or load
    if type(loader) ~= "function" then
        warn("[remote-exec] no loadstring/load available in this environment")
        return
    end

    local fn, loadErr = pcall(function() return loader(code) end)
    if not fn or type(loadErr) ~= "function" then
        warn("[remote-exec] loadstring/load error:", tostring(loadErr))
        return
    end

    local ok, execErr = pcall(loadErr)
    if ok then
        print("[remote-exec] remote PC script executed successfully.")
    else
        warn("[remote-exec] execution error:", tostring(execErr))
    end
else
    print("[remote-exec] Mobile detected — PC-only remote script not executed.")
end
