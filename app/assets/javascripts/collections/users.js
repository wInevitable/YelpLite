YelpLite.Collections.Users = Backbone.Collection.extend({
  model: YelpLite.Models.User,

  url: "/api/users/",

  getOrFetch: function(id, callback) {
    var that = this;
    var user = this.get(id);

    if (user) {
      user.fetch({
        success: function() {
          callback(user);
        }
      });
    } else {
      user = new YelpLite.Models.User({ id: id });
      user.collection = YelpLite.users;
          debugger
      user.fetch({
        success: function() {

          YelpLite.users.add(user);
          callback(user);
        }
      });
    }
  }
});