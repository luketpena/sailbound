if (active) {

	target_x += move_speed*face;

	avg_x = 0;
	for (var i=0; i<fish_num; i++) {
		var fish = fish_list[i];
	
		//Setting the speed
		fish.speed_flux_angle = (fish.speed_flux_angle+fish.speed_flux_rate) mod 360;
		var currentSpeed = fish.speed * (1 - (fish.speed_flux_influence * (.5 + lengthdir_x(1,fish.speed_flux_angle) * .5 ) ) );
	
		//Setting teh turn radius
		fish.turn_flux_angle = (fish.turn_flux_angle+fish.turn_flux_rate) mod 360;
		var currentTurn = lerp(turn_min,turn_max, .5 + lengthdir_x(1,fish.turn_flux_angle)*.5);
	
	
		var angleCorrection = false;
		if (fish.y<global.water_y+8) {
			var limit = water_find_y_basic(fish.x);
			if (fish.y<limit+8) {
				fish.angle -= angle_difference(fish.angle,270)*.1;	
				fish.y = max(fish.y,limit+4);
				angleCorrection = true;
			}
		}
	
		if (instance_exists(obj_ground)) {
		
			if (fish.y>obj_ground.top-8 && obj_ground.x-obj_ground.hlength<x) {
				fish.angle -= angle_difference(fish.angle,90)*.05;
				if (obj_ground.state="static") fish.y = min(fish.y,obj_ground.top);
				angleCorrection = true;
			}
		}
	
		//Setting the angle
		fish.dir_flux_angle = (fish.dir_flux_angle+fish.dir_flux_rate) mod 360;
		var currentAngle = fish.angle + lengthdir_x(fish.dir_flux_power,fish.dir_flux_angle);
	
		fish.x += lengthdir_x(currentSpeed,currentAngle);
		fish.y += lengthdir_y(currentSpeed,currentAngle);
		
		avg_x += fish.x;
	
		if (!angleCorrection) fish.angle -= angle_difference(fish.angle, point_direction(fish.x,fish.y,target_x+fish.target_offset_x,target_y+fish.target_offset_y))*currentTurn;
		if (fish.angle<0) fish.angle += 360;
		fish.angle = fish.angle mod 360;
	
		if (fish.angle>90 && fish.angle<270) fish.flip = -1 else fish.flip = 1;
	} //END fish_list loop
	
	avg_x /= fish_num;
	if ( (avg_x>exit_x && face=1) || (avg_x<exit_x && face=-1) ) {
		fade_active = true;	
	}
	
	if (fade_active) {
		if (image_alpha>0) image_alpha -= .01 else instance_destroy();	
	}
}