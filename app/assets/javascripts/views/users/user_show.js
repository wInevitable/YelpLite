YelpLite.Views.UserShow = Backbone.View.extend({
  tagName: 'section',

  className: 'user-profile',

  template: JST['users/show'],

  events: {

  },

  initialize: function(options) {
    this.model = options.user;
  },

  render: function() {
    var renderedContent = this.template({
      user: this.model
    });
    this.$el.html(renderedContent);
    return this;
  }
});