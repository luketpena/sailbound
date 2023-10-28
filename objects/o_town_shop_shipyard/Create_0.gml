// Setup
select = 0;
active = false;
purchase_active = false;
preview_x = global.vw * .75;
preview_y = global.vh * .40;

purchaseButton = new UI_Button(preview_x, preview_y + 32, "Buy");

// Layout
margin = 8;
gap = 4;
columns = 3;

// Inventory
item_width = 24;
stock = [];
for (var i=0; i<catalogue_ships_count; i++) {
	var _key = catalogue_ships_keys[i];
	var _entry = getShipData(_key);
	
	var _xPos = i mod columns;
	var _yPos = i div columns;
	
	var _x = margin + (_xPos * (gap + item_width)) + (item_width * .5);
	var _y = margin + (_yPos * (gap + item_width)) + (item_width * .5);
	
	array_push(stock, {
		id: _key,
		x: _x,
		y: _y,
		entry: _entry,
		status: vault.inventory.getHullStatus(_key),
		purchaseCost: _entry.purchaseCost,
		repairCost: _entry.repairCost,
		hover: false,
	});
}
selected = stock[select];

function open() {
	active = true;
	global.interfaceOpen = true;
	menu.setInputRow([
		new InputRowItem("exit", "ui", "close"),
	]);
}

function close() {
	active = false;
	global.interfaceOpen = false;
	menu.clearInputRow();
}

function purchase() {
	// Only allow purchase if of purchasable status
	if (selected.status == ShipPartStatus.Available || selected.status == ShipPartStatus.Damaged) {
		var _cost = selected.status == ShipPartStatus.Damaged ? selected.repairCost : selected.purchaseCost;
		if (vault.bank.gold >= _cost) {
			vault.bank.incrementGold(-_cost);
			// Update both the vault inventory and the local shop status
			vault.inventory.updateHullStatus(selected.id, ShipPartStatus.Owned);
			stock[select].status = ShipPartStatus.Owned;
		}
	}
}