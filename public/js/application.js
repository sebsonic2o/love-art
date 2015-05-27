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

    request.done(function(data) {
      console.log("SUCCESS"); // logging

      changeLikes($(this), data['likes']);
      $(this).hide();
      $(this).prev().show();

    });

    request.fail(function() {
      console.log("FAIL"); // logging
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

    request.done(function(data) {
      console.log('SUCCESS'); // logging

      changeLikes($(this), data['likes']);
      $(this).hide();
      $(this).next().show();
    });

    request.fail(function(response) {
      console.log('FAIL'); // logging
    });
  });

});
