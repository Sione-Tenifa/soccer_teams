var currentTeam = {};
var showForm = false;

$(document).ready( function() {
    
  $('.team-item').on('click', function() {
    currentTeam.id = this.dataset.id
    currentTeam.name = this.dataset.name;
    $.ajax({
      url: '/teams/' + currentTeam.id + '/players',
      method: 'GET',
      dataType: 'JSON'
    }).done( function(players) {
      var list = $('#players');
      list.empty();
      players.forEach( function(players) {
        
        var li = '<li data-player-id="' + players.id + '">' + players.name + '-' + players.position + '</li>'
        list.append(li);
      });
    });
  });

  $('#toggle').on('click', function() {
    showForm = !showForm;
    $('#team-form').remove()
    $('#teamss-list').toggle()
    if (showForm) {
      $.ajax({
        url: '/team_form',
        method: 'GET'
      }).done( function(html) {
        $('#toggle').after(html);
      });
    }
  })

  $(document).on('submit', '#team-form form', function(e) {
    e.preventDefault();
    var data = $(this).serializeArray();
    $.ajax({
      url: '/games',
      type: 'POST',
      dataType: 'JSON',
      data: data
    }).done( function(team) {
      var g = '<li class="team-item" data-id="' + team.id + '" data-name="' + team.name + '">' + team.
      name + '-' + team.name + '</li>';
      $('#teams-list').append(g);
    }).fail( function(err) {
      alert(err.responseJSON.errors)
    });
  });
  
});
    



