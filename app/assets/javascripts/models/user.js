YelpLite.Models.User = Backbone.Model.extend({
  businesses: function() {
   if (!this._businesses) {
     this._businesses = new YelpLite.Collections.Businesses([], {
       owner: this
     });
   }
   return this._businesses;
  },

  reviews: function() {
   if (!this._reviews) {
     this._reviews = new YelpLite.Collections.Reviews([], {
       author: this
     });
   }
   return this._reviews;
  },

  parse: function(jsonResp) {
    if (jsonResp.reviews) {
      this.reviews().set(jsonResp.reviews, {parse: true});
      delete jsonResp.reviews;
    }
    if (jsonResp.businesses) {
      this.businesses().set(jsonResp.businesses, { parse: true })
      delete jsonResp.businesses;
    }
    return jsonResp;
  }
});