function GetLookAtEntityID() -- dose not work with pickpock entitys
	local arg = getEntityList()
	for a,b in pairs(arg) do
        if  getPlayer().target.entity and getPlayer().targe then
            if getEntity(arg[a].id).uuid == getPlayer().target.entity.uuid then
                return arg[a].id
            end
        end
	end
end

function GetLookAtEntityName() -- dosnt work with pickpock entitys
	local entityUUID = getEntity(GetLookAtEntityID()).uuid
		if entityUUID == getPlayer().target.entity.uuid then
			local textInfo = getEntity(GetLookAtEntityID()).nbt.CustomName		
			local entityName = string.match(textInfo, [[white","text":"([^"]+)]])
			return entityName
		end	
end

function GetLookAtEntitLevel() -- dosnt work with pickpock entitys
	local entityUUID = getEntity(GetLookAtEntityID()).uuid
		if entityUUID == getPlayer().target.entity.uuid then
			local textInfo = getEntity(GetLookAtEntityID()).nbt.CustomName		
			local entityName = string.match(textInfo, [[dark_green","text":"([^"]+)]])
			return entityName
		end	
end
	
function GetLookAtEntitHP() -- dosnt work with pickpock entitys
	local entityUUID = getEntity(GetLookAtEntityID()).uuid
		if entityUUID == getPlayer().target.entity.uuid then
			local textInfo = getEntity(GetLookAtEntityID()).nbt.CustomName		
			local entityName = string.match(textInfo, [[red","text":"([^"]+)]])
			return entityName
		end	
end

function LookAtEntity(entityID) --untested
	local entityCoord = getBoundingBox(entityID)
	local x,y,z = entityCoord.getCenter()
		lookAt(x,y,z)	   
end