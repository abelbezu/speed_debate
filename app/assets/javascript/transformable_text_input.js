var TransformableTextInput = function(main_element_id, add_on_id){
	this.main_element  = $("#"+main_element_id);
	this.add_on = $("#"+add_on_id);

	/*removes a css style and applies a new one to the main_element, also reveals the hidden add_on
	@param String style_to_remove - a css style class name, to be removed from the main_element.
	@param String style_to_add - a css style class name to be added to the main_element.
	*/
	
	this.hide_add_on = function(){
		this.add_on.addClass("hidden");
	}
	this.show_add_on = function(){
		this.add_on.removeClass("hidden");
	}
	this.transform = function(style_to_remove, style_to_add)
	{
		this.main_element.removeClass(style_to_remove);	
		this.main_element.addClass(style_to_add);
		
		
	}

	/*transforms on focus
	@param String style_to_remove - a css style class name, to be removed from the main_element.
	@param String style_to_add - a css style class name to be added to the main_element.
	*/
	this.transform_on_focus = function(style_to_remove, style_to_add){
		_this = this;
		this.main_element.focus(function(){
		_this.transform(style_to_remove, style_to_add);
		_this.show_add_on();
		});
	}

	this.transform_on_click = function(style_to_remove, style_to_add){
		_this = this;
		this.main_element.focus(function(){
		_this.transform(style_to_remove, style_to_add);
		_this.show_add_on();
		});
	}

	/*transforms on focusout
	@param String style_to_remove - a css style class name, to be removed from the main_element.
	@param String style_to_add - a css style class name to be added to the main_element.
	*/
	this.transform_on_focus_out = function(style_to_remove, style_to_add){
		_this = this;
		this.main_element.focusout(function(){
		_this.transform(style_to_remove, style_to_add);
		_this.hide_add_on();
		});
	}

	this.transformable = function(style_to_remove, style_to_add){
		this.transform_on_focus(style_to_remove, style_to_add);
		this.transform_on_focus_out(style_to_add, style_to_remove);

	}
}