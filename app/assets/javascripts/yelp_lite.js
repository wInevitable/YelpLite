window.YelpLite = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function(options) {
    this.currentUserID = options.currentUserID;
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
