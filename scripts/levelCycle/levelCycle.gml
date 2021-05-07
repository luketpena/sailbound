///@param durationInSeconds Duration of the chapter in seconds
///@param mobList A collection of MobDefinitions
///@param dangerLevel A number representing the total number of danger points available for mobs
function Chapter(
	_duration,
	_mobList,
	_dangerLevel
) constructor {
	duration = _duration * room_speed;
	// The time of day out of 360, null indicates no change in time
	timeEnd = null;
	///@param timeEnd duration of chapter in seconds
	function setTimeEnd(_timeEnd) {
		timeEnd = _timeEnd;	
	}
	
	mobList = []; // A list of MobDefinitions that can spawn
	dangerLevel = _dangerLevel; // A number determining the number of danger points available
	
	script_start = null; // The script that is triggered at the start of the chapter
	script_end = null; // The script that is triggered at the end of the chapter
	
	///@param startScript Runs when the chapter starts
	///@param endScript Runs when the chapter ends
	function setScripts(_start, _end) {
		script_start = _start;
		script_end = _end;
	}
}

///@description A mob that is entered into a Chapter mob list
///@param danger The number of danger points the mob will cost
///@param spawnScript The script that brings the mob into the scene
function MobDefinition(
	_danger,
	_spawnScript
) constructor {
		
}