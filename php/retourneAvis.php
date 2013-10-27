<?php
	header("Content-type: application/json; charset=utf-8");
	header("Expires: Thu, 19 Nov 1981 08:52:00 GMT");
	header("Cache-Control: no-store, no-cache, must-revalidate, post-check=0, pre-check=0");
	header("Pragma: no-cache");

	$msgErreur = null;
	
	//Connexion à la base de données
	require("../include/param-bd.inc");
	try {
		$connBD = new PDO("mysql:host=$dbHote; dbname=$dbNom", $dbUtilisateur, $dbMotPasse, array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8"));
		$connBD -> setAttribute( PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION );
	} catch (PDOException $e) {
		exit("{\"Erreur\" : \"Erreur lors de la connexion à la BD : " .  $e->getMessage() . "\"}" );
	}
	
		//Requète sur la base de données pour aller chercher tout les wifi
		try {
			$req = "SELECT * FROM avis order by idWifi";
			$prepReq = $connBD -> prepare($req);
			$prepReq -> execute();
			$obj = $prepReq -> fetchAll();
		} catch (PDOException $e) {
			exit( "{\"Erreur\" : \"Erreur lors de l'exécution de la requête SQL :<br />" .  $e -> getMessage() . "\nREQUÊTE = " . $req . "\"}");
		}
		echo json_encode($obj);
		// Production de l'expression JSON contenant tout les wifi à retourner.
		
		//Fermeture de la requète et de la base de donnée
		$prepReq -> closeCursor();
		$connBD = null;
?>