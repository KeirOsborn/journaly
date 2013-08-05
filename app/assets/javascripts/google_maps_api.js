// Google Maps API //



  window.markersOnMap = [];

  function initialize() {

    for (var i = markerData.length - 1; i >= 0; i--) {
      var place = markerData[i];
      var placeLatLong = new google.maps.LatLng(place.latitude, place.longitude);
      };

    var mapOptions = {
      center: new google.maps.LatLng(place.latitude, place.longitude ),
      zoom: 10,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };

    window.map = new google.maps.Map(document.getElementById('map-canvas'),
      mapOptions);

    for (var i = markerData.length - 1; i >= 0; i--) {
      var place = markerData[i];
      var placeLatLong = new google.maps.LatLng(place.latitude, place.longitude);
      var marker = new google.maps.Marker({
        position: placeLatLong,
        map: window.map,
        title: place.name
      });

      var infowindow = new google.maps.InfoWindow({
        content: place.name
      });
      markersOnMap.push(place.name);
    };

    var LatLngList = new Array
    //  Create a new viewpoint bound
    for (var i = markerData.length - 1; i >= 0; i--) {
      var place = markerData[i];
      LatLngList.push(new google.maps.LatLng(place.latitude,place.longitude));
    }
    //  Create a new viewpoint bound
    var bounds = new google.maps.LatLngBounds ();
    //  Go through each...
    for (var i = 0, LtLgLen = LatLngList.length; i < LtLgLen; i++) {
    //  And increase the bounds to take this point
      bounds.extend (LatLngList[i]);
    }
    //  Fit these bounds to the map
    map.fitBounds (bounds);
  };
