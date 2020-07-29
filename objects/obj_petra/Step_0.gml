//Setting up basic variables for aim and position
var y_limit = water_find_y_basic(x)-16;
var aim_h = gamepad_axis_value(0,gp_axisrh);
var aim_v = gamepad_axis_value(0,gp_axisrv);

//State machine setup
switch(mode) {
	case "idle":
		if (aim_active) {
			target_pos = [
				obj_boat_front.x_center_draw+(32*aim_h),
				min(obj_boat_front.y_center_draw-24+(32*aim_v),y_limit)
			]
		} else {
			target_pos = [
				obj_boat_front.x_center_draw-32,
				min(obj_boat_front.y_center_draw-32,y_limit)
				];
		}
		break;
}

//Adjust actual Petra position
x += (target_pos[0]-x)*.1;
y += (target_pos[1]-y)*.1;
item_y = y+12;

if (global.item_current=-1) {
	aim_active = false;
	point_dir = 0;
	
} else if (abs(aim_h)>.1 || abs(aim_v)>.1) {
	aim_active = true;
	point_dir = point_direction(0,0,aim_h,aim_v);	
}

//Increment and adjust the aim direction
aim_dir -= angle_difference(aim_dir,point_dir)*.25;
aim_dir = aim_dir mod 360;
if (aim_dir<0) aim_dir+=360;

//Choose petra sprite based on aim direction
if (aim_dir>135 && aim_dir<215) sprite_index = spr_petra_carry_l
else if (aim_dir<45 || aim_dir>305) sprite_index = spr_petra_carry_r
else sprite_index = spr_petra_carry_f;

if gamepad_button_check_pressed(0,gp_shoulderrb) {
	event_user(0);
}