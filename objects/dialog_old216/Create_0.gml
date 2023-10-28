/////@description
//layout = {
//	pos: {
//		x: 16,
//		y: 16
//	},
//	savedWidth: 128,
//	width: 128,
//	height: 0,
//	lines: 0,
//	margin: 8
//}

//textToTranslate = [];
//textPos = 0; //The position of the text writing
//conversationPos = 0;
//conversationLength = 0;
//translated = [];
//translatedLength = 0;

//screenMargin = 8;

//select = 0; // Selection of text in both interviews and questions

//question = {
//	active: false,
//}

//// An interview is a list of branching conversations that get removed one-by-one as selected
//interview = {
//	active: false, // Show the selection interface
//	ongoing: false, // Return back to select interface after current conversation ends
//	list: [], // Array of conversation branches
//	target: null, // The object that owns the interview
//}

//// Uses an array function to check, and those callbacks cannot reference local variables or arguments
//questionToCheck = "";

/////@description Used to determine if a question we are adding already exists to prevent duplicates
/////@param {String} text
/////@returns {Boolean}
//function determineIfQuestionExists(_text) {
//	questionToCheck = _text;
//	return array_find_index(interview.list, function(q) {
//		return q.text = questionToCheck; 
//	}) >= 0;
//}

/////@param {Struct.InterviewQUestion} interviewQuestion
//function addFollowUp(_interviewQuestion) {
//	var questionAlreadyExists = determineIfQuestionExists(_interviewQuestion.text);
//	if (!questionAlreadyExists) {
//		array_push(interview.list, _interviewQuestion);
//	}
//}

//function insertFollowUp(_interviewQuestion, _pos) {
//	var questionAlreadyExists = determineIfQuestionExists(_interviewQuestion.text);
//	if (!questionAlreadyExists) {
//		// Negative position offsets it from the end
//		var index = (_pos >= 0) ? _pos : array_length(interview.list) + _pos;
//		array_insert(interview.list, index, _interviewQuestion);
//	}
//}

//function checkIfInterviewOngoing() {
//	var sayGoodbye = variable_struct_exists(config[conversationPos], "interviewEnd");
//	if (sayGoodbye) {
//		interview.ongoing = false;	
//	}
	
//	var atEnd = conversationPos = conversationLength - 1;
//	if (interview.ongoing && atEnd && !question.active) {
//		interview.active = true;	
//	} else {
//		interview.active = false;	
//	}
//}

//config = [];

//font = {
//	color: c_black,	
//	defaultColor: c_black,
//	sprite: s_font_textbox,
//	height: 0,
//	width: 0,
//	quake: 0,
//	wave: {
//		active: false,
//		str: 0,
//		rate: 0,
//		rot: 0,
//		rotOffset: 0
//	},
//	scale: {
//		active: false,
//		size: 0,
//		rate: 0
//	}
//}

//pointer = {
//	targetList: [],
//	target: noone,
//	targetX: 0,
//	x: 0,
//	size: 1,
//}

//wait = {
//	active: false,
//	timer: 0,
//}

//font.height = sprite_get_height(font.sprite) + 1;
//font.width = sprite_get_width(font.sprite);
//active = false;
//closing = false;
//sphere = {
//	active: false,
//	size: 1,
//}

//// The indexes of characters that should not be colored
//nonColorCharacters = [53, 54, 55, 56, 57];

//// The next button controls
//nextButton = {
//	rot: 0,
//	rotRate: 5,
//	lerpVal: 0,
//	size: 0,
//}


//defineAlphabetMap();

//function setPointerTargetX(x) {
//	pointer.targetX = clamp(x - global.vx, layout.pos.x + layout.margin, layout.pos.x + layout.width - layout.margin - 32);
//}
					  
//function translate(text) {	
//	var letterFrames = [];
	
//	// Split by words
//	var splitText = string_split(text, " ");
//	var count = array_length(splitText);
	
//	var position = 0;
//	var line = 0;
//	font.color = font.defaultColor;
//	font.quake = 0;
	
//	// Iterate through words
//	for (var i=0; i<count; i++) {
//		var word = splitText[i];
		
//		if (string_char_at(word, 1) = "[") {
//			extractEffect(word);
//		} else {
		
//			var wordLength = string_length(word);
		
//			// If position and wordlength accounting for font width is greater than max line length, then break
//			if ((position + wordLength) * font.width > layout.width) {
//				position = 0;
//				line++;
//				layout.lines++;
//			}
			
//			// Account for space if not at start of line
//			if (position != 0) {
//				word = " " + word;
//				wordLength++;
//			}
		
//			// Iterate over letters in word
//			for (var j=1; j<=wordLength; j++) {
//				var char = string_char_at(word, j);
//				var index = alphabetMap[? char];
			
//				// If letter is not a special character, create the character object and add to the list
//				if (index != undefined) {
//					var letterObject = {
//						index: index,
//						line: line,
//						position: position,
//						color: isNonColorCharacter(index) ? c_white : font.color,
//						quake: font.quake,
//						wave: font.wave.active,
//						scale: font.scale.active ? font.scale.size : 1
//					}
//					array_push(letterFrames, letterObject);
//					position++;
//				} else {
//					// Look for the character in the action character list
//					switch(char) {
//						// Line break symbol
//						case "↵":
//							position = 0;
//							line++;
//							layout.lines++;
//							break;
//					} // END of switch
//				} // END of special character check
//			} // END of word letter iteration
//		} // END of non-effect character translation
//	} // END of word iteration
//	return letterFrames;
//}

//// Some characters cannot be colored (like button prompts, image icons, etc)
//function isNonColorCharacter(index) {
//	return array_find(nonColorCharacters, index) = -1 ? false : true;	
//}

//function extractEffect(text) {
	
//	var extractedString = string_copy(text, 2, string_length(text)-2);
//	var values = string_split(extractedString, ",");	
//	var effect = values[0];
	
//	// Apply effect
//	switch(effect) {
//		// COLOR
//		case "color":
//			font.color = make_color_rgb(values[1], values[2], values[3]);
//			break;
//		case "defaultColor":
//			font.color = font.defaultColor;
//			break;
		
//		// QUAKE
//		case "quakeLow":
//			font.quake = 1;
//			break;
//		case "quakeHigh":
//			font.quake = 2;
//			break;
//		case "quakeOff":
//			font.quake = 0;
//			break;
		
//		// WAVE
//		case "waveSet":
//			font.wave.str = real(values[1]);
//			font.wave.rate = real(values[2]);
//			font.wave.rotOffset = real(values[3]);
//			break;
//		case "waveOn":
//			font.wave.active = true;
//			break;
//		case "waveOff":
//			font.wave.active = false;
//			break;
		
//		// SCALE
//		case "scale":
//			font.scale.active = true;
//			font.scale.size = real(values[1]);
//			font.scale.rate = real(values[2]);
//			break;			
//	}
//}

/////@description Advance to the next dialogue state
//function next() {
//	if (textPos < translatedLength) {
//		// Complete the text as it is being written
//		textPos = translatedLength;	
//		layout.height = calculateDialogHeight();
//	} else if (question.active) {
//		// Select the answer to a question
//		var selectedResponse = config[conversationPos].question[select];
//		question.active = false;
//		if (variable_struct_exists(selectedResponse, "followUpAction")) {
//			selectedResponse.followUpAction(selectedResponse.interviewQuestion, selectedResponse.pos);
//		}
//		setDialogArray(selectedResponse.answer);
//	} else if (interview.active) {
//		// Select the next interview conversation
//		var selectedAnswer = interview.list[select].answer;
//		if (!interview.list[select].fixed) {
//			array_delete(interview.list, select, 1);
//		}
//		// Execute an answer action if provided
//		//if (variable_struct_exists(selectedAnswer, "action")) {
//			//selectedAnswer.action();	
//		//}
		
//		setDialogArray(selectedAnswer);
//		checkIfInterviewOngoing();
//	} else if (conversationPos < conversationLength - 1) {
//		// Advance to the next text in a conversation
//		takeEndAction();
//		audio_play_sound(snd_dialog_next, 0, 0);
//		conversationPos++;
//		// Reset text writing
//		textPos = 0;
//		layout.lines = 0;

//		resetFont();
//		translateNext();
//		resetNextButton();
//	} else {
//		// Close conversation
//		close();
//	}
//}

/////@description Translates the current conversation string into indices
//function translateNext() {
//	wait.active = variable_struct_exists(config[conversationPos], "wait");
//	if (wait.active) {
//		wait.timer = seconds(config[conversationPos].wait);
//		close();	
//	} else {
//		takeAction();
//		translated = translate(textToTranslate[conversationPos]);
//		translatedLength = array_length(translated);
//		var newTarget = pointer.targetList[conversationPos];
//		if (newTarget != "hold") {
//			pointer.target = newTarget;
//		}
//		// Determine question status
//		question.active = variable_struct_exists(config[conversationPos], "question");
//		select = 0;
		
//		// Determine interview status
//		var hasInterview = variable_struct_exists(config[conversationPos], "interview");
//		if (hasInterview) {
//			interview.active = true;
//			interview.ongoing = true;
//			if (variable_struct_exists(config[conversationPos], "interviewTarget")) {
//				interview.target = config[conversationPos].interviewTarget;
//			}
//			array_copy(interview.list, 0, config[conversationPos].interview, 0, array_length(config[conversationPos].interview));
//		} else {
//			checkIfInterviewOngoing();
//		}
//	}
//}

/////@description Execute script at start of dialogue
//function takeAction() {
//	if variable_struct_exists(config[conversationPos], "action") {
//		config[conversationPos].action();
//	}	
//}

/////@description Execute script at end of dialogue
//function takeEndAction() {
//	if variable_struct_exists(config[conversationPos], "endAction") {
//		config[conversationPos].endAction();
//	}	
//}

/////@description Clears font config for fresh dialog box
//function resetFont() {
//	font.color = font.defaultColor;
//	font.height = sprite_get_height(font.sprite) + 1;
//	font.width = sprite_get_width(font.sprite);
//	font.quake = 0;
//	font.wave.active = false;
//	font.scale.active = false;
//}

/////@description Resets size of the next button
//function resetNextButton() {
//	nextButton.size = 0;
//	nextButton.lerpVal = 0;
//}

/////@description Calculates the height based on the numer of lines and the height of the font
//function calculateDialogHeight() {
//	return font.height * (1 + layout.lines);	
//}

/////@description Both set the text and determine the length of the conversation
//function setTextToTranslate(dialogArray) {
//	textToTranslate = dialogArray;
//	conversationLength = array_length(textToTranslate);
//}

/////@description Triggers closing just once
//function close() {
//	if (!closing) {
//		audio_play_sound(snd_dialog_close, 0, 0);
//		closing = true;
//		sphere.size = 1;
		
//		takeEndAction()
		
//		// If we have an interview target, send them the modified interview list to store (but not when waiting)
//		if (!wait.active && interview.target != null && instance_exists(interview.target)) {
//			interview.target.interviewComplete(interview.list);
//		}
//	}
//}

//function open(dialogArray, x = 0, y = 0, width = global.vw) {
//	// We save the dialog array passed in to use as a config for reference
//	array_copy(config, 0, dialogArray, 0, array_length(dialogArray));
	
//	// We want to extract the dialog target objects in an array that matches the dialog text
//	var dialogText = [];
//	pointer.size = 1;
//	pointer.targetList = [];
//	for (var i=0; i<array_length(dialogArray); i++) {
//		if (variable_struct_exists(dialogArray[i], "text")) {
//			// Save the text
//			array_push(dialogText, dialogArray[i].text);		
//			// Save the targets
//			if variable_struct_exists(dialogArray[i], "target") {
//				// Can be null, which clears the target
//				array_push(pointer.targetList, dialogArray[i].target);
//			} else {
//				// Maintains the target on whatever target was last
//				array_push(pointer.targetList, "hold");
//			}
//		} else {
//			// Fill space in the arrays that will not result in real text
//			array_push(dialogText, null);	
//			array_push(pointer.targetList, "hold");
//		}
//	}
//	setTextToTranslate(dialogText);
//	layout.pos.x = max(x, screenMargin + layout.margin);
//	layout.pos.y = max(y, screenMargin + layout.margin);
//	layout.lines = 0;
//	layout.width = min(width, global.vw - layout.pos.x - (layout.margin + screenMargin));
//	layout.savedWidth = layout.width;
//	sphere.active = false;
//	conversationPos = 0;
//	textPos = 0;
	
//	resetFont();
//	translateNext();
//	resetNextButton();
	
//	active = true;
//	closing = false;
//	audio_play_sound(snd_dialog_open, 0, 0);
//}

//function setDialogArray(dialogArray) {
//	pointer.targetList = [];
//	array_copy(config, 0, dialogArray, 0, array_length(dialogArray));
//	var dialogText = [];
//	for (var i=0; i<array_length(dialogArray); i++) {
//		var textValue = variable_struct_exists(dialogArray[i], "text") ? dialogArray[i].text : null;
//		array_push(dialogText, textValue);
//		if variable_struct_exists(dialogArray[i], "target") {
//			array_push(pointer.targetList, dialogArray[i].target);
//		} else {
//			array_push(pointer.targetList, "hold");
//		}
//	}
//	setTextToTranslate(dialogText);
//	conversationPos = 0;
//	layout.lines = 0;
//	sphere.active = false;
//	textPos = 0;
	
//	resetFont();
//	translateNext();
//	resetNextButton();
//}



