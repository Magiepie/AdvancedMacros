local target = getPlayer().target

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

toast("Picking", "Starting...")
local xpcount = 0
for i = 1 , 555550 do
if isKeyDown(2) then break end
	if getPlayer().health >= 4 then
		if not isStuned() then
			if target.entity then
				if target.entity.class == "net.minecraft.client.entity.player.RemoteClientPlayerEntity" then
				--	if target.entity.uuid == "dc1b28a9-e698-4512-8c2c-48cc117955fe" then    
						use(155)
						xpcount = xpcount+16
					--end
				end
			end
		end
	else
	toast("Warning!", "Low Health")
	
	sleep(6000)
	end
sleep(3000)
end
toast("Picking", "Completed")
log("Completed, xp: "..xpcount)

