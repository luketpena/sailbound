function storyConfig_magma(){
	var totalDuration = minutes(1);
	
	return {
		music: mx_test_magma,
		startPalette: palette_tropical3,
		startScript: function() {
			//ceiling_create(global.water_y - 128, 2, propCollection_magmaCeiling);
			ground_createAtStart(global.water_y + 128, propCollection_magma);
			ground_setBumpConfig(
				new MinMax(-32, 128),
				new MinMax(seconds(2), seconds(8)),
				new MinMax(seconds(1), seconds(16))
			)
			waves_set_behavior_preset(WaveTypes.Calm);
			islands.activate([
				{
					island: VolcanoIsland,
					chance: 1,
				},
				{
					island: SpikedIsland,
					chance: 5,
				}
			], seconds(5), seconds(15));
		},
		chapters: [
		{ // Chapter 1
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
			chestList: [new StoryBronzeChest()],
			mobs: [
				//new StoryMobLavaWall()
			],	
		},
		{ // Chapter 2
			duration: totalDuration * .1,
			mobsToAdd: [
				new StoryMobChomper(),	
			],
			chestList: []
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
			duration: totalDuration * .05,
			startScript: function() {
				ground_finish();
				islands.setIslandWaitTimes(seconds(3), seconds(8));
			},
			mobsToRemove: ["urchin"],
			
		},
		{ // Chapter 5
			duration: totalDuration * .10,
			mobsToAdd: [
				new StoryMobPuffer()
			],
			startScript: function() {
				islands.setIslandWaitTimes(seconds(6), seconds(16));	
			}
		},
		{ // Chapter 6
			duration: totalDuration * .15,
			startScript: function() {
				event_whale_start();	
				islands.active = false;
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