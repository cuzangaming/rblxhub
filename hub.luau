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
-- Universal Tab
local universal = Window:CreateTab("Universal", 4483362458)
universal:CreateSection("Universal Exploits")

-- Variables for Fly
local flying = false
local speed = 50

-- Fly Function
local function Fly()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    local bodyVelocity = Instance.new("BodyVelocity", humanoidRootPart)
    bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    bodyVelocity.Velocity = Vector3.zero

    flying = true

    game:GetService("RunService").Stepped:Connect(function()
        if flying then
            local moveDirection = Vector3.new(
                (game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.W) and speed or 0) - 
                (game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.S) and speed or 0),
                (game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.Space) and speed or 0) - 
                (game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftControl) and speed or 0),
                (game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.A) and speed or 0) - 
                (game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.D) and speed or 0)
            )
            bodyVelocity.Velocity = moveDirection
        else
            bodyVelocity:Destroy()
        end
    end)
end

universal:CreateButton({
    Name = "Toggle Fly",
    Callback = function()
        flying = not flying
        if flying then
            Fly()
            print("Fly Enabled")
        else
            flying = false
            print("Fly Disabled")
        end
    end
})

-- Noclip Function
local noclip = false
local function Noclip()
    noclip = true
    game:GetService("RunService").Stepped:Connect(function()
        if noclip then
            for _, part in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                if part:IsA("BasePart") and part.CanCollide then
                    part.CanCollide = false
                end
            end
        end
    end)
end

universal:CreateButton({
    Name = "Toggle Noclip",
    Callback = function()
        noclip = not noclip
        if noclip then
            Noclip()
            print("Noclip Enabled")
        else
            noclip = false
            print("Noclip Disabled")
        end
    end
})

-- Fling Function
local function Fling()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    humanoidRootPart.Velocity = Vector3.new(0, 500, 0)
    print("Fling activated!")
end

universal:CreateButton({
    Name = "Fling",
    Callback = function()
        Fling()
    end
})

-- Speed Modifier
universal:CreateSlider({
    Name = "Set Fly Speed",
    Min = 10,
    Max = 200,
    Default = 50,
    Callback = function(value)
        speed = value
        print("Fly speed set to: " .. value)
    end
})

-- Placeholder for additional exploits
universal:CreateButton({
    Name = "Coming Soon",
    Callback = function()
        print("More exploits will be added here!")
    end
})
if game.PlaceId == 142823291 then
    local ESPToggle = false
    local faces = {"Back", "Bottom", "Front", "Left", "Right", "Top"}

    -- Helper function to create ESP visuals
    function MakeESP()
        for _, player in pairs(game.Players:GetPlayers()) do
            if player ~= game.Players.LocalPlayer and player.Character then
                local head = player.Character:FindFirstChild("Head")
                local humanoid = player.Character:FindFirstChild("Humanoid")
                local rootPart = player.Character:FindFirstChild("HumanoidRootPart")

                if head and humanoid and rootPart then
                    print("Creating ESP for: " .. player.Name)

                    -- Create BillboardGui
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

                    -- Determine role
                    local isMurderer = player.Backpack:FindFirstChild("Knife") or player.Character:FindFirstChild("Knife")
                    local isSheriff = player.Backpack:FindFirstChild("Gun") or player.Character:FindFirstChild("Gun")

                    if isMurderer then
                        nam.Text = "[Murderer] " .. player.Name
                        nam.TextColor3 = Color3.new(1, 0, 0) -- Red
                        applyColorToBodyParts(player.Character, Color3.new(1, 0, 0))
                    elseif isSheriff then
                        nam.Text = "[Sheriff] " .. player.Name
                        nam.TextColor3 = Color3.new(0, 0, 1) -- Blue
                        applyColorToBodyParts(player.Character, Color3.new(0, 0, 1))
                    else
                        nam.Text = player.Name
                        nam.TextColor3 = Color3.new(1, 1, 1) -- White
                        applyColorToBodyParts(player.Character, Color3.new(1, 1, 1))
                    end
                else
                    print("Skipping ESP for: " .. player.Name .. " (Missing parts)")
                end
            end
        end
    end

    -- Helper function to clear ESP
    function ClearESP()
        for _, v in pairs(game.Workspace:GetDescendants()) do
            if v.Name == "EGUI" then
                v:Destroy()
            end
        end
        print("Cleared all ESP elements.")
    end

    -- Helper to apply color to parts
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

    -- Create MM2 Tab
    print("MM2 detected. Initializing MM2 tab...")
    local mm2 = Window:CreateTab("MM2", 4483362458)
    if not mm2 then warn("Failed to create MM2 tab!") return end

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

    mm2:CreateButton({
        Name = "Toggle ESP",
        Callback = function()
            ESPToggle = not ESPToggle
            if ESPToggle then
                print("ESP Enabled")
                pcall(ClearESP)
                pcall(MakeESP)
            else
                print("ESP Disabled")
                pcall(ClearESP)
            end
        end
    })

    -- Auto-update ESP when players join/leave
    game:GetService("Players").PlayerAdded:Connect(function()
        if ESPToggle then
            wait(1)
            pcall(ClearESP)
            pcall(MakeESP)
        end
    end)

    game:GetService("Players").PlayerRemoving:Connect(function()
        if ESPToggle then
            wait(1)
            pcall(ClearESP)
            pcall(MakeESP)
        end
    end)

    -- Periodic ESP refresh
    while wait(60) do
        if ESPToggle then
            pcall(ClearESP)
            pcall(MakeESP)
        end
    end

    print("MM2 tab successfully created!")
else
    print("This script is not for the current game.")
end
