local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")
local Frame = script.Parent.Frame
local shieldBtn = Frame.ScrollingFrame.ShieldBtn
local gamePassShieldID = 11633700  -- Change this to your game pass ID

shieldBtn.MouseButton1Click:Connect(function()
	local player = Players.LocalPlayer
	local hasPass = false
	
	local success, message = pcall(function()
		hasPass = MarketplaceService:UserOwnsGamePassAsync(player.UserId, gamePassShieldID)
	end)
	
	if not success then
		warn("Error while checking if player has pass: " .. tostring(message))
		return
	end
	
	if hasPass then
		print("has pass - the script behavior is different when running from a test server!")
		-- Player already owns the game pass.
		-- Note: This doesn't seem to work when running on the test server
		--   Using HonorGamePasses script to save inventory to DataStoreService
	else
		-- Player does NOT own the game pass; prompt them to purchase
		MarketplaceService:PromptGamePassPurchase(player, gamePassShieldID)
	end
end)