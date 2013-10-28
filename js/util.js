/************************************************
	Bouchard-Marceau, Marc-Antoine
	Ouellet, Francis
	
	util.js
	Dernière modification : 2013-10-27
************************************************/

com.dinfogarneau.cours526.chargerScriptAsync = function (urlFichier, callbackFct) {
	var script = document.createElement('script');
	script.src = urlFichier;
	script.async = true;
	// Fonction de callback (optionnel) après le chargement asynchrone du script.
	if (typeof callbackFct == "function") {
		script.addEventListener('load', callbackFct, false);
	}
	document.documentElement.firstChild.appendChild(script);
};

com.dinfogarneau.cours526.$ = function (idElem) {
	return document.getElementById(idElem);
};

com.dinfogarneau.cours526.gestionMenu = function () {

	if (com.dinfogarneau.cours526.$("menu-info").className == "menu-info-cache") {
		com.dinfogarneau.cours526.$("menu-info").className = "menu-info";
	} else {
		com.dinfogarneau.cours526.$("menu-info").className = "menu-info-cache";
	}
	
	if (com.dinfogarneau.cours526.$("contenu-menu-info").className == "contenu-menu-info") {
		com.dinfogarneau.cours526.$("contenu-menu-info").className = "contenu-menu-info-cache"
	} else {
		com.dinfogarneau.cours526.$("contenu-menu-info").className = "contenu-menu-info"
	}
	
	if (com.dinfogarneau.cours526.$("controle").className == "controle") {
		com.dinfogarneau.cours526.$("controle").className = "controle-cache";
	} else {
		com.dinfogarneau.cours526.$("controle").className = "controle";
	}
}

