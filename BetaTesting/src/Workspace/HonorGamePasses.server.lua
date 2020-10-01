local DataStoreService = game:GetService("DataStoreService")
local inventory = DataStoreService:GetDataStore("PlayerInventory")
local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")

local gamePassShieldID = 11633700  -- Change this to your game pass ID

local function onPromptGamePassPurchaseFinished(player, purchasedPassID, purchaseSuccess)
	
	if purchaseSuccess == true and purchasedPassID == gamePassShieldID then
		--save sheild to player's inventory
		inventory:SetAsync(player.Name .. "_shield", true)
		player.PlayerGui.Shop.Frame.ScrollingFrame.ShieldBtn.Visible = false
		player.PlayerGui.Shop.Frame.ScrollingFrame.ShieldLabel.Visible = true
		player.PlayerGui.Shop.Frame.ScrollingFrame.AllSoldLabel.Visible = true
	end
end

MarketplaceService.PromptGamePassPurchaseFinished:Connect(onPromptGamePassPurchaseFinished)

local function onPlayerAdded(player)
	
	local hasPass = false
	
	-- Check if the player already owns the game pass
	local success, message = pcall(function()
		hasPass = MarketplaceService:UserOwnsGamePassAsync(player.UserId, gamePassShieldID)
	end)
	
	-- If there's an error, issue a warning and exit the function
	if not success then
		warn("Error while checking if player has pass: " .. tostring(message))
		return
	end
	
	if hasPass == true then
		print(player.Name .. " owns the shield game pass with ID " .. gamePassShieldID)
		-- Assign this player the ability or bonus related to the game pass
		--

		player.CharacterAdded:Connect(function()
			local backpack = player:WaitForChild("Backpack")
			local cloneTool = game.ServerStorage.Shield:Clone()
			cloneTool.Parent = backpack
		end)
	else
		inventory:RemoveAsync(player.Name .. "_shield")
	end
end

-- Connect "PlayerAdded" events to the "onPlayerAdded()" function
Players.PlayerAdded:Connect(onPlayerAdded)