open = false

wait(0.1)
script.Parent.Main.Anchored = true

function onClicked()
	if script.Parent.OPEND.Value == 1 then

		if open == false then
			script.Parent.Main.Anchored = true
			local cfr = script.Parent.Main.CFrame
			open = true
			for i = 0,1.5,0.1 do
			wait(0.05) --close speed
			script.Parent.Main.CFrame = script.Parent.Main.CFrame*CFrame.fromEulerAnglesXYZ(0,-0.1,0)*CFrame.new(0.01,0,-0.25)
			end
		script.Parent.Main.CFrame = cfr*CFrame.fromEulerAnglesXYZ(0,-math.pi/2,0)*CFrame.new(-2.5,0,-2.5)
		script.Parent.Main.Anchored = true
		open = false
		script.Parent.OPEND.Value = 0
		end
	elseif script.Parent.OPEND.Value == 0 then

		if open == false then
			script.Parent.Main.Anchored = true
			local cfr = script.Parent.Main.CFrame
			open = true
			for i = 0,1.5,0.1 do
			wait(0.05) --open speed
			script.Parent.Main.CFrame = script.Parent.Main.CFrame*CFrame.fromEulerAnglesXYZ(0,0.1,0)*CFrame.new(-0.01,0,0.25)
			end
		script.Parent.Main.CFrame = cfr*CFrame.fromEulerAnglesXYZ(0,math.pi/2,0)*CFrame.new(-2.5,0,2.5)
		script.Parent.Main.Anchored = true
		open = false
		script.Parent.OPEND.Value = 1
		end

	end
end

script.Parent.ClickDetector.MouseClick:connect(onClicked)