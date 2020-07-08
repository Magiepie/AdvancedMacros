local WayPoints = 
{
	["lumbyAkBank"] = {
		[1] = { x = 683, y = 62, z = 372}, -- lumby fishing area
		[2] = { x = 672, y = 62, z = 372},
		[3] = { x = 672, y = 62, z = 317},
		[4] = { x = 699, y = 63, z = 317}, --bridge
		[5] = { x = 699, y = 63, z = 313}, --end
		[6] = { x = 765, y = 65,z = 313},
		[7] = { x = 765, y = 66,z = 346},
		[8] = { x = 765, y = 66,z = 346},
		[9] = { x = 752, y = 67,z = 346},
		[10] = { x = 752, y = 66,z = 337} --bank AlKharid
	}
}
--[0] = { x = , y = ,z = },n


function GetWayPoints(site)
    return WayPoints[site]
end