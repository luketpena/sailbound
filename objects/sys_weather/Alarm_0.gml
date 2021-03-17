drop_count += drop_count_max * intensity;

var dropNum = floor(drop_count);
drop_count -= dropNum;

repeat(dropNum) {
	var left  = global.vx + (200 * min(wind_strength, 0));
	var right = global.vr + (200 * max(wind_strength, 0));

	var xx = random_range(left, right);
	var yy = global.vy - 64;

	var newDroplet = new Droplet(xx, yy, spr_env_raindrop, droplet_gravity * random_range(1, 2), 270 - (45 * wind_strength));

	var index = array_length(droplet_list);
	droplet_list[index] = newDroplet;
}

alarm[0] = 1;