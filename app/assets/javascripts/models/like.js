Instaset.Models.Like = Backbone.Model.extend({
  urlRoot: function() {
    return this.photo.url() + "l/ikes";
  }
});
