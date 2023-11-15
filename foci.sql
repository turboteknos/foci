-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2023. Nov 09. 09:57
-- Kiszolgáló verziója: 10.4.27-MariaDB
-- PHP verzió: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `foci`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `eredmenyek`
--

CREATE TABLE `eredmenyek` (
  `fordulo` int(2) DEFAULT NULL,
  `hazaVegeredmeny` int(1) DEFAULT NULL,
  `vendegVegeredmeny` int(1) DEFAULT NULL,
  `hazaFelido` int(1) DEFAULT NULL,
  `vendegFelido` int(1) DEFAULT NULL,
  `hazai` varchar(15) CHARACTER SET utf8 COLLATE utf8_hungarian_ci DEFAULT NULL,
  `vendeg` varchar(15) CHARACTER SET utf8 COLLATE utf8_hungarian_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `eredmenyek`
--

INSERT INTO `eredmenyek` (`fordulo`, `hazaVegeredmeny`, `vendegVegeredmeny`, `hazaFelido`, `vendegFelido`, `hazai`, `vendeg`) VALUES
(14, 1, 2, 0, 2, 'Agarak', 'Ovatosak'),
(5, 4, 0, 1, 0, 'Erosek', 'Agarak'),
(4, 0, 2, 0, 2, 'Ijedtek', 'Hevesek'),
(8, 1, 1, 0, 0, 'Ijedtek', 'Nyulak'),
(8, 3, 2, 3, 1, 'Lelkesek', 'Bogarak'),
(13, 0, 1, 0, 1, 'Fineszesek', 'Csikosak'),
(2, 1, 0, 0, 0, 'Pechesek', 'Csikosak'),
(1, 4, 0, 2, 0, 'Csikosak', 'Kedvesek'),
(9, 2, 0, 0, 0, 'Nyulak', 'Lelkesek'),
(6, 0, 2, 0, 0, 'Ovatosak', 'Nyulak'),
(8, 1, 2, 1, 0, 'Gyoztesek', 'Jelmezesek'),
(8, 1, 2, 1, 2, 'Ovatosak', 'Pechesek'),
(4, 1, 2, 0, 2, 'Kedvesek', 'Nyulak'),
(5, 0, 1, 0, 1, 'Nyulak', 'Pechesek'),
(12, 0, 2, 0, 0, 'Erosek', 'Nyulak'),
(4, 3, 1, 1, 1, 'Agarak', 'Jelmezesek'),
(7, 1, 3, 0, 0, 'Kedvesek', 'Ovatosak'),
(11, 1, 0, 0, 0, 'Pechesek', 'Lelkesek'),
(10, 2, 4, 0, 2, 'Gyoztesek', 'Csikosak'),
(11, 0, 1, 0, 1, 'Csikosak', 'Hevesek'),
(13, 1, 1, 1, 1, 'Pechesek', 'Agarak'),
(8, 1, 2, 1, 1, 'Darabosak', 'Fineszesek'),
(3, 3, 0, 3, 0, 'Erosek', 'Lelkesek'),
(3, 1, 1, 1, 0, 'Jelmezesek', 'Nyulak'),
(5, 3, 4, 0, 3, 'Kedvesek', 'Jelmezesek'),
(9, 1, 0, 0, 0, 'Fineszesek', 'Agarak'),
(8, 2, 3, 0, 2, 'Agarak', 'Csikosak'),
(10, 1, 0, 0, 0, 'Darabosak', 'Nyulak'),
(14, 1, 2, 0, 0, 'Darabosak', 'Mereszek'),
(6, 1, 0, 0, 0, 'Darabosak', 'Hevesek'),
(13, 2, 1, 1, 0, 'Mereszek', 'Lelkesek'),
(6, 0, 0, 0, 0, 'Mereszek', 'Bogarak'),
(11, 0, 1, 0, 0, 'Jelmezesek', 'Mereszek'),
(11, 0, 0, 0, 0, 'Bogarak', 'Erosek'),
(2, 2, 0, 1, 0, 'Nyulak', 'Bogarak'),
(14, 3, 1, 3, 0, 'Erosek', 'Pechesek'),
(12, 0, 1, 0, 0, 'Agarak', 'Kedvesek'),
(2, 0, 2, 0, 2, 'Kedvesek', 'Fineszesek'),
(6, 2, 1, 2, 1, 'Erosek', 'Jelmezesek'),
(7, 2, 0, 0, 0, 'Csikosak', 'Darabosak'),
(13, 0, 0, 0, 0, 'Jelmezesek', 'Ijedtek'),
(10, 0, 0, 0, 0, 'Agarak', 'Bogarak'),
(1, 2, 0, 2, 0, 'Gyoztesek', 'Ovatosak'),
(6, 2, 1, 1, 1, 'Ijedtek', 'Fineszesek'),
(13, 1, 3, 0, 1, 'Kedvesek', 'Erosek'),
(7, 2, 1, 0, 1, 'Bogarak', 'Ijedtek'),
(5, 1, 3, 1, 2, 'Fineszesek', 'Mereszek'),
(2, 3, 3, 3, 3, 'Mereszek', 'Gyoztesek'),
(5, 1, 0, 0, 0, 'Csikosak', 'Ijedtek'),
(1, 2, 3, 1, 3, 'Hevesek', 'Pechesek'),
(11, 1, 3, 1, 0, 'Ovatosak', 'Ijedtek'),
(7, 1, 0, 0, 0, 'Hevesek', 'Agarak'),
(9, 1, 0, 0, 0, 'Csikosak', 'Erosek'),
(8, 2, 2, 1, 2, 'Mereszek', 'Kedvesek'),
(9, 4, 3, 0, 0, 'Kedvesek', 'Ijedtek'),
(12, 2, 2, 1, 1, 'Csikosak', 'Jelmezesek'),
(3, 2, 2, 0, 1, 'Bogarak', 'Kedvesek'),
(3, 4, 1, 3, 0, 'Csikosak', 'Ovatosak'),
(10, 1, 0, 0, 0, 'Lelkesek', 'Kedvesek'),
(3, 3, 0, 0, 0, 'Gyoztesek', 'Ijedtek'),
(6, 1, 5, 1, 3, 'Lelkesek', 'Csikosak'),
(9, 2, 0, 1, 0, 'Jelmezesek', 'Ovatosak'),
(7, 1, 2, 1, 1, 'Jelmezesek', 'Pechesek'),
(14, 2, 3, 1, 0, 'Gyoztesek', 'Kedvesek'),
(10, 1, 0, 0, 0, 'Hevesek', 'Jelmezesek'),
(14, 1, 0, 1, 0, 'Csikosak', 'Bogarak'),
(5, 4, 2, 3, 0, 'Gyoztesek', 'Darabosak'),
(14, 3, 2, 2, 2, 'Hevesek', 'Nyulak'),
(13, 2, 0, 1, 0, 'Bogarak', 'Hevesek'),
(9, 4, 1, 1, 0, 'Pechesek', 'Mereszek'),
(1, 0, 1, 0, 1, 'Darabosak', 'Lelkesek'),
(3, 0, 1, 0, 0, 'Agarak', 'Darabosak'),
(7, 1, 2, 1, 0, 'Fineszesek', 'Lelkesek'),
(2, 2, 2, 0, 2, 'Lelkesek', 'Agarak'),
(4, 1, 0, 1, 0, 'Ovatosak', 'Fineszesek'),
(4, 0, 1, 0, 1, 'Mereszek', 'Csikosak'),
(1, 1, 0, 1, 0, 'Fineszesek', 'Nyulak'),
(12, 3, 1, 0, 0, 'Darabosak', 'Pechesek'),
(12, 0, 0, 0, 0, 'Lelkesek', 'Ovatosak'),
(10, 1, 1, 1, 1, 'Erosek', 'Fineszesek'),
(2, 0, 0, 0, 0, 'Ijedtek', 'Erosek'),
(9, 2, 0, 1, 0, 'Hevesek', 'Gyoztesek'),
(14, 2, 1, 1, 1, 'Fineszesek', 'Jelmezesek'),
(12, 0, 1, 0, 1, 'Ijedtek', 'Mereszek'),
(7, 1, 0, 0, 0, 'Nyulak', 'Mereszek'),
(13, 1, 0, 0, 0, 'Ovatosak', 'Darabosak'),
(2, 2, 2, 2, 2, 'Jelmezesek', 'Darabosak'),
(6, 2, 2, 0, 2, 'Agarak', 'Gyoztesek'),
(6, 3, 0, 1, 0, 'Pechesek', 'Kedvesek'),
(14, 0, 1, 0, 0, 'Lelkesek', 'Ijedtek'),
(11, 1, 0, 0, 0, 'Nyulak', 'Agarak'),
(11, 3, 1, 2, 0, 'Fineszesek', 'Gyoztesek'),
(1, 0, 2, 0, 1, 'Agarak', 'Ijedtek'),
(1, 2, 0, 0, 0, 'Bogarak', 'Jelmezesek'),
(9, 3, 1, 3, 1, 'Bogarak', 'Darabosak'),
(7, 2, 1, 1, 1, 'Gyoztesek', 'Erosek'),
(10, 0, 0, 0, 0, 'Mereszek', 'Ovatosak'),
(12, 2, 1, 2, 1, 'Gyoztesek', 'Bogarak'),
(4, 1, 2, 1, 2, 'Darabosak', 'Erosek'),
(4, 2, 0, 0, 0, 'Lelkesek', 'Gyoztesek'),
(3, 1, 4, 1, 4, 'Fineszesek', 'Pechesek'),
(5, 2, 0, 2, 0, 'Bogarak', 'Ovatosak'),
(13, 2, 0, 2, 0, 'Nyulak', 'Gyoztesek'),
(5, 2, 0, 1, 0, 'Hevesek', 'Lelkesek'),
(3, 2, 2, 1, 2, 'Hevesek', 'Mereszek'),
(2, 2, 1, 1, 0, 'Ovatosak', 'Hevesek'),
(11, 1, 1, 0, 1, 'Kedvesek', 'Darabosak'),
(1, 2, 1, 0, 0, 'Erosek', 'Mereszek'),
(10, 2, 0, 0, 0, 'Ijedtek', 'Pechesek'),
(4, 2, 2, 0, 2, 'Pechesek', 'Bogarak'),
(8, 3, 1, 3, 1, 'Erosek', 'Hevesek'),
(12, 2, 0, 0, 0, 'Hevesek', 'Fineszesek');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;