print(game.PlaceId)

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






if game.PlaceId == 142823291 then
    local mm2 = Window:CreateTab("MM2", 4483362458) 
	mm2:CreateSection("Murder Section")
    mm2:CreateButton({
        Name = "Kill All",
        Callback = function()
            local Players = game:GetService("Players")  
local part = Instance.new("Part", game.Workspace.Lobby)
part.Position = Vector3.new(4.601, 182.099, 92.32)
part.Size = Vector3.new(672.9, 67, 760.2)
part.CanCollide = false
part.Touched:Connect(function (hit)
	--print(hit.Parent)
if hit.Parent:FindFirstChild("Humanoid") then
	print("hit")
local inspawn = Instance.new("BoolValue",hit.Parent)
inspawn.Name = "Spawn"
inspawn.Value = true
end
end)
            for i, Victim in pairs(Players:GetPlayers()) do

                if Victim.Name ~= game.Players.LocalPlayer.Name then
			if Victim.Character:FindFirstChild("Spawn").Value == true then return end
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
