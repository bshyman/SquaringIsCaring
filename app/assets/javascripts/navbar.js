	$( document ).ready(function(){
  $(".dropdown-button").dropdown({
    inDuration: 50,
      outDuration: 50,
      constrain_width: false, // Does not change width of dropdown to that of the activator
      hover: true, // Activate on hover
      gutter: 20, // Spacing from edge
      belowOrigin: false, // Displays dropdown below the button
      alignment: 'left' // Displays dropdown with edge aligned to the left of button
    });
   // Materialize.toast(message, displayLength, className, completeCallback);
  Materialize.toast('I am a toast!', 4000) // 4000 is the duration of the toast
  // $('.datepicker').pickadate({
  //   selectMonths: true, // Creates a dropdown to control month
  //   selectYears: 15 // Creates a dropdown of 15 years to control year
  // });
  
})
  
  