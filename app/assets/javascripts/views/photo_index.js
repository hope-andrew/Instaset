Instaset.Views.PhotoIndex = Backbone.View.extend({

  template: JST["photos/index"],

  initialize: function() {
    this.listenTo(this.collection, "sync add", this.render);
  },

  events: {
    "click button.upload-photo": "uploadPhoto",
    "click button.new-photo": "addPhoto"
  },

  render: function () {
    var renderedContent = this.template({photos: this.collection});
    this.$el.html(renderedContent);
    return this;
  },

  uploadPhoto: function(event) {
    event.preventDefault();
    $target = $(event.currentTarget);

      filepicker.pick(
      function(Blob){
        console.log(Blob.url);
        $target.val(Blob.url);
      }
    );
  },


  addPhoto: function(event) {
    event.preventDefault();

    var $photoButton = $("button.upload-photo");
    debugger;
    var newPhoto = new Instaset.Models.Photo();
    newPhoto.set({img_url: $photoButton.val(), caption: "test image"});
    debugger;
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
