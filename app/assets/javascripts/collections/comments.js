Instaset.Collections.Comments = Backbone.Collection.extend({

  initialize: function(options) {
    
  },

  url: function() {
    return this.photo.url() + "/comments";
  },

  model: Instaset.Models.Comment,

});
