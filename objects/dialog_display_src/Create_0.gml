defineAlphabetMap();

reader = noone;
active = false;
closing = false;
layout = {
	pos: {
		x: 16,
		y: 16
	},
	savedWidth: 128,
	width: 128,
	height: 0,
	lines: 0,
	margin: 8
}

reader_text = "";
textToTranslate = [];
translated = [];
translatedLength = 0;

textPos = 0; //The position of the text writing
conversationPos = 0;
conversationLength = 0;


screenMargin = 8;

config = [];

font = {
	color: c_black,	
	defaultColor: c_black,
	sprite: s_font_textbox,
	height: 0,
	width: 0,
	quake: 0,
	wave: {
		active: false,
		str: 0,
		rate: 0,
		rot: 0,
		rotOffset: 0
	},
	scale: {
		active: false,
		size: 0,
		rate: 0
	}
}
font.height = sprite_get_height(font.sprite) + 1;
font.width = sprite_get_width(font.sprite);

pointer = {
	targetList: [],
	target: noone,
	targetX: 0,
	x: 0,
	size: 1,
}

sphere = {
	active: false,
	size: 1,
}

// The indexes of characters that should not be colored
nonColorCharacters = [53, 54, 55, 56, 57];

// The next button controls
nextButton = {
	rot: 0,
	rotRate: 5,
	lerpVal: 0,
	size: 0,
}


function setPointerTargetX(x) {
	pointer.targetX = clamp(x - global.vx, layout.pos.x + layout.margin, layout.pos.x + layout.width - layout.margin - 32);
}
					  
function translate(_text) {	
	var _letterFrames = [];
	
	// Split by words
	var _splitText = string_split(_text, " ");
	var _count = array_length(_splitText);
	
	var _position = 0;
	var _line = 0;
	font.color = font.defaultColor;
	font.quake = 0;
	
	// Iterate through words
	for (var i=0; i<_count; i++) {
		var _word = _splitText[i];
		
		if (string_char_at(_word, 1) = "[") {
			extractEffect(_word);
		} else {
		
			var _wordLength = string_length(_word);
		
			// If position and wordlength accounting for font width is greater than max line length, then break
			if ((_position + _wordLength) * font.width > layout.width) {
				_position = 0;
				_line++;
				layout.lines++;
			}
			
			// Account for space if not at start of line
			if (position != 0) {
				word = " " + word;
				wordLength++;
			}
		
			// Iterate over letters in word
			for (var j=1; j<=wordLength; j++) {
				var char = string_char_at(word, j);
				var index = alphabetMap[? char];
			
				// If letter is not a special character, create the character object and add to the list
				if (index != undefined) {
					var letterObject = {
						index: index,
						line: _line,
						position: _position,
						color: isNonColorCharacter(index) ? c_white : font.color,
						quake: font.quake,
						wave: font.wave.active,
						scale: font.scale.active ? font.scale.size : 1
					}
					array_push(_letterFrames, letterObject);
					_position++;
				} else {
					// Look for the character in the action character list
					switch(char) {
						// Line break symbol
						case "↵":
							_position = 0;
							_line++;
							layout.lines++;
							break;
					} // END of switch
				} // END of special character check
			} // END of word letter iteration
		} // END of non-effect character translation
	} // END of word iteration
	return letterFrames;
}

// Some characters cannot be colored (like button prompts, image icons, etc)
function isNonColorCharacter(index) {
	return array_find(nonColorCharacters, index) = -1 ? false : true;	
}

function extractEffect(text) {
	
	var extractedString = string_copy(text, 2, string_length(text)-2);
	var values = string_split(extractedString, ",");	
	var effect = values[0];
	
	// Apply effect
	switch(effect) {
		// COLOR
		case "color":
			font.color = make_color_rgb(values[1], values[2], values[3]);
			break;
		case "defaultColor":
			font.color = font.defaultColor;
			break;
		
		// QUAKE
		case "quakeLow":
			font.quake = 1;
			break;
		case "quakeHigh":
			font.quake = 2;
			break;
		case "quakeOff":
			font.quake = 0;
			break;
		
		// WAVE
		case "waveSet":
			font.wave.str = real(values[1]);
			font.wave.rate = real(values[2]);
			font.wave.rotOffset = real(values[3]);
			break;
		case "waveOn":
			font.wave.active = true;
			break;
		case "waveOff":
			font.wave.active = false;
			break;
		
		// SCALE
		case "scale":
			font.scale.active = true;
			font.scale.size = real(values[1]);
			font.scale.rate = real(values[2]);
			break;			
	}
}


///@description Translates the current conversation string into indices
function translate_next() {
	if (reader_text != dialog_reader.text) {
		reader_text = dialog_reader.text;
		translated = translate(reader_text);
		translatedLength = array_length(translated);
	}
}

///@description Clears font config for fresh dialog box
function resetFont() {
	font.color = font.defaultColor;
	font.height = sprite_get_height(font.sprite) + 1;
	font.width = sprite_get_width(font.sprite);
	font.quake = 0;
	font.wave.active = false;
	font.scale.active = false;
}

///@description Resets size of the next button
function resetNextButton() {
	nextButton.size = 0;
	nextButton.lerpVal = 0;
}

///@description Calculates the height based on the numer of lines and the height of the font
function calculateDialogHeight() {
	return font.height * (1 + layout.lines);	
}

///@description Both set the text and determine the length of the conversation
function setTextToTranslate(dialogArray) {
	textToTranslate = dialogArray;
	conversationLength = array_length(textToTranslate);
}

///@description Triggers closing just once
function close() {
	if (!closing) {
		audio_play_sound(snd_dialog_close, 0, 0);
		closing = true;
		sphere.size = 1;
				
		// If we have an interview target, send them the modified interview list to store (but not when waiting)
		if (!wait.active && interview.target != null && instance_exists(interview.target)) {
			interview.target.interviewComplete(interview.list);
		}
	}
}

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


