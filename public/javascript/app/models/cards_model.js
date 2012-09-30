(function() {
  var Card, _base,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  window.HappieApp || (window.HappieApp = {});

  (_base = window.HappieApp).Models || (_base.Models = {});

  window.HappieApp.Models.Card = Card = (function(_super) {

    __extends(Card, _super);

    function Card() {
      return Card.__super__.constructor.apply(this, arguments);
    }

    Card.prototype.urlRoot = '/cards';

    return Card;

  })(Backbone.Model);

}).call(this);
