com.dinfogarneau.cours526.ajoutRepereWifi = function () {
	for(var i = 0 ; i < com.dinfogarneau.cours526.listeWifi.wifi.length; i++) {
		//Ajout du repère sur la map
		var icon;
		var positionWifi = new google.maps.LatLng(com.dinfogarneau.cours526.listeWifi.wifi[i].Coordonnee.split(',')[1], 7
													com.dinfogarneau.cours526.listeWifi.wifi[i].Coordonnee.split(',')[0]);
		
		if(com.dinfogarneau.cours526.listeWifi.wifi[i].proche) {
			icon = "image/wifi-proche.png";
		} else {
			icon = "image/wifi.png";
		}

		var avis = "";
		//Ajout des avis
		for(var j = 0; j<com.dinfogarneau.cours526.listeAvis.length; j++)
		{
			if (com.dinfogarneau.cours526.listeAvis[j].IdWifi == com.dinfogarneau.cours526.listeWifi.wifi[i].id) {
				avis += "<hr />" + com.dinfogarneau.cours526.listeAvis[j].Commentaire + "<br />";
			}
		}

		var optionsRepere = {"position": positionWifi,
							"map": com.dinfogarneau.cours526.carte,
							"icon": icon,
							"clickable": true,
							"draggable": false,
							"animation": google.maps.Animation.DROP,
							"title": "Wifi"};
		var information = com.dinfogarneau.cours526.genereInformation(com.dinfogarneau.cours526.listeWifi.wifi[i]);

		com.dinfogarneau.cours526.listeWifi.wifi[i].avis = avis;
		com.dinfogarneau.cours526.listeWifi.wifi[i].repere = new google.maps.Marker(optionsRepere);
		com.dinfogarneau.cours526.listeWifi.wifi[i].infoWindow = new google.maps.InfoWindow({content: information});
		

		com.dinfogarneau.cours526.gestionClickRepere(com.dinfogarneau.cours526.listeWifi.wifi[i]);
		com.dinfogarneau.cours526.gestionClickRepereDansMenu(com.dinfogarneau.cours526.listeWifi.wifi[i], i);

	}
}

com.dinfogarneau.cours526.gestionClickRepere function (wifi) {
	google.maps.event.addListener(wifi.repere, "click", function() { 
			com.dinfogarneau.cours526.ouvrirInfoWindow(wifi);
		});
}

com.dinfogarneau.cours526.gestionClickRepereDansMenu function  (wifi, position) {
	//Ajout du wifi à l'interface HTML

	var option = document.createElement("option");
	option.text = wifi.Nom_batiment;
	option.value = position;
	$("liste-de-wifi").add(option, null);
}

com.dinfogarneau.cours526.ouvrirInfoWindow function (wifi) {
	if (typeof com.dinfogarneau.cours526.wifiOuvert != "undefined") {
		com.dinfogarneau.cours526.wifiOuvert.infoWindow.close();
	}
	try {
		wifi.infoWindow.open(com.dinfogarneau.cours526.carte, wifi.repere);
		com.dinfogarneau.cours526.carte.panTo(wifi.repere.getPosition());
		com.dinfogarneau.cours526.wifiOuvert = wifi;
	} catch (e) {}
}

function modifierInfoWindow(commentaire) {
	com.dinfogarneau.cours526.wifiOuvert.avis += "<hr />" + commentaire + "<br />";
	com.dinfogarneau.cours526.wifiOuvert.infoWindow.setContent(genereInformation(wifiOuvert));
}


function genereInformation(wifi) {
	return "<div><b>Nom batiment : " + wifi.Nom_batiment + "</b></div>" +
	"<p>Adresse : " + wifi.No_civique + ", " + wifi.Rue + "</p>" +
	"<p>Arrondissement : " + wifi.Arrondissement + "</p>" +
	"<p>Avis<br />" + wifi.avis + " </p>" +
	"<p><textarea id='leCommentaire' rows='4' cols='35'></textarea><br />" +
	"<input type='submit' value='Envoyer un avis sur ce wifi' onclick='envoieAvis(" + wifi.id + ")'/></p>";
}

com.dinfogarneau.cours526.xhrEnvoieAvis;

function envoieAvis(id) {

	var commentaire = $("leCommentaire").value;

	com.dinfogarneau.cours526.xhrEnvoieAvis = new XMLHttpRequest();
	com.dinfogarneau.cours526.xhrEnvoieAvis.onreadystatechange = com.dinfogarneau.cours526.envoieAvis_callback;
	com.dinfogarneau.cours526.xhrEnvoieAvis.open('POST', 'php/envoieAvis.php', true);
	com.dinfogarneau.cours526.xhrEnvoieAvis.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	com.dinfogarneau.cours526.xhrEnvoieAvis.send("Commentaire="+commentaire+ "&idWifi=" + id);
	
	com.dinfogarneau.cours526.modifierInfoWindow(commentaire);
}

com.dinfogarneau.cours526.envoieAvis_callback function () {
	var objWifi;

	if(com.dinfogarneau.cours526.xhrEnvoieAvis.readyState == 4 && com.dinfogarneau.cours526.xhrEnvoieAvis.status == 200) {
		try {
			objWifi = JSON.parse(com.dinfogarneau.cours526.xhrEnvoieAvis.responseText);
			alert(objWifi.Message);
		} catch (e) {
			alert("La réponse AJAX n\'est pas une expression JSON valide.");
		}
	}
	/////Faire gestion quand le call marche pas
}


