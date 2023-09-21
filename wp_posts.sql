-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Wrz 21, 2023 at 06:55 AM
-- Wersja serwera: 10.6.12-MariaDB
-- Wersja PHP: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mbeavis_salagier`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wp_posts`
--

CREATE TABLE `wp_posts` (
  `id` int(11) NOT NULL,
  `id_domain` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content` varchar(10000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sent` enum('false','true') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'false',
  `wp_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `wp_posts`
--

INSERT INTO `wp_posts` (`id`, `id_domain`, `title`, `content`, `image`, `sent`, `wp_id`) VALUES
(1, 1, 'Wydrukuj swoją wizytówkę w domu', '<h1>Wydrukuj swoją wizytówkę w domu</h1>\r\n<p>Wizytówka to nie tylko kawałek papieru z Twoimi danymi kontaktowymi. To narzędzie networkingowe, Twoja pierwsza szansa na zrobienie wrażenia. Ale czy wiesz, że nie musisz zatrudniać profesjonalnej drukarni, aby stworzyć wizytówki? Dzięki kilku prostym wskazówkom, które przedstawiamy w tym artykule, dowiesz się, jak wydrukować wizytówki w domu, które zasługują na miejsce na biurku każdego biznesmena.</p>\r\n\r\n<h2>Projektowanie wizytówki</h2>\r\n<p>Wizytówka powinna być małym dziełem sztuki. Estetyczna, czytelna i zawierająca wszystkie niezbędne informacje. Można skorzystać z gotowych szablonów dostępnych w różnych programach do projektowania, lub stworzyć projekt graficzny samemu. Pamiętaj, aby projekt był spójny z wizerunkiem Twojej firmy.</p>\r\n\r\n<h2>Co powinna zawierać wizytówka?</h2>\r\n<p>Nazwa firmy, stanowisko, imię i nazwisko, adres e-mail, numer telefonu, adres strony internetowej - to podstawowe informacje, które powinna zawierać Twoja wizytówka. Warto również pomyśleć o dodaniu logo firmy oraz ewentualnie innych elementów graficznych, które wyróżnią Twoją wizytówkę na tle konkurencji.</p>\r\n\r\n<h2>Wybór papieru i druku</h2>\r\n<p>Kolejnym krokiem jest wybór papieru, na którym zostanie wydrukowana wizytówka. Najpopularniejszym wyborem jest papier kredowy o gramaturze 300-350 g/m². Wybór papieru wpłynie na odbiór wizytówki przez odbiorcę oraz na jej trwałość. Co do druku, zalecamy drukarkę laserową, która zapewnia lepszą jakość i większą trwałość niż drukarki atramentowe. A do tego celu idealnie sprawdzi się sklep <a href=\"https://drtusz.pl/\">drtusz.pl</a>, gdzie znajdziesz odpowiednie tusze i tonery do swojej drukarki.</p>\r\n\r\n<h2>Wydrukowanie wizytówek</h2>\r\n<p>Ostatnim etapem jest wydrukowanie wizytówek. Używając odpowiedniej drukarki i papieru, możesz uzyskać jakość porównywalną z profesjonalną drukarnią. Pamiętaj, aby dokładnie sprawdzić ustawienia drukarki przed rozpoczęciem druku i upewnić się, że format papieru jest ustawiony na rozmiar wizytówki.</p>\r\n\r\n<h2>Podsumowanie</h2>\r\n<p>Wydrukowanie profesjonalnych wizytówek w domu jest nie tylko możliwe, ale również stosunkowo proste. Należy zaplanować design, wybrać odpowiedni papier i drukarkę, a następnie dokładnie skonfigurować ustawienia drukarki. Pamiętaj, że wizytówka to Twoja wizytówka w świecie biznesu, dlatego warto poświęcić na jej stworzenie odpowiednią ilość czasu i energii.</p> \r\n\r\n<h2>Często zadawane pytania</h2>\r\n<h3>Czy mogę wydrukować wizytówkę w domu?</h3>\r\n<p>Oczywiście! Wystarczy odpowiednia drukarka, papier i trochę kreatywności.</p>\r\n\r\n<h3>Czy potrzebuję specjalnej drukarki do wydrukowania wizytówki?</h3>\r\n<p>Nie, ale drukarki laserowe są zwykle lepsze do tego zadania niż drukarki atramentowe, ze względu na ich lepszą jakość i trwałość.</p>\r\n\r\n<h3>Jaki rodzaj papieru powinienem użyć do wydrukowania mojej wizytówki?</h3>\r\n<p>Najpopularniejszym wyborem jest papier kredowy o gramaturze 300-350 g/m². Pamiętaj, że wybór papieru wpłynie na odbiór wizytówki przez odbiorcę oraz na jej trwałość.</p>', 'drukarka.jpg', 'true', 1337),
(2, 1, 'Znajdź swoją nową drukarkę', '<h1>Wydrukuj swoją wizytówkę w domu</h1>\r\n<p>Wizytówka to nie tylko kawałek papieru z Twoimi danymi kontaktowymi. To narzędzie networkingowe, Twoja pierwsza szansa na zrobienie wrażenia. Ale czy wiesz, że nie musisz zatrudniać profesjonalnej drukarni, aby stworzyć wizytówki? Dzięki kilku prostym wskazówkom, które przedstawiamy w tym artykule, dowiesz się, jak wydrukować wizytówki w domu, które zasługują na miejsce na biurku każdego biznesmena.</p>\r\n\r\n<h2>Projektowanie wizytówki</h2>\r\n<p>Wizytówka powinna być małym dziełem sztuki. Estetyczna, czytelna i zawierająca wszystkie niezbędne informacje. Można skorzystać z gotowych szablonów dostępnych w różnych programach do projektowania, lub stworzyć projekt graficzny samemu. Pamiętaj, aby projekt był spójny z wizerunkiem Twojej firmy.</p>\r\n\r\n<h2>Co powinna zawierać wizytówka?</h2>\r\n<p>Nazwa firmy, stanowisko, imię i nazwisko, adres e-mail, numer telefonu, adres strony internetowej - to podstawowe informacje, które powinna zawierać Twoja wizytówka. Warto również pomyśleć o dodaniu logo firmy oraz ewentualnie innych elementów graficznych, które wyróżnią Twoją wizytówkę na tle konkurencji.</p>\r\n\r\n<h2>Wybór papieru i druku</h2>\r\n<p>Kolejnym krokiem jest wybór papieru, na którym zostanie wydrukowana wizytówka. Najpopularniejszym wyborem jest papier kredowy o gramaturze 300-350 g/m². Wybór papieru wpłynie na odbiór wizytówki przez odbiorcę oraz na jej trwałość. Co do druku, zalecamy drukarkę laserową, która zapewnia lepszą jakość i większą trwałość niż drukarki atramentowe. A do tego celu idealnie sprawdzi się sklep <a href=\"https://drtusz.pl/\">drtusz.pl</a>, gdzie znajdziesz odpowiednie tusze i tonery do swojej drukarki.</p>\r\n\r\n<h2>Wydrukowanie wizytówek</h2>\r\n<p>Ostatnim etapem jest wydrukowanie wizytówek. Używając odpowiedniej drukarki i papieru, możesz uzyskać jakość porównywalną z profesjonalną drukarnią. Pamiętaj, aby dokładnie sprawdzić ustawienia drukarki przed rozpoczęciem druku i upewnić się, że format papieru jest ustawiony na rozmiar wizytówki.</p>\r\n\r\n<h2>Podsumowanie</h2>\r\n<p>Wydrukowanie profesjonalnych wizytówek w domu jest nie tylko możliwe, ale również stosunkowo proste. Należy zaplanować design, wybrać odpowiedni papier i drukarkę, a następnie dokładnie skonfigurować ustawienia drukarki. Pamiętaj, że wizytówka to Twoja wizytówka w świecie biznesu, dlatego warto poświęcić na jej stworzenie odpowiednią ilość czasu i energii.</p> \r\n\r\n<h2>Często zadawane pytania</h2>\r\n<h3>Czy mogę wydrukować wizytówkę w domu?</h3>\r\n<p>Oczywiście! Wystarczy odpowiednia drukarka, papier i trochę kreatywności.</p>\r\n\r\n<h3>Czy potrzebuję specjalnej drukarki do wydrukowania wizytówki?</h3>\r\n<p>Nie, ale drukarki laserowe są zwykle lepsze do tego zadania niż drukarki atramentowe, ze względu na ich lepszą jakość i trwałość.</p>\r\n\r\n<h3>Jaki rodzaj papieru powinienem użyć do wydrukowania mojej wizytówki?</h3>\r\n<p>Najpopularniejszym wyborem jest papier kredowy o gramaturze 300-350 g/m². Pamiętaj, że wybór papieru wpłynie na odbiór wizytówki przez odbiorcę oraz na jej trwałość.</p>', '', 'false', 1323);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `wp_posts`
--
ALTER TABLE `wp_posts`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `wp_posts`
--
ALTER TABLE `wp_posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
