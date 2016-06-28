$(document).ready(function(){
  login();
  signup();
}) // end of document ready

var login = function(){
  $("#login").on("click", function(e){
    e.preventDefault();
    console.log("ajax default complete");
    $.ajax({
      method: 'GET',
      url: '/sessions/new'
  }).done(function(data){
    console.log(data);
    $("#user-forms").empty().html(data);
    })
  })
}

var signup = function(){
  $("#signup").on("click", function(e){
    e.preventDefault();
    console.log("ajax default complete");
    $.ajax({
      method: 'GET',
      url: '/users/new'
  }).done(function(data){
    console.log(data);
    $("#user-forms").empty().html(data);
    })
  })
}
