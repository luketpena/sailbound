switch(water_stage) {	
	case 0:
		water_step();
		water_stage = 1;
		break;
	
	case 1:
		water_interpolate();
		waves_step();
		water_stage = 0;
		break;
}