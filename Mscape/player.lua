function CheckHealth(hp)
	if getPlayer().health <= hp then
		toast("Warning!", "Low Health")
		return false
	end
		return true
end

function GetNearbyPlayers()
	local arg = getEntityList()
	for a,b in pairs(arg) do
		if arg[a].class == "net.minecraft.client.entity.player.ClientPlayerEntity" then
			log(arg[a].name.." - "..arg[a].id )

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