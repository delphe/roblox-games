--By Rufus14
local owner
local character
local charhum
local rootpart
local MarketplaceService = game:GetService("MarketplaceService")

canblockanim = true
equipped = false
runservice = game:GetService("RunService")
tool = script.Parent
handle = tool.Handle
blocksounds = {handle.block, handle.block2, handle.block3, handle.block4}
equipsound = handle.equip

tool.Equipped:connect(function()
	equipped = true
end)
tool.Unequipped:connect(function()
	equipped = false
end)

tool.Equipped:connect(function()
	owner = game:GetService("Players"):GetPlayerFromCharacter(tool.Parent)
	character = owner.Character
	charhum = character:findFirstChildOfClass("Humanoid")
	rootpart = character.HumanoidRootPart
	equipsound:Play()
	local rightgrip = character["Right Arm"]:WaitForChild("RightGrip")
	rightgrip.C0 = CFrame.new(0.409522653, -0.000911712646, 0.516324997, -0.0116359973, -0.0435790196, -0.998981893, 0.999929667, 0.00166221452, -0.0117195444, 0.0021712482, -0.999047935, 0.0435565971)
	local rightarm = Instance.new("Weld", owner.Character.Torso)
	rightarm.Part0 = owner.Character.Torso
	rightarm.Part1 = owner.Character["Right Arm"]
	rightarm.C0 = CFrame.new(1.5,0,0)
	rightarm.Name = "RightArmWeldshield"
	local head = Instance.new("Weld", owner.Character.Torso)
	head.Part0 = owner.Character.Torso
	head.Part1 = owner.Character.Head
	head.C0 = CFrame.new(0,1.5,0)
	head.Name = "HeadWeldshield"
	local humanoidrootpart = Instance.new("Weld", rootpart)
	humanoidrootpart.Part0 = rootpart
	humanoidrootpart.Part1 = owner.Character.Torso
	humanoidrootpart.Name = "HumanoidRootPartWeldshield"
	local thechar = character
	local lasthp = charhum.Health
	charhum.HealthChanged:connect(function(hp)
		if character == thechar and equipped then
			if hp < lasthp then
				charhum.Health = lasthp
				rootpart.Velocity = Vector3.new()
				if canblockanim then
					local soundplay = math.random(1,#blocksounds)
					blocksounds[soundplay]:Play()
					local closestdist = math.huge
					local WHO
					for i,v in pairs(workspace:GetDescendants()) do
						if v.ClassName == "Model" and v ~= thechar then
							local heed = v:findFirstChild("Head")
							if heed then
								if (heed.Position - handle.Position).magnitude < closestdist and (heed.Position - handle.Position).magnitude < 10 then
									closestdist = (heed.Position - handle.Position).magnitude
									WHO = v
								end
							end
						end
					end
					if WHO ~= nil then
						rootpart.CFrame = CFrame.new(rootpart.Position, Vector3.new(WHO.Head.Position.x, rootpart.Position.y, WHO.Head.Position.z))
					end
					local knockback = Instance.new("BodyVelocity", rootpart)
					knockback.MaxForce = Vector3.new(math.huge,0,math.huge)
					knockback.Velocity = rootpart.CFrame.lookVector * -8
					game.Debris:AddItem(knockback, 0.15)
				end
			end
			lasthp = charhum.Health
		end
	end)
	coroutine.wrap(function()
		while runservice.Stepped:wait() and equipped do
			rightarm.C0 = rightarm.C0:lerp(CFrame.new(1.40557981, 0.499999762, -0.579227924, 0.98480767, 0.173648134, 3.55271368e-15, -4.39884928e-08, 2.49471157e-07, -0.999999821, -0.173648134, 0.98480767, 2.5331974e-07),0.2)
			head.C0 = head.C0:lerp(CFrame.new(0, 1.49999976, 0, 0.173648208, 0, -0.98480767, 0, 0.999999881, 0, 0.98480767, 0, 0.173648208),0.2)
			humanoidrootpart.C0 = humanoidrootpart.C0:lerp(CFrame.new(0, 0, 0, 0.173648134, 0, 0.98480773, 0, 0.99999994, 0, -0.98480773, 0, 0.173648134),0.2)
		end
		head:destroy()
		humanoidrootpart:destroy()
		rightarm:destroy()
	end)()
end)