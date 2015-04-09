Instaset.Models.Comment = Backbone.Model.extend({

  initialize: function(options) {
    this.photo = options.photo;
  },

  urlRoot: function () {
    return this.photo.url() + "/comments";
  }
});
