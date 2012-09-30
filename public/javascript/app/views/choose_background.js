(function() {
  var Choose_background, _base,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  window.HappieApp || (window.HappieApp = {});

  (_base = window.HappieApp).Views || (_base.Views = {});

  window.HappieApp.Views.Choose_background = Choose_background = (function(_super) {

    __extends(Choose_background, _super);

    function Choose_background() {
      return Choose_background.__super__.constructor.apply(this, arguments);
    }

    Choose_background.prototype.events = {
      'change select#bg_types': 'fetch_backgrounds'
    };

    Choose_background.prototype.initialize = function() {
      _.bindAll(this);
      this.template = JST['app/templates/choose_background'];
      this.collection = new HappieApp.Collections.Backgrounds();
      this.collection.on('reset', this.show_backgrounds);
      return this.render();
    };

    Choose_background.prototype.render = function() {
      this.$el.html(this.template({}));
      return this;
    };

    Choose_background.prototype.fetch_backgrounds = function() {
      var selected;
      $('#background_place ul', this.$el).empty();
      selected = $('select#bg_types', this.el).val();
      this.collection.set_category(selected);
      this.collection.fetch();
      return console.log('hioho');
    };

    Choose_background.prototype.show_backgrounds = function() {
      var _this = this;
      return this.collection.each(function(model) {
        var single_background;
        single_background = new HappieApp.Views.Background_single({
          model: model
        }).el;
        return $('#background_place ul', _this.$el).append(single_background);
      });
    };

    return Choose_background;

  })(Backbone.View);

}).call(this);
