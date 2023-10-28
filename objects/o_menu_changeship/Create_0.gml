var hullKeys = vault.inventory.hullKeys();

gridUnitSize = 32;
columnCount = 3;
rowCount = ((array_length(hullKeys) - 1) div columnCount) + 1;

selectX = 0;
selectY = 0;

previewInstance = null;
previewRot = 0;
previewAngle = 0;

cards = [];

mode = "select"; // "select" or "purchase";
selectActive = false;

buttonPrompts = [];

for (var i=0; i<array_length(hullKeys); i++) {
	var key = hullKeys[i];
	var shipData = getShipData(key);
	var status = vault.inventory.getHullStatus(key);
	var color = c_gray;

	if (mode = "select") {
		switch(status) {
			case ShipPartStatus.Owned: color = c_white; break;
			case ShipPartStatus.Undiscovered: color = c_black; break;
			default: color = c_dkgray;
		}
	}
	
	if (mode = "purchase") {
		switch(status) {
			case ShipPartStatus.Owned: color = c_dkgray; break;
			case ShipPartStatus.Undiscovered: color = c_black; break;
			default: color = c_white;
		}
	}
	
	if (key = vault.dock.activeShip) {
		selectX = i mod columnCount;
		selectY = i div columnCount;
	}
	
	var card = {
		sprite: shipData.orbSprite,
		color: color,
		drawObject: shipData.drawObject,
		status: status,
		key: key,
		name: (status = ShipPartStatus.Undiscovered) ? "???" : shipData.name,
		description: (status = ShipPartStatus.Undiscovered) ? "" : shipData.description,
	}

	array_push(cards, card)
}


function selectHull() {
	if (selectActive) {
		var card = getActiveCard();
		vault.dock.updateActiveShip(card.key);
		vault.save();
		instance_destroy();
	}
}

function changeSelectX(change) {
	selectX = clamp(selectX + change, 0, columnCount - 1);
	updatePreview();
}

function changeSelectY(change) {
	if (change > 0) {
		selectY = (selectY + change) mod rowCount;
	} else {
		selectY += change;
		if (selectY = -1) {
			selectY = rowCount - 1;
		}
	}
	updatePreview();
}

function updateButtonPromptText() {
	var card = getActiveCard();
	var prompts = [];
	selectActive = false;
	if (mode = "select" && card.status = ShipPartStatus.Owned) {
		selectActive = true;
		array_push(prompts, "a SELECT");
	}
	
	if (mode = "purchase") {
		switch(card.status) {
			case ShipPartStatus.Available:
			case ShipPartStatus.Lost:
			case ShipPartStatus.Destroyed:
				array_push(prompts, "a PURCHASE");
				selectActive = true; 
				break;
				
			case ShipPartStatus.Damaged:
				selectActive = true;
				array_push(prompts, "a REPAIR");
				break;
		}
	}
	array_push(prompts, "b CANCEL");
	buttonPrompts = prompts;
}

function getActiveCard() {
	var index = clamp(selectX + (selectY * columnCount), 0, array_length(cards)-1);
	selectX = index mod columnCount;
	selectY = index div columnCount;
	return cards[index];
}

function updatePreview() {
	updateButtonPromptText();
	if (previewInstance != null && instance_exists(previewInstance)) {
		instance_destroy(previewInstance);
	}
	var card = getActiveCard();

	previewInstance = instance_create_depth(global.vx + (global.vw * .66), global.midy, -1000, card.drawObject);
	previewInstance.visible = false;
	setPreviewPos();
	var stats = getShipStats(card.key);

	previewInstance.init(
		stats.hullSprite,
		stats.sailSprite,
		false
	);
	previewInstance.updateBlending = false;
	previewInstance.image_blend = card.status != ShipPartStatus.Undiscovered ? c_white : c_black;	
	
}

function setPreviewPos() {
	if (instance_exists(previewInstance)) {
		previewInstance.x = global.vw * .66;
		previewInstance.y = global.vh * .25;	
	}
}

updatePreview();
