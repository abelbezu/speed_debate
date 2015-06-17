/*A data type representing radio buttons
Abstraction {list of choices, radio button element} -> radio button
 */
var RadioButton = function(element_1, element_2, checked_class, unchecked_class){
	this.element_1 = $("#"+element_1);
	this.element_2 = $("#"+element_2);
	_this_radio_button = this;
	this.element_1.click(function(){
			_this_radio_button.uncheck(_this.element_1);
			_this_radio_button.check(_this.element_1);
			_this_radio_button.uncheck(_this.element_2)
	});	
	this.element_2.click(function(){	
			

			_this_radio_button.uncheck(_this.element_2);
			_this_radio_button.check(_this.element_2);
			_this_radio_button.uncheck(_this.element_1)
		
	});
	
	this.check = function(element){
		element.attr("picked", "true");
		element.find(".choice_label").removeClass(unchecked_class);
		element.find(".choice_label").addClass(checked_class);
	}
	this.uncheck = function(element){
		element.attr("picked", "false");
		element.find(".choice_label").removeClass(checked_class);
		element.find(".choice_label").addClass(unchecked_class);
	}

}
/*choices list should be javascript objects*/
var RadioList = function(choices_list, checked_class, unchecked_class){
	_this_radio_list = this;
	$(choices_list).click(function(){
		_this_radio_list.check($(this));
		_to_check = this;
		choices_list.forEach(function(entry){
			if(entry == _to_check)
			{
				console.log("found the element");
			}
			else
			{
				_this_radio_list.uncheck($(entry));
			}
		});	
	});
	this.check = function(element){
		element.attr("picked", "true");
		$("#join_as_debater").attr("data-toggle","modal");
		$("#invite_a_friend_button").attr("data-toggle","modal");
		element.find(".choice_label").removeClass(unchecked_class);
		element.find(".choice_label").addClass(checked_class);
	}
	this.uncheck = function(element){
		element.attr("picked", "false");
		element.find(".choice_label").removeClass(checked_class);
		element.find(".choice_label").addClass(unchecked_class);
	}


}