rope_num = 16;
rope_array = [];

rope_length = 8;
var	xx = x+16,
	yy = y+32;

for (var i=0; i<rope_num; i++) {
	var target_y = yy + (rope_length * i);
	var o = instance_create_layer(xx, target_y, layer, obj_rope);
	rope_array[i] = o;
	o.root = id;
	o.index = i;
	
	if (i = 0) {
		physics_joint_revolute_create(id, o, xx, target_y, -45, 45, false, 0, 0, false, false);
	} else {
		physics_joint_revolute_create(rope_array[i-1], o, xx, target_y, -45, 45, false, 0, 0, false, false);
	}
}

function grab(index) {
	grab_position = 8 + (rope_length * index);
	findGrabCoordinates();
}
grab_length = (rope_num * rope_length) - 1;
grab_position = 0;
grab_subPosition = 0;
grab_index = 0;

grab_x = 0;
grab_y = 0;

function findGrabCoordinates() {
	var rope = rope_array[grab_index],
	dir = rope.image_angle-90;

	grab_x = rope.x + lengthdir_x(grab_subPosition, dir);
	grab_y = rope.y + lengthdir_y(grab_subPosition, dir);	
}

function getActiveRope() {
	return rope_array[grab_index];	
}