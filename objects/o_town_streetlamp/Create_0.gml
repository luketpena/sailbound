light = light_create(x, y-64, spr_fx_flare_300, 0, .5, .5, c_fire, .8);
light.off(-1);
active = false;
fireAnim = irandom(5);
inRange = 0;
range = 300 + global.hvw;


aura = {
	rot: random(360),
	rad: 18,
	rate: {
		rMin: 2,
		rMax: 5,
	},
	rateRot: random(360),
	dis: 2,
	getRad: function() {
		return rad + lengthdir_y(dis, rot);
	},
	getRate: function() {
		var a = lengthdir_y(.5, rateRot) + .5;
		return lerp(rate.rMin, rate.rMax, a);	
	}
}

function lightDelay_set() {
	lightDelay = irandom(1 * room_speed);
};
lightDelay = 0;
lightDelay_set();