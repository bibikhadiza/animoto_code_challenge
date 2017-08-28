$(document).ready(function() {

  $("#button").click(function(){
    $("#button").hide();
    $(".captcha").show();
    $('form').show();
  });

  $("form").submit(function(event){
    event.preventDefault()
    validateInput(event)
  })

});


function validateInput(event){
  var form = $('form')[0];
  var formData = new FormData(form);

  $.ajax({
    url: '/',
    method: 'POST',
    data: formData,
    contentType: false,
    processData: false,
    success: function(response){
      debugger;
      // $('captcha_container').hide();
      // $('#message').text("Hurrah! You are not an Alien!")
      // $('#message').show()
    },
    error: function(response){
      $('#message').text("Try Again")
      $('#message').show()

      debugger;
    }
  })

}
