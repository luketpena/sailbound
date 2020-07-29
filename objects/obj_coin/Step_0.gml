behave_step_router(true);
floater_step(0);

if (size<1) size += .1;

if (!active) {
	if (phy_speed_y>=0) active = true;	
}

if (sink_active) {
	switch(behave_type) {
		case behave.bouncer:	
			if (sink_wait>0) sink_wait-- else behave_type = behave.sinker;
			break;
			
		case behave.sinker:
			if (y>room_height) instance_destroy();
			break;
	}	
}

if (boat_collide_basic(x,y)) {
	collect();	
}