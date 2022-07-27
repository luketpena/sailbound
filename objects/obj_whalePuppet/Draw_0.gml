draw_set_alpha(1);
image_blend = c_front;
draw_set_color(image_blend); // TODO: update to global.c_front

// Drawing the base head
draw_sprite_ext(spr_whale_head, 0, x, y , 1, 1, angle[0], image_blend, 1);

#region Drawing the beard
/*
	The beard is drawn on with the top corners locked into place and the other two
	corners having their positions rotated by two independent sine waves.
	
	How they get moved by the sine waves is complete nonsense code to make for a more
	randomized visual image.
*/
var _beardAngle = angle[0] + 3.5;
var _beardDis = headWidth - 5;
//Top right
var _beardPos2 = [
	x + lengthdir_x(_beardDis, _beardAngle),
	y + lengthdir_y(_beardDis, _beardAngle)
];
// Top left
var _beardPos1 = [
	_beardPos2[0] + lengthdir_x(beardWidth, angle[0] + 180),
	_beardPos2[1] + lengthdir_y(beardWidth, angle[0] + 180),
];
// Bottom right
var _beardPos3 = [
	_beardPos2[0] + lengthdir_x(beardHeight, angle[0] - 90),
	_beardPos2[1] + lengthdir_y(beardHeight, angle[0] - 90)  + lengthdir_y(2, beardRot2),
];
// Bottom left
var _beardPos4 = [
	_beardPos1[0] + lengthdir_x(beardHeight, angle[0] - 90) + lengthdir_x(4 + (2 * lengthdir_x(1, beardRot1)), beardRot2),
	_beardPos1[1] + lengthdir_y(beardHeight, angle[0] - 90) + lengthdir_x(2, beardRot1),
];
draw_sprite_pos(
	spr_whale_beard,
	0,
	_beardPos1[0], _beardPos1[1],
	_beardPos2[0], _beardPos2[1],
	_beardPos3[0], _beardPos3[1],
	_beardPos4[0], _beardPos4[1],
	1);
	
#endregion

#region Drawing the body
/*
	The body is affected by three influences:
		- Each segment moves to maintain a relatively straight body
		- The tail waves up and down, with the largest motion towards the front tapering to the back
		- The tip of the tail reverses that tail motion with more strength applied towards the tail (derived from curve_whaleTail curve channel)
*/
var _curve = animcurve_get_channel(curve_whaleTale, "curve");
draw_primitive_begin_texture(pr_trianglestrip, tex);

	draw_vertex_texture(x + lengthdir_x(hBodyHeight, angle[0]+90), y + lengthdir_y(hBodyHeight, angle[0]+90), 0, 0);
	draw_vertex_texture(x + lengthdir_x(hBodyHeight, angle[0]-90), y + lengthdir_y(hBodyHeight, angle[0]-90), 0, 1);
	
	for (var i=1; i<divisionCount; i++) {
		// Single angle determines base tail wave, with linear dampening towards tip
		var _singleAngle = clamp(lengthdir_x(.5, swimRot) * lerp(tailBendAmount, 0, i / divisionCount), tailLimit, tailBendAmount);
		// Reverse angle gives the tip of a tail an opposing curve to the base tail, with strength derived from curve
		var _reverseAngleStr = animcurve_channel_evaluate(_curve, i / divisionCount);
		var _reverseAngle = (lengthdir_x(-.5, swimRot + 50) * 100) * _reverseAngleStr;
		
		// The center angle moves 
		centerAngle[i] += angle_difference(centerAngle[i-1], centerAngle[i]) * .1;
		angle[i] = centerAngle[i] + _singleAngle + _reverseAngle;
		posx[i] = posx[i-1] - lengthdir_x(divUnit, angle[i]);
		posy[i] = posy[i-1] - lengthdir_y(divUnit, angle[i]);
	
		var _angle = point_direction(posx[i-1], posy[i-1], posx[i], posy[i]);
	
		var _x1 = posx[i] + lengthdir_x(hBodyHeight, _angle-90);
		var _x2 = posx[i] + lengthdir_x(hBodyHeight, _angle+90);
		var _y1 = posy[i] + lengthdir_y(hBodyHeight, _angle-90);
		var _y2 = posy[i] + lengthdir_y(hBodyHeight, _angle+90);
	
		draw_vertex_texture(_x1, _y1, texUnit * i, 0);
		draw_vertex_texture(_x2, _y2, texUnit * i, 1);
	}
draw_primitive_end();

#endregion

#region Drawing the eye and eyelid

var _eyeAngle = angle[0] + 30;
var _eyeDis = 47;
var _eyeX = x + lengthdir_x(_eyeDis, _eyeAngle);
var _eyeY = y + lengthdir_y(_eyeDis, _eyeAngle);

var _eyePoint = point_direction(_eyeX, _eyeY, eyeTarget[0], eyeTarget[1]);
var _eyeDis = clamp((point_distance(_eyeX, _eyeY, eyeTarget[0], eyeTarget[1]) / 100), 0, 1) ;
var _eyePointOffsetX = lengthdir_x(5 * _eyeDis, _eyePoint);
var _eyePointOffsetY = lengthdir_y(2 * _eyeDis, _eyePoint);
var _eyePointXscale = .5 + (.5 * (1 - _eyeDis));

draw_sprite_ext(spr_whale_eye, 0, _eyeX + _eyePointOffsetX, _eyeY + _eyePointOffsetY, _eyePointXscale, 1, _eyePoint, c_white, 1);
draw_sprite_ext(spr_whale_eyeshine, blinkIndex, _eyeX, _eyeY, 1, 1, 0, c_white, 1);
draw_sprite_ext(spr_whale_eyelid, blinkIndex, _eyeX, _eyeY, 1, 1, angle[0], image_blend, 1);

#endregion

#region Drawing the fin

var _finPosX = posx[1] + lengthdir_x(8, angle[1] -90);
var _finPosY = posy[1] + lengthdir_y(8, angle[1] -90);
var _finScaleX = 1 + (.05 * lengthdir_x(1, finRot + 180));
var _finScaleY =  1 + (.05 * lengthdir_x(1, finRot));
var _finAngle = angle[1] + (6 * lengthdir_x(1, finRot));
draw_sprite_ext(spr_whale_fin, 0, _finPosX, _finPosY, _finScaleX, _finScaleY, _finAngle, image_blend, 1);

#endregion
