// Arrondissements
com.dinfogarneau.cours526.creerArrondissements = function (){
	// Structure JSON contenant les données sur les arrondissements
	var arrondissements = new Array();
	var lesCoordsArrondissements = com.dinfogarneau.cours526.docXML.getElementsByTagName("Geometrie");
	var lesNoms = com.dinfogarneau.cours526.docXML.getElementsByTagName("Nom");
	var lesAbrevations = com.dinfogarneau.cours526.docXML.getElementsByTagName("Abreviation");
	
	for(var i = 0; i < lesCoordsArrondissements.length; i++) {
		// Génération de la couleur pour l'arrondissement
		var couleur = com.dinfogarneau.cours526.genererCouleurArrondissement(lesAbrevations[i].textContent);
		
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
							map: com.dinfogarneau.cours526.carte,
							strokeWeight: 2,
							fillColor: couleur,
							fillOpacity: 0.35
							}),
				"abrevation": lesAbrevations[i].textContent,
				"nom" : lesNoms[i].textContent
			} 
		);
	}
	
	com.dinfogarneau.cours526.ajoutArrondissementsMenu(arrondissements);
	
};

com.dinfogarneau.cours526.genererCouleurArrondissement = function (abrevation){
	// Déclaration des variables nécessaires à la génération du nombre
	var a = 16807, m = 0x7FFFFFFF, min = 0, max = 256;
	
	var couleurs = new Array();
	
	for (var i = 0; i < 3; i++){
		couleurs.push(((a * abrevation.charCodeAt(i)) % m) % max);
	}
	
	return com.dinfogarneau.cours526.rgbToHex(couleurs[0],couleurs[1],couleurs[2]);
};

com.dinfogarneau.cours526.componentToHex = function (c) {
    var hex = c.toString(16);
    return hex.length == 1 ? "0" + hex : hex;
};

com.dinfogarneau.cours526.rgbToHex = function (r, g, b) {
    return "#" + com.dinfogarneau.cours526.componentToHex(r) + com.dinfogarneau.cours526.componentToHex(g) + com.dinfogarneau.cours526.componentToHex(b);
};

com.dinfogarneau.cours526.ajoutArrondissementsMenu = function (arrondissements){
	
	var header = document.createElement("h1");
	header.textContent = "Arrondissements de la Ville de Québec";
	
	var br = document.createElement("br");

	var checkbox = document.createElement("input");
	checkbox.type = "checkbox";
	checkbox.id = "toutCocherDecocher";
	checkbox.name="tousArrondissements";
	checkbox.checked = true;
	
	var label = document.createElement("label");
	label.textContent = "Tout décocher";
	label.htmlFor = checkbox.id;

	com.dinfogarneau.cours526.$("arrondissements").appendChild(header,br);
	com.dinfogarneau.cours526.$("arrondissements").appendChild(checkbox);
	
	br = document.createElement("br");
	
	com.dinfogarneau.cours526.$("arrondissements").appendChild(label);
	com.dinfogarneau.cours526.$("arrondissements").appendChild(br);
		
	addEvent([checkbox],"global");
		
	for (var i = 0; i < arrondissements.length; i++){
	
		checkbox = document.createElement("input");
		checkbox.type = "checkbox";
		checkbox.id = arrondissements[i].abrevation;
		checkbox.name="arrondissements";
		checkbox.checked = true;
		
		label = document.createElement("label");
		label.htmlFor = checkbox.id;
		label.textContent = arrondissements[i].nom;

		br = document.createElement("br");
		
		com.dinfogarneau.cours526.$("arrondissements").appendChild(checkbox);
		com.dinfogarneau.cours526.$("arrondissements").appendChild(label);
		com.dinfogarneau.cours526.$("arrondissements").appendChild(br);

		addEvent([checkbox,i],"local");
	}
	
	function addEvent(params,type){
		if (type == "local"){
			params[0].addEventListener('change',function(){com.dinfogarneau.cours526.afficherCacherArrondissement(arrondissements[params[1]]);},false);
		}
		else if (type == "global"){
			params[0].addEventListener('change',function(){com.dinfogarneau.cours526.toutCocherDecocher(params[0]);},false);
		}
	}
};

com.dinfogarneau.cours526.afficherCacherArrondissement = function (arrondissement){
	if(arrondissement.polygon.map == null)
	{
		arrondissement.polygon.setMap(com.dinfogarneau.cours526.carte);
	}
	else
	{
		arrondissement.polygon.setMap(null);
	}
};

com.dinfogarneau.cours526.toutCocherDecocher = function (checkbox){
	
	var chkArrondissements = document.getElementsByName("arrondissements");
	var cocher, texte;
	if(!checkbox.checked) {
		cocher = false;
		texte = "Tout cocher";
	} else {  
		cocher = true;
		texte = "Tout décocher";
	}
	
	var label = com.dinfogarneau.cours526.findLabelForControl(checkbox);
	label.textContent = texte;
	for(var i = 0; i < chkArrondissements.length; i++){
		if(chkArrondissements[i].checked != cocher){
			// Appel l'event change (le fait de changer la propriété ne trigger pas l'événement)
			if ("createEvent" in document) {
				var evt = document.createEvent("HTMLEvents");
				evt.initEvent("change", false, true);
				chkArrondissements[i].dispatchEvent(evt);
			}
			else{
				chkArrondissements[i].fireEvent("onchange");
			}
			chkArrondissements[i].checked = cocher;
		}
	}
};

/////////////////////////////// À mettre dans util.js ??????
// Permet de trouver l'élément label d'un contrôle
com.dinfogarneau.cours526.findLabelForControl = function (element) {
	var idVal = element.id;
	var labels = document.getElementsByTagName('label');
	
	var i = 0;
    while(labels[i].htmlFor != idVal){
		i++;
	}
	return labels[i];
};