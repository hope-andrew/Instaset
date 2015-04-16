Instaset.Routers.Router = Backbone.Router.extend({

  initialize: function (options) {
    this.$rootEl = options.$rootEl;
    this.collection = new Instaset.Collections.Photos();
  },

  routes: {
    "": "index",
    "photos/new": "new",
    "photos/:id/edit": "edit",
    "photos/:id": "show",
    "users/:id": "userShow"
  },

  index: function() {
    this.collection.fetch({
      remove: false,
      data: { page:  this.collection.page },
      success: function(){}
    });
    var photoIndex = new Instaset.Views.PhotoIndex({collection: this.collection});
    this._swapView(photoIndex);
  },

  new: function() {

  },

  show: function (id) {
    var photo = this.collection.getOrFetch(id);
    var photoShow = new Instaset.Views.PhotoShow({ model: photo });
    this._swapView(photoShow);

  },

  edit: function() {

  },

  userShow: function(id) {
    user = new Instaset.Models.User({ id: id });
    user.fetch();
    var userShow = new Instaset.Views.userShow({model: user, collection: user.photos()});
    this._swapView(userShow);
  },

  _swapView: function(view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  }

});
