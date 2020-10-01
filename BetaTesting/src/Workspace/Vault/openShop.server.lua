local DataStoreService = game:GetService("DataStoreService")
local inventory = DataStoreService:GetDataStore("PlayerInventory")

script.Parent.CD.MouseClick:connect(function(Player)
	local shieldInInventory = inventory:GetAsync(Player.Name .. "_shield")
	if (shieldInInventory == true) then
		-- already has shield in inventory. Hide the purchase shield button
		script.Parent.Shop.Frame.ScrollingFrame.ShieldBtn.Visible = false
		script.Parent.Shop.Frame.ScrollingFrame.ShieldLabel.Visible = true
		script.Parent.Shop.Frame.ScrollingFrame.AllSoldLabel.Visible = true
	end	
	
	script.Parent.Shop:Clone().Parent = Player.PlayerGui
end)