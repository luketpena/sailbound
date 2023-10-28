#macro catalogue_ships shipDataCatalogue()
#macro catalogue_ships_keys struct_get_names(catalogue_ships)
#macro catalogue_ships_count array_length(catalogue_ships_keys)

function ShipData(
	_id, _name, _description,
	_orbSprite, _drawObject,
	_statsScript, _purchaseCost, _repairCost,
) constructor {
	id = _id;
	name = _name;
	description = _description;
	orbSprite = _orbSprite;
	drawObject = _drawObject;
	statsScript =  _statsScript;
	purchaseCost = _purchaseCost;
	repairCost = _repairCost;
}

function shipDataCatalogue() {
	return {
		classic: new ShipData("classic", "classic",
			"a common sailing ship - sturdy, reliable, and agile. no fancy tricks, just good craftsmanship.",
			s_shipOrb_classic, o_boatDraw_default, hullStats_classic, 50, 25),
		steamboat: new ShipData("steamboat", "steamboat",
			"who needs the wind when you have the power of steam! very responsive, if a bit flat.",
			s_shipOrb_steamboat, o_boatDraw_steamboat, hullStats_steamboat, 40, 20),
		banana: new ShipData("banana", "banana",
			"flimsy but agile, charming, and lightweight. sail some waves, catch some potassium.",
			s_shipOrb_banana, o_boatDraw_default, hullStats_banana, 30, 20),
		raft: new ShipData("raft", "raft",
			"don't be fooled by it's primitive trappings - the raft is as seaworthy as any vessel.",
			s_shipOrb_raft, o_boatDraw_default, hullStats_raft, 20, 15),
	}
}

function getShipData(_key) {
	if variable_struct_exists(catalogue_ships, _key) {
		return catalogue_ships[$ _key];	
	}
}

function getShipStats(_name) {
	var _data = getShipData(_name);
	return _data.statsScript();
}

function getActiveShipStats() {
	return getShipStats(vault.dock.activeShip);
}

function getActiveShipDrawObject() {
	var _data = getShipData(vault.dock.activeShip);
	return _data.drawObject;
}
