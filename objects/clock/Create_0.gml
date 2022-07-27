// The clock loops 0 to 1, the points are fixed along that path
point = {
	morning: 0, // .1
	day: .1, // .1
	sunset: .4, // .3
	sunfall: .45, // .05
	nightfall: .5, // .05
	night: .6, // .1
	sunrise: .9 // .3
}

time = 0; // Progress 0 to 1 within a day
elapsed = 0; // Total elapsed time
savedElapsed = 0; // The last point in time an update was run
day = 0; // Days elapsed

period = point.morning; // The current clock period
nightFade = 0; // Fades between 0 and 1 for transition to night

// These values are for when the clock is looping
active = true;

var dayDurationInMinutes = 20; // Arbitrary, used to determine how long a day should be
clock_speed = ((1 / 60) / 60) / dayDurationInMinutes;

// The chapter values let the time of day progress according to chapter progress
timeStart = null; // Set to whatever time the chapter started at
timeEnd = null; // Lerps to this value from clockTimeStart

alarm[0] = 1;
alarm[1] = 1;

//@param newEndTime Number 0 to 1 or null
function setEndTime(newEndTime) {
	timeStart = elapsed;
	if (newEndTime = null) {
		timeEnd = null;	
	} else {
		var targetEndTime = day + newEndTime;
		if (newEndTime > time) {
			timeEnd = targetEndTime;
		} else {
			timeEnd = targetEndTime + 1;	
		}
	}
}

// Snaps the time to the starTime provided
function setStartTime(startTime) {
	elapsed = startTime;
	calculateTimeAndDay();
}

// Used to determine time (progress in a day) and day (days elapsed)
function calculateTimeAndDay() {
	time = elapsed mod 1;
	day = (elapsed div 1);	
}

// Updates the clock based on a new chapter
function update(chapter) {
	// Updating clock end time
	if (variable_struct_exists(chapter, "clockTimeEnd")) {
		setEndTime(chapter.clockTimeEnd);
	} else {
		setEndTime(null);	
	}	
}

// Sets the groupped period name based on the time
function updatePeriod() {
	//>>night to sunrise
	if (time >= point.sunrise && time <= point.morning) period = TimeOfDay.Madrugada
	//>>sunrise to day
	else if (time >= point.morning && time <= point.day) period = TimeOfDay.Morning
	//>>Day sustained
	else if (time <= point.sunset || time >= point.day) period = TimeOfDay.Day
	//>>Day to sunset
	else if (time >= point.sunset && time <= point.sunfall) period = TimeOfDay.Afternoon
	//>>sunset to sunfall
	else if (time >= point.sunfall && time <= point.nightfall) period = TimeOfDay.Evening
	//>>sunfall to night
	else if (time >= point.sunfall && time <= point.night) period = TimeOfDay.Sunset
	//>>night sustained
	else if (time <= point.sunrise && time >= point.night) period = TimeOfDay.Night;
}

// Fades valuie up to 1 towards the night and snaps to 0 outside that range
function updateNightFade() {
	if (time > point.night && time < point.sunrise) {
		nightFade = fadeRange(time, .1, .1, point.night, point.sunrise, 0, 1);
	} else nightFade = 0;
}