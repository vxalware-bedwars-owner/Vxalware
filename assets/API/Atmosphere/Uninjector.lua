-- Advanced atmosphere uninjector
local lighting = game:GetService("Lighting")

local hasSaved = getgenv().__savedLightingState ~= nil
local prev = lighting:FindFirstChild("CustomAtmosphere")
local prevBloom = lighting:FindFirstChild("CustomBloom")

-- Topic for none
if not hasSaved and not prev and not prevBloom then
    print("No custom atmosphere/bloom found and no saved state. Nothing to remove.")
    return
end

-- Remove custom instances
if prev then
    prev:Destroy()
    print("CustomAtmosphere removed.")
else
    print("no CustomAtmosphere")
end

if prevBloom then
    prevBloom:Destroy()
    print("CustomBloom removed.")
else
    print("no CustomBloom")
end

-- Restore saved state
if hasSaved then
    local saved = getgenv().__savedLightingState

    pcall(function() lighting.TimeOfDay = saved.TimeOfDay end)
    pcall(function() lighting.Brightness = saved.Brightness end)
    pcall(function() lighting.Ambient = saved.Ambient end)
    pcall(function() lighting.OutdoorAmbient = saved.OutdoorAmbient end)
    pcall(function() lighting.FogStart = saved.FogStart end)
    pcall(function() lighting.FogEnd = saved.FogEnd end)
    pcall(function() lighting.FogColor = saved.FogColor end)

    -- Remove any custom named instances
    for _, child in ipairs(lighting:GetChildren()) do
        if child.ClassName == "Atmosphere" and child.Name == "CustomAtmosphere" then
            pcall(function() child:Destroy() end)
        end
        if child.ClassName == "BloomEffect" and child.Name == "CustomBloom" then
            pcall(function() child:Destroy() end)
        end
    end

    -- Recreate original Atmosphere
    if saved.OriginalAtmosphere then
        local a = Instance.new("Atmosphere")
        a.Name = saved.OriginalAtmosphere.Name or "RestoredAtmosphere"
        a.Parent = lighting
        a.Density = saved.OriginalAtmosphere.Density
        a.Offset = saved.OriginalAtmosphere.Offset
        a.Color = saved.OriginalAtmosphere.Color
        a.Decay = saved.OriginalAtmosphere.Decay
        print("Restored original Atmosphere.")
    end

    -- Recreate original BloomEffect
    if saved.OriginalBloom then
        local b = Instance.new("BloomEffect")
        b.Name = saved.OriginalBloom.Name or "RestoredBloom"
        b.Parent = lighting
        b.Intensity = saved.OriginalBloom.Intensity
        b.Threshold = saved.OriginalBloom.Threshold
        b.Size = saved.OriginalBloom.Size
        print("Restored original BloomEffect.")
    end

    -- Clear
    getgenv().__savedLightingState = nil
    print("Lighting restored to saved original state.")
else
    print("Removed custom atmosphere/bloom but no original state to restore.")
end
