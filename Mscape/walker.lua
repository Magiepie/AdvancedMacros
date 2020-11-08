local files = filesystem.list("~macros/MScape/waypoints")

toast("FILE","loading waypoints Files...")
for a, b in pairs(files) do
  local pass, err = pRun("~macros/MScape/waypoints/"..b)
  if not pass then
    log("&cstartup&7/&c"..b.."&4 "..err)
  end
end

function LookAtBlock(X,Y,Z,offset)
    if offset == nil then offset = 0 end
    local boundingBox = getBoundingBox(X,Y,Z)
        if boundingBox then
	        local x,y,z = boundingBox.getCenter()
          lookAt(X+x,Y+y+offset,Z+z)
        end
end

function MoveToXYZ(x,y,z,boolean)
    while not isKeyDown("ESCAPE") do
		local X,Y,Z = getPlayerBlockPos()
		local distance = PlayerDist(X, Y, Z ,x,y,z)
		if distance <= 1 then break end
			LookAtBlock(x,y,z,2)
			sleep(10)
			forward(-1)
			sprint(boolean)
		end
	forward(0)
	return true
end

function GetWaypointStart(waypoints)
	local path = GetWayPoints(waypoints)
	local X,Y,Z = getPlayerBlockPos()
	local distance1 = PlayerDist(X, Y, Z ,path[1].x,path[1].y,path[1].z)
	local distance2 = PlayerDist(X, Y, Z ,path[#path].x,path[#path].y,path[#path].z)
	local var,limit, step
	if distance1 < distance2 then
		var = 1 limit = #path step = 1
		return var, limit, step
	else
		var = #path limit = 1 step = -1
		return var, limit, step
	end
end

function FollowPath(waypoints,sprint) --"lumbyAkBank"
	local path = GetWayPoints(waypoints)
	local var, limit, step = GetWaypointStart(waypoints)
	--LookAtBlock(path[var].x,path[var].y,path[var].z)
	for i = var ,limit, step do
		local reached = MoveToXYZ(path[i].x,path[i].y,path[i].z,sprint)
		while not reached do
		 sleep(3000)
		end
	end 
end

function Baritone() -- maybe, mabe not
	runOnMC(function(text) say(text) end, "/command")
end