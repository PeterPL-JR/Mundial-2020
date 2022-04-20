-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 18. Apr 2022 um 12:28
-- Server-Version: 10.4.22-MariaDB
-- PHP-Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `scores-league`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `lang`
--

CREATE TABLE `lang` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `lang`
--

INSERT INTO `lang` (`id`, `name`) VALUES
(1, 'polish');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `lang_contents`
--

CREATE TABLE `lang_contents` (
  `id` int(10) UNSIGNED NOT NULL,
  `content` varchar(256) NOT NULL,
  `lang_id` int(10) UNSIGNED NOT NULL,
  `content_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `likes`
--

CREATE TABLE `likes` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `game_id` int(10) UNSIGNED NOT NULL,
  `creation_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `names_teams`
--

CREATE TABLE `names_teams` (
  `id` int(10) UNSIGNED NOT NULL,
  `content` varchar(36) NOT NULL,
  `team_id` varchar(3) NOT NULL,
  `lang_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `names_teams`
--

INSERT INTO `names_teams` (`id`, `content`, `team_id`, `lang_id`) VALUES
(1, 'Holandia', 'nld', 1),
(2, 'Ekwador', 'ecu', 1),
(3, 'Katar', 'qat', 1),
(4, 'Senegal', 'sen', 1),
(5, 'Anglia', 'eng', 1),
(6, 'USA', 'usa', 1),
(7, 'Iran', 'irn', 1),
(8, 'Ukraina', 'ukr', 1),
(9, 'Szkocja', 'sco', 1),
(10, 'Walia', 'wal', 1),
(11, 'Argentyna', 'arg', 1),
(12, 'Polska', 'pol', 1),
(13, 'Meksyk', 'mex', 1),
(14, 'Arabia Saudyjska', 'sau', 1),
(15, 'Francja', 'fra', 1),
(16, 'Dania', 'den', 1),
(17, 'Tunezja', 'tun', 1),
(18, 'Australia', 'aus', 1),
(19, 'Peru', 'per', 1),
(20, 'ZEA', 'zae', 1),
(21, 'Hiszpania', 'spa', 1),
(22, 'Niemcy', 'ger', 1),
(23, 'Japonia', 'jap', 1),
(24, 'Kostaryka', 'cri', 1),
(25, 'N-Zelandia', 'nzl', 1),
(26, 'Belgia', 'bel', 1),
(27, 'Kanada', 'can', 1),
(28, 'Maroko', 'mor', 1),
(29, 'Chorwacja', 'cro', 1),
(30, 'Brazylia', 'bra', 1),
(31, 'Serbia', 'srb', 1),
(32, 'Szwajcaria', 'swi', 1),
(33, 'Kamerun', 'cam', 1),
(34, 'Portugalia', 'por', 1),
(35, 'Ghana', 'gha', 1),
(36, 'Urugwaj', 'uru', 1),
(37, 'Korea Południowa', 'kor', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `page_names`
--

CREATE TABLE `page_names` (
  `id` int(10) UNSIGNED NOT NULL,
  `page_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `shared_games`
--

CREATE TABLE `shared_games` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `link` varchar(50) NOT NULL,
  `description` varchar(256) DEFAULT NULL,
  `views` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `creation_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `teams`
--

CREATE TABLE `teams` (
  `name` varchar(3) NOT NULL,
  `link` varchar(30) NOT NULL,
  `group_ch` varchar(1) DEFAULT NULL,
  `group_pos` int(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `teams`
--

INSERT INTO `teams` (`name`, `link`, `group_ch`, `group_pos`) VALUES
('arg', 'argentina.png', 'C', 0),
('aus', 'australia.png', 'D', 1),
('bel', 'belgium.png', 'F', 0),
('bra', 'brasil.png', 'G', 0),
('cam', 'cameroon.png', 'G', 3),
('can', 'canada.png', 'F', 1),
('cri', 'costa_rica.png', 'E', 1),
('cro', 'croatia.png', 'F', 3),
('den', 'denmark.png', 'D', 2),
('ecu', 'ecuador.png', 'A', 1),
('eng', 'england.png', 'B', 0),
('fra', 'france.png', 'D', 0),
('ger', 'germany.png', 'E', 2),
('gha', 'ghana.png', 'H', 1),
('irn', 'iran.png', 'B', 1),
('jap', 'japan.png', 'E', 3),
('kor', 'south_korea.png', 'H', 3),
('mex', 'mexico.png', 'C', 2),
('mor', 'morocco.png', 'F', 2),
('nld', 'netherlands.png', 'A', 3),
('nzl', 'new_zealand.png', 'E', 1),
('per', 'peru.png', 'D', 1),
('pol', 'poland.png', 'C', 3),
('por', 'portugal.png', 'H', 0),
('qat', 'quatar.png', 'A', 0),
('sau', 'saudi_arabia.png', 'C', 1),
('sco', 'scotland.png', 'B', 3),
('sen', 'senegal.png', 'A', 2),
('spa', 'spain.png', 'E', 0),
('srb', 'serbia.png', 'G', 1),
('swi', 'switzerland.png', 'G', 2),
('tun', 'tunisia.png', 'D', 3),
('ukr', 'ukraine.png', 'B', 3),
('uru', 'uruguay.png', 'H', 2),
('usa', 'usa.png', 'B', 2),
('wal', 'wales.png', 'B', 3),
('zae', 'zae.png', 'D', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(256) NOT NULL,
  `creation_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `lang`
--
ALTER TABLE `lang`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `lang_contents`
--
ALTER TABLE `lang_contents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lang_id` (`lang_id`),
  ADD KEY `content_id` (`content_id`);

--
-- Indizes für die Tabelle `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `game_id` (`game_id`);

--
-- Indizes für die Tabelle `names_teams`
--
ALTER TABLE `names_teams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `team_id` (`team_id`),
  ADD KEY `lang_id` (`lang_id`);

--
-- Indizes für die Tabelle `page_names`
--
ALTER TABLE `page_names`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `shared_games`
--
ALTER TABLE `shared_games`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indizes für die Tabelle `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`name`);

--
-- Indizes für die Tabelle `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `lang`
--
ALTER TABLE `lang`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `lang_contents`
--
ALTER TABLE `lang_contents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `names_teams`
--
ALTER TABLE `names_teams`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT für Tabelle `page_names`
--
ALTER TABLE `page_names`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `shared_games`
--
ALTER TABLE `shared_games`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `lang_contents`
--
ALTER TABLE `lang_contents`
  ADD CONSTRAINT `lang_contents_ibfk_1` FOREIGN KEY (`lang_id`) REFERENCES `lang` (`id`),
  ADD CONSTRAINT `lang_contents_ibfk_2` FOREIGN KEY (`content_id`) REFERENCES `page_names` (`id`);

--
-- Constraints der Tabelle `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`game_id`) REFERENCES `shared_games` (`id`);

--
-- Constraints der Tabelle `names_teams`
--
ALTER TABLE `names_teams`
  ADD CONSTRAINT `names_teams_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`name`),
  ADD CONSTRAINT `names_teams_ibfk_2` FOREIGN KEY (`lang_id`) REFERENCES `lang` (`id`);

--
-- Constraints der Tabelle `shared_games`
--
ALTER TABLE `shared_games`
  ADD CONSTRAINT `shared_games_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
