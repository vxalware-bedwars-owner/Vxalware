local lighting = game:GetService("Lighting")

-- removes any previous atmospheres
local prev = lighting:FindFirstChild("CustomAtmosphere")
if prev then prev:Destroy() end
local prevBloom = lighting:FindFirstChild("CustomBloom")
if prevBloom then prevBloom:Destroy() end

local atmosphere = Instance.new("Atmosphere")
atmosphere.Name = "CustomAtmosphere"
atmosphere.Parent = lighting

atmosphere.Density = 0.19
atmosphere.Offset = 0
atmosphere.Color = Color3.fromRGB(255, 150, 200)
atmosphere.Decay = Color3.fromRGB(170, 80, 140)

lighting.TimeOfDay = "21:00:00"
lighting.Brightness = 2
lighting.Ambient = Color3.fromRGB(140, 100, 120)
lighting.OutdoorAmbient = Color3.fromRGB(150, 110, 130)
lighting.FogStart = 200
lighting.FogEnd = 1200
lighting.FogColor = Color3.fromRGB(255, 140, 190)

local bloom = Instance.new("BloomEffect")
bloom.Name = "CustomBloom"
bloom.Parent = lighting
bloom.Intensity = 0.3
bloom.Threshold = 0.81
bloom.Size = 30

print("Pink atmosphere applied!")
