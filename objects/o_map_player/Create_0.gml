event_inherited();

image_angle = random(360);

targetAngle = 0;
moveSpeed = 0;
maxHeight = image_number - 1;
moveRate = .93;
moveSpeedMax = 1.5;
rotateRate = .15;

instance_create_layer(x, y, "l_water_surface", o_map_boatTrail);

part = part_type_create();
part_type_sprite(part, spr_fx_boatWakeParticle, 0, 1, 1);
part_type_life(part, 10, 20);
part_type_color1(part, c_water_highlight);
part_type_orientation(part, 0, 360, 0, 0, 0);
part_type_alpha2(part, 1, 0);

pe = part_emitter_create(sys_map_particles.sys);
pe_size = 6;

axisH = 0;
axisV = 0;

function drawLayer() {
	if (layerIndex < image_number) {
		draw_sprite_ext(sprite_index, layerIndex, x + offsetX, y + offsetY, 1, 1, -phy_rotation, c_white, 1);
	}
}