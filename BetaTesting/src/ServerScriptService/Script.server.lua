local MarketplaceService = game:GetService("MarketplaceService")

local gamePassID = 11633700  -- Change this to your game pass ID

-- Function to handle a completed prompt and purchase
local function onPromptGamePassPurchaseFinished(player, purchasedPassID, purchaseSuccess)
	
	if purchaseSuccess == true and purchasedPassID == gamePassID then
		print(player.Name .. " purchased the game pass with ID " .. gamePassID)
		-- Assign this player the ability or bonus related to the game pass
		--

		local backpack = player:WaitForChild("Backpack")
		local cloneTool = game.ServerStorage.Shield:Clone()
		cloneTool.Parent = backpack

	end
end

-- Connect "PromptGamePassPurchaseFinished" events to the "onPromptGamePassPurchaseFinished()" function
MarketplaceService.PromptGamePassPurchaseFinished:Connect(onPromptGamePassPurchaseFinished)