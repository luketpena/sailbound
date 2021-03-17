/// @description New Cell Trigger



//Update the position
location_cell = location_cell_track;
//Grab the cell
var newCell = map_row[location_row][location_cell];
//Update global biome to match entered cell
global.biome = newCell.biome;
//Transition all colors to the new colors
//palette_transition(newCell.palette,.01);
//Check if there is a transition
if (newCell.transition || newCell.island) {
	//motion_stop();
	//sys_hud.hud_active = false;
}