active = false;
life_set = random_range(.4, .7) * room_speed;
life = life_set;

moveDir = 0;
moveSpd = random_range(.5, 2);
flip = choose(-1, 1);
image_angle = random(360);
image_speed = 0;

function init(dir, scaleLerp) {
	moveDir = dir;
	active = true;
	size = lerp(.1, .8, scaleLerp);
	var moveSpdMin = lerp(.1, 1, scaleLerp);
	var moveSpdMax = lerp(1, 2.5, scaleLerp);
	moveSpd = random_range(moveSpdMin, moveSpdMax);
}