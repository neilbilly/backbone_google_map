class BackboneGoogleMap.Views.LocationsIndex extends Backbone.View

  template: JST['locations/index']

  initialize: ->
    @collection.on('reset', @render, this)

  initial_map: ->
    mapOptions = 
      zoom: 12,
      center: new google.maps.LatLng(51.5467193, -0.1587057)
      panControl: true,
      panControlOptions: { position: google.maps.ControlPosition.BOTTOM_CENTER }, 
      zoomControl: true, 
      zoomControlOptions: { style: google.maps.ZoomControlStyle.VERTICAL_BAR, position: google.maps.ControlPosition.RIGHT_CENTER },
      mapTypeControl: true
      mapTypeControlOptions: { style: google.maps.MapTypeControlStyle.VERTICAL_BAR, position: google.maps.ControlPosition.RIGHT_BOTTOM }
      scaleControl: true, 
      streetViewControl: true, streetViewControlOptions: { position: google.maps.ControlPosition.RIGHT_CENTER }
    
    domElement = @$('#map')
    map = new google.maps.Map(domElement.get(0),mapOptions)

    addInfoWindow = (marker, infowindow) ->
      google.maps.event.addListener marker, 'click', ->
        infowindow.open map, marker
    
    for model in @collection.models    
      latlng = new google.maps.LatLng model.get('latitude'), model.get('longitude')
      marker = new google.maps.Marker position: latlng, map: map
      address = model.get('address')
      infowindow = new google.maps.InfoWindow content: model.get('address')
      addInfoWindow marker, infowindow


  render: ->
    $(@el).html(@template(locations: @collection)) 
    @initial_map(@template(locations: @collection))
    this
