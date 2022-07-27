var collideWithBoat = collision_rectangle(left, top, right, y, prnt_boat, false, true);

if (collideWithBoat) {
	boat_accel_vspeed(-6, .5);
}

var collideWithMob = collision_rectangle(left, top, right, y, prnt_mob, false, true);
if (collideWithMob) {
	collideWithMob.knockout();
}

var physicsBobberList = ds_list_create();

var numberOfBobbersCollided = collision_rectangle_list(left, top, right, y, prnt_physicsBobber, false, true, physicsBobberList, false);
if (numberOfBobbersCollided > 0) {
	for (var i=0; i<numberOfBobbersCollided; i++) {
		var bobber = physicsBobberList[| i];
		with(bobber) {
			var xforce = (x - obj_whale_spout_hitbox.x) / 15;
			physics_apply_force(phy_position_x, phy_position_y, xforce, -20);
		}
	}
}

ds_list_destroy(physicsBobberList);

var chestList = ds_list_create();

var numberOfChestsCollided = collision_rectangle_list(left, top, right, y, obj_chest, false, true, chestList, false);
if (numberOfChestsCollided > 0) {
	for (var i=0; i<numberOfChestsCollided; i++) {
		var chest = chestList[| i];
		with(chest) {
			var xforce = (x - obj_whale_spout_hitbox.x) / 25;
			physics_apply_force(phy_position_x, phy_position_y, xforce, -15);
		}
	}
}

ds_list_destroy(chestList);

if (coinTimer > 0) coinTimer-- else {
	coinTimer = irandom_range(3, 10);
	create_coin(x + random_range(-8, 8), y, 4, 8, 80, 100);
} 


left = x - hWidth;
right = x + hWidth;
top = y - height;