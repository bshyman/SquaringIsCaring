$(document).ready(function(){
  var numPool = document.getElementById("num_pool");

  flatpickr(".flatpickr", {
    enableTime: true,
    altInput: true,
    altFormat: "F j, Y h:i K",
    minDate: new Date(), // "today" / "2016-12-20" / 1477673788975
    utc: true,
    dateFormat: ("D, d M Y H:i:s")
    // defaultDate: 
  });

  var numString = $("div#num_pool").text();
  numString = numString.replace(/\n/g, "");
  numString = numString.match(/\d{1,2}/g)
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

  //convert 1 digit numbers to 2
  function addZeros(n) {
    return (n < 10 ? '0' : '') + n;
  };


    $("div.container").on('click', "div.contest-card", function(e){
      var id = $("div.contest-card").attr("contest_id");
    });



    // $("div.container").on("mouseover", "div.square", function(){
    //   $(this).removeClass('green');
    //   $(this).addClass('red');

    // })

    $("div.container").on("click", "div.square", function(){
      if ($(this).hasClass('brown')) {
        $(this).removeClass('brown');
        $(this).addClass("green");
        $("input[type=checkbox]", this).attr("checked", "");
      }
      else {
        $(this).removeClass('green');
        $(this).fadeToggle(200);
        $(this).fadeToggle(500);
        $("input[type=checkbox]", this).attr("checked", "checked");
        $(this).addClass("brown");
      }
    });

    $('button#random2').on('click', function(event){
      event.preventDefault();
      selectRandom(numString, 2)

    })
    $('button#random5').on('click', function(event){
      event.preventDefault();
      $(this).addClass("waves-effect waves-red") 
      var takenCount = $("input[checked='checked']").length + 5
      if (takenCount <= numString.length) {
        selectRandom(numString, 5)
      }
      else { $(this).addClass("disabled")};
      $(this).addClass("red");
    });


  function selectRandom(array, count){
    for (var i = 0; i < count; i++) {
      var randomNumInPool = addZeros(array[Math.floor ( Math.random() * array.length )])
      var randomElement = document.getElementById(randomNumInPool)
      if (randomElement.hasAttribute("checked")) {i = i-1};
      $(randomElement).parent().parent().removeClass('green');
      $(randomElement).parent().parent().addClass("brown");
      $(randomElement).attr("checked", "checked");
    }
  }

  if (numString.length == 0) {
  // var users = getUserIds();
  var conId = $("h3.event_name").attr("c-id")
  $.get("/contests/" + conId +"/cells/" + i, function(response){
        // console.log(response)
        for (var i = 0; i < 100; i++) {
      // console.log(iddd)
      var post_elem = document.getElementById(addZeros(i).toString())
      // debugger
      // var users = getUsers
      
      $(post_elem).parent().prepend(response[i].user_id)
      setTimeout(function(){
        // console.log(users)

      }, 3000) 
      console.log(response[i])
    };
  })
};
    var conId = $("h3.event_name").attr("c-id")
    $.get("/contests/" + conId +"/cells/" + i, function(response){
          for (var i = 0; i < 100; i++) {
            var post_elem = document.getElementById(addZeros(i).toString())
            $(post_elem).parent().prepend(response[i].user_id)
            setTimeout(function(){
            }, 3000) 
          };
    })
  };


//Display User's selected squares
  var current_user = document.getElementById('dashboard')
  current_user = current_user.toString().match(/users\/\d+/)
  current_user = current_user[0].slice(6)
  var conId = $("h3.event_name").attr("c-id")

  $.getJSON('/contests/' + conId + '/my_squares.json', function(response) {
    for (var i = 0; i < response[0].length; i++) {
      var cell = document.getElementById(response[0][i].position[0])
      $(cell).parent().text(response[1])
    }
  });
//Fade - Animate

  $('a[href$="test3"]').on('click', function(){
    $('div#test3').fadeIn(1000)
  })

  $('.square').on('click', function(){
    console.log(this)
    $(this).animate({border: 'dotted 3px'}, "slow")
  });

});












