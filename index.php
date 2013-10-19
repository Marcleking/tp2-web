<!DOCTYPE html5>
<!-- Syntaxe: HTML5 Polyglot, Conformité: HTML5 et XML (XHTML5) -->

<html xmlns="http://www.w3.org/1999/xhtml" lang="fr" xml:lang="fr">
	<head>
		<meta charset="utf-8" />
		<title>Travail pratique #2</title>
		<link type="text/css" href="css/style.css" rel="stylesheet" />
		<script src="https://maps.googleapis.com/maps/api/js?sensor=true"></script>
		<script>
			var carte;
			var latDefaut = 46.876423;
			var longDefaut = -71.190285;
			
			function initCarte() {
				var options = {
					"zoom": 15,
					"mapTypeId": google.maps.MapTypeId.ROADMAP
				};
				
				carte = new google.maps.Map(document.getElementById("carte"),
											options);
											
				if (typeof navigator.geolocation != "undefined") {
					navigator.geolocation.getCurrentPosition(function(position){
						//Success
						var position = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
						carte.setCenter(position);
						
						//Ajout d'un repère
						var optionsRepere = {"position": position,
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
						//Échec
						carte.setCenter(new google.maps.LatLng(latDefaut, longDefaut));
						/////////////////////Afficher message d'erreur???
					}, {});
				} else {
					carte.setCenter(new google.maps.LatLng(latDefaut, longDefaut));
					/////////////////////Afficher message d'erreur???
				}
			}
			
			google.maps.event.addDomListener(window, 'load', initCarte);
		</script>
	</head>

	<body>
		<div id="carte"></div>
	</body>
</html>