#our main namespace
window.HappieApp or = {}

#our main event bus
window.HappieApp.EventBus = {}
_.extend(window.HappieApp.EventBus, Backbone.Events)

window.HappieApp.Router = class Router extends Backbone.Router
  routes:
    'choose_background': 'choose_background',
    'history' : 'history',
    'compose' : 'compose'

  initialize: ()->
   console.log 'created!!!!'
   @hanger$ = $('#hanger')

  choose_background: ()->
    console.log 'show_backgrounds'
    @hanger$.empty()
    our_view = new window.HappieApp.Views.Choose_background()
    @hanger$.append(our_view.el)

  compose: ()->
    console.log 'compose card'
    @hanger$.empty()
    #when a background is chosen, App instance will keep track of it
    card_compose_view = new window.HappieApp.Views.Card_compose(model: window.App.bg_model)

  history: ()->
    console.log 'history!!'


#Our Main APP driver. Regular CoffeeScript Class
window.HappieApp.App = class HappieApp

  constructor: ()->
    console.log 'new app!!'
    @router = new window.HappieApp.Router
    @selected_background = undefined

    #setup various event listeners
    window.HappieApp.EventBus.on('backgrounds:selected', @background_chosen)
    window.HappieApp.EventBus.on('backgrounds:deselected',@background_unchose)

    Backbone.history.start()

  #fat arrow, bind to 'this' and not in context of event handler
  background_chosen: (@bg_model)=>
    @selected_background = @bg_model
    console.log 'chosen bg!'
    @router.navigate "/compose", true

  background_unchose: ()=>
    @selected_background = undefined
    console.log 'unchosen!!'

  start:()->
    @router.navigate "/choose_background", true
