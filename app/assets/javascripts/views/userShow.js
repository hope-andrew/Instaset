Instaset.Views.userShow = Backbone.View.extend({
  template: JST["users/show"],

  initialize: function() {

    this.listenTo(this.model, "sync", this.render);
    this.listenTo(this.collection, "sync", this.render);
    // this.listenTo(this.model.likes(), "sync add remove", this.render);
  },

  // events: {
  //   "click .like": "like"
  // },

  render: function() {
    var renderedContent = this.template({user: this.model, photos: this.collection});
    this.$el.html(renderedContent);
    return this;
  },

  // like: function(event) {
  //   debugger
  //   var newLike = new Instaset.Models.like();
  //   newLike.set({
  //     liker: Instaset.currentUser.id,
  //     liked_photo: 17
  //   });
  //
  //   newLike.save({}, {
  //     success: function(model, response, options) {
  //       this.model.likes().add(newLike);
  //     }.bind(this)
  //   });
  // }

});
