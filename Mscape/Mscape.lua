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
	
	function CheckHealth(hp)
	 if getPlayer().health <= hp then
		toast("Warning!", "Low Health")
		return false
	 end
	 return true
	end
	
	function GetGroundItems()
	local arg = getEntityList()
	local GItems = {}
		for a,b in pairs(arg) do
			  if arg[a].name == "Armor Stand" then
			   local entST = getEntity(arg[a].id)
			   log(entST.nbt.ArmorItems[4].tag.display.Name)   --items
			   --break nametext name down to item name (use regex)
			   --store coords
			   --Store stack amount
			   GItems[a] = entST.nbt.ArmorItems[4].tag.display.Name
			  end
		end
		return GItems
	end
	
	function GetLookAtEntityName() -- dosnt work with pickpock entitys
		local arg = getEntityList()
		for a,b in pairs(arg) do
			if getEntity(arg[a].id).uuid == getPlayer().target.entity.uuid then
				local textInfo = getEntity(arg[a].id).nbt.CustomName		
				local entityName = string.match(textInfo, [[white","text":"([^"]+)]])	
			 return entityName
			end
		end
	end
	
				 --do regex stuff
			 --[[
				{"extra":
				[{"color":"gold","text":"["},
				{"color":"dark_green","text":"2"}, -- level
				{"color":"gold","text":"] "},
				{"color":"white","text":"Cow "},
				{"color":"gold","text":"["},
				{"color":"red","text":"8"} -- HitPoints
				{"color":"gold","text":"]"}
				],
				"text":""}
				--]]
	
	function GetNearbyPlayers()
		local arg = getEntityList()
		for a,b in pairs(arg) do
			if arg[a].class == "net.minecraft.client.entity.player.ClientPlayerEntity" then
				log(arg[a].name.." - "..arg[a].id )
	
			end
		end
	end

	function GetPickPocketCoords()
		local arg = getEntityList()
			for a,b in pairs(arg) do
			 local entST = getEntity(arg[a].id)
				if entST.nbt.CustomName == "{\"extra\":[{\"color\":\"green\",\"text\":\"Right click to pickpocket\"}],\"text\":\"\"}" then
					log("Target@ x "..entST.nbt.Pos[1] ..", y: "..entST.nbt.Pos[2]..", z: "..entST.nbt.Pos[3])
				end
			 
			end
	
	end
	
	local _UUID_list = {  }
	function SetInteract_UUID(type) --SetInteract_UUID("pocket")
		local target = getPlayer().target.entity
		if target == nil then return end
		_UUID_list[type] = {}
		for i=0,#_UUID_list[type] do
			_UUID_list[type][i] = {uuid = target.uuid}
		end		
	end
	
function GetInteract_UUID_list()
	return _UUID_list
end

	function canInteract_UUID(type) -- canInteract_UUID("pocket")
	local target = getPlayer().target.entity
		for i=0,#_UUID_list[type] do
			if target.uuid == _UUID_list[type][i].uuid then
				return true
			end
		end
		return false
	end
	
	function LookAtEntity(entityID) --untested
		local entityCoord = getBoundingBox(entityID)
		local x,y,z = entityCoord.getCenter()
			lookAt(x,y,z)	   
	end

	function PlayerDist(X, Y, Z, X2, Y2, Z2)
		local PlayerDX = X2 - X; 
		local PlayerDZ = Z2 - Z; 
		local PlayerDY = Y2 - Y;
		local PlayerDist = math.sqrt(math.abs(PlayerDX*PlayerDX)+math.abs(PlayerDZ*PlayerDZ)+math.abs(PlayerDY*PlayerDY));	
		return PlayerDist
	   end