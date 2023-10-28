function InputRowItem(
	_actionText,
	_inputGroup,
	_inputName,
) constructor {
	actionText = _actionText;
	inputGroup = _inputGroup;
	inputName = _inputName;
	
	function getText() {
		var _inputGroup = variable_instance_get(input, inputGroup);
		var _key = _inputGroup[$ inputName].key;
		return $"{actionText} ({string_lower(input_getName(_key))})";	
	}
}