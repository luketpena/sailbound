global.paused = false;

// interfaceOpen prevents the menu from opening when escaping out of a shop interface
global.interfaceOpen = false;
interfaceOpenCooldown = 0;

// For triggering transitions
roomTarget = noone;

// Pause menu
menuPosition = 0;
menuOptions = [];
menuOptionCount = array_length(menuOptions);
menuOptionHeight = sprite_get_height(s_font_normal_medium) + 8;
menuPosY = global.hvh - ((menuOptionHeight * menuOptionCount) / 2);

// These will be reactivated upon pause
pauseExceptions = [
	input,
	system,
	vault,
];

// These are for displaying inputs at the bottom of the screen
inputRow = [];

function clearInputRow() {
	inputRow = [];
}

function setInputRow(_InputRowItems) {
	inputRow = _InputRowItems;	
}

function pause() {
	global.paused = true;
	sprite_index = sprite_create_from_surface(application_surface, 0, 0, surface_get_width(application_surface), surface_get_height(application_surface), 0, 0, 0, 0);

	pauseParticles();
	instance_deactivate_all(true);
	physics_pause_enable(true);
	
	for (var i=0; i<array_length(pauseExceptions); i++) {
		instance_activate_object(pauseExceptions[i]);	
	}
}

function unpause() {
	global.paused = false;
	sprite_delete(sprite_index)
	
	unpauseParticles();
	instance_activate_all();
	physics_pause_enable(false);
}