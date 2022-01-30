-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-12-2021 a las 12:11:44
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `control_policial`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bandas`
--

CREATE TABLE `bandas` (
  `banda_id` int(11) NOT NULL,
  `nombre_banda` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `bandas`
--

INSERT INTO `bandas` (`banda_id`, `nombre_banda`) VALUES
(1, '(Sin Banda)'),
(4, 'los popo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `casos`
--

CREATE TABLE `casos` (
  `codigo_caso` int(11) NOT NULL,
  `fecha_caso` date NOT NULL,
  `juez_id` int(11) NOT NULL,
  `codigo_suc` int(11) NOT NULL,
  `condena` tinyint(1) NOT NULL,
  `tiempo_condena` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `casos`
--

INSERT INTO `casos` (`codigo_caso`, `fecha_caso`, `juez_id`, `codigo_suc`, `condena`, `tiempo_condena`) VALUES
(808080885, '2021-11-03', 6, 58, 1, 2),
(808080886, '2021-11-10', 6, 58, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `condena_det`
--

CREATE TABLE `condena_det` (
  `codigo_detalle` int(11) NOT NULL,
  `codigo_caso` int(11) NOT NULL,
  `codigo_det` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `condena_det`
--

INSERT INTO `condena_det` (`codigo_detalle`, `codigo_caso`, `codigo_det`) VALUES
(81, 808080885, 101),
(82, 808080885, 102);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contratos`
--

CREATE TABLE `contratos` (
  `codigo_contrato` int(11) NOT NULL,
  `fecha_contratacion` date NOT NULL,
  `codigo_suc` int(11) NOT NULL,
  `codigo_vig` int(11) NOT NULL,
  `dias_contratados` int(11) NOT NULL,
  `armado` tinyint(1) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `contratos`
--

INSERT INTO `contratos` (`codigo_contrato`, `fecha_contratacion`, `codigo_suc`, `codigo_vig`, `dias_contratados`, `armado`, `estado`) VALUES
(111111116, '2021-10-28', 58, 5, 22, 1, 0),
(111111117, '2021-11-12', 58, 5, 22, 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detenidos`
--

CREATE TABLE `detenidos` (
  `codigo_det` int(11) NOT NULL,
  `codigo_banda` int(11) NOT NULL,
  `nombre_ape` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `detenidos`
--

INSERT INTO `detenidos` (`codigo_det`, `codigo_banda`, `nombre_ape`) VALUES
(101, 1, 'Marcos Aguirre'),
(102, 1, 'Franco munio'),
(103, 1, 'Noelia mancuello'),
(202, 4, 'Maria Ines');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entidades`
--

CREATE TABLE `entidades` (
  `entidad_id` int(11) NOT NULL,
  `nombre_ent` varchar(50) NOT NULL,
  `domicilio` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `entidades`
--

INSERT INTO `entidades` (`entidad_id`, `nombre_ent`, `domicilio`) VALUES
(1, 'Banco Patagonia', 'Mar'),
(8, 'Banco Ciudad', 'La plata 3030');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jueces`
--

CREATE TABLE `jueces` (
  `juez_id` int(11) NOT NULL,
  `numero_juzgado` int(11) NOT NULL,
  `nombre_ape` varchar(100) NOT NULL,
  `años_serv` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `jueces`
--

INSERT INTO `jueces` (`juez_id`, `numero_juzgado`, `nombre_ape`, `años_serv`) VALUES
(6, 3, 'Mars', 22);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `juzgados`
--

CREATE TABLE `juzgados` (
  `juzgado_id` int(11) NOT NULL,
  `numero_juzgado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `juzgados`
--

INSERT INTO `juzgados` (`juzgado_id`, `numero_juzgado`) VALUES
(3, 993);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursales`
--

CREATE TABLE `sucursales` (
  `codigo_ent` int(11) NOT NULL,
  `codigo_suc` int(5) NOT NULL,
  `domicilio` varchar(100) NOT NULL,
  `empleados` int(11) NOT NULL,
  `fecha_contratacion` date NOT NULL,
  `frecuencia_contratacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `sucursales`
--

INSERT INTO `sucursales` (`codigo_ent`, `codigo_suc`, `domicilio`, `empleados`, `fecha_contratacion`, `frecuencia_contratacion`) VALUES
(1, 58, 'Mariano Moreno 1334', 43, '2021-11-12', 15),
(1, 60, 'Acosta 334', 23, '2021-11-27', 15),
(8, 61, 'Moreno 432', 43, '2021-12-10', 22),
(8, 62, 'Virrey Liniers 3281', 33, '2021-12-14', 22);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `usuario_id` int(11) NOT NULL,
  `clave` varchar(4) NOT NULL,
  `pass` varchar(20) NOT NULL,
  `edad` int(2) NOT NULL,
  `tipo` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`usuario_id`, `clave`, `pass`, `edad`, `tipo`) VALUES
(1, 'A001', 'adm001', 43, 'Administrador'),
(2, 'I001', 'inv001', 35, 'Investigador'),
(3, 'mam', 'pppp', 45, 'Administrador'),
(5, 'V001', 'vig001', 27, 'Vigilante'),
(6, 'V002', 'vig002', 35, 'Vigilante'),
(10, 'Dieg', '33', 27, 'Administrador');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bandas`
--
ALTER TABLE `bandas`
  ADD PRIMARY KEY (`banda_id`),
  ADD UNIQUE KEY `nombre_banda` (`nombre_banda`);

--
-- Indices de la tabla `casos`
--
ALTER TABLE `casos`
  ADD PRIMARY KEY (`codigo_caso`),
  ADD KEY `codigo_suc` (`codigo_suc`),
  ADD KEY `juez_id` (`juez_id`);

--
-- Indices de la tabla `condena_det`
--
ALTER TABLE `condena_det`
  ADD PRIMARY KEY (`codigo_detalle`),
  ADD KEY `codigo_caso` (`codigo_caso`,`codigo_det`),
  ADD KEY `codigo_det` (`codigo_det`);

--
-- Indices de la tabla `contratos`
--
ALTER TABLE `contratos`
  ADD PRIMARY KEY (`codigo_contrato`),
  ADD KEY `codigo_suc` (`codigo_suc`,`codigo_vig`),
  ADD KEY `codigo_vig` (`codigo_vig`);

--
-- Indices de la tabla `detenidos`
--
ALTER TABLE `detenidos`
  ADD PRIMARY KEY (`codigo_det`),
  ADD KEY `codigo_banda` (`codigo_banda`);

--
-- Indices de la tabla `entidades`
--
ALTER TABLE `entidades`
  ADD PRIMARY KEY (`entidad_id`),
  ADD UNIQUE KEY `nombre_ent` (`nombre_ent`);

--
-- Indices de la tabla `jueces`
--
ALTER TABLE `jueces`
  ADD PRIMARY KEY (`juez_id`),
  ADD KEY `numero_juzgado` (`numero_juzgado`);

--
-- Indices de la tabla `juzgados`
--
ALTER TABLE `juzgados`
  ADD PRIMARY KEY (`juzgado_id`),
  ADD UNIQUE KEY `numero_juzgado` (`numero_juzgado`);

--
-- Indices de la tabla `sucursales`
--
ALTER TABLE `sucursales`
  ADD PRIMARY KEY (`codigo_suc`),
  ADD KEY `codigo_ent` (`codigo_ent`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`usuario_id`),
  ADD UNIQUE KEY `clave` (`clave`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `bandas`
--
ALTER TABLE `bandas`
  MODIFY `banda_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `casos`
--
ALTER TABLE `casos`
  MODIFY `codigo_caso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=808080887;

--
-- AUTO_INCREMENT de la tabla `condena_det`
--
ALTER TABLE `condena_det`
  MODIFY `codigo_detalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT de la tabla `contratos`
--
ALTER TABLE `contratos`
  MODIFY `codigo_contrato` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111111118;

--
-- AUTO_INCREMENT de la tabla `detenidos`
--
ALTER TABLE `detenidos`
  MODIFY `codigo_det` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=204;

--
-- AUTO_INCREMENT de la tabla `entidades`
--
ALTER TABLE `entidades`
  MODIFY `entidad_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `jueces`
--
ALTER TABLE `jueces`
  MODIFY `juez_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `juzgados`
--
ALTER TABLE `juzgados`
  MODIFY `juzgado_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `sucursales`
--
ALTER TABLE `sucursales`
  MODIFY `codigo_suc` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `usuario_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `casos`
--
ALTER TABLE `casos`
  ADD CONSTRAINT `casos_ibfk_2` FOREIGN KEY (`codigo_suc`) REFERENCES `sucursales` (`codigo_suc`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `casos_ibfk_3` FOREIGN KEY (`juez_id`) REFERENCES `jueces` (`juez_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `condena_det`
--
ALTER TABLE `condena_det`
  ADD CONSTRAINT `condena_det_ibfk_1` FOREIGN KEY (`codigo_det`) REFERENCES `detenidos` (`codigo_det`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `condena_det_ibfk_2` FOREIGN KEY (`codigo_caso`) REFERENCES `casos` (`codigo_caso`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `contratos`
--
ALTER TABLE `contratos`
  ADD CONSTRAINT `contratos_ibfk_2` FOREIGN KEY (`codigo_suc`) REFERENCES `sucursales` (`codigo_suc`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `contratos_ibfk_3` FOREIGN KEY (`codigo_vig`) REFERENCES `usuarios` (`usuario_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detenidos`
--
ALTER TABLE `detenidos`
  ADD CONSTRAINT `detenidos_ibfk_1` FOREIGN KEY (`codigo_banda`) REFERENCES `bandas` (`banda_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `jueces`
--
ALTER TABLE `jueces`
  ADD CONSTRAINT `jueces_ibfk_1` FOREIGN KEY (`numero_juzgado`) REFERENCES `juzgados` (`juzgado_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `sucursales`
--
ALTER TABLE `sucursales`
  ADD CONSTRAINT `sucursales_ibfk_1` FOREIGN KEY (`codigo_ent`) REFERENCES `entidades` (`entidad_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
