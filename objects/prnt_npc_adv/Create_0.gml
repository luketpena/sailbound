phy_fixed_rotation = true;

is = {
	Standing: "standing",
	Walking: "walking",
	Running: "running",
	Jumping: "jumping",
	Falling: "falling",
	Slipping: "slipping",
	Climbing: "climbing",
	Swinging: "swinging",
	Crouching: "crouching",
	Swimming: "swimming",
	Diving: "diving",
	Impacting: "impacting",
	Latched: "latched",
	Sliding: "sliding",
	Gliding: "gliding",
	SpinJumping: "spin-jumping",
	SpinFalling: "spin-falling",
}

state = is.Standing;
grounded = -1; // Is there ground below
walled = false; // Is there a wall in front of movement
faced = false; // Is there a wall in the direction of movement
watered = false; // Is there water touching the player
hasImpacted = false;
groundSnapCooldown = 0;

//---- Jumping ----\\
highestFallSpeed = 0;


//---- Size and Shape ----\\
width = 16; //Fixture width
height = 24; //Fixture height
h_width = width / 2;
h_height = height / 2;

//>> These sides point to where the edges are
left = x-h_width;
right = x+h_width;
top = y-h_height;
bottom = y+h_height;
front_dis = 0;
front = x; // x position for which side is being moved in
waist = y; // y + step_height

//---- Latches ----\\
latch_active = false;
latch_target = noone;
latch_timeout = 0; //Reset time for being able to latch again

//---- Ladders ----\\
ladder_active = false;
ladder_touch = false;
ladder_x = 0;
ladder_timeout = 0; // Prevents climbing a ladder immediately after jumping off

//---- Ropes ----\\
rope_active = false;
rope_target = noone;

//---- Wall Slide ----\\
wallslide_active = false;
wallslide_triggerSpeed = .5;
wallslide_hold = 0; //Coyote time for walljumping after release from wall
wallslide_dir = 0;

//---- Wall Jump ----\\
walljump_active = false;
walljump_lock = -1;

//---- Swimming ----\\
swim_active = false;
swim_top = 0;
dive_active = false;

//---- Crouch ----\\
crouch_active = false;

//---- Fall-Through ----\\
fallthru_active = false;
fallthru_cooldown = 0;

//---- Controls ----\\
ctrl_move_axis = 0;
ctrl_jump_pulse = 0;
ctrl_jump_hold = false;
ctrl_down_pulse = -1;
ctrl_vertical_axis = 0;
coyote_set = .1*room_speed;
coyote_time = coyote_set;

//---- Movement ----\\
move_speed_current = 0;
move_speed_adjusted = 0;
move_speed_max = 3;
move_speed_max_swim = 1.5;
move_speed_adjust = 0;

//>> Collision of sides and angle of footing
col_left = 0;
col_right = 0;
col_angle = 0;

//>> Face variables point left or right
face_point = 0;
face_move = 0;
face_draw = 1;
face_slide = 0;

step_height = h_height/2;

slip_active = false;
slip_current = 0;
slip_overflow = 0;
slip_stability = 1;

draw_x = 0;
draw_y = 0;

xspeed_lock = true;

sprite_index = spr_peter_idle;

// Gameplay variables
targetInteractable = noone;