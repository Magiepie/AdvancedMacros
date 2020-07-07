function ProspectBlock()
	local IdToOre = {
					["minecraft:nether_quartz_ore"] = "Copper" ,
					["minecraft:iron_ore"]          = "Tin"    ,
					["minecraft:emerald_ore"]       = "Iron"   ,
					["minecraft:coal_ore"]          = "Coal"   ,
					["minecraft:prismarine_bricks"] = "Silver" ,
					["minecraft:gold_ore"]          = "Gold"   ,
					["minecraft:redstone_ore"]      = "Mithril",
					["minecraft:lapis_ore"]         = "Adamant",
					["minecraft:bedrock"]           = "Depleted"}
					
	if getPlayer().target and getPlayer().target.block then
		local prospectedOre = IdToOre[getPlayer().target.block.id]
			if prospectedOre == nil then return "unidentified" end
			return prospectedOre
	end
	return false
end