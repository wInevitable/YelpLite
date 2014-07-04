YelpLite.Subsets.BusinessReviews = Backbone.Subset.extend({
  model: YelpLite.Models.Review,

  url: function() {
    return "/api/businesses/" + this.business.id + "/reviews";
  },

  initialize: function(model, options) {
    this.business = options.business;
  }
});