//draw_set_alpha(1);
draw_primitive_begin_texture(pr_trianglestrip, tex);
	for (var i=0; i<=unitCount; i++) {
		var segment = segments[i];
		var ytex = 1 - (texUnit * i);
		var str = (i / unitCount);
		var offsetY = rotMain.getDisY(null, tilt) * str;
		var offsetX = offsetY + (tilt * str);
		
		draw_vertex_texture_color(segment.x1 + offsetX, segment.y - offsetY, 0, ytex, c_white, 1);
		draw_vertex_texture_color(segment.x2 + offsetX, segment.y + offsetY, 1, ytex, c_white, 1);
	}
draw_primitive_end();