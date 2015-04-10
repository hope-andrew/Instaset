Instaset.Collections.Likes = Backbone.Collection.extend({
  url: function () {
    return this.photo.url() + "/likes";
  },

  model: Instaset.Models.Like

});
