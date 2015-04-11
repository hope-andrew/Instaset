Instaset.Collections.Likes = Backbone.Collection.extend({
  url: function () {
    return that.photo.url() + "/likes";
  }.bind(this),

  model: Instaset.Models.Like

});
