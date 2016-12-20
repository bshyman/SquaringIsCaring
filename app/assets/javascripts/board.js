$( document ).ready(function(){
  $("div.container").on('click', "div.square", function(event){
	alert($(this).html());
	$(this).css('background', 'red');

	var cellId = $(this).children().attr("id");
	var contestId = $(this).parent().parent().attr("action").charAt(10);
	var cellRoute = "/contests/" + contestId + "/cells/" + cellId;
	// console.log("conID- " + contestId)
	// console.log("cellid - " + cellId)
	// console.log("cellroute - " + cellRoute)
  $.ajax({
	method:'POST',
	url: cellRoute
  }).done(function(response){
  })
  })
});