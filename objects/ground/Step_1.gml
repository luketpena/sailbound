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