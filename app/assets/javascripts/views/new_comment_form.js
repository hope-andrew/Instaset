Instaset.Views.NewCommentForm = Backbone.View.extend({
  template: JST["comments/new"],

  tagName: "form",

  className: "new-comment",

  initialize: function(options) {
    this.photo = options.photo;
    this.listenTo(this.collection, "sync add", this.render);
  },

  events: {
    "submit": "addComment"
  },

  render: function() {
    var renderedContent = this.template();
    this.$el.html(renderedContent);
    return this;
  },

  addComment: function(event) {
    event.preventDefault();
    var $target = $(event.currentTarget);
    var params = $target.serializeJSON();
    var newComment = new Instaset.Models.Comment({ photo: this.photo });
    newComment.set(params);
    newComment.save({}, {
      success: function() {
        this.collection.add(newComment);
      }.bind(this)
    });

  }
});
