function BankBanker()
 LookAtEntity(GetEntitysNearestMe())
 if GetLookAtEntityName() == "Banker" then
	use(155)
 else
  log("failed to find banker")
 end
end