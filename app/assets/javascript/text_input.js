var TextInput = function(element_id){
	this.element = $('#'+element_id);

	/*makes the text input submitable by clicking enter */
	this.enter_submitable = function(form_id, submit_button_id, reply_container ,time_box, smoothness){
		_this = this;
		this.element.keypress(function(e){
			if(e.which == 13){
				e.preventDefault();
				$("#"+form_id).submit();
				console.log("submitted");
				_this.push_up(submit_button_id, reply_container ,time_box, smoothness)
			}
		});
	};

	/* push the message up*/
	this.push_up = function(submit_button_id, reply_container ,time_box, smoothness)
	{
		$("#"+submit_button_id).remove();
		var input_text  = this.element.val();
		this.element.remove();
		$("#"+reply_container).text(input_text);
		console.log($("#"+reply_container));
		$("#"+reply_container).text(input_text);
	}
	

}