Instaset.Views.CommentsIndex = Backbone.CompositeView.extend({
  template: JST["comments/index"],

  initialize: function(options) {
    this.photo = options.photo;
    this.listenTo(this.collection, "sync add", this.render);
    this.listenTo(this.collection, "add", this.addComment);

    this.renderComments();

    var newCommentForm = new Instaset.Views.NewCommentForm({ collection: this.collection, photo: this.photo});
    this.addSubview("div.new-comment", newCommentForm);
  },

  render: function() {
    var renderedContent = this.template({comments: this.collection});
    this.$el.html(renderedContent);

    this.attachSubviews();
    return this;
  },

  renderComments: function() {
    this.collection.each(this.addComment.bind(this));
  },

  addComment: function(comment) {
    var view = new Instaset.Views.CommentItem({ model: comment });
    this.addSubview("ul.comments-list", view);
  }
});
