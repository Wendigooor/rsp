$(document).ready(function() {

  // console.log('game.js ready');

  $('a[disabled=disabled]').click( function(e) {
    e.preventDefault();
  });

  let playButton = $('#play_button');
  let result = $('#result');

  playButton.on('click', function(e) {
    e.preventDefault();

    result.html('Please, wait..');
    playButton.attr('disabled', true);

    url = this.dataset.href;
    selectedOption = $('#throw_options').find(':selected').val();

    $.ajax({
      type: 'POST',
      url: url,
      data: {
        throw: selectedOption
      },
      success: function(data) {
        console.log(data);
        result.html("User Throw: " + data.user_throw +
          " | Oppenent Throw: " + data.opponent_throw +
          " -> Result: " + data.result);
        playButton.attr('disabled', false);
      }
    });

    return false;
  })

})