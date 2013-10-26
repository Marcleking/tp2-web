// Arrondissements
function creerArrondissements(){
	// Structure JSON contenant les données sur les arrondissements
	var arrondissements = new Array();
	var lesCoordsArrondissements = docXML.getElementsByTagName("Geometrie");
	var lesNoms = docXML.getElementsByTagName("Nom");
	var lesAbrevations = docXML.getElementsByTagName("Abreviation");
	
	for(var i = 0; i < lesCoordsArrondissements.length; i++) {
		// Génération de la couleur pour l'arrondissement
		
		couleur = genererCouleurArrondissement(lesAbrevations[i].textContent);
		
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
		arrondissements.push( 
			{	"polygon":	new google.maps.Polygon( {
							paths: lesPolygones,
							map: carte,
							strokeWeight: 2,
							fillColor: couleur,
							fillOpacity: 0.35
							}),
				"abrevation": lesAbrevations[i].textContent,
				"nom" : lesNoms[i].textContent
			} 
		);
	}
}

function genererCouleurArrondissement (abrevation){
	// Déclaration des variables nécessaires à la génération du nombre
	var a = 16807, m = 0x7FFFFFFF, min = 0, max = 256;
	
	var couleurs = new Array();
	
	for (var i = 0; i < 3; i++){
		couleurs.push(((a * abrevation.charCodeAt(i)) % m) % max);
	}
	
	return rgbToHex(couleurs[0],couleurs[1],couleurs[2]);
}

function componentToHex(c) {
    var hex = c.toString(16);
    return hex.length == 1 ? "0" + hex : hex;
}

function rgbToHex(r, g, b) {
    return "#" + componentToHex(r) + componentToHex(g) + componentToHex(b);
}

function ajoutArrondissementMenu(arrondissement){
	var checkbox = document.createElement("input");
	checkbox.type = "checkbox";
	checkbox.id = arrondissement.abrevation
	checkbox.name="arrondissements";
	checkbox.checked = true;
	
	var label = document.createElement("label");
	
	
	
}