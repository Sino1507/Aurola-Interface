getgenv().AP = {}
getgenv().AP.shared = {}
getgenv().AP.shared.Connections = {}
getgenv().AP.shared.TMP = {}
getgenv().AP.shared.GitHubBase = "https://raw.githubusercontent.com/Sino1507/Aurola-Interface/main/"
getgenv().AP.shared.Config = "https://raw.githubusercontent.com/Sino1507/Aurola-Interface/main/config.json"
getgenv().AP.shared.Modules = "https://raw.githubusercontent.com/Sino1507/Aurola-Interface/main/modules/"

getgenv().AP.shared.GlobalDelay = 10 / 1000 -- Milliseconds
getgenv().AP.shared.GlobalCooldown = false

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Config = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://raw.githubusercontent.com/Sino1507/Aurola-Interface/main/config.json"))
local Connections = {}

Connections["GlobalDelayConnection"] = game.RunService.Stepped:Connect(function()
    if getgenv().AP.shared.GlobalCooldown == true then
        wait(getgenv().AP.shared.GlobalDelay)
        getgenv().AP.shared.GlobalCooldown = false
    else
        return
    end
end)


local Window = Rayfield:CreateWindow({
    Name = "Aurola-Interface-Suite",
    LoadingTitle = "Setup",
    LoadingSubtitle = "by Aurola-Studios™️",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = "Aurola_Interface_Suite", 
       FileName = "Universal_Config"
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

local GameID = game.PlaceId
local BaseLink = "https://raw.githubusercontent.com/Sino1507/Aurola-Interface/main/games/"..GameID.."/base.lua"
--local ServerID = game.JobId



local Tab = Window:CreateTab("Loader", 4483362458) -- Title, Image
local SectionLoader = Tab:CreateSection("Loader Section") -- Section Title
local Load = Tab:CreateButton({
    Name = "Load",
    Callback = function()
        Rayfield:Destroy()
        wait(2)
        loadstring(game:HttpGet(BaseLink))()
    end,
})

local SectionDestroyer = Tab:CreateSection("Destroyer Section") -- Section Title
local AutoClear = Tab:CreateToggle({
    Name = "AutoClear TMP",
    CurrentValue = false,
    Flag = "AutoClearTMP",
    Callback = function(Value)
        if Value then
            Rayfield:Notify({
                Title = "Aurola-Interface-Suite",
                Content = "AutoClear TMP is now enabled!",
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

            Connections["AutoClearTMP"] = game.RunService.Stepped:Connect(function()
                -- Clear TMP & use GlobalDelay
                if getgenv().AP.shared.GlobalCooldown == true then 
                    return 
                end
                if getgenv().AP.shared.TMP ~= {} and getgenv().AP.shared.TMP ~= nil then
                        for i,v in pairs(getgenv().AP.shared.TMP) do
                            if v == nil then return end 
                            if v and typeof(v) == "Instance" then
                                if v:IsA("TextLabel") or v:IsA("TextButton") or v:IsA("TextBox") or v:IsA("ImageLabel") or v:IsA("ImageButton") then
                                    v:Destroy()
                                end
                            else if v and typeof(v) == "table" then
                                v = nil
                            else
                                getgenv().AP.shared.TMP[i] = nil
                            end
                        end
                        getgenv().AP.shared.GlobalCooldown = true
                    end
                end
            end)

            if Config.GlobalVariables then
                getgenv().AP.shared.Connections["AutoClearTMP"] = Connections["AutoClearTMP"]
            end
        else
            Rayfield:Notify({
                Title = "Aurola-Interface-Suite",
                Content = "AutoClear TMP is now disabled!",
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

            if Connections["AutoClearTMP"] then
                Connections["AutoClearTMP"]:Disconnect()
                Connections["AutoClearTMP"] = nil
            end

            if Config.GlobalVariables then
                getgenv().AP.shared.Connections["AutoClearTMP"]:Disconnect()
                getgenv().AP.shared.Connections["AutoClearTMP"] = nil
            end
        end
    end,
})
local Destroy = Tab:CreateButton({
    Name = "Destroy",
    Callback = function()
        Rayfield:Destroy()
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

Rayfield:LoadConfiguration()
