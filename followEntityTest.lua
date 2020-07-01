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

function PlayerDist(X, Y, Z, X2, Y2, Z2)
    local PlayerDX = X2 - X; 
    local PlayerDZ = Z2 - Z; 
    local PlayerDY = Y2 - Y;
    local PlayerDist = math.sqrt(math.abs(PlayerDX*PlayerDX)+math.abs(PlayerDZ*PlayerDZ)+math.abs(PlayerDY*PlayerDY));	
    return PlayerDist
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
          local X,Y,Z = getPlayerBlockPos()
          if PlayerDist(X, Y, Z, EntPos.pos[1], EntPos.pos[3], EntPos.pos[2]) <= 3 then          
              forward(0)
              sleep(1000)
          end
      end
end
   
   