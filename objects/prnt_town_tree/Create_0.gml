// Controls
rotSub = new Rotator(random_range(.1, .2), 1);
rotMain = new Rotator(random_range(sway_rate_min, sway_rate_max), sway_range, rotSub, .2);

// Attributes
width = sprite_get_width(sprite_index);
height = sprite_get_height(sprite_index);
hWidth = width / 2;
tilt = choose(-12, 12);

unitCount = 5;
unitHeight = height / unitCount;

texUnit = 1 / unitCount;
tex = sprite_get_texture(sprite_index, 0);

function Segment(_width, _x, _y) constructor {
	x1 = _x - _width;
	x2 = _x + _width;
	y = _y;
}
segments = [];
for (var i=0; i<=unitCount; i++) {
	var segment = new Segment(hWidth, x, y - (unitHeight * i));
	array_push(segments, segment);
}