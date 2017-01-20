  $( document ).ready(function(){
  	var numPool = document.getElementById("num_pool");
    var contestId = $("form#form").attr("action").charAt(10);
    $("div.container").on('click', "button#display_board", function(e){
        // alert("ConID - " + contestId)
        var numString = $("div#num_pool").text();
        var numString = numString.replace(/\n/g, "");
        var numString = numString.match(/\d{1,2}/g)
        console.log(numString)

        for (i=0; i < 100; i++) {
          var element = document.getElementById(addZeros(numString[i]));
          $(element).attr("enabled", "enabled")
          $(element).parent().parent().addClass( "yellow");
        };
      });

    function addZeros(n) {
    // return (n < 10)? Number('0' + n) : i;
    return (n < 10 ? '0' : '') + n;
  }


    $("div.container").on('click', "div.contest-card", function(e){
      var id = $("div.contest-card").attr("contest_id");
    });
  

    $("div.container").on("click", "div.square", function(){
      var contestId = $("form#form").attr("action").match(/\d+/);
         // alert($(this).html());
         console.log(this)
         $(this).css("background-color", "red");
         $("input[type=checkbox]", this).attr("checked", "checked");
      })
  


    //   $.ajax({
    //     url: "/contests/" + id, 
    //   }).done(function(result){
    //     // readyBoard(result);
    //   });
    // });

    // }


    // function readyBoard(response) {
    //   for (i=0; i < response.length; i++) {
    //     var element = document.getElementById(response[i]);
    //     console.log(element)
    //     $(element).removeAttr("disabled");
    //     $(element).addClass("enabled");
    //   };
    // };







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



