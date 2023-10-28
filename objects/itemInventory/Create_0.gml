slots = array_create(4, new ItemSlot());
hasFreeSlot = true;
targetSlot = 0; // What is the first available item slot

catalogue = new ItemCatalogue();
activeItem = null;
current = null;

// Determines if there is a free inventory slot - run on any inventory change
function checkForFreeSlot() {
	hasFreeSlot = false;
	targetSlot = -1;
	for (var i=0; i<array_length(slots); i++) {
		if (!slots[i].active) {
			hasFreeSlot = true;
			targetSlot = i;
			break;
		}
	}
}

function pickup(item) {
	var itemData = catalogue.get(item);
	slots[targetSlot].pickup(itemData);
}