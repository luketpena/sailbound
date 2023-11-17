if (!instance_exists(ground)) instance_destroy();
walker = new Walker(ground, x);
stepAc = animcurve_get_channel(ac_magmaCrabStep, 0);

function Leg(
	_centerX,
	_marginLeft,
	_marginRight,
	_offsetFromCenter,
	_spriteFlip = 1,
) constructor {
	offset = _offsetFromCenter;
	x = _centerX + _offsetFromCenter;
	transitionX = _centerX - _marginLeft;
	drawX = transitionX;
	transitionY = _centerX;
	marginLeft = _marginLeft;
	marginRight = _marginRight;
	angle = 0;
	spriteFlip = _spriteFlip;
	stepOffset = _spriteFlip ? 0 : 1; // This is a weird little fix to get them to move right
	
	function step(_centerX, _centerY, _animCurve, _surfaceTarget) {
		var _stepMaxDistance = abs(marginRight - marginLeft);
		x = _stepMaxDistance * ((ceil(_centerX + offset) div _stepMaxDistance) + stepOffset);
		var _y = _surfaceTarget.findY(x);
	

		if (x != transitionX) {
			transitionX += (x - transitionX) * .5;
			
			var _stepDistance = abs(x - transitionX)
			var _stepLerp = _stepDistance / _stepMaxDistance;
	
			var _val = animcurve_channel_evaluate(_animCurve, _stepLerp);
			transitionY = _y - (8 * _val);
		} else {
			transitionY = _y;	
		}
		
		drawX = transitionX;
		angle = point_direction(drawX, _centerY, _centerX + offset, _centerY - 8);	
	}
}

backLegs = [
	new Leg(x, -16, 8, -6),
	new Leg(x, -8, 16, 6, -1),
];

frontLegs = [
	new Leg(x, -8, 4, -3),
	new Leg(x, -4, 8, 3, -1),
]