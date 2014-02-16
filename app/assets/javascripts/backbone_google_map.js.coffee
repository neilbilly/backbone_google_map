window.BackboneGoogleMap =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    new BackboneGoogleMap.Routers.Locations()
    Backbone.history.start()

$(document).ready ->
  BackboneGoogleMap.initialize()
