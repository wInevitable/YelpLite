YelpLite.Subsets.AuthorReviews = Backbone.Subset.extend({
  url: function() {
    return "/api/users/" + this._author.id + "/reviews";
  },

  initialize: function(model, options) {
    this.author = options.author;
  }
});