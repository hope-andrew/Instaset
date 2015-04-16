Instaset.Views.userShow = Backbone.View.extend({
  template: JST["users/show"],

  initialize: function() {
    this.listenTo(this.model, "sync", this.render);
    this.listenTo(this.collection, "sync", this.render);
  },

  render: function() {
    var renderedContent = this.template({user: this.model, photos: this.collection});
    this.$el.html(renderedContent);
    return this;
  }
});
