if (ceiling.exiting) {
	if (ceiling.transitionX - global.vw > global.vx) {
		offset += ceiling.move.speed * .75;	
	} else {
		offset -= ceiling.move.speed * .25;
	}
} else {
	if (ceiling.transitionX < global.vx) {
		offset += ceiling.move.speed * .75;	
	} else {
		offset -= ceiling.move.speed * .25;
	}
}

tex_x -= .5;