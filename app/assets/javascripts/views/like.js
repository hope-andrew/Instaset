Instaset.Views.Like = Backbone.View.extend({
  initialize: function(options) {
    this.listenTo(this.model, "sync destroy change", this.render);
  },

  template: JST["items/like"],

  events: {
    "click .like": "like",
    "click .unlike": "unlike"
  },

  render: function() {
    var renderedContent = this.template({ like: this.model });
    this.$el.html(renderedContent);
    return this;
  },

  like: function(event) {
    this.model.set({
      liker: Instaset.currentUser.id
    });

    this.model.save({}, {
      success: function(model, response, options) {
        this.collection.add(this.model);
      }.bind(this)
    });
  },

  unlike: function(event) {
    this.model.destroy({
      success: function (model, response, options) {
        model.set({ id: null });
      }.bind(this)
    });
  }
});
