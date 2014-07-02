YelpLite.Routers.Router = Backbone.Router.extend({
  initialize: function(options) {
    this.$rootEl = options.$rootEl;
    this.users = options.users;
    this.businesses = options.businesses;
    this.reviews = options.reviews;
  },

  routes: {
    '': 'home',
  },

  home: function() {
    var homeView = new YelpLite.Views.HomeView({
      business: this.businesses, // random business to review
      reviews: this.reviews // 5 most recent reviews
    });
    this._swapView(homeView);
  },

  _swapView: function(view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  }
});