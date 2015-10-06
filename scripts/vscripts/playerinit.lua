function initplayerstats()
	PlayerStats={}--玩家数组
	--playerid=0
	for i=0,9 do
		PlayerStats[i]={}  --每个玩家的数据包
		PlayerStats[i]['length']=0
	end
	--初始化刷怪
	local temp_zuoshang=Entity:FindByName(nil,"zuoshang")--根据地图找到实体API
	zuoshang_zuobiao=temp_zuoshang:GetAsOrigin()

	local temp_youxia=Entity:FindByName(nil,"youxia")--根据地图找到实体的API找到坐标
	youxia_zuobiao=temp_youxia:GetAsOrigin()
	--刷5个羊 3个牛  1个火人
	for i=1,5 do
		createunit("yang")
	end
	createunit("niu")
	createunit("niu")
	createunit("niu")

	createunit("huoren")

end


function createunit(unitname)
	local location = Vector(math.random(youxia_zuobiao.x-zuoshang_zuobiao.x)+zuoshang_zuobiao.x,math.random(youxia_zuobiao.y-zuoshang_zuobiao.y)+zuoshang_zuobiao.y,0)
	local unit = CreateUnitByName(unitname , location, true , nil , nil , DOTA_TEAM_NEUTRALS)--创建单位
	unit:SetContext("name",unitname,0)--单位获取标签

end