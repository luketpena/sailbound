enum InputType {
	GAMEPAD,
	KEYBOARD,
	MOBILE
}

enum GamepadInputType {
	BUTTON,
	AXIS
}

///@description Defines an input group
///@param {Array} inputs
///@returns {Struct}
function input_group_create(
	_inputs
)  {
	var _group = {};
	for (var i=0; i<array_length(_inputs); i++) {
		var _input = _inputs[i];
		variable_struct_set(_group, _input.name, _input);
	}
	return _group;
}

///@param {Struct} group
function input_group_listen(_group) {
	struct_foreach(_group, function(_name, _input) {
		_input.listen();
	});
}

function InputButton(
	_name,
	_key,
	_gp
) constructor {
	name = _name;
	key = _key;
	gp = _gp;

	pressed = false;
	released = false;
	held = false;
		
	function listen() {
		clear();
		
		var _lastState = held;
		
		// Active
		var _held_gp = gamepad_button_check(0, gp);
		var _held_key = keyboard_check(key);
		held = _held_gp || _held_key;
		
		if (held != _lastState) {
			pressed = held;
			released = !held;
		}
		
		// Handling input mode changes
		if (_held_key) {
			input.setInputType(InputType.KEYBOARD);	
		} else if (_held_gp) {
			input.setInputType(InputType.GAMEPAD);	
		}
	}
	
	function remap_key(_remap) {
		key = _remap;	
	}
	
	function remap_gp(_remap) {
		gp = _remap;	
	}
	
	function clear() {
		pressed = false;
		released = false;
	}
}


function InputAxis(
	_name,
	_keyNegative,
	_keyPositive,
	_gp,
	_gpNegative = undefined,
	_gpPositive = undefined
) constructor {
	name = _name;
	keyPositive = _keyPositive;
	keyNegative = _keyNegative;
	gpNegative = _gpNegative;
	gpPositive = _gpPositive
	gp = _gp;
	
	value = 0;
	
	clickNegative = false;
	clickPositive = false;
	
	releaseNegative = false;
	releasePositive = false;
	
	clickLockNegative = false;
	clickLockPositive = false;
	
	clickListenThreshold = .8;
	clickClearThreshold = .3;
	
	function listen() {
		clear();
		
		var _gpAxisValue = gamepad_axis_value(0, gp);
		var _keyNegative = keyboard_check(keyNegative);
		var _keyPositive = keyboard_check(keyPositive);
		var _gpNegative = (gpNegative = undefined) ? false : gamepad_button_check(0, gpNegative);
		var _gpPositive = (gpPositive = undefined) ? false : gamepad_button_check(0, gpPositive);
		
		if (_keyNegative || _keyPositive) {
			// Set value from keyboard press
			value = (_keyNegative && _keyPositive) ? 0 : (_keyNegative ? -1 : 1);	
			input.setInputType(InputType.KEYBOARD);
		} else if (_gpNegative || _gpPositive) {
			// Set value from gamepad button press
			value = (_gpNegative && _gpPositive) ? 0 : (_gpNegative ? -1 : 1);
			input.setInputType(InputType.GAMEPAD);
		} else if (abs(_gpAxisValue) > 0) {
			// Set value from gamepad axis tilt
			value = _gpAxisValue;
			input.setInputType(InputType.GAMEPAD);
		}
				
		// Using value to activate clicks and releases
		if (!clickLockPositive && value > clickListenThreshold) {
			clickLockPositive = true;
			clickPositive = true;
		} else if (clickLockPositive && value <= clickClearThreshold) {
			clickLockPositive = false;
			releasePositive = true;
		}
		
		if (!clickLockNegative && value < -clickListenThreshold) {
			clickLockNegative = true;
			clickNegative = true;
		} else if (clickLockNegative && value >= -clickClearThreshold) {
			clickLockNegative = false;
			releaseNegative = true;
		}
	}
	
	function clear() {
		value = 0;
		clickNegative = false;
		clickPositive = false;
	
		releaseNegative = false;
		releasePositive = false;
	
	}
	
	function remap_negative(_remap) {
		keyNegative = _remap;
	}
	
	function remap_positive(_remap) {
		keyPositive = _remap;
	}
}