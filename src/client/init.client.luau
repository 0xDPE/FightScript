local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterPlayer = game:GetService("StarterPlayer")
local UIS = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")

local Shared = ReplicatedStorage:WaitForChild("Shared")
local localPlayer = Players.LocalPlayer

local playerClass = require(Shared:WaitForChild("Player"))
local playerObj = playerClass.new(localPlayer, StarterPlayer.CharacterWalkSpeed, Workspace.CurrentCamera)

playerObj:SetUpAnimations()

UIS.InputBegan:Connect(function(input, gameProcessed)
	playerObj:HandleInputBegan(input, gameProcessed)
end)

UIS.InputEnded:Connect(function(input, gameProcessed)
	playerObj:HandleInputEnded(input, gameProcessed)
end)
