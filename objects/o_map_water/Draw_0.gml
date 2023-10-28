var _tilt = (o_map_camera.image_zscale - o_map_camera.zscale_min) / (o_map_camera.zscale_max - o_map_camera.zscale_min);

var _topColor = merge_color(c_water_surface, c_water_horizon, .25 * _tilt);

var _tl = lengthdir_chain([
	{ len: global.hvh * o_map_camera.image_zscale, dir: -global.camAngle + 180 },
	{ len: global.hvw, dir: 90 }
]);
var _tr = lengthdir_chain([
	{ len: global.hvh * o_map_camera.image_zscale, dir: -global.camAngle + 180 },
	{ len: global.hvw, dir: -90 }
]);
var _ml = lengthdir_chain([
	{ len: 0, dir: -global.camAngle },
	{ len: global.hvw, dir: -90 }
]);
var _mr = lengthdir_chain([
	{ len: 0, dir: -global.camAngle },
	{ len: global.hvw, dir: 90 }
]);
var _bl = lengthdir_chain([
	{ len: global.hvh * o_map_camera.image_zscale, dir: -global.camAngle },
	{ len: global.hvw, dir: -90 }
]);
var _br = lengthdir_chain([
	{ len: global.hvh * o_map_camera.image_zscale, dir: -global.camAngle },
	{ len: global.hvw, dir: 90 }
]);

//draw_circle(obj_map_playerIcon.x + _bl.x, obj_map_playerIcon.y + _bl.y, 32, false);


draw_primitive_begin(pr_trianglestrip);
	draw_vertex_color(o_map_player.x + _tl.x, o_map_player.y + _tl.y, _topColor, 1);
	draw_vertex_color(o_map_player.x + _tr.x, o_map_player.y + _tr.y, _topColor, 1);
	draw_vertex_color(o_map_player.x + _ml.x, o_map_player.y + _ml.y, c_water_surface, 1);
	draw_vertex_color(o_map_player.x + _mr.x, o_map_player.y + _mr.y, c_water_surface, 1);
	draw_vertex_color(o_map_player.x + _bl.x, o_map_player.y + _bl.y, c_water_surface, 1);
	draw_vertex_color(o_map_player.x + _br.x, o_map_player.y + _br.y, c_water_surface, 1);
draw_primitive_end();
