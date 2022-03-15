

-- Tables, Functions, Etc
local EggTable = {}
local ZoneTable = {}

for _,Egg in pairs(game:GetService("Workspace").Eggs:GetChildren()) do
    table.insert(EggTable, Egg.Name)
end
for _,Zone in pairs(game:GetService("Workspace").Zones:GetChildren()) do
    table.insert(ZoneTable, Zone.Name)
end
 function questsA()
    local args = {
        [1] = "A"
    }
    game:GetService("ReplicatedStorage").Events.Client.claimQuest:FireServer(unpack(args))
end
 
 function questsB()
    local args = {
        [1] = "B"
    }
    game:GetService("ReplicatedStorage").Events.Client.claimQuest:FireServer(unpack(args))
end
 function questsC()
    local args = {
        [1] = "C"
    }
    game:GetService("ReplicatedStorage").Events.Client.claimQuest:FireServer(unpack(args))
end
 function questsD()
    local args = {
        [1] = "D"
    }
    game:GetService("ReplicatedStorage").Events.Client.claimQuest:FireServer(unpack(args))
end
 function questsE()
    local args = {
        [1] = "E"
    }
    game:GetService("ReplicatedStorage").Events.Client.claimQuest:FireServer(unpack(args))
end
 function questsF()
    local args = {
        [1] = "F"
    }
    game:GetService("ReplicatedStorage").Events.Client.claimQuest:FireServer(unpack(args))
end
 function questsG()
    local args = {
        [1] = "G"
    }
    game:GetService("ReplicatedStorage").Events.Client.claimQuest:FireServer(unpack(args))
end
 function questsH()
    local args = {
        [1] = "H"
    }
    game:GetService("ReplicatedStorage").Events.Client.claimQuest:FireServer(unpack(args))
end
 function questsI()
    local args = {
        [1] = "I"
    }
    game:GetService("ReplicatedStorage").Events.Client.claimQuest:FireServer(unpack(args))
 end
 function questsJ()
    local args = {
        [1] = "J"
    }
    game:GetService("ReplicatedStorage").Events.Client.claimQuest:FireServer(unpack(args))
 end
 function questsK()
    local args = {
        [1] = "K"
    }
    game:GetService("ReplicatedStorage").Events.Client.claimQuest:FireServer(unpack(args))
 end
 function questsL()
    local args = {
        [1] = "L"
    }
    game:GetService("ReplicatedStorage").Events.Client.claimQuest:FireServer(unpack(args))
end
 function questsM()
    local args = {
        [1] = "M"
    }
    game:GetService("ReplicatedStorage").Events.Client.claimQuest:FireServer(unpack(args))
end
 function questsN()
local args = {
        [1] = "N"
    }
    game:GetService("ReplicatedStorage").Events.Client.claimQuest:FireServer(unpack(args))
end


-- Anti AFK
game:GetService("Players").LocalPlayer.Idled:connect(function()
	game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
	wait(1)
	game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

local RebirthTable = {1,5,10,50,250,1000,5000,25000,125000,500000,3000000,15000000,50000000,250000000,1000000000,5000000000,25000000000,50000000000,150000000000,750000000000,3500000000000}

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/ScriptRUs/GhostHub/main/UiLib.lua"))()

local gui = Library:create{
    Theme = Library.Themes.Dark
}

local Main = gui:tab{
    Icon = "",
    Name = "Main"
}
local Pets = gui:tab{
    Icon = "",
    Name = "Pets"
}
local Teleports = gui:tab{
    Icon = "",
    Name = "Teleports"
}
local Misc = gui:tab{
    Icon = "",
    Name = "Misc"
}


Main:Toggle{
    Name = "Auto Click",
    StartingState = getgenv().settings.ClickerSim.Autofarm,
    Callback = function(Vals)
        getgenv().settings.ClickerSim.Autofarm = Vals
    end
}
Main:Toggle{
    Name = "Collect Gifts",
    StartingState = getgenv().settings.ClickerSim.CollectGifts,
    Callback = function(Vals)
        getgenv().settings.ClickerSim.CollectGifts = Vals
    end
}
Main:Button{
    Name = "Auto Rebirths",
    Callback = function()
        print("")
    end
}
Main:Toggle{
    Name = "Auto Rebirth",
    StartingState = getgenv().settings.ClickerSim.AutoRebirth,
    Callback = function(Vals)
        getgenv().settings.ClickerSim.AutoRebirth = Vals
    end
}
Main:Dropdown{
	Name = "Rebirth Amounts",
	StartingText = getgenv().settings.ClickerSim.RebirthAmount,
	Description = nil,
	Items = RebirthTable,
	Callback = function(item)
        getgenv().settings.ClickerSim.RebirthAmount = item
    end
}
Main:Button{
    Name = "Claims & Buys",
    Callback = function()
        print("")
    end
}
Main:Toggle{
    Name = "Claim Achivements", 
    StartingState = getgenv().settings.ClickerSim.AutoClaimAchiev,
    Callback = function(Vals)
        getgenv().settings.ClickerSim.AutoClaimAchiev = Vals
    end
}
Main:Toggle{
    Name = "Claim Chests",
    StartingState = getgenv().settings.ClickerSim.ClaimChests,
    Callback = function(Vals)
        getgenv().settings.ClickerSim.ClaimChests = Vals
    end
}
Main:Toggle{
    Name = "Buy Rebirth Pets",
    StartingState = getgenv().settings.ClickerSim.BuyRebirthPets,
    Callback = function(Vals)
        getgenv().settings.ClickerSim.BuyRebirthPets = Vals
    end
}

Pets:Toggle{
    Name = "Auto Eggs",
    StartingState = getgenv().settings.ClickerSim.BuyEggs,
    Callback = function(Vals)
        getgenv().settings.ClickerSim.BuyEggs = Vals
    end
}
Pets:Dropdown{
	Name = "Select Egg",
	StartingText = getgenv().settings.ClickerSim.EggSelected,
	Description = nil,
	Items = EggTable,
	Callback = function(item)
        getgenv().settings.ClickerSim.EggSelected = item
    end
}
Pets:Button{
    Name = "Auto Combines",
    Callback = function()
        print("")
    end
}
Pets:Toggle{
    Name = "Auto Shiny",
    StartingState = getgenv().settings.ClickerSim.CombineShinys,
    Callback = function(Vals)
        getgenv().settings.ClickerSim.CombineShinys = Vals
    end
}
Tab:Textbox{
	Name = "Pet Name To Combine",
	Callback = function(text) 
        CombinePetName = text
    end
}


Teleports:Dropdown{
	Name = "Zone Teleports",
	Description = nil,
	Items = ZoneTable,
	Callback = function(item)
        getgenv().settings.ClickerSim.EggSelected = item
    end
}
Teleports:Button{
    Name = "Tp Main Zone",
    Callback = function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Lobby.teleport.CFrame
    end
}
Teleports:Button{
    Name = "Tp Tech Zone",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").techWorld.Portal.teleportPosition.CFrame
    end
}

Misc:Button{
    Name = "Unlock Gamepasses",
    Callback = function()
    game:GetService("ReplicatedStorage").boostsActive.freeAutoHatch.Value = true
    game:GetService("ReplicatedStorage").boostsActive.x2Clicks.Value = true
    game:GetService("ReplicatedStorage").boostsActive.freeDoubleLuck.Value = true
    end
}
Misc:Button{
    Name = "Save Settings",
    Callback = function()
        saveSettings()
    end
}
-- Script Functioning Parts/Toggles
spawn(function()
    while true do wait()
        if getgenv().settings.ClickerSim.Autofarm then
            getsenv(game:GetService("Players").LocalPlayer.PlayerGui.mainUI.LocalScript).activateClick()
        end
    end
end)
spawn(function()
    while true do wait()
        if getgenv().settings.ClickerSim.BuyEggs then
            local ohInstance1 = workspace.Eggs[getgenv().settings.ClickerSim.EggSelected]
            local ohBoolean2 = false
            local ohBoolean3 = false
            game:GetService("ReplicatedStorage").Events.Client.purchaseEgg2:InvokeServer(ohInstance1, ohBoolean2, ohBoolean3)
        end
    end
end)


spawn(function()
    while true do wait(0.3)
        if getgenv().settings.ClickerSim.CombineShinys then
            local ohString1 = CombinePetName
            local ohNumber2 = 1
            game:GetService("ReplicatedStorage").Events.Client.upgradePet:FireServer(ohString1, ohNumber2, ohInstance3)
        end
    end
end)
spawn(function()
    while true do wait(0.1)
        if getgenv().settings.ClickerSim.CollectGifts then
            game:GetService("ReplicatedStorage").Events.Client.collectGifts:FireServer()
        end
    end
end)
spawn(function()
    while true do wait(0.1)
        if getgenv().settings.ClickerSim.AutoClaimAchiev then
            questsA()
            questsB()
            questsC()
            questsD()
            questsE()
            questsF()
            questsG()
            questsH()
            questsI()
            questsJ()
            questsK()
            questsL()
            questsM()
            questsN()
        end
    end
end)
spawn(function()
    while true do wait(0.1)
        if getgenv().settings.ClickerSim.AutoClaimAchiev then
            for i,v in pairs(game:GetService("Workspace").Chests:GetChildren()) do
                game:GetService("ReplicatedStorage").Events.Client.claimChestReward:InvokeServer(v.Name)
            end
        end
    end
end)
spawn(function()
    while true do wait(0.1)
        if getgenv().settings.ClickerSim.BuyRebirthPets then
            for i,v in pairs(game:GetService("ReplicatedStorage").Pets.Rebirth:GetChildren()) do
                 game:GetService("ReplicatedStorage").Events.Client.purchaseRebirthShopItem:FireServer(v.Name)
            end
        end
    end
end)
spawn(function()
    while true do wait(0)
        if getgenv().settings.ClickerSim.AutoRebirth then
            game:GetService("ReplicatedStorage").Events.Client.requestRebirth:FireServer(getgenv().settings.ClickerSim.RebirthAmount, false, false)
        end
    end
end)
