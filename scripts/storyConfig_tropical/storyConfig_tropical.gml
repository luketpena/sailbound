function storyConfig_tropical(){
	var totalDuration = 60 * 10;
	
	return {
		startTime: .3,
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
				{
					name: "urchin",
					spawnScript: function() {
						spawn_urchin();	
					},
					danger: MobDanger.Urchin,
					cooldownMin: 3,
					cooldownMax: 8,
					cooldown: 0,
					chance: 1.5 * room_speed,
				},
				{
					name: "seagull",
					spawnScript: function() {
						spawn_seagull();	
					},
					danger: MobDanger.Seagull,
					cooldownMin: 1,
					cooldownMax: 15,
					cooldown: 5 * room_speed,
					chance: .5 * room_speed,
				},
			],	
		},
		{ // Chapter 2
			duration: totalDuration * .1,
			mobsToAdd: [
				{
					name: "chomper",
					spawnScript: function() {
						spawn_chomper();	
					},
					danger: MobDanger.Chomper,
					cooldownMin: 1,
					cooldownMax: 8,
					cooldown: 5 * room_speed,
					chance: 1 * room_speed,
				},	
			]
		},
		{ // Chapter 3
			duration: 1,
			startScript: function() {
				waves_set_behavior_preset(WaveTypes.Normal);	
			},
			mobsToAdd: [
				{
					name: "seagullGang",
					spawnScript: function() {
						repeat(3) spawn_seagull();	
					},
					danger: MobDanger.Seagull * 3,
					cooldownMin: 10,
					cooldownMax: 30,
					cooldown: 0,
					chance: 4 * room_speed,
				}
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
				{
					name: "puffer",
					spawnScript: function() {
						spawn_puffer();	
					},
					danger: MobDanger.Puffer,
					cooldownMin: 3,
					cooldownMax: 8,
					cooldown: 0,
					chance: 20,
				},
			]
		},
		{ // Chapter 6
			islandActive: false,
			duration: totalDuration * .15,
			startScript: function() {
				whale_start();	
			},
		},
		{ // Chapter 7
			duration: totalDuration * .1,
			startScript: function() {
				waves_set_behavior_preset(WaveTypes.High);
			},
			mobsToRemove: ["seagullGang"],
			mobsToAdd: [
				{
					name: "chomperSquad",
					spawnScript: function() {
						spawn_chomper(1); // Left side, facing right
						spawn_chomper(-1); // Right side, facing left
					},
					danger: MobDanger.Chomper * 2,
					cooldownMin: 10,
					cooldownMax: 30,
					cooldown: 0,
					chance: 4 * room_speed,	
				}
			]
		},
		{ // Chapter 8
			duration: totalDuration * .1,
			startScript: function() {
				whale_end();
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
				{
					name: "urchin",
					spawnScript: function() {
						spawn_urchin();	
					},
					danger: MobDanger.Urchin,
					cooldownMin: 3,
					cooldownMax: 8,
					cooldown: 0,
					chance: 1.5 * room_speed,
				},
			]
		},
		{ // Chapter 10
			duration: totalDuration * .1,
			startScript: function() {
				waves_set_behavior_preset(WaveTypes.Stagnant);
			},
			mobsToAdd: [
				{
					name: "seagullGang",
					spawnScript: function() {
						repeat(3) spawn_seagull();	
					},
					danger: MobDanger.Seagull * 3,
					cooldownMin: 10,
					cooldownMax: 30,
					cooldown: 0,
					chance: 4 * room_speed,
				}
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