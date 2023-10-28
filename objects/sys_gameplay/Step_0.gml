
//Determine if the boat can be impacted at all
global.boat_canImpact = (global.boat_canTouch && global.boat_canDamage);



if (gamepad_button_check_pressed(0,gp_padu) && global.inventory[0].active) global.inventory[0].use();
if (gamepad_button_check_pressed(0,gp_padr) && global.inventory[1].active) global.inventory[1].use();
if (gamepad_button_check_pressed(0,gp_padd) && global.inventory[2].active) global.inventory[2].use();
if (gamepad_button_check_pressed(0,gp_padl) && global.inventory[3].active) global.inventory[3].use();