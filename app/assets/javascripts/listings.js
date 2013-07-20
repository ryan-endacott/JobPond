
$(document).ready(function(){

  $(".btn-apply").click(function(e){
    e.preventDefault();
    var job_id = $(this).data("job");
    var self = $(this);
    $.post("/employee/applieds", {
      "applied" : {
        "job_id" : job_id
      }
    }).then(function(){
      self.text("Applied!");
      self.removeClass("btn-info").addClass("btn-success");
    });
  });

});