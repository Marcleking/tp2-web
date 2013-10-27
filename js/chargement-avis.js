com.dinfogarneau.cours526.xhrAvis;

(function () {
	com.dinfogarneau.cours526.xhrAvis = new XMLHttpRequest();
	com.dinfogarneau.cours526.xhrAvis.onreadystatechange = com.dinfogarneau.cours526.avisWifi_callback;
	com.dinfogarneau.cours526.xhrAvis.open('GET', 'php/retourneAvis.php', true);
	com.dinfogarneau.cours526.xhrAvis.send(null);
})();

com.dinfogarneau.cours526.avisWifi_callback = function () {
	var objAvis;

	if(com.dinfogarneau.cours526.xhrAvis.readyState == 4 && com.dinfogarneau.cours526.xhrAvis.status == 200) {
		try {
			objAvis = JSON.parse(dom.dinfogarneau.cours526.xhrAvis.responseText);
		} catch (e) {
			objAvis = {
				"erreur" : "La réponse AJAX n\'est pas une expression JSON valide."
			};
		}
		//Création de la liste des wifi
		com.dinfogarneau.cours526.listeAvis = objAvis;
		com.dinfogarneau.cours526.controleurChargement("listeAvis");
	}
}