var StringValidator = function(){
	this.email_re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;

	this.is_valid_email = function(string_input)
	{		 
		return this.email_re.test(string_input);
	}

	this.password_validator = function()
	{

	}

	this.custom_validator = function(regex)
	{

	}

}