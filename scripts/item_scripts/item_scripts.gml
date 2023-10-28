function ItemSlot() constructor {
	active = false;
	name = null;
	icon = null;
	triggerFunction = null
	
	//Resets the slot to the default, empty values
	function reset() {
		active = false;
		name = null;
		icon = null;
		triggerFunction = null;
	}
	
	//Picking up a new item into the slot
	function pickup(_itemCatalogueData) {
		active = true;
		name = _itemCatalogueData.name;
		icon = _itemCatalogueData.icon;
		triggerFunction = _itemCatalogueData.triggerFunction;
    }
	
	//Trigger the use of an item and then call a reset
	function activate() {
		if (script_exists(triggerFunction)) {
			script_execute(triggerFunction);	
		}
		reset();
	}
}

// Creates an itembox with an item assigned to it
function item_spawn_box(x, y, item) {
	var o = instance_create_layer(x, y, "l_items", obj_itembox);
	o.item = item;
	o.item_icon = item_get_icon(item);
}

// Assigns an item to a slot, but only if a slot is free
function item_pickup(item) {
	if (itemInventory.hasFreeSlot) {
		itemInventory.pickup(item);
		return true;
	}
	return false;
}
