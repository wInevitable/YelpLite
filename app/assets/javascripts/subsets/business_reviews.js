YelpLite.Subsets.BusinessReviews = Backbone.Subset.extend({
  url: function() {
    return "/api/businesses/" + this._business.id + "/reviews";
  },

  initialize: function(model, options) {
    this.business = options.business;
  }
});