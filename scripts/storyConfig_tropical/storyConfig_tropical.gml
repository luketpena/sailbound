function storyConfig_tropical(){
	var totalDuration = minutes(1);
	
	return {
		startPalette: palette_tropical,
		startScript: function() {
			ground_createAtStart(global.water_y + 64, propCollection_tropical);
			//var startingIsland = island_spawn_pos(1, spr_landmark_startingIsland, .5, 1);
			//island_list_insert(startingIsland);
			waves_set_behavior_preset(WaveTypes.Calm);
		},
		chapters: [
		{ // Chapter 1
			islandActive: true,
			//islandType: IslandType.Tropical,
			islandWaitMin: .2,
			islandWaitMax: 3,
			duration: totalDuration * .1,
			maxDanger: 10,
			ringActive: true,
			ring: {
				minTimer: 8,
				maxTimer: 15,
			},
			chestActive: true,
			chestTimer: {
				minTimer: 8,
				maxTimer: 30,
			},
			chestList: [
				{
					type: ChestType.Bronze,
					chance: 1,
					timerOffset: 0,
				},
			],
			mobs: [
				new StoryMobUrchin(),
				new StoryMobSeagull()
			],	
		},
		{ // Chapter 2
			duration: totalDuration * .1,
			mobsToAdd: [
				new StoryMobChomper(),	
			]
		},
		{ // Chapter 3
			duration: 1,
			startScript: function() {
				waves_set_behavior_preset(WaveTypes.Normal);	
			},
			mobsToAdd: [
				new StoryMobSeagullGang()
			]
		},
		
		{ // Chapter 4
			islandWaitMin: 3,
			islandWaitMax: 8,
			duration: totalDuration * .05,
			startScript: function() {
				ground_finish();
			},
			mobsToRemove: ["urchin"],
		},
		{ // Chapter 5
			islandWaitMin: 6,
			islandWaitMax: 16,
			duration: totalDuration * .10,
			mobsToAdd: [
				new StoryMobPuffer()
			]
		},
		{ // Chapter 6
			islandActive: false,
			duration: totalDuration * .15,
			startScript: function() {
				event_whale_start();	
			},
		},
		{ // Chapter 7
			duration: totalDuration * .1,
			startScript: function() {
				waves_set_behavior_preset(WaveTypes.High);
			},
			mobsToRemove: ["seagullGang"],
			mobsToAdd: [
				new StoryMobChomperSquad(),
			]
		},
		{ // Chapter 8
			duration: totalDuration * .1,
			startScript: function() {
				event_whale_end();
				waves_set_behavior_preset(WaveTypes.Normal);
			},
		},
		{ // Chapter 9
			duration: totalDuration * .1,
			startScript: function() {
				waves_set_behavior_preset(WaveTypes.Calm);
				ground_create(global.water_y + 64, 15, propCollection_tropical);
			},
			mobsToRemove: ["puffer"],
			mobsToAdd: [
				new StoryMobUrchin(),
			]
		},
		{ // Chapter 10
			duration: totalDuration * .1,
			startScript: function() {
				waves_set_behavior_preset(WaveTypes.Stagnant);
			},
			mobsToAdd: [
				new StoryMobSeagullGang(),
			],
			mobsToRemove: ["puffer"]
		}

	
	]}
}

function startMethod_tropical() {
	ground_createAtStart(global.water_y + 64, propCollection_tropical);
	//var startingIsland = island_spawn_pos(1, spr_landmark_startingIsland, .5, 1);
	//island_list_insert(startingIsland);
}