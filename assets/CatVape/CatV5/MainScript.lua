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
            if not isfolder("catrewrite/rise") then makefolder("catrewrite/rise") end -- New empty folder
            if not isfolder("catrewrite/new") then makefolder("catrewrite/new") end   -- New folder for assets
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
        {"add.png", "\137PNG\13\10\26\10\0\0\0\13IHDR\0\0\0\16\0\0\0\16\8\6\0\0\0\22\247\219\168\0\0\0\62IDATx\218c\252\207\193\14\0\6\24\195\23\170\239\19\144\218\172\20\139\13\206\240\246p\3\168\22\132\131\36\18\130\13\69\16\143\146\150p\12\133\240\23\212\144\163\191\240\15\206\6\214\134C\22\20\136\229\4\0\214\246F\235\228z\201\216\0\0\0\0IEND\174B`\130"},
        {"alert.png", "\137PNG\13\10\26\10\0\0\0\13IHDR\0\0\0 \0\0\0 \8\6\0\0\0szz\244\0\0\0\20IDATx\218\237\192\209\14\128 \8\3\21\241\255\21\20\0\244\20\212\14\144@\1\0\0\0\0IEND\174B`\130"},
        {"allowedicon.png", "\137PNG\13\10\26\10\0\0\0\13IHDR\0\0\0\16\0\0\0\r\8\6\0\0\0\23\217\142\211\0\0\0\28IDATx\218c`\24\197\0\0\4\144\159\248\255\15\14\240\239\159\248\255\15\22\196\144\218\182\3\0\203\144\20\147\152-\170V\0\0\0\0IEND\174B`\130"},
        {"allowedtab.png", "\137PNG\13\10\26\10\0\0\0\13IHDR\0\0\0\22\0\0\0\18\8\6\0\0\0\246\220\153\224\0\0\0\33IDATx\218c\24\197\129\0\0\4\144?\248\255\15\14\240?\248\255\15\22\24\241\217\202\14\0\20\20\128\213\32\181\238[\141\208\0\0\0\0IEND\174B`\130"},
        {"back.png", "\137PNG\13\10\26\10\0\0\0\13IHDR\0\0\0\16\0\0\0\16\8\6\0\0\0\22\247\219\168\0\0\0\20IDATx\218c\252\207\129\1\0\0\0\194 \255\107\1\205\22\0\144\145\164\166\0\0\0\0IEND\174B`\130"},
        {"bind.png", "\137PNG\13\10\26\10\0\0\0\13IHDR\0\0\0\14\0\0\0\14\8\6\0\0\0\242\215\230\153\0\0\0\20IDATx\218c\252\207\129\1\0\0\0\194 \255\107\1\205\22\0\132\140\154\24\0\0\0\0IEND\174B`\130"},
        {"bindbkg.png", "\137PNG\13\10\26\10\0\0\0\13IHDR\0\0\0\1\0\0\0\1\1\3\0\0\0\25\216V\202\0\0\0\10IDAT\8\215c`\0\0\0\2\0\1\229\252A\213\0\0\0\0IEND\174B`\130"},
        {"blatanticon.png", "\137PNG\13\10\26\10\0\0\0\13IHDR\0\0\0\14\0\0\0\14\8\6\0\0\0\242\215\230\153\0\0\0\31IDATx\218c\252\207\193\1\0\6\24\195\23\170\239\22\240?\248\255\15\22\196\144\218\182\3\0d\221\14\144E\19\157\195\0\0\0\0IEND\174B`\130"},
        {"blockedicon.png", "\137PNG\13\10\26\10\0\0\0\13IHDR\0\0\0\18\0\0\0\r\8\6\0\0\0;\239\197\242\0\0\0\29IDATx\218c\224\207\129\1\0\6\24\195\23\212\144\163\191\240\15\14\240\239\159\248\255\15\22\196\144\218\182\3\0\205`\24\197\0\0\0\0IEND\174B`\130"},
        {"blockedtab.png", "\137PNG\13\10\26\10\0\0\0\13IHDR\0\0\0\22\0\0\0\18\8\6\0\0\0\246\220\153\224\0\0\0\32IDATx\218c\224\207\129\1\0\6\24\195\23\212\144\163\191\240\15\14\240\239\159\248\255\15\22\196\144\218\182\3\0\205\20\20\128\213\32\181\238\0\0\0\0IEND\174B`\130"}
    }
    
    -- Write the embedded PNG assets to the new folder
    print("[script] Writing PNG assets...")
    for _, pngData in ipairs(pngsToWrite) do
        local filename = pngData[1]
        local content = pngData[2]
        local outPath = "catrewrite/new/" .. filename
        
        local wrote, werr = pcall(function() writefile(outPath, content) end)
        if wrote then
            print("[script] Wrote " .. outPath)
        else
            warn("[script] Failed to write " .. outPath .. ": " .. tostring(werr))
        end
    end
end

print("[script] Done.")
