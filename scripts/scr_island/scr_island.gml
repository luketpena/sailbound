function TropicalIsland(_depth) : Island(_depth) constructor {
	setSprite(spr_islands_tropical);
}

function SpikedIsland(_depth) : Island(_depth) constructor {
	setSprite(spr_islands_spiked);
}

function VolcanoIsland(_depth) : Island(_depth) constructor {
	setSprite(spr_islands_volcano);
	timerRange = new MinMax(seconds(5), seconds(10));
	timer = timerRange.MAX;
	
	function step() {
		move();
		if (timer > 0) timer-- else {
			timer = irandom_range(timerRange.MIN, timerRange.MAX);
			instance_create_layer(x, y - 30 * yscale, l_main, o_magmaBomb_background);
		}
	}
}

function Island(
	_depth,
) constructor {
	depth = _depth; // How near or far the island is, value 0-1
	
	// Drawing
	shaderPower = lerp(1, .2, _depth);
	sprite = ico_system;
	imageIndex = irandom(sprite_get_number(sprite));
	spriteHalfWidth = sprite_get_width(sprite);
	
	// Position
	exitX = global.vx - spriteHalfWidth;
	speed = lerp(islands.islandSpeed.MIN, islands.islandSpeed.MAX, _depth);
	x = global.vr + spriteHalfWidth;
	y = floor(global.horizon_y + 16 * _depth);
	yscale = lerp(.25, 1, _depth);
	xscale = choose(1, -1) * yscale;
	
	function setSprite(_sprite) {
		sprite = _sprite;	
		imageIndex = irandom(sprite_get_number(_sprite));
		spriteHalfWidth = sprite_get_width(_sprite);
		x = global.vr + spriteHalfWidth;
	}
	
	function step() {
		move();	
	}
	
	function move() {
		x += speed * global.motion;	
	}
	
	function isOutOfBounds() {
		return x < exitX;
	}
	
	function draw() {
		draw_sprite_ext(sprite, imageIndex, x, y, xscale, yscale, 0, c_front, 1);
	}
}