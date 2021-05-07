lighting_flash_init();
floater_init(24,16,true,4,10);
flash = 1;

active = false;
alarm[0] = .15*room_speed;

vspeed_set = 0;
hspeed_set = 0;
anim_length = 0;
image_blend = c_front;

move_hspeed = 0;
move_vspeed = 0;

sprite_ko = noone;
flip = 0;

bounce_lerp = 0;

part_particles_create(global.ps_fx_above,x,y,global.pt_burst_ko,8);