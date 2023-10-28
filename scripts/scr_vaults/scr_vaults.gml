// Handles the recording of currency values
function Bank() constructor {
	gold = 0;
	resources = {
		iron: 0
	}

	function init(payload) {
		if (variable_struct_exists(payload, "gold")) {
			gold = payload.gold;	
		}
		copySaveDataToStruct(payload, resources, "resources");
	}

	function incrementGold(value) {
		if (value > 0) {
			gold += value;	
		} else {
			gold = max(gold + value, 0);	
		}
	}
	
	function saveData() {
		return {
			gold: gold,
			resources: resources
		}
	}
}

// Handles the status of hulls
function Inventory() constructor {
	hull = {};
	
	// With the catalogue as the source of truth, assign the default values for ship keys
	for (var i=0; i<catalogue_ships_count; i++) {
		variable_struct_set(hull, catalogue_ships_keys[i], {
			status: ShipPartStatus.Available,
			levelId: "", // Where was the part lost
			levelPercent: 0 // How far along the level was it lost
		});	
	}
	
	hull[$ "classic"] = {
		status: ShipPartStatus.Lost,
		levelId: "tropical",
		levelPercent: .1
	}
	
	function init(payload) {
		copySaveDataToStruct(payload, hull, "hull");
	}
	
	function hullKeys() {
		return variable_struct_get_names(hull);
	}
	
	function getHullStatus(key) {
		return hull[$ key].status;	
	}
	
	function getActiveHulls() {
		var activeHullKeys = [];
		for (var i=0; i<catalogue_ships_count; i++) {
			var key = catalogue_ships_keys[i];
			if (hull[$ key].status = ShipPartStatus.Owned) {
				array_push(activeHullKeys, key);	
			}
		}
		return activeHullKeys;
	}
	
	function getHullsLostByLevelId(_levelId) {
		var _list = [];
		for (var i=0; i<catalogue_ships_count; i++) {
			var _id = catalogue_ships_keys[i];
			if (vault.inventory.hull[$ _id].levelId == _levelId) {
				array_push(_list, _id);	
			}
		}
		return _list;
	}
	
	// Recovers all ships from a level, marking them as damaged and resetting their level settings
	function recoverShips(_levelId) {
		var _shipIds = vault.inventory.getHullsLostByLevelId(global.level_id);
		for (var i=0; i<array_length(_shipIds); i++) {
			hull[$ _shipIds[i]] = {
				status: ShipPartStatus.Damaged,
				levelId: "",
				levelPercent: 0
			}
		}
		
	}
	
	function updateHullStatus(_shipName, _status) {
		if (variable_struct_exists(hull, _shipName)) {
			hull[$ _shipName].status = _status;
		}
	}
	
	function hullLostAtSea(_name) {
		hull[$ _name] = {
			status: ShipPartStatus.Lost,
			levelId: global.level_id,
			levelPercent: global.level_progress,
		}
		if (_name = vault.dock.activeShip) {
			vault.dock.activeShip = undefined;	
		}
	}
	
	function saveData() {
		return {
			hull: hull
		}
	}
}

// Handles the currently active ship and status
function Dock() constructor {
	// Set to undefined to indicate no docked ship
	activeShip = "classic";
	
	function updateActiveShip(name) {
		if (array_find(catalogue_ships_keys, name) != -1) {
			activeShip = name;	
		}
	}
	
	function wreck() {
		if (data.activeShip != null) {
			// Update the status in the inventory
			vault.inventory.damageHull(activeShip);
			// Clear the dock
			data.activeShip = null;
		} 
	}
	
	function init(payload) {
		if (variable_struct_exists(payload, "activeShip")) {
			activeShip = payload.activeShip;	
		}
	}
	
	function saveData() {
		return {
			activeShip: activeShip	
		}
	}
}

function copySaveDataToStruct(payload, dest, srcKey) {
	// Check if the payload does have the key we're looking for
	if (variable_struct_exists(payload, srcKey)) {
		// Get the pointer to the actual sub struct and get the keys
		var src = variable_struct_get(payload, srcKey);
		var keys = variable_struct_get_names(src);
		
		// Iterate over the keys...
		for (var i=0; i<array_length(keys); i++) {
			var key = keys[i];
			// ...look for that key existing on our target object...
			if (variable_struct_exists(dest, key)) {
				// ...and update that value if it exists.
				var value = variable_struct_get(src, key);
				variable_struct_set(dest, key, value);
			} else {
				sysLog("Missing key when loading init data for " + srcKey + ": " + key);	
			}
		}
	}	
}