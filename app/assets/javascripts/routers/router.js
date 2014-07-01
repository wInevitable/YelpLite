YelpLite.Routers.Router = Backbone.Router.extend({
  initialize: function(options) {
    this.$rootEl = options.$rootEl;
    this.users = options.users;
    this.businesses = options.businesses;
    this.reviews = options.reviews;
  },

  routes: {
    '': 'home',
    'users/:id': 'userShow',
    'users/:id/edit': 'userEdit',
    'businesses/new': 'businessNew',
    'businesses/:id': 'businessShow',
    'businesses/:id/edit': 'businessEdit',
    // 'reviews': 'reviewIndex',
    // 'businesses/:id/reviews/new': 'reviewNew',
    // 'reviews/:id': 'reviewShow',
    // 'reviews/:id/edit': 'reviewEdit',
    // 'reviews/:id/delete': 'reviewDelete',
    // 'reviews/:id/destroy': 'reviewDestroy'
  },

  home: function() {
    debugger
    var homeView = new YelpLite.Views.Home({
      business: x, // random business to review
      reviews: x// 5 most recent reviews
    });
    this._swapView(homeView);
  },

  userShow: function(id) {

  },

  userEdit: function(id) {

  },

  // Code duplicated in collections...delete if not needed
  // _getUser: function(id, callback) {
  //   var that = this;
  //   var user = YelpLite.users.get(id);
  //
  //   if (!user) {
  //     user = new YelpLite.Models.User({
  //       id: id
  //     });
  //     user.collection = this.users;
  //     user.fetch({
  //       success: function() {
  //         that.users.add(user);
  //         callback(user);
  //       }
  //     });
  //   }
  //   else {
  //     callback(user);
  //   }
  // },

  _swapView: function(view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  }
});