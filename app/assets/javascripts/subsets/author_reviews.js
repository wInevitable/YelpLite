YelpLite.Subsets.AuthorReviews = Backbone.Subset.extend({
  model: YelpLite.Models.Review,

  url: function() {
    return "/api/users/" + this.author.id + "/reviews";
  },

  initialize: function(model, options) {
    this.author = options.author;
  }
});