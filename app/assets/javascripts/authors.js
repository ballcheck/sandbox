// this might be more like the rails way
var show_names = function( names ){
  var ul = jQuery( "<ul>" )
  for ( var key in names ){
    ul.append( jQuery( "<li>"+names[key]+"</li>" ) )
  }

  jQuery( "#display" ).html( ul )
}

var show_failure = function(){
  jQuery( "#display" ).html( "The request failed" )
}

var get_names = function(){
  var request = jQuery.ajax({
    url: "authors/names.json",
    success: show_names,
    error: show_failure
  })
}

jQuery(function(){
  jQuery( "#foo_link" ).click( function( e ){
    e.preventDefault();
    get_names();
  });
});



//var Authors = function(){
//
//  this._names = []
//
//  this.set_names = function( names ){ this.names = names }
//  this.get_names = function(){ return this._names }
//
//  this.populate_names = function(){
//    // make an ajax call to authors/names
//    jQuery.ajax({
//      url: "authors/names.json",
//      complete: ( function( obj ){
//        return function( response ){
//          var names = jQuery.parseJSON( response.responseText )
//          obj.set_names( names )
//        }
//      })( this )
//    })
//
//    // when finished parse the result and populate this.names
//  }
//  
//  //-------------------
//  // "private" methods
//  //-------------------
//
//  this._get_dom_handles = function(){
//    this.dom_handles = {};
//    this.dom_handles.foo_link = jQuery( "#foo_link" );
//  }
//
//  this._bind_events = function(){
//    this.dom_handles.foo_link.click(
//      (
//        function( obj ){
//          return function( e ){
//            e.preventDefault();
//            obj.populate_names();
//          }
//        }
//      )( this )
//    );
//  }
//
//  this._initialize = function(){
//    this._get_dom_handles();
//    this._bind_events();
//  }
//
//  // go
//  this._initialize();
//
//}
//
//jQuery( function(){ authors = new Authors() } );
