fixture_create_box(id,4,4,.5,.1,.1,.1,.2,true,true);
behave_init(behave.bouncer,.1,4,1,true,.01,.9,3,.4,.05,-1);
floater_init(32,16,true,4,5);
lighting_flash_init();

image_speed = 0;

chest_type = -1; //Holds the enum type for the chest
open = false; //Triggers animation
burst = false; //Creates the coins
exploding = false;

coins = 0; //How many coins will burst out
coin_wait = 0; //Delay between coin creation

//For fading out after bursting open
fade_active = false;
fade_wait = 2*room_speed;

glow_width = 0;
glow_x = 0;
glow_alpha = 2;

light = noone;
burst_anim = 0;

explode_wait = .075*room_speed
explode_dir = 0;

function setCoinAmount() {
	switch(chest_type) {
		case chests.gold: coins = 20; break;
		case chests.silver: coins = 10; break;
		case chests.bronze: coins = 5; break;
	}
}

function explode() {
	
	if (!burst) {
		setCoinAmount();
		part_particles_create(global.ps_fx_above,x,y,global.pt_explosion_burst,32);
		create_effect(x+phy_speed_x,y,l_main,spr_fx_burst_star,0,1,c_white,1.5,1,1,random(360));
	
		repeat(coins) {
			var coinDir = explode_dir-(angle_difference(explode_dir,90)*.5)
			create_coin(x,y,2,5,coinDir-15,coinDir+15);
		}
	}
	
	for (var i=0; i<8; i++) {
		var debrisDir = explode_dir-(angle_difference(explode_dir,90)*.5)
		create_debris(x,y,spr_fx_chest_debris,i,1,2,debrisDir-25,debrisDir+25,200,300,1);
	}
	
	instance_destroy();
}