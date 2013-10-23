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
			
			var information =  "<div><b>Nom batiment : " + listeWifi.wifi[i].Nom_batiment + "</b></div>" +
				"<p>Adresse : " + listeWifi.wifi[i].No_civique + ", " + listeWifi.wifi[i].Rue + "</p>" +
				"<p>Arrondissement : " + listeWifi.wifi[i].Arrondissement + "</p>" +
				"<p>Avis : </p>" +
				"<p><input type='submit' value='Envoyer un avis sur ce wifi'/></p>";
			
			var optionsRepere = {"position": positionWifi,
							"map": carte,
							"icon": icon,
							"clickable": true,
							"draggable": false,
							"title": "Wifi"};
			
			var repere = new google.maps.Marker(optionsRepere);
			
			gestionClickRepere(information, repere);

			gestionClickRepereDansMenu(listeWifi.wifi[i], information, repere);

		}
	}
	
	function gestionClickRepere(information, repere) {
		google.maps.event.addListener(repere, "click", function() { 
				ajoutInfoWindow(information, repere);
			}); 
	}

	function gestionClickRepereDansMenu (wifi, information, repere) {
		//Ajout du wifi à l'interface HTML
		var div = document.createElement("div");
		var text = document.createTextNode(wifi.Nom_batiment);
		
		div.id = wifi.id;
		div.appendChild(text);
		$('contenu-liste-wifi').appendChild(div);

		$(div.id).addEventListener('click', function() {
			ajoutInfoWindow(information, repere);
		}, false);
	}
