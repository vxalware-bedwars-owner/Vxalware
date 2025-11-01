local lighting = game:GetService("Lighting")

-- remove any previous atmospheres
local prev = lighting:FindFirstChild("CustomAtmosphere")
if prev then prev:Destroy() end
local prevBloom = lighting:FindFirstChild("CustomBloom")
if prevBloom then prevBloom:Destroy() end

local atmosphere = Instance.new("Atmosphere")
atmosphere.Name = "CustomAtmosphere"
atmosphere.Parent = lighting

atmosphere.Density = 0.21
atmosphere.Offset = 0
atmosphere.Color = Color3.fromRGB(255, 140, 60)
atmosphere.Decay = Color3.fromRGB(140, 70, 30)

lighting.TimeOfDay = "21:00:00"
lighting.Brightness = 2
lighting.Ambient = Color3.fromRGB(120, 80, 50)
lighting.OutdoorAmbient = Color3.fromRGB(130, 90, 60)
lighting.FogStart = 200
lighting.FogEnd = 1200
lighting.FogColor = Color3.fromRGB(240, 130, 50)

local bloom = Instance.new("BloomEffect")
bloom.Name = "CustomBloom"
bloom.Parent = lighting
bloom.Intensity = 0.33
bloom.Threshold = 0.79
bloom.Size = 31

print("Orange atmosphere applied!")
