Instaset.Views.NewPhotoForm = Backbone.View.extend({

  template: JST["photos/new"],

  initialize: function() {
    this.listenTo(this.collection, "sync add", this.render);
  },

  events: {
    "click button.upload-photo": "uploadPhoto",
    "click button.new-photo": "addPhoto"
  },

  render: function() {
    var renderedContent = this.template();
    this.$el.html(renderedContent);
    return this;
  },

  uploadPhoto: function(event) {
    event.preventDefault();
    $target = $(event.currentTarget);

      filepicker.pick(
      function(Blob){
        $target.val(Blob.url);
      }
    );
  },

  addPhoto: function(event) {
    event.preventDefault();

    var $photoButton = $("button.upload-photo");
    var $caption =$("input.caption-input");
    var newPhoto = new Instaset.Models.Photo();
    newPhoto.set({
      img_url: $photoButton.val(),
      caption: $caption.val(),
      user_id: Instaset.currentUser.id,
      username: Instaset.currentUser.username
    });
    newPhoto.save({}, {
      success: function() {
        this.collection.add(newPhoto);
      }.bind(this),

      error: function() {
        console.log("didnt work");
      }
    });
  }
});
