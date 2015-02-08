local module = {}

-- 1028, 29, 1022, 28, 1021, 141, 119, 37, 
-- need to gen more skin types? 
-- x = ""   x = x.. game.Selection:Get()[1].BrickColor.Number .. ", "   print(x) x =""


module.Races = {
{"Human",{1029, 5, 1030, 125, 18, 38, 217, 192},{["HeadType"]="Human", ["ExtraHat"]=nil,["HeadTexture"] = false}},


{"Orc",{1028, 29, 1022, 28, 1021, 141, 119, 37},{["HeadType"]="Human", ["LegSize"]=2.1,["ExtraHat"]=nil,["Face"]="defaultOrc01"}},

{"Elf",{1029, 5, 1030, 125, 18, 38, 217, 192},{["HeadType"]="Human", ["ExtraHat"]= game.ServerStorage.exus.RaceHats.elfEars ,["HeadTexture"] = false}},



{"Fish",{1028, 29, 1022, 28, 1021, 141, 119, 37},{["HeadType"]="Custom",
	["HeadMesh"]={{"MeshId","http://www.roblox.com/asset/?id=13065423"},{"Scale",Vector3.new(1,1,1)},{"MeshType","FileMesh"},{"Offset",Vector3.new(0,0,0)}},
	
	["LegSize"]=2,["ExtraHat"]=nil,["Face"]="defaultFish01"}},


{"Dwarf",{1029, 5, 1030, 125, 18, 38, 217, 192},{["HeadType"]="Human",["LegSize"]=1.6, ["ExtraHat"]= nil }},
}

a={BrickColor.new(1001).number,BrickColor.new("White").number,BrickColor.new("Light stone grey").number,BrickColor.new("Mid grey").number,BrickColor.new("Dark stone grey").number,BrickColor.new("Black").number,BrickColor.new("Really black").number,
BrickColor.new("Nougat").number,BrickColor.new("Brown").number,BrickColor.new("Dark orange").number,
BrickColor.new("Reddish brown").number,BrickColor.new("CGA brown").number
}




function module:updatePlayer(player) wait() -- Dear future self. needs or break the waitforChild
	
local s = game.Players:GetPlayerFromCharacter(player).Values 

	local itemBlacklist = {["Hat"]=true,["CharacterMesh"]=true}
	for i,v in pairs (player:GetChildren()) do if itemBlacklist[v.ClassName] then v:Destroy() end	
	end
	local Race,Color,Clothes = s.Race.Value,s.Color.Value,s.Color2.Value
	local raceselected = module.Races[Race]
	
	local racehat =  raceselected[3]["ExtraHat"]
	
	player:findFirstChild("Head").BrickColor = BrickColor.new(raceselected[2][Color])
	player:findFirstChild("Right Arm").BrickColor = BrickColor.new(raceselected[2][Color])
	player:findFirstChild("Left Arm").BrickColor = BrickColor.new(raceselected[2][Color])
	player:findFirstChild("Torso").BrickColor = BrickColor.new(a[Clothes])
	player:findFirstChild("Right Leg").BrickColor = BrickColor.new(a[Clothes])
	player:findFirstChild("Left Leg").BrickColor = BrickColor.new(a[Clothes])
	if racehat ~= nil then local r_hat = racehat:Clone() r_hat.Parent = player r_hat.Handle.BrickColor = BrickColor.new(raceselected[2][Color]) end
	module:legSize(player,Vector3.new(1, raceselected[3]["LegSize"] or 2,1))
	player.FaceBlink.Type.Value =  raceselected[3]["Face"] or "defaultface01"
	
	local head = player:findFirstChild("Head").Mesh
local meshSettings = raceselected[3]["HeadMesh"] or {{"MeshId",""},{"Scale",Vector3.new(1.25,1.25,1.25)},{"MeshType","Head"},{"Offset",Vector3.new(0,0,0)}}

	
	
for i = 1,#meshSettings do
	
	head[meshSettings[i][1]] = meshSettings[i][2]
	
end

end

	function module:legSize(player,Vec)
if player["Left Leg"].Size == Vec then return true end
local torso = player.Torso
local leftHip,rightHip= torso["Left Hip"],torso["Right Hip"]
local l0,l1,r0,r2 = leftHip.Part0,leftHip.Part1,rightHip.Part0,rightHip.Part1

leftHip.Part0,leftHip.Part1,rightHip.Part0,rightHip.Part1 = nil,nil,nil,nil
local lleg,rleg = torso.Parent["Left Leg"] ,  torso.Parent["Right Leg"]
lleg.FormFactor,rleg.FormFactor = "Custom","Custom"
lleg.Size,rleg.Size = Vec  , Vec 
leftHip.C0,rightHip.C0 = CFrame.new(-1, Vec.Y*-0.5, 0, -0, -0, -1, 0, 1, 0, 1, 0, 0), CFrame.new(1, Vec.Y*-0.5, 0, 0, 0, 1, 0, 1, 0, -1, -0, -0)
leftHip.Part0,leftHip.Part1,rightHip.Part0,rightHip.Part1 = l0,l1,r0,r2
 end


function updatePlayers () for i,v in pairs(game.Players:GetChildren()) do module:updatePlayer(v.Character) end end

return module