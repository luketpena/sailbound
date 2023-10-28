/*
	These are the functions that trigger when you activate an item.
*/

function item_trigger_cannon() {
	global.item_current = Items.cannon;
	global.item_ammo = 12;
	sys_hud.item_singleUse = false;
}

function item_trigger_boomerang() {
	global.item_current = Items.boomerang;
	global.item_ammo = 1;
	sys_hud.item_singleUse = true;
}

function item_trigger_potion() {	
	boat_heal(8);
}

function item_trigger_repairBuddy() {	
	instance_create_layer(global.boat_x,global.boat_y-64,"l_items",obj_item_repairBuddy);
}