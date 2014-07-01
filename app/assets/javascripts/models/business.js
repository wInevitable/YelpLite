YelpLite.Models.Business = Backbone.Model.extend({
  initialize: function(options) {
    this.owner = options.owner
  },

  reviews: function() {
   if(!this._reviews) {
     this._reviews = new YelpLite.Collections.Reviews([], { business: this });
   }
   return this._reviews;
  }
});