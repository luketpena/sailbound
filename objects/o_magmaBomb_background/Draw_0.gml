var _lerpVal = abs(yspeed) / abs(initialSpeed);
var _scale = lerp(1, .25, _lerpVal);
draw_sprite_ext(sprite_index, 0, x, y, _scale, _scale, 0, c_white, 1);