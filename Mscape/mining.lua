local IdToOre = {
    ["minecraft:nether_quartz_ore"] = "Copper" ,
    ["minecraft:iron_ore"]          = "Tin"    ,
    ["minecraft:emerald_ore"]       = "Iron"   ,
    ["minecraft:coal_ore"]          = "Coal"   ,
    ["minecraft:prismarine_bricks"] = "Silver" ,
    ["minecraft:gold_ore"]          = "Gold"   ,
    ["minecraft:redstone_ore"]      = "Mithril",
    ["minecraft:lapis_ore"]         = "Adamant",
    ["minecraft:bedrock"]           = "Depleted",
    ["minecraft:lily_pad"]          = "Fishing"
    }

function ProspectBlockTarget()	
local player = 	getPlayer()			
if player.target and player.target.block then
local prospectedOre = IdToOre[player.target.block.id]
if prospectedOre == nil then return "unidentified "..player.target.block.id end
return prospectedOre
end
return false
end

function ProspectBlock(x,y,z)
local blockID = getBlock(x,y,z).id
local prospectedOre = IdToOre[blockID]
if prospectedOre == nil then return "unidentified "..blockID end
return prospectedOre
end

function StartMining(oreName)
    if ProspectBlock() == oreName then
        use(155)
    end
end
