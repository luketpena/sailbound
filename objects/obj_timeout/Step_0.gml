if (active) {
	if (timer > 0) timer-- else {
		endFunction();
		instance_destroy();
	}
}
