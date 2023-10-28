// open([
//	new Question(
//		"this is a question. what should we do about it?",
//		new Answer(
//			"NOTHING, IT'LL SORT ITSELF OUT",
//			new Text("bad choice.", obj_test_townsfolk1),
//			new Text("yeah, probably not the best idea.", obj_test_townsfolk2),
//		),
//		new Answer(
//			"PANIC",
//			new ActionText(
//				"[quakeHigh] panicking!",
//				function() {
//						effect_create_above(ef_firework, global.midx, global.midy, 5, c_yellow);	
//				},
//				obj_test_townsfolk4
//			)
//		),
//		new Answer(
//			"CODE SOME MORE",
//			new Text("nothing happened. huh.")
//		),
//		new Answer(
//			"SHUT UP",
//			new Text("i guess it has to have a response.")
//		)
//	),
//	new Text("[waveSet,2,10,20] this phrase has [color,255,0,0] [quakeLow] punctuation, [quakeOff] [defaultColor] [waveOn] isn't that [quakeHigh] crazy! [quakeOff] [waveOff] ↵↵press A↵↵ [scale,3,-.1] also this part ought to shrink in.", obj_test_townsfolk1),
//	new Text("this is text two?"),
//	new Text("this is the third text to show! [quakeLow] i hope it reset properly!", obj_test_townsfolk2),
//	new Text("[waveSet,2,10,20] this phrase has [color,255,0,0] [quakeLow] punctuation, [quakeOff] [defaultColor] [waveOn] isn't that [quakeHigh] crazy! [quakeOff] [waveOff] ↵↵press A↵↵ [scale,3,-.1] also this part ought to shrink in.", obj_test_townsfolk3),
//	new Text("this dialog should be following the moving character around", obj_test_townsfolk4),
//]);