$(document).ready(function() {
  $('#show-map .button').on('click', function(){
    $('.problems').toggleClass('hide');
    $('.show-map').toggleClass('hide');
    $('.hide-map').toggleClass('hide');

    resizeMap();
  });
});
