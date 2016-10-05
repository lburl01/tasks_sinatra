$.getJSON( "/api/tasks", function( data ) {
  var items = [];
  $.each( data, function( key, val ) {
    items.push( "<li id='" + key + "'>" + JSON.stringify(val) + "</li>" );
  });

  $( "<ul/>", {
    "class": "my-todo-list",
    html: items.join( "" )
  }).appendTo( "body" );
});
