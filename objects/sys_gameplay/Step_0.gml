
//Determine if the boat can be impacted at all
global.boat_canImpact = (global.boat_canTouch && global.boat_canDamage);

// Gives a global flag for when there is a free inventory space.
var inventory_free_check = false;
for (var i=0; i<4; i++) {
	if (!global.inventory[i].active) {
		inventory_free_check = true;
		break;
	}
}
global.inventory_free = inventory_free_check;

if (gamepad_button_check_pressed(0,gp_padu) && global.inventory[0].active) global.inventory[0].use();
if (gamepad_button_check_pressed(0,gp_padr) && global.inventory[1].active) global.inventory[1].use();
if (gamepad_button_check_pressed(0,gp_padd) && global.inventory[2].active) global.inventory[2].use();
if (gamepad_button_check_pressed(0,gp_padl) && global.inventory[3].active) global.inventory[3].use();