local Rayfield = loadstring(game:HttpGet(('https://raw.githubusercontent.com/cuzangaming/rblxhub/refs/heads/main/main')))()

local Window = Rayfield:CreateWindow({
   Name = "Cuzan's Hub",
   Icon = 0, 
   Theme = "DarkBlue", 
   DisableRayfieldPrompts = true,
   DisableBuildWarnings = true,
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil,
      FileName = "Cuzan Hub"
   },
   Discord = {
      Enabled = false,
      Invite = "inworks",
      RememberJoins = true 
   },
})

local welcome = Window:CreateTab("Welcome!", 4483362458) 

local MarketplaceService = game:GetService("MarketplaceService")
local gameInfo = MarketplaceService:GetProductInfo(game.PlaceId)
local gamename = gameInfo.Name

welcome:CreateSection("Welcome ".. game.Players.LocalPlayer.Name .. "!")
welcome:CreateSection("Game ID: " .. game.PlaceId .. " | Game Name: " .. gamename)






print(game.PlaceId)
if game.PlaceId == 142823291 then
    local mm2 = Window:CreateTab("MM2", 4483362458) 

    mm2:CreateButton({
        Name = "Kill All",
        Callback = function()
            local Players = game:GetService("Players")    
            for i, Victim in pairs(Players:GetPlayers()) do
                if Victim.Name ~= game.Players.LocalPlayer.Name then
                    repeat wait()
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Victim.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 1)
                    until Victim.Character.Humanoid.Health == 0
                end
            end
        end,
    })

    print("Script loaded for MM2")
else
    print("This script is not for the current game.")
end
