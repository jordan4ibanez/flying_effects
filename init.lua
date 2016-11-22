minetest.register_globalstep(function(dtime)
	for _,player in ipairs(minetest.get_connected_players()) do
		local fly,_ = minetest.check_player_privs(player:get_player_name(), "fly")
		
		
		if fly == false then
			break
		end
		
		local pos = player:getpos()
		
		local control = player:get_player_control()
		
		local nodebelow = minetest.get_node({x=pos.x,y=pos.y-1,z=pos.z}).name
		
		if (fly == true and (control.jump == true or control.sneak == true or control.up == true or control.down == true)) or (fly == true and nodebelow == "air") then
			
			minetest.add_particlespawner({
				amount = 10,
				time = 0.1,
				minpos = {x=pos.x-(0.5), y=pos.y-0.1, z=pos.z-(0.5)},
				maxpos = {x=pos.x+(0.5), y=pos.y+0.1, z=pos.z+(0.5)},
				minvel = {x=0, y=-5, z=0},
				maxvel = {x=0, y=-10, z=0},
				minacc = {x=0, y=0, z=0},
				maxacc = {x=0, y=0, z=0},
				minexptime = 0.5,
				maxexptime = 1.5,
				minsize = 0.5,
				maxsize = 1,
				collisiondetection = true,
				vertical = false,
				texture = "flying_particles.png",
			})
		end
	end
end)
