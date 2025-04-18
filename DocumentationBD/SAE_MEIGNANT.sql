-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : jeu. 17 avr. 2025 à 17:45
-- Version du serveur : 10.11.11-MariaDB-0+deb12u1
-- Version de PHP : 8.3.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `meignant3`
--
CREATE DATABASE IF NOT EXISTS `meignant3` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `meignant3`;

-- --------------------------------------------------------

--
-- Structure de la table `Category`
--

CREATE TABLE `Category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Déchargement des données de la table `Category`
--

INSERT INTO `Category` (`id`, `name`) VALUES
(1, 'Action'),
(2, 'Comédie'),
(3, 'Drame'),
(4, 'Science-fiction'),
(5, 'Animation'),
(6, 'Thriller'),
(7, 'Horreur'),
(8, 'Aventure'),
(9, 'Fantaisie'),
(10, 'Documentaire');

-- --------------------------------------------------------

--
-- Structure de la table `Movie`
--

CREATE TABLE `Movie` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `year` int(11) DEFAULT NULL,
  `length` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `director` varchar(255) DEFAULT NULL,
  `id_category` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `trailer` varchar(255) DEFAULT NULL,
  `min_age` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Déchargement des données de la table `Movie`
--

INSERT INTO `Movie` (`id`, `name`, `year`, `length`, `description`, `director`, `id_category`, `image`, `trailer`, `min_age`) VALUES
(7, 'Interstellar', 2014, 169, 'Un groupe d\'explorateurs voyage à travers un trou de ver pour sauver l\'humanité.', 'Christopher Nolan', 4, 'interstellar.jpg', 'https://www.youtube.com/embed/VaOijhK3CRU?si=76Ke4uw4LYjuLuQ6', 12),
(12, 'La Liste de Schindler', 1993, 195, 'Un industriel allemand sauve des milliers de Juifs pendant l\'Holocauste.', 'Steven Spielberg', 3, 'schindler.webp', 'https://www.youtube.com/embed/ONWtyxzl-GE?si=xC3ASGGPy5Ib-aPn', 16),
(17, 'Your Name', 2016, 107, 'Deux adolescents échangent leurs corps de manière mystérieuse.', 'Makoto Shinkai', 5, 'your_name.jpg', 'https://www.youtube.com/embed/AROOK45LXXg?si=aUQyGk2VMCb_ToUL', 10),
(27, 'Le Bon, la Brute et le Truand', 1966, 161, 'Trois hommes se lancent à la recherche d\'un trésor caché.', 'Sergio Leone', 8, 'bon_brute_truand.jpg', 'https://www.youtube.com/embed/WA1hCZFOPqs?si=TwNZAoM4oj4KpGja', 12),
(49, 'Cars ', 2006, 90, 'Voiture ayant des sentiments ', 'John Lasseter', 5, 'cars.jpg', 'https://www.youtube.com/embed/W_H7_tDHFE8?si=2K0xvcpX9cNMHg9Q', 3),
(50, 'Fast and Furious 2', 2003, 107, 'Après avoir aidé Dominic Toretto à s\'échapper des autorités de Los Angeles, L\'ancien officier de la LAPD Brian O\'Conner s\'est échappé à Miami et a commencé une nouvelle vie en faisant des courses de rue lors d\'événements organisés par son ami, le mécanicien Tej Parker. Brian est arrêté à la suite d\'une course, mais son ancien patron, l\'agent spécial du FBI Bilkins et l\'agent des douanes Markham, offrent un accord pour effacer son casier en échange d\'un aller sous couverture pour aider à arrêter le baron de la drogue Carter Verone. Brian accepte à la condition qu\'il choisit son partenaire, il choisit son ami d\'enfance éloigné Roman Pearce. Après une brève dispute, Roman accepte le poste à condition d’être aussi amnistié.', 'John Singleton', 1, 'fastnfurious.jpg', 'https://www.youtube.com/embed/sWofeRh_53g?si=_b3Fu5nKOjqoJQGz', 18),
(51, 'surf\'s up', 2007, 85, 'Le film suit un jeune manchot, Cody Maverick, qui veut devenir un champion de surf, lors d\'une compétition organisée à la mémoire de Big « Z » le plus grand surfeur de tous les temps. Pour cela il va devoir affronter des péripéties et réaliser que le surf est bien plus qu\'une simple compétition.', 'Chris Buck', 5, 'surfsup.jpg', 'https://www.youtube.com/embed/7mPdQRXFiPA?si=UiEGDHp6Xujk4_4X', 3),
(52, 'Wayne\'s World', 1992, 95, 'À Aurora, dans l’Illinois, Wayne Campbell et Garth Algar, deux amis fans de rock, animent une émission de télévision, Wayne’s World, depuis le sous-sol des parents de Wayne. Une diffusion de Wayne’s World attire l’attention du producteur de télévision Benjamin Kane. Alors qu’il se promène avec des amis dans la voiture de Garth, la Mirthmobile, Wayne s’arrête pour admirer une Fender Stratocaster de 1964 dans une vitrine. Ils se rendent plus tard dans une boîte de nuit, où ils évitent l’ex-petite amie troublée de Wayne, Stacy, tandis que Wayne tombe amoureux de Cassandra Wong, chanteuse et bassiste du groupe Crucial Taunt, qu\'il impressionne avec son cantonais.', 'Penelope Spheeris', 2, 'wayn.jpg', 'https://www.youtube.com/embed/OIuhsHpcNAU?si=xD5dNVDQqSJxz37Q', 12),
(53, 'Wall-E', 2008, 98, 'Après avoir réalisé Le Monde de Nemo, Andrew Stanton a senti que Pixar était capable de créer des simulations réalistes de la physique sous-marine et a donc voulu réaliser un film se déroulant en grande partie dans l\'espace. La plupart des personnages ne disposent pas de voix humaines réelles, mais s\'expriment uniquement avec des gestes ou des sons robotiques, conçus par Ben Burtt, qui ressemblent à des voix métalliques. En outre, WALL-E est le premier long métrage d\'animation de Pixar à contenir des scènes en prises de vues réelles.', 'Andrew Stanton', 8, 'walle.jpg', 'https://www.youtube.com/embed/CZ1CATNbXg0?si=s7fnyf8vppSjJe9n', 3),
(54, 'Mon Voisin Totoro', 1988, 86, 'Totoro est une créature unique de caractère adorable, ressemblant à un mammifère de type plantigrade vivant dans une forêt dont il en est le roi, l\'esprit unique et à la fois le gardien. Il est une légende parmi les hommes.', 'Hayao Miyazaki', 9, 'totoro.jpg', 'https://www.youtube.com/embed/92a7Hj0ijLs?si=WJxBewFx6VT029fV', 3),
(56, ' Driven', 2001, 117, 'Driven (2001) est un film d’action centré sur l’univers des courses de monoplaces. Un jeune pilote talentueux, Jimmy Bly, peine à gérer la pression du championnat. Pour le remettre sur les rails, une écurie engage Joe Tanto, un vétéran au passé trouble. Ensemble, ils affrontent rivalités, drames personnels et la brutalité du circuit. Le film mêle vitesse, adrénaline et rédemption.', 'Renny Harlin', 3, 'drivenn.jpg', '//www.youtube.com/embed/KgJOc3oqxTM?si=S7e4I5hFV7bNA7A4', 16),
(61, 'Supercross', 2005, 80, 'K.C. et Trip Carlyle sont deux frères endeuillés par l\'étrange mort de leur père. Malgré tout, ils décident de faire carrière coûte que coûte dans le domaine des courses de supercross.', 'Steve Boyum', 3, 'supercross.jpg', 'https://www.youtube.com/embed/u9AyyxvwyoE?si=iLiaFQQj8W2Ax7Hl', 12),
(62, 'Blue Lock : Épisode Nagi', 2024, 91, 'Un film basé sur la vie du protige Nagi Seichiro ', 'Taku Kishimoto', 5, 'nagi.jpg', 'https://www.youtube.com/embed/Zpxml6ex3dw?si=A-Dgny-ZhwdYGmdI', 12),
(63, 'Venom', 2018, 112, 'Alors qu\'elle explore l\'espace à la recherche de nouveaux mondes habitables, une sonde appartenant à la société de bio-ingénierie Life Foundation découvre une comète peuplée de formes de vie symbiotiques . La sonde revient sur Terre avec quatre échantillons, mais l\'un d\'eux s\'échappe et provoque le crash du vaisseau à Miri . La Life Foundation récupère les trois autres et les transporte dans son centre de recherche de San Francisco , où elle découvre que les symbiotes ne peuvent survivre sans hôtes respirant de l\'oxygène, qui rejettent souvent fatalement la symbiose. Le journaliste d\'investigation Eddie Brock découvre ces essais sur l\'homme dans un document classifié en possession de sa fiancée Anne Weying , avocate préparant la défense de la Life Foundation. Eddie confronte Carlton Drake , PDG de la Life Foundation , à propos de ces essais, ce qui entraîne la perte de leur emploi à la fois pour Eddie et Anne. Anne met alors fin à sa relation et à ses fiançailles avec Eddie.', 'Ruben Fleischer', 6, 'Venomm.jpg', 'https://www.youtube.com/embed/u9Mv98Gr5pY?si=yqdSpAsMQoVspr93', 13),
(64, 'Scream', 1996, 111, 'Scream est un film d’horreur emblématique réalisé par Wes Craven, sorti en 1996. Il suit une adolescente, Sidney Prescott, traquée par un tueur masqué surnommé Ghostface. Mélangeant suspense, humour noir et critique des clichés du genre, le film a relancé le slasher dans les années 90. Son masque est devenu une icône de la pop culture.', 'Kevin Williamson', 7, 'scream.jpg', 'https://www.youtube.com/embed/i3J6ACKQ7K0?si=duWGOjX7K8bjhm_3', 16),
(66, 'The Social Dilemma', 2020, 89, 'Derrière nos écrans de fumée (The Social Dilemma) est un docufiction américain écrit et réalisé par Jeff Orlowski. Sorti via Netflix le 9 septembre 2020, le film explore la montée en puissance des médias sociaux et les dommages qu\'ils ont causés à la société, en se concentrant sur leur exploitation de leurs utilisateurs à des fins financières grâce au capitalisme de surveillance et à l\'exploration de données, comment leur conception est censée nourrir une dépendance, leur utilisation en politique, leur impact sur la santé mentale (y compris la santé mentale des adolescents et l\'augmentation des taux de suicide chez les jeunes utilisateurs de ces réseaux sociaux) et leur rôle dans la diffusion des théories du complot et l\'aide à des groupes tels que les flat-earthers et les suprémacistes blancs.', 'Jeff Orlowski', 10, 'media.jpg', 'https://www.youtube.com/embed/uaaC57tcci0?si=-dkYJn0B4M2V6kRV', 13);

-- --------------------------------------------------------

--
-- Structure de la table `User`
--

CREATE TABLE `User` (
  `id` int(11) NOT NULL,
  `username` varchar(150) NOT NULL,
  `avatar` varchar(200) DEFAULT NULL,
  `restriction` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `User`
--

INSERT INTO `User` (`id`, `username`, `avatar`, `restriction`) VALUES
(4, 'Alex', 'flash.webp', 18);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Category`
--
ALTER TABLE `Category`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `Movie`
--
ALTER TABLE `Movie`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_category` (`id_category`);

--
-- Index pour la table `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `Category`
--
ALTER TABLE `Category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `Movie`
--
ALTER TABLE `Movie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT pour la table `User`
--
ALTER TABLE `User`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Movie`
--
ALTER TABLE `Movie`
  ADD CONSTRAINT `movie_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `Category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
