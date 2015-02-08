
local name = {
	
["defaultOrc01"]= {167963887,211917801},
["defaultFish01"]= {212206911,212206911},
}





while wait() do
	for i = 1,60 do
	if name[script.Type.Value]  then
			script.Parent.Head.face.Texture = "http://www.roblox.com/asset/?id=" .. name[script.Type.Value][1] 	
		else 
script.Parent.Head.face.Texture = "http://www.roblox.com/asset/?id=59286975" end wait(0.1)
	end	
		if name[script.Type.Value]  then
			script.Parent.Head.face.Texture =  "http://www.roblox.com/asset/?id=" .. name[script.Type.Value][2]			
			else
			script.Parent.Head.face.Texture = "http://www.roblox.com/asset/?id=211917730" end wait(0.05)

end