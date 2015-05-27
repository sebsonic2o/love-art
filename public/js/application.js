var changeLikes = function(selector, value) {
  var $likes = selector.prev('p').children('span');
  $likes.hide();
  $likes.text(value);
  $likes.fadeIn("slow");
};


$(document).ready(function() {

  // Like Event Listener
  $('.like').on('click', function(event) {
    event.preventDefault();

    $.ajax({
      method: 'POST',
      url: $(this).attr('action'),
      context: $(this)
    }).done(function(data) {
      console.log("SUCCESS"); // temporary

      changeLikes($(this), data['likes']);

      // replace current element (form) and children with unlike form and children
    }).fail(function() {
      console.log("FAIL"); // temporary
    });
  });

  // Unlike Event Listener
  $('.unlike').on('click', function(event) {
    event.preventDefault();

    $.ajax({
      method: 'DELETE',
      url: $(this).attr('action'),
      context: $(this)
    }).done(function(data) {
      console.log("SUCCESS"); // temporary

      changeLikes($(this), data['likes']);

      // replace current element (form) and children with unlike form and children
    }).fail(function() {
      console.log("FAIL"); // temporary
    });
  });

});
