image_speed = 0;

face = 1;
move = {
	speed: .5,	
}

state = "swim";

range = 50;
stateTimer = 0;
attackAnimLerp = 0;
attackAnimRate = 1 / (.1 * room_speed);
cooldown = 0;
impact = false;

rot = random(360);
rotDis = random_range(8, 32);
rotRate = random_range(1, 3);

function impactPlayer(force, damage, vibrate) {
	var dir = directionToBoat(x, y);
	boat_impact(dir, force);
	health_increment(damage);
	vibrate_set_impulse(vibrate);
}

function knockout() {
	instance_destroy();	
}