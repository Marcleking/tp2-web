function afficherCacherKml() {
		if (typeof layerKml.map == "undefined")
		{ 
			layerKml.setMap(carte);
		} else {
			layerKml.setMap(undefined);
		}
	}