///@description Adds or subtracts from global.hp
///@param change
function scr_health_increment(argument0) {

	var change = argument0;
	global.hp = clamp(global.hp+change,0,global.hp_max);

	with(sys_hud) {
		if (change>0)	{
			hp_glow = 1;
			if (global.hp=global.hp_max) hp_wait = 3*room_speed;
		}
		if (change<0) {
			hp_wait = -1;
			hp_shudder = 1;
			hp_alpha = 1;
		}
	}


}
