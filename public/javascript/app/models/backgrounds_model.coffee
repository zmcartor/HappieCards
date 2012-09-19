window.HappieApp ||= {}
window.HappieApp.Models ||= {}

window.HappieApp.Models.Background = class Background extends Backbone.Model

  initialize: ()->
    console.log 'background model!!'
