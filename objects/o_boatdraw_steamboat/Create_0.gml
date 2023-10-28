// Inherit the parent event
event_inherited();


rot = 0;

backWheelOffset = {
	x: lengthdir_x(5, hull_angle + 90),
	y: lengthdir_y(5, hull_angle + 90),
}

function draw() {
	if (draw_active) {
		var spinPos = getAngledPos(26, 210);
		draw_sprite_ext(s_hull_steamboat_wheel, 1, spinPos.x + backWheelOffset.x, spinPos.y + backWheelOffset.y, 1, 1, -rot, image_blend, 1);		
		drawShip();
		draw_sprite_ext(s_hull_steamboat_wheel, 0, spinPos.x, spinPos.y, 1, 1, -rot, image_blend, 1);	
	}
}