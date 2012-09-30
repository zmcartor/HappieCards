window.HappieApp ||= {}
window.HappieApp.Collections ||= {}

window.HappieApp.Collections.Backgrounds = class backgrounds extends Backbone.Collection
  model: window.HappieApp.Models.Background
  url: ()->'/backgrounds/category/'+@type

  set_category: (type)->
    @type = type
