// Charge le document XML

com.dinfogarneau.cours526.xhrArrondissements;

(function (){
	
	var lienDocXml = 'php/load-arrondissements-xml.php';
	var erreur = false;
	
	try{
		com.dinfogarneau.cours526.xhrArrondissements = new XMLHttpRequest();
	} catch (e){
		alert('Erreur: Impossible de créer l\'objet XMLHttpRequest');
		erreur = true;
	}
	
	if(!erreur){
		// Fonction à appeler lorsque l'état de la requête change (callback).
		com.dinfogarneau.cours526.xhrArrondissements.onreadystatechange = com.dinfogarneau.cours526.xhrArrondissementsCallback
		// Configuration de la requête (GET) en mode asynchrone (true).
		com.dinfogarneau.cours526.xhrArrondissements.open('GET', lienDocXml, true);
		com.dinfogarneau.cours526.xhrArrondissements.send(null);
	}
})();

// Fonction callback pour la requête AJAX
com.dinfogarneau.cours526.xhrArrondissementsCallback = function (){
	// La requête est-elle complétée (readyState=4)  ? 
	if( com.dinfogarneau.cours526.xhrArrondissements.readyState == 4 )
	{
		// Le code de retour d'une requête xhrArrondissements est 200 (OK) si tout s'est bien déroulé.
		if ( com.dinfogarneau.cours526.xhrArrondissements.status != 200 ) {
			alert( 'Erreur: La requête HTTP a échoué (code=' + com.dinfogarneau.cours526.xhrArrondissements.status +  ')' );
			//////////Return en xml
		} else {
			com.dinfogarneau.cours526.docXML = com.dinfogarneau.cours526.xhrArrondissements.responseXML;
			com.dinfogarneau.cours526.controleurChargement("arrondissements");
		}
	}
}