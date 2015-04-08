window.Instaset = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    alert("THIS IS WORKING");

    new Instaset.Routers.Router({
      $rootEl: $("#main")
    });

    Backbone.history.start();
  }
};

$(document).ready(function(){
  Instaset.initialize();
});
