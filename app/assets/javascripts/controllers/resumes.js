var JobApp = JobApp || {};

JobApp.resumes = {   // controller name
  init : function(){    // Always executed
    console.log("Init Resume...");
  },

  edit : function(){  // Action name
    console.log("Init Resume - Edit...");
    $("#upload-avatar").click(function(){
      console.log("Some funcion");
      $('#my-modal').modal();
    });

  }
}