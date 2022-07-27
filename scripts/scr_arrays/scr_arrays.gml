function array_shuffle(array) {
	var new_array = [];
	var old_array = array;
	var array_count = array_length(old_array);
	
	do {
		//Choose a random spot in the old array
		var selection = irandom(array_count-1);
		//Add that value to the new array
		new_array[array_length(new_array)] = old_array[selection];
		//And remove the selected value from the old array
		var offset = 0;
		var replace_array = [];
		for (var i=0; i<array_count; i++) {
			if (i=selection) offset = 1 else {
				replace_array[i-offset] = old_array[i];
			}
		}
		old_array = replace_array;
		array_count = array_length(old_array);
	} until (array_count=0);
	
	return new_array;
}

function array_shift(a, value) {
	var new_array = [value];
	for (var i=1; i<array_length(a)+1; i++) {
		new_array[i] = a[i-1];	
	}
	return new_array;
}

function array_unshift(a) {
	var new_array = [];	
	array_copy(new_array,0,a,1,array_length(a)-1);
	return {
		array: new_array,
		value: a[0]
	}
}

function array_pop(a) {
	var new_array = [];
	var index = array_length(a)-1;
	array_copy(new_array, 0, a, 0, index);
	return {
		array: new_array,
		value: a[index]
	}
}

function array_find(a, value) {
	for (var i=0; i<array_length(a); i++) {
		if (a[i] = value) return i;	
	}
	return -1;
}

function array_includes(a, value) {
	for (var i=0; i<array_length(a); i++) {
		if (a[i] = value) return true;	
	}
	return false;
}

function array_concat(a1, a2) {
	var new_array = a1;
	var offset = array_length(a1);
	for (var i=0; i<array_length(a2); i++) {
		new_array[offset+i] = a2[i];
	}
	return new_array;
}

function array_join(a, joinString) {
	var length = array_length(a);
	if (length > 1) {
		var text = a[0];
		for (var i=1; i<length; i++) {
			text += joinString + a[i];
		}
		return text;
	} else {
		return a[0];	
	}
}

function array_extract(a, index) {
	if (index < 0 || index > array_length(a)-1) {
		return {
			array: a,
			value: noone
		}
	}
	
	var new_array = [];
	var offset = 0;
	for (var i=0; i<array_length(a); i++) {
		if (i=index) offset = 1 else new_array[i-offset] = a[i];
	}
	return {
		array: new_array,
		value: a[index]
	}
}

// Just removes the index and returns the array transformed
function array_pluck(a, index) {
	var extracted = array_extract(a, index);
	log("before " + string(array_length(a)));
	log("after " + string(array_length(extracted.array)));
	return extracted.array;
}


function array_reverse(a) {
	var new_array = [];
	var l = array_length(a)-1;
	for (var i=0; i<=l; i++) {
		new_array[l-i] = a[i];
	}
	return new_array;
}