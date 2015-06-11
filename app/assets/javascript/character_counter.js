/*
* Represents a character counter for the post creators.
* Abstraction {element, character_limit} --> CharacterCounter
*/
var CharacterCounter = function(element_id, message_area_id, character_limit) {
	this.element = $("#" + element_id);
	this.character_limit = character_limit;
	this.message_area = $("#"+message_area_id);
	this.approaching_toggled = false;
	this.exceeded_toggled = false;
	this.glow_interval = null;
	/*
	* keeps track of the number of characters used sofar. Triggers the appropiriate warnings wwhen certain points are passed, starts warning when there are less characters left than characters_left, starts exceed warning when number of characters is greater than charcter_limit
	*/
	this.track = function(characters_left){

		var _this = this
		this.element.bind('input propertychange', function() {

        if(this.value.length > character_limit - characters_left && !_this.approaching_toggled){
        	_this.warn_approaching();
      	}
      	else if (this.value.length > character_limit && !_this.exceeded_toggled){
      		_this.warn_exceeded();
      	}
      	else if (this.value.length < (character_limit - characters_left))
      	{
      		clearInterval(_this.glow_interval);
      		_this.approaching_toggled = false;
      		_this.exceeded_toggled = false;
      	}

	});
	};

	/**
	* Warns the user that the character limit is approaching.
	*/
	this.notify_approaching = function(msg){
		this.message_area.html("");
		this.message_area.addClass("warning_division")
		this.message_area.html(msg)

	}
	/**
	* Warns the user that the character limit is approaching.
	*/
	this.notify_exceeded = function(msg){
		this.message_area.html("");
		this.message_area.addClass("warning_division")
		this.message_area.html(msg)

	}

	/**
	* Warns the user that the character limit is approaching.
	*/
	this.warn_approaching = function(msg){
		clearInterval(this.glow_interval);
		this.glow(1, "yellow");
		this.approaching_toggled = true;
		this.message_area.text(msg)

	}

	this.warn_exceeded = function(msg){
		clearInterval(this.glow_interval);
		this.glow(1, "red");
		this.exceeded_toggled = true;
		this.message_area.text(msg)
		
	}


	/* 
	* Makes the element glow at the given frequency in the given color
	*
	*/
	this.glow = function(frequency, color){
	var glower = this.element;
	this.glow_interval = setInterval(function() {  
		glower.toggleClass('glow_' + color);
	}, 1000/frequency);
	}

	this.notifiable = function(characters_left, approaching_msg, exceeded_msg){

		var _this = this
		this.element.bind('input propertychange', function() {

        if(this.value.length > character_limit - characters_left && !_this.approaching_toggled){
        	_this.notify_approaching(approaching_msg);
      	}
      	if (this.value.length > character_limit && !_this.exceeded_toggled){
      		_this.notify_exceeded(exceeded_msg);
      	}
      	else if (this.value.length < (character_limit - characters_left))
      	{
      		_this.message_area.removeClass("warning_division");
      		_this.message_area.html("");
      		_this.approaching_toggled = false;
      		_this.exceeded_toggled = false;
      	}

	});
	}
}

