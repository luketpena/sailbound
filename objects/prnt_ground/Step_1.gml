// Prop spawning
generateProp();

if (!fullGroundIn) {
	if (transitionX > -margin)
		then transitionX += move.speed
		else fullGroundIn = true;	
}

if (exiting) {
	if (transitionX > -margin)
		then transitionX += move.speed
		else instance_destroy();		
}

// Step each bump
array_foreach(bumps, function(_bump) {
	_bump.step();
});

// Delete inactive bumps
bumps = array_filter(bumps, function(_bump) {
	return _bump.active;	
})

if (bumpActive) {
	if (bumpTimer > 0) bumpTimer-- else {
		bumpTimer = irandom_range(bumpFrequency.MIN, bumpFrequency.MAX);
		generateBump();
	}
}