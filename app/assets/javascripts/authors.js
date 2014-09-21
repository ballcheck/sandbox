//// this might be more like the rails way
//var show_names = function( data ){
//console.log( data )
//  var ul = jQuery( "<ul>" )
//  for ( var key in data ){
//    ul.append( jQuery( "<li>"+data[key]+"</li>" ) )
//  }
//
//  jQuery( "#display" ).html( ul )
//}
//
//var show_failure = function(){
//  jQuery( "#display" ).html( "The request failed" )
//}
//
//var get_names = function(){
//  var request = jQuery.ajax({
//    url: "authors/names.json",
//    success: show_names,
//    error: show_failure,
//    dataType: "json"
//  })
//}
//
//jQuery(function(){
//  jQuery( "#foo_link" ).click( function( e ){
//    e.preventDefault();
//    get_names();
//  });
//});
//
//
//
sandbox.Authors = function(){

  this.set_names = function( names ){ this._names = names }
  this.get_names = function(){ return this._names }
  this.show_names = function(){ this.dom_handles.display.html( this.get_names() ) }

  this.load_names = function( callback ){
    // make an ajax call to authors/names
    jQuery.ajax({
      url: "authors/names.json",
      success: [ function( data ){ this.set_names( data ) }, callback ],
      context: this, // so you don't have to write the closure
      dataType: "json" // explicit conversion
    })
  }

  this.populate_names = function(){
    var callback = function(){
      this.show_names();
      console.log( this )
    }

    this.load_names( callback ) // async
  }

  this.weather_key = function(){
    return "f793b173834ca0c965c1e7ece4fdcfdfea592f68"
  }

  this.display_weather = function( town ){
    var url = "http://api.worldweatheronline.com/free/v1/weather.ashx?q="+town+"&format=json&num_of_days=5&key="+this.weather_key()
    jQuery.ajax({
      url: url,
      success: function( data ){
      console.log( data )
        this.dom_handles.display.html( JSON.stringify( data.data.current_condition[0] ) )
      },
      complete: function( request ){ console.log( request ) },
      dataType: "json",
      context: this
    });
  }

  
  //----------------------------------
  // "private" methods and attributes
  //----------------------------------

  this._names = []

  this._get_dom_handles = function(){
    this.dom_handles = {};
    this.dom_handles.foo_link = jQuery( "#foo_link" );
    this.dom_handles.display = jQuery( "#display" );
  }

  this._bind_events = function(){
    this.dom_handles.foo_link.click(
      (
        function( obj ){
          return function( e ){
            e.preventDefault();
            obj.populate_names();
          }
        }
      )( this )
    );
  }

  this._initialize = function(){
    this._get_dom_handles();
    this._bind_events();
  }

  // go
  this._initialize();

}

jQuery( function(){ authors = new sandbox.Authors() } );
