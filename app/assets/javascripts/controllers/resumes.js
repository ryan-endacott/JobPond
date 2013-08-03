var JobApp = JobApp || {};

JobApp.resumes = {   // controller name
  init : function(){    // Always executed
    console.log("Init Resume...");
  },

  edit : function(){  // Action name
    console.log("Init Resume - Edit...");
    $("#upload-avatar").click(function(){
      $('#my-modal').modal();
    });

  },

  avatar : function(){
    console.log("Init Resume - Avatar Crop...");

    $('#cropbox').Jcrop({
      onChange: update_crop,
      onSelect: update_crop,
      setSelect: [0, 0, 500, 500],
      aspectRatio: 1
    });

    function update_crop(coords) {
      var rx = 100/coords.w;
      var ry = 100/coords.h;
      var ratio = $("#cropbox").data("ratio");
      $("#crop_x").val(Math.round(coords.x * ratio));
      $("#crop_y").val(Math.round(coords.y * ratio));
      $("#crop_w").val(Math.round(coords.w * ratio));
      $("#crop_h").val(Math.round(coords.h * ratio));
    }

  }
}