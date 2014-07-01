YelpLite.Models.Business = Backbone.Model.extend({
  owner: function(model) {
    if (!this._owner) {
      this._owner = model;
      this.collection = model.businesses;
      model.businesses.add(this);
    }
    return this._owner;
  },

  reviews: function() {
   if(!this._reviews) {
     this._reviews = new YelpLite.Collections.Reviews([], {
       business: this,
     });
   }
   return this._reviews;
  },

  validate: function (attributes) {
    if (!attributes || !attributes.name || attributes.name == "") {
      return "must have a name";
    }
    else if (!attributes || !attributes.address || attributes.address == "") {
      return "must have an address"
    }
    else if (!attributes || !attributes.city_state_zip || attributes.city_state_zip == "") {
      return "must have a city state and/or zip"
    }
  }
});