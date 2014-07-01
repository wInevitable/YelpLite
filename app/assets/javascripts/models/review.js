YelpLite.Models.Business = Backbone.Model.extend({
  initialize: function(options) {
    if options.business {
      this.business = options.business;
    }
    else {
      this.author = options.author;
    }
  }
});