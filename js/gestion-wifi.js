function ajoutRepereWifi() {
	for(var i = 0 ; i < listeWifi.wifi.length; i++) {
		//Ajout du repère sur la map
		var icon;
		var positionWifi = new google.maps.LatLng(listeWifi.wifi[i].Coordonnee.split(',')[1], listeWifi.wifi[i].Coordonnee.split(',')[0]);
		
		if(listeWifi.wifi[i].proche) {
			icon = "image/wifi-proche.png";
		} else {
			icon = "image/wifi.png";
		}

		var avis = "";
		//Ajout des avis
		for(var j = 0; j<listeAvis.length; j++)
		{
			if (listeAvis[j].IdWifi == listeWifi.wifi[i].id) {
				avis += "<hr />" + escape(listeAvis[j].Commentaire) + "<br />";
			}
		}

		var optionsRepere = {"position": positionWifi,
							"map": carte,
							"icon": icon,
							"clickable": true,
							"draggable": false,
							"animation": google.maps.Animation.DROP,
							"title": "Wifi"};

		listeWifi.wifi[i].avis = avis;
		listeWifi.wifi[i].repere = new google.maps.Marker(optionsRepere);
		listeWifi.wifi[i].infoWindow = new google.maps.InfoWindow({content: genereInformation(listeWifi.wifi[i])});
		

		gestionClickRepere(listeWifi.wifi[i]);
		gestionClickRepereDansMenu(listeWifi.wifi[i]);

	}
}

function gestionClickRepere(wifi) {
	google.maps.event.addListener(wifi.repere, "click", function() { 
			ouvrirInfoWindow(wifi);
		});
}

function gestionClickRepereDansMenu (wifi) {
	//Ajout du wifi à l'interface HTML
	
	var option = document.createElement("option");
	option.text = wifi.Nom_batiment;
	option.value = wifi.id;
	$("liste-de-wifi").add(option, null);



}

function ouvrirInfoWindow(wifi) {
	if (typeof wifiOuvert != "undefined") {
		wifiOuvert.infoWindow.close();
	}
	try {
		wifi.infoWindow.open(carte, wifi.repere);
		carte.panTo(wifi.repere.getPosition());
		wifiOuvert = wifi;
	} catch (e) {

	}
}

function modifierInfoWindow(commentaire) {
	wifiOuvert.avis += "<hr />" + commentaire + "<br />";

	wifiOuvert.infoWindow.setContent(genereInformation(wifiOuvert));
}


function genereInformation(wifi) {
	return "<div><b>Nom batiment : " + wifi.Nom_batiment + "</b></div>" +
	"<p>Adresse : " + wifi.No_civique + ", " + wifi.Rue + "</p>" +
	"<p>Arrondissement : " + wifi.Arrondissement + "</p>" +
	"<p>Avis<br />" + wifi.avis + " </p>" +
	"<p><textarea id='leCommentaire' rows='4' cols='35'></textarea><br />" +
	"<input type='submit' value='Envoyer un avis sur ce wifi' onclick='envoieAvis(" + wifi.id + ")'/></p>";
}

var xhrEnvoieAvis;

function envoieAvis(id) {

	var commentaire = escape($("leCommentaire").value);

	xhrEnvoieAvis = new XMLHttpRequest();
	xhrEnvoieAvis.onreadystatechange = envoieAvis_callback;
	xhrEnvoieAvis.open('POST', 'php/envoieAvis.php', false);
	xhrEnvoieAvis.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xhrEnvoieAvis.send("Commentaire="+commentaire+ "&idWifi=" + id);
	
	modifierInfoWindow(commentaire);
}

function envoieAvis_callback() {
	var objWifi;

	if(xhrEnvoieAvis.readyState == 4 && xhrEnvoieAvis.status == 200) {
		try {
			objWifi = JSON.parse(xhrEnvoieAvis.responseText);
			alert(objWifi.Message);
		} catch (e) {
			alert("La réponse AJAX n\'est pas une expression JSON valide.");
		}
	}
	/////Faire gestion quand le call marche pas
}


