window.HappieApp ||= {}
window.HappieApp.Collections ||= {}

window.HappieApp.Collections.Backgrounds = class backgrounds extends Backbone.Collection
  model: window.HappieApp.Models.Background

  initialize: (type)->
    @url = '/backgrounds/'+type
