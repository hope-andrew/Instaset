Instaset.Views.CommentItem = Backbone.View.extend({
  template: JST["items/comment"],

  tagName: "li",
  className: "list-group-item",

  render: function() {
    var renderedContent = this.template({ comment: this.model });
    this.$el.html(renderedContent);
    return this;
  }
});
