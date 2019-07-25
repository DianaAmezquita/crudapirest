-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 24-07-2019 a las 23:19:39
-- Versión del servidor: 5.7.26
-- Versión de PHP: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `telcomsis`
--

DELIMITER $$
--
-- Procedimientos
--
DROP PROCEDURE IF EXISTS `usersAddOrEdit`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `usersAddOrEdit` (IN `_id` INT(100), IN `_username` VARCHAR(100), IN `_identificacion` VARCHAR(100), IN `_email` VARCHAR(200))  BEGIN
	IF _id = 0 THEN
		INSERT INTO users(username,identificacion,email)
        VALUES (_username,_identificacion,_email);
        
        SET _id = LAST_INSERT_ID();
    ELSE
    	UPDATE users
        SET 
        username = _username,
        identificacion = _identificacion,
        email = _email
        WHERE id = _id;
    END IF;
    
SELECT _id AS 'id';
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `identificacion` varchar(100) NOT NULL,
  `email` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `username`, `identificacion`, `email`) VALUES
(1, 'diana', '26223070', 'amezquitadiana@gmail.com'),
(3, 'luis', '26119852', 'hhdagdhda@gmail.com'),
(4, 'lenin', '12340086', 'lenin.paradas@telcomsis.com.ve'),
(5, 'bella amez', '23597969', 'bella@gmail.com');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
