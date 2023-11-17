// Prop spawning
generateProp();

if (!fullGroundIn) {
	if (transitionX != -margin)
		then transitionX -= 1
		else {
			fullGroundIn = true;
			transitionX = -margin;
		};		
}
if (exiting) {
	if (transitionX > -margin)
		then transitionX += move.speed
		else instance_destroy();		
}

 //Step each bump
array_foreach(bumps, function(_bump) {
	_bump.step();
});

// Delete inactive bumps
bumps = array_filter(bumps, function(_bump) {
	return _bump.active;	
})