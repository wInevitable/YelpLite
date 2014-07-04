YelpLite.Models.User = Backbone.Model.extend({
  url: function() {
    return "/api/users/" + this.id;
  },

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
     this._reviews = new YelpLite.Subsets.AuthorReviews([], {
       author: this,
       parse: true,
       parentCollection: new YelpLite.Collections.Reviews()
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