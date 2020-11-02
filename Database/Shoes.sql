-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Gép: localhost
-- Létrehozás ideje: 2020. Sze 11. 17:57
-- Kiszolgáló verziója: 10.4.14-MariaDB
-- PHP verzió: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `Shoes`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `Colours`
--

CREATE TABLE `Colours` (
  `ID` int(8) NOT NULL,
  `Colour` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `Colours`
--

INSERT INTO `Colours` (`ID`, `Colour`) VALUES
(1, 'fehér'),
(2, 'fekete'),
(3, 'kék'),
(4, 'drapp'),
(5, 'piros'),
(6, 'zöld'),
(7, 'sárga'),
(8, 'szürke');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `Sizes`
--

CREATE TABLE `Sizes` (
  `ID` int(8) NOT NULL,
  `Size` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `Sizes`
--

INSERT INTO `Sizes` (`ID`, `Size`) VALUES
(1, 35),
(2, 36),
(3, 37),
(4, 38),
(5, 39),
(6, 40),
(7, 41),
(8, 42),
(9, 43),
(10, 44),
(11, 45);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `Stock`
--

CREATE TABLE `Stock` (
  `ID` int(11) NOT NULL,
  `SupplyID` int(8) NOT NULL,
  `ColourID` int(8) NOT NULL,
  `SizeID` int(8) NOT NULL,
  `Pairs` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `Stock`
--

INSERT INTO `Stock` (`ID`, `SupplyID`, `ColourID`, `SizeID`, `Pairs`) VALUES
(1, 1, 3, 4, 12),
(2, 2, 3, 9, 23),
(3, 3, 5, 7, 40),
(4, 4, 7, 10, 34),
(5, 5, 7, 7, 78),
(6, 6, 8, 7, 55),
(7, 7, 6, 8, 102),
(8, 8, 6, 10, 99),
(9, 1, 3, 1, 12),
(10, 2, 3, 10, 23),
(11, 3, 5, 1, 40),
(12, 4, 7, 2, 34),
(13, 5, 7, 9, 78),
(14, 6, 8, 4, 55),
(15, 7, 6, 5, 102),
(16, 8, 6, 11, 99),
(17, 1, 3, 9, 12),
(18, 2, 3, 8, 23),
(19, 3, 5, 6, 40),
(20, 4, 7, 1, 34),
(21, 5, 7, 7, 78),
(22, 6, 8, 3, 55),
(23, 7, 6, 4, 102),
(24, 8, 6, 8, 99),
(25, 5, 1, 8, 99);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `Supply`
--

CREATE TABLE `Supply` (
  `ID` int(8) NOT NULL,
  `Name` varchar(150) NOT NULL,
  `PriceRecent` int(11) NOT NULL,
  `PriceOld` int(11) DEFAULT NULL,
  `DateOfArrival` date NOT NULL,
  `Brand` varchar(30) NOT NULL,
  `PictureURL` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `Supply`
--

INSERT INTO `Supply` (`ID`, `Name`, `PriceRecent`, `PriceOld`, `DateOfArrival`, `Brand`, `PictureURL`) VALUES
(1, 'NIKE Air Zoom Pegasus 36', 29990, 31990, '2020-09-09', 'Nike', 'ShoesPics/kek3.jpeg'),
(2, 'New Balance CM997', 27990, 30990, '2020-09-08', 'Nike', 'ShoesPics/kek4.jpeg'),
(3, 'adidas PulseBOOST HD M H2O All Season', 42990, 45990, '2020-09-08', 'Adidas', 'ShoesPics/piros.jpeg'),
(4, 'Solar Blaze M', 14990, NULL, '2020-09-10', 'Kappa', 'ShoesPics/sarga3.jpeg'),
(5, 'Gel-Zone 6', 19990, 24990, '2020-09-11', 'Hummel', 'ShoesPics/sarga2.jpg'),
(6, 'Zoom Pegasus 36 Trail GTX', 39990, NULL, '2020-09-09', 'Reebok', 'ShoesPics/szurke.jpeg'),
(7, 'ASICS · Gel-Cumulus 21 Knit', 16990, 21990, '2020-09-13', 'Asics', 'ShoesPics/zold.jpeg'),
(8, 'Cosmic 2 M 4 RTD 67 XH2O WTF ALL SEASON', 22990, 26990, '2020-09-09', 'Adidas', 'ShoesPics/zold2.jpeg');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `Colours`
--
ALTER TABLE `Colours`
  ADD PRIMARY KEY (`ID`);

--
-- A tábla indexei `Sizes`
--
ALTER TABLE `Sizes`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID` (`ID`),
  ADD KEY `ID_2` (`ID`),
  ADD KEY `ID_3` (`ID`),
  ADD KEY `ID_4` (`ID`);

--
-- A tábla indexei `Stock`
--
ALTER TABLE `Stock`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `SizeID` (`SizeID`),
  ADD KEY `SupplyID` (`SupplyID`),
  ADD KEY `ColourID` (`ColourID`);

--
-- A tábla indexei `Supply`
--
ALTER TABLE `Supply`
  ADD PRIMARY KEY (`ID`);

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `Stock`
--
ALTER TABLE `Stock`
  ADD CONSTRAINT `Stock_ibfk_2` FOREIGN KEY (`ColourID`) REFERENCES `Colours` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Stock_ibfk_4` FOREIGN KEY (`SizeID`) REFERENCES `Sizes` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Stock_ibfk_5` FOREIGN KEY (`SupplyID`) REFERENCES `Supply` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
