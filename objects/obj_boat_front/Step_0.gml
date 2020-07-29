//>>collisions
waterpoint_front = water_find_y_precise(x);
waterpoint_back = water_find_y_precise(obj_boat_back.x);
waterpoint_center = water_find_y_precise(x_center);
waterpoint_front_col = waterpoint_front<(y+boat_offset);

global.boat_x = x_center_draw;
global.boat_y = y_center_draw;

boat_step_impact_freeze(); //Stopping motion
boat_step_controls(); //Setting control impulses
boat_step_movement(); //Moving the ship
boat_step_positions(); //Part and draw positions
boat_step_angle(); //Setting angle for other usage

boat_step_angleCorrection();
boat_step_particles();

//>>conditions (should NEVER be flipped)
flipped = (x<back.x) //flipped status
//>>checking if touching the water surface is disabled
if (touched_disable>0) then touched_disable--;