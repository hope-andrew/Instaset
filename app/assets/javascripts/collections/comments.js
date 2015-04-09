Instaset.Collections.Comments = Backbone.Collection.extend({
  url: "api/photos/:photo_id",
  model: Instaset.Models.Comment,
  
});
