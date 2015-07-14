main = function(){

	$(".topic_index_dropdown").click(function(e){
		e.stopPropagation();
		$('.dropdown-toggle').dropdown();
	});

	left_post_to_right = function(element){
		$(".original_offset_left").removeClass("col-md-2");
		$(".transformed_offset_left").addClass("col-md-2");
	}
	right_post_to_left = function(element){
		$(".original_offset_right").removeClass("col-md-2");
		$(".transformed_offset_right").addClass("col-md-2");
	}

	left_post_back = function(element){
		$(".transformed_offset_left").removeClass("col-md-2");
		$(".original_offset_left").addClass("col-md-2");
	}
	right_post_back = function(element){
		$(".transformed_offset_right").removeClass("col-md-2");
		$(".original_offset_right").addClass("col-md-2");
	}
	hide_comment_icons = function(){
		$(".glyphicon-comment").addClass("off_the_roof");
	}
	
	show_comment_icons = function(){
		$(".glyphicon-comment").removeClass("off_the_roof");
		
	}
	$(".comment_container_close").click(function(){
		left_post_back();
		right_post_back();
		$(".comments_container").addClass("hidden");
		show_comment_icons();
	});
	

}

$(document).ready(function(){
   main();
 
});

$(document).on('page:load', function (){
    main();
});
