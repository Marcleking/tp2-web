/************************************************
	Bouchard-Marceau, Marc-Antoine
	Ouellet, Francis
	
	chargement-wifi.js
	Dernière modification : 2013-10-27
************************************************/

com.dinfogarneau.cours526.xhrWifi = null;

// Fonction callback pour la requête AJAX
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
};

// Requête AJAX asynchrone
(function () {

	var erreur = false;
	
	try{
		com.dinfogarneau.cours526.xhrWifi = new XMLHttpRequest();
	} catch(e){
		alert('Erreur: Impossible de créer l\'objet XMLHttpRequest');
		erreur = true;
	}
	
	if(!erreur){
		com.dinfogarneau.cours526.xhrWifi.onreadystatechange = com.dinfogarneau.cours526.chargementWifi_callback;
		com.dinfogarneau.cours526.xhrWifi.open('GET', 'php/retourne-wifi.php', true);
		com.dinfogarneau.cours526.xhrWifi.send(null);
	}
})();






