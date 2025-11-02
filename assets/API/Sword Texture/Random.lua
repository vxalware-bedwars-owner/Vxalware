if texturepack then texturepack:Disconnect() end
getgenv().texturepack = workspace.CurrentCamera.Viewmodel.ChildAdded:Connect(function(x)
    if x and x:FindFirstChild("Handle") then
        if string.find(x.Name:lower(), 'sword') then
            x.Handle.Material = Enum.Material.ForceField
            x.Handle.MeshId = "rbxassetid://13471207377"
            x.Handle.BrickColor = BrickColor.new("Hot pink")
        end
    end
end)
--[[
if texturepack then texturepack:Disconnect() end
local Pack = game:GetObjects("rbxassetid://13471207377")
Pack[1].Parent = game:GetService("ReplicatedStorage")
local Items = Pack[1]:GetChildren()
getgenv().texturepack = workspace.CurrentCamera.Viewmodel.DescendantAdded:Connect(function(m)
	local item = nil
	local offset
	for i, v in Items do
		if v.Name:lower() == m.Name then
			item = v
			if v.Name:find("Sword") then
				offset = CFrame.Angles(math.rad(0),math.rad(-100),math.rad(-90))
			elseif v.Name:find("axe") then
				offset = CFrame.new(0,0.45,0) * CFrame.Angles(math.rad(0),math.rad(-10),math.rad(-95))
			end
			break
		end
	end
	if item ~= nil then
		local mesh = item:Clone()
		mesh.Parent = m
		mesh.CFrame = m:WaitForChild("Handle").CFrame * offset
		mesh.CFrame *= CFrame.Angles(0,math.rad(-50),0)
		mesh.Size *= Vector3.new(1.375, 1.375, 1.375)
		local weld  = Instance.new("WeldConstraint", mesh)
		weld.Part0 = mesh
		weld.Part1 = m:WaitForChild("Handle")
		m:WaitForChild("Handle").Transparency = 1
	end
end)
]]
