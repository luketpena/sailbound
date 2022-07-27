//>> Setup
fixture_create_box(id, 8, 8, .5, 0, 0, 0, 0, true, true);
behave_init(behave.floater, .1, 3, 1, false, .01, .9, 1, .4, .05, -1);
floater_init(32, 24, true, 4, 10);

//>> Movement
if (x>room_width/2) face = -1 else face = 1;
move_speed = 0;
move_speed_max = choose(1,  2,  3);

//>> Behavior
state = "start";
attacking = false;
attack_impact = false;
success = false; //Determines if it has successfully hit the player yet

//>> Range for Attack
var h_range = 128;
var hhr = h_range/2; //Half Horizontal Range
var offset = hhr*face;

h_range_left = -hhr+offset;
h_range_right = hhr+offset;

v_range = 48;

//>> Move up in the water to attack
idle_offset_max = 5;
idle_offset = idle_offset_max;

//>> Functions
function knockout() {
	mob_create_ko(x, y, spr_mob_chomper_normal_hit, spr_mob_chomper_normal_ko, random_range(-1, 1), random_range(-2, -2.5), face, 16);
	water_splash_create_double(x, 24, "medium");
	instance_destroy();	
}