local lighting = game:GetService("Lighting")

local prev = lighting:FindFirstChild("CustomAtmosphere")
if prev then
    prev:Destroy()
else
    print("no CustomAtmosphere")
end

local prevBloom = lighting:FindFirstChild("CustomBloom")
if prevBloom then
    prevBloom:Destroy()
else
    print("no CustomBloom")
end
