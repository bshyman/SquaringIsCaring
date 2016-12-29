$( document ).ready(function(){
	var numPool = document.getElementById("num_pool");
	var contestId = $("form#form").attr("action").charAt(10);

    $.get
    ("/contests/" + contestId, function(result){
    	console.log(result)

       var availNums = result.nums
       for (i=0; i < availNums.length; i++) {
       	// console.log("Here")
        
        // function disableCheckbox(id) {
  var element = document.getElementById(availNums[i]);
 
    $(element).parent().parent().css("background-color", "white");
    $(element).attr("disabled", true);
    // $(element).children().css("opacity", 0);

    // console.log(element)
  // elem.style.color = "red";
// }
        // console.log(availNums[i])
       }



    $("div.container").on('click', "div.square", function(event){
	// console.log(JSON.stringify(numPool))

	// alert($(this).html());
	// event.preventDefault();
  var test = $(this).find("input[disabled='disabled']").attr("id")
  console.log(test)
  // if (this.children().children().attr("disabled").val("disabled")) {};
	$(this).css('background', 'blue');

	var cellId = $(this).children().attr("id");
	var cellRoute = "/contests/" + contestId + "/cells";

	});
    });
});



