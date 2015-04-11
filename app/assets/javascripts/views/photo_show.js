Instaset.Views.PhotoShow = Backbone.CompositeView.extend({
  template: JST["photos/show"],

  initialize: function() {
    var likeView = new Instaset.Views.Like({ liked: this.model.likedByCurrentUser, photo: this.model });
    var commentsView = new Instaset.Views.CommentsIndex({ collection: this.model.comments(), photo: this.model});
    this.listenTo(this.model, "sync", this.render);
    this.addSubview("div.comments-index", commentsView);
    this.addSubview("div.like-button", likeView);
  },

  events: {
    "click button.like": "likePhoto"
  },

  render: function() {
    var renderedContent = this.template({ photo: this.model });
    this.$el.html(renderedContent);
    this.attachSubviews();
    return this;
  },

  likePhoto: function(event) {
    //event.preventDefault();
    var newLike = new Instaset.Models.Like({ photo: this.model });
    newLike.set({ photo_id: this.model.id });
    newLike.save({}, {
      success: function() {
        this.model.likes().add(newLike);
      }.bind(this)
    });
  }


});
