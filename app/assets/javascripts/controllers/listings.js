var JobApp = JobApp || {};

JobApp.listings = {

  init : function(){
    console.log("Initializing Listings..")
  },

  show : function(){
    console.log("Listings - Show...");

    var message = "Thank you for applying!";

    $("#btn-apply").popover({
      trigger : "manual",
      content : function(){
        return message;
      }
    });

    $("#btn-apply").click(function(e){
      e.preventDefault();
      var self = $(this);
      var job_id = self.data("job");
      if(self.text() == "Applied!")
        return;
      $.post("/employees/applieds", {
        "applied" : {
          "job_id" : job_id
        }
      }).done(function(data){
        message = "Thank you for applying!";
        self.text("Applied!");
        self.removeClass("btn-info").addClass("btn-success");
        self.popover("show")
        setTimeout(function(){
          self.popover("hide");
        }, 2000);
      }).fail(function(){
        message = "Sorry! There was an error..."
        self.popover("show")
        setTimeout(function(){
          self.popover("hide");
        }, 2000);
      });
    });

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
        zoom: JobApp.JOB_LISTING_ZOOM,
        center: latLong,
        mapTypeId: google.maps.MapTypeId.ROADMAP
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

    $(".btn-applicants").click(function(e){
      e.preventDefault();
      $('html,body').animate({
        scrollTop : $(".applicants").offset().top - JobApp.NAV_BAR_PADDING
      },'slow');
    });
  },

  index : function(){
    if($("#map-canvas").length == 0){
      console.log("Listings - Index - Listing...");

      var message = "Thank you for applying!";

      $(".btn-apply").popover({
        trigger : "manual",
        content : function(){
          return message;
        }
      });

      $(".btn-apply").click(function(e){
        e.preventDefault();
        var self = $(this);
        var job_id = self.data("job");
        if(self.text() == "Applied!")
          return;
        $.post("/employees/applieds", {
          "applied" : {
            "job_id" : job_id
          }
        }).done(function(data){
          message = "Thank you for applying!";
          self.text("Applied!");
          self.removeClass("btn-info").addClass("btn-success");
          self.popover("show")
          setTimeout(function(){
            self.popover("hide");
          }, 2000);
        }).fail(function(){
          message = "Sorry! There was an error..."
          self.popover("show")
          setTimeout(function(){
            self.popover("hide");
          }, 2000);
        });
      });

    }else{
      console.log("Listings - Index - Map...");


      var positionSearch = function(){ // Moves the search form
        console.log("Positioning Search Form...");
        var search_container = $("#map-search-form"),
          search_form_width = search_container.width(),
          window_width = $(window).width();
          search_container.css({
            position : "absolute",
            top : JobApp.NAV_BAR_PADDING,
            left : (window_width - search_form_width) / 2
          });
      };

      var resizeMap = function(){

      };

      positionSearch();
      resizeMap();
      $(window).resize(function(){
        positionSearch();
        resizeMap();
      });

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
          mapTypeId: google.maps.MapTypeId.ROADMAP
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

    }
  }
};
