local plist = {
    "Spawn - 180",
    "SAO - 350"
}

local RebirthList = {
    "1",
    "5",
    "15",
    "25",
    "45",
    "75",
    "140",
    "350",
    "850",
    "1.5K",
    "4.5K",
    "8.5K",
    "15K",
    "125K",
    "650K",
    "3.5M",
    "65M",
    "890M",
    "75B",
    "3T",
    "15T",
    "95T",
    "2qd",
    "15qd",
    "85qd",
    "185qd",
    "5Qn",
    "25Qn",
    "850Qn",
    "5sx",
    "15sx",
    "75sx",
    "150sx",
    "300sx",
    "450sx",
    "600sx",
    "750sx",
    "1.05Sp",
    "1.27Sp",
    "1.35Sp",
    "1.65Sp"
}



local AreaTable = {}
local EggTable = {}
local BuyAreaTable = {}
for i,v in pairs(game:GetService("Workspace")["__SETTINGS"]["__EGG"]:GetChildren()) do
    table.insert(EggTable, v.Name)
end
for i,v in pairs(game:GetService("Workspace")["__SETTINGS"]["__AREAS"]:GetChildren()) do
    table.insert(AreaTable, v.Name)
end
for i,v in pairs(game:GetService("Workspace")["__SETTINGS"]["__AREAS"]:GetChildren()) do
    table.insert(BuyAreaTable, v.Name)
end

local Mercury = loadstring(game:HttpGet("https://raw.githubusercontent.com/deeeity/mercury-lib/master/src.lua"))()

local GUI = Mercury:Create{
    Name = "Mercury",
    Size = UDim2.fromOffset(600, 400),
    Theme = Mercury.Themes.Dark,
    Link = "https://github.com/deeeity/mercury-lib"
}

local Main = GUI:Tab{
	Name = "Main",
	Icon = ""
}
local Pets = GUI:Tab{
	Name = "Pets",
	Icon = ""
}
local Teleports = GUI:Tab{
    Name = "Teleports",
    Icon = ""
}
local Misc = GUI:Tab{
    Name = "Misc",
    Icon = ""
}
Main:Toggle{
    Name = "Auto Tap",
    StartingState = getgenv().settings.AnimePunching.Autotap,
    Callback = function(Vals)
        getgenv().settings.AnimePunching.Autotap = Vals
    end
}
Main:Toggle{
    Name = "Auto Rebirth",
    StartingState = getgenv().settings.AnimePunching.AutoRebirth,
    Callback = function(Vals)
        getgenv().settings.AnimePunching.AutoRebirth = Vals
    end
}
Main:Dropdown{
	Name = "Rebirth Selects",
	StartingText = getgenv().settings.AnimePunching.RebirthAmounts,
	Description = nil,
	Items = RebirthList,
	Callback = function(Values)
        getgenv().settings.AnimePunching.RebirthAmounts = Values
    end
}
Main:Button{
    Name = "Misc In Main",
    Callback = function()
        print("")
    end
}

Main:Toggle{
    Name = "Auto Pratice",
    StartingState = getgenv().settings.AnimePunching.Pratice,
    Callback = function(Vals)
        getgenv().settings.AnimePunching.Pratice = Vals
    end
}
Main:Dropdown{
	Name = "Pratice Area",
	StartingText = getgenv().settings.AnimePunching.PraticeArea,
	Description = nil,
	Items = plist,
	Callback = function(Values)
        getgenv().settings.AnimePunching.PraticeArea = Values
    end
}
Main:Toggle{
    Name = "Farm Boss",
    StartingState = getgenv().settings.AnimePunching.FarmBoss,
    Callback = function(Vals)
        getgenv().settings.AnimePunching.FarmBoss = Vals
    end
}

Pets:Toggle{
    Name = "Open Eggs",
    StartingState = getgenv().settings.AnimePunching.OpenEgg,
    Callback = function(Vals)
        getgenv().settings.AnimePunching.OpenEgg = Vals
    end
}
Pets:Dropdown{
	Name = "Select Egg",
	StartingText = getgenv().settings.AnimePunching.SelectEgg,
	Description = nil,
	Items = plist,
	Callback = function(Values)
        getgenv().settings.AnimePunching.SelectEgg = Values
    end
}
Pets:Toggle{
    Name = "Auto Equip",
    StartingState = getgenv().settings.AnimePunching.EquipBest,
    Callback = function(Vals)
        getgenv().settings.AnimePunching.EquipBest = Vals
    end
}
Teleports:Dropdown{
	Name = "Area Teleports",
	Description = nil,
	Items = AreaTable,
	Callback = function(Values)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace")["__SETTINGS"]["__AREAS"][Values].CFrame
    end
}
Teleports:Dropdown{
	Name = "Buy Areas",
	Description = nil,
	Items = BuyAreaTable,
	Callback = function(Values)
        local ohString1 = "Areas"
        local ohString2 = Values
        game:GetService("ReplicatedStorage").Remotes.ClientRemote:InvokeServer(ohString1, ohString2)
    end
}

Misc:Toggle{
    Name = "Claim Group Rewards",
    StartingState = getgenv().settings.AnimePunching.GroupReward,
    Callback = function(Vals)
        getgenv().settings.AnimePunching.GroupReward = Vals
    end
}
Misc:Button{
    Name = "Save Settings",
    Callback = function()
        saveSettings()
    end
}
spawn(function()
    while true do wait(0.1)
        if getgenv().settings.AnimePunching.EquipBest then
            game:GetService("ReplicatedStorage").Remotes.NPCSystem:FireServer("EquipBest")
        end
    end
end)

spawn(function()
    while true do wait()
        if getgenv().settings.AnimePunching.OpenEgg then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Workspace")["__SETTINGS"]["__EGG"][getgenv().settings.AnimePunching.SelectEgg].EGG.Position)
                keypress(0x45)
                wait(0.5)
            firesignal(game:GetService("Players").LocalPlayer.PlayerGui.Ui.CenterFrame.BuyEgg.Frame.Buy1.Button.MouseButton1Click)
            wait(0.3)
        end
    end
end)
spawn(function()
    while true do wait()
        if getgenv().settings.AnimePunching.Pratice then
            if getgenv().settings.AnimePunching.PraticeArea == "Spawn - 180" then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(62, 23, 253)
                local args = {[1] = "Practice",[2] = workspace.__SETTINGS.__INTERACT.Spawnp}
                game:GetService("ReplicatedStorage").Remotes.ClientRemote:InvokeServer(unpack(args))
            elseif getgenv().settings.AnimePunching.PraticeArea == "SAO - 350" then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-56322, 62, -7636)
                local args = {[1] = "Practice",[2] = workspace.__SETTINGS.__INTERACT.SAOp}
                game:GetService("ReplicatedStorage").Remotes.ClientRemote:InvokeServer(unpack(args))
            end
        end
    end
end)
spawn(function()
    while true do wait()
        if getgenv().settings.AnimePunching.FarmBoss == true then
            game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace")["__SETTINGS"]["__BOSS"].HitBox.CFrame
        elseif getgenv().settings.AnimePunching.FarmBoss == false then
            game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
            wait()
        end
    end
end)
spawn(function()
    while true do wait(0.4)
        if getgenv().settings.AnimePunching.GroupReward then
            game:GetService("ReplicatedStorage").Remotes.ClientRemote:InvokeServer("GroupChest")
        end
    end
end)
spawn(function()
    while true do wait()
        if getgenv().settings.AnimePunching.Autotap then
            game:GetService("ReplicatedStorage").Remotes.TappingEvent:FireServer()
        end
    end
end)
spawn(function()
    while true do wait(0.6)
        if Rebirther then
if  getgenv().settings.AnimePunching.RebirthAmounts == "1" then
local args = {[1] = "Rebirths",[2] = 1}
game:GetService("ReplicatedStorage").Remotes.ClientRemote:InvokeServer(unpack(args))
elseif  getgenv().settings.AnimePunching.RebirthAmounts == "5" then
 local args = {[1] = "Rebirths",[2] = 2}
game:GetService("ReplicatedStorage").Remotes.ClientRemote:InvokeServer(unpack(args))   
elseif  getgenv().settings.AnimePunching.RebirthAmounts == "15" then
 local args = {[1] = "Rebirths",[2] = 3}
game:GetService("ReplicatedStorage").Remotes.ClientRemote:InvokeServer(unpack(args))   
elseif  getgenv().settings.AnimePunching.RebirthAmounts == "25" then
 local args = {[1] = "Rebirths",[2] = 4}
game:GetService("ReplicatedStorage").Remotes.ClientRemote:InvokeServer(unpack(args))   
elseif  getgenv().settings.AnimePunching.RebirthAmounts == "45" then
 local args = {[1] = "Rebirths",[2] = 5}
game:GetService("ReplicatedStorage").Remotes.ClientRemote:InvokeServer(unpack(args))   
elseif  getgenv().settings.AnimePunching.RebirthAmounts == "75" then
 local args = {[1] = "Rebirths",[2] = 6}
game:GetService("ReplicatedStorage").Remotes.ClientRemote:InvokeServer(unpack(args))   
elseif  getgenv().settings.AnimePunching.RebirthAmounts == "140" then
 local args = {[1] = "Rebirths",[2] = 7}
game:GetService("ReplicatedStorage").Remotes.ClientRemote:InvokeServer(unpack(args))   
elseif  getgenv().settings.AnimePunching.RebirthAmounts == "350" then
 local args = {[1] = "Rebirths",[2] = 8}
game:GetService("ReplicatedStorage").Remotes.ClientRemote:InvokeServer(unpack(args))   
elseif  getgenv().settings.AnimePunching.RebirthAmounts == "850" then
 local args = {[1] = "Rebirths",[2] = 9}
game:GetService("ReplicatedStorage").Remotes.ClientRemote:InvokeServer(unpack(args))   
elseif  getgenv().settings.AnimePunching.RebirthAmounts == "1.5K" then
 local args = {[1] = "Rebirths",[2] = 10}
game:GetService("ReplicatedStorage").Remotes.ClientRemote:InvokeServer(unpack(args))   
elseif  getgenv().settings.AnimePunching.RebirthAmounts == "4.5K" then
 local args = {[1] = "Rebirths",[2] = 11}
game:GetService("ReplicatedStorage").Remotes.ClientRemote:InvokeServer(unpack(args))   
elseif  getgenv().settings.AnimePunching.RebirthAmounts == "8.5K" then
 local args = {[1] = "Rebirths",[2] = 12}
game:GetService("ReplicatedStorage").Remotes.ClientRemote:InvokeServer(unpack(args))   
elseif  getgenv().settings.AnimePunching.RebirthAmounts == "15K" then
 local args = {[1] = "Rebirths",[2] = 13}
game:GetService("ReplicatedStorage").Remotes.ClientRemote:InvokeServer(unpack(args))   
elseif  getgenv().settings.AnimePunching.RebirthAmounts == "125K" then
 local args = {[1] = "Rebirths",[2] = 14}
game:GetService("ReplicatedStorage").Remotes.ClientRemote:InvokeServer(unpack(args))   
elseif  getgenv().settings.AnimePunching.RebirthAmounts == "650K" then
 local args = {[1] = "Rebirths",[2] = 15}
game:GetService("ReplicatedStorage").Remotes.ClientRemote:InvokeServer(unpack(args))   
elseif  getgenv().settings.AnimePunching.RebirthAmounts == "3.5M" then
 local args = {[1] = "Rebirths",[2] = 16}
game:GetService("ReplicatedStorage").Remotes.ClientRemote:InvokeServer(unpack(args))   
elseif  getgenv().settings.AnimePunching.RebirthAmounts == "65M" then
 local args = {[1] = "Rebirths",[2] = 17}
game:GetService("ReplicatedStorage").Remotes.ClientRemote:InvokeServer(unpack(args))   
elseif  getgenv().settings.AnimePunching.RebirthAmounts == "890M" then
 local args = {[1] = "Rebirths",[2] = 18}
game:GetService("ReplicatedStorage").Remotes.ClientRemote:InvokeServer(unpack(args))   
elseif  getgenv().settings.AnimePunching.RebirthAmounts == "75B" then
 local args = {[1] = "Rebirths",[2] = 19}
game:GetService("ReplicatedStorage").Remotes.ClientRemote:InvokeServer(unpack(args))   
elseif  getgenv().settings.AnimePunching.RebirthAmounts == "3T" then
 local args = {[1] = "Rebirths",[2] = 20}
game:GetService("ReplicatedStorage").Remotes.ClientRemote:InvokeServer(unpack(args))   
elseif  getgenv().settings.AnimePunching.RebirthAmounts == "15T" then
 local args = {[1] = "Rebirths",[2] = 21}
game:GetService("ReplicatedStorage").Remotes.ClientRemote:InvokeServer(unpack(args))   
elseif  getgenv().settings.AnimePunching.RebirthAmounts == "95T" then
 local args = {[1] = "Rebirths",[2] = 22}
game:GetService("ReplicatedStorage").Remotes.ClientRemote:InvokeServer(unpack(args))   
elseif  getgenv().settings.AnimePunching.RebirthAmounts == "2qd" then
 local args = {[1] = "Rebirths",[2] = 23}
game:GetService("ReplicatedStorage").Remotes.ClientRemote:InvokeServer(unpack(args))   
elseif  getgenv().settings.AnimePunching.RebirthAmounts == "15qd" then
 local args = {[1] = "Rebirths",[2] = 24}
game:GetService("ReplicatedStorage").Remotes.ClientRemote:InvokeServer(unpack(args))   
elseif  getgenv().settings.AnimePunching.RebirthAmounts == "85qd" then
 local args = {[1] = "Rebirths",[2] = 25}
game:GetService("ReplicatedStorage").Remotes.ClientRemote:InvokeServer(unpack(args))   
elseif  getgenv().settings.AnimePunching.RebirthAmounts == "185qd" then
 local args = {[1] = "Rebirths",[2] = 26}
game:GetService("ReplicatedStorage").Remotes.ClientRemote:InvokeServer(unpack(args))   
elseif  getgenv().settings.AnimePunching.RebirthAmounts == "5Qn" then
 local args = {[1] = "Rebirths",[2] = 27}
game:GetService("ReplicatedStorage").Remotes.ClientRemote:InvokeServer(unpack(args))   
elseif  getgenv().settings.AnimePunching.RebirthAmounts == "25Qn" then
 local args = {[1] = "Rebirths",[2] = 28}
game:GetService("ReplicatedStorage").Remotes.ClientRemote:InvokeServer(unpack(args))   
elseif  getgenv().settings.AnimePunching.RebirthAmounts == "850Qn" then
 local args = {[1] = "Rebirths",[2] = 29}
game:GetService("ReplicatedStorage").Remotes.ClientRemote:InvokeServer(unpack(args))   
elseif  getgenv().settings.AnimePunching.RebirthAmounts == "5sx" then
 local args = {[1] = "Rebirths",[2] = 30}
game:GetService("ReplicatedStorage").Remotes.ClientRemote:InvokeServer(unpack(args))   
elseif  getgenv().settings.AnimePunching.RebirthAmounts == "15sx" then
 local args = {[1] = "Rebirths",[2] = 31}
game:GetService("ReplicatedStorage").Remotes.ClientRemote:InvokeServer(unpack(args))   
elseif  getgenv().settings.AnimePunching.RebirthAmounts == "75sx" then
 local args = {[1] = "Rebirths",[2] = 32}
game:GetService("ReplicatedStorage").Remotes.ClientRemote:InvokeServer(unpack(args))   
elseif  getgenv().settings.AnimePunching.RebirthAmounts == "150sx" then
 local args = {[1] = "Rebirths",[2] = 33}
game:GetService("ReplicatedStorage").Remotes.ClientRemote:InvokeServer(unpack(args))   
elseif  getgenv().settings.AnimePunching.RebirthAmounts == "300sx" then
 local args = {[1] = "Rebirths",[2] = 34}
game:GetService("ReplicatedStorage").Remotes.ClientRemote:InvokeServer(unpack(args))   
elseif  getgenv().settings.AnimePunching.RebirthAmounts == "450sx" then
 local args = {[1] = "Rebirths",[2] = 35}
game:GetService("ReplicatedStorage").Remotes.ClientRemote:InvokeServer(unpack(args))   
elseif  getgenv().settings.AnimePunching.RebirthAmounts == "600sx" then
 local args = {[1] = "Rebirths",[2] = 36}
game:GetService("ReplicatedStorage").Remotes.ClientRemote:InvokeServer(unpack(args))   
elseif  getgenv().settings.AnimePunching.RebirthAmounts == "750sx" then
 local args = {[1] = "Rebirths",[2] = 37}
game:GetService("ReplicatedStorage").Remotes.ClientRemote:InvokeServer(unpack(args))   
elseif  getgenv().settings.AnimePunching.RebirthAmounts == "1.05Sp" then
 local args = {[1] = "Rebirths",[2] = 38}
game:GetService("ReplicatedStorage").Remotes.ClientRemote:InvokeServer(unpack(args))   
elseif  getgenv().settings.AnimePunching.RebirthAmounts == "1.27Sp" then
 local args = {[1] = "Rebirths",[2] = 39}
game:GetService("ReplicatedStorage").Remotes.ClientRemote:InvokeServer(unpack(args))   
elseif  getgenv().settings.AnimePunching.RebirthAmounts == "1.35Sp" then
 local args = {[1] = "Rebirths",[2] = 40}
game:GetService("ReplicatedStorage").Remotes.ClientRemote:InvokeServer(unpack(args))   
elseif  getgenv().settings.AnimePunching.RebirthAmounts == "1.65Sp" then
 local args = {[1] = "Rebirths",[2] = 41}
game:GetService("ReplicatedStorage").Remotes.ClientRemote:InvokeServer(unpack(args))   
end
        end
    end
end)
