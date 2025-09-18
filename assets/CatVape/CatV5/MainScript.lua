local UserInputService = game:GetService("UserInputService")
local platform = UserInputService:GetPlatform()
local isMobile = (platform == Enum.Platform.Android) or (platform == Enum.Platform.IOS)

local pcLoadUrl = "https://raw.githubusercontent.com/new-qwertyui/CatV5/main/init.lua"
local cheaterJsonUrl = "https://raw.githubusercontent.com/vxalware-bedwars-owner/Vxalware/refs/heads/main/assets/CatVape/CatV5/cheaters.json"
local mainLuaUrl = "https://raw.githubusercontent.com/vxalware-bedwars-owner/Vxalware/refs/heads/main/assets/CatVape/CatV5/main.lua"

if not isMobile then
    -- PC branch: try to run the requested loadstring (safe-wrapped)
    local ok, err = pcall(function()
        local raw = game:HttpGet(pcLoadUrl, true)
        if raw and raw ~= "" then
            local fn, loadErr = loadstring(raw)
            if fn then
                fn()
            else
                error("loadstring error: "..tostring(loadErr))
            end
        else
            error("Failed to download PC payload or empty response.")
        end
    end)
    if ok then
        print("[script] PC branch executed loadstring successfully.")
    else
        warn("[script] PC branch failed: "..tostring(err))
    end
else
    -- Mobile branch: ensure folders & download files, then write them
    pcall(function()
        if type(isfolder) == "function" and not isfolder("vape") then makefolder("vape") end
        if type(isfolder) == "function" and not isfolder("rise") then makefolder("rise") end
    end)
    -- helper to download + write file
    local function fetchAndWrite(url, outPath)
        local ok, body = pcall(function() return game:HttpGet(url, true) end)
        if not ok or not body or body == "" or body == "404: Not Found" then
            return false, "download failed or 404"
        end
        local wrote, werr = pcall(function() writefile(outPath, body) end)
        if not wrote then
            return false, "writefile failed: "..tostring(werr)
        end
        return true, nil
    end

    local s1, e1 = fetchAndWrite(cheaterJsonUrl, "vape/cheater.json")
    if s1 then
        print("[script] Wrote vape/cheater.json")
    else
        warn("[script] Failed to write vape/cheater.json: "..tostring(e1))
    end

    local s2, e2 = fetchAndWrite(mainLuaUrl, "vape/main.lua")
    if s2 then
        print("[script] Wrote vape/main.lua")
    else
        warn("[script] Failed to write vape/main.lua: "..tostring(e2))
    end
end

print("[script] Done.")
