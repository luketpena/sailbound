function boat_init_gameplay() {
	/*
		Basics for boat gameplay features.
	*/

	//>> Basics
	//autopilot = false;
	//inked = 0;
	//inked_wait = -1;
	//inked_fade = 0;
	//>> Activity States
	control_active = true; //TOGGLE - Is the player in control of the boat?
	//>> Collision with water
	////>> Invulnerability
	//invul_alarm = -1;
	//invul_set = 1*room_speed;
	//invul_flash = 1;
	//invul_tick = 0;
	//invul_tick_set = 4;
	//invul_tick_active = 0;
	//invul_glow = 0;
	//invul_glow_fade = 0;
	//invul_light = noone;
	//>> Jumping
	jump_ready = false;
	jump_cool = 0;
	//>> General
	flipped = false; //has the boat been flipped over?
	touched = false; //is the front of the boat touching the water?
	touched_disable = 0; //a timer that disables touched. 
	impact = false;
	submerged = false; //below water?
	floating = false; //is the center of the boat touching the water?
	falling = false; //Boat must be airborne && have a positive vspeed
	distanceToSurface = 0; // Pointed from the position of boat

}
