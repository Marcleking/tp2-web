var xhr;
var listeWifi;

(function () {

	xhr = new XMLHttpRequest();

	xhr.onreadystatechange = chargementWifi_callback;

	xhr.open('GET', 'php/retourneWifi.php', true);
	
	console.log(xhr);

	xhr.send(null);

})();

function chargementWifi_callback() {

	if(xhr.readyState == 4 && xhr.status == 200) {
		try {
			objWifi = JSON.parse(xhr.responseText);
		} catch (e) {
			objWifi = {
				"erreur" : "La réponse AJAX n\'est pas une expression JSON valide."
			};
		}
		//Création de la liste des wifi
		listeWifi = objWifi;
		controleurChargement("listeWifi");
		
		
	}
}




