/**
* The main entry point of the script
*/
custom = function () {
    /**
    *
    */
    var navListItems = $('div.setup-panel div a'),
            allWells = $('.setup-content'),
            allNextBtn = $('.nextBtn');
            allPrevBtn = $('.prevBtn');

    allWells.hide();

    navListItems.click(function (e) {
        e.preventDefault();
        var $target = $($(this).attr('href')),
                $item = $(this);

        if (!$item.hasClass('disabled')) {
            navListItems.removeClass('btn-primary').addClass('btn-default');
            $item.addClass('btn-primary');
            allWells.hide();
            $target.show();
            $target.find('input:eq(0)').focus();
        }
    });

    allNextBtn.click(function(){
        var curStep = $(this).closest(".setup-content"),
            curStepBtn = curStep.attr("id"),
            nextStepWizard = $('div.setup-panel div a[href="#' + curStepBtn + '"]').parent().next().children("a"),
            curInputs = curStep.find("input[type='text'],input[type='url']"),
            isValid = true;

        $(".form-group").removeClass("has-error");
        for(var i=0; i<curInputs.length; i++){
            if ((!curInputs[i].validity.valid) && (curInputs[i].name == 'first_name') ){
                isValid = false;
                $(curInputs[i]).closest(".form-group").addClass("has-error");
            }
        }

        if (isValid)
            nextStepWizard.removeAttr('disabled').trigger('click');
    });

    allPrevBtn.click(function(){
        var curStep = $(this).closest(".setup-content"),
            curStepBtn = curStep.attr("id"),
            prevStepWizard = $('div.setup-panel div a[href="#' + curStepBtn + '"]').parent().prev().children("a"),
            curInputs = curStep.find("input[type='text'],input[type='url']"),
            isValid = true;

       

        if (isValid)
            prevStepWizard.removeAttr('disabled').trigger('click');
    });

    $('div.setup-panel div a.btn-primary').trigger('click');

    $(".join_debate_choices").click(function(){

        $(this).parent().next('div').removeClass('hidden');
        $(this).parent().prev('div').addClass('hidden');
        

    });

    $('.comment-button').click(function() {
       $(this.parentElement.parentElement).next('.post-comment-box').toggleClass('hidden')
    });
    $('.comment-reply-button').click(function() {
      $($(this.parentElement.parentElement.parentElement).find('li')[0]).find('.reply_box').toggleClass('hidden')
    });
    $('.comment-reply-button-nested').click(function() {
       $(this.parentElement.parentElement.parentElement.parentElement).next('.media').toggleClass('hidden')
    });
    $('.nested-comment-reply-button').click(function() {
       $(this.parentElement.parentElement).next('.media').find('.comment-input-nested').toggleClass('hidden')
    });
    $('.nested-comment-reply-button').click(function() {
       $(this.parentElement.parentElement.parentElement).next('.media').find('.comment-input-nested').toggleClass('hidden')
    });


    $('.comment-input-button').click(function(){

        
        $(this).parent().on("ajax:success", function(e, data, status, xhr) 
        { 
            temp_data = data;
            if(data.comment.main_comment_id)
            {
                console.log('succeeded');
                new_reply = $('.reply_mold').clone(true);
                new_reply.removeClass('.reply_mold');
                new_reply.find('.replier_nick_name').text(data.account.nick_name);
                new_reply.find('.reply_body').text(data['content']['content_body']);
                new_reply.find('#comment_main_comment_id').attr('value', data.comment['id']);
                new_reply.removeClass('hidden');
                 $(this).parent().parent().addClass('hidden')
                $(this.parentElement.parentElement).next('ul.replies_container').prepend(new_reply);
            }
            else
            {
              new_comment = $('.comment_mold').clone(true);
              new_comment.find('.nick_name').text(data.account.nick_name);
              new_comment.find('.content_body').text(data['content']['content_body']);
              new_comment.find('#comment_main_comment_id').attr('value', data.comment['id']);
              new_comment.removeClass('hidden');
              $(this.parentElement.parentElement.parentElement).prepend(new_comment);
              $(this).parent().parent().addClass('hidden')

            }
        })

                        .on("ajax:error", function(e, xhr, status, error)  { console.log('failure');});
   
    });


$('#dnd-area').on('dragenter', function(e){
    console.log('entered');
    e.stopPropagation();
    e.preventDefault();
    
$(this).css('border-color', "red");
})
              .on('dragover', function(e){
    
    e.stopPropagation();
    e.preventDefault();
    $(this).css('border-color', "red");
})
$('#dnd-area').on('dragleave', function(e){
    console.log('entered');
    e.stopPropagation();
    e.preventDefault();
    
    $(this).css('border-color', "grey");
})
              .on('drop', function(e) {
    e.stopPropagation();
    e.preventDefault();
    evt = e;
    
    var image = e.originalEvent.dataTransfer.files[0];
    
    var reader = new FileReader();
    reader.onload = function(e){
        var img = new Image();
        echo_image = img;
        container = $('#dnd-area');
        img.src = e.target.result;
        console.log(img.height);
        img.width = container.width();
        $('#dnd-area').append(img);
        container.height($('#dnd-area').find('img').height());
        
    }
    reader.readAsDataURL(image);
});

$('.goto_debate_btn').click(function(){

    id = $(this).attr('id').charAt(7);

    $.ajax({
        url: "/debates/check_participation", 
        data: id,
        type: 'post',
        success: function(result){
        alert(result);
    }});



});





update_page = function() {
    if($("#creator-left").size() > 0)
    {
        $("#creator-left").remove();
    }
    if($("#creator-right").size() > 0)
    {
        $("#creator-right").remove();
    }
   
}


$('.topic-container').focus(function(){
 unminify_topic_box();
});

}



$(document).ready(function(){

    custom();
    
});

$(document).on('page:load', function (){
    custom();
    
});


function startTimer(duration, display) {
    var timer = duration, minutes, seconds;
    setInterval(function () {
        minutes = parseInt(timer / 60, 10)
        seconds = parseInt(timer % 60, 10);

        minutes = minutes < 10 ? "0" + minutes : minutes;
        seconds = seconds < 10 ? "0" + seconds : seconds;

        display.textContent = minutes + ":" + seconds;

        if (--timer < 0) {
            timer = duration;
        }
    }, 1000);
}