YelpLite.Views.HomeView = Backbone.View.extend({
  tagName: 'section',

  className: 'home-content',

  template: JST['pages/home'],

  events: {
    
  },

  initialize: function(options) {
    this.business = options.business;
    this.reviews = options.reviews;
  },

  render: function() {
    var renderedContent = this.template({
      business: this.business,
      reviews: this.reviews
    });
    this.$el.html(renderedContent);
    return this;
  }
});