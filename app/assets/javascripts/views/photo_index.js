Instaset.Views.PhotoIndex = Backbone.CompositeView.extend({

  template: JST["photos/index"],

  className: "photo-index clearfix",

  events: {
    "click button.load-more": "loadMore"
  },

  initialize: function() {
    this.listenTo(this.collection, "sync", this.renderPhotos);
    this.listenTo(this.collection, "add", this.addExtraPhoto);
    // this.listenTo(this.collection, 'add', this.addExtraPhoto);

    var newForm = new Instaset.Views.NewPhotoForm({collection: this.collection});
    this.addSubview("div.sidebar", newForm);
    // this.renderPhotos();
    // this.render();
  },


  render: function () {
    var renderedContent = this.template({  photos: this.collection });
    this.$el.html(renderedContent);

    this.attachSubviews();
    return this;
  },

  renderPhotos: function() {
    $("ul.photo-list").empty();
    this.collection.each(this.addPhoto.bind(this));
  },

  addPhoto: function(photo) {
    var view = new Instaset.Views.PhotoItem({ model: photo });
    this.addSubview("ul.photo-list", view, true);
  },

  addExtraPhoto: function(photo) {
    var view = new Instaset.Views.PhotoItem({ model: photo });
    this.addSubview("ul.photo-list", view, true);
  },

  loadMore: function(event) {
  var view = this;
    if (view.collection.page < view.collection.total_pages) {
      view.collection.fetch({
        data: { page: view.collection.page + 1 },
        remove: false
      });
    }
  }
});
