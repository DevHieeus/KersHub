local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Tower of Hell - Kers Hub", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

KeyEnter = 0
RealKey = 15738915127895268914
Checking_Key = true
Nofi = false

function CheckKey()
    if tonumber(KeyEnter) == tonumber(RealKey) then
        print("Success")
        if Checking_Key == true then
            Nofi = true
            wait(3)
            loadstring(game:HttpGet("https://raw.githubusercontent.com/DevHieeus/KersHub/main/Tower%20Of%20Hell%20-%20Souces.lua",true))();
            Checking_Key = false
            return true
        end
    else
        Checking_Key = true
        return false
    end
end

local Key = Window:MakeTab({
    Name = "Check Key",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

Key:AddLabel("ENTER YOUR KEY")

Key:AddTextbox({
    Name = "KEY",
    Default = "Your Key",
    TextDisappear = false,
    Callback = function(Value)
            KeyEnter = tonumber(Value)
            print(KeyEnter)
    end	  
})

Key:AddButton({
    Name = "Check Key",
    Callback = function()
            CheckKey()
            print(CheckKey())
            print(type(RealKey), type(KeyEnter))
            OrionLib:MakeNotification({
                Name = "Notification - By Admin",
                Content = "Key Is Checking...",
                Image = "rbxassetid://4483345998",
                Time = 30
            })

            if Nofi == true then
                OrionLib:MakeNotification({
                    Name = "Notification - By Admin",
                    Content = "Correct Key !!!, Hub Is Loading...",
                    Image = "rbxassetid://4483345998",
                    Time = 30
                })
                OrionLib:Destroy()
            else
                OrionLib:MakeNotification({
                    Name = "Notification - By Admin",
                    Content = "Wrong Key !!!",
                    Image = "rbxassetid://4483345998",
                    Time = 30
                })

            end
    end    
})

OrionLib:Init()
