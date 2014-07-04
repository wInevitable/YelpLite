YelpLite.Views.UserShow = Backbone.View.extend({
  tagName: 'section',

  className: 'user-profile',

  template: JST['users/show'],

  events: {

  },

  initialize: function(options) {
    this.user = options.model;
  },

  render: function() {
    var renderedContent = this.template({
      user: this.user
    });
    this.$el.html(renderedContent);
    return this;
  }
});