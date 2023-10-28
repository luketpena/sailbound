function pauseParticles() {
	if (instance_exists(sys_particles)) {
		sys_particles.setPaused(true);	
	}
}

function unpauseParticles() {
	if (instance_exists(sys_particles)) {
		sys_particles.setPaused(false);	
	}
}