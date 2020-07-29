/*
switch(state) {
	case "rise":
		var distanceToPoint = target_y-phy_position_y;
		phy_position_y += min((distanceToPoint)*.01, 1);
		
		
		if (abs(distanceToPoint)<1) {
			wait = 1*room_speed;
			state = "wait";
		}
		break;
	
	case "wait":
		if (wait>0) wait-- else state = "sink";
		break;
		
	case "sink":
		if (sink_speed<1) sink_speed += .005;
		phy_position_y += sink_speed;
		var distanceToPoint = -(target_y-phy_position_y);
		
		if (phy_position_y>global.vb+thickness*2) {
			wait = 5*room_speed;
			state = "test_wait";
		}
		break;
		
	case "test_wait":
		if (wait>0) wait-- else {
			state = "rise";
			sink_speed = 0;
		}
		break;
}