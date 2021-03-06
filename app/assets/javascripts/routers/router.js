YelpLite.Routers.Router = Backbone.Router.extend({
  initialize: function(options) {
    this.$rootEl = options.$rootEl;
    this.users = options.users;
    this.businesses = options.businesses;
    this.reviews = options.reviews;
  },

  routes: {
    '': 'home',
    'users/:id': 'userShow'
  },

  home: function() {
    var homeView = new YelpLite.Views.HomeView({
      business: this.businesses.first(), // random business to review
      reviews: this.reviews, // 5 most recent reviews
    });
    this._swapView(homeView);
  },

  userShow: function(id) {
    var that = this;

    YelpLite.users.getOrFetch(id, function(user) {
      var userShow = new YelpLite.Views.UserShow({ model: user });
      that._swapView(userShow);
    });
  },

  _swapView: function(view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  }
});