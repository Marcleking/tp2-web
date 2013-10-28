/************************************************
	Bouchard-Marceau, Marc-Antoine
	Ouellet, Francis
	
	gestion-arrondissements.js
	Dernière modification : 2013-10-27
************************************************/

// Crée les arrondissements à partir du fichier XML
com.dinfogarneau.cours526.creerArrondissements = function (){
	// Structure JSON contenant les données sur les arrondissements
	var arrondissements = new Array();
	// Données du document XML
	var lesCoordsArrondissements = com.dinfogarneau.cours526.arrondXML.getElementsByTagName("Geometrie");
	var lesNoms = com.dinfogarneau.cours526.arrondXML.getElementsByTagName("Nom");
	var lesAbrevations = com.dinfogarneau.cours526.arrondXML.getElementsByTagName("Abreviation");
	
	for(var i = 0; i < lesCoordsArrondissements.length; i++) {
		// Génération de la couleur pour l'arrondissement
		var couleur = com.dinfogarneau.cours526.genererCouleurArrondissement(lesAbrevations[i].textContent);
		
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
			
			// Sépare et place chaque paire de coordonnées dans un espace du vecteur "coordonneesXML"
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
	
	// Appel la fonction pour mettre à jour le menu
	com.dinfogarneau.cours526.ajoutArrondissementsMenu(arrondissements);
	
};

// Génére une couleur au format hexadécimal selon l'abrevation de l'arrondissement
com.dinfogarneau.cours526.genererCouleurArrondissement = function (abrevation){
	// Déclaration des variables nécessaires à la génération du nombre
	var a = 16807, m = 0x7FFFFFFF, min = 0, max = 256;
	
	var rgb = new Array();
	
	for (var i = 0; i < 3; i++){
		rgb.push(((a * abrevation.charCodeAt(i)) % m) % max);
	}
	
	return com.dinfogarneau.cours526.rgbToHex(rgb[0],rgb[1],rgb[2]);
};

// Retourne l'équivalent hexadécimal d'une composante RGB
com.dinfogarneau.cours526.componentToHex = function (c) {
    var hex = c.toString(16);
    return hex.length == 1 ? "0" + hex : hex;
};

// Retourne l'équivalent hexadécimal d'une couleur RGB
com.dinfogarneau.cours526.rgbToHex = function (r, g, b) {
    return "#" + com.dinfogarneau.cours526.componentToHex(r) + com.dinfogarneau.cours526.componentToHex(g) + com.dinfogarneau.cours526.componentToHex(b);
};

// Génère les éléments du menu pour les arrondissements
com.dinfogarneau.cours526.ajoutArrondissementsMenu = function (arrondissements){
	
	// Titre de la section
	var header = document.createElement("h1");
	header.textContent = "Arrondissements de la Ville de Québec";
	
	var br = document.createElement("br");

	// Ajout de l'option tout cocher/décocher
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
		
	// Ajout de chacun des arrondissements
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
	
	// Fonction d'ajout d'événement sur les cases à cocher
	function addEvent(params,type){
		if (type == "local"){
			params[0].addEventListener('change',function(){com.dinfogarneau.cours526.afficherCacherArrondissement(arrondissements[params[1]]);},false);
		}
		else if (type == "global"){
			params[0].addEventListener('change',function(){com.dinfogarneau.cours526.toutCocherDecocher(params[0]);},false);
		}
	}
};

// Permet d'afficher ou de cacher un arrondissement
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

// Permet de tout cocher ou tout décocher les arrondissements
com.dinfogarneau.cours526.toutCocherDecocher = function (checkbox){
	
	// Récupère toutes les boites à cocher des arrondissements
	var chkArrondissements = document.getElementsByName("arrondissements");
	var cocher, texte;
	// Détermine l'action à effectuer et le texte à afficher selon l'état de la boite à cocher
	if(!checkbox.checked) {
		cocher = false;
		texte = "Tout cocher";
	} else {  
		cocher = true;
		texte = "Tout décocher";
	}
	
	// Récupère le label de la boite à cocher et met le texte à jour
	var label = com.dinfogarneau.cours526.findLabelForControl(checkbox);
	label.textContent = texte;
	
	// Pour chaque arrondissement, si la boite n'est pas à l'état désiré, on appel l'événement change de cette boite et on change son état
	for(var i = 0; i < chkArrondissements.length; i++){
		if(chkArrondissements[i].checked != cocher){
			// Appel l'event change (le fait de changer la propriété "checked" ne lance pas l'événement)
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