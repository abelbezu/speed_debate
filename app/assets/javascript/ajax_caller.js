/* Takes care of ajax calls and replies, represented as button to click, data to send and function to call back */
var AjaxHandler = function(clicked_id, url, method, data_to_send, callback){

  this.clicked_element = $("#"+clicked_id);
  this.sent_data = data_to_send;
  _this_ajax_handler = this;
  this.clicked_element.click(function(){
    
  });
  this.make_call = function(element){
    $.ajax({
      type: method,
      url: url,
      data: _this_ajax_handler.sent_data,
      success: function(data){
        // console.log("this state is reached");
        callback(data);

      }
    });
  }
}

/*$("h1").click ->
    $.ajax({
      type: "POST",
      url: "/products",
      data: { product: { name: "Filip", description: "whatever" } },
      success:(data) ->
        alert data.id
        return false
      error:(data) ->
        return false
    })*/