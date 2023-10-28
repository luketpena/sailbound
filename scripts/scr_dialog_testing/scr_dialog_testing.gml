function get_test_dialog() {
	return {
		"start": {
			text: ["this is the first dialog text", "the second pre-dialog", "the final dialog to see"],
			next: "question-1"
		},
		"question-1": {
			text: "this is a question. it should have an array of dialog options",
			responses: ["response-1", "response-2", "followup", "response-3"],
			action_exit: function() {
				log("I asked a question");	
			}
		},
		// Response 1
		"response-1": {
			response_text: "only once",
			text: "we should see this once once and then it removes itself from the questions after looping back",
			next: "question-1",
			deactivate_self: true,
			activate_node: "followup",
		},
		// Response 2
		"response-2": {
			response_text: "action response to make something happen",
			text: "i logged something to the console",
			next: "question-1",
			action_enter: function() {
				log("Made you look.");	
			}
		},
		// Follow-up
		"followup": {
			active: true,
			response_text: "can responses be array texts?",
			text: ["absolutely! this should be really long to demonstrate a long text wrapping dialog. hopefully the outer border will resize gracefully to match the height of this dialog.", "check this out!", "working perfectly the first time, so cool"],
			next: "question-1",
			action_enter: function() {
				log("The followup has happened");	
			}
		},
		// Response 3
		"response-3": {
			response_text: "goodbye"
		}
	}
}