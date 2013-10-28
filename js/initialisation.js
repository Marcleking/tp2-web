/************************************************
	Bouchard-Marceau, Marc-Antoine
	Ouellet, Francis
	
	initialisation.js
	Dernière modification : 2013-10-27
************************************************/

// Variables globales
com.dinfogarneau.cours526.elementsCharges = {
	"dom": false,
	"listeWifi": false,
	"listeAvis": false,
	"arrondissements": false,
	"map": false
};
com.dinfogarneau.cours526.carte;
com.dinfogarneau.cours526.listeWifi;
com.dinfogarneau.cours526.wifiOuvert;
com.dinfogarneau.cours526.latDefaut = 46.876423;
com.dinfogarneau.cours526.longDefaut = -71.190285;
com.dinfogarneau.cours526.layerKml;
com.dinfogarneau.cours526.listeAvis;
com.dinfogarneau.cours526.arrondXML;

// Ajoute la carte à l'écran
com.dinfogarneau.cours526.initcarte = function () {
	var options = {
		"zoom": 15,
		"mapTypeId": google.maps.MapTypeId.ROADMAP,
		"panControl" : false,
		"zoomControlOptions": {
			"position": google.maps.ControlPosition.LEFT_CENTER
			},
		"streetViewControlOptions": {
			"position": google.maps.ControlPosition.LEFT_CENTER
			}
		};
	
	com.dinfogarneau.cours526.carte = new google.maps.Map(document.getElementById("carte"), options);

	// Tente de placer le point central à l'endroit où se trouve le client
	if (typeof navigator.geolocation != "undefined") {
		navigator.geolocation.getCurrentPosition(com.dinfogarneau.cours526.getCurrentPositionSuccess, com.dinfogarneau.cours526.getCurrentPositionFail, {});
	} else {
		//Le navigateur ne gère pas la géolocalisation
		com.dinfogarneau.cours526.carte.setCenter(new google.maps.LatLng(com.dinfogarneau.cours526.latDefaut, com.dinfogarneau.cours526.longDefaut));
		com.dinfogarneau.cours526.ajoutRepereWifis();
	}
};

// 
com.dinfogarneau.cours526.getCurrentPositionSuccess = function (position) {
	var positionUtilisateur = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
	com.dinfogarneau.cours526.carte.setCenter(positionUtilisateur);
	if (typeof com.dinfogarneau.cours526.listeWifi.erreur == "undefined") {
		//Identification des wifi proche (5km)
		for(var i = 0; i < com.dinfogarneau.cours526.listeWifi.wifi.length; i++) {
			var positionWifi = new google.maps.LatLng(com.dinfogarneau.cours526.listeWifi.wifi[i].Coordonnee.split(',')[1], com.dinfogarneau.cours526.listeWifi.wifi[i].Coordonnee.split(',')[0]);
			if(google.maps.geometry.spherical.computeDistanceBetween(positionUtilisateur, positionWifi) <= 5000) {
				com.dinfogarneau.cours526.listeWifi.wifi[i].proche = true;
			} else {
				com.dinfogarneau.cours526.listeWifi.wifi[i].proche = false;
			}
		}
		// Ajoute les repères Wifi à la carte
		com.dinfogarneau.cours526.ajoutReperesWifi();
		
	} else {
		alert("Impossible de trouver la liste des bornes wifi ZAP : " + com.dinfogarneau.cours526.listeWifi.erreur);
	}
	
	//Ajout d'un repère indiquant la localisation de l'utilisateur
	var optionsRepere = {"position": positionUtilisateur,
						"map": com.dinfogarneau.cours526.carte,
						"icon": "image/ici.png",
						"clickable": true,
						"draggable": false,
						"animation": google.maps.Animation.DROP,
						"title": "Vous êtes ici !"};
	
	var repere = new google.maps.Marker(optionsRepere);
	
	com.dinfogarneau.cours526.gestionClickRepere(repere.getTitle(), repere);

};

// Définit la position par rapport à la carte si la géolocalisation échoue
com.dinfogarneau.cours526.getCurrentPositionFail = function (erreur) {
	com.dinfogarneau.cours526.carte.setCenter(new google.maps.LatLng(com.dinfogarneau.cours526.latDefaut, com.dinfogarneau.cours526.longDefaut));
	com.dinfogarneau.cours526.ajoutReperesWifi();
};

// Ajoute les événements sur le bouton du menu, la boite de dialogue de l'affichage du KML et la liste des bornes Wifi
com.dinfogarneau.cours526.initialisation = function () {
	com.dinfogarneau.cours526.$("controle").addEventListener('click', com.dinfogarneau.cours526.gestionMenu, false);
	com.dinfogarneau.cours526.$("kml-rtc-checkbox").addEventListener('click', com.dinfogarneau.cours526.afficherCacherKml, false);
	com.dinfogarneau.cours526.$("liste-de-wifi").addEventListener('change', function() {
		com.dinfogarneau.cours526.ouvrirInfoWindow(com.dinfogarneau.cours526.listeWifi.wifi[com.dinfogarneau.cours526.$("liste-de-wifi").value]);
	}, false);
};

// Fonctions à exécuter lorsque que le DOM est chargé
window.addEventListener('DOMContentLoaded' , function() {
	com.dinfogarneau.cours526.initialisation();
	com.dinfogarneau.cours526.controleurChargement("dom");
	com.dinfogarneau.cours526.chargerScriptAsync("https://maps.googleapis.com/maps/api/js?libraries=geometry,places&sensor=true&callback=com.dinfogarneau.cours526.mapChargee", null);
}, false);

// Indique au controleur de chargement que la carte est chargée
com.dinfogarneau.cours526.mapChargee = function () {
	com.dinfogarneau.cours526.controleurChargement("map");
};

// Controleur de chargement
// À chaque nouvel élément chargé, vérifie si tous les éléments sont chargés
// Lorsque tous les éléments sont chargés, déclenche le traitement post-chargement
com.dinfogarneau.cours526.controleurChargement = function (nouvelElementCharge) {
	//Verification si l'élément est dans les éléments géré
	
	if(typeof com.dinfogarneau.cours526.elementsCharges[nouvelElementCharge] != "undefined") {
		com.dinfogarneau.cours526.elementsCharges[nouvelElementCharge] = true;
		
		//Vérification si tout les éléments sont charger
		var valCrit = false;
		for(var elem in com.dinfogarneau.cours526.elementsCharges) {
			if(!com.dinfogarneau.cours526.elementsCharges[elem]) {
				valCrit = true; }
		}
		//Si tout les éléments ont été chargés
		if (!valCrit) {
			com.dinfogarneau.cours526.traitementPostChargement();
		}
	}
};

// Traitement post-chargement :
// - Affichage de la carte
// - Ajout des arrondissements à la carte
// - Ajout de la couche KML à la carte
com.dinfogarneau.cours526.traitementPostChargement = function () {
	//Map
	com.dinfogarneau.cours526.initcarte();

	com.dinfogarneau.cours526.creerArrondissements();

	//Afficher le kml sur la carte
	com.dinfogarneau.cours526.afficherCacherKml();
};

