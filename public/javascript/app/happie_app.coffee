window.HappieApp or = {}

window.HappieApp.Router = class Router extends Backbone.Router
  routes:
    'home': 'home',
    'history' : 'history'

  initialize: ()->
   console.log 'created!!!!'

  home: ()->
    console.log 'home!!'

  history: ()->
    console.log 'history!!'

window.HappieApp.App = () ->
  @router = new window.HappieApp.Router
  Backbone.history.start();
