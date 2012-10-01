window.HappieApp ||= {}
window.HappieApp.Views ||= {}

window.HappieApp.Views.Card_compose = class Card_compose extends Backbone.View

  events:
    'click button#cancel' : 'cancel_bg'
    'click button#save' :'save_card'

  initialize: () ->
    _.bindAll @
    @background_model = @options.bg_model
    @template = JST['app/templates/card_compose']
    @render()

  render: ()->
    @$el.html(@template(@background_model.toJSON()))
    @

  save_card: ()->
    #do REST call for card, set background_id

  cancel_bg: ()->
    window.HappieApp.EventBus.trigger('backgrounds:deselected')
