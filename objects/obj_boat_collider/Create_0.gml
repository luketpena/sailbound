bounceReady = false;
bounceReadyTimer = 0;
bounceReadyTimerSet = .25 * room_speed;
bounceDelay = 0;
bounceDelaySet = 15;

function init(width, height) {
	fixture_create_box(id, width, height, .1, 0, 0, 0, 0, true, false, false);	
}

collideQueue = [];

/*
	The collision queue is a way by which we can continue to watch a physics collision after the
	impact to respond to it when viable. This is specifically for bounce on top of mobs, but
	perhaps can be expanded if required in the future.
	
	It gets put in the queue. If we are no longer colliding, then we discard that moment in the queue.
	
	If the conditions are met for the collision while in the queue, then we execute the collision function
	passed by the original collision event.
	
	Use the Seagull as an example of this pattern.
*/

// Adds a new collision marker to the queue
function addToQueue(instance, collisionFunction) {
	array_push(collideQueue, new CollisionMarker(instance, collisionFunction));
}

// Used within collision events to 
function triggerQueueCollision(instance, collisionFunction) {
	if (bounceReady && bounceDelay = 0) {
		collisionFunction(instance);
		bounceDelay = bounceDelaySet;
	} else {
		addToQueue(instance, collisionFunction);
	}	
}

function CollisionMarker(_instance, _collisionFunction) constructor {
	instance = _instance;
	collisionFunction = _collisionFunction;
}

function clearBounceReady() {
	bounceReady = false;
	bounceReadyTimer = 0;
}

function collideWith(object) {
	return instance_position(x, y, object);
}
