draw_primitive_begin(pr_trianglestrip);
	//First vertex is a single point
	draw_vertex_color(x,y,image_blend,image_alpha);
	//Other vertices have width
	for (var i=0; i<length; i++) {
		draw_vertex_color(joint_x[i]+lengthdir_x(joint_width[i],joint_dir[i]+90),joint_y[i]+lengthdir_y(joint_width[i],joint_dir[i]+90),image_blend,image_alpha);
		draw_vertex_color(joint_x[i]+lengthdir_x(joint_width[i],joint_dir[i]-90),joint_y[i]+lengthdir_y(joint_width[i],joint_dir[i]-90),image_blend,image_alpha);
	}
draw_primitive_end();