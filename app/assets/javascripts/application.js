// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
// Need to require self before controllers
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require_self
//= require_tree .
//= require cocoon


////*************** Template *****************/////
/*
var JobApp = JobApp || {};

JobApp.marketing = {   // controller name
  init : function(){    // Always executed
    console.log("Init marketing");
  },

  employee : function(){  // Action name

  }
}*/

var JobApp = JobApp || {};

JobApp = {   // App wide code and sets up namespace
  common: {
    init: function() {
      // application-wide code
      console.log("Initializing App JS...");
    }
  }
};

/////**************DON'T TOUCH BELOW!*********////

UTIL = {
  exec: function( controller, action ) {
    var ns = JobApp,
        action = ( action === undefined ) ? "init" : action;

    if ( controller !== "" && ns[controller] && typeof ns[controller][action] == "function" ) {
      ns[controller][action]();
    }
  },

  init: function() {
    var body = $("body"),
        controller = body.data( "controller" ),
        action = body.data( "action" );

    UTIL.exec( "common" );
    UTIL.exec( controller );
    UTIL.exec( controller, action );
  }
};

$( document ).ready(function(){
  UTIL.init();
});