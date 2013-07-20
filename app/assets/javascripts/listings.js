var map;
function initialize() {
  var canvas = $("#map-canvas"),
  latitude = canvas.data("lat"),
  longitude = canvas.data("long"),
  title = canvas.data("title");
  var latLong = new google.maps.LatLng(latitude, longitude);
  var mapOptions = {
    zoom: 16,
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

$(document).ready(function(){

  initialize();

  $(".btn-apply").popover({
    trigger : "manual",
    content : "You can only apply for 5 jobs a day."
  });

  $(".btn-apply").click(function(e){
    e.preventDefault();
    var self = $(this);
    var job_id = self.data("job");
    if(self.text() == "Applied!")
      return;
    $.post("/employee/applieds", {
      "applied" : {
        "job_id" : job_id
      }
    }).done(function(data){
        self.text("Applied!");
        self.removeClass("btn-info").addClass("btn-success");
    }).fail(function(){
        self.popover("show")
        setTimeout(function(){
          self.popover("hide");
        }, 2000)
    });
  });

});