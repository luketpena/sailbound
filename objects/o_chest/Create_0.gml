fixture_create_box(id, 4, 4, .5, .1, .1, .1, .2, true, true);
behave_init(behave.bouncer, .1, 4, 1, true, .01, .9, 3, .4, .05, -1);
floater_init(32, 16, true, 4, 5);
lighting_flash_init();

image_speed = 0;

type = -1; //Holds the enum type for the chest
opened = false; //Triggers animation
bursting = false; //Creates the coins
exploding = false;

coins = 0; //How many coins will burst out
coin_wait = 0; //Delay between coin creation

//For fading out after bursting open
fade_active = false;
fade_wait = seconds(2);

glow_width = 0;
glow_x = 0;
glow_alpha = 2;

light = noone;
burst_anim = 0;

explode_wait = seconds(.075);
explode_dir = 0;

function init(_chestConfig) {
	var _config = new _chestConfig();
	sprite_index = _config.sprite;
	coins = _config.coins;
	glow_width = _config.glowWidth;
	glow_x = _config.glowX;
}

function explode() {
	
	if (!burst) {
		part_particles_create(global.ps_fx_above, x, y, global.pt_explosion_burst, 32);
		create_effect(x+phy_speed_x, y, l_main, spr_fx_burst_star, 0, 1, c_white, 1.5, 1, 1, random(360));
	
		repeat(coins) {
			var coinDir = explode_dir-(angle_difference(explode_dir, 90)*.5)
			create_coin(x, y, 2, 5, coinDir-15, coinDir+15);
		}
	}
	
	for (var i=0; i<8; i++) {
		var debrisDir = explode_dir-(angle_difference(explode_dir, 90)*.5)
		create_debris(x, y, s_fx_chest_debris, i, 1, 2, debrisDir-25, debrisDir+25, 200, 300, 1);
	}
	
	instance_destroy();
}

function open() {
	opened = true;
	image_speed = 1;
	phy_speed_y = 1;
	impactLock = ImpactLock.Up;
	flash = .5;
}

function burst() {
	bursting = true;
	behave_float_active = false;
	flash = 1;
	phy_speed_x *= .5;
	part_particles_create(global.ps_fx_above, x, y, global.pt_burst_chest, 16);
	light = light_create(x, y, spr_fx_flare_300, 0, 1, 1, c_gold, 1, 0, .025);	
}