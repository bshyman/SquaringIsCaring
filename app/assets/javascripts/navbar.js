$( document ).ready(function(){
	$(".dropdown-button").dropdown({
	  inDuration: 500,
      outDuration: 500,
      constrain_width: false, // Does not change width of dropdown to that of the activator
      hover: true, // Activate on hover
      gutter: 20, // Spacing from edge
      belowOrigin: false, // Displays dropdown below the button
      alignment: 'left' // Displays dropdown with edge aligned to the left of button
    });
  })
