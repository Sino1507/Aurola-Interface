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
       Key = {"https://raw.githubusercontent.com/Sino1507/Aurola-Interface/assets/TestingKey/AurolaISK.txt"}
    }
})

local Tab = Window:CreateTab("Tab Example", 4483362458) -- Title, Image
local Destroy = Tab:CreateButton({
    Name = "Destroy",
    Callback = function()
        Rayfield:Destroy()
    end,
 })

local GameID = game.PlaceId
local BaseLink = "https://raw.githubusercontent.com/Sino1507/Aurola-Interface/games/"
--local ServerID = game.JobId

local function GetGameLink()
    local GameLink = BaseLink..GameID.."/base.lua"
    return GameLink
end

function ValidateFile()
    local GameLink = GetGameLink()
    local GameFile = game:HttpGet(GameLink)
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
          Name = "Okay!",
          Callback = function()
            Rayfield:Destroy()
        end 
    },
 },
})

if ValidateFile() == true then
    local GameLink = GetGameLink()
    local GameFile = game:HttpGet(GameLink)
    loadstring(GameFile)()
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
