$( document ).ready(function(){
  $(".square").on('click', function(event){
    alert($(this).html());

    $(this).css('background', 'red')
  })
})