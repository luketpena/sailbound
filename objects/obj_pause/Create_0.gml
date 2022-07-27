paused = false;
roomTarget = noone;

function pause() {
	paused = true;
	sprite_index = sprite_create_from_surface(application_surface, 0, 0, surface_get_width(application_surface), surface_get_height(application_surface), 0, 0, 0, 0);

	for (var i=0; i<array_length(global.ps_list); i++) {
		part_system_automatic_update(global.ps_list[i], false);
	}

	instance_deactivate_all(true);
	physics_pause_enable(true);
}

function unpause() {
	paused = false;
	sprite_delete(sprite_index)
	
	for (var i=0; i<array_length(global.ps_list); i++) {
		part_system_automatic_update(global.ps_list[i], true);
	}
	
	instance_activate_all();
	physics_pause_enable(false);
}

///@param text
///@param select
function MenuOption(_text, _select) constructor {
	slidePos = 0;
	slideLerp = 0;
	text = _text;
	select = _select;
	
}

menuPosition = 0;
menuOptions = [];
menuOptionHeight = sprite_get_height(spr_font_normal_medium) + 8;
switch(room) {
	case r_water:
		menuOptions = [
			new MenuOption(
				"RETURN TO MAP",
				function() {
					alarm[0] = 5;
					roomTarget = r_map;
				}),
			new MenuOption(
				"RETURN TO PORT",
				function() {
					alarm[0] = 5;
					roomTarget = r_town;
				}),
			new MenuOption(
				"QUIT TO DESKTOP",
				function() {
					game_end();
				}),
		];
		break;
}
menuOptionCount = array_length(menuOptions);
menuPosY = global.hvh - ((menuOptionHeight * menuOptionCount) / 2)