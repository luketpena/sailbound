global.ko = false;
global.coin = 0;

global.hp = 16;
global.hp_max = 20;

global.inventory = [];
for (var i=0; i<4; i++) {
	global.inventory[i] = new item_slot();	
}
global.inventory_free = false;

global.item_current = -1;
global.item_ammo = 0;

global.item_list = item_list();

global.boat_canTouch = true; //Can objects physically interact with the boat?
global.boat_canDamage = true; //Can the boat be damaged?
global.boat_canImpact = (global.boat_canTouch && global.boat_canDamage);

global.stop = false;
global.motion = 1;