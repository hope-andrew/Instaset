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
      this._likes = new Instaset.Collections.Likes([], { photo: this });
    }
    return this._likes;
  },

  likeByCurrentUser: function () {
    if (!this._likeByCurrentUser) {
      this._likeByCurrentUser = new Instaset.Models.Like({}, { photo: this });
    }
    return this._likeByCurrentUser;
  },

  parse: function(response) {
    if (response.comments) {
      this.comments().set(response.comments, {parse: true});
      delete response.comments;
    }

    if (response.likes) {
      this.likes().set(response.likes, {parse: true});
      delete response.likes;
    }

    if (response.idOfLikeByCurrentUser) {
      var like = response.idOfLikeByCurrentUser;
      this.likeByCurrentUser().set(like[like.length - 1], {parse: true});
    }
    return response;
  }
});
