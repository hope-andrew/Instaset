Instaset.Views.PhotoIndex = Backbone.CompositeView.extend({

  template: JST["photos/index"],

  initialize: function() {
    this.listenTo(this.collection, "sync", this.render);
    this.listenTo(this.collection, 'add', this.addPhoto);

    var newForm = new Instaset.Views.NewPhotoForm({collection: this.collection});
    this.addSubview("div.sidebar", newForm);
    this.renderPhotos();
  },


  render: function () {
    // this.collection.sort();
    var renderedContent = this.template({  photos: this.collection });
    this.$el.html(renderedContent);

    this.attachSubviews();
    return this;
  },

  renderPhotos: function() {
    this.collection.each(this.addPhoto.bind(this));
  },

  addPhoto: function(photo) {
    var view = new Instaset.Views.PhotoItem({ model: photo });
    this.unshiftSubview("ul.photo-list", view);
  }
});
