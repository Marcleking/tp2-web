// Charge le document XML

var xhrArrondissements;

(function (){
	
	var lienDocXml = 'php/load-arrondissements-xml.php';
	
	
	
	var erreur = false;
	
	try{
		xhrArrondissements = new XMLHttpRequest();
	} catch (e){
		alert('Erreur: Impossible de créer l\'objet XMLHttpRequest');
		erreur = true;
	}
	
	if(!erreur){
		// Fonction à appeler lorsque l'état de la requête change (callback).
		xhrArrondissements.onreadystatechange = xhrArrondissementsCallback
		// Configuration de la requête (GET) en mode asynchrone (true).
		xhrArrondissements.open('GET', lienDocXml, true);
		xhrArrondissements.send(null);
	}
})();

// Fonction callback pour la requête AJAX
function xhrArrondissementsCallback(){
	// La requête est-elle complétée (readyState=4)  ? 
	if( xhrArrondissements.readyState == 4 )
	{
		// Le code de retour d'une requête xhrArrondissements est 200 (OK) si tout s'est bien déroulé.
		if ( xhrArrondissements.status != 200 ) {
			alert( 'Erreur: La requête HTTP a échoué (code=' + xhrArrondissements.status +  ')' );
			//////////Return en xml
		} else {
			docXML = xhrArrondissements.responseXML;
			controleurChargement("arrondissements");
		}
	}
}