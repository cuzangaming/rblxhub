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
local faces = {"Back", "Bottom", "Front", "Left", "Right", "Top"}

function MakeESP()
    for _, player in pairs(game.Players:GetPlayers()) do
        if player ~= game.Players.LocalPlayer and player.Character then
            local head = player.Character:FindFirstChild("Head")
            local humanoid = player.Character:FindFirstChild("Humanoid")
            local rootPart = player.Character:FindFirstChild("HumanoidRootPart")

            if head and humanoid and rootPart then
                -- Debugging information
                print("Creating ESP for: " .. player.Name)

                -- Create BillboardGui on the head
                local bgui = Instance.new("BillboardGui", head)
                bgui.Name = "EGUI"
                bgui.AlwaysOnTop = true
                bgui.ExtentsOffset = Vector3.new(0, 2, 0)
                bgui.Size = UDim2.new(0, 200, 0, 50)

                local nam = Instance.new("TextLabel", bgui)
                nam.BackgroundTransparency = 1
                nam.TextSize = 15
                nam.Font = Enum.Font.GothamBold
                nam.Size = UDim2.new(0, 200, 0, 50)

                -- Check for roles (Murderer, Sheriff, or default)
                local isMurderer = player.Backpack:FindFirstChild("Knife") or player.Character:FindFirstChild("Knife")
                local isSheriff = player.Backpack:FindFirstChild("Gun") or player.Character:FindFirstChild("Gun")

                if isMurderer then
                    nam.Text = "[Murderer] " .. player.Name
                    nam.TextColor3 = Color3.new(1, 0, 0) -- Red for Murderer
                    applyColorToBodyParts(player.Character, Color3.new(1, 0, 0)) -- Red
                elseif isSheriff then
                    nam.Text = "[Sheriff] " .. player.Name
                    nam.TextColor3 = Color3.new(0, 0, 1) -- Blue for Sheriff
                    applyColorToBodyParts(player.Character, Color3.new(0, 0, 1)) -- Blue
                else
                    nam.Text = player.Name
                    nam.TextColor3 = Color3.new(1, 1, 1) -- White for others
                    applyColorToBodyParts(player.Character, Color3.new(1, 1, 1)) -- White
                end
            else
                print("Skipping ESP for: " .. player.Name .. " (Missing required parts)")
            end
        end
    end
end

function ClearESP()
    for _, v in pairs(game.Workspace:GetDescendants()) do
        if v.Name == "EGUI" then
            v:Destroy()
        end
    end
    print("Cleared all ESP elements.") -- Debug message
end

-- Helper function to apply color to character parts
function applyColorToBodyParts(character, color)
    for _, part in pairs(character:GetChildren()) do
        if part:IsA("BasePart") then
            for _, face in pairs(faces) do
                local surfaceGui = Instance.new("SurfaceGui", part)
                surfaceGui.Name = "EGUI"
                surfaceGui.Face = face
                surfaceGui.AlwaysOnTop = true

                local frame = Instance.new("Frame", surfaceGui)
                frame.Size = UDim2.new(1, 0, 1, 0)
                frame.BorderSizePixel = 0
                frame.BackgroundTransparency = 0.5
                frame.BackgroundColor3 = color
            end
        end
    end
end




    print("MM2 detected. Initializing MM2 tab...") -- Debug message
    local mm2 = Window:CreateTab("MM2", 4483362458) -- Ensure this line is correct
    if not mm2 then
        warn("Failed to create MM2 tab!") -- Debugging message
    end

    mm2:CreateSection("Murder Section")
    mm2:CreateButton({
        Name = "Kill All",
        Callback = function()
            local Players = game:GetService("Players")
            for _, Victim in pairs(Players:GetPlayers()) do
                if Victim.Name ~= game.Players.LocalPlayer.Name then
                    repeat wait()
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Victim.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 1)
                    until Victim.Character.Humanoid.Health == 0
                end
            end
        end,
    })
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

    mm2:CreateButton({
        Name = "Everyone ESP",
        Callback = function()
            ESPToggle = not ESPToggle
            if ESPToggle then
                print("ESP Enabled") -- Debug message
                pcall(ClearESP)
                pcall(MakeESP)
            else
                print("ESP Disabled") -- Debug message
                pcall(ClearESP)
            end
        end
    })

    print("MM2 tab successfully created!")
else
    print("This script is not for the current game.")
end
