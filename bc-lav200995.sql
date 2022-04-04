-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-04-2022 a las 06:31:54
-- Versión del servidor: 10.4.20-MariaDB
-- Versión de PHP: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bc-lav200995`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idcliente` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apaterno` varchar(50) NOT NULL,
  `amaterno` varchar(50) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `fecha_registro` date NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`idcliente`, `nombre`, `apaterno`, `amaterno`, `direccion`, `correo`, `telefono`, `fecha_registro`, `status`) VALUES
(1, 'Jesus', 'Rios', 'Gomez', 'Xicotepec de Juarez', 'jesus.riosgomez@utxicotepec.edu.mx', '7641104128', '2022-04-03', 1),
(3, 'Raul', 'Perez', 'Lopez', 'La Avenida #110', '76411041288', 'raularroyo@perez.mx', '2022-03-22', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE `servicio` (
  `idservicio` int(11) NOT NULL,
  `descripcion` varchar(150) NOT NULL,
  `costo` double NOT NULL,
  `fecha_registro` date NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `servicio`
--

INSERT INTO `servicio` (`idservicio`, `descripcion`, `costo`, `fecha_registro`, `status`) VALUES
(1, 'Servicio de lavado xtreme con accesorios', 100, '2022-03-23', 1),
(2, 'Lavados xtreme medium', 100, '2022-03-23', 1),
(3, 'Servicio de lavado xtreme con lavados integrados', 600, '2022-03-23', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajador`
--

CREATE TABLE `trabajador` (
  `idtrabajador` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apaterno` varchar(50) NOT NULL,
  `amaterno` varchar(50) NOT NULL,
  `direccion` varchar(150) NOT NULL,
  `telefono` varchar(25) NOT NULL,
  `correo` varchar(60) NOT NULL,
  `fecha_registro` date NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `trabajador`
--

INSERT INTO `trabajador` (`idtrabajador`, `nombre`, `apaterno`, `amaterno`, `direccion`, `telefono`, `correo`, `fecha_registro`, `status`) VALUES
(1, 'Maria Rodolfa', 'Gutierrez', 'Fernandez', 'Trabajador adecuado', '558989777567', 'maria@dosequis.com', '2022-03-29', 0),
(2, 'Manzano', 'Quiroz', 'Cortez', 'Trabajador honesto', '551048768901909', 'lala@utxj', '2022-03-04', 1),
(3, 'Rodolfo', 'Gutierrez', 'Lopez', 'Trabajador responsable', 'vakalaka@gmail.com', '104958724', '2022-03-24', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculo`
--

CREATE TABLE `vehiculo` (
  `idvehiculo` int(11) NOT NULL,
  `matricula` varchar(10) NOT NULL,
  `tipo` enum('sedan','deportivo','camioneta','cerrada') NOT NULL,
  `marca` enum('FORD','TOYOTA','BWN','NISSAN','CHEVROLET') NOT NULL,
  `modelo` enum('1986','1987','1988','1989','7990') NOT NULL,
  `color` varchar(25) NOT NULL,
  `fecha_registro` date NOT NULL,
  `status` tinyint(1) NOT NULL,
  `idcliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `vehiculo`
--

INSERT INTO `vehiculo` (`idvehiculo`, `matricula`, `tipo`, `marca`, `modelo`, `color`, `fecha_registro`, `status`, `idcliente`) VALUES
(1, 'elvisequis', 'sedan', 'BWN', '1989', 'negro oscuro', '2023-03-24', 1, 1),
(2, 'deequideqe', 'deportivo', 'BWN', '1989', 'negro brilloso', '2023-03-03', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `idventa` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `idvehiculo` int(11) NOT NULL,
  `idcajero` int(11) NOT NULL,
  `idservicio` int(11) NOT NULL,
  `idtrabajador` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`idventa`, `fecha`, `idvehiculo`, `idcajero`, `idservicio`, `idtrabajador`) VALUES
(1, '2022-03-06', 1, 1, 1, 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idcliente`);

--
-- Indices de la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`idservicio`);

--
-- Indices de la tabla `trabajador`
--
ALTER TABLE `trabajador`
  ADD PRIMARY KEY (`idtrabajador`);

--
-- Indices de la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD PRIMARY KEY (`idvehiculo`),
  ADD KEY `idcliente` (`idcliente`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`idventa`),
  ADD KEY `idservicio` (`idservicio`),
  ADD KEY `idtrabajador` (`idtrabajador`),
  ADD KEY `idcajero` (`idcajero`),
  ADD KEY `idvehiculo` (`idvehiculo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idcliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `servicio`
--
ALTER TABLE `servicio`
  MODIFY `idservicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `trabajador`
--
ALTER TABLE `trabajador`
  MODIFY `idtrabajador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  MODIFY `idvehiculo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `idventa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD CONSTRAINT `vehiculo_ibfk_1` FOREIGN KEY (`idcliente`) REFERENCES `cliente` (`idcliente`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`idtrabajador`) REFERENCES `trabajador` (`idtrabajador`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `venta_ibfk_2` FOREIGN KEY (`idcajero`) REFERENCES `trabajador` (`idtrabajador`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `venta_ibfk_3` FOREIGN KEY (`idservicio`) REFERENCES `servicio` (`idservicio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `venta_ibfk_4` FOREIGN KEY (`idvehiculo`) REFERENCES `vehiculo` (`idvehiculo`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
