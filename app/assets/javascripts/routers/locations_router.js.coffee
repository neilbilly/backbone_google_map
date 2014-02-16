class BackboneGoogleMap.Routers.Locations extends Backbone.Router
  routes:
    '': 'index'

  initialize: ->
    @collection = new BackboneGoogleMap.Collections.Locations()
    @collection.fetch({reset:true})

  index: ->
    view = new BackboneGoogleMap.Views.LocationsIndex(collection: @collection)
    $('#container').html(view.render().el)
