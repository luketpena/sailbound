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

//>> General
global.stop = false; // Has the boat stopped moving?

// -- ORBS --
hullOrbsCollected = []; // Tracks which orbs you have collected so far
var _shipIds = vault.inventory.getHullsLostByLevelId(global.level_id);
for (var i=0; i<array_length(_shipIds); i++) {
	var _id = _shipIds[i];
	var o = instance_create_layer(0, 0, l_main, o_pickup_shipOrb);
	o.init(_id);
}