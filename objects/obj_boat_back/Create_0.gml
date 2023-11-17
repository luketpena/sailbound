//-- Stats --\\
boat_weight = o_boat_main.boat_weight;
boat_drag = o_boat_main.boat_drag;
boat_buoyancy = o_boat_main.boat_buoyancy;
boat_stop = o_boat_main.boat_stop;
boat_speed = o_boat_main.boat_speed;
boat_agility = o_boat_main.boat_agility;
boat_offset = o_boat_main.boat_offset;

boat_angle = 0
boat_angle_reverse = 0;

fixture_create_circle(id, 8, .5, .1, .1, .1, .2, false, false);

//-- CONTROLLERS --\\
touched = false;
impact = false;
submerged = 0;

pd_boatFront = 0;

waterpillar_nearest = noone;

front = o_boat_main;