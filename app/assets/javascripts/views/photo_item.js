Instaset.Views.PhotoItem = Backbone.View.extend({
  template: JST["items/photo"],

  tagName: "li",

  initialize: function() {
    this.listenTo(this.model, "sync add", this.render);
  },

  render: function() {
    var renderedContent = this.template({ photo: this.model});
    this.$el.html(renderedContent);
    return this;
  }
});
