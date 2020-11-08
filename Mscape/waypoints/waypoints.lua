local WayPoints = 
{
	["lumbyAkBank"] = {
		[1] = { x = 686, y = 62, z = 368}, -- lumby fishing area
		[2] = { x = 687, y = 62, z = 318},
		[3] = { x = 700, y = 63, z = 318}, --bridge
		[4] = { x = 699, y = 63, z = 313}, --end
		[5] = { x = 765, y = 65,z = 313},
		[6] = { x = 765, y = 66,z = 346},
		[7] = { x = 765, y = 66,z = 346},
		[8] = { x = 752, y = 66,z = 346},
		[9] = { x = 752, y = 66,z = 339} --bank AlKharid
	}
}
--[0] = { x = , y = ,z = },n


function GetWayPoints(site)
    return WayPoints[site]
end