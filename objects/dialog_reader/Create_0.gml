active = false;
dialog = {};
node_id = "start";
node = variable_struct_get(dialog, node_id);
text = ""; // For reading from the display

text_pos = 0; // Handles when text is an array

response_select = 0; // Which response are you choosing
response_active = false; // Are we currently in a response choosing mode?
response_ids = []; // The array of response node ids
response_text = []; // An array of response text

function node_set(_id) {
	node_id = _id;
	node = variable_struct_get(dialog, node_id);
	text = node_get_text(_id);
	
	// Activating other nodes
	if (variable_struct_exists(node, "activate_node")) {
		var _activate_id = variable_struct_get(node, "activate_node");
		node_set_active(_activate_id, true);
	}
	
	// Deactivating other nodes
	if (variable_struct_exists(node, "deactivate_node")) {
		var _deactivate_id = variable_struct_get(node, "deactivate_node");
		node_set_active(_deactivate_id, false);
	}
	
	// Deactivate self
	if (variable_struct_exists(node, "deactivate_self")) {
		node_set_active(node_id, false);
	}
		
	// Setting responses
	response_active = variable_struct_exists(node, "responses");
	response_ids = [];
	response_text = [];
	if (response_active) {
		response_select = 0;
		var _node_responses = variable_struct_get(node, "responses");

		for (var i=0; i<array_length(_node_responses); i++) {
			var _response_id = _node_responses[i];
			if (node_get_active(_response_id)) {
				array_push(response_ids, _response_id);	
				array_push(response_text, get_node(_response_id).response_text);
			}
		}
	}
	
	// Deactivate dialog if node has no text OR if it has response array, but none are active
	if (!variable_struct_exists(node, "text") || (response_active && array_length(response_ids) == 0)) {
		active = false;
	}
}

function start_dialog(_dialog) {
	dialog = _dialog;
	active = true;
	text_pos = 0;
	node_set("start");
	log(node);
}

function response_next() {
	response_select = (response_select + 1) mod array_length(response_ids);
}

function response_previous() {
	response_select -= 1;
	if (response_select < 0) {
		response_select = array_length(response_ids) - 1;	
	}
}

function node_next() {
	// Goes to next array text and quits (if array)
	if (is_array(node.text)) {
		if (text_pos < array_length(node.text) - 1) {
			text_pos += 1;
			text = node.text[text_pos];
			exit;
		} else {
			text_pos = 0;	
		}
	}
	
	// Execute exit actions
	if (variable_struct_exists(node, "action_exit")) {
		node.action_exit();	
	}
	
	if (response_active) {
		// Selecting a response
		node_set(response_ids[response_select]);
		
	} else {
		// Going next in an array of nodes
		if (variable_struct_exists(node, "next")) {
			var _next = variable_struct_get(node, "next");
			node_set(_next);
		} else {
			active = false;	
		}
	}
	
	// Execute entry actions
	if (variable_struct_exists(node, "action_enter")) {
		node.action_enter();	
	}
}

function get_node(_id) {
	return variable_struct_get(dialog, _id);	
}

function node_get_active(_id) {
	var _node = get_node(_id);
	var _active = (!variable_struct_exists(_node, "active") || variable_struct_get(_node, "active") = true);
	return _active
}

function node_get_text(_id) {
	var _node = get_node(_id);
	var _text = variable_struct_get(_node, "text");
	if (is_array(_text)) {
		return _text[text_pos];	
	} else {
		return _text;	
	}
}

function node_get_response_text(_id) {
	var _node = get_node(_id);
	return variable_struct_get(_node, "response_text");
}

function node_get_next(_id) {
	var _node = get_node(_id);
	return variable_struct_get(_node, "next");
}

function node_set_active(_id, _active) {
	var _node = get_node(_id);
	variable_struct_set(_node, "active", _active);
}