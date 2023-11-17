lighting_flash_init();

front = o_boat_main;
back = obj_boat_back;
hasBoatTarget = instance_exists(o_boat_main);


draw_active = false;
drawPeterActive = true;
squish = 1;
hull_angle = 0;
sailor_angle = (-hull_angle - 180) * .5;
hullSprite = null;
flip = 1;
updateBlending = true;

anim = {
	sprite: null,
	duration: null,
	loop: false,
	speed: 0,
	index: 0,
	length: 0,
	step: function() {
		if (anim.sprite != null) {
			// If it is a looping animation running on a timer
			if (anim.duration > 0) anim.duration-- else {
				anim.duration = -1;
				anim.sprite = null;
			}
			
			// Animate
			var nextFrame = (anim.index + anim.speed);
			if (anim.loop) {
				// Looping via mod
				anim.index = nextFrame mod anim.length;	
			} else {
				// Limited to anim length
				anim.index = min(nextFrame, anim.length);
				// Animation end
				if (anim.index = anim.length) {
					anim.sprite = null;	
				}
			}
		}	
	}
}

sail = {
	sprite: null,
	angle: hull_angle,
	active: true,
	retracted: false, // For pulling the sail into the hull if necessary
	flexRate: .2, // 1 = stiff, low = flexible (never 0);
	separateSail: false, // Whether the mast and sail are separate images
	pos: new Pos(
		x + lengthdir_x(8, hull_angle + 180), 
		y + lengthdir_y(8, hull_angle + 180)
	),
	size: {
		pos: 1,
		xscale: 1,
		yscale: 1,
	},
	retract: function() {
		if (!retracted) {
			// Expanding
			if (size.pos < 1) {
				size.pos += .025;
				size.xscale = ease_lerp(EASE.OutBack, 0, 1, size.pos);
				size.yscale = ease_lerp(EASE.OutElastic, 0, 1, size.pos);
			}
		} else {
			// Retracting
			if (size.pos > 0) {
				size.pos -= .05;
				size.xscale = 1;
				size.yscale = ease_lerp(EASE.OutBack, 0, 1, size.pos);
			}
		}	
	},
}

head = {
	sprite: spr_peter_head_happy,
	frame: 0,
	offset: 0,
	pos: new Pos(
		x + lengthdir_x(6, sailor_angle + 90), 
		y + lengthdir_y(6, sailor_angle + 90),
	),
	step: function() {
		var bd = prnt_boat_draw;

		// Updating position
		var dis = bd.squish * 6;
		pos.x = bd.x + lengthdir_x(dis, bd.sailor_angle + 90);
		pos.y = bd.y + lengthdir_y(6, bd.sailor_angle + 90);
		
		// Animation
		if (bd.hasBoatTarget) {
			if (o_boat_main.waterY_center < o_boat_main.y_center_draw-16) {
				// Submerged
				frame = 3;
				// These are bubbles coming out of the mouth
				part_particles_create(global.ps_water_front, bd.x, bd.y, global.pt_water_bubble, 1);
			}   else if (o_boat_main.phy_speed_y < -3) frame = 1
				else if (o_boat_main.phy_speed_y > 3) frame = 2
				else frame = 0;
		}
	},
	
	draw: function() {
		var bd = prnt_boat_draw;
		draw_sprite_ext(sprite, frame, pos.x, pos.y, bd.flip, bd.squish, 0, c_front, 1);	
	}
}


//>> Flickering when invulnerable after damage
dmgFlicker_flip = false;
dmgFlicker_flip_alarm = 0; //Determines when the flicker flips on or off
dmgFlicker_alarm = -1; //Determines when the entire thing ends

function drawPeter() {
	if (drawPeterActive) {
		if (anim.sprite = null) {
			draw_sprite_ext(spr_peter_body_idle, 0, x, y, flip, squish, sailor_angle, image_blend, 1);
			head.draw();
		} else {
			draw_sprite_ext(anim.sprite, anim.index, x, y, flip, squish, sailor_angle, image_blend, 1);	
		}
	}
}

function drawShip() {
	lighting_flash_draw();
	
	draw_sprite_ext(hullSprite, 1, x, y, 1, flip, hull_angle, image_blend, 1);
	
	if (sail.active) drawSail();
	drawPeter();
	
	draw_sprite_ext(hullSprite, 0, x, y, 1, flip, hull_angle, image_blend, 1);
	
	lighting_flash_clear();	
}

function draw() {
	if (draw_active) {
		drawShip();
	}	
}

function drawSail() {
	draw_sprite_ext(sail.sprite,  0,  sail.pos.x,  sail.pos.y,  1,  sail.size.yscale * flip,  sail.angle,  image_blend, 1);
	if (sail.separateSail) {
		draw_sprite_ext(sail.sprite,  1,  sail.pos.x,  sail.pos.y,  sail.size.xscale,  sail.size.yscale * flip,  sail.angle,  image_blend, 1);
	}	
}

function sailStep() {
	sail.angle -= angle_difference(sail.angle, hull_angle) * sail.flexRate;
	sail.pos.x = x + lengthdir_x(8, sail.angle);
	sail.pos.y = y + lengthdir_y(8, sail.angle);
		
	sail.retract();	
}

function sailSnapToHullAngle() {
	sail.angle = hull_angle;	
}

function getAngledPos(len, dir) {
	return {
		x: x + lengthdir_x(len, hull_angle + dir),
		y: y + lengthdir_y(len, hull_angle + dir),
	}
}


function init(_hullSprite, _sailSprite, _drawPeterActive = true, _flip = 1) {
	hullSprite = _hullSprite;
	sail.sprite = _sailSprite;
	sail.active = (_sailSprite != null);
	draw_active = true;
	sail.separateSail = sprite_get_number(sail.sprite) = 2;
	drawPeterActive = _drawPeterActive;
	flip = _flip;
}
