var xhrWifi;

(function () {

	xhrWifi = new XMLHttpRequest();

	xhrWifi.onreadystatechange = chargementWifi_callback;

	xhrWifi.open('GET', 'php/retourneWifi.php', true);

	xhrWifi.send(null);

})();

function chargementWifi_callback() {
	var objWifi;

	if(xhrWifi.readyState == 4 && xhrWifi.status == 200) {
		try {
			objWifi = JSON.parse(xhrWifi.responseText);
		} catch (e) {
			objWifi = {"erreur" : "La réponse AJAX n\'est pas une expression JSON valide."};
		}
		//Création de la liste des wifi
		listeWifi = objWifi;
		controleurChargement("listeWifi");
	}
}




