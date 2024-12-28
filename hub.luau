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
local gamename = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name;
welcome:CreateSection("Welcome ".. game.Players.LocalPlayer.Name.."!")
local game = welcome:CreateSection("Game ID: ".. game.PlaceId.." | Game Name: ".. gamename)


if game.PlaceId == "142823291" then
   Window:CreateTab("123!", 4483362458) 
end
