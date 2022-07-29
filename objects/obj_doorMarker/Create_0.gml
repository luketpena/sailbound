event_inherited();

function interact() {
	sys_town.targetDoor = targetDoorId;
	var targetRoom = asset_get_index(roomName);
	transitionToRoom(targetRoom);
}