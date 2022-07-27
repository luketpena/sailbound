open([
	{
		text: "this is a question. what should we do about it?",
		question: [
			{
				text: "NOTHING, IT'LL SORT ITSELF OUT",
				answer: [
					{
						text: "bad choice.",
						target: obj_test_townsfolk1,
					},
					{
						text: "yeah, probably not the best idea.",
						target: obj_test_townsfolk2,
					}
				],
			},
			{
				text: "PANIC",
				answer: [
					{
						text: "[quakeHigh] panicking!",
						target: obj_test_townsfolk4,
						action: function() {
							log("Panicking confirmed.");
							effect_create_above(ef_firework, global.midx, global.midy, 5, c_yellow);	
						}
					},
				],
			},
			{
				text: "CODE SOME MORE",
				answer: [
					{
						text: "nothing happened. huh."	,
					},
				],
			}
		]
	},
	{
		text: "[waveSet,2,10,20] this phrase has [color,255,0,0] [quakeLow] punctuation, [quakeOff] [defaultColor] [waveOn] isn't that [quakeHigh] crazy! [quakeOff] [waveOff] ↵↵press A↵↵ [scale,3,-.1] also this part ought to shrink in.",
		target: obj_test_townsfolk1,
	},
	{
		text: "this is text two?",
	},
	{
		text: "this is the third text to show! [quakeLow] i hope it reset properly!",
		target: obj_test_townsfolk2,
	},
	{
		text: "[waveSet,2,10,20] this phrase has [color,255,0,0] [quakeLow] punctuation, [quakeOff] [defaultColor] [waveOn] isn't that [quakeHigh] crazy! [quakeOff] [waveOff] ↵↵press A↵↵ [scale,3,-.1] also this part ought to shrink in.",
		target: obj_test_townsfolk3,
	},
	{
		text: "this dialog should be following the moving character around",
		target: obj_test_townsfolk4,
	},
]);