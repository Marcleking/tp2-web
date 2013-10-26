function afficherCacherKml() {
	if (typeof layerKml == "undefined") {
		layerKml = new google.maps.KmlLayer({url: 'http://novitec.ca/map/donnees-ouvertes/rtc-trajets-kml.kml'});
	}

	if (typeof layerKml.map == "undefined")
	{ 
		layerKml.setMap(carte);
	} else {
		layerKml.setMap(undefined);
	}
}