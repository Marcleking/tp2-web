var elementsCharges = {
	"dom": false,
	"listeWifi": false,
	"kml": false,
	"arrondissements": false,
	"map": false
};
var carte;
var listeWifi;
var infoWindowOuvert;
var latDefaut = 46.876423;
var longDefaut = -71.190285;
var layerKml;
var docXML;

function initCarte() {
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
	
	carte = new google.maps.Map(document.getElementById("carte"), options);

	if (typeof navigator.geolocation != "undefined") {
		navigator.geolocation.getCurrentPosition(getCurrentPositionSuccess, getCurrentPositionFail, {});

	} else {
		//Le navigateur ne gère pas la géolocalisation
		carte.setCenter(new google.maps.LatLng(latDefaut, longDefaut));
		ajoutRepereWifi();
	}
}

function getCurrentPositionSuccess(position) {
	var positionUtilisateur = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
	carte.setCenter(positionUtilisateur);
	
	if (typeof listeWifi.erreur == "undefined") {
		//Identification des wifi proche (5km)
		for(var i = 0; i < listeWifi.wifi.length; i++) {
			var positionWifi = new google.maps.LatLng(listeWifi.wifi[i].Coordonnee.split(',')[1], listeWifi.wifi[i].Coordonnee.split(',')[0]);
			if(google.maps.geometry.spherical.computeDistanceBetween(positionUtilisateur, positionWifi) <= 5000) {
				listeWifi.wifi[i].proche = true;
			} else {
				listeWifi.wifi[i].proche = false;
			}
		}
		ajoutRepereWifi();
		
	} else {
		alert("Impossible de trouver la liste des wifi : " + listeWifi.erreur);
	}
	
	//Ajout d'un repère indiquant la géolocalisation de l'utilisateur
	var optionsRepere = {"position": positionUtilisateur,
						"map": carte,
						"icon": "image/ici.png",
						"clickable": true,
						"draggable": false,
						"title": "Vous êtes ici !"};
	
	var repere = new google.maps.Marker(optionsRepere);
	
	gestionClickRepere(repere.getTitle(), repere);

}

function getCurrentPositionFail(erreur) {
	//Échec de la géolocalisation
	carte.setCenter(new google.maps.LatLng(latDefaut, longDefaut));
	ajoutRepereWifi();
}

function initialisation() {
		$("controle").addEventListener('click', gestionMenu, false);
		$("controle-wifi").addEventListener('click', gestionListeWifi, false);
		$("kml-rtc-checkbox").addEventListener('click', gestionKml, false);
	}

window.addEventListener('DOMContentLoaded' , function() {
	initialisation();
	controleurChargement("dom");
	chargerScriptAsync("https://maps.googleapis.com/maps/api/js?libraries=geometry,places&sensor=true&callback=mapChargee", null);
}, false);


function mapChargee() {
	controleurChargement("map");
	chargerScriptAsync("js/chargement-kml.js", null);
}

function controleurChargement(nouvelleElementCharge) {
	
	//Verification si l'élément est dans les éléments géré
	if(typeof elementsCharges[nouvelleElementCharge] != "undefined") {
		elementsCharges[nouvelleElementCharge] = true;
		
		//Vérification si tout les éléments sont charger
		var valCrit = false;
		for(var elem in elementsCharges) {
			if(!elementsCharges[elem]) {
				valCrit = true; }
		}
		//Si tout les éléments on été charger on
		if (!valCrit) {
			traitementPostChargement();
		}
	}
}

function traitementPostChargement() {
	//Map
	initCarte();

	creerArrondissements(); /////////////Voir pourquoi on peut pas cliquer sur le kml

	//Afficher le kml sur la carte
	afficherCacherKml();

	
}