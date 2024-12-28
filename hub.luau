local Rayfield = loadstring(game:HttpGet(('https://raw.githubusercontent.com/cuzangaming/rblxhub/refs/heads/main/main')))()

-- Create the main UI window
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

-- Create the "Welcome" tab
local welcome = Window:CreateTab("Welcome!", 4483362458) 

-- Retrieve game name from MarketplaceService
local MarketplaceService = game:GetService("MarketplaceService")
local gameInfo = MarketplaceService:GetProductInfo(game.PlaceId)
local gamename = gameInfo.Name

-- Add sections to the welcome tab
welcome:CreateSection("Welcome ".. game.Players.LocalPlayer.Name .. "!")
welcome:CreateSection("Game ID: " .. game.PlaceId .. " | Game Name: " .. gamename)

-- Conditional tab creation for a specific game ID
if game.PlaceId == 142823291 then
   Window:CreateTab("123!", 4483362458) 
   print("yeah")
else
   print("No game mm2")
end
