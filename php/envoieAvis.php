<?php
	header("Content-type: application/json; charset=utf-8");
	header("Expires: Thu, 19 Nov 1981 08:52:00 GMT");
	header("Cache-Control: no-store, no-cache, must-revalidate, post-check=0, pre-check=0");
	header("Pragma: no-cache");

	if (isset($_POST["Commentaire"]) && isset($_POST["idWifi"])) {
		//Connexion à la base de données
		require("../include/param-bd.inc");
		try {
			$connBD = new PDO("mysql:host=$dbHote; dbname=$dbNom", $dbUtilisateur, $dbMotPasse, array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8"));
			$connBD -> setAttribute( PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION );
		} catch (PDOException $e) {
			exit("{\"Message\" : \"Erreur lors de la connexion à la BD.\"}" );
		}
		
		try {
			$req = "INSERT INTO avis VALUES (id, :Commentaire, :idWifi)";
			$prepReq = $connBD -> prepare($req);
			$prepReq -> execute(array(
								"Commentaire" => $_POST["Commentaire"],
								"idWifi" => $_POST["idWifi"]
								));
		} catch (PDOException $e) {
			exit("{\"Message\" : \"Erreur lors de l'envoie de l'avis. L'avis ne sera pas conservé.\"}");
		}
		
		$prepReq -> closeCursor();
		$connBD = null;

		echo "{\"Message\" : \"L'avis a bien été enregistré!\"}";
		
	} else {			
		echo "{\"Message\" : \"Veuillez entrez un avis sur un wifi.\"}";
	}
	// Simulation d'un délai avant de fournir la réponse;
	// ceci permet de voir la zone indiquant le chargement AJAX et de réaliser que la requête HTTP est asynchrone.
	//sleep(2);
?>