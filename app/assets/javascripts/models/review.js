YelpLite.Models.Review = Backbone.Model.extend({
  url: function () {
    if (this.id) {
      return "api/reviews/" + this.id;
    }
    else {
      return "api/businesses/" + this.escape('business_id') + "/reviews";
    }
  },

  initialize: function(options) {
    // this.author = options.author;
    // this.business = options.business;
  },

  parse: function(jsonResp) {
    if (jsonResp.author) {
      this.author().set(jsonResp.author, { parse: true });
      delete jsonResp.author;
    }
    // else if (jsonResp.author_id) {
    //   var that = this;
    //   var author = new YelpLite.Models.User({ id: jsonResp.author_id });
    //
    //   author.fetch({
    //     success: function() {
    //       debugger
    //       that.author().set(author, { parse: true });
    //       delete jsonResp.author_id;
    //     }
    //   });
    // }
    if (jsonResp.business) {
      this.business().set(jsonResp.business, { parse: true });
      delete jsonResp.business;
    }
    // else if (jsonResp.business_id) {
  //     var that = this;
  //     var business = new YelpLite.Models.Business({ id: jsonResp.business_id });
  //
  //     business.fetch({
  //       success: function() {
  //         debugger
  //         that.business().set(business, { parse: true });
  //         delete jsonResp.business_id;
  //       }
  //     });
  //   }

    return jsonResp;
  },

  business: function() {
    if (!this._business) {
      this._business = new YelpLite.Models.User();
      this.collection = this._business.reviews();
      this._business.reviews().add(this);
    }
    return this._business;
  },

  author: function() {
    if (!this._author) {
      this._author = new YelpLite.Models.User();
      this.collection = this._author.reviews();
      this._author.reviews().add(this);
    }
    return this._author;
  },

  validate: function (attributes) {
    if (!attributes || !attributes.rating) {
      return "must have a rating";
    }
    else if (!attributes || !attributes.content || attributes.content == "") {
      return "must have content"
    }
  }
});