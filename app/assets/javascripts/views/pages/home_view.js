YelpLite.Views.HomeView = Backbone.View.extend({
  tagName: 'section',

  className: 'home-content',

  template: JST['pages/home'],

  events: {
    "submit .review-form": "submit"
  },

  initialize: function(options) {
    this.model = options.business;
    this.collection = options.reviews;
    this.lastReview = options.lastReview;
  },

  render: function() {
    var renderedContent = this.template({
      business: this.model,
      reviews: this.collection
    });
    this.$el.html(renderedContent);
    return this;
  },

  submit: function(event) {
    var that = this;
    event.preventDefault();
    var formData = $(event.target).serializeJSON();

    this.review = new YelpLite.Models.Review({
      id: (this.lastReview.id + 1),
      author_id: YelpLite.currentUser.id,
      business_id: this.model.id
    });
    this.review.set(formData.review);
    //set to author's collection?
    //remove last from collection first to only display five?
    // YelpLite.reviews.pop();
    this.review.collection = YelpLite.reviews;

    this.review.save({ wait: true }, {
      success: function() {
        that.lastReview = that.review;
        that.review.fetch();
        Backbone.history.navigate("#/", { trigger: true });
      }
    });
  }
});