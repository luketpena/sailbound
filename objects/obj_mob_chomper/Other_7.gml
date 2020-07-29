switch(sprite_index) {
	//Transition back to swimming state after biting
	case spr_mob_chomper_normal_bite:
		sprite_index = spr_mob_chomper_normal_swim;
		state = "swim";
		attacking = false;
		break;
}