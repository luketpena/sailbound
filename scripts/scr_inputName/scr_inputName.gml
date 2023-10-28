// Takes an input number and gives the name of that key
function input_getName(_input) {
	switch(_input) {
		case vk_escape: return "Escape";
		case vk_backspace: return "Backspace";
		case vk_enter: return "Enter";
		case vk_space: return "Spacebar";

		// Numpad
		case vk_numpad0: return "Num0";
		case vk_numpad1: return "Num1";
		case vk_numpad2: return "Num2";
		case vk_numpad3: return "Num3";
		case vk_numpad4: return "Num4";
		case vk_numpad5: return "Num5";
		case vk_numpad6: return "Num6";
		case vk_numpad7: return "Num7";
		case vk_numpad8: return "Num8";
		case vk_numpad9: return "Num9";
		
		// Control
		case vk_control: return "Control";
		case vk_lcontrol: return "L.Control";
		case vk_rcontrol: return "R.Control";
		
		// Alt
		case vk_alt: return "Alt";
		case vk_lalt: return "L.Alt";
		case vk_ralt: return "R.Alt";
		
		// Shift
		case vk_shift: return "Shift";
		case vk_lshift: return "L.Shift";
		case vk_rshift: return "R.Shift";
		
		// Top actions
		case vk_printscreen: return "Print screen";
		case vk_pause: return "Pause";
		
		// Center actions
		case vk_insert: return "Insert";
		case vk_home: return "Home";
		case vk_pageup: return "Page up";
		case vk_pagedown: return "Page down";
		case vk_delete: return "Delete";
		case vk_end: return "End";
		
		
		// Numeric
		case vk_add: return "+";
		case vk_decimal: return ".";
		case vk_divide: return "/";
		case vk_multiply: return "*";
		
		// Arrows
		case vk_up: return "Up";
		case vk_down: return "Down";
		case vk_left: return "Left";
		case vk_right: return "Right";
		
		// Numbers
		case ord("0"): return "0";
		case ord("1"): return "1";
		case ord("2"): return "2";
		case ord("3"): return "3";
		case ord("4"): return "4";
		case ord("5"): return "5";
		case ord("6"): return "6";
		case ord("7"): return "7";
		case ord("8"): return "8";
		case ord("9"): return "9";
		
		// Letters
		case ord("A"): return "A";
		case ord("B"): return "B";
		case ord("C"): return "C";
		case ord("D"): return "D";
		case ord("E"): return "E";
		case ord("F"): return "F";
		case ord("G"): return "G";
		case ord("H"): return "H";
		case ord("I"): return "I";
		case ord("J"): return "J";
		case ord("K"): return "K";
		case ord("L"): return "L";
		case ord("M"): return "M";
		case ord("N"): return "N";
		case ord("O"): return "O";
		case ord("P"): return "P";
		case ord("Q"): return "Q";
		case ord("R"): return "R";
		case ord("S"): return "S";
		case ord("T"): return "T";
		case ord("U"): return "U";
		case ord("V"): return "V";
		case ord("W"): return "W";
		case ord("X"): return "X";
		case ord("Y"): return "Y";
		case ord("Z"): return "Z";
	}
}