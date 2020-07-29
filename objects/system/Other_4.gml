var name = room_get_name(room);



switch(name) {
	case "rm_water": event_user(0); break;
	case "rm_map": event_user(1); break;
	case "rm_island": event_user(2); break;
}