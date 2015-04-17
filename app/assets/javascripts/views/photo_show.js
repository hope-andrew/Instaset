Instaset.Views.PhotoShow = Backbone.CompositeView.extend({
  template: JST["photos/show"],

  initialize: function() {
    this.collection = this.model.likes();
    this.listenTo(this.model, "sync", this.render);
    this.listenTo(this.model.likes(), "sync add remove destroy", this.render);
    // this.listenTo(this.collection, "sync add remove", this.render);

    var likeView = new Instaset.Views.Like({
      model: this.model.likeByCurrentUser(),
      collection: this.model.likes()
    });

    var commentsView = new Instaset.Views.CommentsIndex({
      collection: this.model.comments(),
      photo: this.model
    });

    this.addSubview("div.comments-index", commentsView);
    this.addSubview("div.like-button", likeView);
  },

  render: function() {
    var renderedContent = this.template({ photo: this.model });
    this.$el.html(renderedContent);
    this.attachSubviews();
    return this;
  },
});
