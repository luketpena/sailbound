//---- Movmeent ----\\
move_rot = (move_rot+move_rot_speed) mod 360;
move_dir = lengthdir_y(move_rot_dis,move_rot);

x += lengthdir_x(move_speed,move_dir);
y += lengthdir_y(move_speed,move_dir);

//---- Movement ----\\
if (fade_active) {
	if (image_alpha>0) image_alpha -= .025 else instance_destroy();	
}

//---- Joints ----\\
for (var i=0; i<length; i++) {
	if (i=0) {
		joint_dir[i] = point_direction(joint_x[i],joint_y[i],x,y);
		joint_dis[i] = point_distance(joint_x[i],joint_y[i],x,y);
	} else {
		joint_dir[i] = point_direction(joint_x[i],joint_y[i],joint_x[i-1],joint_y[i-1]);	
		joint_dis[i] = point_distance(joint_x[i],joint_y[i],joint_x[i-1],joint_y[i-1]);	
	}
	
	joint_x[i] += lengthdir_x(joint_dis[i]*stretch,joint_dir[i]);
	joint_y[i] += lengthdir_y(joint_dis[i]*stretch,joint_dir[i]);
}

