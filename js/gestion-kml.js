/************************************************
	Bouchard-Marceau, Marc-Antoine
	Ouellet, Francis
	
	gestion-kml.js
	Dernière modification : 2013-10-27
************************************************/

// Permet d'afficher ou de cacher la couche KML 
com.dinfogarneau.cours526.afficherCacherKml = function () {
	// Définit la couche KML si elle n'existe pas
	if (typeof com.dinfogarneau.cours526.layerKml == "undefined") {
		com.dinfogarneau.cours526.layerKml = new google.maps.KmlLayer({url: 'http://novitec.ca/map/donnees-ouvertes/rtc-trajets-kml.kml'});
	}

	if (typeof com.dinfogarneau.cours526.layerKml.map == "undefined") { 
		com.dinfogarneau.cours526.layerKml.setMap(com.dinfogarneau.cours526.carte);
	} else {
		com.dinfogarneau.cours526.layerKml.setMap(undefined);
	}
};