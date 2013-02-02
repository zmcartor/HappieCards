window.HappieApp ||= {}
window.HappieApp.Views ||= {}

window.HappieApp.Views.Choose_background = class Choose_background extends Backbone.View

  events:
    'change select#bg_types' : 'fetch_backgrounds'

  initialize: ()->
    _.bindAll @, 'fetch_backgrounds'
    @template = JST['app/templates/choose_background']
    @collection =new HappieApp.Collections.Backgrounds()
    @collection.on 'reset' , @show_backgrounds
    @render()

  render: ()->
    @$el.html(@template({}))
    @

  fetch_backgrounds: ()->
    $('#background_place ul' , @$el).empty()
    selected = $('select#bg_types' , @el).val()
    @collection.set_category(selected)
    @collection.fetch()

  show_backgrounds: ()->
    @collection.each((model) =>
      single_background = new HappieApp.Views.Background_single(model: model).el
      $('#background_place ul' , @$el).append(single_background)
    )
