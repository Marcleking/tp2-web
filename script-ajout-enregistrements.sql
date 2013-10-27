-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Dim 27 Octobre 2013 à 22:56
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
CREATE DATABASE IF NOT EXISTS `tp2-526-zap` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `tp2-526-zap`;

-- --------------------------------------------------------

--
-- Structure de la table `avis`
--

CREATE TABLE IF NOT EXISTS `avis` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Commentaire` varchar(5000) COLLATE utf8_bin NOT NULL,
  `IdWifi` smallint(5) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IdWifi` (`IdWifi`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=101 ;

--
-- Contenu de la table `avis`
--

INSERT INTO `avis` (`Id`, `Commentaire`, `IdWifi`) VALUES
(1, 'aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at lacus. Quisque purus sapien, gravida non, sollicitudin', 52),
(2, 'in felis. Nulla tempor augue ac ipsum. Phasellus vitae mauris sit amet lorem semper auctor. Mauris vel turpis. Aliquam adipiscing lobortis risus. In mi', 47),
(3, 'habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce aliquet magna a neque. Nullam ut nisi a odio semper cursus. Integer mollis. Integer tincidunt aliquam', 14),
(4, 'ullamcorper, velit in aliquet lobortis, nisi nibh lacinia orci, consectetuer euismod est arcu ac orci. Ut semper pretium neque. Morbi quis urna. Nunc quis arcu vel quam dignissim pharetra. Nam ac nulla.', 56),
(5, 'Nullam vitae diam. Proin dolor. Nulla semper tellus id nunc interdum feugiat. Sed nec metus facilisis lorem tristique aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula', 6),
(6, 'penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel arcu eu odio tristique pharetra. Quisque ac', 15),
(7, 'imperdiet ullamcorper. Duis at lacus. Quisque purus sapien, gravida non, sollicitudin a, malesuada id, erat. Etiam vestibulum massa rutrum magna. Cras convallis convallis dolor. Quisque tincidunt pede ac urna. Ut tincidunt vehicula risus. Nulla', 15),
(8, 'magnis dis parturient montes, nascetur ridiculus mus. Donec dignissim magna a tortor. Nunc commodo auctor velit. Aliquam nisl. Nulla', 12),
(9, 'feugiat nec, diam. Duis mi enim, condimentum eget, volutpat ornare, facilisis eget, ipsum. Donec sollicitudin adipiscing ligula. Aenean gravida nunc sed pede. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus', 53),
(10, 'ante, iaculis nec, eleifend non, dapibus rutrum, justo. Praesent luctus. Curabitur egestas nunc sed libero. Proin sed turpis nec mauris blandit mattis. Cras eget nisi dictum augue malesuada malesuada. Integer id magna', 37),
(11, 'Curae; Donec tincidunt. Donec vitae erat vel pede blandit congue. In scelerisque scelerisque dui. Suspendisse ac metus vitae velit egestas lacinia. Sed congue, elit sed consequat auctor, nunc nulla vulputate dui, nec tempus', 38),
(12, 'ut, sem. Nulla interdum. Curabitur dictum. Phasellus in felis. Nulla tempor augue ac ipsum. Phasellus vitae mauris sit amet lorem semper auctor. Mauris vel turpis. Aliquam adipiscing lobortis risus. In mi', 49),
(13, 'fames ac turpis egestas. Aliquam fringilla cursus purus. Nullam scelerisque neque sed sem egestas blandit. Nam nulla magna, malesuada vel, convallis in, cursus et, eros. Proin ultrices.', 53),
(14, 'tortor. Nunc commodo auctor velit. Aliquam nisl. Nulla eu neque pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper, velit in aliquet lobortis, nisi nibh lacinia orci, consectetuer euismod est arcu', 36),
(15, 'fringilla est. Mauris eu turpis. Nulla aliquet. Proin velit. Sed malesuada augue ut lacus. Nulla tincidunt, neque vitae semper egestas, urna justo faucibus lectus, a sollicitudin orci sem eget massa. Suspendisse', 23),
(16, 'nec, eleifend non, dapibus rutrum, justo. Praesent luctus. Curabitur egestas nunc sed libero. Proin sed turpis nec mauris blandit mattis. Cras eget nisi dictum augue malesuada malesuada. Integer id magna et ipsum cursus', 42),
(17, 'tempus scelerisque, lorem ipsum sodales purus, in molestie tortor nibh sit amet orci. Ut sagittis lobortis mauris.', 43),
(18, 'Donec tempus, lorem fringilla ornare placerat, orci lacus vestibulum lorem, sit amet ultricies sem magna nec quam. Curabitur vel lectus. Cum sociis natoque', 24),
(19, 'cursus vestibulum. Mauris magna. Duis dignissim tempor arcu. Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non magna. Nam ligula elit, pretium et, rutrum non,', 43),
(20, 'Nulla aliquet. Proin velit. Sed malesuada augue ut lacus. Nulla tincidunt, neque vitae semper egestas, urna justo faucibus lectus, a sollicitudin orci sem eget massa.', 17),
(21, 'justo eu arcu. Morbi sit amet massa. Quisque porttitor eros nec tellus. Nunc lectus pede, ultrices a,', 2),
(22, 'Donec nibh. Quisque nonummy ipsum non arcu. Vivamus sit amet risus. Donec egestas. Aliquam nec enim. Nunc ut erat. Sed nunc est, mollis non, cursus non, egestas a, dui. Cras pellentesque.', 13),
(23, 'montes, nascetur ridiculus mus. Donec dignissim magna a tortor. Nunc commodo auctor velit. Aliquam nisl. Nulla eu neque pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper,', 5),
(24, 'natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel nisl. Quisque fringilla euismod enim. Etiam gravida molestie arcu. Sed eu nibh vulputate', 46),
(25, 'Nunc lectus pede, ultrices a, auctor non, feugiat nec, diam. Duis mi enim, condimentum eget, volutpat ornare,', 11),
(26, 'eleifend nec, malesuada ut, sem. Nulla interdum. Curabitur dictum. Phasellus in felis. Nulla tempor augue ac ipsum. Phasellus vitae mauris sit amet lorem semper auctor.', 43),
(27, 'mi enim, condimentum eget, volutpat ornare, facilisis eget, ipsum. Donec sollicitudin adipiscing ligula. Aenean gravida nunc sed pede. Cum', 13),
(28, 'Nulla eu neque pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper, velit in aliquet lobortis, nisi nibh lacinia orci, consectetuer euismod est arcu ac orci. Ut semper pretium neque. Morbi quis urna. Nunc', 52),
(29, 'ornare, libero at auctor ullamcorper, nisl arcu iaculis enim, sit amet ornare lectus justo eu arcu. Morbi sit amet massa. Quisque porttitor', 27),
(30, 'laoreet, libero et tristique pellentesque, tellus sem mollis dui, in sodales elit erat vitae risus. Duis a', 50),
(31, 'Aliquam tincidunt, nunc ac mattis ornare, lectus ante dictum mi, ac mattis velit justo nec ante. Maecenas mi felis, adipiscing fringilla, porttitor', 9),
(32, 'orci. Ut semper pretium neque. Morbi quis urna. Nunc quis arcu vel quam dignissim pharetra. Nam ac nulla. In tincidunt congue turpis. In', 15),
(33, 'mus. Proin vel arcu eu odio tristique pharetra. Quisque ac libero nec ligula consectetuer rhoncus. Nullam velit dui, semper et, lacinia vitae, sodales at, velit. Pellentesque ultricies dignissim', 55),
(34, 'eu tempor erat neque non quam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aliquam fringilla cursus purus. Nullam scelerisque neque sed sem egestas', 28),
(35, 'auctor vitae, aliquet nec, imperdiet nec, leo. Morbi neque tellus, imperdiet non, vestibulum nec, euismod in, dolor. Fusce feugiat. Lorem ipsum dolor sit amet, consectetuer', 45),
(36, 'rutrum urna, nec luctus felis purus ac tellus. Suspendisse sed dolor. Fusce mi lorem, vehicula et, rutrum eu, ultrices sit amet, risus. Donec nibh enim, gravida sit amet,', 56),
(37, 'In condimentum. Donec at arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec tincidunt. Donec vitae erat', 17),
(38, 'vel lectus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec dignissim magna a tortor. Nunc commodo auctor velit. Aliquam nisl. Nulla eu', 57),
(39, 'Phasellus libero mauris, aliquam eu, accumsan sed, facilisis vitae, orci. Phasellus dapibus quam quis diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames', 17),
(40, 'aliquet, sem ut cursus luctus, ipsum leo elementum sem, vitae aliquam eros turpis non enim. Mauris quis turpis vitae purus gravida sagittis. Duis gravida. Praesent eu nulla at sem molestie sodales. Mauris blandit enim', 5),
(41, 'blandit at, nisi. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel nisl. Quisque fringilla euismod enim. Etiam gravida molestie arcu. Sed eu nibh vulputate mauris', 1),
(42, 'id enim. Curabitur massa. Vestibulum accumsan neque et nunc. Quisque ornare tortor at risus. Nunc ac sem ut dolor dapibus gravida. Aliquam tincidunt, nunc ac mattis ornare, lectus ante dictum mi, ac mattis velit', 42),
(43, 'nec, eleifend non, dapibus rutrum, justo. Praesent luctus. Curabitur egestas nunc sed libero. Proin sed turpis nec mauris blandit', 4),
(44, 'lorem lorem, luctus ut, pellentesque eget, dictum placerat, augue. Sed molestie. Sed id risus quis diam luctus', 54),
(45, 'In condimentum. Donec at arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec tincidunt. Donec vitae erat vel pede blandit congue.', 53),
(46, 'Mauris eu turpis. Nulla aliquet. Proin velit. Sed malesuada augue ut lacus. Nulla tincidunt, neque vitae semper egestas, urna justo faucibus lectus,', 24),
(47, 'adipiscing elit. Etiam laoreet, libero et tristique pellentesque, tellus sem mollis dui, in sodales elit erat vitae risus. Duis a mi fringilla', 9),
(48, 'aliquet. Proin velit. Sed malesuada augue ut lacus. Nulla tincidunt, neque vitae semper egestas, urna justo faucibus lectus, a sollicitudin orci sem eget massa. Suspendisse eleifend. Cras', 48),
(49, 'Suspendisse commodo tincidunt nibh. Phasellus nulla. Integer vulputate, risus a ultricies adipiscing, enim mi tempor lorem, eget mollis lectus pede et risus. Quisque libero lacus, varius et,', 51),
(50, 'at pede. Cras vulputate velit eu sem. Pellentesque ut ipsum ac mi eleifend egestas. Sed pharetra, felis eget varius ultrices, mauris ipsum porta elit, a feugiat tellus lorem eu metus. In lorem. Donec', 2),
(51, 'ante bibendum ullamcorper. Duis cursus, diam at pretium aliquet, metus urna convallis erat, eget tincidunt dui augue eu tellus. Phasellus elit pede, malesuada vel, venenatis vel, faucibus id, libero. Donec consectetuer mauris id sapien.', 32),
(52, 'Mauris magna. Duis dignissim tempor arcu. Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non magna. Nam ligula elit, pretium et, rutrum non, hendrerit id, ante. Nunc mauris sapien, cursus in, hendrerit consectetuer,', 28),
(53, 'dolor. Nulla semper tellus id nunc interdum feugiat. Sed nec metus facilisis lorem tristique aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula tortor, dictum eu, placerat', 2),
(54, 'libero. Morbi accumsan laoreet ipsum. Curabitur consequat, lectus sit amet luctus vulputate, nisi sem semper erat, in consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum accumsan neque et nunc. Quisque', 17),
(55, 'Donec nibh enim, gravida sit amet, dapibus id, blandit at, nisi. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel nisl. Quisque fringilla', 1),
(56, 'mi tempor lorem, eget mollis lectus pede et risus. Quisque libero lacus, varius et, euismod et, commodo at, libero. Morbi accumsan laoreet ipsum. Curabitur consequat, lectus', 24),
(57, 'ornare. Fusce mollis. Duis sit amet diam eu dolor egestas rhoncus. Proin nisl sem, consequat nec, mollis vitae, posuere at, velit. Cras lorem lorem, luctus ut, pellentesque eget, dictum placerat, augue. Sed molestie. Sed id', 12),
(58, 'senectus et netus et malesuada fames ac turpis egestas. Aliquam fringilla cursus purus. Nullam scelerisque neque sed', 36),
(59, 'sit amet, faucibus ut, nulla. Cras eu tellus eu augue porttitor interdum. Sed auctor odio a purus. Duis elementum, dui quis accumsan convallis, ante lectus convallis est, vitae sodales nisi magna sed dui. Fusce', 29),
(60, 'penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel arcu eu odio tristique pharetra. Quisque ac libero nec ligula consectetuer rhoncus. Nullam velit dui, semper et, lacinia vitae, sodales at,', 20),
(61, 'tempus risus. Donec egestas. Duis ac arcu. Nunc mauris. Morbi non sapien molestie orci tincidunt adipiscing. Mauris molestie pharetra nibh. Aliquam ornare, libero at auctor ullamcorper, nisl arcu iaculis enim, sit amet', 56),
(62, 'Phasellus ornare. Fusce mollis. Duis sit amet diam eu dolor egestas rhoncus. Proin nisl sem, consequat nec, mollis vitae, posuere at, velit. Cras', 31),
(63, 'at, libero. Morbi accumsan laoreet ipsum. Curabitur consequat, lectus sit amet luctus vulputate, nisi sem semper erat, in consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum accumsan neque et nunc. Quisque ornare tortor', 18),
(64, 'iaculis quis, pede. Praesent eu dui. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean eget magna. Suspendisse tristique neque venenatis lacus. Etiam bibendum fermentum metus. Aenean sed pede', 13),
(65, 'tellus. Nunc lectus pede, ultrices a, auctor non, feugiat nec, diam. Duis mi enim, condimentum eget, volutpat ornare,', 43),
(66, 'Nam nulla magna, malesuada vel, convallis in, cursus et, eros. Proin ultrices. Duis volutpat nunc sit amet metus.', 37),
(67, 'ipsum porta elit, a feugiat tellus lorem eu metus. In lorem. Donec elementum, lorem ut aliquam iaculis, lacus pede sagittis augue, eu tempor erat neque non quam.', 51),
(68, 'fringilla, porttitor vulputate, posuere vulputate, lacus. Cras interdum. Nunc sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh dolor, nonummy ac, feugiat non, lobortis quis, pede. Suspendisse dui. Fusce diam nunc, ullamcorper', 43),
(69, 'nulla. Integer vulputate, risus a ultricies adipiscing, enim mi tempor lorem, eget mollis lectus pede et risus. Quisque libero lacus, varius et, euismod', 11),
(70, 'massa lobortis ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper, velit in aliquet lobortis, nisi nibh lacinia orci, consectetuer euismod est arcu ac orci. Ut semper pretium neque. Morbi quis urna. Nunc quis arcu vel', 30),
(71, 'luctus. Curabitur egestas nunc sed libero. Proin sed turpis nec mauris blandit mattis. Cras eget nisi dictum augue malesuada', 47),
(72, 'vulputate, lacus. Cras interdum. Nunc sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh dolor, nonummy ac, feugiat non, lobortis', 3),
(73, 'elit elit fermentum risus, at fringilla purus mauris a nunc. In at pede. Cras vulputate velit eu sem. Pellentesque ut ipsum ac mi eleifend egestas. Sed pharetra, felis eget varius', 56),
(74, 'ac nulla. In tincidunt congue turpis. In condimentum. Donec at arcu. Vestibulum ante ipsum primis', 35),
(75, 'varius et, euismod et, commodo at, libero. Morbi accumsan laoreet ipsum. Curabitur consequat, lectus sit amet luctus vulputate, nisi sem', 53),
(76, 'orci. Donec nibh. Quisque nonummy ipsum non arcu. Vivamus sit amet risus. Donec egestas. Aliquam nec enim. Nunc ut erat. Sed nunc est, mollis non, cursus non, egestas a, dui. Cras pellentesque. Sed dictum. Proin', 46),
(77, 'montes, nascetur ridiculus mus. Donec dignissim magna a tortor. Nunc commodo auctor velit. Aliquam nisl. Nulla eu neque pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec est. Nunc', 36),
(78, 'felis. Donec tempor, est ac mattis semper, dui lectus rutrum urna, nec luctus felis purus ac tellus. Suspendisse sed dolor. Fusce mi lorem, vehicula et,', 34),
(79, 'laoreet ipsum. Curabitur consequat, lectus sit amet luctus vulputate, nisi sem semper erat, in consectetuer ipsum nunc id enim.', 27),
(80, 'erat nonummy ultricies ornare, elit elit fermentum risus, at fringilla purus mauris a nunc. In at pede. Cras vulputate velit eu sem. Pellentesque', 11),
(81, 'Phasellus libero mauris, aliquam eu, accumsan sed, facilisis vitae, orci. Phasellus dapibus quam quis diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce aliquet magna a neque. Nullam', 43),
(82, 'rhoncus. Proin nisl sem, consequat nec, mollis vitae, posuere at, velit. Cras lorem lorem, luctus ut, pellentesque eget, dictum placerat, augue. Sed molestie. Sed id risus quis diam luctus', 40),
(83, 'non, lobortis quis, pede. Suspendisse dui. Fusce diam nunc, ullamcorper eu, euismod ac, fermentum vel, mauris. Integer sem elit, pharetra ut, pharetra sed, hendrerit a, arcu. Sed et libero. Proin', 29),
(84, 'aliquet nec, imperdiet nec, leo. Morbi neque tellus, imperdiet non, vestibulum nec, euismod in, dolor. Fusce feugiat. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aliquam auctor, velit eget', 13),
(85, 'Curae; Phasellus ornare. Fusce mollis. Duis sit amet diam eu dolor egestas rhoncus. Proin nisl sem, consequat nec, mollis vitae, posuere', 8),
(86, 'Aenean euismod mauris eu elit. Nulla facilisi. Sed neque. Sed eget lacus. Mauris non dui nec urna suscipit nonummy.', 13),
(87, 'erat nonummy ultricies ornare, elit elit fermentum risus, at fringilla purus mauris a nunc. In at pede. Cras vulputate velit eu sem. Pellentesque ut ipsum ac mi eleifend egestas. Sed pharetra, felis eget varius ultrices,', 53),
(88, 'eu arcu. Morbi sit amet massa. Quisque porttitor eros nec tellus. Nunc lectus pede, ultrices a, auctor non, feugiat nec, diam. Duis mi enim, condimentum eget, volutpat', 24),
(89, 'ultrices sit amet, risus. Donec nibh enim, gravida sit amet, dapibus id, blandit at, nisi. Cum sociis natoque', 19),
(90, 'et risus. Quisque libero lacus, varius et, euismod et, commodo at, libero. Morbi accumsan laoreet ipsum. Curabitur consequat, lectus sit amet luctus vulputate, nisi sem semper erat, in', 8),
(91, 'a mi fringilla mi lacinia mattis. Integer eu lacus. Quisque imperdiet, erat nonummy ultricies ornare, elit elit fermentum risus, at fringilla purus mauris a nunc. In at pede. Cras vulputate velit eu', 11),
(92, 'blandit at, nisi. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel nisl. Quisque fringilla euismod enim. Etiam gravida molestie arcu.', 25),
(93, 'litora torquent per conubia nostra, per inceptos hymenaeos. Mauris ut quam vel sapien imperdiet ornare. In faucibus. Morbi vehicula.', 23),
(94, 'Nunc sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh dolor, nonummy ac, feugiat non, lobortis quis, pede. Suspendisse dui. Fusce diam nunc, ullamcorper eu, euismod ac, fermentum vel, mauris.', 23),
(95, 'mollis vitae, posuere at, velit. Cras lorem lorem, luctus ut, pellentesque eget, dictum placerat, augue. Sed molestie. Sed id risus quis diam luctus lobortis. Class aptent taciti sociosqu ad litora torquent per conubia nostra,', 36),
(96, 'luctus sit amet, faucibus ut, nulla. Cras eu tellus eu augue porttitor interdum. Sed auctor odio', 49),
(97, 'Nunc laoreet lectus quis massa. Mauris vestibulum, neque sed dictum eleifend, nunc risus varius orci, in consequat enim diam vel', 38),
(98, 'Ut tincidunt vehicula risus. Nulla eget metus eu erat semper rutrum. Fusce dolor quam, elementum at, egestas a,', 56),
(99, 'adipiscing lobortis risus. In mi pede, nonummy ut, molestie in, tempus eu, ligula. Aenean euismod mauris eu elit. Nulla facilisi. Sed neque. Sed eget lacus. Mauris non', 28),
(100, 'ultrices, mauris ipsum porta elit, a feugiat tellus lorem eu metus. In lorem. Donec elementum, lorem ut aliquam iaculis, lacus pede sagittis augue, eu tempor erat neque non quam. Pellentesque habitant morbi tristique', 22);

-- --------------------------------------------------------

--
-- Structure de la table `wifi`
--

CREATE TABLE IF NOT EXISTS `wifi` (
  `Id` smallint(5) NOT NULL,
  `Arrondissement` varchar(255) COLLATE utf8_bin NOT NULL,
  `Nom_batiment` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `No_civique` smallint(5) unsigned DEFAULT NULL,
  `Rue` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `Coordonnee` point DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `wifi`
--

INSERT INTO `wifi` (`Id`, `Arrondissement`, `Nom_batiment`, `No_civique`, `Rue`, `Coordonnee`) VALUES
(1, 'Sainte-Foy–Sillery–Cap-Rouge', 'Bibliothèque Monique-Corriveau', 999, 'Avenue Roland-Beaudin', '\0\0\0\0\0\0\0˼�	�Q����bG@'),
(2, 'Charlesbourg', 'Bibliothèque de Charlesbourg', 7950, '1ière Avenue', '\0\0\0\0\0\0\0�q��4�Q�&�{�.nG@'),
(3, 'Sainte-Foy–Sillery–Cap-Rouge', 'Bibliothèque Charles-H.-Blais', 1445, 'Avenue Maguire', '\0\0\0\0\0\0\0�L�j�Q��hD��cG@'),
(4, 'Charlesbourg', 'Aréna Arpidrome de Charlesbourg', 750, 'Rue de la Sorbonne', '\0\0\0\0\0\0\0sόs�Q�S�pg�nG@'),
(5, 'Sainte-Foy–Sillery–Cap-Rouge', 'Piscine Sylvie Bernier', 3020, 'Boulevard Hochelaga', '\0\0\0\0\0\0\0!�<�Q�h�̬1bG@'),
(6, 'Sainte-Foy–Sillery–Cap-Rouge', 'Centre sportif Ste-Foy', 930, 'Avenue Roland-Beaudin', '\0\0\0\0\0\0\0c�Y�0�Q���뫩bG@'),
(7, 'Sainte-Foy–Sillery–Cap-Rouge', 'Bureau Information Touristique Sainte-Foy', 3300, 'Avenue des Hôtels', '\0\0\0\0\0\0\0},qz��Q�۶en�`G@'),
(8, 'Sainte-Foy–Sillery–Cap-Rouge', 'Bibliothèque Roger-Lemelin', 4705, 'Rue de la Promenade-des-Soeurs', '\0\0\0\0\0\0\0��(�Q��p&�_G@'),
(9, 'Laurentien', 'Centre Culturel Georges-D''Or', 3490, 'Route de l''Aéroport', '\0\0\0\0\0\0\0�oV���Q�j��\n�kG@'),
(10, 'Laurentien', 'Bibliothèque Félix-Leclerc', 1465, 'Rue de l''Innovation', '\0\0\0\0\0\0\0	�0���Q����mG@'),
(11, 'Beauport', 'Bibliothèque Étienne-Parent', 3515, 'Rue Clémenceau', '\0\0\0\0\0\0\0��p��Q�uCJ��nG@'),
(12, 'Beauport', 'Bibliothèque du Chemin-Royal', 3095, 'Chemin Royal', '\0\0\0\0\0\0\0�v#��Q�Jч��lG@'),
(13, 'La Haute-Saint-Charles', 'Bibliothèque Le Tournesol', 530, 'Rue Delage', '\0\0\0\0\0\0\0ɪ��Q�l\0A�''tG@'),
(14, 'Charlesbourg', 'Point de service du Jardin', 4215, 'Avenue des Sauges', '\0\0\0\0\0\0\08��a&�Q���bV�pG@'),
(15, 'Sainte-Foy–Sillery–Cap-Rouge', 'Point de service Champigny', 1465, 'Rue Félix-Antoine-Savard', '\0\0\0\0\0\0\0��=��Q�8���cG@'),
(16, 'Charlesbourg', 'Point de service Bon-Pasteur', 425, 'Rue du Bienheureux Jean-XXIII', '\0\0\0\0\0\0\0n''�j��Q�@:��LsG@'),
(17, 'La Haute-Saint-Charles', 'Bibliothèque Chrystine-Brouillet', 262, 'Rue Racine', '\0\0\0\0\0\0\0����Q��\Z��#mG@'),
(18, 'Sainte-Foy–Sillery–Cap-Rouge', 'Maison de la découverte', 835, 'avenue Wilfrid-Laurier', '\0\0\0\0\0\0\0q��"��Q�Z6�PKgG@'),
(19, 'La Cité-Limoilou', 'Place d''Youville', 0, NULL, '\0\0\0\0\0\0\0�[�5��Q����gG@'),
(20, 'Sainte-Foy–Sillery–Cap-Rouge', 'Marché de Sainte-Foy', 939, 'Avenue Roland-Beaudin', '\0\0\0\0\0\0\0����Q�-�1�bG@'),
(21, 'Sainte-Foy–Sillery–Cap-Rouge', 'Avenue Roland-Beaudin', 0, NULL, '\0\0\0\0\0\0\0�u�:;�Q�R����bG@'),
(22, 'La Cité-Limoilou', 'Palais Montcalm', 995, 'Place D''Youville', '\0\0\0\0\0\0\0\0���Q������gG@'),
(23, 'La Cité-Limoilou', 'Parc de l''Hôtel-de-ville', 2, 'Rue des Jardins', '\0\0\0\0\0\0\0]5��R�Q����hG@'),
(24, 'Les Rivières', 'Aréna de Duberger', 3050, 'Boulevard Central', '\0\0\0\0\0\0\0�Z���Q�%�H�hG@'),
(25, 'Les Rivières', 'Aréna Gaétan Duchesne', 2650, 'Avenue D''Alembert', '\0\0\0\0\0\0\0`	���Q���ܛgG@'),
(26, 'Les Rivières', 'Aréna Patrick Poulin', 220, 'Avenue du Chanoine-Côté', '\0\0\0\0\0\0\0�p�Y�Q�g��!dhG@'),
(27, 'Les Rivières', 'Aréna Centre communautaire Michel-Labadie', 3705, 'Avenue Chauveau', '\0\0\0\0\0\0\0±��/�Q�0�b''�jG@'),
(28, 'Beauport', 'Centre sportif Marcel-Bédard', 655, 'Boulevard des Chutes', '\0\0\0\0\0\0\0�S#�$�Q�*3���mG@'),
(29, 'Beauport', 'Aréna de Giffard', 3500, 'Rue Cambronne', '\0\0\0\0\0\0\0@�ONb�Q���MnG@'),
(30, 'Beauport', 'Aréna Gilles Tremblay', 1011, 'Avenue Larue', '\0\0\0\0\0\0\00��A�Q�O�B�qG@'),
(31, 'La Cité-Limoilou', 'Aréna Bardy', 2280, 'Avenue Monseigneur-Gosselin', '\0\0\0\0\0\0\0��E�Q��.�lG@'),
(32, 'La Haute-Saint-Charles', 'Pavillon des sports de Loretteville', 86, 'Boulevard des Étudiants', '\0\0\0\0\0\0\0��G�0�Q�R\rzx�mG@'),
(33, 'Sainte-Foy–Sillery–Cap-Rouge', 'Centre communautaire Claude-Allard', 3200, 'Avenue D''Amours', '\0\0\0\0\0\0\0�C��p�Q�''١�,cG@'),
(34, 'La Cité-Limoilou', 'Centre Lucien-Borne', 100, 'Chemin Sainte-foy', '\0\0\0\0\0\0\0���;��Q�c".gG@'),
(35, 'Beauport', 'Centre du Fargy', 2, 'Rue Fargy', '\0\0\0\0\0\0\0���s%�Q��*���mG@'),
(36, 'La Cité-Limoilou', 'Centre récréatif Mgr-Bouffard', 680, 'Raoul-Jobin', '\0\0\0\0\0\0\0��%ם�Q�NU��jgG@'),
(37, 'La Cité-Limoilou', 'Domaine Maizeret', 2000, 'Boulevard Montmorency', '\0\0\0\0\0\0\08� ���Q����c�jG@'),
(38, 'La Cité-Limoilou', 'Centre St-Roch', 230, 'Rue du Pont', '\0\0\0\0\0\0\0�fV�M�Q��a���hG@'),
(39, 'Sainte-Foy–Sillery–Cap-Rouge', 'Centre communautaire Noël-Brûlart', 1229, 'Avenue du Chanoine-Morel', '\0\0\0\0\0\0\0~�K��Q���+k�dG@'),
(40, 'La Cité-Limoilou', 'Loisirs Montcalm', 265, 'Boulevard René-Lévesque', NULL),
(41, 'La Cité-Limoilou', 'Centre Mgr-Marcoux', 1885, 'Chemin de la Canardière', NULL),
(42, 'Les Rivières', 'Centre Jos-A-Lachance', 2920, 'Rue Claisse', '\0\0\0\0\0\0\0�pmZ�Q�Ϲ9�}hG@'),
(43, 'Les Rivières', 'Comptoir Lebourgneuf', 1650, 'Boulevard de la Morille', '\0\0\0\0\0\0\0�5����Q���ӭ�kG@'),
(44, 'Les Rivières', 'Centre communautaire Jean-Baptiste-Lafrance', 4075, 'Rue Maria-Goretti', '\0\0\0\0\0\0\0c�;J��Q��u�g�fG@'),
(45, 'Beauport', 'Camping de Beauport', 95, 'Rue de la Sérénité', '\0\0\0\0\0\0\0p��f�Q�Q?9��rG@'),
(46, 'La Haute-Saint-Charles', 'Centre Culturel Georges-Dor', 3490, 'Route de l''Aéroport', '\0\0\0\0\0\0\0G<��Q����l�kG@'),
(47, 'La Haute-Saint-Charles', 'Centre Communautaire Loretteville', 305, 'Rue Racine', '\0\0\0\0\0\0\0IQÓ�Q�-q�H�lG@'),
(48, 'La Haute-Saint-Charles', 'Centrale des organismes de La Haute-Saint-Charles', 510, 'Rue Delage', NULL),
(49, 'La Cité-Limoilou', 'Centre communautaire Ferland', 1800, '8e Avenue', NULL),
(50, 'Sainte-Foy–Sillery–Cap-Rouge', 'Parc Nautique Cap-Rouge', 4155, 'Chemin de la Plage-Jacques-Cartier', '\0\0\0\0\0\0\0�ĥ���Q�''S��_G@'),
(51, 'Sainte-Foy–Sillery–Cap-Rouge', 'Base de Plein air de Sainte-Foy (Maison Laberge)', 3206, 'Rue Laberge', '\0\0\0\0\0\0\0Tx�O�Q��B���dG@'),
(52, 'La Cité-Limoilou', 'Stade Municipal', 100, 'Rue du Cardinal-Maurice-Roy', '\0\0\0\0\0\0\0&C''D��Q��e���hG@'),
(53, 'Sainte-Foy–Sillery–Cap-Rouge', 'Piscine Jacques-Amyot', 3643, 'Avenue des Compagnons', '\0\0\0\0\0\0\0f�`�Q��-c/aG@'),
(54, 'St-Roch sans fil', 'Nom du batiment indisponible', NULL, NULL, '\0\0\0\0\0\0\0�9!5i�Q��.f8hG@'),
(55, '295', 'Boulevard Charest Est', 0, NULL, '\0\0\0\0\0\0\0��N�w�Q��U�<\rhG@'),
(56, 'La Haute-Saint-Charles', 'Centre communautaire Paul-Émile-Beaulieu', 530, 'Rue Delage', '\0\0\0\0\0\0\0[g�7�Q��ޱ�!tG@'),
(57, 'Les Rivières', 'Centre Elzéar-Turcotte', 2455, 'Boulevard Central', '\0\0\0\0\0\0\0-����Q�}��F�gG@'),
(58, 'Sainte-Foy–Sillery–Cap-Rouge', 'Centre communautaire Cap-rouge', 4473, 'rue Saint-Félix', '\0\0\0\0\0\0\0/�\Z��Q���$Z�^G@');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `avis`
--
ALTER TABLE `avis`
  ADD CONSTRAINT `avis_ibfk_1` FOREIGN KEY (`IdWifi`) REFERENCES `wifi` (`Id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
