//-- Stats --\\
boat_weight = obj_boat_front.boat_weight;
boat_drag = obj_boat_front.boat_drag;
boat_buoyancy = obj_boat_front.boat_buoyancy;
boat_stop = obj_boat_front.boat_stop;
boat_speed = obj_boat_front.boat_speed;
boat_agility = obj_boat_front.boat_agility;
boat_offset = obj_boat_front.boat_offset;
boat_radius = obj_boat_front.boat_radius

boat_angle = 0
boat_angle_reverse = 0;

fixture_create_circle(id,8,.5,.1,.1,.1,.2,false,false);

//-- CONTROLLERS --\\
touched = false;
impact = false;
submerged = 0;

pd_boatFront = 0;

waterpillar_nearest = noone;

front = obj_boat_front;