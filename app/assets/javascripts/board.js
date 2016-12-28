$( document ).ready(function(){
	var numPool = document.getElementById("num_pool");
	var contestId = $("form#form").attr("action").charAt(10);
    $.get
    ("/contests/" + contestId, function(result){
    	console.log("im here")
    	console.log(result)

       var availNums = result
       var numsArr = new Array
       for (i=0; i < availNums.length; i++) {
       	console.log(i)
       		numsArr.push(i)
       }



        $("div.container").on('click', "div.square", function(event){
	console.log(JSON.stringify(numPool))
	// alert($(this).html());
	event.preventDefault();
	$(this).css('background', 'red');

	var cellId = $(this).children().attr("id");
	var cellRoute = "/contests/" + contestId + "/cells";

	});
    });
});



