switch(state) {		
	case "idle":
		senseIsWalking();
		senseIsTalking();
		break;
		
	case "talking":
		senseIsWalking();
		senseIsIdle(isTalking);
		break;
		
	case "walking":
		senseIsIdle(isWalking);
		break;
		
	case "emote":
		senseIsWalking();
		if (emoteConfig.midScript != null) {
			var frame = floor(image_index);
			if (frame = emoteConfig.midFrame) {
				emoteConfig.midScript();
				emoteConfig.midScript = null;
				emoteConfig.midFrame = null;
			}
		}
		break;
		
	case "transition":
		senseIsWalking();
		break;
}
