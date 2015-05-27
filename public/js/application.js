var changeLikes = function(selector, value) {
  var $likes = selector.parent('div').children('p').children('span');
  $likes.hide();
  $likes.text(value);
  $likes.fadeIn("slow");
};


$(document).ready(function() {

  // Like Event Listener
  $('.like-form').on('click', function(event) {
    event.preventDefault();

    var request = $.ajax({
      method: 'POST',
      url: $(this).attr('action'),
      context: $(this)
    });

    request.done(function(response) {
      // logging
      console.log(response);
      console.log("SUCCESS");

      changeLikes($(this), response['likes']);
      $(this).hide();
      $(this).prev().show();
    });

    request.fail(function() {
      // logging
      console.log(response);
      console.log("FAIL");
    });
  });

  // Unlike Event Listener
  $('.unlike-form').on('click', function(event) {
    event.preventDefault();

    var request = $.ajax({
      method: 'DELETE',
      url: $(this).attr('action'),
      context: $(this)
    });

    request.done(function(response) {
      // logging
      console.log(response);
      console.log('SUCCESS');

      changeLikes($(this), response['likes']);
      $(this).hide();
      $(this).next().show();
    });

    request.fail(function(response) {
      // logging
      console.log(response);
      console.log('FAIL');
    });
  });

});
