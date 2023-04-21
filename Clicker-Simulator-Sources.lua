
	local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
	local Window = OrionLib:MakeWindow({Name = "😈 Clicker Madness! - Kers Hub", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

	_G.AutoTap = false

	_G.AutoRebirth = false
	_G.SelectReb = 1
	_G.AutoSuperRebirth = false
	_G.SelectAutoSPR = 1

	_G.AutoEgg = true
	_G.SelectEgg = 'basic'

	_G.SelectWorlds = 'Lava'

	_G.AutoFarmBoss = true

	_G.Speed = 18
	_G.Jump = 20

	function AutoClick()
		while _G.AutoTap == true do
			local args = {
				[1] = 1
			}
			
			game:GetService("ReplicatedStorage"):WaitForChild("Aero"):WaitForChild("AeroRemoteServices"):WaitForChild("ClickService"):WaitForChild("Click"):FireServer(unpack(args))
			wait(0)
		end
	end

	function AutoReb()
		while _G.AutoRebirth == true do
			local args = {
				[1] = _G.SelectReb
			}
			
			game:GetService("ReplicatedStorage"):WaitForChild("Aero"):WaitForChild("AeroRemoteServices"):WaitForChild("RebirthService"):WaitForChild("BuyRebirths"):FireServer(unpack(args))
			wait(1)
		end
	end

	function AutoSuperRB()
		while _G.AutoSuperRebirth == true do
			local args = {[1] = _G.SelectAutoSPR}
			game:GetService("ReplicatedStorage"):WaitForChild("Aero"):WaitForChild("AeroRemoteServices"):WaitForChild("RebirthService"):WaitForChild("BuySuperRebirths"):FireServer(unpack(args))
			wait(1)
		end
	end

	function AutoHatch()
		while _G.AutoEgg == true do
			local args = {
				[1] = _G.SelectEgg
			}
			
			game:GetService("ReplicatedStorage"):WaitForChild("Aero"):WaitForChild("AeroRemoteServices"):WaitForChild("EggService"):WaitForChild("Purchase"):FireServer(unpack(args))
			wait(1)
		end
	end

	function Teleporter(place)
		local player = game.Players.LocalPlayer;
		if player.Character then
			player.Character.HumanoidRootPart.CFrame = place
		end
	end
	function teleportworld()
		if game:GetService('Workspace').Worlds:FindFirstChild(_G.SelectWorlds) then
			Teleporter(game:GetService('Workspace').Worlds[_G.SelectWorlds].Teleport.CFrame)
		end
	end

	function Sprit()
		local plr = game.Players.LocalPlayer
		plr.Character.Humanoid.WalkSpeed = _G.Speed
	end

	function JumpHigh()
		local plr = game.Players.LocalPlayer
		plr.Character.Humanoid.JumpPower = _G.Jump
	end

	function AutoBoss()
		while _G.AutoFarmBoss == true do
			local plr = game.Players.LocalPlayer.Character
			local args = {
				[1] = "Zombie"
			}
			local zombie = game.Workspace.ScriptObjects.Zombie
			zombie.HumanoidRootPart.Anchored = true
			plr.HumanoidRootPart.CFrame= zombie.HumanoidRootPart.CFrame
			game:GetService("ReplicatedStorage"):WaitForChild("Aero"):WaitForChild("AeroRemoteServices"):WaitForChild("CursorCannonService"):WaitForChild("FireBoss"):FireServer(unpack(args))
			wait(0)
		end
	end

	local Info = Window:MakeTab({
		Name = "Info",
		Icon = "rbxassetid://4483345998",
		PremiumOnly = false
	})


	local AutoFarm = Window:MakeTab({
		Name = "Auto Farm",
		Icon = "rbxassetid://4483345998",
		PremiumOnly = false
	})
	local Pet = Window:MakeTab({
		Name = "Pet",
		Icon = "rbxassetid://4483345998",
		PremiumOnly = false
	})

	local Teleport = Window:MakeTab({
		Name = "Teleport",
		Icon = "rbxassetid://4483345998",
		PremiumOnly = false
	})

	local Misc = Window:MakeTab({
		Name = "Misc",
		Icon = "rbxassetid://4483345998",
		PremiumOnly = false
	})


	Info:AddLabel("- Made By Ngx_Hieeus")
	Info:AddLabel("- Version : 1.1 [ BETA ]")
	Info:AddParagraph("My Discord : Hieeus#8507", "Thanks For Use")
	Info:AddLabel("UPDATE !!!")
	Info:AddParagraph(" / 1 /", "Auto Farm Boss")
	Info:AddParagraph("/ 2 /", "Change Jump/Speed")
	Info:AddParagraph("/ 3 /", "Auto SPRB")

	AutoFarm:AddToggle({
		Name = "Auto Tap",
		Default = false,
		Callback = function(Value)
			_G.AutoTap = Value
			AutoClick()
		end    
	})

	AutoFarm:AddDropdown({
		Name = "Select Rebirth",
		Default = 1,
		Options = {1, 10, 100, 1000, 10000, 100000, 1000000, 10000000, 100000000, 1000000000, 10000000000},
		Callback = function(Value)
			_G.SelectReb = Value
		end    
	})

	AutoFarm:AddDropdown({
		Name = "Select Super Rebirth",
		Default = 1,
		Options = {1, 10, 100, 1000, 10000, 100000, 1000000, 10000000, 100000000, 1000000000, 10000000000},
		Callback = function(Value)
			_G.SelectAutoSPR = Value
		end
	
	})

	AutoFarm:AddToggle({
		Name = "Auto Rebirth",
		Default = false,
		Callback = function(Value)
			_G.AutoRebirth = Value
			AutoReb()
		end    
	})

	AutoFarm:AddToggle({
		Name = "Auto Super Rebirth",
		Default = false,
		Callback = function(Value)
			_G.AutoSuperRebirth = Value
			AutoSuperRB()
		end    
	})
	AutoFarm:AddToggle({
		Name = "Auto Farm Boss",
		Default = false,
		Callback = function(Value)
			_G.AutoFarmBoss = Value
			AutoBoss()
		end    
	})

	Pet:AddDropdown({
		Name = "Select Egg",
		Default = 'basic',
		Options = {'basic', 'lava', 'desert', 'toxic', 'ocean', 'winter', 'storm', 'forest', 'candy', 'space', 'blocky', 'fire', 'deluxe', 'lazarbeam', 'dominus', 'future', 'infinity', 'city', 'moon', 'halloween'},
		Callback = function(Value)
			_G.SelectEgg = Value
		end    
	})

	Pet:AddToggle({
		Name = "Auto Open",
		Default = false,
		Callback = function(Value)
			_G.AutoEgg = Value
			AutoHatch()
		end    
	})

	Teleport:AddDropdown({
		Name = "Select World",
		Default = 'Lava',
		Options = {'Lava', 'Desert', 'Toxic', 'Ocean', 'Winter', 'Storm', 'Forest', 'Candy', 'Space', 'Blocks', 'Fire', 'Future', 'Dominus', 'Infinity', 'City', 'Moon'},
		Callback = function(Value)
			_G.SelectWorlds = Value
			print(_G.SelectWorlds)
		end    
	})

	Teleport:AddButton({
		Name = "Teleport",
		Callback = function()
				teleportworld()
		end    
	})

	Misc:AddSlider({
		Name = "Speed",
		Min = 1,
		Max = 500,
		Default = 18,
		Color = Color3.fromRGB(255,255,255),
		Increment = 1,
		ValueName = "Speed",
		Callback = function(Value)
			_G.Speed = Value
		end    
	})

	Misc:AddButton({
		Name = "Change Speed",
		Callback = function()
				Sprit()
		end    
	})

	Misc:AddSlider({
		Name = "Jump",
		Min = 1,
		Max = 500,
		Default = 20,
		Color = Color3.fromRGB(255,255,255),
		Increment = 1,
		ValueName = "Jump",
		Callback = function(Value)
			_G.Speed = Value
		end    
	})

	Misc:AddButton({
		Name = "Change Jump",
		Callback = function()
				JumpHigh()
		end    
	})

	OrionLib:Init()
