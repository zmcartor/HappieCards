window.HappieApp or = {}

window.HappieApp.Router = class Router extends Backbone.Router
  routes:
    'choose_background': 'choose_background',
    'history' : 'history'

  initialize: ()->
   console.log 'created!!!!'
   @hanger$ = $('#hanger')

  choose_background: ()->
    console.log 'show_backgrounds'
    our_view = new HappieApp.Views.Choose_background()
    @hanger$.append(our_view.el)

  history: ()->
    console.log 'history!!'

window.HappieApp.App = () ->
  @router = new window.HappieApp.Router
  Backbone.history.start();
  @router.navigate "/choose_background", true
