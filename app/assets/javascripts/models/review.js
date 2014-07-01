YelpLite.Models.Business = Backbone.Model.extend({
  initialize: function(options) {
    if options.business {
      this.business = options.business;
    }
    else {
      this.author = options.author;
    }
  },

  validate: function (attributes) {
    if (!attributes || !attributes.rating) {
      return "must have a rating";
    }
    else if (!attributes || !attributes.content || attributes.content == "") {
      return "must have content"
    }
  }
});