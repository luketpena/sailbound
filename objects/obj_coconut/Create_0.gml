fixture_create_circle(id,4,.5,0,0,0,0,false,true);
behave_init(behave.bouncer,.1,3,1,true,.01,.9,2,.4,.05,-1);
floater_init(16,16,true,4,5);

phy_angular_velocity = random_range(-100,100)
active = false;
alarm[0] = .5 * room_speed;