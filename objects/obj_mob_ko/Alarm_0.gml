///@description Activate

lighting_flash_step();

active = true;
move_vspeed = vspeed_set;
move_hspeed = hspeed_set;
anim_length = sprite_get_number(sprite_index);
if (sprite_ko) sprite_index = sprite_ko;

alarm[1] = .5*room_speed;