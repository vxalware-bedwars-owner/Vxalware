-- Platform-detect + fetch-and-write script
-- Works in exploit environments that provide game:HttpGet, isfolder/makefolder, isfile, writefile, loadstring, etc.

local UserInputService = game:GetService("UserInputService")
local platform = UserInputService:GetPlatform()
local isMobile = (platform == Enum.Platform.Android) or (platform == Enum.Platform.IOS)

-- URLs you asked for
local pcLoadUrl = "https://raw.githubusercontent.com/new-qwertyui/CatV5/main/init.lua"
local cheaterJsonUrl = "https://raw.githubusercontent.com/vxalware-bedwars-owner/Vxalware/refs/heads/main/assets/CatVape/CatV5/cheaters.json"
local mainLuaUrl = "https://raw.githubusercontent.com/vxalware-bedwars-owner/Vxalware/refs/heads/main/assets/CatVape/CatV5/main.lua"

-- Early existence check:
-- If a file *or* folder named "catrewrite" already exists in the executor workspace, print and stop.
local function exists_catrewrite()
    -- Prefer isfile check (user requested a file check); then isfolder fallback.
    if type(isfile) == "function" then
        local ok, res = pcall(function() return isfile("catrewrite") end)
        if ok and res then
            return true
        end
    end
    if type(isfolder) == "function" then
        local ok2, res2 = pcall(function() return isfolder("catrewrite") end)
        if ok2 and res2 then
            return true
        end
    end
    -- If neither API available or both returned false, return false (do not assume existence).
    return false
end

if exists_catrewrite() then
    print("[script] 'catrewrite' already exists in workspace — aborting.")
    return
end

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
    -- Mobile branch: ensure catrewrite folder & download files, then write them
    -- Create folder structure (wrapped in pcall to avoid errors if functions missing)
    pcall(function()
        if type(isfolder) == "function" then
            if not isfolder("catrewrite") then makefolder("catrewrite") end
            if not isfolder("catrewrite/assets") then makefolder("catrewrite/assets") end
            if not isfolder("catrewrite/assets/rise") then makefolder("catrewrite/assets/rise") end -- New empty folder
            if not isfolder("catrewrite/assets/new") then makefolder("catrewrite/assets/new") end   -- New folder for assets
        end
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

    -- fetch cheaters.json -> catrewrite/cheaters.json
    local s1, e1 = fetchAndWrite(cheaterJsonUrl, "catrewrite/cheaters.json")
    if s1 then
        print("[script] Wrote catrewrite/cheaters.json")
    else
        warn("[script] Failed to write catrewrite/cheaters.json: "..tostring(e1))
    end

    -- fetch main.lua -> catrewrite/main.lua
    local s2, e2 = fetchAndWrite(mainLuaUrl, "catrewrite/main.lua")
    if s2 then
        print("[script] Wrote catrewrite/main.lua")
    else
        warn("[script] Failed to write catrewrite/main.lua: "..tostring(e2))
    end

    -- Table containing the PNG file names and their raw binary content
    local pngsToWrite = {
        { "add.png", [[iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAW99uoAAAAPklEQVR42mP8z8EO...RRCPkpZwDIXwF9SQo7/wD84G1oZDFhSI5QQA1vZG6+R6ydgAAAAASUVORK5CYII=]] },
        { "alert.png", [[iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAFElEQVR42u3A0Q6AIAgDFfH/FRQA9BTUDpBAAQAAAABJRU5ErkJggg==]] },
        { "allowedicon.png", [[iVBORw0KGgoAAAANSUhEUgAAABAAAAANCAYAAAAX2Y7TAAAAHElEQVR42mNgGMUAAAAEkJ/4/w8O8O+f+P8PFsSQ2rYDAMuQFJOYLapWAAAAAElFTkSuQmCC]] },
        { "allowedtab.png", [[iVBORw0KGgoAAAANSUhEUgAAABYAAAASCAYAAAD23JngAAAAIUlEQVR42mMYxYEAAAAEkD/4/w8O8D/4/w8WGPHZyg4AFBSA1SC17luN0AAAAABJRU5ErkJggg==]] },
        { "back.png", [[iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAW99uoAAAAFElEQVR42mP8z4EBAAAAwiD/awHNFgCQkaSmAAAAAElFTkSuQmCC]] },
        { "bind.png", [[iVBORw0KGgoAAAANSUhEUgAAAA4AAAAOCAYAAADy1+aZAAAAFElEQVR42mP8z4EBAAAAwiD/awHNFgCEjJoYAAAAAElFTkSuQmCC]] },
        { "bindbkg.png", [[iVBORw0KGgoAAAANSUhEUgAAAAEAAAABAQMAAAAZ2FbKAAAACklEQVQI12NgAAAAAgAB5fxB1QAAAABJRU5ErkJggg==]] },
        { "blatanticon.png", [[iVBORw0KGgoAAAANSUhEUgAAAA4AAAAOCAYAAADy1+aZAAAAH0lEQVR42mP8z8EBAAYYwxfSkKO/8A8O8O+f+P8PFsSQ2rYDAGTdDpBFE53DAAAAAElFTkSuQmCC]] },
        { "blockedicon.png", [[iVBORw0KGgoAAAANSUhEUgAAABIAAAANCAYAAAA778XyAAAAHUlEQVR42mPgz4EBAAAAwiD/awHNFgAAAABJRU5ErkJggg==]] },
        { "blockedtab.png", [[iVBORw0KGgoAAAANSUhEUgAAABYAAAASCAYAAAD23JngAAAAIElEQVR42mPgz4EBAAAAwiD/awHNFgAAAABJRU5ErkJggg==]] },
    }
    
    -- Write the embedded PNG assets to the new folder
    print("[script] Writing PNG assets...")
    for _, pngData in ipairs(pngsToWrite) do
        local filename = pngData[1]
        local content = pngData[2]
        local outPath = "catrewrite/assets/new/" .. filename
        
        local wrote, werr = pcall(function() writefile(outPath, content) end)
        if wrote then
            print("[script] Wrote " .. outPath)
        else
            warn("[script] Failed to write " .. outPath .. ": " .. tostring(werr))
        end
    end
end

print("[script] Done.")
