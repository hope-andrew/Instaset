Instaset.Models.Photo = Backbone.Model.extend({
  urlRoot: "/api/photos",

  comments: function() {
    if (!this._comments) {
      this._comments = new Instaset.Collections.Comments([], { photo: this});
    }

    return this._comments;
  },

  likes: function() {
    if (!this._likes) {
      this._likes = new Instaset.Collections.Likes();
    }
    return this._likes;
  },

  likeByCurrentUser: function () {
    if (!this._likeByCurrentUser) {
      this._likeByCurrentUser = new Instaset.Models.Like({}, { photo: this });
      this.likes().add(this._likeByCurrentUser);
    }
    return this._likeByCurrentUser;
  },

  parse: function(response) {
    if (response.idOfLikeByCurrentUser) {
      var like = response.idOfLikeByCurrentUser;
      this.likeByCurrentUser().set(like, {parse: true});
      delete response.idOfLikeByCurrentUser;
    }

    if (response.comments) {
      this.comments().set(response.comments, {parse: true});
      delete response.comments;
    }

    if (response.likes) {
      this.likes().set(response.likes, {parse: true});
      delete response.likes;
    }

    return response;
  }
});
