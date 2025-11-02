-- Advanced red atmosphere
local lighting = game:GetService("Lighting")

if not getgenv().__savedLightingState then
    local saved = {}
    saved.TimeOfDay = lighting.TimeOfDay
    saved.Brightness = lighting.Brightness
    saved.Ambient = lighting.Ambient
    saved.OutdoorAmbient = lighting.OutdoorAmbient
    saved.FogStart = lighting.FogStart
    saved.FogEnd = lighting.FogEnd
    saved.FogColor = lighting.FogColor

    for _, c in ipairs(lighting:GetChildren()) do
        if c:IsA("Atmosphere") and c.Name ~= "CustomAtmosphere" then
            saved.OriginalAtmosphere = {
                Density = c.Density,
                Offset = c.Offset,
                Color = c.Color,
                Decay = c.Decay,
                Name = c.Name,
            }
            break
        end
    end

    for _, c in ipairs(lighting:GetChildren()) do
        if c:IsA("BloomEffect") and c.Name ~= "CustomBloom" then
            saved.OriginalBloom = {
                Intensity = c.Intensity,
                Threshold = c.Threshold,
                Size = c.Size,
                Name = c.Name,
            }
            break
        end
    end

    getgenv().__savedLightingState = saved
end

local prev = lighting:FindFirstChild("CustomAtmosphere")
if prev then prev:Destroy() end
local prevBloom = lighting:FindFirstChild("CustomBloom")
if prevBloom then prevBloom:Destroy() end

local atmosphere = Instance.new("Atmosphere")
atmosphere.Name = "CustomAtmosphere"
atmosphere.Parent = lighting
atmosphere.Density = 0.2
atmosphere.Offset = 0
atmosphere.Color = Color3.fromRGB(200, 80, 80)
atmosphere.Decay = Color3.fromRGB(100, 40, 40)

lighting.TimeOfDay = "21:00:00"
lighting.Brightness = 2
lighting.Ambient = Color3.fromRGB(100, 60, 60)
lighting.OutdoorAmbient = Color3.fromRGB(110, 70, 70)
lighting.FogStart = 200
lighting.FogEnd = 1200
lighting.FogColor = Color3.fromRGB(200, 80, 80)

local bloom = Instance.new("BloomEffect")
bloom.Name = "CustomBloom"
bloom.Parent = lighting
bloom.Intensity = 0.3
bloom.Threshold = 0.8
bloom.Size = 30

print("Red atmosphere applied!")
