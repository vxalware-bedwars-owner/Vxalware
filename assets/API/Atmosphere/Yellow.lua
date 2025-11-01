local lighting = game:GetService("Lighting")

-- remove any previous atmospheres
local prev = lighting:FindFirstChild("CustomAtmosphere")
if prev then prev:Destroy() end
local prevBloom = lighting:FindFirstChild("CustomBloom")
if prevBloom then prevBloom:Destroy() end

local atmosphere = Instance.new("Atmosphere")
atmosphere.Name = "CustomAtmosphere"
atmosphere.Parent = lighting

atmosphere.Density = 0.18
atmosphere.Offset = 0
atmosphere.Color = Color3.fromRGB(255, 210, 70)
atmosphere.Decay = Color3.fromRGB(140, 115, 40)

lighting.TimeOfDay = "21:00:00"
lighting.Brightness = 2
lighting.Ambient = Color3.fromRGB(140, 120, 80)
lighting.OutdoorAmbient = Color3.fromRGB(150, 130, 90)
lighting.FogStart = 200
lighting.FogEnd = 1200
lighting.FogColor = Color3.fromRGB(250, 200, 70)

local bloom = Instance.new("BloomEffect")
bloom.Name = "CustomBloom"
bloom.Parent = lighting
bloom.Intensity = 0.28
bloom.Threshold = 0.82
bloom.Size = 29

print("Yellow atmosphere applied!")
