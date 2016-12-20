$( document ).ready(function(){
  $("div.container").on('click', "div.square", function(event){
    alert($(this).html());
    $(this).css('background', 'red');

    var cellId = $(this).children().attr("id");

    var contestId = $(this).parent().parent().attr("action").slice(-7);
    console.log("conID - " + contestId)
    // console.log("cellid - " + cellId)

  })
  // $.ajax({
  // 	method:'POST',
  // 	url: "/contests/" +  
  // })



//     $.ajax({
//       url: "/songs/" + songId,
//       method: "DELETE"
//     }).done(function(response){
//       $row.remove();
//     });
//   })
});