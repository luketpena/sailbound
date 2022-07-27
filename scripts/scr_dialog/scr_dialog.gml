function InterviewQuestion(_text, _answer, _fixed = false) constructor {
	text = _text; // The selection text
	answer = _answer; // Conversation array
	fixed = _fixed; // Whether question can be removed or not
	/*
		Note: if an answer should end the interview, then set an "interviewEnd: true"
		property at the end of that conversation stream. Otherwise it will return to
		the interview root with that particular question removed.
		
		If the end of an interview question should add a new question to the list, then
	*/
}

function TextWait(_wait) constructor {
	text = null;
	wait = _wait;
}

function  Interview(_text) constructor {
	text = _text;
	interview = [];
	for (var i=1; i<argument_count; i++) {
		var arg = argument[i];
		array_push(interview, arg);	
	}
}

function Answer(_text) constructor {
	text = _text; // The selection text
	answer = []; // Question array
	
	for (var i=1; i<argument_count; i++) {
		var arg = argument[i];
		array_push(answer, arg);	
	}
}

function Question(_text) constructor {
	text = _text;
	question = [];
	
	for (var i=1; i<argument_count; i++) {
		var arg = argument[i];
		array_push(question, arg);	
	}
}

function Text(_text) constructor {
	text = _text;	
}
