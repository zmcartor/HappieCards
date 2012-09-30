window.HappieApp ||= {}
window.HappieApp.Models ||= {}

window.HappieApp.Models.Card = class Card extends Backbone.Model
  urlRoot: '/cards'
