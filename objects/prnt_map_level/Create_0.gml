event_inherited();

active = false;
scaleLerp = 0;
scale = .8;
maxHeight = image_number;

// Get the ids of all ship orbs the level has in it for display
hullLost = vault.inventory.getHullsLostByLevelId(level_id);

function interact() {
	// Save the level id to global then transition to the room
	global.level_id = level_id;
	transitionToRoom(r_water);	
}

function drawLayer() {
	if (layerIndex < image_number) {
		draw_sprite_ext(sprite_index, layerIndex, x + offsetX, y + offsetY, scale, scale, image_angle, c_white, 1);
	}	
}