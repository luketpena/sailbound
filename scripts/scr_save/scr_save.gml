function savePath() {
	return 	"savedata/savegame.bin"; //working_directory + "gobbledeegook.txt";
}

function savegame_clear() {
	var path = savePath();
	if (file_exists(path)) {
		file_delete(path);
	}
}

function savegame_load() {
	sysLog("Retrieving save data...");
	var path = savePath();

	if (file_exists(path)) { // check file in directory
		var str = string_load_encrypted(path);
		var parsed = json_parse(str);
		sysLog("Save data parsed.");
		return parsed
	} else {
		sysLog("No save data was found for path " + path);
	}
	return null;
}

function savegame_save(payload) {
	var str = json_stringify(payload);
	var path = savePath();

	if (file_exists(path)) { // check file in directory
		sysLog("Replacing existing save file.");
		file_delete(path); // delete old file
	}

	var save = string_save_encrypted(path, str); // encrypt string and save to file
	if (save) {
		sysLog("Game saved at path " + path);
	} else {
		sysLog("There was an error saving on path " + path);	
	}	
}

