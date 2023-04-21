
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "😈 Clicker Madness! - NamKy Hub", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

_G.AutoTap = false

_G.AutoRebirth = false
_G.SelectReb = 1

_G.AutoEgg = true
_G.SelectEgg = 'basic'

_G.SelectWorlds = 'Lava'

_G.AutoFarmBoss = true

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
	plr.Character.Humanoid.WalkSpeed = 120
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
		wait(0.5)
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
Info:AddLabel("- Error And How To Fix -")
Info:AddParagraph("Error : Not Loaded","Fix : Wait Zombie Boss Spawn And Try Again")

AutoFarm:AddToggle({
	Name = "Auto Tap",
	Default = false,
	Callback = function(Value)
		_G.AutoTap = Value
        AutoClick()
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

AutoFarm:AddDropdown({
	Name = "Select Rebirth",
	Default = 1,
	Options = {1, 10, 100, 1000, 10000, 100000, 1000000, 10000000, 100000000, 1000000000, 10000000000},
	Callback = function(Value)
        _G.SelectReb = Value
	end    
})

AutoFarm:AddToggle({
	Name = "Auto Boss",
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

Misc:AddButton({
	Name = "Run Faster",
	Callback = function()
      		Sprit()
  	end    
})

OrionLib:Init()
