if (ceilingMode) exit;

// Generate the surfaces
if !surface_exists(surf_detail) surf_detail = surface_create(surfaceWidth, 64);
if !surface_exists(surf_transfer) surf_transfer = surface_create(surfaceWidth, 64);

if (surface_exists(surf_detail) && surface_exists(surf_transfer)) {

	var _moveOffset = getTextureOffset();
	// We draw the detail surfaces offset by a value...
	surface_set_target(surf_transfer);
		draw_clear_alpha(c_white, 0);
		draw_surface_ext(surf_detail, -_moveOffset, 0, 1, 1, 0, c_white, 1);
	surface_reset_target();
	
	// ...then transfer it to the main detail layer at position 0, simulating motion
	surface_set_target(surf_detail);
		draw_clear_alpha(c_white, 0);
		draw_surface_ext(surf_transfer, 0, 0, 1, 1, 0, c_white, 1);
		createNewStone();
	surface_reset_target();
}

// Creating the actual ground texture
if surface_exists(surf) {
	surface_set_target(surf);
		// Tiled sprite
		draw_sprite_tiled_ext(groundSprite, 0, texture.offset - offset, 0, 1, 1, c_front, 1);
		// The detail surface
		draw_surface_ext(surf_detail, -offset, 0, 1, 1, 0, c_front, 1);
		// Fade to water depth on vertical edges
		draw_sprite_ext(spr_ground_fade, 0, 0, 0, surfaceWidth, 1, 0, c_water_depth, 1);
	surface_reset_target();
	
	tex = surface_get_texture(surf);
} else {
	surf = surface_create(surfaceWidth, 64);	
}