
-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Vært: 127.0.0.1
-- Genereringstid: 27. 11 2023 kl. 10:22:12
-- Serverversion: 10.4.28-MariaDB
-- PHP-version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `torinopizza`
--

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `bestilling`
--

CREATE TABLE `bestilling` (
  `BestillingsNr` int(5) NOT NULL,
  `KundeNr` int(4) NOT NULL,
  `PizzaNr` int(3) NOT NULL,
  `Kommentarer` varchar(100) NOT NULL,
  `BordNr` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Data dump for tabellen `bestilling`
--

INSERT INTO `bestilling` (`BestillingsNr`, `KundeNr`, `PizzaNr`, `Kommentarer`, `BordNr`) VALUES
(1, 5, 1, '+ost', NULL),
(2, 2, 7, '', NULL),
(3, 3, 3, '', 5),
(4, 1, 2, '', NULL),
(5, 5, 5, '-ost', NULL),
(6, 4, 6, '', NULL),
(7, 4, 8, '', NULL),
(8, 5, 13, 'Kun ost på venstre halvdel', 2),
(9, 2, 13, 'Mindre bagsnak', NULL);

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `kundeinfo`
--

CREATE TABLE `kundeinfo` (
  `KundeNr` int(4) NOT NULL,
  `KundeNavn` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `TelefonNr` int(8) NOT NULL,
  `Leveringsaddresse` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Data dump for tabellen `kundeinfo`
--

INSERT INTO `kundeinfo` (`KundeNr`, `KundeNavn`, `Email`, `TelefonNr`, `Leveringsaddresse`) VALUES
(1, 'Hans Iversen', 'hi@hi.hi', 12344321, 'Ivervej 1, 7400'),
(2, 'Bobfrederik Frederiksen', 'place@holder.com', 43211234, 'Margrethevej 14, 7650'),
(3, 'Syntaksfejl Nordmand', 'sy@fa.no', 91919191, 'Butiksvej 3, 7430'),
(4, 'Lorem Ipsum', 'dolor@fakenews.com', 80081335, 'Silikonevej 3, 6971'),
(5, 'Karl Emil', 'KajJohan@flop.mail', 10000001, 'Larstyndskidsmark 8, 7323');

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `pizzaer`
--

CREATE TABLE `pizzaer` (
  `PizzaNr` int(3) NOT NULL,
  `Navn` varchar(50) NOT NULL,
  `Toppings` varchar(150) NOT NULL,
  `pris` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Data dump for tabellen `pizzaer`
--

INSERT INTO `pizzaer` (`PizzaNr`, `Navn`, `Toppings`, `pris`) VALUES
(1, 'Margherita', 'Tomato sauce, mozzarella, basil', 69.99),
(2, 'Pepperoni', 'Tomato sauce, mozzarella, pepperoni', 79.99),
(3, 'Vegetarian', 'Tomato sauce, mozzarella, bell peppers, mushrooms, onions', 74.99),
(4, 'Hawaiian', 'Tomato sauce, mozzarella, ham, pineapple', 88.99),
(5, 'BBQ Chicken', 'BBQ sauce, mozzarella, chicken, red onions', 94.99),
(6, 'Meat Lovers', 'Tomato sauce, mozzarella, pepperoni, sausage, bacon', 101.99),
(7, 'Capricciosa', 'Tomato sauce, mozzarella, ham, mushrooms, artichokes', 82.99),
(8, 'Four Cheese', 'Tomato sauce, mozzarella, parmesan, ricotta, gorgonzola', 107.99),
(9, 'Mushroom Lovers', 'Tomato sauce, mozzarella, mushrooms, truffle oil', 89.99),
(10, 'Supreme', 'Tomato sauce, mozzarella, pepperoni, sausage, bell peppers, onions, olives', 114.99),
(11, 'Spinach and Feta', 'Tomato sauce, mozzarella, spinach, feta cheese', 94.99),
(12, 'Buffalo Chicken', 'Buffalo sauce, mozzarella, chicken, red onions, blue cheese', 107.99),
(13, 'White Pizza', 'Olive oil, mozzarella, ricotta, garlic, spinach', 101.95),
(14, 'Seafood Delight', 'Alfredo sauce, mozzarella, shrimp, crab, garlic', 120.95),
(15, 'Pesto Chicken', 'Pesto sauce, mozzarella, chicken, cherry tomatoes', 101.11);

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `regning`
--

CREATE TABLE `regning` (
  `RegningNr` int(4) NOT NULL,
  `KundeNr` int(4) NOT NULL,
  `SamletPris` double DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Data dump for tabellen `regning`
--

INSERT INTO `regning` (`RegningNr`, `KundeNr`, `SamletPris`) VALUES
(1, 5, 164.98);

--
-- Begrænsninger for dumpede tabeller
--

--
-- Indeks for tabel `bestilling`
--
ALTER TABLE `bestilling`
  ADD PRIMARY KEY (`BestillingsNr`),
  ADD KEY `fk_KundeNr` (`KundeNr`),
  ADD KEY `PizzaNr` (`PizzaNr`);

--
-- Indeks for tabel `kundeinfo`
--
ALTER TABLE `kundeinfo`
  ADD PRIMARY KEY (`KundeNr`);

--
-- Indeks for tabel `pizzaer`
--
ALTER TABLE `pizzaer`
  ADD PRIMARY KEY (`PizzaNr`);

--
-- Indeks for tabel `regning`
--
ALTER TABLE `regning`
  ADD PRIMARY KEY (`RegningNr`),
  ADD KEY `second_key_KundeNr` (`KundeNr`);

--
-- Brug ikke AUTO_INCREMENT for slettede tabeller
--

--
-- Tilføj AUTO_INCREMENT i tabel `bestilling`
--
ALTER TABLE `bestilling`
  MODIFY `BestillingsNr` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Tilføj AUTO_INCREMENT i tabel `kundeinfo`
--
ALTER TABLE `kundeinfo`
  MODIFY `KundeNr` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Tilføj AUTO_INCREMENT i tabel `regning`
--
ALTER TABLE `regning`
  MODIFY `RegningNr` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Begrænsninger for dumpede tabeller
--

--
-- Begrænsninger for tabel `bestilling`
--
ALTER TABLE `bestilling`
  ADD CONSTRAINT `PizzaNr` FOREIGN KEY (`PizzaNr`) REFERENCES `pizzaer` (`PizzaNr`),
  ADD CONSTRAINT `fk_KundeNr` FOREIGN KEY (`KundeNr`) REFERENCES `kundeinfo` (`KundeNr`) ON UPDATE CASCADE;

--
-- Begrænsninger for tabel `regning`
--
ALTER TABLE `regning`
  ADD CONSTRAINT `second_key_KundeNr` FOREIGN KEY (`KundeNr`) REFERENCES `kundeinfo` (`KundeNr`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
