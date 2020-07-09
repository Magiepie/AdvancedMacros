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

function ProspectBlockTarget()					
	if getPlayer().target and getPlayer().target.block then
		local prospectedOre = IdToOre[getPlayer().target.block.id]
			if prospectedOre == nil then return "unidentified "..getPlayer().target.block.id end
			return prospectedOre
	end
	return false
end

function ProspectBlock(x,y,z)
    local prospectedOre = IdToOre[getBlock(x,y,z).id]
    if prospectedOre == nil then return "unidentified "..getBlock(x,y,z).id end
 return prospectedOre
end