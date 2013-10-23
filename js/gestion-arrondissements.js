
	// Arrondissements
	function creerArrondissements(){
		// Structure JSON contenant les données sur les arrondissements
		var arrondissements = new Array();
		var lesCoordsArrondissements = docXML.getElementsByTagName("Geometrie");
		var lesNoms = docXML.getElementsByTagName("Nom");
		
		for(var i = 0; i < lesCoordsArrondissements.length; i++) {
			// Création du polygone
			
			// Coupe le mot "POLYGON", sépare chaque polygone dans un vecteur
			var lesPolygonesXML = lesCoordsArrondissements[i].textContent.substring(8).split("),(");
			
			// Nettoyage des "(" et des ")"
			for (var j = 0; j < lesPolygonesXML.length; j++){
				lesPolygonesXML[j] = lesPolygonesXML[j].replace("((","");
				lesPolygonesXML[j] = lesPolygonesXML[j].replace("))","");
			}
			
			var lesPolygones = new Array();
			
			// Sépare les coordonnées de chacun des polygones de cet arrondissement
			for (var j = 0; j < lesPolygonesXML.length; j++ ){
				// Vecteur contenant chaque paire de coordonnées du polygone
				var coordonneesXML = lesPolygonesXML[j].split(",");
				
				// Sépare et place chaque paire de coordonnées dans un espace du vecteur "zone"
				for (var k = 0; k < coordonneesXML.length; k++ ){
					coordonneesXML[k] = ( coordonneesXML[k].split(" ") );
				}
				
				var unPolygone = new Array();
				
				// Création d'un vecteur contenant les points d'un polygone
				for (var k = 0; k < coordonneesXML.length; k++ ){
					unPolygone.push( new google.maps.LatLng(coordonneesXML[k][1], coordonneesXML[k][0]) );
				}
				
				lesPolygones.push(unPolygone);
			}
			
			// Création de l'arrondissement
			arrondissements.push( new google.maps.Polygon( {
				paths: lesPolygones,
				map: carte
				/*strokeColor: '#fff',
				strokeOpacity: 0.6,
				strokeWeight: 3,
				fillColor: '#FF0000',
				fillOpacity: 0.35*/
			}) );
		}
	}
