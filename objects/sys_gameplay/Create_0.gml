//>> Boat Status
global.hp = 16;
global.hp_max = 20;
global.rings = 0;
global.ko = false;
global.coin = 0;
global.combo = 0;

global.boat_canTouch = true; //Can objects physically interact with the boat?
global.boat_canDamage = true; //Can the boat be damaged?
global.boat_canImpact = (global.boat_canTouch && global.boat_canDamage);

//>> Inventory
global.inventory = [];
for (var i=0; i<4; i++) {
	global.inventory[i] = new item_slot();	
}
global.inventory_free = false;

//>> Items
global.item_current = -1;
global.item_ammo = 0;
global.item_list = item_list();

//>> General
global.stop = false; // Has the boat stopped moving?
global.motion = 1; // The motion multiplier