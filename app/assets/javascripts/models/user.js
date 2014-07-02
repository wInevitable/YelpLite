YelpLite.Models.User = Backbone.Model.extend({  
  businesses: function() {
   if(!this._businesses) {
     this._businesses = new YelpLite.Collections.Businesses([], {
       owner: this
     });
   }
   return this._businesses;
  },

  reviews: function() {
   if(!this._reviews) {
     this._reviews = new YelpLite.Collections.Reviews([], {
       author: this
     });
   }
   return this._reviews;
  }
});