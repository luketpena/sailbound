// Pick the options depending on the room
switch(room) {
	case r_town:
	case r_town_shipyard:
		menuOptions = menu_options_town();
		break;
		
	case r_map:
		menuOptions = menu_options_map();
		break;
		
	case r_water:
		menuOptions = menu_options_water();
		break;
		
	default:
		menuOptions = [];
		break;
}

menuOptionCount = array_length(menuOptions);

// Set y positions
array_foreach(menuOptions, function(_option, _index) {
	_option.y = menuPosY + menuOptionHeight * _index;
});