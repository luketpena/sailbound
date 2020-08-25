image_speed = 0;
mySpeed = sys_islands.island_speed_max; //Get the fast speed

state = "enter";

function leave() {
	motion_start();
	obj_boat_draw.sail_active = true;
	sys_hud.hud_active = true;
	state = "exit";		
}