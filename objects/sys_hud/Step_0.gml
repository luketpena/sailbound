//----< Alphas >----\\
hud_alpha = grow(hud_active, hud_alpha, 0, 1, .05, .05);
item_alpha = grow( (global.item_current=-1), item_alpha, 0, 1, .05, .05);
coin_alpha = grow(coin_active, coin_alpha, 0, 1, .1, .05);

//----< Coins >----\\

if (coin_wait=-1) {
	//Activating the Coin GUI
	if (coin_count!=global.coin) {
		coin_active = true;
		coin_wait = 3*room_speed;
	}		
}

if (coin_alpha>0) {
	//Incrementing drawn coin ammount to actual coin ammount
	if (coin_count!=global.coin) {
		if (abs(global.coin-coin_count)>1) {
			coin_count += (global.coin-coin_count)*.1;
			if (coin_size<1.5) coin_size = 2;
		} else {
			coin_count = global.coin;
			coin_size = 2;
		}
	}
	//Deactivating Coin GUI
	if (coin_wait>0) coin_wait-- else {
		coin_wait = -1;
		coin_active = false;
	}
	//Animation coin spinning
	coin_anim = (coin_anim+.25) mod 10;
	//Animate coin growing
	if (coin_size>1) coin_size -= .1;
}
//----< Health >----\\
//Shaking hearts when taking damage
if (hp_shudder>0) {
	hp_shudder -= .05;
	hp_shudder_rot += 60;
}
//Hearts glow when gaining health
if (hp_glow>0) hp_glow -= .05;
//Health alpha deactivates when full
if (hp_wait>-1) {
	if (hp_wait>0) hp_wait-- else {
		if (hp_alpha>0) hp_alpha -= .05 else {
			hp_wait = -1;	
		}
	}
}

