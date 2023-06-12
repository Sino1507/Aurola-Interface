getgenv().AP = {}
getgenv().AP.shared = {}
getgenv().AP.shared.GitHubBase = "https://raw.githubusercontent.com/Sino1507/Aurola-Interface/main/"
getgenv().AP.shared.Config = "https://raw.githubusercontent.com/Sino1507/Aurola-Interface/main/config.json"
getgenv().AP.shared.Modules = "https://raw.githubusercontent.com/Sino1507/Aurola-Interface/main/modules/"

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Aurola-Interface-Suite",
    LoadingTitle = "Setup",
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
    KeySystem = true, 
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
local Destroy = Tab:CreateButton({
    Name = "Destroy",
    Callback = function()
        Rayfield:Destroy()
    end,
})


local GameID = game.PlaceId
local BaseLink = "https://raw.githubusercontent.com/Sino1507/Aurola-Interface/main/games/"..GameID.."/base.lua"
--local ServerID = game.JobId

local Load = Tab:CreateButton({
    Name = "Load",
    Callback = function()
        Rayfield:Destroy()
        wait(2)
        loadstring(game:HttpGet(BaseLink))()
    end,
})


function ValidateFile()
    local GameFile = game:HttpGet(BaseLink)
    if GameFile == "404: Not Found" then
        return false
    else
        return true
    end
end

Rayfield:Notify({
    Title = "Aurola-Interface-Suite",
    Content = "Welcome to Aurola-Interface-Suite!",
    Duration = 5,
    Image = 4483362458,
    Actions = { -- Notification Buttons
       Ignore = {
          Name = NotificationAP:PickEntWord(),
          Callback = function()
            print("Nice!")
        end 
    },
 },
})

if ValidateFile() == true then
    Rayfield:Notify({
        Title = "Aurola-Interface-Suite",
        Content = "Game is supported!",
        Duration = 5,
        Image = 4483362458,
        Actions = { -- Notification Buttons
           Ignore = {
              Name = NotificationAP:PickEntWord(),
              Callback = function()
                print("Nice!")
            end 
        },
     },
    })
else
    Rayfield:Notify({
        Title = "Aurola-Interface-Suite",
        Content = "Game is not supported!",
        Duration = 5,
        Image = 4483362458,
        Actions = { -- Notification Buttons
           Ignore = {
              Name = "Okay!",
              Callback = function()
                Rayfield:Destroy()
            end 
        },
     },
    })
end
