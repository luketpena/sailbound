/// @description Pickup

test();

var can_pick_up = false;
for (var i=0; i<4; i++) {
	if (!global.inventory[i].active) {
		can_pick_up = true;
		break;
	}
}

if (can_pick_up) {
	item_pickup(item);
	instance_destroy();
}