-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 05. Dez 2023 um 21:04
-- Server-Version: 10.4.27-MariaDB
-- PHP-Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `nb_scores_league`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `clubs`
--

CREATE TABLE `clubs` (
  `str_id` varchar(3) NOT NULL,
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `national_team_id` varchar(3) NOT NULL,
  `logo_src` varchar(50) DEFAULT NULL,
  `level` int(10) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `clubs`
--

INSERT INTO `clubs` (`str_id`, `name`, `national_team_id`, `logo_src`, `level`) VALUES
('07v', '07 Vestur', 'fro', NULL, 1),
('aab', 'Aalborg BK', 'den', NULL, 1),
('aar', 'FC Aarau', 'swi', NULL, 1),
('acb', 'AC Bellinzona', 'swi', NULL, 1),
('aek', 'AEK Athens', 'gre', NULL, 1),
('agf', 'Aarhus GF', 'den', NULL, 1),
('aik', 'AIK Fotboll', 'swe', NULL, 1),
('ajx', 'Ajax', 'nld', NULL, 1),
('ak', 'AEK Larnaka', 'cyp', NULL, 1),
('ala', 'Alanyaspor', 'tur', NULL, 1),
('alb', 'UC AlbinoLeffe', 'ita', NULL, 1),
('als', 'US Alessandria', 'ita', NULL, 1),
('anc', 'US Ancona', 'ita', NULL, 1),
('and', 'RSC Anderlecht', 'bel', NULL, 1),
('apl', 'Apollon Limassol', 'cyp', NULL, 1),
('apn', 'APOEL Nicosia', 'cyp', NULL, 1),
('arg', 'Argeș Pitești', 'rom', NULL, 1),
('ari', 'Aris FC', 'gre', NULL, 1),
('ark', 'Arka Gdynia', 'pol', 'arka_gdynia.png', 4),
('ars', 'Arsenal', 'eng', NULL, 1),
('arz', 'Arzignano', 'ita', NULL, 1),
('asc', 'Ascoli', 'ita', 'ascoli.png', 2),
('asm', 'AS Monaco', 'fra', NULL, 1),
('ast', 'Aston Villa', 'eng', NULL, 1),
('at2', 'Atalanta BC U23', 'ita', NULL, 1),
('ata', 'Atalanta BC', 'ita', 'atalanta_bc.png', 5),
('ath', 'Athletic Bilbao', 'spa', NULL, 1),
('atm', 'Atlético Madrid', 'spa', NULL, 1),
('aug', 'FC Augsburg', 'ger', NULL, 1),
('ave', 'US Avellino', 'ita', 'us_avellino.png', 2),
('avi', 'Avia Świdnik', 'pol', NULL, 1),
('awi', 'Austria Wien', 'aut', NULL, 1),
('az', 'AZ Alkmaar', 'nld', NULL, 1),
('azz', 'SS Arezzo', 'ita', NULL, 1),
('b36', 'B36 Tórshavn', 'fro', NULL, 1),
('b68', 'B68 Toftir', 'fro', NULL, 1),
('bal', 'Bala Town', 'wal', NULL, 1),
('ban', 'Baník Ostrava', 'cze', NULL, 1),
('bar', 'FC Barcelona', 'spa', NULL, 1),
('bas', 'FC Basel', 'swi', NULL, 1),
('bbt', 'Bruk-Bet Termalica Nieciecza', 'pol', 'bruk_bet_termalica_nieciecza.png', 2),
('bei', 'Beitar Jerusalem', 'isr', NULL, 1),
('bel', 'GKS Bełchatów', 'pol', 'gks_belchatow.png', 2),
('ben', 'SL Benfica', 'por', NULL, 1),
('bes', 'Beşiktaş JK', 'tur', NULL, 1),
('bet', 'Real Betis', 'spa', NULL, 1),
('bgl', 'FK Bodø/Glimt', 'nor', NULL, 1),
('bh', 'Brighton & Hove Albion', 'eng', NULL, 1),
('bif', 'Brøndby IF', 'den', NULL, 1),
('blb', 'Pilica Białobrzegi', 'pol', NULL, 1),
('bmu', 'Bayern München', 'ger', NULL, 1),
('bnv', 'Benevento', 'ita', 'benevento.png', 2),
('boh', 'Bohemians 1905', 'cze', NULL, 1),
('bol', 'Bologna FC', 'ita', 'bologna_fc.png', 5),
('bot', 'FC Botoșani', 'rom', NULL, 1),
('bpo', 'Podlasie Biała Podlaska', 'pol', NULL, 1),
('br', 'Breiðablik UBK', 'ice', NULL, 1),
('bra', 'SC Braga', 'por', NULL, 1),
('bre', 'Brentford FC', 'eng', NULL, 1),
('bri', 'SSC Bari', 'ita', 'ssc_bari.png', 2),
('brm', 'Broń Radom', 'pol', NULL, 1),
('brn', 'Brindisi FC', 'ita', NULL, 1),
('brs', 'Brescia', 'ita', 'brescia.png', 2),
('bsa', 'İstanbul Başakşehir', 'tur', NULL, 1),
('byo', 'Odra Bytom Odrzański', 'pol', NULL, 1),
('cag', 'Cagliari', 'ita', 'cagliari.png', 4),
('cai', 'SP Cailungo', 'smr', NULL, 1),
('cat', 'Catanzaro', 'ita', 'catanzaro.png', 3),
('cbl', 'Concordia Elbląg', 'pol', NULL, 1),
('cbu', 'Dynamo České Budějovice', 'cze', NULL, 1),
('cch', 'Chojniczanka Chojnice', 'pol', 'chojniczanka_chojnice.png', 1),
('cel', 'Celta Vigo', 'spa', NULL, 1),
('ces', 'Cesena FC', 'ita', 'cesena_fc.png', 2),
('cfr', 'CFR Cluj', 'rom', NULL, 1),
('cgu', 'Carina Gubin', 'pol', NULL, 1),
('che', 'Chelsea FC', 'eng', NULL, 1),
('chg', 'Chrobry Głogów', 'pol', 'chrobry_glogow.png', 2),
('chi', 'Chindia Târgoviște', 'rom', NULL, 1),
('chl', 'Chełmianka Chełm', 'pol', NULL, 1),
('cit', 'AS Cittadella', 'ita', 'as_cittadella.png', 2),
('clb', 'Club Brugge', 'bel', NULL, 1),
('clt', 'Celtic FC', 'sco', NULL, 1),
('cmu', 'Cardiff Metropolitan University FC', 'wal', NULL, 1),
('com', 'Como 1907', 'ita', 'como_1907.png', 3),
('cos', 'SS Cosmos', 'smr', NULL, 1),
('cpo', 'Czarni Połaniec', 'pol', NULL, 1),
('cra', 'Cracovia', 'pol', 'cracovia.png', 5),
('cre', 'US Cremonese', 'ita', 'us_cremonese.png', 3),
('crg', 'Cerignola', 'ita', NULL, 1),
('crr', 'Carrarese', 'ita', 'carrarese.png', 2),
('crt', 'FC Crotone', 'ita', NULL, 1),
('crv', 'FK Crvena zvezda', 'srb', NULL, 1),
('cry', 'Crystal Palace', 'eng', NULL, 1),
('csk', 'CSKA Moskva', 'rus', NULL, 1),
('csn', 'Cosenza', 'ita', 'cosenza.png', 3),
('csr', 'Casertana FC', 'ita', NULL, 1),
('ctn', 'Catania FC', 'ita', NULL, 1),
('czr', 'Noteć Czarnków', 'pol', NULL, 1),
('dbb', 'FK Dukla Banská Bystrica', 'svk', NULL, 1),
('dbv', 'FK Dubnica nad Vahom', 'svk', NULL, 1),
('dds', 'DAC Dunajská Streda', 'svk', NULL, 1),
('deb', 'Wisłoka Dębica', 'pol', NULL, 1),
('dga', 'Djurgårdens IF', 'swe', NULL, 1),
('dif', 'FC Differdange 03', 'lux', NULL, 1),
('din', 'Dinamo Moskva', 'rus', NULL, 1),
('dkv', 'Dinamo Kijiv', 'ukr', NULL, 1),
('dn1', 'SK Dnipro-1', 'ukr', NULL, 1),
('dnz', 'Dinamo Zagreb', 'cro', NULL, 1),
('dom', 'FC Domagnano', 'smr', NULL, 1),
('dor', 'Borussia Dortmund', 'ger', NULL, 1),
('dud', 'F91 Dudelange', 'lux', NULL, 1),
('duk', 'Dukla Praha', 'cze', NULL, 1),
('ebs', 'EB/Streymur', 'fro', NULL, 1),
('elb', 'Olimpia Elbląg', 'pol', 'olimpia_elblag.png', 2),
('elf', 'IF Elfsborg', 'swe', NULL, 1),
('elt', 'Elana Toruń', 'pol', NULL, 1),
('emp', 'Empoli FC', 'ita', 'empoli_fc.png', 4),
('ent', 'Virtus Entella', 'ita', NULL, 1),
('erm', 'AS Giana Erminio', 'ita', NULL, 1),
('esb', 'Esbjerg fB', 'den', NULL, 1),
('fae', 'SC Faetano', 'smr', NULL, 1),
('far', 'FCV Farul Constanța', 'rom', NULL, 1),
('fcn', 'FC Nordsjælland', 'den', NULL, 1),
('fcs', 'FCSB', 'rom', NULL, 1),
('fcu', 'FC U Craiova 1948', 'rom', NULL, 1),
('fcv', 'FC Vaduz', 'lie', NULL, 1),
('fen', 'Fenerbahçe SK', 'tur', NULL, 1),
('fer', 'Ferencvárosi TC', 'hun', NULL, 1),
('fey', 'Feyenoord', 'nld', NULL, 1),
('fhl', 'FC Helsingør', 'den', NULL, 1),
('fhr', 'FC Hermannstadt', 'rom', NULL, 1),
('fio', 'ACF Fiorentina', 'ita', 'acf_fiorentina.png', 5),
('fkp', 'FK Příbram', 'cze', NULL, 1),
('fog', 'Foggia', 'ita', NULL, 1),
('fol', 'Fola Esch', 'lux', NULL, 1),
('fpl', 'Feralpisalò', 'ita', 'feralpisalo.png', 2),
('fra', 'Eintracht Frankfurt', 'ger', NULL, 1),
('frc', 'Virtus Francavilla', 'ita', NULL, 1),
('frg', 'SC Freiburg', 'ger', NULL, 1),
('frm', 'Fermana FC', 'ita', NULL, 1),
('frn', 'US Fiorenzuola', 'ita', NULL, 1),
('fro', 'Frosinone', 'ita', 'frosinone.png', 3),
('fto', 'FC Fiorentino', 'smr', NULL, 1),
('gal', 'FC Sankt Gallen', 'swi', NULL, 1),
('gba', 'Royal Antwerp FC', 'bel', NULL, 1),
('gbb', 'AS Gubbio', 'ita', NULL, 1),
('gcz', 'LKS Goczałkowice Zdrój', 'pol', NULL, 1),
('gen', 'Genoa CFC', 'ita', 'genoa_cfc.png', 4),
('ggd', 'Gedania Gdańsk', 'pol', NULL, 1),
('giu', 'Giugliano', 'ita', NULL, 1),
('gkl', 'Górnik Łęczna', 'pol', 'gornik_leczna.png', 2),
('gkr', 'Garbarnia Kraków', 'pol', NULL, 1),
('gni', 'Stolem Gniewino', 'pol', NULL, 1),
('gnk', 'KRC Genk', 'bel', NULL, 1),
('gpo', 'Górnik Polkowice', 'pol', NULL, 1),
('gra', 'Grasshopper Club Zürich', 'swi', NULL, 1),
('gta', 'Gwarek Tarnowskie Góry', 'pol', NULL, 1),
('gz2', 'Górnik II Zabrze', 'pol', NULL, 1),
('gza', 'Górnik Zabrze', 'pol', 'gornik_zabrze.png', 5),
('hak', 'FC Haka', 'fin', NULL, 1),
('ham', 'Hammarby IF', 'swe', NULL, 1),
('hb', 'HB Tórshavn', 'fro', NULL, 1),
('hbk', 'HB Køge', 'den', NULL, 1),
('hbs', 'Hapoel Beer Szewa', 'isr', NULL, 1),
('hee', 'FC Heerenveen', 'nld', NULL, 1),
('hfk', 'HIFK', 'fin', NULL, 1),
('hif', 'Hvidovre IF', 'den', NULL, 1),
('hjd', 'Hajduk Split', 'cro', NULL, 1),
('hjk', 'HJK Helsinki', 'fin', NULL, 1),
('hnk', 'FC Honka', 'fin', NULL, 1),
('hob', 'Hobro IK', 'den', NULL, 1),
('hof', 'TSG Hoffenstein', 'ger', NULL, 1),
('hor', 'AC Horsens', 'den', NULL, 1),
('hrk', 'FC Hradec Králové', 'cze', NULL, 1),
('hrt', 'Heart of Midlothian', 'sco', NULL, 1),
('hsv', 'Hamburger SV', 'ger', NULL, 1),
('hut', 'Hutnik Kraków', 'pol', 'hutnik_krakow.png', 2),
('ibk', 'Keflavík', 'ice', NULL, 1),
('ibv', 'ÍBV', 'ice', NULL, 1),
('ifk', 'IFK Göteborg', 'swe', NULL, 1),
('int', 'Inter Milan', 'ita', 'inter_milan.png', 5),
('jab', 'FC Jablonec', 'cze', NULL, 1),
('jag', 'Jagiellonia Białystok', 'pol', 'jagiellonia_bialystok.png', 5),
('jas', 'GKS Jastrzębie', 'pol', 'gks_jastrzebie.png', 2),
('jd', 'AC Juvenes/Dogana', 'smr', NULL, 1),
('jel', 'Karkonosze Jelenia Góra', 'pol', NULL, 1),
('jes', 'Jeunesse Esch', 'lux', NULL, 1),
('jg2', 'Jagiellonia II Białystok', 'pol', NULL, 1),
('jih', 'FC Vysočina Jihlava', 'cze', NULL, 1),
('jng', 'Juve Next Gen', 'ita', NULL, 1),
('juv', 'Juventus FC', 'ita', 'juventus_fc.png', 5),
('jvs', 'SS Juve Stabia', 'ita', 'ss_juve_stabia.png', 2),
('ka', 'KA Akureyrar', 'ice', NULL, 1),
('kaa', 'KAA Gent', 'bel', NULL, 1),
('kal', 'Kalmar FF', 'swe', NULL, 1),
('kar', 'MFK Karviná', 'cze', NULL, 1),
('kat', 'GKS Katowice', 'pol', 'gks_katowice.png', 3),
('ki', 'KÍ Klaksvík', 'fro', NULL, 1),
('kkr', 'Karpaty Krosno', 'pol', NULL, 1),
('kle', 'Sokół Kleczew', 'pol', NULL, 1),
('klu', 'MKS Kluczbork', 'pol', NULL, 1),
('kol', 'FC Köln', 'ger', NULL, 1),
('kop', 'FC København', 'den', NULL, 1),
('kor', 'Korona Kielce', 'pol', 'korona_kielce.png', 4),
('kos', 'FC Košice', 'svk', NULL, 1),
('kot', 'Kotwica Kołobrzeg', 'pol', 'kotwica_kolobrzeg.png', 2),
('kr', 'KR Reykjavík', 'ice', NULL, 1),
('kra', 'FK Krasnodar', 'rus', NULL, 1),
('kri', 'Kristiansund BK', 'nor', NULL, 1),
('krt', 'Cartusia Kartuzy', 'pol', NULL, 1),
('ksz', 'KKS 1925 Kalisz', 'pol', 'kks_1925_kalisz.png', 2),
('ktp', 'KTP Kotka', 'fin', NULL, 1),
('kts', 'KTS-K Luzino', 'pol', NULL, 1),
('kuo', 'KuPS Kuopio', 'fin', NULL, 1),
('kzo', 'KSZO 1929 Ostrowiec Świętokrzyski', 'pol', NULL, 1),
('lau', 'FC Lausanne-Sport', 'swi', NULL, 1),
('laz', 'SS Lazio', 'ita', 'ss_lazio.png', 5),
('lcc', 'Lucchese', 'ita', NULL, 1),
('lce', 'US Lecce', 'ita', 'us_lecce.png', 4),
('lec', 'Lecco', 'ita', 'lecco.png', 2),
('leg', 'Legia Warszawa', 'pol', 'legia_warszawa.png', 5),
('lei', 'Leicester City', 'eng', NULL, 1),
('lev', 'Bayer Leverkusen', 'ger', NULL, 1),
('lfc', 'Liverpool FC', 'eng', NULL, 1),
('lfi', 'SP La Fiorita', 'smr', NULL, 1),
('lg2', 'Legia II Warszawa', 'pol', NULL, 1),
('lgd', 'Lechia Gdańsk', 'pol', 'lechia_gdansk.png', 4),
('lgg', 'Legnago', 'ita', NULL, 1),
('lgo', 'Legionovia Legionowo', 'pol', NULL, 1),
('lht', 'FC Lahti', 'fin', NULL, 1),
('lib', 'AC Libertas', 'smr', NULL, 1),
('lil', 'Lille OSC', 'fra', NULL, 1),
('lit', 'Lillestrøm SK', 'nor', NULL, 1),
('lk2', 'ŁKS II Łódź', 'pol', NULL, 1),
('lks', 'ŁKS Łódź', 'pol', 'lks_lodz.png', 4),
('lok', 'Lokomotiv Moskva', 'rus', NULL, 1),
('lom', 'ŁKS 1926 Łomża', 'pol', NULL, 1),
('loz', 'Lokomotiva Zagreb', 'cro', NULL, 1),
('lp2', 'Lech II Poznań', 'pol', NULL, 1),
('lpo', 'Lech Poznań', 'pol', 'lech_poznan.png', 5),
('lsd', 'LZS Starowice Dolne', 'pol', NULL, 1),
('ltm', 'Lechia Tomaszów Mazowiecki', 'pol', NULL, 1),
('ltn', 'Latina', 'ita', NULL, 1),
('lug', 'FC Lugano', 'swi', NULL, 1),
('lum', 'FC Lumezzane', 'ita', NULL, 1),
('luz', 'FC Luzern', 'swi', NULL, 1),
('lvt', 'US Sestri Levante', 'ita', NULL, 1),
('lwi', 'Pelikan Łowicz', 'pol', NULL, 1),
('lwo', 'FK Lviv', 'ukr', NULL, 1),
('lyn', 'Lyngby BK', 'den', NULL, 1),
('lyo', 'Olympique Lyon', 'fra', NULL, 1),
('lzg', 'Lechia Zielona Góra', 'pol', NULL, 1),
('mah', 'IFK Marienham', 'fin', NULL, 1),
('mai', 'FSV Mainz 05', 'ger', NULL, 1),
('mal', 'Málaga CF', 'spa', NULL, 1),
('mar', 'FK Mariupol', 'ukr', NULL, 1),
('mgl', 'Borussia Mönchengladbach', 'ger', NULL, 1),
('mha', 'Maccabi Hajfa', 'isr', NULL, 1),
('mhs', 'Montpellier HSC', 'fra', NULL, 1),
('mid', 'FC Midtjylland', 'den', NULL, 1),
('mie', 'Miedź Legnica', 'pol', 'miedz_legnica.png', 2),
('mil', 'AC Milan', 'ita', 'ac_milan.png', 5),
('mio', 'CS Mioveni', 'rom', NULL, 1),
('mla', 'Mławianka Mława', 'pol', NULL, 1),
('mlb', 'FK Mladá Boleslav', 'cze', NULL, 1),
('mlo', 'Malmö FF', 'swe', NULL, 1),
('mnc', 'Manchester City', 'eng', NULL, 1),
('mnp', 'SS Monopoli', 'ita', NULL, 1),
('mnt', 'Mantova', 'ita', 'mantova.png', 2),
('mnu', 'Manchester United', 'eng', NULL, 1),
('mod', 'Modena FC', 'ita', 'modena_fc.png', 3),
('mol', 'Molde FK', 'nor', NULL, 1),
('mon', 'AC Monza', 'ita', 'ac_monza.png', 4),
('mot', 'Motor Lublin', 'pol', 'motor_lublin.png', 3),
('mss', 'ACR Messina', 'ita', NULL, 1),
('mtr', 'Monterosi', 'ita', NULL, 1),
('mur', 'SS Murata', 'smr', NULL, 1),
('myj', 'Spartak Myjava', 'svk', NULL, 1),
('nan', 'FC Nantes', 'fra', NULL, 1),
('nap', 'SSC Napoli', 'ita', 'ssc_napoli.png', 5),
('nec', 'NEC', 'nld', NULL, 1),
('neu', 'Neuchâtel Xamax FCS', 'swi', NULL, 1),
('new', 'Newcastle United', 'eng', NULL, 1),
('nic', 'OGC Nice', 'fra', NULL, 1),
('nit', 'FC Nitra', 'svk', NULL, 1),
('nkr', 'HNK Rijeka', 'cro', NULL, 1),
('nsi', 'NSÍ Runavík', 'fro', NULL, 1),
('nsk', 'Pogoń Nowe Skalmierzyce', 'pol', NULL, 1),
('nta', 'Podhale Nowy Targ', 'pol', NULL, 1),
('ntw', 'Newtown AFC', 'wal', NULL, 1),
('nvr', 'Novara FC', 'ita', NULL, 1),
('nyo', 'FC Stade Nyonnais', 'swi', NULL, 1),
('obk', 'Odense BK', 'den', NULL, 1),
('odo', 'Odra Opole', 'pol', 'odra_opole.png', 3),
('odw', 'Odra Wodzisław', 'pol', 'odra_wodzislaw.png', 2),
('ogr', 'Olimpia Grudziądz', 'pol', 'olimpia_grudziadz.png', 1),
('olb', 'Olbia', 'ita', NULL, 1),
('oly', 'Olympiakos SFP', 'gre', NULL, 1),
('oma', 'Olympique de Marseille', 'fra', NULL, 1),
('opa', 'SFC Opava', 'cze', NULL, 1),
('orp', 'Orlęta Radzyń Podlaski', 'pol', NULL, 1),
('osi', 'NK Osijek', 'cro', NULL, 1),
('oul', 'AC Oulu', 'fin', NULL, 1),
('pad', 'Padova', 'ita', 'padova.png', 2),
('pao', 'Panathinaikos AO', 'gre', NULL, 1),
('par', 'Partizan Belgrad', 'srb', NULL, 1),
('pas', 'PAOK FC', 'gre', NULL, 1),
('pbt', 'Polonia Bytom', 'pol', 'polonia_bytom.png', 2),
('pcn', 'AZ Picerno', 'ita', 'az_picerno.png', 2),
('pdb', 'FK Pardubice', 'cze', NULL, 1),
('pen', 'SS Pennarossa', 'smr', NULL, 1),
('per', 'AC Perugia', 'ita', NULL, 1),
('pet', 'Petrolul Ploeszti', 'rom', NULL, 1),
('pg2', 'Pogoń II Szczecin', 'pol', NULL, 1),
('pgm', 'Pogoń Grodzisk Mazowiecki', 'pol', NULL, 1),
('pia', 'Piast Gliwice', 'pol', 'piast_gliwice.png', 5),
('pin', 'AS Pineto', 'ita', NULL, 1),
('pis', 'Pisa SC', 'ita', 'pisa_sc.png', 2),
('plm', 'Palermo FC', 'ita', 'palermo_fc.png', 4),
('pni', 'Puszcza Niepołomice', 'pol', 'puszcza_niepolomice.png', 3),
('pnt', 'Pontedera', 'ita', NULL, 1),
('pod', 'Podbeskidzie Bielsko-Biała', 'pol', 'podbeskidzie_bielsko_biala.png', 2),
('pog', 'Pogoń Szczecin', 'pol', 'pogon_szczecin.png', 5),
('poh', 'FC Pohronie', 'svk', NULL, 1),
('por', 'FC Porto', 'por', NULL, 1),
('ppa', 'Pro Patria', 'ita', NULL, 1),
('pps', 'Pniówek Pawłowice Śląskie', 'pol', NULL, 1),
('prg', 'US Pergolettese', 'ita', NULL, 1),
('prm', 'Parma', 'ita', 'parma.png', 3),
('pro', 'Progrès Niedercorn', 'lux', NULL, 1),
('psc', 'Pescara', 'ita', NULL, 1),
('pse', 'Pro Sesto', 'ita', NULL, 1),
('psg', 'Paris Saint-Germain', 'fra', NULL, 1),
('psi', 'Pogoń Siedlce', 'pol', 'pogon_siedlce.png', 1),
('psv', 'PSV Eindhoven', 'nld', NULL, 1),
('ptr', 'FC Petržalka', 'svk', NULL, 1),
('ptz', 'Potenza', 'ita', NULL, 1),
('pwa', 'Polonia Warszawa', 'pol', 'polonia_warszawa.png', 3),
('rac', 'Racing FC', 'lux', NULL, 1),
('rad', 'Radomiak Radom', 'pol', 'radomiak_radom.png', 4),
('rak', 'Raków Częstochowa', 'pol', 'rakow_czestochowa.png', 5),
('ran', 'Rangers FC', 'sco', NULL, 1),
('rap', 'Rapid Bukareszt', 'rom', NULL, 1),
('rbk', 'Rosenborg BK', 'nor', NULL, 1),
('rbl', 'RB Leipzig', 'ger', NULL, 1),
('rbs', 'Red Bull Salzburg', 'aut', NULL, 1),
('rch', 'Ruch Chorzów', 'pol', 'ruch_chorzow.png', 4),
('rcl', 'RC Lens', 'fra', NULL, 1),
('rcn', 'US Recanatese', 'ita', NULL, 1),
('rcs', 'RC Strasbourg', 'fra', NULL, 1),
('rei', 'Stade de Reims', 'fra', NULL, 1),
('rek', 'Rekord Bielsko-Biała', 'pol', NULL, 1),
('ren', 'Stade Rennes', 'fra', NULL, 1),
('res', 'Resovia', 'pol', 'resovia.png', 2),
('rfc', 'Randers FC', 'den', NULL, 1),
('rgg', 'Reggiana', 'ita', 'reggiana.png', 2),
('rim', 'Rimini FC', 'ita', 'rimini_fc.png', 1),
('rk2', 'Raków II Częstochowa', 'pol', NULL, 1),
('rkc', 'RKC Waalwijk', 'nld', NULL, 1),
('rma', 'Real Madrid', 'spa', NULL, 1),
('rnt', 'AC Renate', 'ita', NULL, 1),
('rom', 'AS Roma', 'ita', 'as_roma.png', 5),
('rpd', 'Rapid Wien', 'aut', NULL, 1),
('rps', 'Vaasan Palloseura', 'fin', NULL, 1),
('rso', 'Real Sociedad', 'spa', NULL, 1),
('rst', 'Radunia Stężyca', 'pol', 'radunia_stezyca.png', 1),
('rub', 'Rubin Kazan', 'rus', NULL, 1),
('rux', 'Ruh Lviv', 'ukr', NULL, 1),
('ruz', 'MFK Ružomberok', 'svk', NULL, 1),
('s04', 'FC Schalke 04', 'ger', NULL, 1),
('sal', 'Salernitana', 'ita', 'salernitana.png', 3),
('sas', 'US Sassuolo', 'ita', 'us_sassuolo.png', 4),
('sch', 'FC Schaffhausen', 'swi', NULL, 1),
('scp', 'Sporting CP', 'por', NULL, 1),
('scw', 'Star Starachowice', 'pol', NULL, 1),
('sdj', 'SønderjyskE', 'den', NULL, 1),
('sed', 'ŠKF Sereď', 'svk', NULL, 1),
('sen', 'FK Senica', 'svk', NULL, 1),
('ser', 'Servette FC', 'swi', NULL, 1),
('sev', 'Sevilla FC', 'spa', NULL, 1),
('sga', 'Błękitni Stargard', 'pol', NULL, 1),
('sgd', 'KP Starogard Gdański', 'pol', NULL, 1),
('sgi', 'SS San Giovanni', 'smr', NULL, 1),
('sgw', 'Stilon Gorzów Wielkopolski', 'pol', NULL, 1),
('shr', 'Shamrock Rovers', 'irl', NULL, 1),
('sia', 'Siarka Tarnobrzeg', 'pol', NULL, 1),
('sie', 'Warta Sieradz', 'pol', NULL, 1),
('sif', 'Silkeborg IF', 'den', NULL, 1),
('sig', 'Sigma Olomouc', 'cze', NULL, 1),
('sio', 'FC Sion', 'swi', NULL, 1),
('sjk', 'Seinäjoen JK', 'fin', NULL, 1),
('ska', 'MFK Skalica', 'svk', NULL, 1),
('skc', 'Skra Częstochowa', 'pol', 'skra_czestochowa.png', 1),
('skr', 'Unia Skierniewice', 'pol', NULL, 1),
('sku', 'Unia Solec Kujawski', 'pol', NULL, 1),
('sl2', 'Śląsk II Wrocław', 'pol', NULL, 1),
('sla', 'Śląsk Wrocław', 'pol', 'slask_wroclaw.png', 5),
('slb', 'Slovan Bratislava', 'svk', NULL, 1),
('slc', 'FC Slovácko', 'cze', NULL, 1),
('slj', 'Victoria Sulejówek', 'pol', NULL, 1),
('sll', 'Slovan Liberec', 'cze', NULL, 1),
('slo', 'FC Stade Lausanne Ouchy', 'swi', NULL, 1),
('slv', 'Slavia Praha', 'cze', NULL, 1),
('slw', 'Ślęza Wrocław', 'pol', NULL, 1),
('smi', 'Stal Mielec', 'pol', 'stal_mielec.png', 4),
('smp', 'UC Sampdoria', 'ita', 'uc_sampdoria.png', 3),
('sns', 'Sandecja Nowy Sącz', 'pol', 'sandecja_nowy_sacz.png', 2),
('soc', 'PFK Soczi', 'rus', NULL, 1),
('sot', 'Southampton', 'eng', NULL, 1),
('spa', 'Sparta Praha', 'cze', NULL, 1),
('spk', 'Spartak Moskva', 'rus', NULL, 1),
('spl', 'SPAL', 'ita', NULL, 1),
('spr', 'Sparta Rotterdam', 'nld', NULL, 1),
('spz', 'Spezia', 'ita', 'spezia.png', 3),
('srr', 'Sorrento', 'ita', NULL, 1),
('srw', 'Polonia Środa Wielkopolska', 'pol', NULL, 1),
('ssf', 'SS Folgore/Falciano', 'smr', NULL, 1),
('ssg', 'Sepsi Sfântu Gheorghe', 'rom', NULL, 1),
('ssi', 'Sokół Sieniawa', 'pol', NULL, 1),
('ssw', 'Stal Stalowa Wola', 'pol', 'stal_stalowa_wola.png', 2),
('ssz', 'Świt Szczecin', 'pol', NULL, 1),
('stg', 'Sturm Graz', 'aut', NULL, 1),
('stj', 'Stjarhan', 'ice', NULL, 1),
('stn', 'Spartak Trnava', 'svk', NULL, 1),
('sto', 'Stomil Olsztyn', 'pol', 'stomil_olsztyn.png', 2),
('str', 'Stal Rzeszów', 'pol', 'stal_rzeszow.png', 3),
('stu', 'VfB Stuttgart', 'ger', NULL, 1),
('swa', 'Unia Swarzędz', 'pol', NULL, 1),
('swd', 'Świdniczanka Świdnik', 'pol', NULL, 1),
('swi', 'Swift Hesperange', 'lux', NULL, 1),
('swm', 'Świt Nowy Dwór Mazowiecki', 'pol', NULL, 1),
('swn', 'Flota Świnoujście', 'pol', NULL, 1),
('sza', 'Szachtior Donieck', 'ukr', NULL, 1),
('tar', 'Taranto', 'ita', NULL, 1),
('tep', 'FK Teplice', 'cze', NULL, 1),
('ter', 'Ternana', 'ita', 'ternana.png', 2),
('tfi', 'SP Tre Fiori', 'smr', NULL, 1),
('thu', 'FC Thun', 'swi', NULL, 1),
('til', 'Tampereen Ilves', 'fin', NULL, 1),
('tir', 'FC Südtirol', 'ita', 'fc_sudtirol.png', 2),
('tlm', 'Tatran Liptovský Mikuláš', 'svk', NULL, 1),
('tns', 'The New Saints FC', 'wal', NULL, 1),
('tnt', 'AC Trento', 'ita', NULL, 1),
('tor', 'Torino FC', 'ita', 'torino_fc.png', 5),
('tot', 'Tottenham Hotspur', 'eng', NULL, 1),
('tpe', 'SP Tre Penne', 'smr', NULL, 1),
('tra', 'Trabzonspor', 'tur', NULL, 1),
('tre', 'AS Trenčin', 'svk', NULL, 1),
('tri', 'US Triestina', 'ita', 'us_triestina.png', 2),
('trr', 'Torres', 'ita', 'torres.png', 2),
('trs', 'SS Turris', 'ita', NULL, 1),
('tsl', 'Unia Turza Śląska', 'pol', NULL, 1),
('tur', 'Inter Turku', 'fin', NULL, 1),
('twe', 'FC Twente', 'nld', NULL, 1),
('tyc', 'GKS Tychy', 'pol', 'gks_tychy.png', 3),
('ucl', 'Universitatea Cluj', 'rom', NULL, 1),
('ucv', 'Universitatea Craiova', 'rom', NULL, 1),
('udi', 'Udinese', 'ita', 'udinese.png', 4),
('una', 'UNA Strassen', 'lux', NULL, 1),
('unb', 'Union Berlin', 'ger', NULL, 1),
('unt', 'Unia Tarnów', 'pol', NULL, 1),
('usg', 'Union SG', 'bel', NULL, 1),
('uta', 'UTA Arad', 'rom', NULL, 1),
('utr', 'FC Ultrecht', 'nld', NULL, 1),
('val', 'Valencia CF', 'spa', NULL, 1),
('vcl', 'FC Pro Vercelli', 'ita', NULL, 1),
('vcn', 'Vicenza', 'ita', NULL, 1),
('vej', 'Vejle BK', 'den', NULL, 1),
('ven', 'Vendsyssel FF', 'den', NULL, 1),
('ver', 'Hellas Verona', 'ita', 'hellas_verona.png', 4),
('ves', 'FC Vestsjælland', 'den', NULL, 1),
('vib', 'Viborg FF', 'den', NULL, 1),
('vik', 'Viking FK', 'nor', NULL, 1),
('vil', 'Villarreal FC', 'spa', NULL, 1),
('vir', 'AC Virtus', 'smr', NULL, 1),
('vit', 'Vitesse', 'nld', NULL, 1),
('vkg', 'Víkingur Gøta', 'fro', NULL, 1),
('vkr', 'Víkingur Reykjavík', 'ice', NULL, 1),
('vl', 'Vålerenga Fotball', 'nor', NULL, 1),
('vlr', 'Valur', 'ice', NULL, 1),
('vnz', 'Venezia FC', 'ita', 'venezia_fc.png', 4),
('vol', 'FC Voluntari', 'rom', NULL, 1),
('vpe', 'Vis Pesaro', 'ita', NULL, 1),
('vpl', 'Viktoria Plzeň', 'cze', NULL, 1),
('vve', 'Virtus Verona', 'ita', NULL, 1),
('wac', 'Wolfsberger AC', 'aut', NULL, 1),
('war', 'Warta Poznań', 'pol', 'warta_poznan.png', 4),
('wgs', 'Wigry Suwałki', 'pol', 'wigry_suwalki.png', 2),
('wgw', 'Warta Gorzów Wielkopolski', 'pol', NULL, 1),
('whu', 'West Ham United', 'eng', NULL, 1),
('wia', 'KS Wiązownica', 'pol', NULL, 1),
('wid', 'Widzew Lódź', 'pol', 'widzew_lodz.png', 4),
('wie', 'Wieczysta Kraków', 'pol', NULL, 1),
('win', 'FC Winterthur', 'swi', NULL, 1),
('wja', 'Wiślanie Jaśkowice', 'pol', NULL, 1),
('wkl', 'GKS Wikielec', 'pol', NULL, 1),
('wkr', 'Wisła Kraków', 'pol', 'wisla_krakow.png', 5),
('wln', 'Vineta Wolin', 'pol', NULL, 1),
('wol', 'VfL Wolfsburg', 'ger', NULL, 1),
('wpl', 'Wisła Płock', 'pol', 'wisla_plock.png', 3),
('wpu', 'Wisła Puławy', 'pol', 'wisla_pulawy.png', 2),
('ybo', 'BSC Young Boys', 'swi', NULL, 1),
('yve', 'Yverdon-Sport FC', 'swi', NULL, 1),
('za2', 'Zagłębie II Lubin', 'pol', NULL, 1),
('zaw', 'Zawisza Bydgoszcz', 'pol', 'zawisza_bydgoszcz.png', 2),
('zbr', 'FC Zbrojovka Brno', 'cze', NULL, 1),
('zen', 'Zenit Petersburg', 'rus', NULL, 1),
('ziz', 'Viktoria Žižkov', 'cze', NULL, 1),
('zlm', 'FC Zlaté Moravce', 'svk', NULL, 1),
('zln', 'FC Zlín', 'cze', NULL, 1),
('zlu', 'Zagłębie Lubin', 'pol', 'zaglebie_lubin.png', 4),
('zmb', 'Olimpia Zambrów', 'pol', NULL, 1),
('zmi', 'Zemplín Michalovce', 'svk', NULL, 1),
('zna', 'SC Znajmo', 'cze', NULL, 1),
('zni', 'Znicz Pruszków', 'pol', 'znicz_pruszkow.png', 3),
('zor', 'Zoria Lugansk', 'ukr', NULL, 1),
('zpo', 'FK Železiarne Podbrezová', 'svk', NULL, 1),
('zso', 'Zagłębie Sosnowiec', 'pol', 'zaglebie_sosnowiec.png', 3),
('zur', 'FC Zürich', 'swi', NULL, 1),
('zyl', 'MŠK Žilina', 'svk', NULL, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `confederations`
--

CREATE TABLE `confederations` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `confederations`
--

INSERT INTO `confederations` (`id`, `name`) VALUES
(1, 'UEFA'),
(2, 'CONMEBOL'),
(3, 'AFC'),
(4, 'CAF'),
(5, 'CONCACAF'),
(6, 'OFC');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `groups_teams`
--

CREATE TABLE `groups_teams` (
  `id` int(10) UNSIGNED NOT NULL,
  `group_ch` varchar(1) DEFAULT NULL,
  `group_pos` int(10) UNSIGNED DEFAULT NULL,
  `league_id` varchar(4) NOT NULL,
  `team_name` varchar(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Daten für Tabelle `groups_teams`
--

INSERT INTO `groups_teams` (`id`, `group_ch`, `group_pos`, `league_id`, `team_name`) VALUES
(1, 'C', 1, '3', 'arg'),
(2, 'D', 2, '3', 'aus'),
(3, 'F', 1, '3', 'bel'),
(4, 'G', 1, '3', 'bra'),
(5, 'G', 4, '3', 'cmr'),
(6, 'F', 2, '3', 'can'),
(7, 'E', 2, '3', 'cri'),
(8, 'F', 4, '3', 'cro'),
(9, 'D', 3, '3', 'den'),
(10, 'A', 2, '3', 'ecu'),
(11, 'B', 1, '3', 'eng'),
(12, 'D', 1, '3', 'fra'),
(13, 'B', 3, '3', 'usa'),
(14, 'E', 3, '3', 'ger'),
(15, 'H', 2, '3', 'gha'),
(16, 'B', 2, '3', 'irn'),
(17, 'E', 4, '3', 'jap'),
(18, 'H', 4, '3', 'kor'),
(19, 'C', 3, '3', 'mex'),
(20, 'F', 3, '3', 'mor'),
(21, 'A', 4, '3', 'nld'),
(22, 'C', 4, '3', 'pol'),
(23, 'H', 1, '3', 'por'),
(24, 'A', 1, '3', 'qat'),
(25, 'C', 2, '3', 'sau'),
(26, 'A', 3, '3', 'sen'),
(27, 'E', 1, '3', 'spa'),
(28, 'G', 2, '3', 'srb'),
(29, 'G', 3, '3', 'swi'),
(30, 'D', 4, '3', 'tun'),
(31, 'H', 3, '3', 'uru'),
(32, 'B', 4, '3', 'wal'),
(33, 'A', 1, '2', 'rus'),
(34, 'A', 2, '2', 'sau'),
(35, 'A', 3, '2', 'egy'),
(36, 'A', 4, '2', 'uru'),
(37, 'B', 1, '2', 'por'),
(38, 'B', 2, '2', 'spa'),
(39, 'B', 3, '2', 'mor'),
(40, 'B', 4, '2', 'irn'),
(41, 'C', 1, '2', 'fra'),
(42, 'C', 2, '2', 'aus'),
(43, 'C', 3, '2', 'per'),
(44, 'C', 4, '2', 'den'),
(45, 'D', 1, '2', 'arg'),
(46, 'D', 2, '2', 'ice'),
(47, 'D', 3, '2', 'cro'),
(48, 'D', 4, '2', 'nga'),
(49, 'E', 1, '2', 'bra'),
(50, 'E', 2, '2', 'swi'),
(51, 'E', 3, '2', 'cri'),
(52, 'E', 4, '2', 'srb'),
(53, 'F', 1, '2', 'ger'),
(54, 'F', 2, '2', 'mex'),
(55, 'F', 3, '2', 'swe'),
(56, 'F', 4, '2', 'kor'),
(57, 'G', 1, '2', 'bel'),
(58, 'G', 2, '2', 'pan'),
(59, 'G', 3, '2', 'tun'),
(60, 'G', 4, '2', 'eng'),
(61, 'H', 1, '2', 'pol'),
(62, 'H', 2, '2', 'sen'),
(63, 'H', 3, '2', 'col'),
(64, 'H', 4, '2', 'jap'),
(65, 'A', 1, '1', 'bra'),
(66, 'A', 2, '1', 'cro'),
(67, 'A', 3, '1', 'mex'),
(68, 'A', 4, '1', 'cmr'),
(69, 'B', 1, '1', 'spa'),
(70, 'B', 2, '1', 'nld'),
(71, 'B', 3, '1', 'chi'),
(72, 'B', 4, '1', 'aus'),
(73, 'C', 1, '1', 'col'),
(74, 'C', 2, '1', 'gre'),
(75, 'C', 3, '1', 'ivc'),
(76, 'C', 4, '1', 'jap'),
(77, 'D', 1, '1', 'uru'),
(78, 'D', 2, '1', 'cri'),
(79, 'D', 3, '1', 'eng'),
(80, 'D', 4, '1', 'ita'),
(81, 'E', 1, '1', 'swi'),
(82, 'E', 2, '1', 'ecu'),
(83, 'E', 3, '1', 'fra'),
(84, 'E', 4, '1', 'hon'),
(85, 'F', 1, '1', 'arg'),
(86, 'F', 2, '1', 'bih'),
(87, 'F', 3, '1', 'irn'),
(88, 'F', 4, '1', 'nga'),
(89, 'G', 1, '1', 'ger'),
(90, 'G', 2, '1', 'por'),
(91, 'G', 3, '1', 'gha'),
(92, 'G', 4, '1', 'usa'),
(93, 'H', 1, '1', 'bel'),
(94, 'H', 2, '1', 'alg'),
(95, 'H', 3, '1', 'rus'),
(96, 'H', 4, '1', 'kor'),
(97, 'A', 1, '6', 'fra'),
(98, 'A', 2, '6', 'rom'),
(99, 'A', 3, '6', 'alb'),
(100, 'A', 4, '6', 'swi'),
(101, 'B', 1, '6', 'eng'),
(102, 'B', 2, '6', 'rus'),
(103, 'B', 3, '6', 'wal'),
(104, 'B', 4, '6', 'svk'),
(105, 'C', 1, '6', 'ger'),
(106, 'C', 2, '6', 'ukr'),
(107, 'C', 3, '6', 'pol'),
(108, 'C', 4, '6', 'nir'),
(109, 'D', 1, '6', 'spa'),
(110, 'D', 2, '6', 'cze'),
(111, 'D', 3, '6', 'tur'),
(112, 'D', 4, '6', 'cro'),
(113, 'E', 1, '6', 'bel'),
(114, 'E', 2, '6', 'ita'),
(115, 'E', 3, '6', 'irl'),
(116, 'E', 4, '6', 'swe'),
(117, 'F', 1, '6', 'por'),
(118, 'F', 2, '6', 'ice'),
(119, 'F', 3, '6', 'aut'),
(120, 'F', 4, '6', 'hun'),
(121, 'A', 1, '5', 'tur'),
(122, 'A', 2, '5', 'ita'),
(123, 'A', 3, '5', 'wal'),
(124, 'A', 4, '5', 'swi'),
(125, 'B', 1, '5', 'den'),
(126, 'B', 2, '5', 'fin'),
(127, 'B', 3, '5', 'bel'),
(128, 'B', 4, '5', 'rus'),
(129, 'C', 1, '5', 'nld'),
(130, 'C', 2, '5', 'ukr'),
(131, 'C', 3, '5', 'aut'),
(132, 'C', 4, '5', 'mkd'),
(133, 'D', 1, '5', 'eng'),
(134, 'D', 2, '5', 'cro'),
(135, 'D', 3, '5', 'sco'),
(136, 'D', 4, '5', 'cze'),
(137, 'E', 1, '5', 'spa'),
(138, 'E', 2, '5', 'swe'),
(139, 'E', 3, '5', 'pol'),
(140, 'E', 4, '5', 'svk'),
(141, 'F', 1, '5', 'hun'),
(142, 'F', 2, '5', 'por'),
(143, 'F', 3, '5', 'fra'),
(144, 'F', 4, '5', 'ger'),
(145, 'A', 1, '4', 'ger'),
(146, 'A', 2, '4', 'sco'),
(147, 'A', 3, '4', 'hun'),
(148, 'A', 4, '4', 'swi'),
(149, 'B', 1, '4', 'spa'),
(150, 'B', 2, '4', 'cro'),
(151, 'B', 3, '4', 'ita'),
(152, 'B', 4, '4', 'alb'),
(153, 'C', 1, '4', 'svn'),
(154, 'C', 2, '4', 'den'),
(155, 'C', 3, '4', 'srb'),
(156, 'C', 4, '4', 'eng'),
(157, 'D', 2, '4', 'nld'),
(158, 'D', 3, '4', 'aut'),
(159, 'D', 4, '4', 'fra'),
(160, 'E', 1, '4', 'bel'),
(161, 'E', 2, '4', 'svk'),
(162, 'E', 3, '4', 'rom'),
(163, 'F', 1, '4', 'tur'),
(164, 'F', 3, '4', 'por'),
(165, 'F', 4, '4', 'cze'),
(166, NULL, 1, '4', 'pol'),
(167, NULL, 1, '4', 'est'),
(168, NULL, 1, '4', 'wal'),
(169, NULL, 1, '4', 'fin'),
(170, NULL, 4, '4', 'isr'),
(171, NULL, 4, '4', 'ice'),
(172, NULL, 4, '4', 'bih'),
(173, NULL, 4, '4', 'ukr'),
(174, NULL, 2, '4', 'geo'),
(175, NULL, 2, '4', 'lux'),
(176, NULL, 2, '4', 'gre'),
(177, NULL, 2, '4', 'kaz');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `lang`
--

CREATE TABLE `lang` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `leagues`
--

CREATE TABLE `leagues` (
  `id` int(10) UNSIGNED NOT NULL,
  `year` int(11) NOT NULL,
  `type_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `leagues`
--

INSERT INTO `leagues` (`id`, `year`, `type_id`) VALUES
(1, 2014, 1),
(2, 2018, 1),
(3, 2022, 1),
(4, 2024, 2),
(5, 2020, 2),
(6, 2016, 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `likes`
--

CREATE TABLE `likes` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `game_id` int(10) UNSIGNED NOT NULL,
  `creation_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `names_clubs`
--

CREATE TABLE `names_clubs` (
  `id` int(10) UNSIGNED NOT NULL,
  `content` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `club_id` varchar(3) NOT NULL,
  `lang_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `names_clubs`
--

INSERT INTO `names_clubs` (`id`, `content`, `club_id`, `lang_id`) VALUES
(1, 'Bayern Monachium', 'bmu', 1),
(2, 'Slavia Praga', 'slv', 1),
(3, 'Sparta Praga', 'spa', 1),
(4, 'RB Lipsk', 'rbl', 1),
(5, 'Viktoria Pilzno', 'vpl', 1),
(6, 'Rapid Wiedeń', 'rpd', 1),
(8, 'Olympique Marsylia', 'oma', 1),
(9, 'Dinamo Moskwa', 'din', 1),
(10, 'CSKA Moskwa', 'csk', 1),
(11, 'Lokomotiw Moskwa', 'lok', 1),
(12, 'Rubin Kazań', 'rub', 1),
(13, 'Spartak Moskwa', 'spk', 1),
(14, 'Szachtar Donieck', 'sza', 1),
(15, 'Dynamo Kijów', 'dkv', 1),
(16, 'Zoria Lugansk', 'zor', 1),
(17, 'Ruch Lwów', 'rux', 1),
(18, 'FK Lwow', 'lwo', 1),
(19, 'Real Madryt', 'rma', 1),
(20, 'Atlético Madryt', 'atm', 1),
(21, 'Inter Mediolan', 'int', 1),
(22, 'APOEL Nikozja', 'apn', 1),
(23, 'AEK Ateny', 'aek', 1),
(24, 'Beitar Jerozolima', 'bei', 1),
(25, 'Dinamo Zagrzeb', 'dnz', 1),
(26, 'Lokomotiva Zagrzeb', 'loz', 1),
(27, 'Slovan Bratysława', 'slb', 1),
(28, 'Spartak Trnawa', 'stn', 1),
(29, 'AS Trenczyn', 'tre', 1),
(40, 'FC Kopenhaga', 'kop', 1),
(42, 'Austria Wiedeń', 'awi', 1),
(46, 'Sigma Ołomuniec', 'sig', 1),
(47, 'Dynamo Czeskie Budziejowice', 'cbu', 1),
(48, 'Baník Ostrawa', 'ban', 1),
(49, 'FC Zlin', 'zln', 1),
(50, 'Universitatea Krajowa', 'ucv', 1),
(51, 'FCV Farul Konstanca', 'far', 1),
(52, 'Universitatea Kluż', 'ucl', 1),
(53, 'Tatran Liptowski Mikułasz', 'tlm', 1),
(54, 'Grasshopper Club Zurych', 'gra', 1),
(55, 'FC Vysočina Igława', 'jih', 1),
(56, 'Dukla Praga', 'duk', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `names_teams`
--

CREATE TABLE `names_teams` (
  `id` int(10) UNSIGNED NOT NULL,
  `content` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `team_id` varchar(3) NOT NULL,
  `lang_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(10, 'Walia', 'wal', 1),
(11, 'Argentyna', 'arg', 1),
(12, 'Polska', 'pol', 1),
(13, 'Meksyk', 'mex', 1),
(14, 'Arabia Saudyjska', 'sau', 1),
(15, 'Francja', 'fra', 1),
(16, 'Dania', 'den', 1),
(17, 'Tunezja', 'tun', 1),
(18, 'Australia', 'aus', 1),
(21, 'Hiszpania', 'spa', 1),
(22, 'Niemcy', 'ger', 1),
(23, 'Japonia', 'jap', 1),
(24, 'Kostaryka', 'cri', 1),
(26, 'Belgia', 'bel', 1),
(27, 'Kanada', 'can', 1),
(28, 'Maroko', 'mor', 1),
(29, 'Chorwacja', 'cro', 1),
(30, 'Brazylia', 'bra', 1),
(31, 'Serbia', 'srb', 1),
(32, 'Szwajcaria', 'swi', 1),
(33, 'Kamerun', 'cmr', 1),
(34, 'Portugalia', 'por', 1),
(35, 'Ghana', 'gha', 1),
(36, 'Urugwaj', 'uru', 1),
(37, 'Korea Południowa', 'kor', 1),
(39, 'Egipt', 'egy', 1),
(40, 'Kolumbia', 'col', 1),
(41, 'Peru', 'per', 1),
(42, 'Panama', 'pan', 1),
(43, 'Szwecja', 'swe', 1),
(44, 'Islandia', 'ice', 1),
(45, 'Nigeria', 'nga', 1),
(46, 'N-Zelandia', 'nze', 1),
(47, 'ZEA', 'zae', 1),
(48, 'Szkocja', 'sco', 1),
(49, 'Ukraina', 'ukr', 1),
(50, 'Austria', 'aut', 1),
(51, 'Włochy', 'ita', 1),
(52, 'Rumunia', 'rom', 1),
(53, 'Turcja', 'tur', 1),
(55, 'Czechy', 'cze', 1),
(56, 'Słowacja', 'svk', 1),
(57, 'Irlandia', 'irl', 1),
(58, 'Litwa', 'ltu', 1),
(59, 'Węgry', 'hun', 1),
(60, 'Bułgaria', 'bul', 1),
(61, 'Algieria', 'alg', 1),
(62, 'WKS', 'ivc', 1),
(63, 'Angola', 'ang', 1),
(64, 'RPA', 'rpa', 1),
(65, 'Słowenia', 'svn', 1),
(66, 'Finlandia', 'fin', 1),
(67, 'Grecja', 'gre', 1),
(68, 'Chile', 'chi', 1),
(69, 'Paragwaj', 'par', 1),
(70, 'Wenezuela', 'ven', 1),
(71, 'Boliwia', 'bol', 1),
(72, 'Honduras', 'hon', 1),
(73, 'Jamajka', 'jam', 1),
(74, 'Chiny', 'chn', 1),
(75, 'Macedonia Północna', 'mkd', 1),
(76, 'Uzbekistan', 'uzb', 1),
(77, 'Czarnogóra', 'mne', 1),
(78, 'Bośnia i H', 'bih', 1),
(79, 'Irlandia Północna', 'nir', 1),
(80, 'Norwegia', 'nor', 1),
(81, 'Albania', 'alb', 1),
(82, 'Andora', 'and', 1),
(83, 'Gruzja', 'geo', 1),
(84, 'Luksemburg', 'lux', 1),
(85, 'Malta', 'mlt', 1),
(86, 'Liechtenstein', 'lie', 1),
(87, 'Armenia', 'arm', 1),
(88, 'Białoruś', 'blr', 1),
(89, 'Azerbejdżan', 'aze', 1),
(90, 'Cypr', 'cyp', 1),
(91, 'Estonia', 'est', 1),
(92, 'Wyspy Owcze', 'fro', 1),
(93, 'Gibraltar', 'gib', 1),
(94, 'Izrael', 'isr', 1),
(95, 'Kosowo', 'kos', 1),
(96, 'Mołdawia', 'mda', 1),
(97, 'Łotwa', 'lva', 1),
(98, 'San Marino', 'smr', 1),
(100, 'Kazachstan', 'kaz', 1),
(101, 'DRK', 'cod', 1),
(102, 'Mali', 'mli', 1),
(103, 'Rosja', 'rus', 1),
(104, 'Antigua i Barbuda', 'atg', 1),
(105, 'Kuba', 'cub', 1),
(106, 'Curaçao', 'cuw', 1),
(107, 'Dominikana', 'dom', 1),
(108, 'Salwador', 'slv', 1),
(109, 'Gwatemala', 'gua', 1),
(110, 'Gujana', 'guy', 1),
(111, 'Haiti', 'hai', 1),
(112, 'Nikaragua', 'nka', 1),
(113, 'Surinam', 'sur', 1),
(114, 'Trynidad i Tobago', 'tri', 1),
(115, 'Saint Kitts i Nevis', 'skn', 1),
(116, 'Benin', 'ben', 1),
(117, 'Burkina Faso', 'bfa', 1),
(118, 'Gwinea Równikowa', 'eqg', 1),
(119, 'Eswatini', 'swz', 1),
(120, 'Gabon', 'gab', 1),
(121, 'Gambia', 'gam', 1),
(122, 'Gwinea', 'gui', 1),
(123, 'Gwinea Bissau', 'gnb', 1),
(124, 'Kenia', 'ken', 1),
(125, 'Kongo', 'cgo', 1),
(126, 'Lesotho', 'les', 1),
(127, 'Libia', 'lby', 1),
(128, 'Madagaskar', 'mad', 1),
(129, 'Malawi', 'mwi', 1),
(130, 'Mauretania', 'mtn', 1),
(131, 'Mozambik', 'moz', 1),
(132, 'Namibia', 'nam', 1),
(133, 'Niger', 'nig', 1),
(134, 'Rwanda', 'rwa', 1),
(135, 'Sierra Leone', 'sle', 1),
(136, 'Sudan', 'sdn', 1),
(137, 'Tanzania', 'tan', 1),
(138, 'Togo', 'tog', 1),
(139, 'Uganda', 'uga', 1),
(140, 'Zambia', 'zam', 1),
(141, 'Zimbabwe', 'zim', 1),
(142, 'Bahrajn', 'bhr', 1),
(143, 'Kambodża', 'cam', 1),
(144, 'Hongkong', 'hkg', 1),
(145, 'Indie', 'ind', 1),
(146, 'Indonezja', 'ina', 1),
(147, 'Irak', 'irq', 1),
(148, 'Jordania', 'jor', 1),
(149, 'Kirgistan', 'kgz', 1),
(150, 'Kuwejt', 'kuw', 1),
(151, 'Laos', 'lao', 1),
(152, 'Liban', 'lbn', 1),
(153, 'Malezja', 'mas', 1),
(154, 'Mongolia', 'mng', 1),
(155, 'Mjanma', 'mya', 1),
(156, 'Korea Północna', 'prk', 1),
(157, 'Oman', 'oma', 1),
(158, 'Pakistan', 'pak', 1),
(159, 'Palestyna', 'ple', 1),
(160, 'Filipiny', 'phi', 1),
(161, 'Singapur', 'sgp', 1),
(162, 'Syria', 'syr', 1),
(163, 'Tadżykistan', 'tjk', 1),
(164, 'Tajlandia', 'tha', 1),
(165, 'Turkmenistan', 'tkm', 1),
(166, 'Wietnam', 'vie', 1),
(167, 'Jemen', 'yem', 1),
(168, 'Samoa A', 'asa', 1),
(169, 'Wyspy Cooka', 'cok', 1),
(170, 'Fidżi', 'fij', 1),
(171, 'N-Kaledonia', 'ncl', 1),
(172, 'Vanuatu', 'van', 1),
(173, 'Papua-N-Gwinea', 'png', 1),
(174, 'Samoa', 'sam', 1),
(175, 'Wyspy Salomona', 'sol', 1),
(176, 'Tahiti', 'tah', 1),
(177, 'Tonga', 'tga', 1),
(178, 'Saint-Martin', 'smn', 1),
(179, 'Reunion', 'reu', 1),
(180, 'Zanzibar', 'zan', 1),
(181, 'Mariany Północne', 'nmi', 1),
(182, 'Kiribati', 'kir', 1),
(183, 'Palau', 'plv', 1),
(184, 'Tuvalu', 'tuv', 1),
(185, 'Mikronezja', 'fsm', 1),
(186, 'Niue', 'niu', 1),
(187, 'Bonaire', 'boe', 1),
(188, 'Gujana Francuska', 'guf', 1),
(189, 'Gwadelupa', 'glp', 1),
(190, 'Martynika', 'mtq', 1),
(191, 'Sint Maarten', 'sma', 1),
(192, 'Afganistan', 'afg', 1),
(193, 'Bangladesz', 'ban', 1),
(194, 'Bhutan', 'bhu', 1),
(195, 'Brunei', 'bru', 1),
(196, 'Chińskie Tajpej', 'tpe', 1),
(197, 'Timor Wschodni', 'tls', 1),
(198, 'Guam', 'gum', 1),
(199, 'Makau', 'mac', 1),
(200, 'Malediwy', 'mdv', 1),
(201, 'Nepal', 'nep', 1),
(202, 'Sri Lanka', 'sri', 1),
(203, 'Botswana', 'bot', 1),
(204, 'Burundi', 'bdi', 1),
(205, 'RZP', 'cpv', 1),
(206, 'RSA', 'cta', 1),
(207, 'Czad', 'cha', 1),
(208, 'Komory', 'com', 1),
(209, 'Dżibuti', 'dji', 1),
(210, 'Erytrea', 'eri', 1),
(211, 'Etiopia', 'eth', 1),
(212, 'Liberia', 'lbr', 1),
(213, 'Mauritius', 'mri', 1),
(214, 'Wyspy ST i K', 'stp', 1),
(215, 'Seszele', 'sey', 1),
(216, 'Somalia', 'som', 1),
(217, 'Sudan Południowy', 'ssd', 1),
(218, 'Anguilla', 'aia', 1),
(219, 'Aruba', 'aru', 1),
(220, 'Bahamy', 'bah', 1),
(221, 'Barbados', 'brb', 1),
(222, 'Belize', 'blz', 1),
(223, 'Bermudy', 'ber', 1),
(224, 'Kajmany', 'cay', 1),
(225, 'Dominika', 'dma', 1),
(226, 'Grenada', 'grn', 1),
(227, 'Turks i Caicos', 'tca', 1),
(228, 'Montserrat', 'msr', 1),
(229, 'Portoryko', 'pur', 1),
(230, 'Saint Lucia', 'lca', 1),
(231, 'Saint Vincent i G', 'vin', 1),
(232, 'Brytyjskie WD', 'vgb', 1),
(233, 'WD USA', 'vir', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `page_names`
--

CREATE TABLE `page_names` (
  `id` int(10) UNSIGNED NOT NULL,
  `page_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `rounds`
--

CREATE TABLE `rounds` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(35) NOT NULL,
  `teams` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Daten für Tabelle `rounds`
--

INSERT INTO `rounds` (`id`, `name`, `teams`) VALUES
(2, 'round of 16', 16),
(3, 'quarter-finals', 8),
(4, 'semi-finals', 4),
(5, '3rd place match', 2),
(6, 'final', 2),
(1, 'groups round', 32);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `shared_games`
--

CREATE TABLE `shared_games` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `long_id` varchar(255) NOT NULL,
  `views` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `creation_date` datetime NOT NULL,
  `year` int(10) UNSIGNED DEFAULT NULL,
  `type_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `shared_matches`
--

CREATE TABLE `shared_matches` (
  `id` int(10) UNSIGNED NOT NULL,
  `team1_id` varchar(3) NOT NULL,
  `team2_id` varchar(3) NOT NULL,
  `score_1` int(10) UNSIGNED NOT NULL,
  `score_2` int(10) UNSIGNED NOT NULL,
  `penalty_1` int(10) UNSIGNED DEFAULT NULL,
  `penalty_2` int(10) UNSIGNED DEFAULT NULL,
  `round_id` int(10) UNSIGNED NOT NULL,
  `group_ch` varchar(1) DEFAULT NULL,
  `order_nr` int(10) UNSIGNED DEFAULT NULL,
  `game_id` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `shared_teams`
--

CREATE TABLE `shared_teams` (
  `id` int(10) UNSIGNED NOT NULL,
  `team_id` varchar(3) NOT NULL,
  `group_place` int(10) UNSIGNED DEFAULT NULL,
  `points` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `goals` int(10) NOT NULL DEFAULT 0,
  `goals_scored` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `goals_lost` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `wins` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `draws` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `loses` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `game_id` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `teams`
--

CREATE TABLE `teams` (
  `name` varchar(3) NOT NULL,
  `link` varchar(50) NOT NULL,
  `con_id` int(10) UNSIGNED DEFAULT NULL,
  `fifa_member` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `teams`
--

INSERT INTO `teams` (`name`, `link`, `con_id`, `fifa_member`) VALUES
('afg', 'afghanistan.png', 3, 1),
('aia', 'anguilla.png', 5, 1),
('alb', 'albania.png', 1, 1),
('alg', 'algeria.png', 4, 1),
('and', 'andorra.png', 1, 1),
('ang', 'angola.png', 4, 1),
('arg', 'argentina.png', 2, 1),
('arm', 'armenia.png', 1, 1),
('aru', 'aruba.png', 5, 1),
('asa', 'american_samoa.png', 6, 1),
('atg', 'antigua_and_barbuda.png', 5, 1),
('aus', 'australia.png', 3, 1),
('aut', 'austria.png', 1, 1),
('aze', 'azerbaijan.png', 1, 1),
('bah', 'bahamas.png', 5, 1),
('ban', 'bangladesh.png', 3, 1),
('bdi', 'burundi.png', 4, 1),
('bel', 'belgium.png', 1, 1),
('ben', 'benin.png', 4, 1),
('ber', 'bermuda.png', 5, 1),
('bfa', 'burkina_faso.png', 4, 1),
('bhr', 'bahrain.png', 3, 1),
('bhu', 'bhutan.png', 3, 1),
('bih', 'bosnia_and_h.png', 1, 1),
('blr', 'belarus.png', 1, 1),
('blz', 'belize.png', 5, 1),
('boe', 'bonaire.png', 5, 1),
('bol', 'bolivia.png', 2, 1),
('bot', 'botswana.png', 4, 1),
('bra', 'brasil.png', 2, 1),
('brb', 'barbados.png', 5, 1),
('bru', 'brunei.png', 3, 1),
('bul', 'bulgaria.png', 1, 1),
('cam', 'cambodia.png', 3, 1),
('can', 'canada.png', 5, 1),
('cay', 'cayman_islands.png', 5, 1),
('cgo', 'kongo.png', 4, 1),
('cha', 'chad.png', 4, 1),
('chi', 'chile.png', 2, 1),
('chn', 'china.png', 3, 1),
('cmr', 'cameroon.png', 4, 1),
('cod', 'dkr.png', 4, 1),
('cok', 'cook_islands.png', 6, 1),
('col', 'colombia.png', 2, 1),
('com', 'comoros.png', 4, 1),
('cpv', 'cape_verde.png', 4, 1),
('cri', 'costa_rica.png', 5, 1),
('cro', 'croatia.png', 1, 1),
('cta', 'central_african_republic.png', 4, 1),
('cub', 'cuba.png', 5, 1),
('cuw', 'curacao.png', 5, 1),
('cyp', 'cyprus.png', 1, 1),
('cze', 'czech_republic.png', 1, 1),
('den', 'denmark.png', 1, 1),
('dji', 'djibouti.png', 4, 1),
('dma', 'dominica.png', 5, 1),
('dom', 'dominican_republic.png', 5, 1),
('ecu', 'ecuador.png', 2, 1),
('egy', 'egypt.png', 4, 1),
('eng', 'england.png', 1, 1),
('eqg', 'equatorial_guinea.png', 4, 1),
('eri', 'eritrea.png', 4, 1),
('est', 'estonia.png', 1, 1),
('eth', 'ethiopia.png', 4, 1),
('fij', 'fiji.png', 6, 1),
('fin', 'finland.png', 1, 1),
('fra', 'france.png', 1, 1),
('fro', 'faroe_island.png', 1, 1),
('fsm', 'micronesia.png', 6, 0),
('gab', 'gabon.png', 4, 1),
('gam', 'gambia.png', 4, 1),
('geo', 'georgia.png', 1, 1),
('ger', 'germany.png', 1, 1),
('gha', 'ghana.png', 4, 1),
('gib', 'gibraltar.png', 1, 1),
('glp', 'guadeloupe.png', 5, 1),
('gnb', 'guinea_bissau.png', 4, 1),
('gre', 'greece.png', 1, 1),
('grn', 'grenada.png', 5, 1),
('gua', 'guatemala.png', 5, 1),
('guf', 'french_guiana.png', 5, 1),
('gui', 'guinea.png', 4, 1),
('gum', 'guam.png', 3, 1),
('guy', 'guyana.png', 5, 1),
('hai', 'haiti.png', 5, 1),
('hkg', 'hong_kong.png', 3, 1),
('hon', 'honduras.png', 5, 1),
('hun', 'hungary.png', 1, 1),
('ice', 'iceland.png', 1, 1),
('ina', 'indonesia.png', 3, 1),
('ind', 'india.png', 3, 1),
('irl', 'ireland.png', 1, 1),
('irn', 'iran.png', 3, 1),
('irq', 'iraq.png', 3, 1),
('isr', 'israel.png', 1, 1),
('ita', 'italy.png', 1, 1),
('ivc', 'ivory_coast.png', 4, 1),
('jam', 'jamaica.png', 5, 1),
('jap', 'japan.png', 3, 1),
('jor', 'jordan.png', 3, 1),
('kaz', 'kazakhstan.png', 1, 1),
('ken', 'kenya.png', 4, 1),
('kgz', 'kyrgyz_republic.png', 3, 1),
('kir', 'kiribati.png', 6, 0),
('kor', 'south_korea.png', 3, 1),
('kos', 'kosovo.png', 1, 1),
('kuw', 'kuwait.png', 3, 1),
('lao', 'laos.png', 3, 1),
('lbn', 'lebanon.png', 3, 1),
('lbr', 'liberia.png', 4, 1),
('lby', 'libya.png', 4, 1),
('lca', 'saint_lucia.png', 5, 1),
('les', 'lesotho.png', 4, 1),
('lie', 'liechtenstein.png', 1, 1),
('ltu', 'lithuania.png', 1, 1),
('lux', 'luxembourg.png', 1, 1),
('lva', 'latvia.png', 1, 1),
('mac', 'macau.png', 3, 1),
('mad', 'madagaskar.png', 4, 1),
('mas', 'malaysia.png', 3, 1),
('mda', 'moldova.png', 1, 1),
('mdv', 'maldives.png', 3, 1),
('mex', 'mexico.png', 5, 1),
('mkd', 'macedonia.png', 1, 1),
('mli', 'mali.png', 4, 1),
('mlt', 'malta.png', 1, 1),
('mne', 'montenegro.png', 1, 1),
('mng', 'mongolia.png', 3, 1),
('mor', 'morocco.png', 4, 1),
('moz', 'mozambique.png', 4, 1),
('mri', 'mauritius.png', 4, 1),
('msr', 'montserrat.png', 5, 1),
('mtn', 'mauritania.png', 4, 1),
('mtq', 'martinique.png', 5, 1),
('mwi', 'malawi.png', 4, 1),
('mya', 'myanmar.png', 3, 1),
('nam', 'namibia.png', 4, 1),
('ncl', 'new_caledonia.png', 6, 1),
('nep', 'nepal.png', 3, 1),
('nga', 'nigeria.png', 4, 1),
('nig', 'niger.png', 4, 1),
('nir', 'northern_ireland.png', 1, 1),
('niu', 'niue.png', 6, 0),
('nka', 'nicaragua.png', 5, 1),
('nld', 'netherlands.png', 1, 1),
('nmi', 'nothern_mariana_islands.png', 3, 0),
('nor', 'norway.png', 1, 1),
('nze', 'new_zealand.png', 6, 1),
('oma', 'oman.png', 3, 1),
('pak', 'pakistan.png', 3, 1),
('pan', 'panama.png', 5, 1),
('par', 'paraguay.png', 2, 1),
('per', 'peru.png', 2, 1),
('phi', 'philippines.png', 3, 1),
('ple', 'palestine.png', 3, 1),
('plv', 'palau.png', 6, 0),
('png', 'papua_new_guinea.png', 6, 1),
('pol', 'poland.png', 1, 1),
('por', 'portugal.png', 1, 1),
('prk', 'north_korea.png', 3, 1),
('pur', 'puerto_rico.png', 5, 1),
('qat', 'quatar.png', 3, 1),
('reu', 'france.png', 4, 0),
('rom', 'romania.png', 1, 1),
('rpa', 'south_africa.png', 4, 1),
('rus', 'russia.png', 1, 1),
('rwa', 'rwanda.png', 4, 1),
('sam', 'samoa.png', 6, 1),
('sau', 'saudi_arabia.png', 3, 1),
('sco', 'scotland.png', 1, 1),
('sdn', 'sudan.png', 4, 1),
('sen', 'senegal.png', 4, 1),
('sey', 'seychelles.png', 4, 1),
('sgp', 'singapore.png', 3, 1),
('skn', 'saint_kitts_and_nevis.png', 5, 1),
('sle', 'sierra_leone.png', 4, 1),
('slv', 'el_salvador.png', 5, 1),
('sma', 'sint_maarten.png', 5, 1),
('smn', 'france.png', 5, 0),
('smr', 'san_marino.png', 1, 1),
('sol', 'solomon_islands.png', 6, 1),
('som', 'somalia.png', 4, 1),
('spa', 'spain.png', 1, 1),
('srb', 'serbia.png', 1, 1),
('sri', 'sri_lanka.png', 3, 1),
('ssd', 'south_sudan.png', 4, 1),
('stp', 'sao_tome_and_principe.png', 4, 1),
('sur', 'suriname.png', 5, 1),
('svk', 'slovakia.png', 1, 1),
('svn', 'slovenia.png', 1, 1),
('swe', 'sweden.png', 1, 1),
('swi', 'switzerland.png', 1, 1),
('swz', 'eswatini.png', 4, 1),
('syr', 'syria.png', 3, 1),
('tah', 'tahiti.png', 6, 1),
('tan', 'tanzania.png', 4, 1),
('tca', 'turks_and_caicos.png', 5, 1),
('tga', 'tonga.png', 6, 1),
('tha', 'thailand.png', 3, 1),
('tjk', 'tajikistan.png', 3, 1),
('tkm', 'turkmenistan.png', 3, 1),
('tls', 'east_timor.png', 3, 1),
('tog', 'togo.png', 4, 1),
('tpe', 'chinese_taipei.png', 3, 1),
('tri', 'trinidad_and_tobago.png', 5, 1),
('tun', 'tunisia.png', 4, 1),
('tur', 'turkey.png', 1, 1),
('tuv', 'tuvalu.png', 6, 0),
('uga', 'uganda.png', 4, 1),
('ukr', 'ukraine.png', 1, 1),
('uru', 'uruguay.png', 2, 1),
('usa', 'usa.png', 5, 1),
('uzb', 'uzbekistan.png', 3, 1),
('van', 'vanuatu.png', 6, 1),
('ven', 'venezuela.png', 2, 1),
('vgb', 'the_british_virgin_islands.png', 5, 1),
('vie', 'vietnam.png', 3, 1),
('vin', 'saint_vincent_and_the_grenadines.png', 5, 1),
('vir', 'the_us_virgin_islands.png', 5, 1),
('wal', 'wales.png', 1, 1),
('yem', 'yemen.png', 3, 1),
('zae', 'zae.png', 3, 1),
('zam', 'zambia.png', 4, 1),
('zan', 'zanzibar.png', 4, 0),
('zim', 'zimbabwe.png', 4, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `login` varchar(50) NOT NULL,
  `password` varchar(256) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `clubs`
--
ALTER TABLE `clubs`
  ADD PRIMARY KEY (`str_id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `national_team_id` (`national_team_id`);

--
-- Indizes für die Tabelle `confederations`
--
ALTER TABLE `confederations`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `groups_teams`
--
ALTER TABLE `groups_teams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `team_name` (`team_name`),
  ADD KEY `year` (`league_id`);

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
-- Indizes für die Tabelle `leagues`
--
ALTER TABLE `leagues`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tournament_type` (`type_id`);

--
-- Indizes für die Tabelle `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `game_id` (`game_id`);

--
-- Indizes für die Tabelle `names_clubs`
--
ALTER TABLE `names_clubs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `club_id` (`club_id`),
  ADD KEY `lang_id` (`lang_id`);

--
-- Indizes für die Tabelle `names_teams`
--
ALTER TABLE `names_teams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `names_teams_ibfk_1` (`team_id`),
  ADD KEY `names_teams_ibfk_2` (`lang_id`);

--
-- Indizes für die Tabelle `page_names`
--
ALTER TABLE `page_names`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `rounds`
--
ALTER TABLE `rounds`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `shared_games`
--
ALTER TABLE `shared_games`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indizes für die Tabelle `shared_matches`
--
ALTER TABLE `shared_matches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `game_id` (`game_id`),
  ADD KEY `team1_id` (`team1_id`),
  ADD KEY `team2_id` (`team2_id`),
  ADD KEY `round_id` (`round_id`);

--
-- Indizes für die Tabelle `shared_teams`
--
ALTER TABLE `shared_teams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `team_id` (`team_id`),
  ADD KEY `game_id` (`game_id`);

--
-- Indizes für die Tabelle `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`name`),
  ADD KEY `con_id` (`con_id`);

--
-- Indizes für die Tabelle `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `confederations`
--
ALTER TABLE `confederations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `groups_teams`
--
ALTER TABLE `groups_teams`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=178;

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
-- AUTO_INCREMENT für Tabelle `leagues`
--
ALTER TABLE `leagues`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `names_clubs`
--
ALTER TABLE `names_clubs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT für Tabelle `names_teams`
--
ALTER TABLE `names_teams`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=234;

--
-- AUTO_INCREMENT für Tabelle `page_names`
--
ALTER TABLE `page_names`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `rounds`
--
ALTER TABLE `rounds`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT für Tabelle `shared_games`
--
ALTER TABLE `shared_games`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `shared_matches`
--
ALTER TABLE `shared_matches`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `shared_teams`
--
ALTER TABLE `shared_teams`
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
-- Constraints der Tabelle `clubs`
--
ALTER TABLE `clubs`
  ADD CONSTRAINT `clubs_ibfk_1` FOREIGN KEY (`national_team_id`) REFERENCES `teams` (`name`);

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
-- Constraints der Tabelle `names_clubs`
--
ALTER TABLE `names_clubs`
  ADD CONSTRAINT `names_clubs_ibfk_1` FOREIGN KEY (`club_id`) REFERENCES `clubs` (`str_id`),
  ADD CONSTRAINT `names_clubs_ibfk_2` FOREIGN KEY (`lang_id`) REFERENCES `lang` (`id`);

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

--
-- Constraints der Tabelle `teams`
--
ALTER TABLE `teams`
  ADD CONSTRAINT `teams_ibfk_1` FOREIGN KEY (`con_id`) REFERENCES `confederations` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
