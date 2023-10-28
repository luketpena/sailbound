//open([
//	new Interview(
//		"this conversation should give way to an interview",
//		new InterviewQuestion(
//			"WHAT IS AN INTERVIEW?",
//			false,
//			new Text("an interview is a series of potential conversations you can have with an npc, but each branch can only be asked once."),
//			new Text("this allows us to have somewhat natural conversations with less repetition."),
//			new TextWait(2),
//			new Text("follow up after a wait."),
//		),
//		new InterviewQuestion(
//			"IS THIS GOING TO BE HARD TO PUT TOGETHER?",
//			true,
//			new Text("quite"),
//		),
//		new InterviewQuestion(
//			"CAN THIS BRANCH INTO A QUESTION IMMEDIATELY?",
//			true,
//			new Question(
//				"what do you think of this sytem?",
//				new Answer(
//					"KIND OF OVER THE TOP?",
//					new Text("i mean, probably. but it's still cool to have around."),
//					new Text("besides, it's something we can use in the future."),
//				),
//				new AnswerWithInterviewFollowup(
//					"TRIGGER A FOLLOW UP",
//					new InterviewQuestion(
//						"THIS OUGHT TO BE THE FOLLOWUP",
//						true,
//						new Text("kowabunga, dude."),
//					),
//					-1,
//					new Text("do i work?"),
//				)
//			)
//		),
//		new InterviewQuestion(
//			"GOODBYE",
//			false,
//			new InterviewEnd("see ya"),
//		)	
//	)
//]);
