$(function(){
  $(".js-more").on('click', function() {
    var id = $(this).data("id");
    console.log(id);
    $.get("/jobs/" + id + ".json", function(data) {
      console.log(data["job"]["description"]);
      $("#body-" + id).html(data["job"]["description"]);
    });
  });

  $(".js-next").on('click', function(){
    var nextId = parseInt($(".js-next").attr("data-id")) + 1;
    $.get('/jobs/' + nextId + ".json", function(data){
      $(".jobTitle").text(data["job"]["title"]);
      $(".jobComp").text(data["job"]["company"]);
      $(".jobDesc").text(data["job"]["description"]);
      $(".js-next").attr("data-id", data["job"]["id"]);
      loadJobs(data);
    });
  });

  $(".js-prev").on('click', function(){
    var prevId = parseInt($(".js-next").attr("data-id")) - 1;
    $.get('/jobs/' + prevId + ".json", function(data){
      $(".jobTitle").text(data["job"]["title"]);
      $(".jobComp").text(data["job"]["company"]);
      $(".jobDesc").text(data["job"]["description"]);
      $(".js-next").attr("data-id", data["job"]["id"]);
      loadJobs(data);
    });
  });

  function loadJobs(data){
    $('.applyBtn').attr('href', '/jobs/' + data["job"]["id"] + '/applications/new')
    var apps = data["job"]["applications"];
    var jobHtml = "";
    apps.forEach(function(app){
      jobHtml += '<a href="/applications/' + app["id"] + '"><p>' + app["user"]["first_name"] + ' ' + app["user"]["last_name"] + "'s Application</p></a>";
    });

    $('#jobList').html(jobHtml);
  }
});
