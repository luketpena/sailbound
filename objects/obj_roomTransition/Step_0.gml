switch(state) {
	case 0:
		if (size > 0) size -= .01 else state++;
		break;
		
	case 1:
		if (wait > 0) wait -- else {
			state++;
			room_goto(roomTarget);
		}
		break;
	
	case 2:
		if (size < 1) size += .01 else instance_destroy();
}