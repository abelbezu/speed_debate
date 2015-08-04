var IntelligentInput = function(input_element, event, reg_ex){
	this.element = $(input_element);
    this.reg_ex = reg_ex;

    this.detect_pattern = function(){
    	this.element.on(event)
    }
}

