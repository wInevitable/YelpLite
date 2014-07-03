YelpLite.Collections.Reviews = Backbone.Collection.extend({
  model: YelpLite.Models.Review,

  initialize: function(options) {
    this.author = options.author;
    this.business = options.business;
  },

  url: function() {
     return "/api/businesses/" + this.business.id + "/reviews";
  },

  comparator: function(review) {
    return -review.get('created_at');
  },

  //save for later. can be used with any attribute
  findByBusiness: function(business) {
    return this.filter(function(review) {
      return review.get('business') == business;
    });
  },

  getOrFetch: function(id, callback) {
    var that = this;
    var review = this.get(id);

    if (review) {
      review.fetch({
        success: function() {
          callback(review);
        }
      });
    }
    else if (that.business) {
      //set business
      review = new YelpLite.Models.Review({
        id: id,
        business: that.business,
        author: null
      });
      review.collection = that.business.reviews;
      review.fetch({
        success: function() {
          that.business.reviews.add(review);
          YelpLite.reviews.add(review);
          callback(review);
        }
      });
    }
    else {
      //set author
      review = new YelpLite.Models.Review({
        id: id,
        author: that.author,
        business: null
      });
      review.collection = that.author.reviews;
      review.fetch({
        success: function() {
          that.author.reviews.add(review);
          YelpLite.reviews.add(review);
          callback(review);
        }
      });
    }
  }
});