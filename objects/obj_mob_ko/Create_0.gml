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
poofRadius = 0;

part_particles_create(global.ps_fx_above,x,y,global.pt_burst_ko,8);

function init(_sprite_hit, _sprite_ko, _hspeed, _vspeed, _flip, _poofRadius) {
	sprite_index = _sprite_hit;
	flip = _flip;
	sprite_ko = _sprite_ko;
	hspeed_set = _hspeed;
	vspeed_set = _vspeed;
	poofRadius = _poofRadius
}