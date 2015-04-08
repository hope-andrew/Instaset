Instaset.Views.PhotoIndex = Backbone.View.extend({

  template: JST["photos/index"],

  initialize: function() {
    this.listenTo(this.collection, "sync add", this.render);
  },

  render: function () {
    var renderedContent = this.template({photos: this.collection});
    this.$el.html(renderedContent);
    return this;
  }
});
