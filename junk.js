$('#add-lines').click(function(){

  var grouped = _.groupBy(markerData, function(place) {
    if(place.previous_place_id == null) {
      return 'start'
    } else {
      return 'connected'
    }
  });

  =============================================================
  addLinesToMap(window.map,grouped.start,grouped.connected);
  });

    createPoints = function(markerData,option) {
      console.log(markerData);
      window.dataaa = markerData;
      var startPoints = [];
      var connectedPoints = [];
        for (var i = markerData.length - 1; i >= 0; i--) {
          var place = markerData[i];
            if(place.previous_place_id == null)
              startPoints.push(place);
            else
              connectedPoints.push(place);
        };

        if (option == 'start') {
          return startPoints
        }
        else if (option == 'connect') {
          return connectedPoints
        }
    };