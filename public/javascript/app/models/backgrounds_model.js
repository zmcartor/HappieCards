(function() {
  var Background, _base,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  window.HappieApp || (window.HappieApp = {});

  (_base = window.HappieApp).Models || (_base.Models = {});

  window.HappieApp.Models.Background = Background = (function(_super) {

    __extends(Background, _super);

    function Background() {
      return Background.__super__.constructor.apply(this, arguments);
    }

    Background.prototype.initialize = function() {
      return console.log('background model!!');
    };

    return Background;

  })(Backbone.Model);

}).call(this);
