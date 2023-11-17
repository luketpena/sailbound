// Collisions
waterY_front = water_find_y_precise(x);
waterY_back = water_find_y_precise(obj_boat_back.x);
waterY_center = water_find_y_precise(x_center);

global.boat_x = x_center_draw;
global.boat_y = y_center_draw;

boat_impactFreeze_step(); // Stopping motion
boat_controls_step(); // Setting control impulses
boat_step_movement(); // Moving the ship
boat_step_positions(); // Part and draw positions
boat_step_angle(); // Setting angle for other usage
boat_distanceToSurface();
boat_physics_lock_hold();

boat_step_angleCorrection();
boat_step_particles();

shadow_step(x_center_draw, y_center_draw);

// Conditions (should NEVER be flipped)
flipped = (x < back.x) //flipped status
// Cchecking if touching the water surface is disabled
if (touched_disable > 0) then touched_disable--;

