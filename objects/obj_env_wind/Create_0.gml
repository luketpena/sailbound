//---- Movement ----\\
move_speed = random_range(1,3);
move_dir = 0
move_rot = random(360);
move_rot_speed = random_range(1,3);
move_rot_dis = random_range(8,24);

//---- Fading and Drawing ----\\
alarm[0] = irandom_range(1*room_speed,3*room_speed);
image_alpha = 1;
image_blend = c_front;
fade_active = false;

//---- Joints ----\\
length = 8;
stretch = random_range(.1,.3);
for (var i=0; i<length; i++) {
	joint_width[i] = lerp(1,0,i/length);
	joint_x[i] = x-2*i;
	joint_y[i] = y;
	if (i=0) {
		joint_dir[i] = point_direction(joint_x[i],joint_y[i],x,y);
		joint_dis[i] = point_distance(joint_x[i],joint_y[i],x,y);
	} else {
		joint_dir[i] = point_direction(joint_x[i],joint_y[i],joint_x[i-1],joint_y[i-1]);	
		joint_dis[i] = point_distance(joint_x[i],joint_y[i],joint_x[i-1],joint_y[i-1]);	
	}	
}