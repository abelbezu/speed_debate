/*
gives different properties for text inputs.
*/
var TextInput = function(element_id){
	this.element = $('#'+element_id);

	/*makes the text input submitable by clicking enter */
	this.enterable = function(form_id){
		this.element.keypress(function(e){
			if(e.which == 13){
				e.preventDefault();
				$("#"+form_id).submit();
			}
		});
	};
}