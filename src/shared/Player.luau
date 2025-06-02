local TweenService = game:GetService("TweenService")
local PlayerClass = {}
PlayerClass.__index = PlayerClass

function PlayerClass.new(localPlayer, defualtWalkSpeed, camera)
	local self = setmetatable({}, PlayerClass)
	self.camera = camera
	self.defualtWalkSpeed = defualtWalkSpeed
	self.localPlayer = localPlayer
	self.localCharacter = localPlayer.Character or localPlayer.CharacterAdded:Wait()
	self.humanoid = self.localCharacter:WaitForChild("Humanoid")
	self.animator = self.humanoid:WaitForChild("Animator")
	self.animations = {}
	return self
end

function PlayerClass:SetUpAnimations()
	local runAnimation = Instance.new("Animation")
	runAnimation.AnimationId = "rbxassetid://129774390230861"
	local runAnimationTrack = self.animator:LoadAnimation(runAnimation)
	self.animations = { runAnimationTrack = runAnimationTrack }
end

function PlayerClass:HandleInputBegan(input, __gameProcessed)
	if input.UserInputType == Enum.UserInputType.Keyboard then
		if input.KeyCode == Enum.KeyCode.LeftShift then
			print("leftShift")
			self.animations["runAnimationTrack"]:Play()
			self.humanoid.WalkSpeed = 30
			local Properties = { FieldOfView = 80 }
			TweenService:Create(self.camera, TweenInfo.new(0.5), Properties):Play()
		end
	end
end

function PlayerClass:HandleInputEnded(input, __gameProcessed)
	if input.UserInputType == Enum.UserInputType.Keyboard then
		if input.KeyCode == Enum.KeyCode.LeftShift then
			print("leftShift stop")
			self.animations["runAnimationTrack"]:Stop()
			self.humanoid.WalkSpeed = self.defualtWalkSpeed
			local Properties = { FieldOfView = 70 }
			TweenService:Create(self.camera, TweenInfo.new(0.5), Properties):Play()
		end
	end
end

return PlayerClass
