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

