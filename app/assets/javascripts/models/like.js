Instaset.Models.Like = Backbone.Model.extend({
  initialize: function(attributes, options) {
    this.photo = options.photo;
    options.photo && this.set({ photo_id: options.photo.id });
  },

  urlRoot: function() {
    return this.photo.url() + "/likes";
  }
});
