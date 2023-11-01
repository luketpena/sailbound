light = light_create(x, y-64, spr_fx_flare_300, 0, .8, .8, c_fire, 1);
light.off(-1);
active = false;
fireAnim = irandom(5);
inRange = 0;
range = 300 + global.hvw;

aura = {
	rot: random(360),
	rad: 32,
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
	lightDelay = irandom(seconds(1));
};
lightDelay = 0;
lightDelay_set();