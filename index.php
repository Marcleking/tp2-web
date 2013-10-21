<!DOCTYPE html5>
<!-- Syntaxe: HTML5 Polyglot, Conformité: HTML5 et XML (XHTML5) -->

<html xmlns="http://www.w3.org/1999/xhtml" lang="fr" xml:lang="fr">
	<head>
		<meta charset="utf-8" />
		<title>Travail pratique #2</title>
		<link type="text/css" href="css/style.css" rel="stylesheet" />
		<script src="js/util.js"></script>
		<!-- <script src="js/chargement-map.js"></script> -->
		<script>
			var elementsCharges = {
				"dom": false,
				"listeWifi": false,
				"map": false
			};	
			//////////////////Mettre dans un fichier js
			
			/////////////////À mettre ensemble??
			window.addEventListener('load', inisialisation, false);
			window.addEventListener('DOMContentLoaded' , function() {
				controleurChargement("dom");
				
				chargerScriptAsync("https://maps.googleapis.com/maps/api/js?libraries=geometry,places&sensor=true&callback=mapChargee", null);
			}, false);
			
			function mapChargee() {
				controleurChargement("map");
			}
			
			chargerScriptAsync("js/chargement-wifi.js", function() {
					controleurChargement("listeWifi");
				});
				
			
			
			
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
				//création des repère pour les wifi
				
				
				
				//arrondissement
			
			}
			
			var carte;

			function initCarte() {
				var latDefaut = 46.876423;
				var longDefaut = -71.190285;
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
					navigator.geolocation.getCurrentPosition(function(position){
						//Success de la géolocalisation
						
						var positionUtilisateur = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
						carte.setCenter(positionUtilisateur);
						
						if (typeof listeWifi.erreur == "undefined") {
							//Identification des wifi proche (5km) ///////////////Bon endroit ??
							for(var i = 0; i < listeWifi.wifi.length; i++) {
								var positionWifi = new google.maps.LatLng(listeWifi.wifi[i].Coordonnee.split(',')[1], listeWifi.wifi[i].Coordonnee.split(',')[0]);
								if(google.maps.geometry.spherical.computeDistanceBetween(positionUtilisateur, positionWifi) <= 5000) {
									listeWifi.wifi[i].proche = true;
								} else {
									listeWifi.wifi[i].proche = false;
								}
							}
							ajoutRepereWifi(); /////////////Bonne place ??
						} else {
							alert("Impossible de trouver la liste des wifi : " + listeWifi.erreur);
						}
						
						//Ajout d'un repère indiquant la géolocalisation de l'utilisateur
						var optionsRepere = {"position": positionUtilisateur,
											"map": carte,
											"icon": "ici.png",
											"clickable": true,
											"draggable": false,
											"title": "Vous êtes ici !"};
						
						var repere = new google.maps.Marker(optionsRepere);
						
						google.maps.event.addListener(	repere,
														"click",
														function() {
															var infoWindow = new google.maps.InfoWindow({
																	content: repere.getTitle()
																});
															infoWindow.open(carte, repere);
															// Recentrage de la carte sur le nouveau repère.
															carte.panTo(repere.getPosition());
														});
					}, function(position) {
						//Échec de la géolocalisation
						carte.setCenter(new google.maps.LatLng(latDefaut, longDefaut));
						/////////////////////Afficher message d'erreur???
					}, {});
				} else {
					carte.setCenter(new google.maps.LatLng(latDefaut, longDefaut));
					/////////////////////Afficher message d'erreur???
				}
			}
			
			
			function ajoutRepereWifi() {
				
				for(var i = 0 ; i < listeWifi.wifi.length; i++) {
					//Ajout du repère sur la map
					var icon;
					var positionWifi = new google.maps.LatLng(listeWifi.wifi[i].Coordonnee.split(',')[1], listeWifi.wifi[i].Coordonnee.split(',')[0]);
					
					if(listeWifi.wifi[i].proche) {
						icon = "wifi-proche.png";
					} else {
						icon = "wifi.png";
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
					
					google.maps.event.addListener(	repere,
														"click",
														function() {
															var infoWindow = new google.maps.InfoWindow({
																	content: information
																});
															infoWindow.open(carte, repere);
															// Recentrage de la carte sur le nouveau repère.
															carte.panTo(repere.getPosition());
														});
														
														
														
					//Ajout du wifi à l'interface HTML ////////Bonne place ??
					var div = document.createElement("div");
					var text = document.createTextNode(listeWifi.wifi[i].Nom_batiment);
					
					div.id = listeWifi.wifi[i].id;
					div.appendChild(text);
					console.log(div.id);
					$('contenu-liste-wifi').appendChild(div);
					
					$(div.id).addEventListener('click', function() {
						/////////////////////Va sur le bon repère
						alert(this.id);
					}, false);
				}
			}
			
			
			
			function inisialisation() {
				$("controle").addEventListener('click', gestionMenu, false);
				$("controle-wifi").addEventListener('click', gestionListeWifi, false);
			}
			
			function gestionMenu() {
				if ($("menu-info").className == "menu-info-cache") {
					$("menu-info").className = "menu-info";
				} else {
					$("menu-info").className = "menu-info-cache";
				}
				
				if ($("contenu-menu-info").className == "contenu-menu-info") {
					$("contenu-menu-info").className = "contenu-menu-info-cache"
				} else {
					$("contenu-menu-info").className = "contenu-menu-info"
				}
				
				if ($("controle").className == "controle") {
					$("controle").className = "controle-cache";
				} else {
					$("controle").className = "controle";
				}
			}
			
			function gestionListeWifi() {
				if ($('contenu-liste-wifi').className == "contenu-liste-wifi") {
					$('contenu-liste-wifi').className = "contenu-liste-wifi-cache";
					$('controle-wifi').innerHTML = "Afficher la liste des wifi"; ///// C'était tu bien innerHTML qui faut prendre ??
				} else {
					$('contenu-liste-wifi').className = "contenu-liste-wifi";
					$('controle-wifi').innerHTML = "Cacher la liste des wifi"; ///// C'était tu bien innerHTML qui faut prendre ??
				}
			}
			
			
			
			
		</script>
	</head>

	<body>
		<div id="menu-info" class="menu-info-cache">
			<div id="controle" class="controle-cache">
				<span class="ligne"></span>
				<span class="ligne"></span>
				<span class="ligne"></span>
			</div>
			<div id="contenu-menu-info" class="contenu-menu-info-cache">
			
			
				<div id="liste-wifi">
					<div id="controle-wifi">Afficher la liste des wifi</div>
					<div id="contenu-liste-wifi" class="contenu-liste-wifi-cache"></div>
				</div>
			</div>
			
		</div>
		<div id="carte"></div>
	
	</body>
	
</html>