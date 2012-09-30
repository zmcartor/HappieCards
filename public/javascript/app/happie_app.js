(function() {
  var HappieApp, Router,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  window.HappieApp || (window.HappieApp = {});

  window.HappieApp.EventBus = {};

  _.extend(window.HappieApp.EventBus, Backbone.Events);

  window.HappieApp.Router = Router = (function(_super) {

    __extends(Router, _super);

    function Router() {
      return Router.__super__.constructor.apply(this, arguments);
    }

    Router.prototype.routes = {
      'choose_background': 'choose_background',
      'history': 'history',
      'compose': 'compose'
    };

    Router.prototype.initialize = function() {
      console.log('created!!!!');
      return this.hanger$ = $('#hanger');
    };

    Router.prototype.choose_background = function() {
      var our_view;
      console.log('show_backgrounds');
      this.hanger$.empty();
      our_view = new window.HappieApp.Views.Choose_background();
      return this.hanger$.append(our_view.el);
    };

    Router.prototype.compose = function() {
      var card_compose_view;
      console.log('compose card');
      this.hanger$.empty();
      return card_compose_view = new window.HappieApp.Views.Card_compose({
        model: window.App.bg_model
      });
    };

    Router.prototype.history = function() {
      return console.log('history!!');
    };

    return Router;

  })(Backbone.Router);

  window.HappieApp.App = HappieApp = (function() {

    function HappieApp() {
      this.background_unchose = __bind(this.background_unchose, this);

      this.background_chosen = __bind(this.background_chosen, this);
      console.log('new app!!');
      this.router = new window.HappieApp.Router;
      this.selected_background = void 0;
      window.HappieApp.EventBus.on('backgrounds:selected', this.background_chosen);
      window.HappieApp.EventBus.on('backgrounds:deselected', this.background_unchose);
      Backbone.history.start();
    }

    HappieApp.prototype.background_chosen = function(bg_model) {
      this.bg_model = bg_model;
      this.selected_background = this.bg_model;
      console.log('chosen bg!');
      return this.router.navigate("/compose", true);
    };

    HappieApp.prototype.background_unchose = function() {
      this.selected_background = void 0;
      return console.log('unchosen!!');
    };

    HappieApp.prototype.start = function() {
      return this.router.navigate("/choose_background", true);
    };

    return HappieApp;

  })();

}).call(this);
