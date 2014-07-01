YelpLite.Views.Home = Backbone.View.extend({
  // tagName

  template: JST["home"],

  //events -> build out corresponding functions

  initialize: function(options) {
    this.business = options.business,
    this.reviews = options.reviews
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