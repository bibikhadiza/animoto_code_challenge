$(document).ready(function() {

  $("#button").click(function(){
    $(".container").remove();
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
      $('.captcha_container').remove();
      $('#message').text("Hurrah! You are not an Alien!")
      $('#message').show()
    },
    error: function(response){
      if($('#form_submit').length == 1){
        alert("Try again")
        $( "div#form_submit" ).attr( "id", "form_button");
      }else {
        $('.captcha_container').remove();
        $('#message').text("Gotcha! No Aliens Allowed!")
        $('#message').show()
      }
    }
  })

}
