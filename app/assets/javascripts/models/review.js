YelpLite.Models.Review = Backbone.Model.extend({
  initialize: function(options) {
    this.business = options.business;
    this.author = options.author;
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