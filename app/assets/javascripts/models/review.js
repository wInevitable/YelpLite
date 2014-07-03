YelpLite.Models.Review = Backbone.Model.extend({
  initialize: function(options) {
    this.author = options.author;
    this.business = options.business;
  },

  parse: function(jsonResp) {
    if (jsonResp.author) {
      this.author().set(jsonResp.author, { parse: true })
      delete jsonResp.author;
    }
    if (jsonResp.business) {
      this.business().set(jsonResp.business, { parse: true })
      delete jsonResp.business;
    }
    return jsonResp;
  },

  business: function() {
    if (!this._business) {
      this._business = new YelpLite.Models.User();
      this.collection = this._business.reviews();
      this._business.reviews().add(this);
    }
    return this._business;
  },

  author: function() {
    if (!this._author) {
      this._author = new YelpLite.Models.User();
      this.collection = this._author.reviews();
      this._author.reviews().add(this);
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