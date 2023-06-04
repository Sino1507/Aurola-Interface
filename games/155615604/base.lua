local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Aurola-Interface-Suite",
    LoadingTitle = "Prison Life",
    LoadingSubtitle = "by Aurola-Studios™️",
    ConfigurationSaving = {
       Enabled = false,
       FolderName = nil, 
       FileName = ""
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

local Tab = Window:CreateTab("Tab Example", 4483362458) -- Title, Image
local Print = Tab:CreateButton({
    Name = "Print",
    Callback = function()
        print("Hello World!")
    end,
})

local Destroy = Tab:CreateButton({
    Name = "Destroy",
    Callback = function()
        Rayfield:Destroy()
    end,
})