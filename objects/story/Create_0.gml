/*
	A story is what controls the flow of a single level. It is map up of several chapters the define
	the mobs that spawn, the colors displayed, and the events triggered. Once a story has completed
	all of its chapters, the story either completes on normal mode or loops on infinite mode.
	
	In normal mode, the chapters can define strict times of day for the end point of a chapter.
	
	In infinite mode, the chapters will have to be constructed differently without set times or 
	events that are dependent on those times.
*/

// The progress along the story between chapters
chapters = []; // An array of chapters with their own independent properties
chapterCount = 0; // How many chapters are there
progress = 0; // The progress through the total duration of all chapters
chapterProgress = 0; // The percent progress through the current chapter
chapterCurrentIndex = 0; // The index of the chapter we are currently within
totalDuration = 0; // The sum of all chapter durations
storyEnd = false; // Triggers if loop is false and the story comes to an end
active = false; // Whether or not the story should progress
gameMode = GameMode.Default;
level = null;

plot_tropicalParadise(GameMode.Infinite);