function CheckHealth(hp)
	if getPlayer().health <= hp then
		toast("Warning!", "Low Health")
		return false
	end
		return true
end

function GetNearbyPlayers()
	local arg = getEntityList()
	local playerList = {}
	for i=1, #arg do
		if arg[i].class == "net.minecraft.client.entity.player.ClientPlayerEntity" then
			playerList[#playerList+1]= {name = arg[i].name, id =arg[i].id}
		end
	end	
	return playerList
end

function GetPlayerID(name)
    local playerList = GetNearbyPlayers()
        for i=1, #playerList do
            if name == playerList[i].name then
               return playerList[i].id
            end
        end
end

function isStuned()
	local NpEffects = #getPlayer().potionEffects
	 if NpEffects <= 1 then
	  for i = 1 , NpEffects do     
	   if getPlayer().potionEffects[i].id == "effect.minecraft.slowness" then
		return true
	   end
	  end
	 end
	return false
end

function PlayerDist(X, Y, Z, X2, Y2, Z2)
	local PlayerDX = X2 - X; 
	local PlayerDZ = Z2 - Z; 
	local PlayerDY = Y2 - Y;
	local PlayerDist = math.sqrt(math.abs(PlayerDX*PlayerDX)+math.abs(PlayerDZ*PlayerDZ)+math.abs(PlayerDY*PlayerDY));	
		return PlayerDist
end