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

local ESPToggle = false
	
	local plrs = game:GetService("Players")
	local faces = {"Back","Bottom","Front","Left","Right","Top"}
	function MakeESP()
		for _, v in pairs(game.Players:GetChildren()) do if v.Name ~= game.Players.LocalPlayer.Name then
				local bgui = Instance.new("BillboardGui",v.Character.Head)
				bgui.Name = ("EGUI")
				bgui.AlwaysOnTop = true
				bgui.ExtentsOffset = Vector3.new(0,2,0)
				bgui.Size = UDim2.new(0,200,0,50)
				local nam = Instance.new("TextLabel",bgui)
				nam.Text = v.Name
				nam.BackgroundTransparency = 1
				nam.TextSize = 15
				nam.Font = ("GothamBold")
				nam.TextColor3 = Color3.new(255,255,255)
				nam.Size = UDim2.new(0,200,0,50)
				if v.Backpack:FindFirstChild("Gun") or v.Character:FindFirstChild("Gun") then
					for _, p in pairs(v.Character:GetChildren()) do
						if p.Name == ("Head") or p.Name == ("Torso") or p.Name == ("Right Arm") or p.Name == ("Right Leg") or p.Name == ("Left Arm") or p.Name == ("Left Leg") then 
							for _, f in pairs(faces) do
								local m = Instance.new("SurfaceGui",p)
								m.Name = ("EGUI")
								m.Face = f
								m.AlwaysOnTop = true
								local mf = Instance.new("Frame",m)
								mf.Size = UDim2.new(1,0,1,0)
								mf.BorderSizePixel = 0
								mf.BackgroundTransparency = 0.5
								mf.BackgroundColor3 = Color3.new(0,0,255)
							end
						end
					end
				elseif v.Backpack:FindFirstChild("Knife") or v.Character:FindFirstChild("Knife") then
					for _, p in pairs(v.Character:GetChildren()) do
						if p.Name == ("Head") or p.Name == ("Torso") or p.Name == ("Right Arm") or p.Name == ("Right Leg") or p.Name == ("Left Arm") or p.Name == ("Left Leg") then 
							for _, f in pairs(faces) do
								local m = Instance.new("SurfaceGui",p)
								m.Name = ("EGUI")
								m.Face = f
								m.AlwaysOnTop = true
								local mf = Instance.new("Frame",m)
								mf.Size = UDim2.new(1,0,1,0)
								mf.BorderSizePixel = 0
								mf.BackgroundTransparency = 0.5
								mf.BackgroundColor3 = Color3.new(255,0,0)
							end
						end
					end
				else
					for _, p in pairs(v.Character:GetChildren()) do
						if p.Name == ("Head") or p.Name == ("Torso") or p.Name == ("Right Arm") or p.Name == ("Right Leg") or p.Name == ("Left Arm") or p.Name == ("Left Leg") then 
							for _, f in pairs(faces) do
								local m = Instance.new("SurfaceGui",p)
								m.Name = ("EGUI")
								m.Face = f
								m.AlwaysOnTop = true
								local mf = Instance.new("Frame",m)
								mf.Size = UDim2.new(1,0,1,0)
								mf.BorderSizePixel = 0
								mf.BackgroundTransparency = 0.5
								mf.BackgroundColor3 = Color3.new(255,255,255)
							end
						end
					end
				end
			end
		end
	end
	
	function ClearESP()
		for _, v in pairs(game.Workspace:GetDescendants()) do
			if v.Name == ("EGUI") then
				v:Remove()
			end
		end
	end

	
	game:GetService("Players").PlayerAdded:Connect(function(v)
		if ESPToggle == true then
			wait(1)
			pcall(ClearESP)
			pcall(MakeESP)
		end
	end)
	
	game:GetService("Players").PlayerRemoving:Connect(function(v)
		if ESPToggle == true then
			wait(1)
			pcall(ClearESP)
			pcall(MakeESP)
		end
	end)
	
	while wait(60) do
		if ESPToggle == true then
			wait(1)
			pcall(ClearESP)
			pcall(MakeESP)
		end
	end


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
if hit.Parent.Spawn == nil then

local inspawn = Instance.new("BoolValue",hit.Parent)
inspawn.Name = "Spawn"
inspawn.Value = true
end
end
end)
task.wait()
part:Destroy()
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
mm2:CreateButton({Name = "Everyone ESP", Callback = function()
	if ESPToggle == false then
				ESPToggle = true
				pcall(ClearESP)
				pcall(MakeESP)
			else
				ESPToggle = false
				pcall(ClearESP)
			end
		
end})

    print("Script loaded for MM2")
else
    print("This script is not for the current game.")
end
