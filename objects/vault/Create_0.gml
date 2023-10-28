/*
	Welcome to the Vault! The vault is where persistent data is stored about the progress and acquisitions
	of the player. Data stored here will be things such as:
		- Days elapsed
		- Levels unlocked
		- NPC progress
		- Hulls and sails
		- Current loadout
		- Current Gold and Resources
		- etc.
*/

bank = new Bank(); // Money + resources
inventory = new Inventory(); // Hull, item, core, etc, availability
dock = new Dock(); // Currently active hull, core, curses, etc
loading_cooldown = 0;

function save() {
	var payload = {
		bank: bank.saveData(),
		inventory: inventory.saveData(),
		dock: dock.saveData()
	}
	savegame_save(payload);
	loading_cooldown = seconds(3);
}

function load() {
	var _saveData = savegame_load();	
	if (_saveData != null) {
		if variable_struct_exists(_saveData, "bank") bank.init(_saveData.bank);
		//if variable_struct_exists(saveData, "inventory") inventory.init(saveData.inventory);
		if variable_struct_exists(_saveData, "dock") dock.init(_saveData.dock);
	}
	loading_cooldown = seconds(3);
	log("HULLS", inventory.hull);
}

load();
