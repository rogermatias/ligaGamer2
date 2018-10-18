-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 13-09-2018 a las 18:24:31
-- Versión del servidor: 5.7.19
-- Versión de PHP: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `liga`
--
CREATE DATABASE IF NOT EXISTS `liga` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `liga`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clasificacion`
--

DROP TABLE IF EXISTS `clasificacion`;
CREATE TABLE IF NOT EXISTS `clasificacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clasificacion`
--

INSERT INTO `clasificacion` (`id`, `descripcion`) VALUES
(1, 'Octavos'),
(2, 'Cuartos'),
(3, 'Semifinal'),
(4, 'Final'),
(5, 'Eliminador'),
(6, 'Ganador'),
(7, 'Segundo Lugar'),
(8, 'Tercer Lugar');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipo`
--

DROP TABLE IF EXISTS `equipo`;
CREATE TABLE IF NOT EXISTS `equipo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_equipo` varchar(25) NOT NULL,
  `numero_integrantes` int(11) NOT NULL,
  `tipo_liga` int(11) NOT NULL,
  `vigente` tinyint(1) NOT NULL,
  `clasificacion` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tipo_liga` (`tipo_liga`),
  KEY `clasificacion` (`clasificacion`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `equipo`
--

INSERT INTO `equipo` (`id`, `nombre_equipo`, `numero_integrantes`, `tipo_liga`, `vigente`, `clasificacion`) VALUES
(1, 'Sin Equipo', 7, 4, 0, 5),
(2, 'Fnatic', 0, 1, 1, 2),
(3, 'Cloud 9', 1, 1, 1, 2),
(4, 'SKT1', 3, 1, 1, 2),
(5, 'Team Solo Mid', 0, 1, 1, 2),
(6, 'THE TEAM', 0, 1, 1, 2),
(7, 'KLG', 0, 1, 1, 2),
(8, 'Furius Gaming', 0, 1, 1, 2),
(9, 'RogerTim', 2, 2, 1, 2),
(10, 'LeoTIM', 0, 1, 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jugadores`
--

DROP TABLE IF EXISTS `jugadores`;
CREATE TABLE IF NOT EXISTS `jugadores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) NOT NULL,
  `apellido` varchar(25) NOT NULL,
  `nick` varchar(25) NOT NULL,
  `equipo` int(11) NOT NULL,
  `vigente` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `equipo` (`equipo`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `jugadores`
--

INSERT INTO `jugadores` (`id`, `nombre`, `apellido`, `nick`, `equipo`, `vigente`) VALUES
(1, 'Franco', 'San Martin', 'Francoxo', 3, 1),
(2, 'Faker', 'Rodriguez', 'Faker', 4, 1),
(3, 'Chino', 'Bang', 'Bang', 4, 0),
(4, 'IMPostor', 'Soza', 'IMP', 4, 0),
(5, 'Franco', 'San Martin', 'Francoxo', 9, 0),
(6, 'Mike', 'San Martin', 'mike', 9, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rompimiento`
--

DROP TABLE IF EXISTS `rompimiento`;
CREATE TABLE IF NOT EXISTS `rompimiento` (
  `id_equipo` int(11) NOT NULL,
  `id_liga` int(11) NOT NULL,
  KEY `id_equipo` (`id_equipo`),
  KEY `id_liga` (`id_liga`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_liga`
--

DROP TABLE IF EXISTS `tipo_liga`;
CREATE TABLE IF NOT EXISTS `tipo_liga` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(25) NOT NULL,
  `vigente` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_liga`
--

INSERT INTO `tipo_liga` (`id`, `descripcion`, `vigente`) VALUES
(1, 'League of Legends', 1),
(2, 'Counter Strike: GO', 1),
(3, 'Fortnite', 1),
(4, 'Sin Liga', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_usuario`
--

DROP TABLE IF EXISTS `tipo_usuario`;
CREATE TABLE IF NOT EXISTS `tipo_usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_usuario`
--

INSERT INTO `tipo_usuario` (`id`, `descripcion`) VALUES
(1, 'Administrador'),
(2, 'SuperUsuario'),
(3, 'Equipo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) NOT NULL,
  `edad` int(11) NOT NULL,
  `tipo_usuario` int(11) NOT NULL,
  `user` varchar(40) NOT NULL,
  `pass` varchar(40) NOT NULL,
  `equipo` int(11) NOT NULL,
  `vigente` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tipo_usuario` (`tipo_usuario`),
  KEY `equipo` (`equipo`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre`, `edad`, `tipo_usuario`, `user`, `pass`, `equipo`, `vigente`) VALUES
(1, 'admin', 20, 1, 'admin', 'admin', 1, 1),
(2, 'super', 20, 2, 'superusuario', 'superusuario', 1, 1),
(3, 'Franco', 20, 3, 'franco', '12345', 2, 1),
(4, 'Shroud', 25, 3, 'shroud', '12345', 3, 1),
(5, 'Roger', 21, 3, 'Coger', '12345', 9, 1),
(6, 'RaymondAdmin', 40, 1, 'raymond', '12345', 1, 0),
(7, 'RaymondAdmin', 23, 1, 'raymond', '12345', 1, 1),
(8, 'Leonardo', 20, 3, 'estay', '12345', 10, 1);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `equipo`
--
ALTER TABLE `equipo`
  ADD CONSTRAINT `equipo_ibfk_1` FOREIGN KEY (`tipo_liga`) REFERENCES `tipo_liga` (`id`),
  ADD CONSTRAINT `equipo_ibfk_2` FOREIGN KEY (`clasificacion`) REFERENCES `clasificacion` (`id`);

--
-- Filtros para la tabla `jugadores`
--
ALTER TABLE `jugadores`
  ADD CONSTRAINT `jugadores_ibfk_1` FOREIGN KEY (`equipo`) REFERENCES `equipo` (`id`);

--
-- Filtros para la tabla `rompimiento`
--
ALTER TABLE `rompimiento`
  ADD CONSTRAINT `rompimiento_ibfk_1` FOREIGN KEY (`id_equipo`) REFERENCES `equipo` (`id`),
  ADD CONSTRAINT `rompimiento_ibfk_2` FOREIGN KEY (`id_liga`) REFERENCES `tipo_liga` (`id`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`tipo_usuario`) REFERENCES `tipo_usuario` (`id`),
  ADD CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`equipo`) REFERENCES `equipo` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
