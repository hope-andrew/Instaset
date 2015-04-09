Instaset.Views.PhotoShow = Backbone.CompositeView.extend({
  template: JST["photos/show"],

  initialize: function() {
    var commentsView = new Instaset.Views.CommentsIndex({ collection: this.model.comments()});
    this.addSubview("div.comments-index", commentsView);
  },

  render: function() {
    var renderedContent = this.template({ photo: this.model });
    this.$el.html(renderedContent);

    this.attachSubviews();
    return this;
  }

});
