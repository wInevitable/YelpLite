window.YelpLite = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {

    // !!!!might have to fetch in success callbacks...hell!
    YelpLite.users = new YelpLite.Collections.Users();
    YelpLite.users.fetch();

    YelpLite.businesses = new YelpLite.Collections.Businesses();
    YelpLite.businesses.fetch();

    YelpLite.reviews = new YelpLite.Collections.Reviews();
    YelpLite.reviews.fetch();

    new YelpLite.Routers.Router({
      $rootEl: $('#content'),
      users: YelpLite.users,
      businesses: YelpLite.businesses,
      reviews: YelpLite.reviews
    });
    Backbone.history.start();
  }
};

$(document).ready(function(){
  YelpLite.initialize();
});
