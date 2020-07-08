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


function GetEntitysNearMe(area)
    local X,Y,Z = getPlayerBlockPos()
	--PlayerDist(X, Y, Z, X2, Y2, Z2)
end