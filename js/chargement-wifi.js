com.dinfogarneau.cours526.xhrWifi;

(function () {

	com.dinfogarneau.cours526.xhrWifi = new XMLHttpRequest();

	com.dinfogarneau.cours526.xhrWifi.onreadystatechange = com.dinfogarneau.cours526.chargementWifi_callback;

	com.dinfogarneau.cours526.xhrWifi.open('GET', 'php/retourneWifi.php', true);

	com.dinfogarneau.cours526.xhrWifi.send(null);

})();

com.dinfogarneau.cours526.chargementWifi_callback = function () {
	var objWifi;

	if(com.dinfogarneau.cours526.xhrWifi.readyState == 4 && com.dinfogarneau.cours526.xhrWifi.status == 200) {
		try {
			objWifi = JSON.parse(com.dinfogarneau.cours526.xhrWifi.responseText);
		} catch (e) {
			objWifi = {"erreur" : "La réponse AJAX n\'est pas une expression JSON valide."};
		}
		//Création de la liste des wifi
		com.dinfogarneau.cours526.listeWifi = objWifi;
		com.dinfogarneau.cours526.controleurChargement("listeWifi");
	}
}




