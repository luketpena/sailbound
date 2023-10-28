enum ShipPartStatus {
	Undiscovered, // Not yet available for purchase
	Available, // Discovered, but not purchased yet
	Owned, // Purchased and ready
	Lost, // Lost out at seea, but recoverable
	Damaged, // Broken, but have ship orb
	Destroyed, // Broken and ship orb was lost
}

function resource_iron() {
	return new Resource(
		"Iron",
		"A common metal found throughout the sea.",
		s_pixel,
		s_pixel,
	);
}

function resource_diamond() {
	return new Resource(
		"Diamond",
		"A hard, sparkly gem stone.",
		s_pixel,
		s_pixel,
	);
}

///@description A unique resource currency
function Resource(_name, _description, _sprite, _icon) {
	name = _name;
	description = _description;
	sprite = _sprite;
	icon = _icon;
}

// An amount of a resource to be charged as a price unit
function ResourceUnit(_resource, _price) {
	resource = _resouce;
	price = _price;
}

///@description A single ship part to be purchased
function ShipItem(
	_name,
	_price,
	_description,
	_resourceUnits = []
) constructor {
	// Description
	name = _name;
	price = _price;
	resources = _resources;
	description = _description;
}