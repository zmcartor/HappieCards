window.HappieApp ||= {}
window.HappieApp.Views ||= {}

window.HappieApp.Views.Background_single = class Background_single extends Backbone.View

  events:
    'click button': 'select_bg'

  tagName: 'li'
  className: 'bg_single span4'

  initialize: ()->
    _.bindAll @
    @template = JST['app/templates/background_single']
    @render()

  render: ()->
    @$el.html(@template(@model.toJSON()))
    @

  select_bg: ()->
    HappieApp.EventBus.trigger('backgrounds:selected' , @model)


