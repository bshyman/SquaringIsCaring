  $( document ).ready(function(){
  	var numPool = document.getElementById("num_pool");

    var contestId = $("div.container").on('click', "div.contest-card", function(){
      var id = $("div.contest-card").attr("id")
      $.get("/contests/" + id, function(result){
        var availNums = result.nums
        for (i=0; i < availNums.length; i++) {
          if (availNums[i]) {};
          var element = document.getElementById(availNums[i]);
        };
      });
      
    });
    
      $("div.container").on("click", "div.square", function(){
        var contestId = $("form#form").attr("action").match(/\d+/);
         alert($(this).html());
        $(this).css("background-color", "red");
        $("input[type=checkbox]", this).attr("checked", "checked");
        // alert("Contest ID is " + contestId + " and this is " + $(this).html())
      })





    // $("div.container").on("click", "a#view_board", function(){
    //   populateNums();
    // });


  // $("div.container").on('click', "div.square", function(event){
  //  var contestId = $("form#form").attr("action").charAt(10);
  //       	// console.log(JSON.stringify(numPool))

  //       	alert($(this).html());
  //       	// event.preventDefault();
  //         var test = $(this).find("input[disabled='disabled']").attr("id")
  //         console.log("Test - " + this)
  //         // if (this.children().children().attr("disabled").val("disabled")) {};
  //         $(this).css('background', 'blue');

  //         var cellId = $(this).children().attr("id");
  //         var cellRoute = "/contests/" + contestId + "/cells";
  //       });

});



