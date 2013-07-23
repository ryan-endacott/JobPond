var JobApp = JobApp || {};

JobApp.marketing = {

  init : function(){
    console.log("Initializing Marketing...");
  },

  employees : function(){
    console.log("Marketing - Employees...");

    var map;
    function initialize() {
      var canvas = $("#map-canvas");
      if(canvas.length < 1)
        return;
      var latitude = canvas.data("lat"),
      longitude = canvas.data("long"),
      title = canvas.data("title");
      var latLong = new google.maps.LatLng(latitude, longitude);
      var mapOptions = {
        zoom: 16,
        center: latLong,
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        panControl: false,
        zoomControl: false,
        scaleControl: false,
        scrollwheel: false
      };
      map = new google.maps.Map(document.getElementById('map-canvas'),
          mapOptions);

      var marker = new google.maps.Marker({
          position: latLong,
          map: map,
          title: title
      });
    }
    initialize();

    var CHILD_MARGIN_TOP = 100,
    FLOAT_OF_SCREEN_HEIGHT = .85;

    var map_resize = function(){
      console.log("Resizing map...");
      var map_container = $("#map-heading-wrapper"),
        map_canvas = $("#map-canvas"),
        map_promo_text = map_container.find("#map-heading-promo-text"),
        map_sign_up = map_container.find("#map-heading-sign-up");

      var window_width = $(window).width(),
        window_height = $(window).height(),
        container_width = $(".container").width();
      //Do the map container so content will fit right in under
      //Subtract for the padding of the body
      map_container.height(window_height * FLOAT_OF_SCREEN_HEIGHT - 60);
      //Do the actual map.  Probably not necessary with css but might as well.
      map_canvas.height(window_height * FLOAT_OF_SCREEN_HEIGHT);
      //Do the promo text
      map_promo_text.css({
        left : (window_width - container_width) / 2,
        top : CHILD_MARGIN_TOP
      });
      //Do the sign up dialog
      map_sign_up.css({
        right : (window_width - container_width) / 2,
        top : CHILD_MARGIN_TOP
      });
    };

    map_resize();
    $(window).resize(function(){
      map_resize();
    });

  }

};