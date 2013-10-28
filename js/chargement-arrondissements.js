/************************************************
	Bouchard-Marceau, Marc-Antoine
	Ouellet, Francis
	
	chargement-arrondissements.js
	Dernière modification : 2013-10-27
************************************************/

com.dinfogarneau.cours526.xhrArrondissements = null;

// Fonction callback pour la requête AJAX
com.dinfogarneau.cours526.xhrArrondissements_callback = function (){
	// La requête est-elle complétée (readyState=4)  ? 
	if( com.dinfogarneau.cours526.xhrArrondissements.readyState == 4 )
	{
		// Le code de retour d'une requête xhrArrondissements est 200 (OK) si tout s'est bien déroulé.
		if ( com.dinfogarneau.cours526.xhrArrondissements.status != 200 ) {
			alert( 'Erreur: La requête HTTP a échoué (code=' + com.dinfogarneau.cours526.xhrArrondissements.status +  ')' );
		} else {
			com.dinfogarneau.cours526.arrondXML = com.dinfogarneau.cours526.xhrArrondissements.responseXML;
			com.dinfogarneau.cours526.controleurChargement("arrondissements");
		}
	}
};

// Requête AJAX asynchrone
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
		com.dinfogarneau.cours526.xhrArrondissements.onreadystatechange = com.dinfogarneau.cours526.xhrArrondissements_callback;
		com.dinfogarneau.cours526.xhrArrondissements.open('GET', lienDocXml, true);
		com.dinfogarneau.cours526.xhrArrondissements.send(null);
	}
})();

