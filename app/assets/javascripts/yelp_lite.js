window.YelpLite = {
  Models: {},
  Collections: {},
  Subsets: {},
  Views: {},
  Routers: {},
  initialize: function(options) {
    this.currentUser = options.currentUser;
    var data = options.bootstrappedData;

    this.users = new this.Collections.Users(data.users,
      { parse: true });
    this.businesses = new this.Collections.Businesses(data.business,
      { parse: true });
    this.reviews = new this.Collections.Reviews(data.reviews,
      { parse: true });

    new YelpLite.Routers.Router({
      $rootEl: options.$rootEl,
      users: this.users,
      businesses: this.businesses,
      reviews: this.reviews
    });

    Backbone.history.start();
  }
};
