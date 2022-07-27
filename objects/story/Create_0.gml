/*
	A story is what controls the flow of a single level. It is map up of several chapters the define
	the mobs that spawn, the colors displayed, and the events triggered. Once a story has completed
	all of its chapters, the story either completes on normal mode or loops on infinite mode.
	
	In normal mode, the chapters can define strict times of day for the end point of a chapter.
	
	In infinite mode, the chapters will have to be constructed differently without set times or 
	events that are dependent on those times.
*/

// The progress along the story between chapters
progress = 0; // The progress through the total duration of all chapters
chapterProgress = 0; // The percent progress through the current chapter
chapterCurrentIndex = 0; // The index of the chapter we are currently within
storyEnd = false; // Triggers if loop is false and the story comes to an end
active = false; // Whether or not the story should progress
mobs = [];
mobActive = false;
maxDanger = 0;
gameMode = GameMode.Default;
global.danger = 0;

dangerLevel = 0;

ring = {
	minTimer: 0,
	maxTimer: 0,
	timer: 0,
	active: false,
}

chest = {
	active: false,
	list: [],
	minTimer: 0,
	maxTimer: 0,
	timer: 0,
	diceSize: 0,
	diceSides: [],
	
}
/*
	List format:
	{
		type: ChestType,
		chance: number,
		timerOffset: number,
	}
*/

config = storyConfig_tropical();

// Add start times to the config chapters
chapterCount = array_length(config.chapters);
totalDuration = 0;
for (var i=0; i<chapterCount; i++) {
	var c = config.chapters[i];
	c.startTime = totalDuration;
	totalDuration += c.duration * room_speed;
}

if (active) {
	story_init();
}

