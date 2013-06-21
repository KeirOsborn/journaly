grouped = function(markerData){
  var grouped =_.groupBy(markerData, function(place) {
      if(place.previous_place_id == null) {
        return 'start'
        }
      else {
        return 'connected'
        }
      });
  return grouped;
  };

addLinesToMap = function(map,startPoints,connectedPoints) {
var lineCoordinates = [];
var group=[];
var arrayConnectedPlaces =[]

for (var k = (startPoints.length - 1); k >= 0; k--) {
    var place = startPoints[k];
    console.log(place);

    arrayConnectedPlaces.push(new google.maps.LatLng(place.latitude, place.longitude));

      if (place.next_place_id !== null)
        {
          for (var j = 0 ; j <= connectedPoints.length-1; j++) {
            currentPlace = connectedPoints[j];
            if(currentPlace.placeId == place.next_place_id)
              {
              arrayConnectedPlaces.push(new google.maps.LatLng(currentPlace.latitude, currentPlace.longitude));
              place = currentPlace;
              var j = -1
              console.log(currentPlace);
              };
          };

          if (place.next_place_id == null){
            j = connectedPoints.length
          }
        };

    group.push(arrayConnectedPlaces.slice(0));
    var arrayConnectedPlaces =[];
};


    var lineSymbol = {
    path: 'M 0,-1 0,1',
    strokeOpacity: 1,
    scale: 4
    };

    var lineSymbol = {
      path: google.maps.SymbolPath.FORWARD_CLOSED_ARROW
    };

    window.polyLines = []
    var color = "#0027F0"
    for (var x = group.length - 1; x >= 0; x--) {
      var line = new google.maps.Polyline({
      path: group[x],
      strokeColor: color,
      strokeOpacity: 1.0,
      strokeWeight: 1.5,
      icons: [{
          icon: lineSymbol,
          repeat: '150px',
          offset: '100%',
        }],
      });
      line.setMap(window.map);
      switch (color) {
        case "#0027F0":
               color = "#009938";
               break;
        case "#009938":
               color = "#FF0000";
               break;
        case "#FF0000":
               color = "#000000";
               break;
        case "#000000":
               color = "#F5FF37";
               break;
        case "#F5FF37":
               color = "#0027F0";
               break;
        };

      polyLines.push(line);

      animateCircle(x);

      function animateCircle(id) {
            var count = 0;
            offsetId = window.setInterval(function () {
            count = (count + 1) % 200;

            var icons = polyLines[id].get('icons');
            icons[0].offset = (count / 10) + '%';
            polyLines[id].set('icons', icons);
          }, 50);
      };
    };

  };

startUp = function() {
    window.map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
    addPlacesToMap(window.map);
    calculateMapZoomLevel(window.map);
  };

  var markerData = window.markerData;

  window.markersOnMap = [];
  var mapOptions = {
    zoom: 10,
    mapTypeId: google.maps.MapTypeId.TERRAIN,
  };

  addMarker = function(map, latLong, place) {
    var marker = new google.maps.Marker({
        position: latLong,
        map: map,
        title: place.name,
        url: "../trips/"+place.tripId+"/places/"+place.placeId
      });
    markersOnMap.push(name);
    google.maps.event.addListener(marker, 'click', function(){
      window.location.href = this.url;
    });
    return marker;

  };

  latLangList = function() {
    var LatLngList = new Array
    //  Create a new viewpoint bound
    for (var i = markerData.length - 1; i >= 0; i--) {
      var place = markerData[i];
      LatLngList.push(new google.maps.LatLng(place.latitude,place.longitude));
    };
    return LatLngList;
  };

  calculateMapZoomLevel = function(map) {
    var LatLngList = latLangList();

    //  Create a new viewpoint bound
    var bounds = new google.maps.LatLngBounds();
    //  Go through each...
    for (var i = 0, LtLgLen = LatLngList.length; i < LtLgLen; i++) {
    //  And increase the bounds to take this point
      bounds.extend (LatLngList[i]);
    }
    //  Fit these bounds to the map
    map.fitBounds (bounds);
  };

  addPlacesToMap = function(map) {
    for (var i = markerData.length - 1; i >= 0; i--) {
      var place = markerData[i];
      var placeLatLong = new google.maps.LatLng(place.latitude, place.longitude);
      var marker = addMarker(map, placeLatLong, place);
    };
  };