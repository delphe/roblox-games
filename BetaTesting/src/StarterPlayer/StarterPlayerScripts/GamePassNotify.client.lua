local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")

local HasGamepassChecker = require(ReplicatedStorage:WaitForChild("HasGamepassChecker"))

local retryRequest = HasGamepassChecker.retryRequest
local RETRY_PROMPT_DURATION = 5

retryRequest.OnClientInvoke = function(title, text, button)
	local retry = false
	local callback = Instance.new("BindableFunction")
	callback.OnInvoke = function(clickedButton)
		if clickedButton == button then
			retry = true
		end
	end
	
	StarterGui:SetCore("SendNotification", {
		Title = title,
		Text = text,
		Icon = "",
		Duration = RETRY_PROMPT_DURATION,
		Callback = callback,
		Button1 = button
	})
	
	local start = tick()
	while tick() - start < RETRY_PROMPT_DURATION + 2 and not retry do
		wait()
	end
	return retry
end