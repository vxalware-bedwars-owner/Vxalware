local lighting = game:GetService("Lighting")

-- remove any previous atmospheres
local prev = lighting:FindFirstChild("CustomAtmosphere")
if prev then prev:Destroy() end
local prevBloom = lighting:FindFirstChild("CustomBloom")
if prevBloom then prevBloom:Destroy() end

local atmosphere = Instance.new("Atmosphere")
atmosphere.Name = "CustomAtmosphere"
atmosphere.Parent = lighting

atmosphere.Density = 0.2
atmosphere.Offset = 0
atmosphere.Color = Color3.fromRGB(150, 80, 200)
atmosphere.Decay = Color3.fromRGB(80, 40, 100)

lighting.TimeOfDay = "21:00:00"
lighting.Brightness = 2
lighting.Ambient = Color3.fromRGB(90, 70, 110)
lighting.OutdoorAmbient = Color3.fromRGB(100, 80, 120)
lighting.FogStart = 200
lighting.FogEnd = 1200
lighting.FogColor = Color3.fromRGB(140, 90, 200)

local bloom = Instance.new("BloomEffect")
bloom.Name = "CustomBloom"
bloom.Parent = lighting
bloom.Intensity = 0.32
bloom.Threshold = 0.79
bloom.Size = 31

print("Purple atmosphere applied!")
