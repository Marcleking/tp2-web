var xhrAvis;

(function () {
	xhrAvis = new XMLHttpRequest();
	xhrAvis.onreadystatechange = avisWifi_callback;
	xhrAvis.open('GET', 'php/retourneAvis.php', true);
	xhrAvis.send(null);
})();

function avisWifi_callback() {
	var objAvis;

	if(xhrAvis.readyState == 4 && xhrAvis.status == 200) {
		try {
			objAvis = JSON.parse(xhrAvis.responseText);
		} catch (e) {
			objAvis = {
				"erreur" : "La réponse AJAX n\'est pas une expression JSON valide."
			};
		}
		//Création de la liste des wifi
		listeAvis = objAvis;
		controleurChargement("listeAvis");
	}
}