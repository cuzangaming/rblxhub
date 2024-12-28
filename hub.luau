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

local flying = false
local lplayer = game.Players.LocalPlayer
local Mouse = lplayer:GetMouse()

-- Settings for flying speed
local speedfly = 50
local speedget = 1

-- Universal button to toggle flying
universal:CreateButton({
    Name = "Toggle Fly",
    Callback = function()
        if not flying then
            -- Start flying
            flying = true
            script.Parent.BackgroundColor3 = Color3.fromRGB(52, 255, 52)
            
            -- Ensure character parts exist
            repeat wait() until lplayer and lplayer.Character and lplayer.Character:FindFirstChild('HumanoidRootPart') and lplayer.Character:FindFirstChild('Humanoid')
            
            local T = lplayer.Character.HumanoidRootPart
            local CONTROL = {F = 0, B = 0, L = 0, R = 0}
            local lCONTROL = {F = 0, B = 0, L = 0, R = 0}

            -- Create BodyGyro and BodyVelocity for flying
            local BG = Instance.new('BodyGyro', T)
            local BV = Instance.new('BodyVelocity', T)
            BG.P = 9e4
            BG.maxTorque = Vector3.new(9e9, 9e9, 9e9)
            BG.cframe = T.CFrame
            BV.velocity = Vector3.new(0, 50, 0)  -- Set upward velocity for flying
            BV.maxForce = Vector3.new(9e9, 9e9, 9e9)
            
            -- Attach BodyGyro and BodyVelocity
            BG.Parent = T
            BV.Parent = T

            -- Main fly loop
            spawn(function()
                repeat
                    wait()
                    lplayer.Character.Humanoid.PlatformStand = true

                    -- Handle directional control
                    if CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 then
                        BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (CONTROL.F + CONTROL.B)) +
                            ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(CONTROL.L + CONTROL.R, (CONTROL.F + CONTROL.B) * 0.2, 0).p) -
                            workspace.CurrentCamera.CoordinateFrame.p)) * speedfly + Vector3.new(0, 50, 0)
                        lCONTROL = {F = CONTROL.F, B = CONTROL.B, L = CONTROL.L, R = CONTROL.R}
                    elseif CONTROL.L + CONTROL.R == 0 and CONTROL.F + CONTROL.B == 0 then
                        BV.velocity = Vector3.new(0, 50, 0)  -- Maintain vertical flight
                    end
                    
                    -- Keep BodyGyro orientation aligned with camera
                    BG.cframe = workspace.CurrentCamera.CoordinateFrame
                until not flying
                
                -- Reset when flying stops
                CONTROL = {F = 0, B = 0, L = 0, R = 0}
                lCONTROL = {F = 0, B = 0, L = 0, R = 0}
                BV.velocity = Vector3.new(0, 0, 0)
                BG:Destroy()
                BV:Destroy()
                lplayer.Character.Humanoid.PlatformStand = false
            end)
        else
            -- Stop flying
            flying = false
            script.Parent.BackgroundColor3 = Color3.fromRGB(255, 51, 51)
            lplayer.Character.Humanoid.PlatformStand = false
        end
    end
})

-- Control flying direction with 'WASD' keys
Mouse.KeyDown:Connect(function(KEY)
    if flying then
        if KEY:lower() == 'w' then
            CONTROL.F = speedfly
        elseif KEY:lower() == 's' then
            CONTROL.B = -speedfly
        elseif KEY:lower() == 'a' then
            CONTROL.L = -speedfly
        elseif KEY:lower() == 'd' then
            CONTROL.R = speedfly
        end
    end
end)

Mouse.KeyUp:Connect(function(KEY)
    if flying then
        if KEY:lower() == 'w' then
            CONTROL.F = 0
        elseif KEY:lower() == 's' then
            CONTROL.B = 0
        elseif KEY:lower() == 'a' then
            CONTROL.L = 0
        elseif KEY:lower() == 'd' then
            CONTROL.R = 0
        end
    end
end)


-- Fling Function
local function Fling()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

    local originalVelocity = humanoidRootPart.Velocity
    humanoidRootPart.Velocity = Vector3.new(1000, 500, 1000) -- Add strong velocity for fling
    wait(0.1)
    humanoidRootPart.Velocity = originalVelocity -- Restore velocity
end

universal:CreateButton({
    Name = "Fling",
    Callback = function()
        Fling()
        print("Fling executed")
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
