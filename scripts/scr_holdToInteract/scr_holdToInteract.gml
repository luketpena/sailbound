enum GpFaceButton {
	A,
	B,
	X,
	Y
}

// Either watch for triggered outside, or pass in a callback
function HoldToInteract(
	_GpFaceButton,
	_inputGroup,
	_inputName,
	_callback = undefined
) constructor {
	var _buttonList = [gp_face1, gp_face2, gp_face3, gp_face4];
	inputButton = _buttonList[_GpFaceButton];
	buttonImageIndex = _GpFaceButton;
	progress = 0;
	triggered = false;
	locked = false;
	held = false;
	callback = _callback;
	active = true;
	progressPerFrame = 1 / 16;
	inputGroup = _inputGroup;
	inputName = _inputName;
	
	
	function step() {
		if (!active) exit;
		triggered = false;
		
		var _inputGroup = variable_instance_get(input, inputGroup);
		var _isPressed = _inputGroup[$ inputName].held;
		if (_isPressed) {
			if (!locked) {
				if (progress < 1) progress += progressPerFrame else if (!held) {
					triggered = true;
					held = true;
					locked = true;
					if (!is_undefined(callback)) callback();
				}
			}
		}
		
		if (!_isPressed || locked) {
			held = false;
			progress = 0;
		}
		
		if (!_isPressed && progress = 0) locked = false;
	}
	
	function draw(_x, _y, _alpha = 1) {
		draw_sprite_ext(s_ui_gpButton_face_xbox, buttonImageIndex, _x, _y, 1, 1, 0, c_white, _alpha);
		if (progress > 0) {
			draw_sprite_ext(s_ui_holdToInteract_outline, progress * 16, _x, _y, 1, 1, 0, c_white, _alpha);	
		}
	}
	
}