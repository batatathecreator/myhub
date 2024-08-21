local lib = loadstring(game:HttpGet('https://raw.githubusercontent.com/TheoTheEpic/AquaLib/main/AquaLib.lua'))()

local window = lib.createWindow("vacationhub", "Vacation's IDK Hub", true) -- lib.createWindow(title, name, draggable)
local em = window.createTab("Emotes")

local plr = game.Players.LocalPlayer
local chr = plr.Character
local hum = chr:WaitForChild("Humanoid")

chr:WaitForChild("Animate").run.RunAnim.AnimationId = "rbxassetid://657564596"

function animate(anim, val)
    local load = hum:LoadAnimation(anim)
    load.Looped = val or true
    load:Play()

    return load
end

em.createText("There are the gamepasses emotes")

em.createButton("Stop Anims", function()

    for i, v in hum:GetPlayingAnimationTracks() do

        v:Stop()

    end
    
end)

em.createButton("Orange Justice", function()

    animate(game.ReplicatedStorage.Emotes["Orange Justice"])

end)

em.createButton("Billy Bounce", function()

    animate(game.ReplicatedStorage.Emotes["Billy Bounce"])
    
end)

em.createButton("Boneless", function()

    animate(game.ReplicatedStorage.Emotes["Boneless"])
    
end)

em.createButton("Boogie Down", function()

    animate(game.ReplicatedStorage.Emotes["Boogie Down"])
    
end)

em.createButton("Crackdown", function()

    animate(game.ReplicatedStorage.Emotes["Crackdown"])
    
end)

em.createButton("Dance Moves", function()

    animate(game.ReplicatedStorage.Emotes["Dance Moves"])
    
end)

em.createButton("Eagle", function()

    animate(game.ReplicatedStorage.Emotes["Eagle"])
    
end)

em.createButton("Flapper", function()

    animate(game.ReplicatedStorage.Emotes["Flapper"])
    
end)

em.createButton("Floss", function()

    animate(game.ReplicatedStorage.Emotes["Floss"])
    
end)

em.createButton("Fresh", function()

    animate(game.ReplicatedStorage.Emotes["Fresh"])
    
end)

em.createButton("Freestylin", function()

    animate(game.ReplicatedStorage.Emotes["Freestylin"])
    
end)

em.createButton("Downbreaker", function()

    animate(game.ReplicatedStorage.Emotes["Downbreaker"])
    
end)

em.createButton("Hype", function()

    animate(game.ReplicatedStorage.Emotes["Hype"])
    
end)

em.createButton("Flippin Incredible", function()

    animate(game.ReplicatedStorage.Emotes["Flippin Incredible"], false)
    
end)

em.createButton("Destroy", function()

    local s, r = pcall(function()

        game:GetService("CoreGui"):WaitForChild("vacationhub"):Destroy()

    end)
    
end)
