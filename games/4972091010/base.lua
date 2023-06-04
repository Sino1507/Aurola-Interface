local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Aurola-Interface-Suite",
    LoadingTitle = "Zombie Uprising",
    LoadingSubtitle = "by Aurola-Studios™️",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = "Aurola_Interface_Suite", 
       FileName = "Zomebie_Uprising"
    },
    Discord = {
       Enabled = false,
       Invite = "", 
       RememberJoins = true 
    },
    KeySystem = false, 
    KeySettings = {
       Title = "Aurola-Interface-Suite",
       Subtitle = "Key System",
       Note = "Gain the Key from the site!",
       FileName = "AurolaISKBase",
       SaveKey = true,
       GrabKeyFromSite = true, 
       Key = {"https://raw.githubusercontent.com/Sino1507/Aurola-Interface/main/assets/TestingKey/AurolaISK.txt"}
    }
})

local Main = Window:CreateTab("Main", 4483362458) -- Title, Image
local Player = Window:CreateTab("Player", 4483362458) -- Title, Image
local Misc = Window:CreateTab("Misc", 4483362458) -- Title, Image
local Visuals = Window:CreateTab("Visuals", 4483362458) -- Title, Image
local Credits = Window:CreateTab("Credits", 4483362458) -- Title, Image

local CParagraph = Credits:CreateParagraph({Title = "Credits", Content = "Aurola-Studios™️ \n-Scripting & Utilities \nSino1507 \n-UI Design \nSirius-Menu"})

-- [[   Player   ]]

local SpoofValues = Player:CreateSection("Spoof Values")

local WalkSpeed = Player:CreateSlider({
    Name = "WalkSpeed",
    Range = {16, 500},
    Increment = 1,
    Suffix = "WS",
    CurrentValue = 16,
    Flag = "WalkSpeedFlag", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
    end,
})

local JumpPower = Player:CreateSlider({
    Name = "JumpPower",
    Range = {50, 500},
    Increment = 1,
    Suffix = "JP",
    CurrentValue = 50,
    Flag = "JumpPowerFlag", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
    end,
})

Rayfield:LoadConfiguration() 
