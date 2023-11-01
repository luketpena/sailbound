dialogTrigger = create_interactable(x, y - 24, "Shop", 48, 48, -24);
shop = instance_create_layer(0, 0, l_system, o_town_shop_shipyard);

dialogTrigger.interact = function() {
	active = false;
	shop.open();	
}