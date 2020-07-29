function water_step() {
	//-- WATER --\\
	for(var i=0; i<=water_num; i++) {
		//Inactive water points at global.water_y are not calculated
		if (water_point_active[i]) {
			
			//Y position is set to old y position and interpolated in sys_gameplay in off steps
			water_point_y[i] = water_point_y_track[i];
			water_point_dis[i] = global.water_y-water_point_y[i]; //movement
			
			//Pull on adjascent points beyond the first point
			if (i>0) {
				water_point_lDeltas[i] = (water_point_y[i]-water_point_y[i-1]);
				water_point_y[i-1] += water_point_lDeltas[i]*water_spread;
			}

			if (water_point_dis[i]<2 && water_point_vel[i]>0) {	
				//Snap water point position and deactivate when close to the global.water_y
				water_point_active[i] = false;
				water_point_vel[i] = 0;		
				water_point_y[i] = global.water_y;
				water_point_y_track[i] = global.water_y;
			} else {
				//Find the terminal speed for the water point at this given time
				var max_y = water_terminal*((water_point_dis[i]*water_fall_rate)/water_fall_dis)
				
				if (water_point_vel[i]>=max_y) {
					//Water point capped at maximum velocity
					water_point_vel[i] = max_y;
				} else {
					//Water point accelerating towards maximum velocity
					water_point_vel[i] += water_gravity;
				}		
				//Adjust the position of the point according to current velocity
				water_point_y_track[i] += water_point_vel[i];
			}
			
		} else { //END water point activity check
			//Snapping water point position to level when inactive
			water_point_y[i] = global.water_y	
		}
	} //END of loop through points
}

//Interpolation happens every other step with water_step to smooth 30fps calculations into 60fps motion
function water_interpolate() {
	for(var i=0; i<=water_num; i++) {
		if (water_point_active[i]) {
			water_point_y[i] += (water_point_y_track[i]-water_point_y[i])/2;
			if (i>0) {
				water_point_y[i-1] += (water_point_lDeltas[i]*water_spread)/2;
			}	
		}
	}
}
