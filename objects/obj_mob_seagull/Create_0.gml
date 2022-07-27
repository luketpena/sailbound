fixture_create_box(id, 4, 5, .1, .1, .1, .1, .2, true, true);

moveSpeed = random_range(1, 2);
heightOffsetFromBoat = irandom_range(16, 24);
face = 0;

state = "flyToPlayer";
attackRange = 16;
stateTimer = 0;
completedAttack = false;

carryObject = SeagullCarryObject.Coconut;

sprite_index = spr_mob_seagull_carry;

function moveToPlayer() {
	var waterY = water_find_y_basic(phy_position_x);
	var targetY = min(
		(obj_boat_front.y_center_draw - heightOffsetFromBoat), 
		waterY - 48
	);

	phy_position_y += (targetY - phy_position_y) / 130;
	
	// The seagull should slowdown slightly as it gets in range of the boat
	var dis = abs(x - obj_boat_front.x_center_draw);
	var disToSlowAt = 64;
	var disToLerp = min(dis / disToSlowAt, 1);
	var speedMultiplier = lerp(.5, 1, disToLerp);

	phy_position_x += moveSpeed * face * speedMultiplier;
}

function moveOffscreen() {
	phy_position_x += moveSpeed * face;
	if (face = -1 && phy_position_x < 0) || (face = 1 && phy_position_x > room_width) instance_destroy();
}

function dropItem() {
	if (carryObject != null) {
		switch(carryObject) {
			case SeagullCarryObject.Coconut: instance_create_layer(x, y + 12, layer, obj_coconut); break;	
		}
		carryObject = null;
	}
}

function knockout() {
	mob_create_ko(x, y, spr_mob_seagull_impact, spr_mob_seagull_ko, random_range(-1, 1), -2.5, face, 12);
	dropItem();
	instance_destroy();	
}