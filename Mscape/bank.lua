function BankBanker()
 LookAtEntity(GetEntitysNearestMe())
 if GetLookAtEntityName() == "Banker" then
	use(155)
 else
  log("failed to find banker")
 end
end


function GetInvItems()
    local slotNameRaw = inv.getSlot(slot).nbt.tag.display["Name"]
    local slotName = string.match(slotname, color..[[text":"([^"]+)]])             
end

