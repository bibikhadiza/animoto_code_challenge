$(document).ready(function() {

  $("#button").click(function(){
    $("#button").hide();
    $(".captcha").show();
    $('form').show();
  });

  // $("form").submit(function(event){
  //   event.preventDefault()
  //   validateInput(event)
  // })

});

//
// function validateInput(event){
//   var form = $('form')[0];
//   var formData = new FormData(form);
//
//   $.ajax({
//     url: '/',
//     method: 'POST',
//     dataType: 'json',
//     data: formData,
//     contentType: false,
//     processData: false
//   })
//
// }
