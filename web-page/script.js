$( document ).ready(function() {
    $('.js_enter').on('click', function(){
       $('.js_registration').css("display", "block")
    });
    $('.js_close').on('click', function(){
        $('.js_registration').css("display", "none")
    });
    $('.js_eye').on('click', function(){
        if($('.js_input').attr("type") === "text")
            $('.js_input').attr("type", "password");
        else
            $('.js_input').attr("type", "text")
    });
    $('.js_open_block').on('click', function(){
        $('.js_booking_right').css("display", "block");
        $('.js_open_block').css("background-image", 'url("image/net_active.png")')
    });
    $('.js_close2').on('click', function(){
        $('.js_booking_main').css("display", "none")
        location.reload();
    });
    $('.js_open_right').on('click', function(){
       if($('.js_booking_right').css("display") === "block")
           $('.js_booking_right').css("display", "none");
       else
           $('.js_booking_right').css("display", "block")
    });
    $('.js_drop_down').on('click', function(){
        if($('.js_drop_down_inside').css("display") === "block")
            $('.js_drop_down_inside').css("display", "none");
        else
            $('.js_drop_down_inside').css("display", "block")
    });
    $('.js_main_row').on('click', function(event){
        if($(event.target).hasClass('seats')) {
            $(event.target).css('background-color', 'red')
        }
    });
    $('.js_body_table').on('click', function(event){
         var tagName = $(event.target).prop("tagName");
         if(tagName === "TD"){
             $(event.target).css('background-color', '#00f');
             $('.js_booking_main').css('display', 'block');
             $('.js_body_table').unbind('click');
         }else if(tagName === "A") {
             $(event.target).parent().css('background-color', '#00f');
             $('.js_booking_main').css('display', 'block');
             $('.js_body_table').unbind('click');
         }
    });

});

