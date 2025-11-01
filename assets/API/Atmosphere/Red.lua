local lighting = game:GetService("Lighting")

-- remove any previous atmospheres
local prev = lighting:FindFirstChild("CustomAtmosphere")
if prev then prev:Destroy() end
local prevBloom = lighting:FindFirstChild("CustomBloom")
if prevBloom then prevBloom:Destroy() end

local atmosphere = Instance.new("Atmosphere")
atmosphere.Name = "CustomAtmosphere"
atmosphere.Parent = lighting

atmosphere.Density = 0.22
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
bloom.Intensity = 0.35
bloom.Threshold = 0.78
bloom.Size = 32

print("Red atmosphere applied!")
