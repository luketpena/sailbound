///@param text
///@param select
///@param y
function MenuOption(_text, _select) constructor {
	slidePos = 0;
	slideLerp = 0;
	text = _text;
	select = _select;
	hover = false;
	y = 0;
}

function menu_options_water() {
	return  [
		new MenuOption(
			"back to sailing",
			function() {
				menu.unpause();
			}),
		new MenuOption(
			"return to map",
			function() {
				transitionToRoom(r_map);
			}),
		new MenuOption(
			"return to port",
			function() {
				transitionToRoom(r_town);
			}),
		new MenuOption(
			"quit to desktop",
			function() {
				game_end();
			}),
	]	
}

function menu_options_map() {
	return  [
		new MenuOption(
			"back to map",
			function() {
				menu.unpause();
			}),
		new MenuOption(
			"return to port",
			function() {
				transitionToRoom(r_town);
			}),
		new MenuOption(
			"quit to desktop",
			function() {
				game_end();
			}),
	]	
}

function menu_options_town() {
	return  [
		new MenuOption(
			"back to town",
			function() {
				menu.unpause();
			}),
		new MenuOption(
			"quit to desktop",
			function() {
				game_end();
			}),
	]	
}