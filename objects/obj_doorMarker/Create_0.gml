event_inherited();

function interact() {
	sys_town.targetDoor = targetDoorId;
	room_goto(asset_get_index(roomName));
}