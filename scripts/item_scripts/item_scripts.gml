function item_slot() constructor {
	active = false;
	name = "";
	sprite_index = -1;
	trigger_function = -1;
	
	//Resets the slot to the default, empty values
	reset = function() {
		active = false;
		name = "";
		sprite_index = -1;
		trigger_function = -1;
	}
	
	//Picking up a new item into the slot
	pickup = function( _name, _sprite_index, _trigger_function ) {
		active = true;
		name = _name;
		sprite_index = _sprite_index;
		trigger_function = _trigger_function;
    }
	
	//Trigger the use of an item and then call a reset
	use = function() {
		if (script_exists(trigger_function)) {
			script_execute(trigger_function);	
		}
		reset();
	}
}

// Creates an itembox with an item assigned to it
function item_spawn_box(x,y,item) {
	var o = instance_create_layer(x,y,"l_items",obj_itembox);
	o.item = item;
	o.item_icon = item_get_icon(item);
}

// Assigns an item to a slot, but only if a slot is free
function item_pickup(item) {
	for (var i=0; i<4; i++) {
		if (!global.inventory[i].active) {
			global.inventory[i].pickup(item, item_get_icon(item), item_get_trigger(item));
			return true;
			break;
		}
	}
	return false;
}

//Returns the sprite for a given item enum
function item_get_icon(item) {
	return global.item_list.get_item(item).icon;
}

//Returns the trigger script for a given item enum
function item_get_trigger(item) {
	return global.item_list.get_item(item).trigger_function;
}