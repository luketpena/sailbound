// Setup
active = false;
defineAlphabetMap();
text = ""; // What it targets for translation (only used to track changes)
text_translated = []; // Post translation
translated_length = [];
closing = false;
textPos = 0;

// Stores the settings for currently written text (imprints on characters written ahead of it)
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
// Recording the dimensions of individual characters (depending on sprite being used)
font.height = sprite_get_height(font.sprite) + 1;
font.width = sprite_get_width(font.sprite);

// Stores the data around the placement and size of the textbox
screenMargin = 8;
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
layout.width = min(global.vw, global.vw - layout.pos.x - (layout.margin + screenMargin));
layout.savedWidth = layout.width;

// Points at who is "talking"
pointer = {
	targetList: [],
	target: noone,
	targetX: 0,
	x: 0,
	size: 1,
}

// Manages the final display of the textbox as it closes
sphere = {
	active: false,
	size: 1,
}

nextButton = {
	rot: 0,
	rotRate: 5,
	lerpVal: 0,
	size: 0,
	reset: function() {
		lerpVal = 0;
		size = 0;
	}
}

// Translates text from strings to an alphabet map, including FX
function translate(_text) {	
	var _letterFrames = [];
	
	// Split by words
	var _splitText = string_split(_text, " ");
	var _count = array_length(_splitText);
	
	// For processing
	var _position = 0;
	var _line = 0;
	
	// Resetting values before translation
	font.color = font.defaultColor;
	font.quake = 0;
	layout.lines = 0;
	
	// Iterate through words
	for (var i=0; i<_count; i++) {
		var _word = _splitText[i];
		
		if (string_char_at(_word, 1) = "[") {
			// Saves the effect values to the "text" struct for reading by future characters
			extract_text_effect(_word);
		} else {
			var _wordLength = string_length(_word);
		
			// If position and wordlength accounting for font width is greater than max line length, then break
			if ((_position + _wordLength) * font.width > layout.width) {
				_position = 0;
				_line++;
				layout.lines++;
			}
			
			// Account for space if not at start of line
			if (_position != 0) {
				_word = " " + _word;
				_wordLength++;
			}
		
			// Iterate over letters in word
			for (var j = 1; j <= _wordLength; j++) {
				var _char = string_char_at(_word, j);
				var _map_index = alphabetMap[? _char];
			
				// If letter is not a special character, create the character object and add to the list
				if (!is_undefined(_map_index)) {
					var _letter = {
						index: _map_index,
						line: _line,
						position: _position,
						color: isNonColorCharacter(_map_index) ? c_white : font.color,
						quake: font.quake,
						wave: font.wave.active,
						scale: font.scale.active ? font.scale.size : 1
					}
					array_push(_letterFrames, _letter);
					_position++;
				} else {
					// Look for the character in the action character list
					switch(_char) {
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
	return _letterFrames;
}

function extract_text_effect(_effect_string) {
	
	// Removing the brackets
	var _extracted_string = string_copy(_effect_string, 2, string_length(_effect_string) - 2);
	// Retrieving the comma separated values for the effect
	var _values = string_split(_extracted_string, ",");	
	var _effect_name = _values[0];
	
	// Apply effect
	switch(_effect_name) {
		// COLOR
		case "color":
			font.color = make_color_rgb(_values[1], _values[2], _values[3]);
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

function calculateDialogHeight() {
	return font.height * (1 + layout.lines);	
}

function close() {
	if (!closing) {
		audio_play_sound(snd_dialog_close, 0, 0);
		closing = true;
		sphere.size = 1;
	}
}
