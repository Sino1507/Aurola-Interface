local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Config = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://raw.githubusercontent.com/Sino1507/Aurola-Interface/main/config.json"))

local Window = Rayfield:CreateWindow({
    Name = "Aurola-Interface-Suite",
    LoadingTitle = "Prison Life",
    LoadingSubtitle = "by Aurola-Studios™️",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "Aurola_Interface_Suite", 
        FileName = "Prison_Life"
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

local NotificationAPS = getgenv().AP.shared.Modules .. "NotificationsAP.lua"
NotificationAPS = NotificationAPS:gsub("\n", "")
NotificationAPS = NotificationAPS:gsub("\t", "")
NotificationAPS = NotificationAPS:gsub(" ", "")
local NotificationAP = loadstring(game:HttpGet(NotificationAPS))()

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

Rayfield:Notify({
    Title = "Aurola-Interface-Suite",
    Content = "Welcome to Aurola [Prison Life]!",
    Duration = 5,
    Image = 4483362458,
    Actions = { -- Notification Buttons
       Ignore = {
          Name = Config.GlobalVariables and getgenv().AP.shared.NotificationAP:PickEntWord() or NotificationAP:PickEntWord(),
          Callback = function()
          print("Nice!")
       end
    },
 },
 })

 Rayfield:LoadConfiguration()