-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- G√©n√©r√© le: Jeu 17 Octobre 2013 √† 23:12
-- Version du serveur: 5.6.12-log
-- Version de PHP: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de donn√©es: `tp2-526-zap`
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
-- Contraintes pour les tables exportÈes
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
('kml_1', 'Sainte-Foy‚ÄìSillery‚ÄìCap-Rouge', 'Biblioth√®que Monique-Corriveau', 999, 'Avenue Roland-Beaudin', '\0\0\0\0\0\0\0Àºº	”Q¿êÒ·bG@'),
('kml_10', 'Laurentien', 'Biblioth√®que F√©lix-Leclerc', 1465, 'Rue de l''Innovation', '\0\0\0\0\0\0\0	Ω0ﬁ€⁄Q¿ßô¡mG@'),
('kml_11', 'Beauport', 'Biblioth√®que √âtienne-Parent', 3515, 'Rue Cl√©menceau', '\0\0\0\0\0\0\0ñípÄÕQ¿uCJÓŒnG@'),
('kml_12', 'Beauport', 'Biblioth√®que du Chemin-Royal', 3095, 'Chemin Royal', '\0\0\0\0\0\0\0¥v#èÕQ¿J—áù«lG@'),
('kml_13', 'La Haute-Saint-Charles', 'Biblioth√®que Le Tournesol', 530, 'Rue Delage', '\0\0\0\0\0\0\0…™‰ÇÿQ¿l\0AØ''tG@'),
('kml_14', 'Charlesbourg', 'Point de service du Jardin', 4215, 'Avenue des Sauges', '\0\0\0\0\0\0\08ëıa&“Q¿Õ„bV≈pG@'),
('kml_15', 'Sainte-Foy‚ÄìSillery‚ÄìCap-Rouge', 'Point de service Champigny', 1465, 'Rue F√©lix-Antoine-Savard', '\0\0\0\0\0\0\0Ö≤=†◊Q¿8•üûcG@'),
('kml_16', 'Charlesbourg', 'Point de service Bon-Pasteur', 425, 'Rue du Bienheureux Jean-XXIII', '\0\0\0\0\0\0\0n''Üj√”Q¿@:∞ÕLsG@'),
('kml_17', 'La Haute-Saint-Charles', 'Biblioth√®que Chrystine-Brouillet', 262, 'Rue Racine', '\0\0\0\0\0\0\0—€‹◊Q¿ \Zá«#mG@'),
('kml_18', 'Sainte-Foy‚ÄìSillery‚ÄìCap-Rouge', 'Maison de la d√©couverte', 835, 'avenue Wilfrid-Laurier', '\0\0\0\0\0\0\0qà¨"üÕQ¿Z6ñPKgG@'),
('kml_19', 'La Cit√©-Limoilou', 'Place d''Youville', 0, NULL, '\0\0\0\0\0\0\0⁄[õ5ØÕQ¿Û∫Ù˙gG@'),
('kml_2', 'Charlesbourg', 'Biblioth√®que de Charlesbourg', 7950, '1i√®re Avenue', '\0\0\0\0\0\0\0éqÿ¯4—Q¿&ñ{≠.nG@'),
('kml_20', 'Sainte-Foy‚ÄìSillery‚ÄìCap-Rouge', 'March√© de Sainte-Foy', 939, 'Avenue Roland-Beaudin', '\0\0\0\0\0\0\0ƒ˛Ë”Q¿-Ä1€bG@'),
('kml_21', 'Sainte-Foy‚ÄìSillery‚ÄìCap-Rouge', 'Avenue Roland-Beaudin', 0, NULL, '\0\0\0\0\0\0\0—uê:;”Q¿R¥öòÆbG@'),
('kml_22', 'La Cit√©-Limoilou', 'Palais Montcalm', 995, 'Place D''Youville', '\0\0\0\0\0\0\0\0»ÒßÕQ¿‹ €–ÓgG@'),
('kml_23', 'La Cit√©-Limoilou', 'Parc de l''H√¥tel-de-ville', 2, 'Rue des Jardins', '\0\0\0\0\0\0\0]5ÚÙRÕQ¿§¨ÍhG@'),
('kml_24', 'Les Rivi√®res', 'Ar√©na de Duberger', 3050, 'Boulevard Central', '\0\0\0\0\0\0\0õZè»“Q¿%øH˜hG@'),
('kml_25', 'Les Rivi√®res', 'Ar√©na Ga√©tan Duchesne', 2650, 'Avenue D''Alembert', '\0\0\0\0\0\0\0`	ËÃ‘Q¿⁄Ò‹õgG@'),
('kml_26', 'Les Rivi√®res', 'Ar√©na Patrick Poulin', 220, 'Avenue du Chanoine-C√¥t√©', '\0\0\0\0\0\0\0ÍèpÏY–Q¿gÂ˛!dhG@'),
('kml_27', 'Les Rivi√®res', 'Ar√©na Centre communautaire Michel-Labadie', 3705, 'Avenue Chauveau', '\0\0\0\0\0\0\0¬±ù÷/÷Q¿0±b''îjG@'),
('kml_28', 'Beauport', 'Centre sportif Marcel-B√©dard', 655, 'Boulevard des Chutes', '\0\0\0\0\0\0\0‡S#ı$ÃQ¿*3∂¨√mG@'),
('kml_29', 'Beauport', 'Ar√©na de Giffard', 3500, 'Rue Cambronne', '\0\0\0\0\0\0\0@ßONbÕQ¿ÒÈ≠MnG@'),
('kml_3', 'Sainte-Foy‚ÄìSillery‚ÄìCap-Rouge', 'Biblioth√®que Charles-H.-Blais', 1445, 'Avenue Maguire', '\0\0\0\0\0\0\0§L∏j–Q¿⁄hDÁ≈cG@'),
('kml_30', 'Beauport', 'Ar√©na Gilles Tremblay', 1011, 'Avenue Larue', '\0\0\0\0\0\0\00˝äAÀQ¿OËBÀqG@'),
('kml_31', 'La Cit√©-Limoilou', 'Ar√©na Bardy', 2280, 'Avenue Monseigneur-Gosselin', '\0\0\0\0\0\0\0≠ÏEŒQ¿à.ÀlG@'),
('kml_32', 'La Haute-Saint-Charles', 'Pavillon des sports de Loretteville', 86, 'Boulevard des √âtudiants', '\0\0\0\0\0\0\0ãÒG©0◊Q¿R\rzx¶mG@'),
('kml_33', 'Sainte-Foy‚ÄìSillery‚ÄìCap-Rouge', 'Centre communautaire Claude-Allard', 3200, 'Avenue D''Amours', '\0\0\0\0\0\0\0 Cã–p‘Q¿''Ÿ°‚,cG@'),
('kml_34', 'La Cit√©-Limoilou', 'Centre Lucien-Borne', 100, 'Chemin Sainte-foy', '\0\0\0\0\0\0\0ÜÙì;ßŒQ¿c".gG@'),
('kml_35', 'Beauport', 'Centre du Fargy', 2, 'Rue Fargy', '\0\0\0\0\0\0\0±πøs%ÃQ¿«*îïﬂmG@'),
('kml_36', 'La Cit√©-Limoilou', 'Centre r√©cr√©atif Mgr-Bouffard', 680, 'Raoul-Jobin', '\0\0\0\0\0\0\0˜é%◊ùœQ¿NU¥◊jgG@'),
('kml_37', 'La Cit√©-Limoilou', 'Domaine Maizeret', 2000, 'Boulevard Montmorency', '\0\0\0\0\0\0\08ü ®ØÕQ¿≠ê®c˜jG@'),
('kml_38', 'La Cit√©-Limoilou', 'Centre St-Roch', 230, 'Rue du Pont', '\0\0\0\0\0\0\0—fVºMŒQ¿êa£®∞hG@'),
('kml_39', 'Sainte-Foy‚ÄìSillery‚ÄìCap-Rouge', 'Centre communautaire No√´l-Br√ªlart', 1229, 'Avenue du Chanoine-Morel', '\0\0\0\0\0\0\0~øK˘œQ¿≤∏+kÖdG@'),
('kml_4', 'Charlesbourg', 'Ar√©na Arpidrome de Charlesbourg', 750, 'Rue de la Sorbonne', '\0\0\0\0\0\0\0sœås–Q¿SÚpg•nG@'),
('kml_40', 'La Cit√©-Limoilou', 'Loisirs Montcalm', 265, 'Boulevard Ren√©-L√©vesque', NULL),
('kml_41', 'La Cit√©-Limoilou', 'Centre Mgr-Marcoux', 1885, 'Chemin de la Canardi√®re', NULL),
('kml_42', 'Les Rivi√®res', 'Centre Jos-A-Lachance', 2920, 'Rue Claisse', '\0\0\0\0\0\0\0€pmZ‘Q¿œπ9‹}hG@'),
('kml_43', 'Les Rivi√®res', 'Comptoir Lebourgneuf', 1650, 'Boulevard de la Morille', '\0\0\0\0\0\0\0”5Ù˙¨”Q¿î´”≠œkG@'),
('kml_44', 'Les Rivi√®res', 'Centre communautaire Jean-Baptiste-Lafrance', 4075, 'Rue Maria-Goretti', '\0\0\0\0\0\0\0cû;JÏ”Q¿»u˘gØfG@'),
('kml_45', 'Beauport', 'Camping de Beauport', 95, 'Rue de la S√©r√©nit√©', '\0\0\0\0\0\0\0p—ÁfÀQ¿Q?9ÆŒrG@'),
('kml_46', 'La Haute-Saint-Charles', 'Centre Culturel Georges-Dor', 3490, 'Route de l''A√©roport', '\0\0\0\0\0\0\0G<›€Q¿¶¢ŸlÛkG@'),
('kml_47', 'La Haute-Saint-Charles', 'Centre Communautaire Loretteville', 305, 'Rue Racine', '\0\0\0\0\0\0\0IQ√ì◊Q¿-qöHﬁlG@'),
('kml_48', 'La Haute-Saint-Charles', 'Centrale des organismes de La Haute-Saint-Charles', 510, 'Rue Delage', NULL),
('kml_49', 'La Cit√©-Limoilou', 'Centre communautaire Ferland', 1800, '8e Avenue', NULL),
('kml_5', 'Sainte-Foy‚ÄìSillery‚ÄìCap-Rouge', 'Piscine Sylvie Bernier', 3020, 'Boulevard Hochelaga', '\0\0\0\0\0\0\0!Ò<”Q¿h˘Ã¨1bG@'),
('kml_50', 'Sainte-Foy‚ÄìSillery‚ÄìCap-Rouge', 'Parc Nautique Cap-Rouge', 4155, 'Chemin de la Plage-Jacques-Cartier', '\0\0\0\0\0\0\0©ƒ•˙›’Q¿''Sæü_G@'),
('kml_51', 'Sainte-Foy‚ÄìSillery‚ÄìCap-Rouge', 'Base de Plein air de Sainte-Foy (Maison Laberge)', 3206, 'Rue Laberge', '\0\0\0\0\0\0\0TxƒO’Q¿€B»Á÷dG@'),
('kml_52', 'La Cit√©-Limoilou', 'Stade Municipal', 100, 'Rue du Cardinal-Maurice-Roy', '\0\0\0\0\0\0\0&C''D˜ŒQ¿ÅeßîÀhG@'),
('kml_53', 'Sainte-Foy‚ÄìSillery‚ÄìCap-Rouge', 'Piscine Jacques-Amyot', 3643, 'Avenue des Compagnons', '\0\0\0\0\0\0\0fŒ`’Q¿Õ-c/aG@'),
('kml_54', 'St-Roch sans fil', NULL, NULL, NULL, '\0\0\0\0\0\0\0»9!5iŒQ¿ÔÅ.f8hG@'),
('kml_55', '295', 'Boulevard Charest Est', 0, NULL, '\0\0\0\0\0\0\0´§NæwŒQ¿ÇUÏ<\rhG@'),
('kml_56', 'La Haute-Saint-Charles', 'Centre communautaire Paul-√âmile-Beaulieu', 530, 'Rue Delage', '\0\0\0\0\0\0\0[gË7ÿQ¿Öﬁ±¶!tG@'),
('kml_57', 'Les Rivi√®res', 'Centre Elz√©ar-Turcotte', 2455, 'Boulevard Central', '\0\0\0\0\0\0\0-Áà€ “Q¿}ëÛF»gG@'),
('kml_58', 'Sainte-Foy‚ÄìSillery‚ÄìCap-Rouge', 'Centre communautaire Cap-rouge', 4473, 'rue Saint-F√©lix', '\0\0\0\0\0\0\0/õ\Z´÷Q¿€Ï$Z‹^G@'),
('kml_6', 'Sainte-Foy‚ÄìSillery‚ÄìCap-Rouge', 'Centre sportif Ste-Foy', 930, 'Avenue Roland-Beaudin', '\0\0\0\0\0\0\0cºY’0”Q¿ÌÃÎ´©bG@'),
('kml_7', 'Sainte-Foy‚ÄìSillery‚ÄìCap-Rouge', 'Bureau Information Touristique Sainte-Foy', 3300, 'Avenue des H√¥tels', '\0\0\0\0\0\0\0},qzœ“Q¿€∂enÊ`G@'),
('kml_8', 'Sainte-Foy‚ÄìSillery‚ÄìCap-Rouge', 'Biblioth√®que Roger-Lemelin', 4705, 'Rue de la Promenade-des-Soeurs', '\0\0\0\0\0\0\0è¥(◊Q¿Üp&ó_G@'),
('kml_9', 'Laurentien', 'Centre Culturel Georges-D''Or', 3490, 'Route de l''A√©roport', '\0\0\0\0\0\0\0ÔoVô›€Q¿j¡ë\nÙkG@');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
