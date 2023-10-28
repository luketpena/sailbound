character_init();

sprite_index = spr_peter_idle;
// Gameplay variables
targetInteractable = noone;

function setActive(_newStatus = null) {
	active = (_newStatus = null) ? !active : _newStatus;	
}