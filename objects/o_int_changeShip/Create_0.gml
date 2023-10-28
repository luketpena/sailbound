event_inherited();

shop = instance_create_layer(0, 0, l_main, o_town_shop_dock);

function interact() {
	o_town_player.setActive(false);
	shop.open();
}