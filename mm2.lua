local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = 'MM2 Egg Hunt [BETA] - Kers Hub', HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})


local plr = game.Players.LocalPlayer.Character
local map = game.Workspace:GetChildren()

local tween_s = game:GetService('TweenService')
local tweeninfo = TweenInfo.new(1,Enum.EasingStyle.Linear)

local lp = game.Players.LocalPlayer

_G.AutoFE = false
_G.Delay = 3
_G.TotalEgg = 0

function Bypass_teleport(v)
    if lp.Character and lp.Character:FindFirstChild('HumanoidRootPart') then
        local cf = CFrame.new(v)
        local a = tween_s:Create(lp.Character.HumanoidRootPart,tweeninfo,{CFrame=cf})
        a:Play()
        a.Completed:Wait()
    end
end


function SetUpEggs()
    for i, v in ipairs(map) do
        if v:FindFirstChild('CoinContainer') then
            local coins = v:FindFirstChild('CoinContainer')
            local getcoins = coins:GetChildren()
            for j, k in ipairs(getcoins) do
                if k.Name == "Coin_Server" then
                    if k.BrickColor == BrickColor.new('Medium stone gray') then
                        return k.position
                    end
                else
                    print('No Coins')
                end
            end
        end
    end
end

function AutoFarmEggs()
    while _G.AutoFE == true do
        local AutoEggs = SetUpEggs()
        Bypass_teleport(AutoEggs)
        _G.TotalEgg = _G.TotalEgg + 1
        wait(_G.Delay)
    end
end

function CheckTotalEgg()
    OrionLib:MakeNotification({
        Name = "Check Total Egg !",
        Content = "Total Egg : " .. tostring( _G.TotalEgg),
        Image = "rbxassetid://4483345998",
        Time = 5
    })
end


local Main = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Main:AddLabel('You should use this hub in clone account!')
Main:AddLabel('DM me if you find error (Hieeus#8507)')

Main:AddSlider({
	Name = "Set Delay",
	Min = 1,
	Max = 15,
	Default = 3,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "Delay",
	Callback = function(Value)
		_G.Delay = Value
	end    
})

Main:AddToggle({
	Name = "Auto Farm Eggs",
	Default = false,
	Callback = function(Value)
		_G.AutoFE = Value
		AutoFarmEggs()
	end    
})

Main:AddButton({
	Name = "Check Total Egg Collected",
	Callback = function()
			CheckTotalEgg()
	end    
})

OrionLib:Init()
