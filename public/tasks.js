$.getJSON( "/api/tasks", function( tasks ) {
  var items = [];
  $.each( tasks, function( key, val ) {
    items.push( "<li id='" + key + "'>" + JSON.stringify(val) + "</li>" );
  });

  $( "<ul/>", {
    "class": "my-todo-list",
    html: items.join( "" )
  }).appendTo( "div" );
});

// console.log(data)
