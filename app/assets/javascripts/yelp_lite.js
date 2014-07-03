window.YelpLite = {
  Models: {},
  Collections: {},
  Subsets: {},
  Views: {},
  Routers: {},
  initialize: function(options) {
    this.currentUser = options.currentUser;
    var data = options.bootstrappedData;

    YelpLite.users = new YelpLite.Collections.Users(data.users,
      { parse: true });
    YelpLite.businesses = new YelpLite.Collections.Businesses(data.business,
      { parse: true });
    YelpLite.reviews = new YelpLite.Collections.Reviews(data.reviews,
      { parse: true });

    new YelpLite.Routers.Router({
      $rootEl: options.$rootEl,
      users: YelpLite.users,
      businesses: YelpLite.businesses,
      reviews: YelpLite.reviews
    });

    Backbone.history.start();
  }
};
