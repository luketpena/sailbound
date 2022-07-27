
// Light position
if instance_exists(light) {
	light.x = x;
	light.y = y;
}

//Collide and open
if (exploding) {
	if (explode_wait>0) explode_wait-- else explode();
	
	flash += (1-flash)*.25;
	image_xscale = 1+(.5*flash);
	image_yscale = image_xscale;
	
} else {	
	behave_step_bouncer();
	floater_step(0);
	lighting_flash_step();
		
	//Bursting and coin creation
	if (!bursting) {
		if (image_index>=2) {
			burst();
		}
	} else {
		//Creating coins
		if (coins>0) {
			if (coin_wait>0) coin_wait-- else {
				var num = ceil(coins*.1);
				repeat(num) create_coin(x,y-8,2,5,80,100);
				coins -= num;
				coin_wait = irandom(2);
			}
		}
		//Animating bounce
		if (burst_anim<1) burst_anim += .05;
		image_xscale = ease_lerp(EASE.OutBounce,2,1,burst_anim);
		image_yscale = ease_lerp(EASE.OutBounce,.2,1,burst_anim);
	}
	
	//Disappearing after burst
	if (fade_active) {
		if (fade_wait>0) fade_wait-- else {
			if (image_alpha>0) {
				image_alpha -= .05;
			} else instance_destroy();		
		}
	}
}