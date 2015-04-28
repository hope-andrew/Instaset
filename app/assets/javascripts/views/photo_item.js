Instaset.Views.PhotoItem = Backbone.CompositeView.extend({
  template: JST["items/photo"],

  tagName: "li",

  initialize: function() {
    this.listenTo(this.model, "sync add", this.render);
    this.renderComments();
  },

  render: function() {
    var renderedContent = this.template({ photo: this.model});
    this.$el.html(renderedContent);
    this.attachSubviews();
    return this;
  },

  renderComments: function() {
    this.model.comments().each(this.addComment.bind(this));
  },

  addComment: function(comment) {
    var view = new Instaset.Views.CommentItem({model: comment});
    this.addSubview("ul.comments-index-list", view);
  },

});
