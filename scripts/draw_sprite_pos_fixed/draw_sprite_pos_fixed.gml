/// @description  draw_sprite_pos_fixed(sprite,subimg,x1,y1,x2,y2,x3,y3,x4,y4,colour,alpha);
/// @param sprite
/// @param subimg
/// @param x1
/// @param y1
/// @param x2
/// @param y2
/// @param x3
/// @param y3
/// @param x4
/// @param y4
/// @param colour
/// @param alpha
function draw_sprite_pos_fixed(sprite, subimg, x1, y1, x2, y2, x3, y3, x4, y4, colour, alpha) {

	var ax, ay, bx, by, cx, cy, s, t, q, can, v_buffer;

	var texture = sprite_get_texture(sprite, subimg);
	var uvs = sprite_get_uvs(sprite, subimg);

	ax = x3 - x1;
	ay = y3 - y1;
	bx = x4 - x2;
	by = y4 - y2;

	can = ax * by - ay * bx;

	if (can != 0) {
	  cx = x1 - x2;
	  cy = y1 - y2;  
	  s = (ax * cy - ay * cx) / can;  
	  if (s > 0 and s < 1) {
	    t = (bx * cy - by * cx) / can;    
	    if (t > 0 and t < 1) {
	      q[0] = 1 / (1 - t);
	      q[1] = 1 / (1 - s);
	      q[2] = 1 / t;
	      q[3] = 1 / s;
	      v_buffer = vertex_create_buffer();
	      vertex_begin(v_buffer, global.format_perspective);
	      vertex_colour(v_buffer, colour, alpha);
	      vertex_position(v_buffer, x4, y4);
	      vertex_normal(v_buffer, q[3]*uvs[0], q[3]*uvs[1], q[3]);
	      vertex_colour(v_buffer, colour, alpha);
	      vertex_position(v_buffer, x3, y3);
	      vertex_normal(v_buffer, q[2]*uvs[2], q[2]*uvs[1], q[2]);
	      vertex_colour(v_buffer, colour, alpha);
	      vertex_position(v_buffer, x1, y1);
	      vertex_normal(v_buffer, q[0]*uvs[0], q[0]*uvs[3], q[0]);
	      vertex_colour(v_buffer, colour, alpha);
	      vertex_position(v_buffer, x2, y2);
	      vertex_normal(v_buffer, q[1]*uvs[2], q[1]*uvs[3], q[1]);
	      vertex_end(v_buffer);
	      shader_set(sh_perspective);
	      vertex_submit(v_buffer, pr_trianglestrip, texture);
	      shader_reset();
	      vertex_delete_buffer(v_buffer);
	    }
	  }
	}
}

function draw_texture_pos(texture, x1, y1, x2, y2, x3, y3, x4, y4, colour, alpha) {

	var ax, ay, bx, by, cx, cy, s, t, q, can, v_buffer;

	var uvs = texture_get_uvs(texture);

	ax = x3 - x1;
	ay = y3 - y1;
	bx = x4 - x2;
	by = y4 - y2;

	can = ax * by - ay * bx;

	if (can != 0) {
	  cx = x1 - x2;
	  cy = y1 - y2;  
	  s = (ax * cy - ay * cx) / can;  
	  if (s > 0 and s < 1) {
	    t = (bx * cy - by * cx) / can;    
	    if (t > 0 and t < 1) {
	      q[0] = 1 / (1 - t);
	      q[1] = 1 / (1 - s);
	      q[2] = 1 / t;
	      q[3] = 1 / s;
	      v_buffer = vertex_create_buffer();
	      vertex_begin(v_buffer, global.format_perspective);
	      vertex_colour(v_buffer, colour, alpha);
	      vertex_position(v_buffer, x4, y4);
	      vertex_normal(v_buffer, q[3]*uvs[0], q[3]*uvs[1], q[3]);
	      vertex_colour(v_buffer, colour, alpha);
	      vertex_position(v_buffer, x3, y3);
	      vertex_normal(v_buffer, q[2]*uvs[2], q[2]*uvs[1], q[2]);
	      vertex_colour(v_buffer, colour, alpha);
	      vertex_position(v_buffer, x1, y1);
	      vertex_normal(v_buffer, q[0]*uvs[0], q[0]*uvs[3], q[0]);
	      vertex_colour(v_buffer, colour, alpha);
	      vertex_position(v_buffer, x2, y2);
	      vertex_normal(v_buffer, q[1]*uvs[2], q[1]*uvs[3], q[1]);
	      vertex_end(v_buffer);
	      shader_set(sh_perspective);
	      vertex_submit(v_buffer, pr_trianglestrip, texture);
	      shader_reset();
	      vertex_delete_buffer(v_buffer);
	    }
	  }
	}
}
