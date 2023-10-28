/*
	This is the list of all available items in the game.
	
	The 'get' function will return an object based on the item enum.
	
	All item entries need the following:
		- icon [a sprite with an inventory image and item box image]
		- trigger_function [a function stored in the item_triggers script that determines what
		  happens when the item is activated.
		- hud_icon [only used for weapons / equipped items, not single use items]
*/
function ItemCatalogue() constructor {
	list = {
		cannon: {
			name: "Cannon",
			icon: ico_item_cannon,
			triggerFunction: item_trigger_cannon,
			hud_icon: spr_hud_item_cannon
		},
		boomerang: {
			name: "Boomerang",
			icon: ico_item_boomerang,
			triggerFunction: item_trigger_boomerang,
			hud_icon: spr_hud_item_boomerang
		},
		potion: {
			name: "Potion",
			icon: ico_item_potion,
			triggerFunction: item_trigger_potion,
			hud_icon: -1
		},
		repairBuddy: {
			name: "Repair Buddy",
			icon: ico_item_repairBuddy,
			triggerFunction: item_trigger_repairBuddy,
			hud_icon: -1
		}
	}
	
	function get(item) {
		switch(item) {
			case Items.cannon:		return list.cannon;
			case Items.boomerang:	return list.boomerang;
			case Items.potion:		return list.potion;
			case Items.repairBuddy: return list.repairBuddy;
		}
	}
}