// Some characters cannot be colored (like button prompts, image icons, etc)
function isNonColorCharacter(index) {
	var _nonColorCharacters = [53, 54, 55, 56, 57];
	return array_find(_nonColorCharacters, index) = -1 ? false : true;	
}

//function InterviewQuestion(_text, _fixed) constructor {
//	text = _text; // The selection text
//	fixed = _fixed; // Whether question can be removed or not
//	answer = []; // Conversation array

//	for (var i=2; i<argument_count; i++) {
//		var arg = argument[i];
//		array_push(answer, arg);	
//	}
//	/*
//		Note: if an answer should end the interview, then set an "interviewEnd: true"
//		property at the end of that conversation stream. Otherwise it will return to
//		the interview root with that particular question removed.
		
//		If the end of an interview question should add a new question to the list, then
//	*/
//}

//function InterviewEnd(_text) : Text(_text) constructor {
//	interviewEnd = true;
//}

//function TextWait(_wait) constructor {
//	text = null;
//	wait = _wait;
//}

//function  Interview(_text) constructor {
//	text = _text;
//	interview = [];
	
//	for (var i=1; i<argument_count; i++) {
//		var arg = argument[i];
//		array_push(interview, arg);	
//	}
//}

/////@param {String} text
//function Answer(_text) constructor {
//	text = _text; // The selection text
//	answer = []; // Question array
	
//	for (var i=1; i<argument_count; i++) {
//		var arg = argument[i];
//		array_push(answer, arg);	
//	}
//}

/////@description An answer to a Question that adds an InterviewQuestion to an ongoing Interview once selected
/////@param {String} text The dialog text to select
/////@param {Struct.InterviewQuestion} interviewQuestion The InterviewQuestion to add to the existing Interview
/////@param {Real} pos The position of the question within the list
//function AnswerWithInterviewFollowup(_text, _interviewQuestion, _pos) constructor {
//	text = _text; // The selection text
//	answer = []; // Question array
	
//	interviewQuestion = _interviewQuestion;
//	pos = _pos;
	
//	followUpAction = function(_interviewQuestion, _pos) {
//		dialog_old.insertFollowUp(_interviewQuestion, _pos);
//	}
	
//	for (var i=3; i<argument_count; i++) {
//		var arg = argument[i];
//		array_push(answer, arg);	
//	}
//}

/////@description A question with multiple branching answers
/////@param {String} text The question to show
//function Question(_text) constructor {
//	text = _text;
//	question = [];
	
//	for (var i=1; i<argument_count; i++) {
//		var arg = argument[i];
//		array_push(question, arg);	
//	}
//}

/////@description Basic dialog system text
/////@param {String} text
/////@param {Asset.GMObject} target
//function Text(_text, _target = noone) constructor {
//	text = _text;	
//	target = _target;
//}

/////@description Basic dialog system text
/////@param {String} text
/////@param {Function} action
/////@param {Asset.GMObject} target
//function ActionText(_text, _action, _target = noone) constructor {
//	text = _text;	
//	target = _target;
//	action = _action;
//}
