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
  
  while not isKeyDown(2) do
      LookAtEntity(TempEntityID) 
      sleep(30)
  end
   
   