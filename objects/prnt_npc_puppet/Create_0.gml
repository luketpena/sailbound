sprite = {
	walk: spr_tf_mathilde_walk,
	idle: spr_tf_mathilde_idle_1,
	talk: spr_tf_mathilde_talk_1,
}

base = {
	idle: spr_tf_mathilde_idle_1,
	talk: spr_tf_mathilde_talk_1,
	walk: spr_tf_mathilde_walk,
}

sprite_index = spr_tf_mathilde_idle_1;


face = 1;
state = "idle";
isWalking = false;
isTalking = false;

emoteQueued = false;
emoteConfig = {
	sprite: null,
	endScript: null,
	midScript: null,
	midFrame: null,
}

idleTransition = {
	sprite: null,
	target: {
		idle: null,
		talk: null,
	},
}

function senseIsWalking() {
	if (isWalking) {
		state = "walking";
		sprite_index = sprite.walk;
		image_index = 0;
	}
}

function senseIsTalking() {
	if (isTalking) {
		state = "talking";
		sprite_index = sprite.talk;
		image_index = 0;
	}
}

function senseIsIdle(active) {
	if (!active) {
		state = "idle";
		sprite_index = sprite.idle;
		image_index = 0;
	}
}


function anim_emote(emote, queued = false) {
	if (!queued) {
		triggerEmote(emote);
		emoteConfig.endScript = emote.endScript;
		emoteConfig.midScript = emote.midScript;
		emoteConfig.midFrame = emote.midFrame;
	} else {
		emoteQueued = true;
		emoteConfig = emote;
	}
	
}

function triggerEmote(emote) {
	state = "emote";
	sprite_index = emote.sprite;
	image_index = 0;
	emoteConfig.sprite = null;
	if (emote.startScript != null) {
		emote.startScript();	
		emoteConfig.startScript = null;
	}
}
