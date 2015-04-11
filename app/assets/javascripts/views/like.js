Instaset.Views.Like = Backbone.View.extend({

  initialize: function(options) {
    this.photo = options.photo;
    this.model = new Instaset.Models.Like({}, {photo: options.photo});
    if (options.liked) {
      this.model.set('id', 'options.liked');
    }
    this.listenTo(this.model, "sync add remove", this.render);
  },

  template: JST["items/like"],

  events: {
    "click button.like": "like",
    "click button.unlike": "unlike"
  },

  render: function() {
    var renderedContent = this.template({ like: this.model});
    this.$el.html(renderedContent);
    return this;
  },

  like: function(event) {
    var newLike = new Instaset.Models.Like({
      liked_photo: this.photo.id,
      liker: Instaset.currentUser.id});
    newLike.save({}, {
      success: function() {
        this.photo.likes().add(newLike);

      }.bind(this)
    });
  },

  unlike: function(event) {
    this.model.destroy();
  }
});
