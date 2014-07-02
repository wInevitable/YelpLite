YelpLite.Models.Review = Backbone.Model.extend({
  initialize: function(options) {
    this.author = options.author;
    this.business = options.business;
  },
  
  business: function(model) {
    if (!this._business) {
      this._business = model;
      this.collection = model.reviews;
      model.reviews.add(this);
    }
    return this._business;
  },

  author: function(model) {
    if (!this._author) {
      this._author = model;
      this.collection = model.reviews;
      model.reviews.add(this);
    }
    return this._author;
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