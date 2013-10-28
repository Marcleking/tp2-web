<?php
/************************************************
	Bouchard-Marceau, Marc-Antoine
	Ouellet, Francis
	
	extrait-wifi.php
	Dernière modification : 2013-10-27
************************************************/

//Création de la structure de la base de donnée

	//Connexion à la base de données
	require("../include/param-bd.inc");
	try {
		$connBD = new PDO("mysql:host=$dbHote; dbname=$dbNom", $dbUtilisateur, $dbMotPasse, array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8"));
		// Pour lancer les exceptions lorsqu'il y des erreurs PDO.
		$connBD -> setAttribute( PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION );
	} catch (PDOException $e) {
		exit( "Erreur lors de la connexion à la BD :<br />\n" .  $e->getMessage() );
	}
	
	//Création des tables
	try {
		/////////////À supprimer
		$reqProf = "DROP TABLE Avis, wifi";
		$prepReqProf = $connBD -> prepare($reqProf);
		$prepReqProf -> execute();
	
		//Création de la table (si elle n'existe pas) listant les wifi
		$reqProf = "CREATE TABLE IF NOT EXISTS wifi (	Id smallint(5) NOT NULL,
														Arrondissement varchar(255) NOT NULL,
														Nom_batiment varchar(255),
														No_civique smallint(5) unsigned,
														Rue varchar(255),
														Coordonnee point,
														PRIMARY KEY (id)
														)";
		$prepReqProf = $connBD -> prepare($reqProf);
		$prepReqProf -> execute();
		
		//Création de la table (si elle n'existe pas) listant les avis sur les wifi
		$reqProf = "CREATE TABLE IF NOT EXISTS Avis (	Id int NOT NULL AUTO_INCREMENT,
														Commentaire varchar(5000) NOT NULL,
														IdWifi smallint(5) NOT NULL,
														FOREIGN KEY (IdWifi) REFERENCES wifi(Id),
														PRIMARY KEY (Id)
														)";
		$prepReqProf = $connBD -> prepare($reqProf);
		$prepReqProf -> execute();
	} catch (PDOException $e) {
		exit( "Erreur lors de l'exécution de la requête SQL :<br />\n" .  $e -> getMessage() . "<br />\nREQUÊTE = " . $reqProf );
	}

	//Extraction des données sur les wifi
	$xml=simplexml_load_file("../donnees-ouvertes/wifi.kml");

	foreach($xml->Document->Folder->Placemark as $child)
	{
		if($child->count() > 0) {
			//nom
			$id = str_replace("kml_", '', $child->name);
			
			//Arrondissement
			$arrondissement = $child->ExtendedData->SchemaData->SimpleData;
			
			//No civique
			$no_civique = $child->ExtendedData->SchemaData->children()[1];
			
			//Rue
			$rue = $child->ExtendedData->SchemaData->children()[3];
			
			//Nom du batiment
			$nom_batiment = $child->ExtendedData->SchemaData->children()[2];
			
			if ($nom_batiment == "") {
				$nom_batiment = "Nom du batiment indisponible";
			}
			//Coordonnée
			if (isset($child->children()[4])) {
				$coordonnee = $child->children()[4]->children();
			} else {
				$coordonnee = null;
			}
			
			try {
				//Insertion des données dans la table des wifi
				$reqProf = "INSERT INTO wifi
								VALUES (:id, :Arrondissement, :Nom_batiment, :No_civique, :Rue, PointFromText(:Coordonnee));";
				$prepReqProf = $connBD -> prepare($reqProf);
				
				//Création de la coordonnée pour MySQL
				if ($coordonnee != null) {
					$laCoordonnee = "Point(" . explode(",", $coordonnee)[0] . " " . explode(",", $coordonnee)[1] . ")<br />";
				} else {
					$laCoordonnee = null;
				}
				
				$prepReqProf -> execute(array(	"id" => $id,
												"Arrondissement" => $arrondissement,
												"Nom_batiment" => $nom_batiment,
												"No_civique" => $no_civique,
												"Rue" => $rue,
												"Coordonnee" => $laCoordonnee
												));
			} catch (PDOException $e) {
				exit( "Erreur lors de l'exécution de la requête SQL :<br />\n" .  $e -> getMessage() . "<br />\nREQUÊTE = " . $reqProf );
			}
		}
	}
?>