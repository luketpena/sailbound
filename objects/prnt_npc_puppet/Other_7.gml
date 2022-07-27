
switch(state) {		
	case "idle":
		if (emoteQueued) {
			triggerEmote(emoteConfig);
			emoteQueued = false;
		}
		break;
	
	case "emote":
		if (emoteConfig.endScript) {
			emoteConfig.endScript();
			emoteConfig.endScript = null;
		}
		sprite_index = sprite.idle;
		state = "idle";
		break;
		
	case "transition":
		sprite.idle = transition.target.idle;
		sprite.talk = (transition.target.talk != null) ? transition.target.talk : base.talk;
		sprite_index = sprite.idle;
		state = "idle";
		break;
}
