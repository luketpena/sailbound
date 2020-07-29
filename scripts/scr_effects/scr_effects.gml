///@description Creates a one-off effect

function create_effect(x, y, layer, sprite, index, speed, blend, alpha, xscale, yscale, angle) {
	var o = instance_create_layer(x,y,layer,obj_effect);
	with(o) {
		sprite_index = sprite;
		image_index = index;
		image_speed = speed;
		image_blend = blend;
		image_alpha = alpha;
		image_xscale = xscale;
		image_yscale = yscale;
		image_angle = angle;
		active = true;
	}
	return o;
}

function create_debris(x,y,sprite,index,spd_min,spd_max,dir_min,dir_max,rot_min,rot_max,flash) {
	var o = instance_create_layer(x,y,l_main,obj_fx_debris);
	o.init(sprite,index,spd_min,spd_max,dir_min,dir_max,rot_min,rot_max,flash);
}