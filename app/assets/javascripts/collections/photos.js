Instaset.Collections.Photos = Backbone.Collection.extend({
  url: "/api/photos",
  model: Instaset.Models.Photo,

  // comparator: "created_at",

  getOrFetch: function(id) {
    var photo = this.get(id);
    var photos = this;

    if (!photo) {
      photo = new Instaset.Models.Photo({ id: id});
      photo.fetch({
        success: function() {
          photos.add(photo);
        }
      });
    } else {
      photo.fetch();
    }
    return photo;
  }

});
