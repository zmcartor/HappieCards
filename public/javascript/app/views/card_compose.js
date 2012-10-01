(function() {
  var Card_compose, _base,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  window.HappieApp || (window.HappieApp = {});

  (_base = window.HappieApp).Views || (_base.Views = {});

  window.HappieApp.Views.Card_compose = Card_compose = (function(_super) {

    __extends(Card_compose, _super);

    function Card_compose() {
      return Card_compose.__super__.constructor.apply(this, arguments);
    }

    Card_compose.prototype.events = {
      'click button#cancel': 'cancel_bg',
      'click button#save': 'save_card'
    };

    Card_compose.prototype.initialize = function() {
      _.bindAll(this);
      this.background_model = this.options.bg_model;
      this.template = JST['app/templates/card_compose'];
      return this.render();
    };

    Card_compose.prototype.render = function() {
      this.$el.html(this.template(this.background_model.toJSON()));
      return this;
    };

    Card_compose.prototype.save_card = function() {};

    Card_compose.prototype.cancel_bg = function() {
      return window.HappieApp.EventBus.trigger('backgrounds:deselected');
    };

    return Card_compose;

  })(Backbone.View);

}).call(this);
