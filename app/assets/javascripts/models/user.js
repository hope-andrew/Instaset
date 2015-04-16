Instaset.Models.User = Backbone.Model.extend({
  urlRoot: "api/users",

  photos: function() {
    if (!this._photos) {
      this._photos = new Instaset.Collections.Photos();
    }
    return this._photos;
  },

  parse: function(response) {
    if (response.photos) {
      this.photos().set(response.photos);
      delete response.photos;
    }

    return response;
  }
});
