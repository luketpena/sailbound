floatMove_init(2, .05);
lungeSpeed = 3;

state = "chase";
stateTimer = 0;

fadeOutTimer = 10 * room_speed;

range = 64;

attackReady = false;
attackHit = false;
attackHitbox = null;

face = 1;


function impact() {
	attackHit = true;
}

function setFadeOutTimer() {
	fadeOutTimer = random_range(5, 15) * room_speed;	
}
