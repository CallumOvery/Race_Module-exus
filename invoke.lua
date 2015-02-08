local race = require(script.Parent)


game.ReplicatedStorage.exus.RaceUpdate.OnServerEvent:connect(function(player,args)
	
	race:updatePlayer(player.Character)
end)





game.Players.PlayerAdded:connect(function(plyr)
	plyr.CanLoadCharacterAppearance = false
    plyr.CharacterAdded:connect(function(char)
script.Parent.FaceBlink:Clone().Parent = char

race:updatePlayer(char)
    end)
end)