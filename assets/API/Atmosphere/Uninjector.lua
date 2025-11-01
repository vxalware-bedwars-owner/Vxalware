local lighting = game:GetService("Lighting")

-- collect atmosphere
local atmospheres = {}
for _, child in ipairs(lighting:GetChildren()) do
    if child.ClassName == "Atmosphere" then
        table.insert(atmospheres, child)
    end
end

-- no atmosphere
if #atmospheres == 0 then
    print("No Atmosphere found.")
    return
end

-- destory all
for _, a in ipairs(atmospheres) do
    a:Destroy()
end

-- cleanup
for _, child in ipairs(lighting:GetChildren()) do
    if child.ClassName == "BloomEffect" then
        child:Destroy()
    end
end

print("Atmosphere removed.")
