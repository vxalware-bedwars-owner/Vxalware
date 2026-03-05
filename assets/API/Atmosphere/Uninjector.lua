-- Advanced atmosphere uninjector
local lighting = game:GetService("Lighting")
local hasSaved = getgenv().__savedLightingState ~= nil
local prev = lighting:FindFirstChild("CustomAtmosphere")
local prevBloom = lighting:FindFirstChild("CustomBloom")

if not hasSaved and not prev and not prevBloom then
    return
end

if prev then
    prev:Destroy()
end

if prevBloom then
    prevBloom:Destroy()
end

if hasSaved then
    local saved = getgenv().__savedLightingState
    pcall(function() lighting.TimeOfDay = saved.TimeOfDay end)
    pcall(function() lighting.Brightness = saved.Brightness end)
    pcall(function() lighting.Ambient = saved.Ambient end)
    pcall(function() lighting.OutdoorAmbient = saved.OutdoorAmbient end)
    pcall(function() lighting.FogStart = saved.FogStart end)
    pcall(function() lighting.FogEnd = saved.FogEnd end)
    pcall(function() lighting.FogColor = saved.FogColor end)

    for _, child in ipairs(lighting:GetChildren()) do
        if child.ClassName == "Atmosphere" and child.Name == "CustomAtmosphere" then
            pcall(function() child:Destroy() end)
        end
        if child.ClassName == "BloomEffect" and child.Name == "CustomBloom" then
            pcall(function() child:Destroy() end)
        end
    end

    if saved.OriginalAtmosphere then
        local a = Instance.new("Atmosphere")
        a.Name = saved.OriginalAtmosphere.Name or "RestoredAtmosphere"
        a.Parent = lighting
        a.Density = saved.OriginalAtmosphere.Density
        a.Offset = saved.OriginalAtmosphere.Offset
        a.Color = saved.OriginalAtmosphere.Color
        a.Decay = saved.OriginalAtmosphere.Decay
    end

    if saved.OriginalBloom then
        local b = Instance.new("BloomEffect")
        b.Name = saved.OriginalBloom.Name or "RestoredBloom"
        b.Parent = lighting
        b.Intensity = saved.OriginalBloom.Intensity
        b.Threshold = saved.OriginalBloom.Threshold
        b.Size = saved.OriginalBloom.Size
    end

    getgenv().__savedLightingState = nil
    print("[Atmosphere Uninjector] Visuals restored to saved original state.")
else
    print("[Atmosphere Uninjector] Successfully uninjected atmosphere.")
end
