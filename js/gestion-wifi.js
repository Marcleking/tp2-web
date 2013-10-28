/************************************************
	Bouchard-Marceau, Marc-Antoine
	Ouellet, Francis
	
	gestion-wifi.js
	Dernière modification : 2013-10-27
************************************************/

com.dinfogarneau.cours526.ajoutReperesWifi = function () {

	// Pour chaque borne Wifi
	for(var i = 0 ; i < com.dinfogarneau.cours526.listeWifi.wifi.length; i++) {
		//Ajout du repère sur la map
		var icon;
		var positionWifi = new google.maps.LatLng(com.dinfogarneau.cours526.listeWifi.wifi[i].Coordonnee.split(',')[1],
													com.dinfogarneau.cours526.listeWifi.wifi[i].Coordonnee.split(',')[0]);
		
		if(com.dinfogarneau.cours526.listeWifi.wifi[i].proche) {
			icon = "image/wifi-proche.png";
		} else {
			icon = "image/wifi.png";
		}

		var avis = "";
		// Pour chaque avis de la borne
		for(var j = 0; j<com.dinfogarneau.cours526.listeAvis.length; j++)
		{
			if (com.dinfogarneau.cours526.listeAvis[j].IdWifi == com.dinfogarneau.cours526.listeWifi.wifi[i].id) {
				avis += "<hr />" + com.dinfogarneau.cours526.listeAvis[j].Commentaire + "<br />";
			}
		}

		com.dinfogarneau.cours526.listeWifi.wifi[i].avis = avis;
		
		var optionsRepere = {"position": positionWifi,
							"map": com.dinfogarneau.cours526.carte,
							"icon": icon,
							"clickable": true,
							"draggable": false,
							"animation": google.maps.Animation.DROP,
							"title": "Wifi"};
		
		// Récupère les informations nécessaires pour l'info-bulle
		var information = com.dinfogarneau.cours526.genereInformation(com.dinfogarneau.cours526.listeWifi.wifi[i]);

		
		com.dinfogarneau.cours526.listeWifi.wifi[i].repere = new google.maps.Marker(optionsRepere);
		com.dinfogarneau.cours526.listeWifi.wifi[i].infoWindow = new google.maps.InfoWindow({content: information});
		

		com.dinfogarneau.cours526.gestionClickRepere(com.dinfogarneau.cours526.listeWifi.wifi[i]);
		com.dinfogarneau.cours526.gestionClickRepereDansMenu(com.dinfogarneau.cours526.listeWifi.wifi[i], i);

	}
};

// Ajoute la fonction pour ouvrir une infoWindow sur l'événement click d'un point Wifi
com.dinfogarneau.cours526.gestionClickRepere = function (wifi) {
	google.maps.event.addListener(wifi.repere, "click", function() { 
			com.dinfogarneau.cours526.ouvrirInfoWindow(wifi);
		});
};

// Ajoute les informations de la borne Wifi à la liste déroulante du menu
com.dinfogarneau.cours526.gestionClickRepereDansMenu = function  (wifi, position) {
	var option = document.createElement("option");
	option.text = wifi.Nom_batiment;
	option.value = position;
	com.dinfogarneau.cours526.$("liste-de-wifi").add(option, null);
};

// Ouvre l'infoWindow d'une borne
com.dinfogarneau.cours526.ouvrirInfoWindow = function (wifi) {
	// Si une infoWindow est ouverte, on la ferme
	if (typeof com.dinfogarneau.cours526.wifiOuvert != "undefined") {
		com.dinfogarneau.cours526.wifiOuvert.infoWindow.close();
	}
	try {
		wifi.infoWindow.open(com.dinfogarneau.cours526.carte, wifi.repere);
		com.dinfogarneau.cours526.carte.panTo(wifi.repere.getPosition());
		com.dinfogarneau.cours526.wifiOuvert = wifi;
	} catch (e) {}
};

// Permet de modifier une infoWindow pour afficher en direct l'ajout d'un avis
com.dinfogarneau.cours526.modifierInfoWindow = function (commentaire) {
	com.dinfogarneau.cours526.wifiOuvert.avis += "<hr />" + commentaire + "<br />";
	com.dinfogarneau.cours526.wifiOuvert.infoWindow.setContent(com.dinfogarneau.cours526.genereInformation(com.dinfogarneau.cours526.wifiOuvert));
};

// Génère les informations comprises dans un infoWindow pour une borne Wifi
com.dinfogarneau.cours526.genereInformation = function (wifi) {
	return "<div><b>Nom de l'établissement : " + wifi.Nom_batiment + "</b></div>" +
	"<p>Adresse : " + wifi.No_civique + ", " + wifi.Rue + "</p>" +
	"<p>Arrondissement : " + wifi.Arrondissement + "</p>" +
	"<p>Avis<br />" + wifi.avis + " </p>" +
	"<p><textarea id='leCommentaire' rows='4' cols='35'></textarea><br />" +
	"<input type='submit' value='Envoyer un avis sur ce wifi' onclick='com.dinfogarneau.cours526.envoieAvis(" + wifi.id + ")'/></p>";
};

// Requête d'ajout d'un avis pour une borne Wifi

com.dinfogarneau.cours526.xhrEnvoieAvis;

com.dinfogarneau.cours526.envoieAvis = function (id) {

	var commentaire = com.dinfogarneau.cours526.$("leCommentaire").value;

	com.dinfogarneau.cours526.xhrEnvoieAvis = new XMLHttpRequest();
	com.dinfogarneau.cours526.xhrEnvoieAvis.onreadystatechange = com.dinfogarneau.cours526.envoieAvis_callback;
	com.dinfogarneau.cours526.xhrEnvoieAvis.open('POST', 'php/envoie-avis.php', true);
	com.dinfogarneau.cours526.xhrEnvoieAvis.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	com.dinfogarneau.cours526.xhrEnvoieAvis.send("Commentaire="+commentaire+ "&idWifi=" + id);
	
	com.dinfogarneau.cours526.modifierInfoWindow(commentaire);
};

com.dinfogarneau.cours526.envoieAvis_callback = function () {
	var objWifi;

	if(com.dinfogarneau.cours526.xhrEnvoieAvis.readyState == 4 && com.dinfogarneau.cours526.xhrEnvoieAvis.status == 200) {
		try {
			objWifi = JSON.parse(com.dinfogarneau.cours526.xhrEnvoieAvis.responseText);
			alert(objWifi.Message);
		} catch (e) {
			alert("La réponse AJAX n\'est pas une expression JSON valide.");
		}
	}
	
};


