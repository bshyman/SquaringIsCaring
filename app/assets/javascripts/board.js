$(document).ready(function(){

  var numPool = document.getElementById("num_pool");

  flatpickr(".flatpickr", {
    enableTime: true,
    altInput: true,
    altFormat: "F j, Y h:i K",
    minDate: new Date(), // "today" / "2016-12-20" / 1477673788975
    utc: true,
    dateFormat: ("D, d M Y H:i:s")
  });

  // $("div.container").on('click', "button#display_board", function(e){
    var numString = $("div#num_pool").text();
    numString = numString.replace(/\n/g, "");
    numString = numString.match(/\d{1,2}/g)
  // console.log(numString)
  for (i = 0; i < 100; i++) {
    if (numString == null) {numString = []}

      if (!numString.includes(i.toString() )) {
        var taken = document.getElementById(addZeros(i).toString())
        $(taken).parent().parent().addClass( "black");
        $(taken).attr("disabled", "disabled")
      }
    };


    for (i=0; i < 100; i++) {
      var element = document.getElementById(addZeros(numString[i]));
      $(element).attr("enabled", "enabled")
      $(element).parent().parent().addClass( "green");
    };

    function addZeros(n) {
      return (n < 10 ? '0' : '') + n;
    };


    $("div.container").on('click', "div.contest-card", function(e){
      var id = $("div.contest-card").attr("contest_id");
    });



    $("div.container").on("click", "div.square", function(){
      // var contestId = $("form#form").attr("action").match(/\d+/);
      $(this).removeClass('green');
      $(this).css("background-color", "brown");
      $("input[type=checkbox]", this).attr("checked", "checked");
    });

    $('button#random2').on('click', function(event){
      event.preventDefault();
      selectRandom(numString, 2)
    })
    $('button#random5').on('click', function(event){
      event.preventDefault();
      $(this).addClass("waves-effect waves-red") 
      var takenCount = $("input[checked='checked']").length + 5
      console.log( "Taken - " + takenCount + " - " + numString.length)
      if (takenCount <= numString.length) {
        selectRandom(numString, 5)
      }
      else { $(this).addClass("disabled")};
      $(this).addClass("red");
    });

  // function countCheckedAndClaimed()

  function selectRandom(array, count){

    for (var i = 0; i < count; i++) {
      console.log(i)

      var randomNumInPool = addZeros(array[Math.floor ( Math.random() * array.length )])
      var randomElement = document.getElementById(randomNumInPool)
      if (randomElement.hasAttribute("checked")) {i = i-1};
      $(randomElement).parent().parent().removeClass('green');
      $(randomElement).parent().parent().css("background-color", "brown");
      $(randomElement).attr("checked", "checked");
    }

  }

if (numString.length == 0) {
  // var users = getUserIds();
  var conId = $("h3.event_name").attr("c-id")
  $.get("/contests/" + conId +"/cells/" + i, function(response){
        // console.log(response)
        for (var i = 0; i < 101; i++) {
      // console.log(iddd)
      var post_elem = document.getElementById(addZeros(i).toString())
      // debugger
      // var users = getUsers
      
      $(post_elem).parent().prepend(response[i].user_id)
      setTimeout(function(){
        console.log(users)

      }, 3000) 
      console.log(response[i])
    };


  });
};
// var getUsers = function getUserIds(){
//   $.get("/users", function(user_data){
//     console.log(user_data)
//     return user_data;
//   })

// console.log(numString)
});
















    // $("div.container").on("click", "a#view_board", function(){
    //   populateNums();
    // });


  // $("div.container").on('click', "div.square", function(event){
  //  var contestId = $("form#form").attr("action").charAt(10);
  //        // console.log(JSON.stringify(numPool))

  //        alert($(this).html());
  //        // event.preventDefault();
  //         var test = $(this).find("input[disabled='disabled']").attr("id")
  //         console.log("Test - " + this)
  //         // if (this.children().children().attr("disabled").val("disabled")) {};
  //         $(this).css('background', 'blue');

  //         var cellId = $(this).children().attr("id");
  //         var cellRoute = "/contests/" + contestId + "/cells";
  //       });




