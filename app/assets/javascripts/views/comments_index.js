Instaset.Views.CommentsIndex = Backbone.CompositeView.extend({
  template: JST["comments/index"],

  initialize: function() {
    // this.listenTo(this.collection, "sync", this.render);
    // this.listenTo(this.collection, "add", this.addComment);

    this.renderComments();
  },

  render: function() {
    var renderedContent = this.template({comments: this.collection});
    this.$el.html(renderedContent);

    this.attachSubviews();
    return this.$el;
  },

  renderComments: function() {
    this.collection.each(this.addComment.bind(this));
  },

  addComment: function(comment) {
    var view = new Instaset.Views.CommentItem({ model: comment });
    this.addSubview("ul.comments-list", view);
  }
});
