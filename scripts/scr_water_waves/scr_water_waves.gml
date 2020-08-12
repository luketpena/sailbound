enum waves {
	normal,
	calm,
	stagnant,
	rolling
}

function waves_step() {
	for (var i=0; i<wave_num; i++) {	
		if (wave_active[i]) {	
			//Save where the wave was last...
			var saved = wave_point_choice[i];
			//...then check where it will be next.
			wave_point_choice[i] = round((wave_x[i]/room_width)*water_num);
			var choice = wave_point_choice[i];
		
			//Only add motion to waves if it has not already done that.
			if (saved!=choice) {
				//Adding the power
				water_point_vel[choice] = wave_power[i]*global.motion;
				water_point_active[choice] = true;
				if (choice<water_num) water_point_active[choice+1] = true;
				//Find out how many tile units the waves has moved over in one frame.
				var n = choice-saved-1;
				//If it is more than a single tile, then add motion to those points as well.
				while (n>0) {
					var filler = choice+n;
					water_point_vel[filler] = wave_power[i]*global.motion;
					water_point_active[filler] = true;
					n--;
				}			
			} //END wave motion
		
			//Stop the wave when outside of the room
			if (wave_x[i]<=0) then {
				wave_x[i] = room_width;
				wave_active[i] = false;
			} else {
				//Moving the wave
				wave_x[i]+= wave_speed[i];
				if (!global.stop) part_particles_create_color(global.ps_water_surface,wave_x[i],random(settings.water_depth),pt_water_wave_wake,global.c_water_surface_lt,1);
			}
		
		} //END wave active check
	} //END wave loop

	//it is checking an arbitrary point to see if is ready to spawn a new wave. The point is 10.
	//water_point_vel[10]>=0 && abs(water_point_dis[10])<8 && wave_active[wave_cycle]=false && 
	
	if (wave_wait=-1) then wave_wait = irandom_range(wave_wait_min,wave_wait_max);
	
	if (!global.stop) {
		if (wave_wait>0) wave_wait--;
	
		if (wave_wait=0 && wave_sys_active) {
			wave_active[wave_cycle] = true;	
			wave_power[wave_cycle] = random_range(wave_pwr_min,wave_pwr_max);
			wave_speed[wave_cycle] = random_range(wave_speed_min,wave_speed_max);
			wave_wait = -1;
	
			wave_x[wave_cycle] = room_width;
			wave_draw_x[wave_cycle] = room_width;
	
			wave_cycle = (wave_cycle+1) mod wave_num;
		}
	}
}
	
function waves_set_active(active) {
	sys_water.wave_sys_active = active;
}

function waves_set_behavior(gravity, terminal, power_min, power_max, speed_min, speed_max, wait_min, wait_max) {
	with(sys_water) {
		water_gravity = gravity;
		water_terminal = terminal;
		
		wave_pwr_min = power_min;
		wave_pwr_max = power_max;
		wave_speed_min = speed_min;
		wave_speed_max = speed_max;
		wave_wait_max = wait_min*room_speed;
		wave_wait_min = wait_max*room_speed;
	}
}

function waves_set_behavior_preset(wave_type) {
	switch(wave_type) {
		case waves.normal:	 waves_set_behavior(.4,2,-2,-8,-2,-6,1,3); break;
		case waves.calm:     waves_set_behavior(.3,1.5,-2,-4,-2,-3,1.5,4.5); break;
		case waves.stagnant: waves_set_behavior(.2,1,-1,-2,-1,-3,3,6); break;
		case waves.rolling:  waves_set_behavior(.1,1,-3,-6,-3,-6,2,3); break;
	}
}