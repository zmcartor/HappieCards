(function() {
  var Background_single, _base,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  window.HappieApp || (window.HappieApp = {});

  (_base = window.HappieApp).Views || (_base.Views = {});

  window.HappieApp.Views.Background_single = Background_single = (function(_super) {

    __extends(Background_single, _super);

    function Background_single() {
      return Background_single.__super__.constructor.apply(this, arguments);
    }

    Background_single.prototype.events = {
      'click button': 'select_bg'
    };

    Background_single.prototype.tagName = 'li';

    Background_single.prototype.className = 'bg_single span4';

    Background_single.prototype.initialize = function() {
      _.bindAll(this);
      this.template = JST['app/templates/background_single'];
      return this.render();
    };

    Background_single.prototype.render = function() {
      this.$el.html(this.template(this.model.toJSON()));
      return this;
    };

    Background_single.prototype.select_bg = function() {
      return HappieApp.EventBus.trigger('backgrounds:selected', this.model);
    };

    return Background_single;

  })(Backbone.View);

}).call(this);
