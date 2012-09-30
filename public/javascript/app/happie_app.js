(function() {
  var Router,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  window.HappieApp || (window.HappieApp = {});

  window.HappieApp.Router = Router = (function(_super) {

    __extends(Router, _super);

    function Router() {
      return Router.__super__.constructor.apply(this, arguments);
    }

    Router.prototype.routes = {
      'choose_background': 'choose_background',
      'history': 'history'
    };

    Router.prototype.initialize = function() {
      console.log('created!!!!');
      return this.hanger$ = $('#hanger');
    };

    Router.prototype.choose_background = function() {
      var our_view;
      console.log('show_backgrounds');
      our_view = new HappieApp.Views.Choose_background();
      return this.hanger$.append(our_view.el);
    };

    Router.prototype.history = function() {
      return console.log('history!!');
    };

    return Router;

  })(Backbone.Router);

  window.HappieApp.App = function() {
    this.router = new window.HappieApp.Router;
    Backbone.history.start();
    return this.router.navigate("/choose_background", true);
  };

}).call(this);
