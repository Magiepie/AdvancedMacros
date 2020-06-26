function round(num, numDecimalPlaces)
    local mult = 5^(numDecimalPlaces or 0)
    return math.floor(num * mult + 0.5) / mult
  end
  
function GetLookAtEntityID() -- haxxerish
      local arg = getEntityList()
      for a,b in pairs(arg) do
          local entST = getEntity(arg[a].id)
          if entST.nbt.CustomName == "{\"extra\":[{\"color\":\"green\",\"text\":\"Right click to pickpocket\"}],\"text\":\"\"}" then
              if getPlayer().target and getPlayer().target.entity then
                  for i=1,3 do 
                      if  round(entST.pos[i],2) == round(getPlayer().target.entity.pos[i],2) then					
                          return arg[a].id
                      end	 
                  end		
              else
                  return false
              end			
          end
       
      end
end
      
function LookAtEntity(entityID) 
      local entityCoord = getBoundingBox(entityID)
      local x,y,z = entityCoord.getCenter()
      lookAt(x,y,z)
     
end

function TgetPlayerBlockPos()
	local playerPos = {}
	local x,y,z = getPlayerBlockPos()
	playerPos[1] = x
	playerPos[2] = y
	playerPos[3] = z
 return playerPos

end
  local TempEntityID = false
  while not TempEntityID do
      sleep(50)
      if isKeyDown('F4') then
          if not TempEntityID then
              if GetLookAtEntityID() then
                  TempEntityID = GetLookAtEntityID()
                  toast("Tracking", TempEntityID)
              end
              break
          end
      end
  end
  
  local reach = {}
  local Reached = false
  while not isKeyDown(2) do
      if TempEntityID then
          LookAtEntity(TempEntityID) 	
          sleep(30)
          forward(-1)
          local EntPos = getEntity(TempEntityID)
          local playerPos = TgetPlayerBlockPos()
              if round(playerPos[1],0) == round(EntPos.pos[1],0) then	reach[1] = true	else reach[1] = false end
              if round(playerPos[3],0) == round(EntPos.pos[3],0) then	reach[2] = true	else reach[2] = false end
              if reach[1] and reach[2] then
                  Reached = true
              else 
                  Reached = false
              end
          if Reached then
              forward(0)
              sleep(1000)
          end
      end
  
  end
   
   