-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Jeu 17 Octobre 2013 à 23:12
-- Version du serveur: 5.6.12-log
-- Version de PHP: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `tp2-526-zap`
--

-- --------------------------------------------------------

--
-- Structure de la table `wifi`
--

CREATE TABLE IF NOT EXISTS `wifi` (
  `Id` varchar(10) COLLATE utf8_bin NOT NULL,
  `Arrondissement` varchar(255) COLLATE utf8_bin NOT NULL,
  `Nom_batiment` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `No_civique` smallint(5) unsigned DEFAULT NULL,
  `Rue` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `Coordonnee` point DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


CREATE TABLE IF NOT EXISTS `avis` (
  `Commentaire` varchar(5000) COLLATE utf8_bin NOT NULL,
  `IdWifi` varchar(10) COLLATE utf8_bin NOT NULL,
  KEY `IdWifi` (`IdWifi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contraintes pour les tables export�es
--

--
-- Contraintes pour la table `avis`
--
ALTER TABLE `avis`
  ADD CONSTRAINT `avis_ibfk_1` FOREIGN KEY (`IdWifi`) REFERENCES `wifi` (`Id`);

--
-- Contenu de la table `wifi`
--

INSERT INTO `wifi` (`Id`, `Arrondissement`, `Nom_batiment`, `No_civique`, `Rue`, `Coordonnee`) VALUES
('kml_1', 'Sainte-Foy–Sillery–Cap-Rouge', 'Bibliothèque Monique-Corriveau', 999, 'Avenue Roland-Beaudin', '\0\0\0\0\0\0\0˼�	�Q����bG@'),
('kml_10', 'Laurentien', 'Bibliothèque Félix-Leclerc', 1465, 'Rue de l''Innovation', '\0\0\0\0\0\0\0	�0���Q����mG@'),
('kml_11', 'Beauport', 'Bibliothèque Étienne-Parent', 3515, 'Rue Clémenceau', '\0\0\0\0\0\0\0��p��Q�uCJ��nG@'),
('kml_12', 'Beauport', 'Bibliothèque du Chemin-Royal', 3095, 'Chemin Royal', '\0\0\0\0\0\0\0�v#��Q�Jч��lG@'),
('kml_13', 'La Haute-Saint-Charles', 'Bibliothèque Le Tournesol', 530, 'Rue Delage', '\0\0\0\0\0\0\0ɪ��Q�l\0A�''tG@'),
('kml_14', 'Charlesbourg', 'Point de service du Jardin', 4215, 'Avenue des Sauges', '\0\0\0\0\0\0\08��a&�Q���bV�pG@'),
('kml_15', 'Sainte-Foy–Sillery–Cap-Rouge', 'Point de service Champigny', 1465, 'Rue Félix-Antoine-Savard', '\0\0\0\0\0\0\0��=��Q�8���cG@'),
('kml_16', 'Charlesbourg', 'Point de service Bon-Pasteur', 425, 'Rue du Bienheureux Jean-XXIII', '\0\0\0\0\0\0\0n''�j��Q�@:��LsG@'),
('kml_17', 'La Haute-Saint-Charles', 'Bibliothèque Chrystine-Brouillet', 262, 'Rue Racine', '\0\0\0\0\0\0\0����Q��\Z��#mG@'),
('kml_18', 'Sainte-Foy–Sillery–Cap-Rouge', 'Maison de la découverte', 835, 'avenue Wilfrid-Laurier', '\0\0\0\0\0\0\0q��"��Q�Z6�PKgG@'),
('kml_19', 'La Cité-Limoilou', 'Place d''Youville', 0, NULL, '\0\0\0\0\0\0\0�[�5��Q����gG@'),
('kml_2', 'Charlesbourg', 'Bibliothèque de Charlesbourg', 7950, '1ière Avenue', '\0\0\0\0\0\0\0�q��4�Q�&�{�.nG@'),
('kml_20', 'Sainte-Foy–Sillery–Cap-Rouge', 'Marché de Sainte-Foy', 939, 'Avenue Roland-Beaudin', '\0\0\0\0\0\0\0����Q�-�1�bG@'),
('kml_21', 'Sainte-Foy–Sillery–Cap-Rouge', 'Avenue Roland-Beaudin', 0, NULL, '\0\0\0\0\0\0\0�u�:;�Q�R����bG@'),
('kml_22', 'La Cité-Limoilou', 'Palais Montcalm', 995, 'Place D''Youville', '\0\0\0\0\0\0\0\0���Q������gG@'),
('kml_23', 'La Cité-Limoilou', 'Parc de l''Hôtel-de-ville', 2, 'Rue des Jardins', '\0\0\0\0\0\0\0]5��R�Q����hG@'),
('kml_24', 'Les Rivières', 'Aréna de Duberger', 3050, 'Boulevard Central', '\0\0\0\0\0\0\0�Z���Q�%�H�hG@'),
('kml_25', 'Les Rivières', 'Aréna Gaétan Duchesne', 2650, 'Avenue D''Alembert', '\0\0\0\0\0\0\0`	���Q���ܛgG@'),
('kml_26', 'Les Rivières', 'Aréna Patrick Poulin', 220, 'Avenue du Chanoine-Côté', '\0\0\0\0\0\0\0�p�Y�Q�g��!dhG@'),
('kml_27', 'Les Rivières', 'Aréna Centre communautaire Michel-Labadie', 3705, 'Avenue Chauveau', '\0\0\0\0\0\0\0±��/�Q�0�b''�jG@'),
('kml_28', 'Beauport', 'Centre sportif Marcel-Bédard', 655, 'Boulevard des Chutes', '\0\0\0\0\0\0\0�S#�$�Q�*3���mG@'),
('kml_29', 'Beauport', 'Aréna de Giffard', 3500, 'Rue Cambronne', '\0\0\0\0\0\0\0@�ONb�Q���MnG@'),
('kml_3', 'Sainte-Foy–Sillery–Cap-Rouge', 'Bibliothèque Charles-H.-Blais', 1445, 'Avenue Maguire', '\0\0\0\0\0\0\0�L�j�Q��hD��cG@'),
('kml_30', 'Beauport', 'Aréna Gilles Tremblay', 1011, 'Avenue Larue', '\0\0\0\0\0\0\00��A�Q�O�B�qG@'),
('kml_31', 'La Cité-Limoilou', 'Aréna Bardy', 2280, 'Avenue Monseigneur-Gosselin', '\0\0\0\0\0\0\0��E�Q��.�lG@'),
('kml_32', 'La Haute-Saint-Charles', 'Pavillon des sports de Loretteville', 86, 'Boulevard des Étudiants', '\0\0\0\0\0\0\0��G�0�Q�R\rzx�mG@'),
('kml_33', 'Sainte-Foy–Sillery–Cap-Rouge', 'Centre communautaire Claude-Allard', 3200, 'Avenue D''Amours', '\0\0\0\0\0\0\0�C��p�Q�''١�,cG@'),
('kml_34', 'La Cité-Limoilou', 'Centre Lucien-Borne', 100, 'Chemin Sainte-foy', '\0\0\0\0\0\0\0���;��Q�c".gG@'),
('kml_35', 'Beauport', 'Centre du Fargy', 2, 'Rue Fargy', '\0\0\0\0\0\0\0���s%�Q��*���mG@'),
('kml_36', 'La Cité-Limoilou', 'Centre récréatif Mgr-Bouffard', 680, 'Raoul-Jobin', '\0\0\0\0\0\0\0��%ם�Q�NU��jgG@'),
('kml_37', 'La Cité-Limoilou', 'Domaine Maizeret', 2000, 'Boulevard Montmorency', '\0\0\0\0\0\0\08� ���Q����c�jG@'),
('kml_38', 'La Cité-Limoilou', 'Centre St-Roch', 230, 'Rue du Pont', '\0\0\0\0\0\0\0�fV�M�Q��a���hG@'),
('kml_39', 'Sainte-Foy–Sillery–Cap-Rouge', 'Centre communautaire Noël-Brûlart', 1229, 'Avenue du Chanoine-Morel', '\0\0\0\0\0\0\0~�K��Q���+k�dG@'),
('kml_4', 'Charlesbourg', 'Aréna Arpidrome de Charlesbourg', 750, 'Rue de la Sorbonne', '\0\0\0\0\0\0\0sόs�Q�S�pg�nG@'),
('kml_40', 'La Cité-Limoilou', 'Loisirs Montcalm', 265, 'Boulevard René-Lévesque', NULL),
('kml_41', 'La Cité-Limoilou', 'Centre Mgr-Marcoux', 1885, 'Chemin de la Canardière', NULL),
('kml_42', 'Les Rivières', 'Centre Jos-A-Lachance', 2920, 'Rue Claisse', '\0\0\0\0\0\0\0�pmZ�Q�Ϲ9�}hG@'),
('kml_43', 'Les Rivières', 'Comptoir Lebourgneuf', 1650, 'Boulevard de la Morille', '\0\0\0\0\0\0\0�5����Q���ӭ�kG@'),
('kml_44', 'Les Rivières', 'Centre communautaire Jean-Baptiste-Lafrance', 4075, 'Rue Maria-Goretti', '\0\0\0\0\0\0\0c�;J��Q��u�g�fG@'),
('kml_45', 'Beauport', 'Camping de Beauport', 95, 'Rue de la Sérénité', '\0\0\0\0\0\0\0p��f�Q�Q?9��rG@'),
('kml_46', 'La Haute-Saint-Charles', 'Centre Culturel Georges-Dor', 3490, 'Route de l''Aéroport', '\0\0\0\0\0\0\0G<��Q����l�kG@'),
('kml_47', 'La Haute-Saint-Charles', 'Centre Communautaire Loretteville', 305, 'Rue Racine', '\0\0\0\0\0\0\0IQÓ�Q�-q�H�lG@'),
('kml_48', 'La Haute-Saint-Charles', 'Centrale des organismes de La Haute-Saint-Charles', 510, 'Rue Delage', NULL),
('kml_49', 'La Cité-Limoilou', 'Centre communautaire Ferland', 1800, '8e Avenue', NULL),
('kml_5', 'Sainte-Foy–Sillery–Cap-Rouge', 'Piscine Sylvie Bernier', 3020, 'Boulevard Hochelaga', '\0\0\0\0\0\0\0!�<�Q�h�̬1bG@'),
('kml_50', 'Sainte-Foy–Sillery–Cap-Rouge', 'Parc Nautique Cap-Rouge', 4155, 'Chemin de la Plage-Jacques-Cartier', '\0\0\0\0\0\0\0�ĥ���Q�''S��_G@'),
('kml_51', 'Sainte-Foy–Sillery–Cap-Rouge', 'Base de Plein air de Sainte-Foy (Maison Laberge)', 3206, 'Rue Laberge', '\0\0\0\0\0\0\0Tx�O�Q��B���dG@'),
('kml_52', 'La Cité-Limoilou', 'Stade Municipal', 100, 'Rue du Cardinal-Maurice-Roy', '\0\0\0\0\0\0\0&C''D��Q��e���hG@'),
('kml_53', 'Sainte-Foy–Sillery–Cap-Rouge', 'Piscine Jacques-Amyot', 3643, 'Avenue des Compagnons', '\0\0\0\0\0\0\0f�`�Q��-c/aG@'),
('kml_54', 'St-Roch sans fil', NULL, NULL, NULL, '\0\0\0\0\0\0\0�9!5i�Q��.f8hG@'),
('kml_55', '295', 'Boulevard Charest Est', 0, NULL, '\0\0\0\0\0\0\0��N�w�Q��U�<\rhG@'),
('kml_56', 'La Haute-Saint-Charles', 'Centre communautaire Paul-Émile-Beaulieu', 530, 'Rue Delage', '\0\0\0\0\0\0\0[g�7�Q��ޱ�!tG@'),
('kml_57', 'Les Rivières', 'Centre Elzéar-Turcotte', 2455, 'Boulevard Central', '\0\0\0\0\0\0\0-����Q�}��F�gG@'),
('kml_58', 'Sainte-Foy–Sillery–Cap-Rouge', 'Centre communautaire Cap-rouge', 4473, 'rue Saint-Félix', '\0\0\0\0\0\0\0/�\Z��Q���$Z�^G@'),
('kml_6', 'Sainte-Foy–Sillery–Cap-Rouge', 'Centre sportif Ste-Foy', 930, 'Avenue Roland-Beaudin', '\0\0\0\0\0\0\0c�Y�0�Q���뫩bG@'),
('kml_7', 'Sainte-Foy–Sillery–Cap-Rouge', 'Bureau Information Touristique Sainte-Foy', 3300, 'Avenue des Hôtels', '\0\0\0\0\0\0\0},qz��Q�۶en�`G@'),
('kml_8', 'Sainte-Foy–Sillery–Cap-Rouge', 'Bibliothèque Roger-Lemelin', 4705, 'Rue de la Promenade-des-Soeurs', '\0\0\0\0\0\0\0��(�Q��p&�_G@'),
('kml_9', 'Laurentien', 'Centre Culturel Georges-D''Or', 3490, 'Route de l''Aéroport', '\0\0\0\0\0\0\0�oV���Q�j��\n�kG@');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
