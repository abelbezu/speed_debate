/**
* represents an instance of a timer bar on the page.
* abstraction: {timer_bar, timer_bar_container, start_time, end_timer, position, color} => timer_bar
* @param: Dom element timer_container - the element containing the status bar
* @param: Dom timer_bar - the element acting as the status bar
* @param: string bar_color - the color of the status bar
* @param: int start_time - a javascript time representing the start of the debate
* @param: int end_time - a javascript time representing the end of the debate
* @param: int position - a javascript time representing the position of the on going debate 
*/
 var Timer = function(timer_container, timer_bar, bar_color, start_time, end_time, position)
 {
 	this.timer_container = timer_container;
 	this.timer_bar = timer_bar;
 	this.bar_color = bar_color;
 	this.start_time = start_time;
 	this.end_time = end_time;
 	this.position = position; 
 }
/** 
* initializes timer with width at the given position
* @param: current postiion
*/
Timer.prototype.initialize_timer = function(current_position)
{
	this.timer_bar.css({"background-color": this.bar_color})
	this.timer_bar.width(current_position.toString()+"%");
	return this.timer_bar;
}
/** 
* starts the timer at the given point, and runs it to the end.
* 
*/
Timer.prototype.run_timer = function()
{
	// some elementary calculations to figure out the parameters
	total_duration = this.end_time - this.start_time;
	current_status = (this.position - this.start_time)/(total_duration)*100;
	remaining_time = this.end_time - this.position;

	this.initialize_timer(current_status)
	.animate({width: '100%'}, remaining_time);
}
/** 
* makes the timer_bar_container blink at the given frequency
* 
*/
Timer.prototype.glow = function(frequency)
{
	var glower = this.timer_container;
	window.setInterval(function() {  
		glower.toggleClass('glow');
	}, 1000/frequency);
}
