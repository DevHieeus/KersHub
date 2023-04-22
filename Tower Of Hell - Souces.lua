local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Tower of Hell - Kers Hub", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

_G.JumpP = 20
_G.WalkS = 20
_G.AutoFarmCoins = false
_G.Delay = 30
function Jump()
    local plr = game.Players.LocalPlayer
    plr.Character.Humanoid.JumpPower = _G.JumpP
end

function Speed()
	local plr = game.Players.LocalPlayer
	plr.Character.Humanoid.WalkSpeed = _G.WalkS
end

function Teleport()
	local part = game.Workspace.tower.sections.finish.FinishGlow
	local plr = game.Players.LocalPlayer
	plr.Character.HumanoidRootPart.CFrame = part.CFrame
end

function AutoFarm()
	while _G.AutoFarmCoins do
		local part = game.Workspace.tower.sections.finish.FinishGlow
		local plr = game.Players.LocalPlayer
		plr.Character.HumanoidRootPart.CFrame = part.CFrame
		wait(_G.Delay)
	end
end

local Info = Window:MakeTab({
	Name = "Info",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Main = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Info:AddLabel("- Made By Ngx_Hieeus")
Info:AddLabel("- Version : 1.0 [ BETA ]")
Info:AddParagraph("My Discord : Hieeus#8507", "Thanks For Use")
Info:AddParagraph("How to avoid ban ?", "Don't spam teleport to win !!!")

Main:AddParagraph("ENTER DELAY", "RECOMMEND : 30S TO AVOID BAN")


Main:AddTextbox({
	Name = "Delay",
	Default = 30,
	TextDisappear = true,
	Callback = function(Value)
		_G.Delay = Value
	end	  
})


Main:AddToggle({
	Name = "Auto Farm Coins",
	Default = false,
	Callback = function(Value)
		_G.AutoFarmCoins = Value
		AutoFarm()
	end    
})

Main:AddSlider({
	Name = "JumpPower",
	Min = 1,
	Max = 500,
	Default = 20,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "Jump",
	Callback = function(Value)
		_G.JumpP = Value
	end    
})

Main:AddButton({
	Name = "Change Jump",
	Callback = function()
			Jump()
	end    
})

Main:AddSlider({
	Name = "Speed",
	Min = 1,
	Max = 500,
	Default = 20,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "Speed",
	Callback = function(Value)
		_G.WalkS = Value
	end    
})

Main:AddButton({
	Name = "Change Speed",
	Callback = function()
			Speed()
	end    
})


Main:AddButton({
	Name = "Teleport To Victory Floor",
	Callback = function()
			Teleport()
	end    
})

OrionLib:MakeNotification({
	Name = "Notification",
	Content = "GUi Loaded - Thanks For Use My Hub !!!",
	Image = "rbxassetid://4483345998",
	Time = 30
})


OrionLib:Init()
