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
		exit( "Erreur lors de la connexion à la BD :<br />\n" .  $e->getMessage() );
	}
	
	//Requète sur la base de données pour aller chercher tout les wifi
	try {
		$req = "SELECT Id, Arrondissement, Nom_batiment, No_civique, Rue,  X(Coordonnee) as 'X', Y(Coordonnee) as 'Y' FROM wifi";
		$prepReq = $connBD -> prepare($req);
		$prepReq -> execute();
		$prepReq -> setFetchMode(PDO::FETCH_OBJ);
	} catch (PDOException $e) {
		exit( "Erreur lors de l'exécution de la requête SQL :<br />\n" .  $e -> getMessage() . "<br />\nREQUÊTE = " . $req);
	}
	
	// Production de l'expression JSON contenant tout les wifi à retourner.
	$json = "{\n\t\"wifi\" : [\n";
	while($info = $prepReq->fetch())
	{
		$id = $info->Id;
		$Arrondissement = $info->Arrondissement;
		$Nom_batiment = $info->Nom_batiment;
		$No_civique = $info->No_civique;
		$Rue = $info->Rue;
		$Coordonnee = $info->X . ',' . $info->Y;
		
		$json .= "\t{\n";
			$json .= "\t\"id\": \"$id\",\n";
			$json .= "\t\"Arrondissement\": \"$Arrondissement\",\n";
			$json .= "\t\"Nom_batiment\": \"$Nom_batiment\",\n";
			$json .= "\t\"No_civique\": \"$No_civique\",\n";
			$json .= "\t\"Rue\": \"$Rue\",\n";
			$json .= "\t\"Coordonnee\": \"$Coordonnee\"\n";
		$json .= "\t},\n";
	}
	$json .= "]}\n";
	$json[strlen ($json) - 5] = ' ';
	echo $json;
	
	//Fermeture de la requète et de la base de donnée
	$prepReq -> closeCursor();
	$connBD = null;

	//Gestion du message d'erreur
	if ( $msgErreur != null )
	{
		echo "{\n";
		echo "\t\"erreur\":\n";
		echo "\t{\n";
			echo "\t\t\"message\": \"" . str_replace("\"", "\\\"", $msgErreur) . "\"\n";
		echo "\t}\n";
		echo "}\n";
	}

	// Simulation d'un délai avant de fournir la réponse;
	// ceci permet de voir la zone indiquant le chargement AJAX et de réaliser que la requête HTTP est asynchrone.
	//sleep(2);
?>