var NotificationBox = function(element_id, from_right, from_top){
	this.element = $("#"+element_id);
	
	
	
	

	this.notify = function(delay, wait_for, notification_box_message)
	{
		this.element.css('position', 'fixed');
		this.element.css('top', (50+from_top)); //or wherever you want it
		this.element.css('left', ($(window).width() - 400 -from_right));
		this.element.text(notification_box_message);
		_notification_box = this;
		var display = function() { 
			_notification_box.element.removeClass("hidden");
			_notification_box.element.fadeIn("slow");
		}
		var remove  = function() {
			_notification_box.element.addClass("hidden");
		}
		setTimeout(display, delay);
		setTimeout(remove, (delay + wait_for));

	}

}