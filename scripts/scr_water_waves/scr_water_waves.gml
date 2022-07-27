

function waves_step() {
	for (var i=0; i<waveConfig.count; i++) {	
		var wave = waveList[i];
		if (wave.active) {	
			//Save where the wave was last...
			var saved = wave.point;
			//...then check where it will be next.
			wave.point = round((wave.x / room_width) * water_num);
			var choice = wave.point;
		
			//Only add motion to waves if it has not already done that.
			if (saved != choice) {
				//Adding the power
				water_point_vel[choice] = wave.strength * global.motion;
				water_point_active[choice] = true;
				if (choice < water_num) water_point_active[choice+1] = true;
				//Find out how many tile units the waves has moved over in one frame.
				var n = choice-saved-1;
				//If it is more than a single tile, then add motion to those points as well.
				while (n>0) {
					var filler = choice+n;
					water_point_vel[filler] = wave.strength * global.motion;
					water_point_active[filler] = true;
					n--;
				}			
			} //END wave motion
		
			//Stop the wave when outside of the room
			if (wave.x <= 0) then {
				wave.x = room_width;
				wave.active = false;
			} else {
				//Moving the wave
				wave.x += wave.speed;
				if (!global.stop) {
					part_particles_create_color(
						global.ps_water_surface, wave.x,
						random(settings.water_depth),
						pt_water_wave_wake,
						c_water_highlight,
						1
					);
				}
			}
		
		} //END wave active check
	} //END wave loop

	//it is checking an arbitrary point to see if is ready to spawn a new waveConfig. The point is 10.
	//water_point_vel[10]>=0 && abs(water_point_dis[10])<8 && wave_active[waveConfig.cycle]=false && 
	
	if (waveConfig.timer = -1) {
		waveConfig.timer = irandom_range(waveConfig.minTimer, waveConfig.maxTimer);
	}
	
	if (!global.stop) {
		if (waveConfig.timer > 0) waveConfig.timer--;
	
		var nextWave = waveList[waveConfig.cycle];
		if (waveConfig.timer = 0 && waveConfig.active) {
			nextWave.active = true;	
			nextWave.strength = random_range(waveConfig.minPower, waveConfig.maxPower);
			nextWave.speed = random_range(waveConfig.minSpeed, waveConfig.maxSpeed);
			waveConfig.timer = -1;
	
			nextWave.x = room_width;
			nextWave.drawX = room_width;
	
			waveConfig.cycle = (waveConfig.cycle + 1) mod waveConfig.count;
		}
	}
}
	
function waves_set_active(active) {
	sys_water.waveConfig.active = active;
}

function waves_set_behavior(gravity, terminal, power_min, power_max, speed_min, speed_max, wait_min, wait_max) {
	with(sys_water) {
		water_gravity = gravity;
		water_terminal = terminal;
		
		waveConfig.minPower = power_min;
		waveConfig.maxPower = power_max;
		waveConfig.minSpeed = speed_min;
		waveConfig.maxSpeed = speed_max;
		waveConfig.minTimer = wait_min * room_speed;
		waveConfig.maxTimer = wait_max * room_speed;
	}
}

enum WaveTypes {
	Normal,
	High,
	Calm, 
	Stagnant, 
	Rolling
}

function waves_set_behavior_preset(wave_type) {
	switch(wave_type) {
		case WaveTypes.Normal:	 waves_set_behavior(.4, 2, -2, -8, -2, -6, 1, 3); break;
		case WaveTypes.Calm:     waves_set_behavior(.3, 1.5, -2, -4, -2, -3, 1.5, 4.5); break;
		case WaveTypes.Stagnant: waves_set_behavior(.2, 1, -1, -2, -1, -3, 3, 6); break;
		case WaveTypes.High:     waves_set_behavior(.2, 1.25, -3, -5, -2, -4, 1, 4); break;
		case WaveTypes.Rolling:  waves_set_behavior(.1, 1, -3, -6, -3, -6, 2, 3); break;
	}
}