walker.step();
x = walker.x;
y = walker.y;

if (mouse_check_button_pressed(mb_left)) {
	walker.targetX = mouse_x;	
}

walker.targetX = mouse_x;	

array_foreach(backLegs, function(_leg) {
	_leg.step(x, y, stepAc, walker.walkSurface);
});

array_foreach(frontLegs, function(_leg) {
	_leg.step(x, y, stepAc, walker.walkSurface);
});