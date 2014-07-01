YelpLite.Collections.Businesses = Backbone.Collection.extend({
  model: YelpLite.Models.Business,

  url: "/api/businesses",

  initialize: function(options) {
    this.owner = options.owner
  },

  comparator: function(business) {
    return business.get('rating');
  },

  //save for later. can be used with any attribute
  findByRating: function(rating) {
    return this.filter(function(business) {
      return business.get('rating') == rating;
    });
  },

  getOrFetch: function(id, callback) {
    var that = this;
    var business = this.get(id);

    if (business) {
      callback(business);
      // business.fetch({
 //        success: function() {
 //          callback(business);
 //        }
 //      });
    } else {
      business = new YelpLite.Models.Business({
        id: id,
        owner: that.owner
      });
      business.collection = that.owner.businesses;
      business.fetch({
        success: function() {
          that.owner.businesses.add(business);
          YelpLite.businesses.add(business);
          callback(business);
        }
      });
    }
  }
});