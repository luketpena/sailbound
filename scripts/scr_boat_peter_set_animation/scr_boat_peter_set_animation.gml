///@description Sets a full-body animation for Peter
///@param sprite_index
///@param anim_speed
///@param anim_loop
///@param anim_duration
///@param anim_index 
function boat_peter_set_animation(argument0, argument1, argument2, argument3, argument4) {

	with(prnt_boat_draw) {
		anim_sprite = argument0;
		anim_speed = argument1;
		anim_loop = argument2;
		anim_duration = argument3;
		anim_index = argument4;
		anim_number = sprite_get_number(anim_sprite);
	}


}
