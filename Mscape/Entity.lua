function GetLookAtEntityID() -- dose not work with pickpock entitys
	local arg = getEntityList()
	for a,b in pairs(arg) do
		if getPlayer().target.entity then
			if getEntity(arg[a].id).uuid == getPlayer().target.entity.uuid then
				return arg[a].id
			end
		end
	end
end

function GetLookAtEntityName() -- dosnt work with pickpock entitys
	if getPlayer().target and getPlayer().target.entity  then
	local entityUUID = getEntity(GetLookAtEntityID()).uuid
		if entityUUID == getPlayer().target.entity.uuid then
			local textInfo = getEntity(GetLookAtEntityID()).nbt.CustomName		
			local entityName = string.match(textInfo, [[white","text":"([^"]+)]])
			if entityName == nil then 
				 entityName = string.match(textInfo, [[gold","text":"([^"]+)]]) -- banker
			else entityName = textInfo 
			end
		 return entityName
		end	
	end
end

function GetLookAtEntityLevel() -- dosnt work with pickpock entitys
    if getPlayer().target and getPlayer().target.entity  then
	local entityUUID = getEntity(GetLookAtEntityID()).uuid
		if entityUUID == getPlayer().target.entity.uuid then
			local textInfo = getEntity(GetLookAtEntityID()).nbt.CustomName		
			local entityLevel = string.match(textInfo, [[dark_green","text":"([^"]+)]])
			return entityLevel
        end	
    end
end
	
function GetLookAtEntityHP() -- dosnt work with pickpock entitys
    if getPlayer().target and getPlayer().target.entity  then
	local entityUUID = getEntity(GetLookAtEntityID()).uuid
		if entityUUID == getPlayer().target.entity.uuid then
			local textInfo = getEntity(GetLookAtEntityID()).nbt.CustomName		
			local entityHP = string.match(textInfo, [[red","text":"([^"]+)]])
			return entityHP
        end	
    end
end


function LookAtEntity(entityID)
	local entityCoord = getBoundingBox(entityID)
	local x,y,z = entityCoord.getCenter()
		lookAt(x,y,z)	   
end

function lowest(t, fn)
    if #t == 0 then return nil, nil end
    local key, value = 1, t[1]
    for i = 2, #t do
        if fn(value, t[i]) then
            key, value = i, t[i]
        end
    end
    return key, value
end

function GetEntitysNearestMe()
	local arg = getEntityList()
	local X,Y,Z = getPlayerBlockPos()
	 local selfID = GetPlayerID(getPlayer().name)
	local list = {}
	local compare = {}
		for i=1, #arg do
			entInfo = getEntity(arg[i].id)
			local distance = PlayerDist(X, Y, Z, entInfo.pos[1], entInfo.pos[2], entInfo.pos[3])
			 if selfID == arg[i].id then distance = 9999999 end -- dont return self
			list[i] = {distance = distance, id = arg[i].id }
		end	
		for i =1, #list do
			compare[#compare+1] = list[i].distance
		end
	local result = lowest(compare , function(a,b) return a > b end)
 return list[result].id 
end