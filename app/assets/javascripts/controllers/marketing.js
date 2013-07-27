var JobApp = JobApp || {};

JobApp.marketing = {

  init : function(){
    console.log("Initializing Marketing...");
  },

  employees : function(){
    console.log("Marketing - Employees...");

    var map;
    var openWindow = null;

    var markerListener = function(marker){
      var contentString = [
        "<p class=\"lead\">",
          "<a href=\"" + marker.url + "\" class=\"marker-url\">",
            marker.title,
          "</a>",
        "</p>",
        "<p>",
          marker.company_name,
        "</p>"
      ].join("");
      var infowindow = new google.maps.InfoWindow({
        content: contentString
      });
      return function(){
        if(openWindow)
          openWindow.close();
        openWindow = infowindow;
        infowindow.open(map, marker);
      };
    };

    var initialize = function() {
      var canvas = $("#map-canvas");
      if(canvas.length < 1)
        return;
      var latitude = canvas.data("lat"),
      longitude = canvas.data("long"),
      title = canvas.data("title");
      var latLong = new google.maps.LatLng(latitude, longitude);
      var mapOptions = {
        zoom: JobApp.JOB_LISTING_ZOOM,
        center: latLong,
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        panControl: false,
        zoomControl: false,
        scaleControl: false,
        scrollwheel: false
      };

      map = new google.maps.Map(document.getElementById('map-canvas'),
          mapOptions);

      var location_data = canvas.data("near")
      for(var i = 0 ; i < location_data.length ; i ++){
        var item = location_data[i];
        var myLatLng = new google.maps.LatLng(item.coords[0], item.coords[1]);
        var marker = new google.maps.Marker({
          position: myLatLng,
          map: map,
          title: item.title,
          company_name : item.company_name,
          url : item.url
        });
        google.maps.event.addListener(marker, 'click', markerListener(marker));
      }
    }
    initialize();

    var CHILD_MARGIN_TOP = 100,
    FLOAT_OF_SCREEN_HEIGHT = .93;

    var map_resize = function(){
      console.log("Resizing map...");
      var map_container = $("#map-heading-wrapper"),
        map_canvas = $("#map-canvas"),
        map_promo_text = map_container.find("#map-heading-promo-text"),
        map_sign_up = map_container.find("#map-heading-sign-up"),
        learn_more = $(".learn-more");

      var window_width = $(window).width(),
        window_height = $(window).height(),
        container_width = $(".container").width();
      //Do the map container so content will fit right in under
      //Subtract for the padding of the body
      map_container.height(window_height * FLOAT_OF_SCREEN_HEIGHT - JobApp.NAV_BAR_PADDING);
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
      //Fill in with learn more
      var learn_height = (1 - FLOAT_OF_SCREEN_HEIGHT) * window_height,
        learn_link = learn_more.find("a");
      learn_more.css({
        height : learn_height,
        "padding-top" : learn_height / 2 - learn_link.height() / 2
      });
    };

    map_resize();
    $(window).resize(function(){
      map_resize();
    });

    $(".learn-more").click(function(e){
      e.preventDefault();
      $('html,body').animate({
        scrollTop : $(this).offset().top - JobApp.NAV_BAR_PADDING
      },'slow');
    });

    $(".back-to-top").click(function(e){
      e.preventDefault();
      $('html,body').animate({
        scrollTop : 0
      },'fast');
    });

  }

};