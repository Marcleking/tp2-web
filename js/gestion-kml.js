com.dinfogarneau.cours526.afficherCacherKml = function () {
	if (typeof com.dinfogarneau.cours526.layerKml == "undefined") {
		com.dinfogarneau.cours526.layerKml = new google.maps.KmlLayer({url: 'http://novitec.ca/map/donnees-ouvertes/rtc-trajets-kml.kml'});
	}

	if (typeof com.dinfogarneau.cours526.layerKml.map == "undefined") { 
		com.dinfogarneau.cours526.layerKml.setMap(com.dinfogarneau.cours526.carte);
	} else {
		com.dinfogarneau.cours526.layerKml.setMap(undefined);
	}
};