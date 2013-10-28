/************************************************
	Bouchard-Marceau, Marc-Antoine
	Ouellet, Francis
	
	chargement-avis.js
	Dernière modification : 2013-10-27
************************************************/

com.dinfogarneau.cours526.xhrAvis = null;

// Fonction callback pour la requête AJAX
com.dinfogarneau.cours526.avisWifi_callback = function () {
	
	var objAvis;

	if(com.dinfogarneau.cours526.xhrAvis.readyState == 4 && com.dinfogarneau.cours526.xhrAvis.status == 200) {
		try {
			objAvis = JSON.parse(com.dinfogarneau.cours526.xhrAvis.responseText);
		} catch (e) {
			objAvis = {
				"erreur" : "La réponse AJAX n\'est pas une expression JSON valide."
			};
		}
		//Création de la liste des avis sur les bornes wifi
		com.dinfogarneau.cours526.listeAvis = objAvis;
		com.dinfogarneau.cours526.controleurChargement("listeAvis");
	}
};

// Requête AJAX asynchrone
(function () {
	
	var erreur = false;
	
	try{
		com.dinfogarneau.cours526.xhrAvis = new XMLHttpRequest();
	} catch(e)
	{
		alert('Erreur: Impossible de créer l\'objet XMLHttpRequest');
		erreur = true;
	}
	
	if(!erreur){
		com.dinfogarneau.cours526.xhrAvis.onreadystatechange = com.dinfogarneau.cours526.avisWifi_callback;
		com.dinfogarneau.cours526.xhrAvis.open('GET', 'php/retourne-avis.php', true);
		com.dinfogarneau.cours526.xhrAvis.send(null);
	}
})();

