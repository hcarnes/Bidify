$(document).ready(function() {
  var startTime = $('#countdown_timer').text()
  $('#countdown_timer').countdown(startTime, function(event) {
    $(this).text(
      event.strftime('%-d days %-H:%M:%S')
    );
  });
});
