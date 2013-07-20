
$(document).ready(function(){

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