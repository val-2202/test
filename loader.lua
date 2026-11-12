local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")

local LocalPlayer = Players.LocalPlayer
while not LocalPlayer do
    Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
    LocalPlayer = Players.LocalPlayer
end

local Scripts = {
    [18687417158] = {
        Name = "Forsaken",
        Url = "https://raw.githubusercontent.com/val-2202/test/refs/heads/main/outf.lua"
    },
    [142823291] = {
        Name = "MM2",
        Url = "https://raw.githubusercontent.com/val-2202/test/refs/heads/main/out.lua"
    }
}

local function Notify(title, text, duration)
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = title,
            Text = text,
            Duration = duration or 5
        })
    end)
end

local function LoadScript(url)
    local success, err = pcall(function()
        loadstring(game:HttpGet(url))()
    end)
    if not success then
        Notify("Error", "Failed to load script: " .. tostring(err), 8)
    end
end

local placeId = game.PlaceId
local data = Scripts[placeId]

if data then
    LoadScript(data.Url)
else
    Notify("RinX", "Game not supported", 8)
    end