local baseAP = {}
baseAP.__index = baseAP

-- Config Service found at https://raw.githubusercontent.com/Sino1507/Aurola-Interface/main/config.json
local Config = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://raw.githubusercontent.com/Sino1507/Aurola-Interface/main/config.json"))
local ReplyEntWords = game:HttpGet(getgenv().AP.shared.GitHubBase .. "assets/EntWords.txt"):split("\n")

local function GetEntWord()
    return ReplyEntWords[math.random(1, #ReplyEntWords)]
end

local function baseAP:PickEntWord()
    return GetEntWord()
end

getgenv().AP.shared.baseAP = Config.GlobalVariables and baseAP or nil

return baseAP