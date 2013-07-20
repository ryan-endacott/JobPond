
$(document).ready(function(){

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
    }).then(function(){
      self.text("Applied!");
      self.removeClass("btn-info").addClass("btn-success");
    });
  });

});