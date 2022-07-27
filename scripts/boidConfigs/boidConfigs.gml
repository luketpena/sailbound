function boidConfig_blueFish() {
	return {
		spriteIndex: spr_amb_blueFish,
		count: new MinMax(5, 20),
		targetTimerRange: new MinMax(1, 15),
		reactToBoat: true,
		speedLimitRange: new MinMax(1.8, 2.2),
		minDistanceRange: new MinMax(5, 22),
		centeringFactorRange: new MinMax(0.001, 0.005),
		matchingFactor: 0.001,
		avoidFactor: 0.001,
		boundMargin: 150,
		viewRange: 50,
		boundTurnFactor: .5,
		targetTrackingFactor: .1,
		targetRangeY: new MinMax(global.water_y, global.water_y + 150)
	}
}

function boidConfig_redFish() {
		return {
		spriteIndex: spr_amb_redFish,
		count: new MinMax(2, 4),
		targetTimerRange: new MinMax(1, 3),
		reactToBoat: true,
		speedLimitRange: new MinMax(.8, 1.2),
		minDistanceRange: new MinMax(3, 12),
		centeringFactorRange: new MinMax(0.005, 0.01),
		matchingFactor: 0.001,
		avoidFactor: 0.005,
		boundMargin: 150,
		viewRange: 50,
		boundTurnFactor: .5,
		targetTrackingFactor: .1,
		targetRangeY: new MinMax(global.water_y, global.water_y + 150)
	}
}

function boidConfig_goldFish() {
		return {
		spriteIndex: spr_amb_goldFish,
		count: new MinMax(15, 20),
		targetTimerRange: new MinMax(1, 3),
		reactToBoat: true,
		speedLimitRange: new MinMax(2.8, 2.2),
		minDistanceRange: new MinMax(3, 12),
		centeringFactorRange: new MinMax(0.001, 0.002),
		matchingFactor: 0.001,
		avoidFactor: 0.005,
		boundMargin: 150,
		viewRange: 50,
		boundTurnFactor: .5,
		targetTrackingFactor: .1,
		targetRangeY: new MinMax(global.water_y, global.water_y + 150)
	}
}