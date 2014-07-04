YelpLite.Models.Business = Backbone.Model.extend({
  url: function () {
    return "/api/businesses/" + this.id;
  },

  owner: function() {
    if (!this._owner) {
      this._owner = new YelpLite.Models.User();
      this.collection = this._owner.businesses();
      this._owner.businesses().add(this);
    }
    return this._owner;
  },

  reviews: function() {
   if (!this._reviews) {
     this._reviews = new YelpLite.Subsets.BusinessReviews([], {
       business: this,
       parse: true,
       parentCollection: new YelpLite.Collections.Reviews()
     });
   }
   return this._reviews;
  },

  parse: function(jsonResp) {
    if (jsonResp.owner) {
      this.owner().set(jsonResp.owner, { parse: true });
      delete jsonResp.owner;
    }
    if (jsonResp.reviews) {
      this.reviews().set(jsonResp.reviews, { parse: true });
      delete jsonResp.reviews;
    }
    return jsonResp;
  },

  validate: function (attributes) {
    if (!attributes || !attributes.name || attributes.name == "") {
      return "must have a name";
    }
    else if (!attributes || !attributes.address || attributes.address == "") {
      return "must have an address"
    }
    else if (!attributes || !attributes.city_state_zip || attributes.city_state_zip == "") {
      return "must have a city state and/or zip"
    }
  }
});