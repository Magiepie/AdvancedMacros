local files = filesystem.list("~macros/MScape/waypoints")

toast("FILE","loading waypoints Files...")
for a, b in pairs(files) do
  local pass, err = pRun("~macros/MScape/waypoints/"..b)
  if not pass then
    log("&cstartup&7/&c"..b.."&4 "..err)
  end
end

local lumbyAK = GetWayPoints("lumbyAkBank")

function MoveToXYZ(x,y,z)
    while not isKeyDown(2) do
		local X,Y,Z = getPlayerBlockPos()
		local distance = PlayerDist(X, Y, Z ,x,y,z)
		if distance <= 1 then break end
			LookAtBlock(x,y,z)
			sleep(30)
			forward(-1)
		end
	forward(0)
end

function GetWaypointStart(waypoints)
	local path = GetWayPoints(waypoints)
	local X,Y,Z = getPlayerBlockPos()
	local distance1 = PlayerDist(X, Y, Z ,path[1].x,path[1].y,path[1].z)
	local distance2 = PlayerDist(X, Y, Z ,path[#path].x,#path].y,#path].z)
	local var,limit, step
	if distance1 > distance2 then
		var = 1 limit = #path step = 1
		return var, limit, step
	else
		var = #path limit = 1 step = -1
		return var, limit, step
	end
end

function FollowPath(waypoints) --"lumbyAkBank"
	local var,limit, step = GetWaypointStart(waypoints)
	for i = var ,limit, step do
	print(i) 
	end 
end

