(function() {
  var backgrounds, _base,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  window.HappieApp || (window.HappieApp = {});

  (_base = window.HappieApp).Collections || (_base.Collections = {});

  window.HappieApp.Collections.Backgrounds = backgrounds = (function(_super) {

    __extends(backgrounds, _super);

    function backgrounds() {
      return backgrounds.__super__.constructor.apply(this, arguments);
    }

    backgrounds.prototype.model = window.HappieApp.Models.Background;

    backgrounds.prototype.url = function() {
      return '/backgrounds/category/' + this.type;
    };

    backgrounds.prototype.set_category = function(type) {
      return type = type;
    };

    return backgrounds;

  })(Backbone.Collection);

}).call(this);
