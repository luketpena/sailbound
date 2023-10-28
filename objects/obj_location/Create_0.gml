image_speed = 0;
mySpeed = islands.island_speed_max; //Get the fast speed

state = "enter";

function leave() {
	motion_start();
	prnt_boat_draw.sail_active = true;
	sys_hud.hud_active = true;
	state = "exit";		
}