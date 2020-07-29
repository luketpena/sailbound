/*
	This is the list of all available items in the game.
	
	The 'get' function will return an object based on the item enum.
	
	All item entries need the following:
		- icon [a sprite with an inventory image and item box image]
		- trigger_function [a function stored in the item_triggers script that determines what
		  happens when the item is activated.
		- hud_icon [only used for weapons / equipped items, not single use items]
*/
function item_list() {
	return {
		get_item: function(item) {
			switch(item) {
				case items.cannon: return cannon;
				case items.boomerang: return boomerang;
				case items.potion: return potion;
				case items.repairBuddy: return repairBuddy;
			}
		},
		cannon: {
			icon: ico_item_cannon,
			trigger_function: item_trigger_cannon,
			hud_icon: spr_hud_item_cannon
		},
		boomerang: {
			icon: ico_item_boomerang,
			trigger_function: item_trigger_boomerang,
			hud_icon: spr_hud_item_boomerang
		},
		potion: {
			icon: ico_item_potion,
			trigger_function: item_trigger_potion,
			hud_icon: -1
		},
		repairBuddy: {
			icon: ico_item_repairBuddy,
			trigger_function: item_trigger_repairBuddy,
			hud_icon: -1
		}
	}
}