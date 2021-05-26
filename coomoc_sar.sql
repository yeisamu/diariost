-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 22-05-2021 a las 10:47:25
-- Versión del servidor: 10.2.38-MariaDB
-- Versión de PHP: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `coomoc_sar`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `accidente`
--

CREATE TABLE `accidente` (
  `id_acc` int(10) NOT NULL COMMENT 'id interno del reporte de accidente',
  `fecha` datetime NOT NULL COMMENT 'fecha y hora en que se registra el accidente',
  `usuario` varchar(20) NOT NULL,
  `fecha_inc` datetime NOT NULL COMMENT 'Fecha y Hora en que ocurre el incidente',
  `dir_inc` varchar(50) NOT NULL COMMENT 'Direccion o Lugar donde ocurre el incidente',
  `id_tarjeta` int(10) NOT NULL COMMENT 'Nro interno de tarjeta de conductor implicado',
  `tarjeta` varchar(10) DEFAULT '' COMMENT 'Nro fisico de tarjeta de conductor implicado',
  `id_conductor` int(10) NOT NULL COMMENT 'id interno de conductor',
  `codigo` varchar(20) DEFAULT '' COMMENT 'Cedula del conductor implicado',
  `nombres` varchar(50) DEFAULT '' COMMENT 'nombres del conductor implicado',
  `id_movil` varchar(5) NOT NULL DEFAULT '' COMMENT 'Numero de movil implicado',
  `placa` varchar(7) DEFAULT '' COMMENT 'Place del movil implicado',
  `placa_otro` varchar(7) DEFAULT '' COMMENT 'Placa del otro vehiculo',
  `info_otro` varchar(100) DEFAULT '' COMMENT 'informacion adicional del otro vehiculo',
  `id_tipo_a` int(3) DEFAULT NULL COMMENT 'id interno del tipo de accidente',
  `tipo_accidente` varchar(35) DEFAULT '' COMMENT 'Descripcion del tipo de accidente',
  `descripcion` varchar(300) DEFAULT '',
  `reportado` varchar(25) DEFAULT '',
  `conduce_prop` int(1) DEFAULT NULL,
  `ambulancia` int(1) DEFAULT NULL,
  `lesionado` int(1) DEFAULT NULL,
  `transito` int(1) DEFAULT NULL,
  `tras_lesionado` int(1) DEFAULT NULL,
  `entidad_lesionado` varchar(30) DEFAULT '',
  `hora_asist` datetime DEFAULT NULL,
  `danos_mat` int(2) DEFAULT NULL,
  `heridos` int(2) DEFAULT NULL,
  `conciliacion` int(2) DEFAULT NULL,
  `croquis` int(2) DEFAULT NULL,
  `juez_gtias` int(2) DEFAULT NULL,
  `rep_aseg` int(2) DEFAULT NULL,
  `observacion` varchar(500) DEFAULT '',
  `estado` int(2) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acc_group_user`
--

CREATE TABLE `acc_group_user` (
  `id_group` int(5) NOT NULL,
  `group_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `acc_group_user`
--

INSERT INTO `acc_group_user` (`id_group`, `group_name`) VALUES
(1, 'Secretaría'),
(2, 'Central de Radio'),
(3, 'Contabilidad'),
(4, 'Gerencia'),
(5, 'Tesorería'),
(6, 'Secretaría-Contabilidad'),
(7, 'Secretaría-Central');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acc_grupo`
--

CREATE TABLE `acc_grupo` (
  `id_grupo` int(4) NOT NULL,
  `grupo` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `acc_grupo`
--

INSERT INTO `acc_grupo` (`id_grupo`, `grupo`) VALUES
(1, 'Procesos'),
(2, 'Informes'),
(3, 'Tablas Maestras'),
(4, 'Administracion'),
(5, 'Menu');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acc_log`
--

CREATE TABLE `acc_log` (
  `id_usr` int(3) NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `accion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acc_opcion`
--

CREATE TABLE `acc_opcion` (
  `id_opcion` int(3) NOT NULL,
  `opcion` varchar(35) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `id_grupo` int(3) NOT NULL,
  `path` varchar(60) NOT NULL,
  `visible` int(1) NOT NULL,
  `tipo` varchar(15) NOT NULL,
  `clase` varchar(50) NOT NULL,
  `img` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `acc_opcion`
--

INSERT INTO `acc_opcion` (`id_opcion`, `opcion`, `descripcion`, `id_grupo`, `path`, `visible`, `tipo`, `clase`, `img`) VALUES
(1, 'MENU PRINCIPAL', 'Menu de Acceso a la Aplicacion', 5, 'login/index2.php', 0, '', '', ''),
(2, 'GESTION DE USUARIOS DEL SISTEMAS', 'Gestion de los Usuarios del Sistema y Sus Permisos', 4, 'usuario/gesusu.php', 1, '', '', ''),
(4, 'TARJETAS DE CONTROL', 'Gestion de Tarjetas de Control', 1, 'sart.php/sistemasart/tarjetaControl', 1, 'mvc', 'car-user-yellow', 'taxiprop.png'),
(5, 'GESTION DE TARJETA y ACTUALIZACION', 'Crear, Actualizar, Cerrar', 1, 'gesdocs/documento.php', 1, '', '', ''),
(6, 'GESTION DE OPCIONES', 'Administracion de Opciones del Menu ppal', 4, 'usuario/gesopcion.php', 1, '', '', ''),
(7, 'GESTION DE DOCUMENTOS', 'Gestion de los Documentos del Conductor', 4, 'gesdocs/gesdocumento.php', 1, '', '', ''),
(8, 'GESTION DE EMPRESA', 'Gestion de Empresas Administradas', 3, 'gesempresa/gesemp.php', 1, '', '', ''),
(9, 'RELACION DE PAGO DE DIARIOS', 'Informe de Pago de Diarios', 2, 'radio_operador/gesvehi.php', 1, '', '', ''),
(10, 'GESTION DE GRUPOS', 'Gestion de Grupo de opciones del Menu ppal', 4, 'usuario/gesgrupo.php', 1, '', '', ''),
(11, 'REPORTE DE TARJETAS', 'Relacion de Tarjetas y Conductores', 2, 'gesdocs/reporte_tarjetas.php', 1, '', '', ''),
(12, 'REPORTE DE MULTAS', 'Permite visualizar el listado de comparendos por conductor', 2, 'gesdocs/reporte_multas.php', 1, '', '', ''),
(13, 'GESTION DE ENTIDADES', 'Permite Gestionar las Entidades', 3, 'gesempresa/gesentidad.php', 1, '', '', ''),
(14, 'REPORTE DE PLANILLAS', 'Permite ver el reporte de planillas', 2, 'gesdocs/reporte_planilla.php', 1, '', '', ''),
(15, 'CONTROL DE PLANILLA', 'permite llevar control de las planillas por empresa', 2, 'gesdocs/listado_planilla.php', 1, '', '', ''),
(16, 'PLANILLAS LIQUIDADAS', 'permite consultar el listado de las planillas ya liquidadas', 2, 'gesdocs/planillas_liq.php', 1, '', '', ''),
(17, 'PANEL DE CONTROL', 'PANEL PRINCIPAL PARA LA ASIGNACION DE SERVICIOS', 1, 'panel_radio/panel_inactivos.php', 1, '', '', ''),
(18, 'GESTION DE DIRECTORIO', 'GESTION DE DIRECTORIO DE DIRECCIONES Y MANEJO DE LINEAS', 3, 'panel_radio/ges_dir.php', 1, '', '', ''),
(19, 'GESTION DE REPORTE 8-25', 'REPORTE DE MOVILES EN ESTADO DE 10-42', 1, 'panel_radio/ges_1042.php', 1, '', '', ''),
(20, 'REPORTE DE SERVICIOS ASIGNADOS', 'SERVICIOS ASIGNADOS', 2, 'panel_radio/gesreporte.php', 1, '', '', ''),
(21, 'REPORTE DE PUNTOS', '', 2, 'informes/gesreporte.php', 1, '', '', ''),
(22, 'REPORTE DE SERVICIOS ', '', 2, 'panel_radio/reposerviciom.php', 1, '', '', ''),
(23, 'REPORTE 8-66 Y 8-51', '', 2, 'panel_radio/repo105_7.php', 1, '', '', ''),
(24, 'REPORTE 8-25 CENTRAL', '', 2, 'panel_radio/ges_1042_3.php', 1, '', '', ''),
(25, 'GESTION DE VEHICULOS Y PROPIETARIOS', '', 2, 'gespersona/gesvehi.php', 1, '', '', ''),
(26, 'REPORTE DE PLANILLAS POR MOVIL', '', 2, 'gesdocs/gesreportepl.php', 1, '', '', ''),
(31, 'PENDIENTES DE PAGO', '', 2, 'poliza/pendiente_pago.php', 1, '', '', ''),
(32, 'SUBIR FOTOS', 'Permite subir las fotos de los conductores', 3, 'subir', 1, '', '', ''),
(33, 'REPORTE DE MULTAS COMPLETO', '', 2, 'gesdocs/reporte_multasnew.php', 1, '', '', ''),
(34, 'DOCUMENTOS DE VEHICULOS VENCIDOS', 'Informe de documentos vencidos', 2, 'gesdocs/reporte_docs_vehi.php', 1, '', '', ''),
(35, 'Vehiculos y propietarios', 'Gesti&oacute;n de Vehiculos y propietarios', 1, 'sart.php/sistemasart/movil', 0, 'mvc', 'card-user-purple', 'taxiprop.png'),
(36, 'Administracion y aportes', 'Pagos de administracion', 1, 'sart.php/sistemasart/diarios', 1, 'mvc1', 'card-user-orange', 'diarios.png'),
(37, 'Informes', 'Generaci&oacute;n de Informes', 1, 'sart.php/sistemasart/informes', 0, 'mvc', 'card-user-green', 'informes.png'),
(38, 'Configuraci&oacute;n', 'Configuraci&oacute;n valores y taller', 1, 'sart.php/sistemasart/confi', 0, 'mvc', 'card-user-red', 'confi.jpeg'),
(39, 'Propietarios', 'Gestion de propietarios', 2, 'sart.php/sistemasart/propietario', 0, 'mvc', 'car-user-yellow', 'taxiprop.png'),
(40, 'Usuarios', 'Configuraci&oacute;n Usuarios', 1, 'sart.php/sistemasart/users', 0, 'mvc', 'card-user-green', 'users.jpg'),
(41, 'Importar', 'Importar Planilla', 1, 'sart.php/sistemasart/planilla', 0, 'mvc', 'card-user-pink', 'users.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acc_permiso`
--

CREATE TABLE `acc_permiso` (
  `id_permiso` int(5) NOT NULL,
  `id_usr` int(3) NOT NULL,
  `id_group` int(5) NOT NULL,
  `id_opcion` int(3) NOT NULL,
  `permiso` int(1) NOT NULL,
  `leer` enum('si','no') NOT NULL DEFAULT 'no',
  `borrar` enum('si','no') NOT NULL DEFAULT 'no',
  `crear` enum('si','no') NOT NULL DEFAULT 'no',
  `editar` enum('si','no') NOT NULL DEFAULT 'no'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `acc_permiso`
--

INSERT INTO `acc_permiso` (`id_permiso`, `id_usr`, `id_group`, `id_opcion`, `permiso`, `leer`, `borrar`, `crear`, `editar`) VALUES
(1, 1, 4, 1, 1, 'no', 'no', 'no', 'no'),
(2, 1, 4, 2, 1, 'no', 'no', 'no', 'no'),
(3, 1, 4, 3, 1, 'no', 'no', 'no', 'no'),
(4, 1, 4, 4, 1, 'si', 'no', 'no', 'no'),
(5, 1, 4, 5, 1, 'no', 'no', 'no', 'no'),
(6, 1, 4, 6, 1, 'no', 'no', 'no', 'no'),
(7, 1, 4, 7, 1, 'no', 'no', 'no', 'no'),
(8, 1, 4, 8, 1, 'no', 'no', 'no', 'no'),
(9, 1, 4, 9, 1, 'no', 'no', 'no', 'no'),
(10, 1, 4, 10, 1, 'no', 'no', 'no', 'no'),
(11, 1, 4, 11, 1, 'no', 'no', 'no', 'no'),
(12, 1, 4, 12, 1, 'no', 'no', 'no', 'no'),
(13, 1, 4, 13, 1, 'no', 'no', 'no', 'no'),
(14, 1, 4, 14, 1, 'no', 'no', 'no', 'no'),
(15, 1, 4, 15, 1, 'no', 'no', 'no', 'no'),
(16, 1, 4, 16, 1, 'no', 'no', 'no', 'no'),
(17, 1, 4, 17, 1, 'no', 'no', 'no', 'no'),
(18, 1, 4, 18, 1, 'no', 'no', 'no', 'no'),
(19, 1, 4, 19, 1, 'no', 'no', 'no', 'no'),
(20, 1, 4, 20, 1, 'no', 'no', 'no', 'no'),
(21, 1, 4, 21, 1, 'no', 'no', 'no', 'no'),
(22, 1, 4, 22, 0, 'no', 'no', 'no', 'no'),
(23, 1, 4, 23, 1, 'no', 'no', 'no', 'no'),
(24, 1, 4, 24, 0, 'no', 'no', 'no', 'no'),
(25, 1, 4, 25, 1, 'no', 'no', 'no', 'no'),
(26, 1, 4, 26, 0, 'no', 'no', 'no', 'no'),
(27, 1, 4, 27, 1, 'no', 'no', 'no', 'no'),
(28, 1, 4, 28, 0, 'no', 'no', 'no', 'no'),
(29, 1, 4, 29, 1, 'no', 'no', 'no', 'no'),
(30, 1, 4, 30, 1, 'no', 'no', 'no', 'no'),
(31, 1, 4, 31, 0, 'no', 'no', 'no', 'no'),
(32, 1, 4, 32, 1, 'no', 'no', 'no', 'no'),
(33, 1, 4, 33, 0, 'no', 'no', 'no', 'no'),
(34, 1, 4, 34, 1, 'no', 'no', 'no', 'no'),
(647, 1, 4, 35, 1, 'no', 'no', 'si', 'si'),
(649, 1, 4, 36, 1, 'si', 'si', 'si', 'si'),
(793, 1, 4, 37, 1, 'si', 'si', 'si', 'si'),
(815, 1, 4, 38, 1, 'si', 'si', 'si', 'no'),
(972, 1, 4, 39, 1, 'si', 'no', 'no', 'no'),
(1438, 1, 4, 41, 1, 'si', 'si', 'si', 'si'),
(1439, 1, 4, 40, 1, 'si', 'si', 'si', 'si'),
(1440, 2, 7, 4, 1, 'no', 'si', 'si', 'si'),
(1441, 2, 7, 35, 1, 'si', 'si', 'si', 'si'),
(1442, 2, 7, 37, 1, 'si', 'si', 'si', 'si'),
(1443, 2, 7, 38, 0, 'no', 'no', 'no', 'no'),
(1444, 2, 7, 39, 1, 'si', 'si', 'si', 'si'),
(1445, 2, 7, 40, 0, 'no', 'no', 'no', 'no'),
(1446, 2, 7, 41, 0, 'no', 'no', 'no', 'no'),
(1447, 3, 6, 4, 1, 'si', 'si', 'si', 'si'),
(1448, 3, 6, 35, 1, 'si', 'si', 'si', 'si'),
(1449, 3, 6, 37, 0, 'no', 'no', 'no', 'no'),
(1450, 3, 6, 38, 0, 'no', 'no', 'no', 'no'),
(1451, 3, 6, 39, 1, 'si', 'si', 'si', 'si'),
(1452, 3, 6, 40, 0, 'no', 'no', 'no', 'no'),
(1453, 3, 6, 41, 1, 'si', 'si', 'si', 'si'),
(1454, 4, 1, 4, 1, 'si', 'si', 'si', 'si'),
(1455, 4, 1, 35, 1, 'si', 'si', 'si', 'si'),
(1456, 4, 1, 37, 1, 'si', 'si', 'si', 'si'),
(1457, 4, 1, 38, 0, 'no', 'no', 'no', 'no'),
(1458, 4, 1, 39, 1, 'si', 'si', 'si', 'si'),
(1459, 4, 1, 40, 0, 'no', 'no', 'no', 'no'),
(1460, 4, 1, 41, 0, 'no', 'no', 'no', 'no'),
(1461, 5, 2, 4, 0, 'no', 'no', 'no', 'no'),
(1462, 5, 2, 35, 0, 'no', 'no', 'no', 'no'),
(1463, 5, 2, 37, 1, 'si', 'si', 'si', 'si'),
(1464, 5, 2, 38, 0, 'no', 'no', 'no', 'no'),
(1465, 5, 2, 39, 0, 'no', 'no', 'no', 'no'),
(1466, 5, 2, 40, 0, 'no', 'no', 'no', 'no'),
(1467, 5, 2, 41, 0, 'no', 'no', 'no', 'no'),
(1468, 6, 2, 4, 0, 'no', 'no', 'no', 'no'),
(1469, 6, 2, 35, 0, 'no', 'no', 'no', 'no'),
(1470, 6, 2, 37, 1, 'no', 'no', 'no', 'no'),
(1471, 6, 2, 38, 0, 'no', 'no', 'no', 'no'),
(1472, 6, 2, 39, 0, 'no', 'no', 'no', 'no'),
(1473, 6, 2, 40, 0, 'no', 'no', 'no', 'no'),
(1474, 6, 2, 41, 0, 'no', 'no', 'no', 'no'),
(1475, 7, 2, 4, 0, 'no', 'no', 'no', 'no'),
(1476, 7, 2, 35, 0, 'no', 'no', 'no', 'no'),
(1477, 7, 2, 37, 1, 'no', 'no', 'no', 'no'),
(1478, 7, 2, 38, 0, 'no', 'no', 'no', 'no'),
(1479, 7, 2, 39, 0, 'no', 'no', 'no', 'no'),
(1480, 7, 2, 40, 0, 'no', 'no', 'no', 'no'),
(1481, 7, 2, 41, 0, 'no', 'no', 'no', 'no'),
(1482, 8, 2, 4, 0, 'no', 'no', 'no', 'no'),
(1483, 8, 2, 35, 0, 'no', 'no', 'no', 'no'),
(1484, 8, 2, 37, 1, 'no', 'no', 'no', 'no'),
(1485, 8, 2, 38, 0, 'no', 'no', 'no', 'no'),
(1486, 8, 2, 39, 0, 'no', 'no', 'no', 'no'),
(1487, 8, 2, 40, 0, 'no', 'no', 'no', 'no'),
(1488, 8, 2, 41, 0, 'no', 'no', 'no', 'no'),
(1489, 9, 3, 4, 0, 'no', 'no', 'no', 'no'),
(1490, 9, 3, 35, 0, 'no', 'no', 'no', 'no'),
(1491, 9, 3, 37, 0, 'no', 'no', 'no', 'no'),
(1492, 9, 3, 38, 0, 'no', 'no', 'no', 'no'),
(1493, 9, 3, 39, 0, 'no', 'no', 'no', 'no'),
(1494, 9, 3, 40, 0, 'no', 'no', 'no', 'no'),
(1495, 9, 3, 41, 1, 'si', 'si', 'si', 'si'),
(1496, 10, 5, 4, 1, 'si', 'si', 'si', 'si'),
(1497, 10, 5, 35, 0, 'no', 'no', 'no', 'no'),
(1498, 10, 5, 37, 0, 'no', 'no', 'no', 'no'),
(1499, 10, 5, 38, 0, 'no', 'no', 'no', 'no'),
(1500, 10, 5, 39, 0, 'no', 'no', 'no', 'no'),
(1501, 10, 5, 40, 0, 'no', 'no', 'no', 'no'),
(1502, 10, 5, 41, 0, 'no', 'no', 'no', 'no');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acc_usuario`
--

CREATE TABLE `acc_usuario` (
  `id_usr` int(3) NOT NULL,
  `login` varchar(35) NOT NULL,
  `clave` varchar(100) NOT NULL,
  `admin` int(1) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `tipo_doc` int(2) DEFAULT NULL,
  `documento` varchar(15) DEFAULT NULL,
  `estado` enum('activo','inactivo') DEFAULT NULL,
  `firma` varchar(255) DEFAULT NULL,
  `id_group` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `acc_usuario`
--

INSERT INTO `acc_usuario` (`id_usr`, `login`, `clave`, `admin`, `nombre`, `email`, `phone`, `tipo_doc`, `documento`, `estado`, `firma`, `id_group`) VALUES
(1, 'admin', 'a30e576eddb4876952e1e8dc4c73d569', 1, 'Carlos Alberto Torres Bedoya', 'coomocart@hotmail.com', '1', 1, '16220427', 'activo', '', 4),
(2, 'elicedi.betancur', 'e10adc3949ba59abbe56e057f20f883e', 0, 'Elicedi Betancur Giraldo', 'coomocart@hotmail.com', '3103965311', 1, '31435982', 'activo', NULL, 7),
(3, 'jancy.ortega', 'e10adc3949ba59abbe56e057f20f883e', 0, 'Jancy Dayana Ortega Patiño', 'coomocart@hotmail.com', '3103965311', 1, '1004134181', 'activo', NULL, 6),
(4, 'yesenia.carvajal', 'e10adc3949ba59abbe56e057f20f883e', 0, 'Yesenia Carvajal', 'coomocart@hotmail.com', '3103965311', 1, '31428184', 'activo', NULL, 1),
(5, 'paula.mejia', 'e10adc3949ba59abbe56e057f20f883e', 0, 'Paula Tatiana Mejía Salgado', 'coomocart@hotmail.com', '3103965311', 1, '31429133', 'activo', NULL, 2),
(6, 'dora.caicedo', 'e10adc3949ba59abbe56e057f20f883e', 0, 'Dora Ines Caicedo Giraldo', 'coomocart@hotmail.com', '3103965311', 1, '41945649', 'activo', NULL, 2),
(7, 'zulay.carpio', 'e10adc3949ba59abbe56e057f20f883e', 0, 'Zulay Carpio Zapata', 'coomocart@hotmail.com', '3103965311', 1, '31409771', 'activo', NULL, 2),
(8, 'claudia.ospina', 'e10adc3949ba59abbe56e057f20f883e', 0, 'Claudia Patricia Ospina Arboleda', 'coomocart@hotmail.com', '3103965311', 1, '31425633', 'activo', NULL, 2),
(9, 'claudia.serna', 'e10adc3949ba59abbe56e057f20f883e', 0, 'Claudia Maria Serna Gómez', 'coomocart@hotmail.com', '3103965311', 1, '31420755', 'activo', NULL, 3),
(10, 'claudia.vivas', 'e10adc3949ba59abbe56e057f20f883e', 0, 'Claudia Milena Vivas Zapata', 'coomocart@hotmail.com', '3103965311', 1, '31424450', 'activo', NULL, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actual_doc`
--

CREATE TABLE `actual_doc` (
  `id_act` int(5) NOT NULL,
  `fecha_ant` date NOT NULL,
  `fecha_new` date NOT NULL,
  `id_eps` int(5) NOT NULL,
  `id_conductor` int(5) NOT NULL,
  `usuario` varchar(25) NOT NULL,
  `fecha_elav` datetime NOT NULL,
  `id_doc` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aportes`
--

CREATE TABLE `aportes` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_movil` varchar(10) DEFAULT NULL,
  `aporte` double DEFAULT NULL,
  `fecha_aporte` date DEFAULT NULL,
  `estado` enum('activo','liquidado') DEFAULT NULL,
  `nrec` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cartera`
--

CREATE TABLE `cartera` (
  `id` int(11) NOT NULL COMMENT 'Consecutivo Cartera',
  `tipo` varchar(10) NOT NULL COMMENT 'FVEL - LP',
  `numero` varchar(20) NOT NULL COMMENT 'No Factura - Letra',
  `fecha` varchar(10) NOT NULL COMMENT 'Fecha Ini. Fact - Letra',
  `plazo` int(5) NOT NULL COMMENT 'Plazo',
  `vencimiento` varchar(10) NOT NULL COMMENT 'Fecha Vencimiento',
  `documento` varchar(10) NOT NULL COMMENT 'Documento Solicitante',
  `nombre` varchar(70) NOT NULL COMMENT 'Nombre Completo',
  `movil` int(4) NOT NULL COMMENT 'No Móvil',
  `mora` int(5) NOT NULL COMMENT 'Días de mora',
  `valor` double NOT NULL COMMENT 'Valor Total',
  `abono` double NOT NULL COMMENT 'Abonos',
  `saldo` double NOT NULL COMMENT 'Saldo Total',
  `cartera` varchar(50) NOT NULL COMMENT 'Cartera Reportada'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compania_poliza`
--

CREATE TABLE `compania_poliza` (
  `id_compoliza` int(5) NOT NULL,
  `nomcompa` varchar(40) NOT NULL,
  `nitcompa` varchar(15) NOT NULL,
  `npoliza` varchar(15) NOT NULL,
  `v_exclusion` float NOT NULL,
  `grupo` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comprobante`
--

CREATE TABLE `comprobante` (
  `id_comp` int(5) NOT NULL,
  `fecha_ante` date DEFAULT '0000-00-00',
  `fecha_nu` date DEFAULT '0000-00-00',
  `id_conductor` int(10) DEFAULT NULL,
  `usuario` varchar(25) DEFAULT NULL,
  `fecha_alavo` datetime DEFAULT NULL,
  `id_comprobante` varchar(10) DEFAULT NULL,
  `id_tran` int(5) DEFAULT NULL,
  `observaciones` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `comprobante`
--

INSERT INTO `comprobante` (`id_comp`, `fecha_ante`, `fecha_nu`, `id_conductor`, `usuario`, `fecha_alavo`, `id_comprobante`, `id_tran`, `observaciones`) VALUES
(1, '0000-00-00', '0000-00-00', 57, 'admin', '2021-02-06 10:48:47', '1', 1, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comp_egresos`
--

CREATE TABLE `comp_egresos` (
  `id_egreso` int(5) UNSIGNED ZEROFILL NOT NULL,
  `concepto` varchar(200) NOT NULL,
  `pagado_a` varchar(50) NOT NULL,
  `fecha_com` date NOT NULL,
  `valor_egreso` float NOT NULL,
  `usuario` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comp_servicio`
--

CREATE TABLE `comp_servicio` (
  `id_comp_serv` int(15) NOT NULL,
  `fecha` datetime NOT NULL,
  `usuario` varchar(20) DEFAULT '',
  `id_movil` varchar(5) NOT NULL,
  `placa` varchar(6) NOT NULL,
  `id_conductor` int(10) NOT NULL,
  `codigo` varchar(20) NOT NULL,
  `nombres` varchar(50) NOT NULL,
  `id_tarjeta` int(10) NOT NULL,
  `tarjeta` varchar(10) DEFAULT '',
  `id_tran` int(5) NOT NULL,
  `obs` varchar(100) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `concepto_pago`
--

CREATE TABLE `concepto_pago` (
  `id_con_pago` int(10) UNSIGNED NOT NULL,
  `detalle_concepto` varchar(60) DEFAULT NULL,
  `valor` bigint(20) DEFAULT NULL,
  `tipo` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conductor`
--

CREATE TABLE `conductor` (
  `id_conductor` int(10) NOT NULL,
  `codigo` varchar(20) DEFAULT NULL,
  `nombres` varchar(25) DEFAULT NULL,
  `apellidos` varchar(25) DEFAULT NULL,
  `direccion` varchar(35) DEFAULT NULL,
  `telefono` varchar(25) DEFAULT NULL,
  `fecha_nace` date DEFAULT '0000-00-00',
  `lugarNace` varchar(45) DEFAULT NULL,
  `anotaciones` text DEFAULT NULL,
  `tipo_rh` varchar(10) DEFAULT NULL,
  `acudiente` varchar(50) DEFAULT NULL,
  `telefonoa` varchar(30) DEFAULT NULL,
  `celulara` varchar(30) DEFAULT NULL,
  `eps` varchar(100) DEFAULT NULL,
  `arl` varchar(100) DEFAULT NULL,
  `emailc` varchar(100) DEFAULT NULL,
  `foto` varchar(20) DEFAULT NULL,
  `observacion` text DEFAULT NULL,
  `experiencia_laboral` varchar(50) DEFAULT NULL,
  `ispensionado` enum('si','no') DEFAULT 'no',
  `fecha_crea` date DEFAULT NULL,
  `afp` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `conductor`
--

INSERT INTO `conductor` (`id_conductor`, `codigo`, `nombres`, `apellidos`, `direccion`, `telefono`, `fecha_nace`, `lugarNace`, `anotaciones`, `tipo_rh`, `acudiente`, `telefonoa`, `celulara`, `eps`, `arl`, `emailc`, `foto`, `observacion`, `experiencia_laboral`, `ispensionado`, `fecha_crea`, `afp`) VALUES
(1, '1112762677', 'ADRIAN FERNANDO', 'HURTADO GONZALEZ', 'CALLE 10B # 14C-37', '3225682430', '1987-09-17', '', '', 'O+', '', '', '', 'S.O.S  ', 'POSITIVA', '', '1112762677.png', 'El vehículo MOVIL *** lo he recibido en calidad de arrendamiento, según contrato verbal que tengo con el (a) señor (a) ***********, a quien cancelo la suma diaria de $*******.oo, la cual es entregada en la ********* de la ciudad de ********.', '2008', 'no', '2021-05-22', NULL),
(2, '14565895', 'ADRIAN', 'HENAO OSPINA', 'TRANSV. 8 # 14-41', '3115446557', '1981-05-11', '', 'n/a', 'O+', '', '', '', 'S.O.S ', 'COLPATRIA', 'subejercolh1981@hotmail.com', '', 'El vehículo MOVIL *** lo he recibido en calidad de arrendamiento, según contrato verbal que tengo con el (a) señor (a) ***********, a quien cancelo la suma diaria de $*******.oo, la cual es entregada en la ********* de la ciudad de ********.', '2000', 'no', '2021-05-20', NULL),
(3, '14575422', 'ADRIAN', 'OCAMPO MURIEL', 'CRA 61A # 12-27', '3222947316', '1972-04-22', '', '', 'A+', '', '', '', 'COOSALUD ', 'SURATEP', 'adrianocampo2226@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(4, '6119677', 'ALDUVER', 'HEREDIA OSORIO', 'CRA 1 # 45-53', '3163523964', '1984-12-15', '', '', 'B+', '', '', '', 'S.O.S ', 'SURATEP', 'alduveroso6119677@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(5, '16221056', 'ALEJANDRO ', 'OROZCO SOTO', 'CRA 30 # 3B-50', '3217082583', '1967-07-05', '', '', 'O+', '', '', '', 'S.O.S', 'SURATEP', '2018alejandroorozco@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(6, '16230567', 'ALEXANDER', 'ALEXANDER', 'CALLE 20 N 5 130', '3113401627', '1975-10-02', '', '', 'O+', '', '', '', 'NUEVA EPS ', 'SURATEP', 'alexnegritodelson@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(7, '1112759351', 'ALEXANDER', 'YEPES ESCOBAR', 'CRA 11 # 9-40', '3106064919', '1986-07-01', '', '', 'O+', 'MARTHA LUCIA ESCOBAR', '3128252712', 'MADRE', 'S.O.S', 'POSITIVA', 'alex2008yepesescobar@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(8, '1113593074', 'ALEXIS FERNANDO ', 'ROBAYOS SANABRIA', 'CALLE 5 # 13-47', '3158106177', '1987-05-18', '', '', 'O+', 'FABIAN ANDRES ROBAYOS SANABRIA', '3154360041', 'HERMANO', 'SANITAS ', 'POSITIVA', 'alexisrobayos20@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(9, '2470353', 'ALIRIO DE JESUS ', 'GOMEZ OSORIO', 'KRA 14A # 13-75', '3214350562', '1961-05-22', '', '', 'O+', '', '', '', 'COOMEVA ', 'SURATEP', 'alirioj61@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(10, '17166603', 'ALVARO', 'ALMONACID PRIETO', 'CALLE 8 # 16-23', '3232230459', '1945-11-30', '', '', 'A+', '', '', '', 'PENSIONADO', 'COLPATRIA', 'alvaroalmonacid5@gmail.com', '', '', '', 'si', '0000-00-00', NULL),
(11, '16225240', 'ANCIZAR', 'MONTES SERNA', 'CRA 3 # 16-05', '3206832888', '1971-02-06', '', '', 'A+', '', '', '', 'S.O.S', 'SURATEP', 'coco_54@hotmail.com', '', '', '', 'no', '0000-00-00', NULL),
(12, '14566202', 'ANDRES FELIPE ', 'LOAIZA VIVAS', 'CRA 10 # 21-123', '3102087480', '1981-05-14', '', '', 'O+', '', '', '', 'S.O.S', 'COLPATRIA', 'afloaiza2011@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(13, '1112786826', 'ANDRES FELIPE ', 'LONDOÑO CAMONA', 'CALLE 2 # 6-45', '3225299084', '1996-02-28', '', '', 'A+', 'MARIA EUGENIA CARMONA', '3013348312', 'MADRE', 'SANITAS', 'SURATEP', 'alfelipecarmona@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(14, '1112774077', 'ANDRES FELIPE ', 'MEDINA QUICENO', 'CALLE 9A # 15-55', '3004876404', '1991-09-10', '', '', 'O+', '', '', '', 'CARTA PROPIETARIO / AUTORIZO GERENCIA', '', '', '', '', '', 'no', '0000-00-00', NULL),
(15, '1112794129', 'ANDRES FELIPE', 'TORRES CASTRILLON', 'CRA 15 # 7-07', '3113858340', '1999-09-25', '', '', 'O+', 'JHON JAIRO TORRES', '3135655293', 'PADRE', 'NUEVA EPS', 'SURATEP', 'andres1998torres@hotmail.es', '', '', '', 'no', '0000-00-00', NULL),
(16, '16217484', 'ANIBAL ', 'MURILLO MOSQUERA', 'CALLE 2A # 11E-20', '3136911637', '1963-12-17', '', '', 'O+', '', '', '', 'S.O.S', 'SURATEP', 'ximenamar927@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(17, '16400465', 'ARGEMIRO ', 'SEPULVEDA SEPULVEDA', 'CALLE 7 # 7-25 APTO 301', '3216030231', '1971-08-10', '', '', 'O+', 'MARIA NOHEMY MORALES', '3147454029', 'ESPOSA', 'COOSALUD', 'COLPATRIA', 'argemirosepulveda1971@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(18, '16204934', 'ARIEL ANTONIO ', 'RINCON DIAZ', 'CRA 12 # 16C-79', '3146658469', '1952-10-30', '', '', 'A+', '', '', '', 'PENSIONADO', 'SURATEP', 'arielrincon097@gmail.com', '', '', '', 'si', '0000-00-00', NULL),
(19, '16208265', 'ARIEL DE JESUS ', 'CATAÑO BLANDON', 'cra 11 # 16C-103', '3176748778', '1957-03-20', '', '', 'A+', '', '', '', 'S.O.S', 'COLPATRIA', 'arielcatano1957@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(20, '6481316', 'ARLES ANTONIO', 'ARIAS GIRALDO', 'CRA 2AN # 19-06', '3116123596', '1957-08-09', '', '', 'O+', 'MELANI ARIAS', '3215109352', 'HIJA', 'MEDIMAS', 'SURATEP', 'arlexarias44@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(21, '16231341', 'ARMANDO ', 'OSORIO MARIN', 'CRA 3 # 2-71', '3127444624', '1975-07-04', '', '', 'O+', '', '', '', 'COOMEVA', 'SURATEP', 'armandoosoriomarin12@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(22, '14569348', 'ARNIBAR IVAN', 'CRUZ MELLIZO', 'MAZ 25 CSA 349 EL TREBOL', '3154232290', '1983-09-22', '', '', 'A+', '', '', '', 'COOSALUD', 'POSITIVA', 'anicruz2209@hotmail.com', '', '', '', 'no', '0000-00-00', NULL),
(23, '16215577', 'ARTURO ', 'ALZATE ', 'CL 10 # 19-40', '3104399039', '1961-08-10', '', '', 'O+', '', '', '', 'DERECHO DE PETICION', '', 'arturoalzate921@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(24, '16208949', 'ARZULEY ANTONIO ', 'PINO TREJOS', 'CL 16C # 12-148', '3124817123', '1955-02-11', '', '', 'A+', '', '', '', 'S.O.S', 'POSITIVA', 'arzuley2019@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(25, '41931224', 'BEATRIZ HELENA', 'SALINAS GARCIA', 'CALLE 52 # 2-44', '3183269068', '1974-05-10', '', '', 'O+', '', '', '', 'SANITAS', 'COLPATRIA', 'salinasgarcias1974@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(26, '6280797', 'BEISLEN ANTONIO ', 'GARCIA LONDOÑO', 'CRA 3 # 1A-142', '3135297443', '1956-03-03', '', '', 'O+', 'YULIANA GARCIA', '3158921152', 'HIJA', 'S.O.S', 'SURATEP', '', '', '', '', 'no', '0000-00-00', NULL),
(27, '16204882', 'BERNARDO ', 'BARRERA MENDEZ', 'CALLE 49A # 31-24', '3207590979', '1953-02-03', '', '', 'A+', 'RUBIELA MONTENEGRO', '3104117641', 'ESPOSA', 'S.O.S', 'SURATEP', 'bernardobarreramendez@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(28, '16211905', 'CARLOS ALBEIRO', 'BERNAL RAMOS', 'MZ L CS 5 CORALIN PARTE ALTA ', '3113982177', '1959-11-07', '', '', 'O+', '', '', '', 'S.O.S', 'COLPATRIA', 'albeirobernal88@gmail', '', '', '', 'no', '0000-00-00', NULL),
(29, '16261919', 'CARLOS ALBERTO', 'CASTAÑO PALACIOS', 'CRA 15 # 12-45', '3105419858', '1959-10-23', '', '', 'A+', '', '', '', 'NUEVA EPS', 'SURATEP', 'catalina.98@hotmail.es', '', '', '', 'no', '0000-00-00', NULL),
(30, '16216170', 'CARLOS ALBERTO', 'TAMAYO HERNANDEZ', 'CRA 14 # 3-88', '3113354139', '1963-03-08', '', '', 'O+', '', '', '', 'DERECHO DE PETICION', '', 'carlosalbertotamayo78@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(31, '1112790074', 'CARLOS ALFREDO', 'GARCIA SOTO', 'CRA 1D # 43-39', '3234711821', '1997-07-09', '', '', 'O+', 'ARACELY SOTO', '3117692080', 'MADRE', 'S.O.S', 'COLPATRIA', 'jampool97@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(32, '16233024', 'CARLOS ANDRES', 'BUENO ARIAS', 'MZ B CS 24 EL POBLADO', '3168872531', '1977-12-11', '', '', 'A+', 'JULIETH LASPRILLA', '3234467610', 'ESPOSA', 'SANITAS', 'SURATEP', 'carlosandres7712@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(33, '1059784970', 'CARLOS ANDRES ', 'ECHEVERRI ARENAS', 'EL POBLADO MZ B CS 23', '3123398033', '1988-12-25', '', '', 'O+', '', '', '', 'S.O.S', 'SURATEP', 'carlosnadresecheveriarenas@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(34, '70517315', 'CARLOS ARTURO', 'BLANDON BUILES', 'CRA 2N # 17-35', '3205286942', '1964-05-10', '', '', 'O+', '', '', '', 'AMBUQ', 'SURATEP', 'carblabu123@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(35, '16207255', 'CARLOS EDUARDO ', 'RAMIREZ ZAPATA', 'CRA 18 # 1-85', '3172202848', '1956-09-12', '', '', 'O+', '', '', '', 'COOSALUD', 'POSITIVA', 'cjulito289@hotmail.com', '', '', '', 'no', '0000-00-00', NULL),
(36, '16222847', 'CARLOS EVELIO', 'ALVAREZ ZAPATA', 'CALLE 12A # 4-24', '3154271587', '1966-02-28', '', '', 'B+', '', '', '', 'S.O.S', 'SURATEP', 'carlos2017alvarez20@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(37, '71618815', 'CARLOS MARIO', 'ESTRADA MAYA', 'CRA 58 # 11-01', '3136798235', '1961-12-14', '', '', 'O+', '', '', '', 'COOMEVA', 'SURATEP', 'marioestrada1401@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(38, '16214969', 'CARLOS TULIO', 'ZULUAGA RAMIREZ', 'CRA 6 # 1A-20', '3103515687', '1962-05-04', '', '', 'O+', '', '', '', 'S.O.S', 'POSITIVA', 'carlostuliozuluagaramirez@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(39, '6244672', 'CENON ', 'TAMAYO MONTOYA', 'CR 60 # 11-66', '3104475960', '1951-03-26', '', '', '', '', '', '', 'S.O.S', 'COLPATRIA', 'senontamayo@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(40, '6240101', 'CESAR AUGUSTO', 'GALLEGO CASTAÑO', 'CRA 6N # 33-75', '3002076922', '1979-08-13', '', '', 'O+', 'GLORIA NANCY CASTAÑO', '3138195194', 'MADRE', 'COOSALUD', 'POSITIVA', 'gallegocesar29@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(41, '16220879', 'CESAR AUGUSTO ', 'MARLES VICTORIA', 'CRA 10 # 17-22', '3115279506', '1967-06-20', '', '', 'O+', '', '', '', 'NUEVA EPS', 'SURATEP', 'alsamarvic@hotmail.com', '', '', '', 'no', '0000-00-00', NULL),
(42, '16226260', 'CESAR AUGUSTO', 'MURILLO RAMIREZ', 'CRA 2 # 14-47', '3122012575', '1972-01-11', '', '', 'O+', 'OFELIA RAMIREZ', '3164493938', 'MADRE', 'S.O.S', 'COLPATRIA', 'cm4944635@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(43, '6119855', 'CHRISTIAN FERNANDO ', 'LOPEZ CARO', 'CRA 6 # 19-81', '3175960779', '1985-09-29', '', '', 'O+', 'ROSAURA CARO LOPEZ', '3188297014', 'MADRE', 'S.O.S', 'COLPATRIA', 'cristoer@hotmail.com', '', '', '', 'no', '0000-00-00', NULL),
(44, '1094903210', 'CRISTHIAN DAVID', 'GRISALES LONDOÑO', 'CALLE 52 # 2-44', '3146603357', '1989-02-25', '', '', 'O+', 'TATIANA GONZALEZ', '3195997041', 'ESPOSA', 'SANITAS ', 'COLPATRIA', 'cris.grisa89@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(45, '16213465', 'DAGOBERTO', 'ECHEVERRY SERNA', 'CALLE 18 # 4-48', '3123623619', '1961-04-15', '', '', 'A+', '', '', '', 'SANITAS', 'SURATEP', 'edagoberto1961@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(46, '1112787659', 'DAVISON', 'USGAME ECHAVARRIA', 'CALLE 15 # 15A-15', '3177792399', '1996-04-27', '', '', 'O+', '', '', '', 'NUEVA EPS', 'SURATEP', 'davisonusgame10@hotmail.com', '', '', '', 'no', '0000-00-00', NULL),
(47, '92030972', 'DAY LUIS ', 'CASTRO CASTRO', 'CIUDADELA DE PAZ MZ 7 CS11', '3137776156', '1975-07-01', '', '', 'A+', '', '', '', 'NUEVA EPS', 'COLPATRIA', 'dayluiscastrocastro1@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(48, '16230730', 'DEISON JAVIER', 'SALAZAR RODRIGUEZ', 'CRA 21 # 5-33', '3206445518', '1976-01-25', '', '', 'O+', '', '', '', 'S.O.S', 'SUARETP', 'deison2514@hotmail.com', '', '', '', 'no', '0000-00-00', NULL),
(49, '16226966', 'DIDIER', 'BEDOYA ESCOBAR', 'CRA 1A # 23-57', '3216592723', '1972-03-24', '', '', 'A+', '', '', '', 'S.O.S ', 'SURATEP', 'didierbedoya09@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(50, '18507787', 'DIDIER ', 'MORALES CARDONA', 'CRA 13A # 13-90', '3184430671', '1969-03-23', '', '', 'O+', '', '', '', 'COOMEVA', 'SURATEP', 'samsungprime1090@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(51, '16217729', 'DIDIER YONEL ', 'MONTES QUINTERO', 'CALLE 9 # 9-35', '3118991852', '1964-10-01', '', '', 'A+', '', '', '', 'COOMEVA', 'SURATEP', 'didier12@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(52, '1112774717', 'DIEGO ALEXANDER ', 'GOMEZ OSORIO', 'CALLE 6A # 15B-96', '3203441676', '1991-11-28', '', '', 'O+', 'DARNELLY GRANADA', '3122515102', 'MADRE', 'S.O.S', 'COLPATRIA', 'diegogomezosorio@hotmail.com', '', '', '', 'no', '0000-00-00', NULL),
(53, '14565903', 'DIEGO FERNANDO ', 'CASTRILLON ARIAS', 'CRA 27 # 2A-36', '3135864960', '1981-05-23', '', '', 'O-', 'LUZ ELENA MORALEZ', '3113730125', 'ESPOSA', 'COOSALUD', 'SURATEP', '', '', '', '', 'no', '0000-00-00', NULL),
(54, '1112761250', 'DIEGO FERNANDO ', 'GUARIN CORTES', 'CALLE 4 # 27-15', '3147618212', '1986-09-06', '', '', 'O+', '', '', '', 'S.O.S ', 'COLPATRIA', 'diegofernandoguarin59@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(55, '6111613', 'DIEGO ', 'MEJIA', 'CRA 12 # 8-67', '3146017871', '1968-07-08', '', '', 'A+', '', '', '', 'COOMEVA ', 'COLPATRIA', 'diegofernandomejia1968@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(56, '16221972', 'DIEGO ', 'SALAZAR ALVAREZ', 'TRANSV. 1C #T1C-64', '3226321118', '1965-11-20', '', '', 'O+', '', '', '', 'COOSALUD', 'COLPATRIA', 'diegosalazaralvarez012@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(57, '16225806', 'DIEGO         ', 'SARMIENTO MARIN          ', 'CALLE 1E # 3-16', '3122117007', '1971-06-12', '', '', 'O+', '', '', '', 'AMBUQ', 'SURATEP', 'diegosarmiento1971@hotmail.com', '', '', '', 'no', '0000-00-00', NULL),
(58, '10009310', 'DIEGO ', 'URIBE MONTAÑO', 'CALLE 9 # 19-51', '3137924218', '1976-05-11', '', '', 'A+', '', '', '', 'BARRIOS UNIDOS ', 'SURATEP', 'diegouribetaxi@hotmail.com', '', '', '', 'no', '0000-00-00', NULL),
(59, '1116254166', 'EDIER FERNANDO ', 'RIOS MUÑOZ', 'BOSQUE LOS LAGOS MZ 7 CS 21', '3167309395', '1992-03-28', '', '', 'O+', '', '', '', 'COOMEVA ', 'COLPATRIA', 'fernandorios@hotmail.com', '', '', '', 'no', '0000-00-00', NULL),
(60, '18606652', 'EDISON ', 'DURAN PATIÑO', 'MZ 9 CS 12 JOSE GABRIEL CALDERON', '3174983519', '1974-06-10', '', '', 'O+', '', '', '', 'COOSALUD ', 'COLPATRIA', 'edisonduranp@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(61, '9698083', 'EDUARDO ANTONIO', 'QUIROZ MONTOYA', 'MAZ 7 CS 2 JOSE GABRIEL CALDERON', '3127059838', '1982-10-23', '', '', 'O-', 'ALBA RUBI CORREA', '3175134596', 'ESPOSA', 'SALUD TOTAL', 'SURATEP', 'quirozmontoyaeduardo@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(62, '14568451', 'EDUARDO FABIO ', 'PARRA MORENO', 'CRA 15A # 15A-83', '3137706198', '1982-10-28', '', '', 'A+', 'BALBANERA MORENO', '3105408484', 'MADRE', 'COOMEVA', 'COLPATRIA', 'eduardo14568451@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(63, '94497029', 'EDWIN ARNULFO', 'GIRALDO ALVAREZ', 'CRA 2N # 52-34', '3105799603', '1977-02-13', '', '', 'O+', '', '', '', 'SANITAS', 'SURATEP', 'edwing-0213@hotmail.com', '', '', '', 'no', '0000-00-00', NULL),
(64, '14569500', 'ERSON ARLEY ', 'CORTES SUAREZ', 'CALLE 3BIS # 3-37', '3165123077', '1982-11-10', '', '', 'A+', 'LINA MARIA PESCADOR', '3106327730', 'ESPOSA', 'COOMEVA', 'SURATEP', 'jadecortes34@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(65, '16221204', 'ENRIQUE', 'HOYOS GONZALEZ', 'CRA 4CN # 41B-69', '3152573959', '1967-09-12', '', '', 'O+', 'MARTHA GIRALDO', '3117185153', 'ESPOSA', 'COOSALUD', 'COLPATRIA', 'kikehoyos50@outlook.com', '', '', '', 'no', '0000-00-00', NULL),
(66, '1006320970', 'FABIAN ANDRES', 'GARCIA GARCIA', 'Calle 2 # 30C-16', '3135106165', '2002-03-25', '', '', 'O+', 'MARIA EUNICE GARCIA', '3188750872', 'MADRE', 'NUEVA EPS', 'COLPATRIA', 'fabiangarcia.p.760@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(67, '1113594080', 'FABIAN ANDRES ', 'ROBAYOS SANABRIA', 'TRANSV 8 # 13A-06', '3154360041', '1990-12-22', '', '', 'O+', 'ALEXIS ROBAYOS', '3158106177', 'HERMANO', 'SANITAS', 'POSITIVA', 'andresfabian1567@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(68, '16222435', 'FABIO ALBERTO', 'AGUDELO', 'Calle 12 # 11-21', '3184244351', '1967-12-08', '', '', 'O+', '', '', '', 'SANITAS ', 'POSITIVA', 'fabioagu1303@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(69, '16224713', 'FABIO ANTONIO ', 'CARDONA ECHEVERRY', 'CRA 1H # 39F-50', '3186687987', '1968-10-12', '', '', 'B+', 'JAZMIN CARDONA', '3104593995', 'ESPOSA', 'COOMEVA', 'LA EQUIDAD', 'fabiocrdona@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(70, '9956355', 'FABIO DE JESUS ', 'MARULANDA POSADA', 'CRA 7 # 3-44', '3217090119', '1971-02-05', '', '', 'O-', 'RIGOBERTO MARULANDA', '3206839095', 'HERMANO', 'NUEVA EPS ', 'SURATEP', 'fabiomarulanda950@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(71, '16219855', 'FERNANDO ', 'CARDONA BEDOYA', 'calle 14A # 13-17', '3185588040', '1966-08-05', '', '', 'A+', '', '', '', 'SANITAS ', 'SURATEP', 'ferchocarbe55@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(72, '1112774951', 'FERNANDO ', 'PELAEZ OSORIO', 'CLLE 8 # 16A-31', '3103865698', '1991-12-22', '', '', 'O+', '', '', '', 'COOSALUD', 'COLPATRIA', 'yodel12-22@hotmail.com', '', '', '', 'no', '0000-00-00', NULL),
(73, '6245026', 'FRANCISCO ELIECER', 'CHALARCA VILLADA', 'CRA 62A # 12-59', '3214603039', '1967-09-07', '', '', 'O+', 'SINDY PAOLA CHALARCA', '3116540702', 'HIJA', 'NUEVA EPS', 'SURATEP', 'chalarcaeliecer@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(74, '14567040', 'FRANCISCO JAVIER ', 'CASTAÑO CASTAÑEDA', 'CRA 8 # 4-71 CS 5', '3103893964', '1982-03-16', '', '', 'O+', '', '', '', 'COOMEVA', 'SURATEP', 'pachocastano117@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(75, '94262627', 'FRANCISCO JAVIER ', 'SALAZAR GIRALDO', 'CRA 3GN # 21-29', '3182960620', '1972-09-02', '', '', 'O+', 'GLORIA PATRICIA BLANDON', '3206862866', 'ESPOSA', 'S.O.S', 'COLPATRIA', 'javiersalazargiraldo@hotmail.com', '', '', '', 'no', '0000-00-00', NULL),
(76, '16204363', 'GERARDO ANTONIO', 'GONZALEZ', 'CRA 11 # 11A-43', '3155061746', '1952-05-08', '', '', 'O+', '', '', '', 'S.O.S', 'COLPATRIA', '', '', '', '', 'no', '0000-00-00', NULL),
(77, '6134227', 'GERMAN ', 'MARTINEZ FRANCO', 'CALLE 36 # 9N-03', '3122581495', '1957-03-07', '', '', 'A+', '', '', '', 'S.O.S', ' POSITIVA', 'germanmartinezfranco047@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(78, '1126418431', 'GIAN CARLOS', 'MEZA CALLE', 'CALLE 27A # 2-56', '3166865005', '1985-02-04', '', '', 'A+', '', '', '', 'SANITAS', 'COLPATRIA', 'giancarlosmezacalle@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(79, '4602864', 'GILBERTO ANTONIO', 'ARDILLA JARAMILLO', 'CRA 16A # 11B-87', '3116375828', '1958-03-19', '', '', 'B+', 'MARIA AURORA ARDILA', '3137083101', 'HERMANA', 'BARRIOS UNIDOS', 'COLPATRIA', 'ardilajaramilloberto@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(80, '6361101', 'GILBERTO', 'CASANOVA DIAZ', 'CALLE 4B # 10-131', '3122698815', '1963-11-24', '', '', 'O+', '', '', '', 'COOMEVA', 'SURATEP', 'gilbertocasanova70@mail.com', '', '', '', 'no', '0000-00-00', NULL),
(81, '4860009', 'GILDARDO ', 'ESCOBAR SANCHEZ', 'CRA 4 # 24-197', '3137904995', '1967-06-11', '', '', 'A+', 'MERY VILLA', '3137014937', 'CUÑADA', 'MEDIMAS ', 'SURATEP', '', '', '', '', 'no', '0000-00-00', NULL),
(82, '4380809', 'GONZALO', 'OSPINA TORRES', 'CRA 4 # 24-19', '3128850174', '1977-01-09', '', '', 'o+', 'LILIANA SANCHEZ', '3137487517', 'ESPOSA', 'S.O.S', 'SURATEP', 'skahvjrkie@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(83, '1114088789', 'GUILLERMO ANDRES', 'ALVARES GRISALES', 'CALLE 12 # 11-57', '3217044885', '1986-10-04', '', '', 'A-', '', '', '', 'COOMEVA', 'POSITIVA', 'viuz1004@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(84, '16226453', 'GUILLERMO ANTONIO', 'GOMEZ SALAZAR', 'CALLE 18 #3AN-05', '3128359814', '1972-06-27', '', '', 'O+', 'NORALBA OBANDO', '3127694331', 'ESPOSA', 'NUEVA EPS', 'SURATEP', 'memog8227@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(85, '4860217', 'GUILLERMO DE JESUS ', 'JIMENEZ HENAO', 'CIUDADELA CONFANDI M3 C15', '3213256972', '1970-03-20', '', '', 'O+', '', '', '', 'SANITAS', 'LA EQUIDAD', 'henaoguillermo01@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(86, '16219806', 'GUILLERMO JAVIER ', 'HERNANDEZ BUITRAGO', 'CRA 61 # 15A-57', '3105290381', '1966-07-13', '', '', 'O-', '', '', '', 'COOSALUD', 'SURATEP', 'guillermojavierhernandezbuitra@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(87, '6280484', 'GUILLERMO LEON ', 'GIRALDO ECHEVERRY', 'VILLA DEL ROBLE MZ 8 CS 5', '3108225077', '1955-11-11', '', '', 'O-', '', '', '', 'sanitas', 'colpatria', 'guillermogiraldo0484@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(88, '16213397', 'GUILLERMO ', 'PINEDA SANCHEZ', 'Cra 4 # 17-39', '3148053924', '1961-03-26', '', '', 'O+', '', '', '', 'S.O.S', 'COLPATRIA', '', '', '', '', 'no', '0000-00-00', NULL),
(89, '18592141', 'GUSTAVO ADOLFO ', 'OSSA GOMEZ', 'CR 2N #  52-27', '3128974028', '1964-08-13', '', '', '', '', '', '', 'S.O.S', 'SURATEP', 'gaos789@hotmail.com', '', '', '', 'no', '0000-00-00', NULL),
(90, '1112763386', 'GUSTAVO ADOLFO ', 'RENDON RODRIGUEZ', 'CR 4 # 2E-86', '3117551248', '1988-01-21', '', '', 'A-', '', '', '', 'COLSANITAS', 'POSITIVA', 'gustavocata176@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(91, '6275040', 'GUSTAVO DE JESUS', 'RENDON GIL', 'CRA 4 # 1A-68 PTE BLANCO', '3128341080', '1960-07-22', '', '', 'O+', '', '', '', 'S.O.S', 'SURATEP', 'gustavorendon1960@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(92, '16210194', 'GUSTAVO', 'GOMEZ HERRERA', 'CALLE 27 # 3B-22', '3183584332', '1956-05-28', '', '', 'A+', '', '', '', 'NUEVA EPS', 'SURATEP', '', '', '', '', 'no', '0000-00-00', NULL),
(93, '19290335', 'GUSTAVO ', 'LOPEZ RIOS', 'CRA 8 # 33-211 ', '3127464463', '1956-05-13', '', '', 'A+', '', '', '', 'NUEVA EPS', 'POSITIVA', 'glopezrios13@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(94, '1112772211', 'HAMILTON FERNANDO ', 'PEÑARANDA CARDENAS', 'CRA 1B # 40-42', '3226336645', '1991-02-04', '', '', 'A+', 'ANA MARIA ALVAREZ', '3222864436', 'COMPAÑERA', 'NUEVA EPS', 'SURATEP', 'toroderoca_6.78@hotmail.com', '', '', '', 'no', '0000-00-00', NULL),
(95, '16230260', 'HECTOR DARIO', 'LOPEZ ZAPATA', 'B/Lagos M6 C42', '3183938083', '1975-09-18', '', '', 'O+', 'JUAN FELIPE ROJAS', '3176357104', 'HIJASTRO', 'S.O.S', 'POSITIVA', 'hectordariolz245@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(96, '14567648', 'HECTOR FABIAN ', 'MUNERA RESTREPO', 'MZ 6 CS 6 LOS ANGELES', '3165795106', '1982-09-17', '', '', 'O+', '', '', '', 'S.O.S', 'SURATEP', 'gusa1782@hotmail.com', '', '', '', 'no', '0000-00-00', NULL),
(97, '6273560', 'HECTOR HUMBERTO', 'ESCOBAR MUÑOZ', 'CRA 2A # T1-130', '3229556014', '1962-06-22', '', '', 'O+', '', '', '', 'S.O.S', 'SURATEP', 'hectorescobar123720@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(98, '6482386', 'HECTOR JAIRO', 'VARGAS ESPINOSA', 'CRA 22D # 4A-08', '3103438340', '1969-10-02', '', '', 'O+', 'SEBASTIAN VARGAS', '3127100152', 'HIJO', 'S.O.S', 'COLPATRIA', 'hectorjagarcia@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(99, '19196763', 'HECTOR ', 'PINZON', 'CRA 1 # 28-36', '3173219993', '1953-03-04', '', '', 'A+', '', '', '', 'S.O.S-PENSIONADO-', 'SURATEP', 'hectorpino012@gmail.com', '', '', '', 'si', '0000-00-00', NULL),
(100, '16231085', 'HENRY ', 'ZAPATA GOMEZ', 'cra 13 # 16D-58', '3127510261', '1976-07-15', '', '', 'O+', 'LINA MARCELA FUENTES', '3103742012', 'MADRE', 'S.O.S', 'COLPATRIA', 'henrysansumg18@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(101, '16210379', 'HERNANDO ', 'BARRIOS POSSO', 'CRA 13C # 14A-82', '3117296730', '1959-06-02', '', '', 'O+', '', '', '', 'SANITAS', 'SURATEP', 'hernandobarriosposo@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(102, '1112768752', 'HEYSON ', 'PINEDA AGUDELO', 'EL JUBILEO MZ L CS 20', '3107286982', '1989-12-04', '', '', 'O+', '', '', '', 'S.O.S', 'SURTAEP', 'yeyesion.2002@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(103, '16218451', 'HOLMES ', 'RAMIREZ ROMAN', 'CRA 3 # 2-128', '3214972138', '1964-12-01', '', '', 'O+', '', '', '', 'S.O.S', 'COLPATRIA', 'holmesramirez54@hotmail.com', '', '', '', 'no', '0000-00-00', NULL),
(104, '15960480', 'HUBIEL DE JESUS', 'LOPEZ VARGAS', 'CALLE 5 # 29-67', '3214062699', '1973-06-30', '', '', 'A+', '', '', '', 'COOSALUD', 'COLPATRIA', 'hubieldejesuslopez@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(105, '2459893', 'HUMBERTO ', 'IBARRA HERNANDEZ', 'CR 6 # 14A-161', '3113254937', '1954-11-29', '', '', 'A+', '', '', '', 'PENSIONADO-DERECHO DE PTICION', '', 'humbertoibarra002@hotmail.com', '', '', '', 'si', '0000-00-00', NULL),
(106, '16200138', 'ISRAEL DE JESUS ', 'HENAO JARAMILLO', 'CRA 15 # 1T-119', '3207415820', '1947-06-30', '', '', 'O+', '', '', '', 'COOSALUD', 'COLPATRIA', '', '', '', '', 'no', '0000-00-00', NULL),
(107, '2470835', 'IVAN ', 'RAMIREZ ZULUAGA', 'CRA 1 # 18-32', '3225978897', '1962-02-06', '', '', 'O+', '', '', '', 'AUTORIZADO GERENCIA', '', 'ir558365@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(108, '16233836', 'JAIME ALONSO ', 'ZAPATA MARIN', 'MZ 5- CS 13 LA CABAÑA', '3226751156', '1978-06-26', '', '', 'O+', '', '', '', 'S.O.S', 'COLPATRIA', 'jaime44zapata@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(109, '6526654', 'JAIR ALEXANDER ', 'GALLEGO RINCON', 'MZ A CS 6 EL LIMONAR', '3128207991', '1983-07-16', '', '', 'O+', '', '', '', 'S.O.S', 'SURATEP', 'monogallego654@hotmail.com', '', '', '', 'no', '0000-00-00', NULL),
(110, '16217337', 'JAIRO ', 'GIRALDO RODRIGUEZ', 'CRA 9BN # 17A-22', '3148874844', '1963-12-21', '', '', 'A+', '', '', '', 'SANITAS ', 'COLPATRIA', 'jairo.giraldo.rodriguez.@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(111, '16212199', 'JAMES HUMBERTO ', 'POSSO FRANCO', 'CALLE 20C # 13N-59', '3013111344', '1958-09-20', '', '', 'O+', 'GLORIA ELENA BEDOYA', '3137176833', 'ESPOSA', 'COOSALUD', 'COLPATRIA', 'pozofrancojames@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(112, '14565956', 'JANIER ', 'SANCHEZ GALLEGO', 'CALLE 9 # 12-20', '3122477505', '1981-05-09', '', '', 'O+', '', '', '', 'S.O.S', 'SURATEP', 'sanchezpachogallego81@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(113, '16137256', 'JAVIER ANDRES', 'LOAIZA HENAO', 'CALLE 17 # 5-71', '3135012478', '1970-11-30', '', '', 'A+', '', '', '', 'SURA', 'SURA', 'javierloaiza1970@hotmail.com', '', '', '', 'no', '0000-00-00', NULL),
(114, '16203441', 'JAVIER ANTONIO ', 'GARCIA GARCIA', 'Cra 2 # 1B-18', '3126329316', '1950-11-18', '', '', 'O+', '', '', '', 'PENSIONADO', 'SURATEP', 'javierantoniogarcia50@hotmail.com', '', '', '', 'si', '0000-00-00', NULL),
(115, '16210818', 'JAVIER DE JESUS ', 'HOLGUIN OSPINA', 'CRA 11N # 36-07A', '3163292808', '1958-10-20', '', '', 'A+', '', '', '', 'S.O.S', 'SURATEP', 'javierdejesusholguin@hotmail.com', '', '', '', 'no', '0000-00-00', NULL),
(116, '4859501', 'JAVIER HUMBERTO ', 'RIOS LOPEZ', 'CL 2 # 5-44', '3127216821', '1956-02-24', '', '', 'O+', 'NASLY HELEN RIOS', '3207183169', 'HERMANA', 'S.O.S', 'SURATEP', '', '', '', '', 'no', '0000-00-00', NULL),
(117, '19144110', 'JESUS ALBEIRO ', 'FRANCO ARENAS', 'TRANSV. 4C # 16-14', '3143026761', '1951-01-21', '', '', 'O+', '', '', '', 'MEDIMAS', 'SURATEP', 'albeirofarenas@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(118, '6131358', 'JESUS ALIRIO ', 'QUINTERO HENAO', 'CALLE32 #7CN-16', '3115939686', '1966-07-27', '', '', 'O+', '', '', '', 'SANITAS', 'SURATEP', 'alirioquim31@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(119, '16228931', 'JESUS AMADOR ', 'CORTES ALVAREZ', 'CRA 6 # 14-69', '3137042895', '1974-07-31', '', '', 'O-', '', '', '', 'COOSALUD', 'SURATEP', 'amador4733@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(120, '16210988', 'JESUS ANTONIO ', 'SALAZAR GOMEZ', 'VILLA DEL ROBLE MZ 1 CS3', '3163886889', '1959-09-28', '', '', 'O+', '', '', '', 'S.O.S', 'SURATEP', 'juanfeosalazar@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(121, '16224470', 'JESUS EDUARD', 'MARTINEZ', 'CALLE 3A # 30-70', '3136103873', '1970-08-06', '', '', 'A+', 'CESAR AUGUSTO GIRALDO', '3216282796', 'ALLEGADO', 'NUEVA EPS', 'SURATEP', 'taxmartines503r@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(122, '2474352', 'JESUS ERNESTO ', 'SALAZAR OLIVAR', 'CALLE 22B # 3DN-22', '3164213285', '1979-12-18', '', '', 'O+', '', '', '', 'COOMEVA', 'SURATEP', 'jernestosalazar616@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(123, '18595614', 'JESUS HILDEBRANDO ', 'AGUDELO GALEANO', 'CRA 5N # 22B-04', '3103952707', '1969-06-06', '', '', 'A+', '', '', '', 'COOMEVA', 'SURATEP', 'agudelojesus518@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(124, '16223852', 'JESUS HUMBERTO ', 'RESTREPO YEPES', 'LOS GIRASOLES MZ F CS 1', '3234937283', '1969-10-13', '', '', 'O+', '', '', '', 'COOSALUD', 'SURATEP', 'olgacubillos72@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(125, '16214118', 'JESUS MARIA ', 'CIFUENTES PATIÑO', 'CALLE 35 # 1G-14', '3136042134', '1961-09-29', '', '', 'A+', '', '', '', 'SANITAS ', 'POSITIVA', 'jesusmariacifuentes6@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(126, '5819577', 'JHON ALEXANDER', 'GUTIERREZ MARIN', 'CALLE 7 # 7 - 54 ', '3506701091', '1979-09-18', '', '', 'O+', 'YANET TORRES', '3209141094', 'ESPOSA', 'COOMEVA ', 'COLPATRIA', 'jhongutierrez1919@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(127, '1112773446', 'JHON EDISON', 'IBARRA DUQUE', 'CRA 11 # 5B-84', '3057045533', '1991-05-10', '', '', 'O+', '', '', '', 'COOSALUD', 'SURATEP', 'edi_77@hotmail.com', '', '', '', 'no', '0000-00-00', NULL),
(128, '1112793562', 'JHON EDWIN', 'ARREDONDO MOLINA', 'CRA 16 # 9-17', '3216383561', '1999-05-02', '', '', 'O+', 'YULISA CARDONA', '3117959563', 'ESPOSA', 'COOSALUD', 'COLPATRIA', 'arredondojhonedwin@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(129, '14568080', 'JHON FERNEY ', 'GIRALDO OSORIO', 'CALLE 5 # 17-52 APTO 3', '3184198989', '1982-03-24', '', '', 'O+', '', '', '', 'S.O.S', 'SURAETEP', 'jhonferneygiraldo@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(130, '16228312', 'JHON FREDY ', 'VALENCIA CALVO', 'CRA 2D # 29-57', '3113272454', '1973-12-11', '', '', 'O-', '', '', '', 'S.O.S', 'SURATEP', 'freddyvaca1973@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(131, '16233690', 'JHON JAIRO ', 'ALVAREZ HERNANDEZ', 'CRA 4 # 2-86', '3212769460', '1978-06-22', '', '', 'O+', '', '', '', 'S.O.S', 'SURATEP', 'jhon-2278@hotmail.com', '', '', '', 'no', '0000-00-00', NULL),
(132, '16780112', 'JHON JAIRO ', 'CARVAJAL TORRES', 'CRA 63 # 13A-10', '3157536234', '1969-09-24', '', '', 'O+', '', '', '', 'NUEVA EPS', 'POSITIVA', 'jhoncarvajalcjm@hotmail.com', '', '', '', 'no', '0000-00-00', NULL),
(133, '6241319', 'JHON JAIRO ', 'OSORIO', 'CL 2 # 2-59', '3117803089', '1979-09-19', '', '', 'A+', '', '', '', 'S.O.S', 'SURATEP', 'john_319@hotmail.com', '', '', '', 'no', '0000-00-00', NULL),
(134, '94274046', 'JHON JAIRO ', 'RINCON RINCON', 'CRA 14A # 16D-37', '3188236276', '1973-02-13', '', '', 'O+', '', '', '', 'COOMEVA', 'SURATEP', 'jhonjairorinconrincon2@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(135, '16231543', 'JHON JAIRO ', 'TORRES GONZALEZ', 'CRA 15 # 7-07', '3135655293', '1974-10-05', '', '', 'O+', '', '', '', 'NUEVA EPS ', 'SURATEP', 'jhonjj2099@hotmail.com', '', '', '', 'no', '0000-00-00', NULL),
(136, '18513264', 'JHON MANUEL', 'HOLGUIN LONDOÑO', 'CALLE 2 # 6-16', '3206607909', '1975-01-02', '', '', 'A+', 'MARCELA HOLGUIN', '3106056201', 'HERMANA', 'COOSALUD ', 'COLPATRIA', 'jhonholguin2323@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(137, '1112768738', 'JHON MARLON ', 'CARDONA LOZANO', 'CRA 1D # 40A-27', '3226655405', '1989-10-24', '', '', 'O+', 'ANA MARIA ARIAS', '3226206909', 'NOVIA', 'COOMEVA', 'COLPATRIA', 'jhonmarlon567@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(138, '1127951070', 'JOHAN SEBASTIAN', 'ARIAS ACEVEDO', 'MAZ F CASA 5 LOS ROSALES', '3186587153', '1994-11-16', '', '', 'O+', 'DORIS SOFIA PAEZ', '3146358398', 'ESPOSA', 'S.O.S', 'SURATEP', 'jsaa-7-@hotmail.com', '', '', '', 'no', '0000-00-00', NULL),
(139, '87940352', 'JOHN FREDY ', 'ARIAS CASTAÑO', 'CALLE 11B # 12A-161', '3206664590', '1980-02-20', '', '', 'A+', 'LILIANA LOPEZ BEDOYA', '3137349359', 'ESPOSA', 'SANITAS', 'SURATEP', 'fredy09arias@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(140, '10119427', 'JOHN JAIRO', 'MARIN CARDENAS', 'MZ 6 CS9 LOS ANGELES', '3103688873', '1964-09-05', '', '', 'A+', 'LUZ ANDREA CEBALLOS MORALES', '3128156600', 'ESPOSA', 'SANITAS', 'COLPATRIA', 'jhonmarincardenas2016@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(141, '14568597', 'JOHNIER ADRIAN', 'ISAZA DUQUE', 'CRA 9 # 12-156', '3117312319', '1983-01-08', '', '', 'O+', 'OSCAR ISAZA', '3117367174', 'HERMANO', 'S.O.S', 'COLPATRIA', 'jaid83@hotmail.com', '', '', '', 'no', '0000-00-00', NULL),
(142, '14568356', 'JOHNIER DE JESUS ', 'OCAMPO GONZALEZ', 'CRA 3N # 17-54', '3229153755', '1982-04-23', '', '', 'B+', '', '', '', 'S.O.S', 'COLPATRIA', 'jonhierocampo1989@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(143, '16804235', 'JONATAN ', 'MILLAN JIMENEZ', 'CRA 10 # 12-70', '3113826032', '1984-08-24', '', '', 'A+', 'SANDRA JIMENEZ', '3206364569', 'PRIMA', 'S.O.S', 'SURATEP', 'millanjimenez85@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(144, '1112760966', 'JONATHAN', 'BARCO ALVAREZ', 'CALLE 3 # 8-01', '3213308373', '1985-03-08', '', '', 'O+', '', '', '', 'S.O.S', 'SURATEP', 'jonathanbarco@hotmail.com', '', '', '', 'no', '0000-00-00', NULL),
(145, '1112771617', 'JONATHAN STEVEN ', 'TORO TAMAYO', 'MZ H CS 27 MONTE ESMERALDA', '3154660879', '1990-01-30', '', '', 'A+', '', '', '', 'SANITAS', 'SURATEP', 'jonathansteventorotamayo@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(146, '14571607', 'JORGE BANDERLEY ', 'OSORIO VALENCIA', 'MZ 3 CS 16  CIUDADELA COMFANDI', '3182171900', '1985-06-09', '', '', 'O+', '', '', '', 'COOSALUD', 'COLPATRIA', 'jorbam387@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(147, '1112769857', 'JORGE EDUARDO ', 'BEDOYA CANDELA', 'CRA 62 # 13-45', '3187196675', '1990-04-10', '', '', 'O+', '', '', '', 'BARRIOS UNIDOS', 'POSITIVA', 'canca.90@hotmail.com', '', '', '', 'no', '0000-00-00', NULL),
(148, '16215249', 'JORGE HERNAN', 'HERNANDEZ SALAZAR', 'CRA 11 # 16A-78', '3177830538', '1962-08-30', '', '', 'B+', '', '', '', 'COOMEVA ', 'SURATEP', 'josejernandez183@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(149, '16200446', 'JORGE HILDER ', 'VELASQUEZ GALEANO', 'Cra 1 # 19-34', '3187039116', '1947-09-10', '', '', 'A-', '', '', '', 'S.O.S', 'COLPATRIA', 'hildervelasquez9@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(150, '16220347', 'JORGE LUIS ', 'GOMEZ  VARGAS ', 'CRA 3 # 24A-58', '3218450129', '1966-04-18', '', '', 'O+', '', '', '', 'NUEVA EPS', 'SURATEP', 'gerogegomez0418@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(151, '16224017', 'JORGE MARIO ', 'CARRANZA QUINTERO', 'CRA 3N # 54-20', '3218767482', '1970-01-15', '', '', 'B+', '', '', '', 'S.O.S', 'SURATEP', 'jorgecarranza2307@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(152, '6360986', 'JOSE ALBEIRO ', 'GIRALDO MURILLO', 'El Trebol Mz 3 Cs 15', '3117329628', '1964-03-11', '', '', 'O+', '', '', '', 'NUEVA EPS', 'POSITIVA', 'giraldomurillojosealbeiro@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(153, '16205343', 'JOSE ALBERTO', 'MARIN HERRERA', 'CL 16D # 12-29', '3103841280', '1953-04-28', '', '', 'O+', '', '', '', 'SANITAS', 'COLPATRIA', 'josealbertomarinherrera@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(154, '16230489', 'JOSE ALEXANDER ', 'LOPEZ DUQUE', 'Cra 14A # 11B-39', '3113868305', '1976-01-08', '', '', 'O+', '', '', '', 'S.O.S', 'SURATEP', 'joalelodu1976@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(155, '6482070', 'JOSE ALFARIZ ', 'VALENCIA', 'El trebol mz 19 Cs 243', '3182677585', '1966-12-28', '', '', 'A+', '', '', '', 'COOSALUD', 'SURATEP', 'josevalenciacartago@hotmail.com', '', '', '', 'no', '0000-00-00', NULL),
(156, '4860090', 'JOSE ALONSO ', 'SALAZAR CORREA', 'DIAGONAL 2 # 1D-38 ', '3117246715', '1967-09-16', '', '', 'O+', '', '', '', 'S.O.S', 'SURATEP', 'josealonsosalazar223@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(157, '16658238', 'JOSE ALVARO ', 'VIVAS GONZALEZ', 'CRA 4N # 20-04', '3225898478', '1961-08-16', '', '', 'B+', '', '', '', 'PENSIONADO', 'SURATEP', 'jose.vivas238@casur.gov.co', '', '', '', 'si', '0000-00-00', NULL),
(158, '6240164', 'JOSE ARLES ', 'PINEDA MARTINEZ', 'CRA 4F # 21C-39', '3127888698', '1979-02-11', '', '', 'A+', 'SANDRA LILIANA MOLINA', '3136016114', 'ESPOSA', 'S.O.S', 'COLPATRIA', 'arles.p.m1979@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(159, '16231935', 'JOSE BALDUINO ', 'SANCHEZ LEON', 'CRA 3 # 19-65', '3136629729', '1977-02-03', '', '', 'A-', '', '', '', 'S.O.S', 'SURATEP', 'josecitora06@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(160, '16206135', 'JOSE BALMORY ', 'ARROYAVE GIRALDO', 'CRA 16A # 16-48', '3172495143', '1953-11-07', '', '', 'O+', '', '', '', 'PENSIONADO', 'SURATEP', 'balmoryarroyave@gmail.com', '', '', '', 'si', '0000-00-00', NULL),
(161, '16213382', 'JOSE BERNARDO ', 'CARVAJAL PEREZ', 'CALLE 39B # 1B-33', '3117390524', '1961-03-25', '', '', 'O+', '', '', '', 'S.O.S', 'LA EQUIDAD', 'nardin1325@hotmail.com', '', '', '', 'no', '0000-00-00', NULL),
(162, '2471557', 'JOSE DANIEL ', 'GOMEZ CASTAÑO', 'CRA 1N # 54-61', '3023573975', '1966-07-31', '', '', 'O+', '', '', '', 'SANITAS', 'SURATEP', 'danydalcy23@hotmail.com', '', '', '', 'no', '0000-00-00', NULL),
(163, '6272338', 'JOSE EGINARDO ', 'CARDONA OSORIO', 'CALLE 14 # 4-67 ansermanuevo', '3136930456', '1952-06-08', '', '', 'O+', '', '', '', 'S.O.S-PENSIONADO', 'COLPATRIA', 'joseeginardoc52@gmail.com', '', '', '', 'si', '0000-00-00', NULL),
(164, '14440404', 'JOSE ELIVER ', 'GARCIA VALENCIA', 'CRA 4 # 23-08', '3168709862', '1953-04-02', '', '', 'O+', '', '', '', 'PENSIONADO', 'COLPATRIA', 'eliver7588@hotmail.com', '', '', '', 'si', '0000-00-00', NULL),
(165, '6480603', 'JOSE ERNESTO ', 'BETANCOURT VALENCIA', 'CRA 1 # 15-15', '3187692585', '1950-05-03', '', '', 'A+', '', '', '', 'S.O.S', 'SURATEP', 'betancourt6480603@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(166, '16206919', 'JOSE GABRIEL ', 'GALARZA MARIÑO', 'KRA 4I # 21C-22', '3174614938', '1957-11-25', '', '', 'O+', 'KARINA GALARZA', '3108472396', '', 'COOSALUD', 'SURATEP', 'gabrielgalarza1023@gmil.com', '', '', '', 'no', '0000-00-00', NULL),
(167, '16206726', 'JOSE HENRY ', 'GIRALDO MAYA', 'CRA 16A # 17-06', '3206400341', '1956-02-26', '', '', 'O+', 'OMAIRA PALACIOS', '3223801607', 'ESPOSA', 'S.O.S', 'COLPATRIA', 'henrigiraldo77@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(168, '6353360', 'JOSE HUMBERTO ', 'ORTIZ ZAMORA', 'CALLE 4 # 9-03', '3232956731', '1968-03-05', '', '', 'A+', 'GUSTAVO ADOLFO ORTIZ', '3205181367', 'HIJO', 'DERECHO DE PETICION', '', 'humbertoortizzamora@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(169, '2461905', 'JOSE JAVIER ', 'ARISTIZABAL DUQUE', 'CRA 24 # 11-34', '3127216263', '1974-01-02', '', '', 'O+', '', '', '', 'COOMEVA', 'LA EQUIDAD', 'javieraristizabald@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(170, '16212692', 'JOSE JAVIER', 'MORALES MARTINEZ', 'CALLE 13 # 9-26', '3118437331', '1963-11-25', '', '', 'B+', 'MERY JARAMILLO', '2117529', 'MADRASTRA', 'S.O.S ', 'COLPATRIA', 'josejaviermoralesmartinez22@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(171, '16221428', 'JOSE JULIAN', 'GONZALEZ GRAJALES', 'CALLE 16 # 19-43', '3122322990', '1967-03-03', '', '', 'O+', 'LILIANA BETANCOURT', '3137253111', 'ESPOSA', 'COOMEVA', 'COLPATRIA', 'josejuliangonsalez69@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(172, '94296399', 'JOSE JULMAN ', 'CASTAÑO RAMIREZ', 'CRA 3AN # 17-58', '3143212065', '1972-01-08', '', '', 'O+', '', '', '', 'COOMEVA', 'COLPATRIA', 'julmancali@hotmail.com', '', '', '', 'no', '0000-00-00', NULL),
(173, '14878692', 'JOSE LEONARDO', 'FRANCO VARGAS', 'TRANSV 6 # 16-138', '3155401319', '1958-09-24', '', '', 'O+', 'LIZET NATALIA FRANCO', '3217245465', 'NIETA', 'COOSALUD', 'SURATEP', 'leonardofranco09@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(174, '4379502', 'JOSE LIBARDO ', 'ALVAREZ PEREZ', 'CRA 3NC # 16C-22', '3108618895', '1961-02-12', '', '', 'A+', 'ERIKA ALVAREZ', '3108208507', 'HIJA', 'COOMEVA', 'SURATEP', 'libardoalbaperez@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(175, '16220954', 'JOSE LIBARDO', 'GOMEZ OCHOA', 'CRA 1K # 38-46', '3136243638', '1967-03-25', '', '', 'O+', '', '', '', 'SOS', 'COLPATRIA', '3136243638salome@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(176, '94434459', 'JOSE LIBARDO ', 'MONTES PORRAS', 'CR 3N # 33-15', '3104092274', '1979-05-09', '', '', 'O-', '', '', '', 'MEDIMAS', 'SURATEP', 'limontes96@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(177, '16229764', 'JOSE LLOVANI ', 'GARCIA BOTERO', 'CALLE 6A # 15B-31', '3216383699', '1974-10-25', '', '', 'O+', '', '', '', 'COOMEVA', 'COLPATRIA', 'josegiovannigarcia60@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(178, '1006316418', 'JOSE LUIS', 'CHICA VALLE', 'CALLE 24A # 2-65', '3167517922', '2000-04-22', '', '', 'A-', 'DORA PATRICIA VALLE ', '3175911047', 'MADRE', 'S.O.S ', 'COLPATRIA', 'joluchi2000@hotmail.com', '', '', '', 'no', '0000-00-00', NULL),
(179, '6361044', 'JOSE LUIS ', 'VARGAS DIAZ', 'CL 3 # 5-62 Obando', '3113873367', '1964-09-10', '', '', 'O+', '', '', '', 'S.O.S', 'LA EQUIDAD', 'joseluis3113873367@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(180, '14575364', 'JOSE NORBEY', 'GARCES GIRALDO', 'CRA 2AN # 17A-26', '3113636070', '1966-07-02', '', '', 'B+', '', '', '', 'S.O.S', 'SURATEP', 'norbellito0307@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(181, '16221716', 'JOSE NORBEY ', 'HERNANDEZ MEJIA', 'CRA 3EN # 20-24', '3146065552', '1968-03-27', '', '', 'O+', '', '', '', 'COOMEVA', 'COLPATRIA', 'josehm.@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(182, '16214832', 'JOSE OMAR ', 'GONZALEZ CORTES', 'EL BERDUM MZ E CS 7', '3155080739', '1980-07-01', '', '', 'O+', 'SANDRA MILENA ARANGO', '3165580755', 'ESPOSA', 'S.O.S', 'COLPATRIA', 'chachin1189@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(183, '79762782', 'JOSE ORLANDO', 'FOMEQUE GARZON', 'CRA 3BN # 17-66', '3004557486', '1979-08-24', '', '', 'A+', '', '', '', 'SANITAS', 'COLPATRIA', 'jrfomeque@hotmail.com', '', '', '', 'no', '0000-00-00', NULL),
(184, '10165483', 'JOSE OSCAR ', 'JURADO GARCIA', 'CRA 15 #6-08', '3103920304', '1958-12-08', '', '', 'A+', 'ALBA LUCIA PARRA', '3103472645', 'ESPOSA', 'NUEVA EPS', 'SURATEP', 'zafari1958@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(185, '16226154', 'JOSE ULISES', 'HENAO LOPEZ', 'CRA 4A # 21-43', '3104848982', '1972-04-06', '', '', 'A+', '', '', '', 'COOSALUD', 'POSITIVA', '', '', '', '', 'no', '0000-00-00', NULL),
(186, '16230861', 'JOSEPH ESTIVEN ', 'OSORIO GUTIERREZ', 'CALLE 6 # 19A-27', '3168523739', '1976-04-09', '', '', 'O+', 'BLANCA LIBIA GUTIERREZ', '3108301183', 'MADRE', 'S.O.S', 'SURATEP', 'josephosorio16230861@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(187, '79799797', 'JUAN AUGUSTO', 'ROMERO SOTO', 'BOSQUE LOS LAGOS MZ9 CS 30', '3053605440', '1975-12-05', '', '', 'B+', '', '', '', 'SANITAS', 'SURATEP', 'juanaugustors@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(188, '16209082', 'JUAN BAUTISTA ', 'GIRALDO ZULUAGA', 'ALMENDROS MZ 5 CS 23/ PTO CLDS', '3147747799', '1956-03-08', '', '', 'O+', '', '', '', 'S.O.S ', 'POSITIVA', 'giraldojuan301@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(189, '1076350546', 'JUAN CARLOS', 'GIRALDO PINEDA', 'CALLE 7 # 7B-14', '3218592014', '1987-02-24', '', '', 'A+', 'BEATRIZ HELENA SALZAR', '3108970156', 'ESPOSA', 'COOMEVA', 'SURATEP', 'sebasjuankabea@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(190, '16222936', 'JUAN CARLOS ', 'HOYOS GIRALDO', 'KRA 3 # 1A-153', '3218172786', '1968-11-02', '', '', 'O+', '', '', '', 'NUEVA EPS', 'LA EQUIDAD', 'juanhoyos802@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(191, '80231626', 'JUAN CARLOS ', 'OROZCO PALACIOS', 'CRA 13 # 16D-51', '3164012480', '1980-08-18', '', '', 'O+', '', '', '', 'COOMEVA', 'SURATEP', 'ojuancarlo970@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(192, '16230437', 'JUAN CARLOS ', 'PARDO HIDALGO', 'CRA 14A # 10A-03', '3146958282', '1975-09-13', '', '', 'A+', '', '', '', 'COOMEVA', 'SURATEP', 'juanchoph1@hotmail.com', '', '', '', 'no', '0000-00-00', NULL),
(193, '16365211', 'JUAN CARLOS ', 'ROMERO RUIZ', 'CRA 4B # 1-30 Obando', '3155976405', '1966-07-04', '', '', 'O+', '', '', '', 'S.O.S', 'SURATEP', 'juan-romero66@hotmail.com', '', '', '', 'no', '0000-00-00', NULL),
(194, '1112772876', 'JUAN DAVID', 'MURCIA RODRIGUEZ', 'CRA 10 # 15- 51 ', '3178355521', '1990-11-04', '', '', 'O+', '', '', '', 'S.O.S', 'COLPATRIA', 'juandavidmurciarodriguez2@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(195, '1007630764', 'JUAN MANUEL', 'SOTO PATIÑO', 'CALLE 2E # 4-33', '3216606530', '2000-07-25', '', '', 'O+', '', '', '', 'COOMEVA', 'COLPATRIA', 'juanmanuelsotopatiño@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(196, '14567379', 'JUAN PABLO ', 'RAMIREZ MONTES', 'CRA 12 # 9-12', '3157228668', '1982-04-21', '', '', 'O+', '', '', '', 'S.O.S', 'COLPATRIA', 'soyyoo989@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(197, '94462709', 'JUAN RAMIRO ', 'VILLANUEVA URIBE', 'MZ C CS 7 NTRA SRA POBREZA', '3127724436', '1980-11-04', '', '', 'A+', 'PATRICIA LOPEZ', '3113815721', 'ESPOSA', 'S.O.S', 'COLPATRIA', 'ramirovillanueva358gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(198, '16202829', 'JUDAEL', 'MAFLA MORENO', 'CRA 60 # 12-21', '3207383395', '1950-02-08', '', '', 'A+', 'GUSTAVO ADOLFO MAFLA', '3178296099', 'HIJO', 'S.O.S', 'SURATEP', 'judaelmafla@outlook.es', '', '', '', 'no', '0000-00-00', NULL),
(199, '1006291858', 'JULIAN DAVID ', 'RUEDA PIEDRAHITA', 'CRA 62 # 12-45', '3014145949', '1993-04-30', '', '', 'O+', 'OFELIA PIEDRAHITA', '3148512819', 'MADRE', 'NUEVA EPS', 'SURATEP', 'davidjulio0430@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(200, '16204913', 'JULIO CESAR ', 'BEDOYA BILBAO', 'CR 62 # 13-45', '3116444340', '1952-10-10', '', '', 'O+', '', '', '', 'PENSIONADO', 'COLPATRIA', 'juliobedoya17@hotmail.com', '', '', '', 'si', '0000-00-00', NULL),
(201, '16219550', 'JULIO CESAR', 'MARULANDA OCAMPO', 'CALLE 3 # 3A-33', '3202131045', '1966-05-28', '', '', 'O+', '', '', '', 'S.O.S', 'SURATEP', 'marulandaocampojuliocesar@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(202, '15907258', 'JULIO CESAR', 'VALERO', 'CRA 4 # 2-14', '3219703549', '1967-02-04', '', '', 'A+', 'VERONICA VALERO', '3146709749', 'HIJA', 'S.O.S', 'SURATEP', '5156366clarocolmbia3@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(203, '16488366', 'LEON JAIME', 'MESA LONDOÑO', 'CALLE 49 # 3A-50', '3113400438', '1967-03-14', '', '', 'A+', 'ISABEL VINAZCO', '3207759120', 'ESPOSA', 'BARRIOS UNIDOS ', 'SURATEP', '', '', '', '', 'no', '0000-00-00', NULL),
(204, '6240346', 'LEONARDO FABIO', 'HENAO LOPEZ', 'CALLE 45 # 3N-19', '3148584968', '1980-02-18', '', '', 'A+', '', '', '', 'NUEVA EPS ', 'SURATEP', 'checohenao@hotmail.com', '', '', '', 'no', '0000-00-00', NULL),
(205, '82290041', 'LEONEL DE JESUS ', 'GAÑAN BAÑOL', 'CALLE 4 # 30-96', '3127541159', '1963-09-06', '', '', 'O+', '', '', '', 'S.O.S', 'SURTEP', 'ttaxcartago@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(206, '1112790568', 'LLERMISON', 'ESPINOSA HERRERA', 'CRA 3G # 21-101', '3145941576', '1997-11-22', '', '', 'A+', '', '', '', 'BARRIOS UNIDOS ', 'SURATEP', 'llermisonherrera@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(207, '16225188', 'LUCIANO ', 'VARGAS NAVARRO', 'CRA 4 NR 1-108', '3146304895', '2016-12-26', '', '', 'A+', '', '', '', 'NUEVA EPS', 'SURATEP', 'danilo.taxi288@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(208, '16208748', 'LUIS ALBEIRO', 'MONTES CATAÑO', 'CRA 12 # 9-51', '3016400138', '1956-10-27', '', '', 'O+', '', '', '', 'COOMEVA', 'POSITIVA', 'albeiromontes124@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(209, '8739461', 'LUIS ALBEIRO', 'RAMIREZ', 'CRA2 # 2-15', '3132301540', '1963-10-10', '', '', 'A+', '', '', '', 'S.O.S', 'COLPATRIA', 'albeiroramirez@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(210, '1116441684', 'LUIS ALBERTO', 'MORALES CASTAÑO', 'CALLE 14 # 10-50', '3212616487', '1992-09-21', '', '', 'A+', 'LINA CLAUDIA CATAÑO', '3128417534', 'MADRE', 'NUEVA EPS ', 'SURATEP', 'albertico_12330@hotmail.com', '', '', '', 'no', '0000-00-00', NULL),
(211, '2471519', 'LUIS ALBERTO', 'MORENO VELEZ', 'CRA 8N # 16B-28', '3122793542', '1966-03-13', '', '', 'O+', '', '', '', 'S.O.S', 'COLPATRIA', '', '', '', '', 'no', '0000-00-00', NULL),
(212, '10092040', 'LUIS ALBERTO ', 'VALENCIA BERMUDEZ', 'CL 45B #3N-33', '3207444247', '1955-12-21', '', '', 'O+', '', '', '', 'PENSIONDO', 'SURATEP', 'albertovalenciab123@gmail.com', '', '', '', 'si', '0000-00-00', NULL),
(213, '7522135', 'LUIS ALBERTO', 'VANEGAS LOPEZ', 'CRA 11N # 37D-28', '3116093294', '1956-09-30', '', '', 'A+', 'MARIA EDILIA MONROY', '3178304268', 'ESPOSA', 'S.O.S', 'COLPATRIA', 'luisvanegas2135@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(214, '14569569', 'LUIS ALFREDO ', 'GIRALDO OSORIO', 'CRA 6 # 4-61', '3128427965', '1983-06-19', '', '', 'B+', '', '', '', 'SANITAS ', 'SURATEP', 'luisalfredogiraldoosorio@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(215, '16216155', 'LUIS ALFREDO ', 'VELEZ VELASQUEZ', 'CRA 3BIS # 1A-51', '3193827597', '1962-09-27', '', '', 'O+', '', '', '', 'S.O.S', 'SURATEP', 'luisalfredovelez2@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(216, '16801158', 'LUIS ALONSO', 'VILLA GUERRERO', 'CRA 15 # 14A-33', '3232098740', '1963-05-15', '', '', 'o+', '', '', '', 'S.O.S', ' POSITIVA', 'luisalonsovg63@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(217, '6454242', 'LUIS ANGEL ', 'TORO RIOS', 'CRA 13 # 18-09', '3183527118', '1946-11-18', '', '', 'O+', 'NUBIA VICTORIA', '2132589', 'ESPOSA', 'NUEVA EPS', 'SURATEP', 'alejotoro100@hotmail.com', '', '', '', 'si', '0000-00-00', NULL),
(218, '16203179', 'LUIS ARBEY ', 'CARDONA MARIN', 'CALLE 10 # 15-48', '3202248547', '1951-05-04', '', '', 'O+', '', '', '', 'S.O.S-PENSIONADO', 'SURATEP', 'luisnorbeycardonamarin@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(219, '2472035', 'LUIS CARLOS ', 'OROZCO RODRIGUEZ', 'CALLE 17 # 3-13', '3114320342', '1967-12-29', '', '', 'O+', '', '', '', 'S.O.S', 'SURATEP', 'co041097@gmail.com', '', '', '', 'no', '0000-00-00', NULL);
INSERT INTO `conductor` (`id_conductor`, `codigo`, `nombres`, `apellidos`, `direccion`, `telefono`, `fecha_nace`, `lugarNace`, `anotaciones`, `tipo_rh`, `acudiente`, `telefonoa`, `celulara`, `eps`, `arl`, `emailc`, `foto`, `observacion`, `experiencia_laboral`, `ispensionado`, `fecha_crea`, `afp`) VALUES
(220, '16210642', 'LUIS CARLOS ', 'ORREGO MONSALVE', 'MZ 13- CS 20 Villa del Roble', '3002451968', '1958-12-25', '', '', 'O+', 'SARA ORREGO GARCIA', '3014765254', 'HIJA', 'S.O.S', 'SURATEP', 'orregocarlos5993@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(221, '14451062', 'LUIS DARIO', 'QUICENO GIRALDO', 'CRA 6 # 3-47', '3172696282', '1968-11-12', '', '', 'O+', 'AMPARO QUICENO', '3115903785', 'HERMANA', 'COOSALUD', 'COLPATRIA', 'luis1968quicenodario@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(222, '16220877', 'LUIS EDUARDO ', 'CHAVERRIA SERNA', 'CRA 1I # 41-33', '3146126527', '1967-05-11', '', '', 'O+', '', '', '', 'COOSALUD', 'COLPATRIA', 'chaverria07@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(223, '94434787', 'LUIS EDUARDO ', 'LIBREROS CASTRILLON', 'CALLE 24 # 5N-70', '3133996623', '1982-03-14', '', '', 'O+', '', '', '', 'SANITAS', 'POSITIVA', 'luislibreros37@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(224, '16213383', 'LUIS EUCLIDES ', 'DUQUE', 'Cra 4 # 17-87 Pto Clds', '3007182068', '1961-04-16', '', '', 'O+', '', '', '', 'S.O.S', 'SURA', 'luiguiokendo4@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(225, '14565187', 'LUIS FELIPE ', 'AGUDELO GRAJALES', 'CRA 30 # 3-36', '3103865564', '1971-05-11', '', '', 'A+', '', '', '', 'NUEVA EPS', 'COLPATRIA', 'pipe.agudelo1016@hotmail.com', '', '', '', 'no', '0000-00-00', NULL),
(226, '16201930', 'LUIS FELIPE', 'MEDINA LOPEZ', 'CALLE 9A # 15-55', '3146642681', '1950-02-24', '', '', 'O+', '', '', '', 'PENSIONADOAUTORIZO GERENCIA DERECHO DE PETICION', '', 'lm9342947@gmail.com', '', '', '', 'si', '0000-00-00', NULL),
(227, '2471221', 'LUIS FERNANDO ', 'GUTIERREZ GOMEZ', 'TRANSV. 37A DIAG 38B-30', '3184411417', '1964-08-01', '', '', 'A+', '', '', '', 'S.O.S', 'POSITIVA', 'gutierrezgomezl08@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(228, '13497931', 'LUIS FERNANDO', 'JIMENEZ HERNANDEZ', 'MZ 7 CS 22 LOS ANGELES', '3172497912', '1969-06-08', '', '', 'A+', 'ELIZABETH VARGAS', '3136619481', 'ESPOSA', 'COOSALUD', 'COLPATRIA', 'luisfernandoj25057@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(229, '16228114', 'LUIS FERNANDO ', 'PIEDRAHITA NAVEROS', 'CALLE 43 # 2-163', '3225056854', '1973-08-18', '', '', 'A+', 'ISABEL NAVEROS', '3177124335', 'HERMANA', 'COOSALUD', 'COLPATRIA', 'lfpn9327@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(230, '16208119', 'LUIS GONZAGA', 'QUICENO RAMIREZ', 'TRANS. 2 1B-21', '3103714165', '1954-10-27', '', '', 'A+', '', '', '', 'S.O.S', 'SURATEP', 'luisquiceno7890@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(231, '2471803', 'LUIS GONZAGA ', 'SERNA ARANGO', 'CALLE 19 # 1-27', '3105816294', '1967-06-21', '', '', 'A+', '', '', '', 'SANITAS', 'SURATEP', 'luisgonzagaserna21@hotmail.com', '', '', '', 'no', '0000-00-00', NULL),
(232, '14835159', 'LUIS HERNANDO ', 'MORENO SANCHEZ', 'CRA 16  15-37', '3218640044', '1967-04-15', '', '', 'A+', '', '', '', 'S.O.S', 'SURATEP', 'luis-moreno@outlook.com', '', '', '', 'no', '0000-00-00', NULL),
(233, '82270089', 'LUIS HORACIO', 'MEJIA ZAPATA', 'CALLE 33 # 8N-15 ', '3127902045', '1965-03-14', '', '', 'O+', '', '', '', 'S.O.S', 'LA EQUIDAD', 'lhmz1965@hotmail.com', '', '', '', 'no', '0000-00-00', NULL),
(234, '17709975', 'LUIS HUMBERTO', 'ALZATE ARIAS', 'CRA 6 # 1-78', '3128165253', '1975-03-10', '', '', 'O+', '', '', '', 'EPS', 'POSITIVA', 'luishumberto975@outlook.com', '', '', '', 'no', '0000-00-00', NULL),
(235, '16269497', 'MANUEL SALVADOR ', 'PRADO GARZON', 'CRA 27D # 6-10', '3103997757', '1956-05-29', '', '', 'A+', '', '', '', 'S.O.S', 'SURATEP', 'manuelsalvadorprado@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(236, '1032436384', 'MARCO SEBASTIAN ', 'PAZ ARROYAVE', 'CRA 2E # 33-70', '3003828862', '1989-11-10', '', '', 'O-', '', '', '', 'S.O.S', 'POSITIVA', 'sandrug182@gmial.com', '', '', '', 'no', '0000-00-00', NULL),
(237, '6136141', 'MARTIN EMILIO ', 'QUIROZ OSPINA', 'MZ 09 CS 24 B/L', '3213934939', '1968-11-01', '', '', 'O+', '', '', '', 'S.O.S', 'COLPATRIA', 'martinemilioquiroz68@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(238, '16231907', 'MARTIN HERNANDO ', 'VILLADA GRAJALES', 'CALLE 4 # 6-44', '3117038932', '1976-11-03', '', '', 'O+', '', '', '', 'S.O.S', 'LA EQUIDAD', 'mvillagraja@hotmail.com', '', '', '', 'no', '0000-00-00', NULL),
(239, '16231596', 'MAURICIO ALBERTO', 'ZULUAGA MONSALVE', 'CALLE 14  # 8-54', '3146288512', '1976-11-20', '', '', 'A+', 'FABIO ZULUAGA', '3167550492', 'PADRE', 'S.O.S', 'SURATEP', 'mauro.zuluaga.mz@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(240, '16222716', 'MAURICIO ', 'ESCALANTE HERRERA', 'CALLE 18 # 9-37', '3225306808', '1969-01-28', '', '', 'O+', 'JAIME PARRA', '2126011', 'DUEÑO CARRO', 'BARRIOS UNIDOS', 'SURATEP', 'escalantemauro47@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(241, '16225218', 'MIGUEL ENRIQUE', 'TRIANA CORREA', 'CALLE 4 # 8-26', '3106414243', '1971-03-10', '', '', 'O+', '', '', '', 'S.O.S ', 'COLPATRIA', 'miguelenriquetriana85@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(242, '16400044', 'MOISES ARTURO', 'MUÑOZ VELEZ', 'CALLE 6 # 9-40', '3146970710', '1968-01-20', '', '', 'O+', '', '', '', 'S.O.S', 'SURATEP', 'marturovelez2068@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(243, '6284462', 'NOLBERTO ', 'LOPEZ BUTIRICA', 'CALLE 14A # 61-15', '3206551874', '1978-05-09', '', '', 'O+', '', '', '', 'S.O.S', 'COLPATRIA', 'nolbertolopez462@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(244, '79668626', 'NOOVER DE JESUS', 'GOMEZ HENAO', 'CRA 5N # 19-51', '3012546401', '1974-09-06', '', '', 'O+', '', '', '', 'COOMEVA', 'COLPENSIONES', 'sandracristina@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(245, '18396593', 'NORBEY', 'GALLEGO VILLANUEVA', 'CALLE 52 # 2-44', '3114566848', '1976-03-03', '', '', 'O+', '', '', '', 'SANITAS', 'COLPATRIA', 'salinasgarcias1974@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(246, '16220662', 'OMAR ANTONIO ', 'ALVAREZ BEDOYA', 'DIAGONAL1C # 1E-09', '3122722875', '1965-11-02', '', '', 'O+', 'NUBIA GALLO', '3127161789', 'ESPOSA', 'SANITAS', 'SURATEP', 'alvarezomar662@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(247, '16217414', 'ORLANDO ', 'CASTAÑO MUÑOZ', 'CRA 4 # 6-81', '3117763749', '1964-02-09', '', '', 'O+', '', '', '', 'S.O.S', 'COLPATRIA', 'orlandolatin@hotmail.com', '', '', '', 'no', '0000-00-00', NULL),
(248, '93416359', 'ORLANDO ', 'CONDE PALOMINO', 'CALLE 23A # 5N-27', '3166095812', '1967-11-04', '', '', 'O+', '', '', '', 'COOSALUD', 'SURATEP', 'condemino@hotmail.com', '', '', '', 'no', '0000-00-00', NULL),
(249, '16211594', 'ORLANDO ', 'MARIN RIOS', 'CR 2 # 39-20', '3213625949', '1955-09-07', '', '', 'A+', '', '', '', 'PENSIONADO / DERECHO DE PETICION', '', '', '', '', '', 'si', '0000-00-00', NULL),
(250, '3668606', 'OSCAR DARIO ', 'MENESES ALZATE', 'CR 30 # 1A-51', '3127160643', '1950-09-10', '', '', 'O+', '', '', '', 'COOMEVA', 'COLPATRIA', 'odmeneses36@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(251, '16231511', 'OSCAR DE JESUS', 'MESA NIETO', 'CALLE 44A # 33-61', '3208633876', '1971-08-20', '', '', 'B+', '', '', '', 'PENSIONADO', 'SURATEP', 'oscarmesanieto@gmail.com', '', '', '', 'si', '0000-00-00', NULL),
(252, '16226412', 'OSCAR ', 'LOPEZ SALAZAR', 'calle 4 # 3-41', '3207676984', '1967-08-13', '', '', 'O+', '', '', '', 'S.O.S', 'SURATEP', 'oscarlopez813@hotmail.com', '', '', '', 'no', '0000-00-00', NULL),
(253, '14565585', 'OSWALDO EVELIO ', 'BUSTAMENTE ARENAS', 'RINCON DE LA LOMA Mz 3 cs 8', '3122349176', '1979-07-17', '', '', 'O+', '', '', '', 'SANITAS', 'COLPATRIA', 'osvaldo717@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(254, '16216273', 'PABLO ANTONIO ', 'IBARGUEN VARGAS', 'CRA 3A # 1A-31', '3147384714', '1963-06-15', '', '', 'A+', '', '', '', 'BARRIOS UNIDOS ', 'SURATEP', 'ibarguenpablo93@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(255, '1112774883', 'PABLO CESAR ', 'RODRIGUEZ MUÑOZ', 'LOS SAMANES CASA 8', '3107420047', '1991-12-19', '', '', 'O+', 'OFELIA MUÑOZ', '3136002342', 'MADRE', 'SANITAS', 'POSITIVA', 'paceromu91@hotmail.com', '', '', '', 'no', '0000-00-00', NULL),
(256, '16216936', 'PAULO ', 'ALENCASTRE MAZUERA', 'CRA 3N # 12B-16', '3207468796', '1963-11-15', '', '', 'O+', '', '', '', 'COOMEVA', 'POSITIVA', 'pauloalencastre63@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(257, '75144891', 'PEDRO NEL ', 'ASPRILLA MOSQUERA', 'MZ 6 CS 5 LOS ANGELES', '3122955483', '1973-12-12', '', '', 'A+', '', '', '', 'PENSIONADO', 'SURATEP', 'pedris1273@hotmail.com', '', '', '', 'si', '0000-00-00', NULL),
(258, '16546748', 'PEDRO NEL', 'MARIN SOTO', 'MZ 11 CS 8 LOS ALMENDROS PTO CALDAS', '3113261335', '1961-11-05', '', '', 'O+', '', '', '', 'S.O.S ', ' SURATEP', 'marinpedronel@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(259, '98323411', 'POMPILIO', 'ORTEGA', 'CALLE 8 # 4-51', '3137883904', '1971-08-08', '', '', 'O+', '', '', '', 'SANITAS', 'COLPATRIA', 'pompilioortega2@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(260, '2474555', 'RAFAEL ANTONIO ', 'CASTAÑEDA ZULUAGA', 'MZ 12 CS 11 CUDADELA DE PAZ', '3128300811', '1980-03-15', '', '', 'A+', '', '', '', 'COOSALUD', 'SURATEP', 'castanedazuluagar@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(261, '16225785', 'RAMIRO ', 'MONTAÑO JIMENEZ', 'CALLE 39B # 1B-40', '3153210910', '1971-07-08', '', '', 'B+', 'JUAN CARLOS MONTAÑO', '3225244925', 'HERMANO', 'COOSALUD', 'SURATEP', 'ramiro15932@hotmail.com', '', '', '', 'no', '0000-00-00', NULL),
(262, '16226263', 'RAUL FERNANDO', 'TORRES ALARCON', 'CALLE 23 # 4C-15', '3177044930', '1972-05-19', '', '', 'O+', '', '', '', 'SANITAS', 'SURATEP', 'todo-res@hotmail.com', '', '', '', 'no', '0000-00-00', NULL),
(263, '14450623', 'RIGOBERTO ', 'OSPINA GRANDA', 'CRA 13B # 14-03', '3117114960', '1959-10-07', '', '', 'O+', '', '', '', 'S.O.S', 'SURATEP', 'rigoospina53@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(264, '94374914', 'ROBERT ANCIZAR', 'RENGIFO MONTES', 'CALLE 5 # 20-141', '3154609711', '1972-09-25', '', '', 'AB+', '', '', '', 'S.O.S', 'COLPATRIA', 'Roberrengifo041@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(265, '16231666', 'ROBINSON ', 'ECHEVERY ORTIZ', 'CL 18 # 4-48', '3234826964', '1976-11-26', '', '', 'O+', '', '', '', 'S.O.S', 'SURATEP', 'robinsoneche31@hotmail.com', '', '', '', 'no', '0000-00-00', NULL),
(266, '14570829', 'ROBINSON ', 'PALACIO ATEHORTUA', 'CALLE 1 # 16A-30', '3166185533', '1984-11-29', '', '', 'A+', '', '', '', 'S.O.S', 'SURATEP', 'robinpalacio3@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(267, '16203702', 'RODRIGO DE JESUS ', 'MARULANDA', 'CRA 3A # 1A-68', '3115425336', '1951-01-18', '', '', 'O+', '', '', '', 'COOSALUD', 'COLPATRIA', 'rmarulanda119@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(268, '16221805', 'RODRIGO ', 'RUA AGUDELO', 'MZ 3 CS 5 LA CABAÑA', '3155326105', '1968-01-21', '', '', 'O+', '', '', '', 'S.O.S ', 'SURATEP', 'rodrigo_rua68@hotmail.com', '', '', '', 'no', '0000-00-00', NULL),
(269, '1053804566', 'SANTIAGO ', 'PINO RESTREPO', 'CRA 19N # 16B-63', '3158157676', '1990-08-14', '', '', 'A+', 'ARZULEY PINO', '3124817123', 'PADRE', 'SANITAS ', 'COLPATRIA', 'pinosantiago@hotmail.com', '', '', '', 'no', '0000-00-00', NULL),
(270, '79100651', 'SAUL DE JESUS ', 'RAMIREZ', 'CRA 2 # 14-47', '3146889943', '1958-01-19', '', '', 'o+', '', '', '', 'PENSIONADO-Ccoomeva', 'suratep', 'cesar.murillo@hotmail.es', '', '', '', 'si', '0000-00-00', NULL),
(271, '16209222', 'TOMAS DE JESUS', 'SALAZAR PEREZ', 'CALLE 18 # 8-62', '3137894865', '1958-07-28', '', '', 'O+', '', '', '', 'S.O.S', 'SURATEP', 'tomasdejesusalazarperez@hotmail.com', '', '', '', 'no', '0000-00-00', NULL),
(272, '16211635', 'UBER ALBERTO ', 'OSORIO VALENCIA', 'CALLE 1 # 8E-18', '3104739861', '1960-05-31', '', '', 'O+', '', '', '', 'S.O.S', ' COLPATRIA', 'albertoosoriovalencia3@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(273, '16220276', 'ULDIBIER ', 'OSORIO CARDONA', 'CRA 1 # 45-05', '3023534205', '1966-06-28', '', '', 'A-', '', '', '', 'S.O.S', 'POSITIVA', 'uldibierososiocardona@hotmail.com', '', '', '', 'no', '0000-00-00', NULL),
(274, '1113593318', 'VICTOR ALFONSO ', 'GARCIA SANCHEZ', 'Calle 10B # 20-09', '3174934789', '1988-10-24', '', '', 'O+', '', '', '', 'COOMEVA', 'POSITIVA', 'victorobando1345@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(275, '79753055', 'VICTOR ROBERTH', 'CAMPOS FORERO', 'TRANSV 6 # 104-04', '3007353375', '1973-06-01', '', '', 'A+', '', '', '', 'NUEVA EPS', 'COLPATRIA', 'nuestra-huella@hotmail.com', '', '', '', 'no', '0000-00-00', NULL),
(276, '16233424', 'VICTORIANO', 'HOLGUIN FLOREZ', 'CRA 4 # 28-71', '3166316648', '1976-10-05', '', '', 'O+', 'JHOANA HOLGUIN', '3214685395', 'HERMANA', 'S.O.S', 'COLPATRIA', 'dahiary85@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(277, '1004766751', 'WILDER', 'FLOREZ GIL', 'CALLE 1E # 3A-14', '3226555626', '2001-02-27', '', '', 'O+', 'JHON EIVER FLOREZ', '3215913541', 'HERMANO', 'NUEVA EPS', 'COLPATRIA', 'vanesasoto349@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(278, '16225701', 'WILLIAM FERNANO', 'GONZALEZ CORREA', 'CRA 15A # 11B-50', '3145055421', '1971-08-07', '', '', 'A+', 'CARMEN ROCIO GONZALEZ', '2135687', 'MADRE', 'SOS', 'COLPATRIA', 'oscargc953@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(279, '16223922', 'WILLIAM ', 'MOLINA ZAPATA', 'CALLE 4A # 10-186', '3103869247', '1967-12-05', '', '', 'A+', 'BEATRIZ MARMOLEJO', '3206534440', 'ESPOSA', 'S.O.S', 'SURATEP', 'molinazapatawilliam@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(280, '14880717', 'WILLIAM ', 'PEREZ CAMACHO', 'CRA 4B # 16-48', '3166362907', '1952-07-04', '', '', 'A+', '', '', '', 'BARRIOS UNIDOS', 'SURATEP', '', '', '', '', 'no', '0000-00-00', NULL),
(281, '16217346', 'WILSON ', 'BOLIVAR LOPEZ', 'CL 14 # 13-104', '3162578791', '1964-06-10', '', '', 'A+', 'MARIA AUGENIA ALVIZ', '3168203932', 'ESPOSA', 'S.O.S', 'SURATEP', 'wilsonbolivar0610@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(282, '97610895', 'WILSON HUMBERTO ', 'PARRA MURCIA', 'CALLE 9 # 7-35', '3142245311', '1978-07-13', '', '', 'A+', 'DORA ELENA GONZALEZ', '3222753112', 'ESPOSA', 'SANITAS', 'SURATEP', 'wilsonph31@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(283, '16222972', 'WILSON', 'OSORIO QUINTERO', 'DIAG. 1C # T1C-74', '3108905899', '1968-10-03', '', '', 'O+', '', '', '', 'S.O.S', 'COLPATRIA', 'wilsonosoq1622@gmail.com', '', '', '', 'no', '0000-00-00', NULL),
(284, '2472507', 'YHON HENRY ', 'ORTIZ MARIN', 'CALLE 33 # 8N-03', '3175668601', '1969-08-07', '', '', 'O+', '', '', '', 'COOSALUD', 'SURATEP', 'yhortizma@gmail.com', '', '', '', 'no', '0000-00-00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consecutivo`
--

CREATE TABLE `consecutivo` (
  `id_consecutivo` int(10) NOT NULL,
  `consecutivo` double NOT NULL,
  `empresa` enum('TA','TM','TC') NOT NULL,
  `motivo` enum('DI','T','DE') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `consecutivo`
--

INSERT INTO `consecutivo` (`id_consecutivo`, `consecutivo`, `empresa`, `motivo`) VALUES
(1, 4, 'TA', 'DI'),
(2, 2, 'TA', 'DE'),
(3, 0, 'TA', 'T');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contractual`
--

CREATE TABLE `contractual` (
  `id_contra` int(5) NOT NULL,
  `id_movil` varchar(5) NOT NULL,
  `periodo` varchar(10) NOT NULL,
  `f_inclusion` datetime NOT NULL,
  `f_fin` datetime NOT NULL,
  `valorp` float NOT NULL,
  `saldo` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `convenio`
--

CREATE TABLE `convenio` (
  `id_movil` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `con_doc`
--

CREATE TABLE `con_doc` (
  `id` int(5) NOT NULL,
  `id_conductor` int(10) DEFAULT NULL,
  `id_doc` varchar(5) DEFAULT NULL,
  `numero` varchar(25) DEFAULT NULL,
  `categoria` varchar(30) DEFAULT NULL,
  `id_eps` int(5) DEFAULT NULL,
  `fecha_ant` date DEFAULT '0000-00-00',
  `fecha_vence` date DEFAULT '0000-00-00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `con_doc`
--

INSERT INTO `con_doc` (`id`, `id_conductor`, `id_doc`, `numero`, `categoria`, `id_eps`, `fecha_ant`, `fecha_vence`) VALUES
(1, 1, '20', 'C2', 'CARTAGO', 0, '2022-07-11', '2022-07-11'),
(2, 1, '21', 'S.O.S', 'CARTAGO', 0, '2021-05-19', '2021-05-19'),
(3, 1, '22', 'POSITIVA', 'CARTAGO', 0, '2021-05-19', '2021-05-19'),
(4, 1, '23', '', 'CARTAGO', 0, '0000-00-00', '0000-00-00'),
(5, 2, '20', 'C1', 'CARTAGO', 0, '2024-03-05', '2024-03-05'),
(6, 2, '21', 'S.O.S', 'CARTAGO', 0, '0000-00-00', '2021-05-18'),
(7, 2, '22', 'COLPATRIA', 'CARTAGO', 0, '0000-00-00', '2021-05-19'),
(8, 2, '23', '', 'CARTAGO', 0, '0000-00-00', '0000-00-00'),
(9, 3, '20', 'C2', 'CARTAGO', 0, '2018-04-09', '2021-04-09'),
(10, 3, '21', 'COOSALUD ', 'CARTAGO', 0, '0000-00-00', '0000-00-00'),
(11, 3, '22', 'SURATEP', 'CARTAGO', 0, '0000-00-00', '0000-00-00'),
(12, 3, '23', '', 'CARTAGO', 0, '0000-00-00', '0000-00-00'),
(13, 4, '20', 'C2', 'CARTAGO', 0, '2019-01-11', '2022-01-11'),
(14, 4, '21', 'S.O.S ', 'CARTAGO', 0, '0000-00-00', '0000-00-00'),
(15, 4, '22', 'SURATEP', 'CARTAGO', 0, '0000-00-00', '0000-00-00'),
(16, 4, '23', '', 'CARTAGO', 0, '0000-00-00', '0000-00-00'),
(17, 5, '20', 'C1', 'CARTAGO', 0, '2019-05-16', '2022-05-16'),
(18, 5, '21', 'S.O.S', 'CARTAGO', 0, '0000-00-00', '0000-00-00'),
(19, 5, '22', 'SURATEP', 'CARTAGO', 0, '0000-00-00', '0000-00-00'),
(20, 5, '23', '', 'CARTAGO', 0, '0000-00-00', '0000-00-00'),
(21, 6, '20', 'C2', 'CARTAGO', 0, '2020-06-09', '2023-06-09'),
(22, 6, '21', 'NUEVA EPS ', 'CARTAGO', 0, '0000-00-00', '0000-00-00'),
(23, 6, '22', 'SURATEP', 'CARTAGO', 0, '0000-00-00', '0000-00-00'),
(24, 6, '23', '', 'CARTAGO', 0, '0000-00-00', '0000-00-00'),
(25, 7, '20', 'C1', 'PEREIRA', 0, '2021-02-11', '2024-02-11'),
(26, 7, '21', 'S.O.S', 'PEREIRA', 0, '0000-00-00', '0000-00-00'),
(27, 7, '22', 'POSITIVA', 'PEREIRA', 0, '0000-00-00', '0000-00-00'),
(28, 7, '23', '', 'PEREIRA', 0, '0000-00-00', '0000-00-00'),
(29, 8, '20', 'C1', 'LA VIRGINIA', 0, '2018-06-20', '2021-06-20'),
(30, 8, '21', 'SANITAS ', 'LA VIRGINIA', 0, '0000-00-00', '0000-00-00'),
(31, 8, '22', 'POSITIVA', 'LA VIRGINIA', 0, '0000-00-00', '0000-00-00'),
(32, 8, '23', '', 'LA VIRGINIA', 0, '0000-00-00', '0000-00-00'),
(33, 9, '20', 'C2', 'LA UNION', 0, '2019-02-22', '2022-02-22'),
(34, 9, '21', 'COOMEVA ', 'LA UNION', 0, '0000-00-00', '0000-00-00'),
(35, 9, '22', 'SURATEP', 'LA UNION', 0, '0000-00-00', '0000-00-00'),
(36, 9, '23', '', 'LA UNION', 0, '0000-00-00', '0000-00-00'),
(37, 10, '20', 'C1', 'CARTAGO', 0, '2021-10-07', '2021-10-07'),
(38, 10, '21', 'PENSIONADO', 'CARTAGO', 0, '0000-00-00', '0000-00-00'),
(39, 10, '22', 'COLPATRIA', 'CARTAGO', 0, '0000-00-00', '0000-00-00'),
(40, 10, '23', '', 'CARTAGO', 0, '0000-00-00', '0000-00-00'),
(41, 11, '20', 'C2', 'LA VIRGINIA', 0, '2018-07-23', '2021-07-23'),
(42, 11, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(43, 11, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(44, 11, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(45, 12, '20', 'C2', 'CARTAGO', 0, '2018-10-09', '2021-10-09'),
(46, 12, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(47, 12, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(48, 12, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(49, 13, '20', 'C1', 'CARTAGO', 0, '2021-04-13', '2024-04-13'),
(50, 13, '21', 'SANITAS', '', 0, '0000-00-00', '0000-00-00'),
(51, 13, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(52, 13, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(53, 14, '20', 'C2', 'CARTAGO', 0, '2018-06-26', '2021-06-26'),
(54, 14, '21', '', '', 0, '0000-00-00', '0000-00-00'),
(55, 14, '22', '', '', 0, '0000-00-00', '0000-00-00'),
(56, 14, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(57, 15, '20', 'C1', 'CARTAGO', 0, '2021-03-11', '2024-03-11'),
(58, 15, '21', 'NUEVA EPS', '', 0, '0000-00-00', '0000-00-00'),
(59, 15, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(60, 15, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(61, 16, '20', 'C2', 'CARTAGO', 0, '2019-02-05', '2022-02-05'),
(62, 16, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(63, 16, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(64, 16, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(65, 17, '20', 'C2', 'CARTAGO', 0, '2019-04-22', '2022-04-22'),
(66, 17, '21', 'COOSALUD', '', 0, '0000-00-00', '0000-00-00'),
(67, 17, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(68, 17, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(69, 18, '20', 'C2', 'CARTAGO', 0, '2021-01-12', '2021-12-01'),
(70, 18, '21', 'PENSIONADO', '', 0, '0000-00-00', '0000-00-00'),
(71, 18, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(72, 18, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(73, 19, '20', 'C2', 'CARTAGO', 0, '2021-02-19', '2022-02-19'),
(74, 19, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(75, 19, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(76, 19, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(77, 20, '20', 'C2', 'CARTAGO', 0, '2020-10-01', '2021-10-01'),
(78, 20, '21', 'MEDIMAS', '', 0, '0000-00-00', '0000-00-00'),
(79, 20, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(80, 20, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(81, 21, '20', 'C2', 'CARTAGO', 0, '2019-04-26', '2022-04-26'),
(82, 21, '21', 'COOMEVA', '', 0, '0000-00-00', '0000-00-00'),
(83, 21, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(84, 21, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(85, 22, '20', 'C2', 'CARTAGO', 0, '2020-02-10', '2023-02-06'),
(86, 22, '21', 'COOSALUD', '', 0, '0000-00-00', '0000-00-00'),
(87, 22, '22', 'POSITIVA', '', 0, '0000-00-00', '0000-00-00'),
(88, 22, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(89, 23, '20', 'C1', 'CARTAGO', 0, '2020-11-25', '2023-11-25'),
(90, 23, '21', '', '', 0, '0000-00-00', '0000-00-00'),
(91, 23, '22', '', '', 0, '0000-00-00', '0000-00-00'),
(92, 23, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(93, 24, '20', 'C2', 'LA VIRGINIA', 0, '2020-09-10', '2021-09-10'),
(94, 24, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(95, 24, '22', 'POSITIVA', '', 0, '0000-00-00', '0000-00-00'),
(96, 24, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(97, 25, '20', 'C2', 'CARTAGO', 0, '2019-11-12', '2022-11-12'),
(98, 25, '21', 'SANITAS', '', 0, '0000-00-00', '0000-00-00'),
(99, 25, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(100, 25, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(101, 26, '20', 'C2', 'CARTAGO', 0, '2020-12-21', '2021-12-21'),
(102, 26, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(103, 26, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(104, 26, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(105, 27, '20', 'C1', 'CALI', 0, '2020-12-22', '2021-12-22'),
(106, 27, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(107, 27, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(108, 27, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(109, 28, '20', 'C2', 'CARTAGO', 0, '2019-10-01', '2022-10-01'),
(110, 28, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(111, 28, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(112, 28, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(113, 29, '20', 'C1', 'CARTAGO', 0, '2019-05-09', '2021-05-09'),
(114, 29, '21', 'NUEVA EPS', '', 0, '0000-00-00', '0000-00-00'),
(115, 29, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(116, 29, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(117, 30, '20', 'C2', 'CARTAGO', 0, '2018-10-10', '2021-10-10'),
(118, 30, '21', '', '', 0, '0000-00-00', '0000-00-00'),
(119, 30, '22', '', '', 0, '0000-00-00', '0000-00-00'),
(120, 30, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(121, 31, '20', 'C2', 'LA VIRGINIA', 0, '2020-12-30', '2023-12-30'),
(122, 31, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(123, 31, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(124, 31, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(125, 32, '20', 'C2', 'CARTAGO', 0, '2021-04-14', '2024-04-14'),
(126, 32, '21', 'SANITAS', '', 0, '0000-00-00', '0000-00-00'),
(127, 32, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(128, 32, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(129, 33, '20', 'C2', 'CARTAGO', 0, '2019-12-20', '2022-12-20'),
(130, 33, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(131, 33, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(132, 33, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(133, 34, '20', 'C2', 'CARTAGO', 0, '2021-02-05', '2024-02-05'),
(134, 34, '21', 'AMBUQ', '', 0, '0000-00-00', '0000-00-00'),
(135, 34, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(136, 34, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(137, 35, '20', 'C1', 'CARTAGO', 0, '2021-01-14', '2022-01-14'),
(138, 35, '21', 'COOSALUD', '', 0, '0000-00-00', '0000-00-00'),
(139, 35, '22', 'POSITIVA', '', 0, '0000-00-00', '0000-00-00'),
(140, 35, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(141, 36, '20', 'C2', 'CARTAGO', 0, '2021-03-08', '2024-03-12'),
(142, 36, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(143, 36, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(144, 36, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(145, 37, '20', 'C2', 'CARTAGO', 0, '2019-11-12', '2022-11-11'),
(146, 37, '21', 'COOMEVA', '', 0, '0000-00-00', '0000-00-00'),
(147, 37, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(148, 37, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(149, 38, '20', 'C2', 'CARTAGO', 0, '2019-09-09', '2022-09-09'),
(150, 38, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(151, 38, '22', 'POSITIVA', '', 0, '0000-00-00', '0000-00-00'),
(152, 38, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(153, 39, '20', 'C2', 'CARTAGO', 0, '2020-11-12', '2021-11-12'),
(154, 39, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(155, 39, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(156, 39, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(157, 40, '20', 'C1', 'CARTAGO', 0, '2021-03-09', '2024-03-09'),
(158, 40, '21', 'COOSALUD', '', 0, '0000-00-00', '0000-00-00'),
(159, 40, '22', 'POSITIVA', '', 0, '0000-00-00', '0000-00-00'),
(160, 40, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(161, 41, '20', 'C2', 'CARTAGO', 0, '2018-09-21', '2021-09-21'),
(162, 41, '21', 'NUEVA EPS', '', 0, '0000-00-00', '0000-00-00'),
(163, 41, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(164, 41, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(165, 42, '20', 'C1', 'LA VIRGINIA', 0, '2019-09-23', '2022-05-13'),
(166, 42, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(167, 42, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(168, 42, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(169, 43, '20', 'C2', 'CARTAGO', 0, '2018-08-02', '2021-08-02'),
(170, 43, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(171, 43, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(172, 43, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(173, 44, '20', 'C1', 'LA VIRGINIA', 0, '2021-08-05', '2023-08-05'),
(174, 44, '21', 'SANITAS ', '', 0, '0000-00-00', '0000-00-00'),
(175, 44, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(176, 44, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(177, 45, '20', 'C2', 'CARTAGO', 0, '2020-06-17', '2023-06-17'),
(178, 45, '21', 'SANITAS', '', 0, '0000-00-00', '0000-00-00'),
(179, 45, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(180, 45, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(181, 46, '20', 'C1', 'CARTAGO', 0, '2019-09-11', '2022-09-11'),
(182, 46, '21', 'NUEVA EPS', '', 0, '0000-00-00', '0000-00-00'),
(183, 46, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(184, 46, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(185, 47, '20', 'C1', 'CARTAGO', 0, '2019-01-11', '2022-01-11'),
(186, 47, '21', 'NUEVA EPS', '', 0, '0000-00-00', '0000-00-00'),
(187, 47, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(188, 47, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(189, 48, '20', 'C2', 'CARTAGO', 0, '2018-05-18', '2021-05-18'),
(190, 48, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(191, 48, '22', 'SUARETP', '', 0, '0000-00-00', '0000-00-00'),
(192, 48, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(193, 49, '20', 'C1', 'CARTAGO', 0, '2019-11-22', '2022-11-22'),
(194, 49, '21', 'S.O.S ', '', 0, '0000-00-00', '0000-00-00'),
(195, 49, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(196, 49, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(197, 50, '20', 'C1', 'CARTAGO', 0, '2020-07-02', '2023-07-02'),
(198, 50, '21', 'COOMEVA', '', 0, '0000-00-00', '0000-00-00'),
(199, 50, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(200, 50, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(201, 51, '20', 'C2', 'LA UNION', 0, '2018-07-23', '2021-07-23'),
(202, 51, '21', 'COOMEVA', '', 0, '0000-00-00', '0000-00-00'),
(203, 51, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(204, 51, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(205, 52, '20', 'C2', 'CARTAGO', 0, '2019-03-13', '2022-03-13'),
(206, 52, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(207, 52, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(208, 52, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(209, 53, '20', 'C2', 'CARTAGO', 0, '2019-01-25', '2022-01-25'),
(210, 53, '21', 'COOSALUD', '', 0, '0000-00-00', '0000-00-00'),
(211, 53, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(212, 53, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(213, 54, '20', 'C2', 'CARTAGO', 0, '2020-02-28', '2023-02-28'),
(214, 54, '21', 'S.O.S ', '', 0, '0000-00-00', '0000-00-00'),
(215, 54, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(216, 54, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(217, 55, '20', 'C3', 'CARTAGO', 0, '2021-04-21', '2024-04-21'),
(218, 55, '21', 'COOMEVA ', '', 0, '0000-00-00', '0000-00-00'),
(219, 55, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(220, 55, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(221, 56, '20', 'C2', 'CARTAGO', 0, '2019-10-01', '2022-10-01'),
(222, 56, '21', 'COOSALUD', '', 0, '0000-00-00', '0000-00-00'),
(223, 56, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(224, 56, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(225, 57, '20', 'C2', 'CARTAGO', 0, '2020-03-10', '2023-03-10'),
(226, 57, '21', 'AMBUQ', '', 0, '0000-00-00', '0000-00-00'),
(227, 57, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(228, 57, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(229, 58, '20', 'C1', 'CARTAGO', 0, '2020-07-14', '2023-07-14'),
(230, 58, '21', 'BARRIOS UNIDOS ', '', 0, '0000-00-00', '0000-00-00'),
(231, 58, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(232, 58, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(233, 59, '20', 'C1', 'CARTAGO', 0, '2018-10-02', '2021-10-02'),
(234, 59, '21', 'COOMEVA ', '', 0, '0000-00-00', '0000-00-00'),
(235, 59, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(236, 59, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(237, 60, '20', 'C1', 'BUENAVENTURA', 0, '2019-08-15', '2022-08-15'),
(238, 60, '21', 'COOSALUD ', '', 0, '0000-00-00', '0000-00-00'),
(239, 60, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(240, 60, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(241, 61, '20', 'C2', 'LA VIRGINIA', 0, '2020-06-26', '2023-06-26'),
(242, 61, '21', 'SALUD TOTAL', '', 0, '0000-00-00', '0000-00-00'),
(243, 61, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(244, 61, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(245, 62, '20', 'C3', 'CARTAGO', 0, '2018-12-21', '2021-12-21'),
(246, 62, '21', 'COOMEVA', '', 0, '0000-00-00', '0000-00-00'),
(247, 62, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(248, 62, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(249, 63, '20', 'C1', 'CALI', 0, '2019-02-25', '2022-02-25'),
(250, 63, '21', 'SANITAS', '', 0, '0000-00-00', '0000-00-00'),
(251, 63, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(252, 63, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(253, 64, '20', 'C2', 'CARTAGO', 0, '2020-01-17', '2023-01-17'),
(254, 64, '21', 'COOMEVA', '', 0, '0000-00-00', '0000-00-00'),
(255, 64, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(256, 64, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(257, 65, '20', 'C2', 'CALI', 0, '2018-06-25', '2021-06-25'),
(258, 65, '21', 'COOSALUD', '', 0, '0000-00-00', '0000-00-00'),
(259, 65, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(260, 65, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(261, 65, '20', 'C2', 'CARTAGO', 0, '2018-09-21', '2021-09-21'),
(262, 65, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(263, 65, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(264, 65, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(265, 66, '20', 'C1', 'CARTAGO', 0, '2021-01-07', '2024-01-07'),
(266, 66, '21', 'NUEVA EPS', '', 0, '0000-00-00', '0000-00-00'),
(267, 66, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(268, 66, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(269, 67, '20', 'C1', 'CARTAGO', 0, '2019-12-13', '2022-12-13'),
(270, 67, '21', 'SANITAS', '', 0, '0000-00-00', '0000-00-00'),
(271, 67, '22', 'POSITIVA', '', 0, '0000-00-00', '0000-00-00'),
(272, 67, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(273, 68, '20', 'C2', 'CARTAGO', 0, '2019-10-23', '2022-10-23'),
(274, 68, '21', 'SANITAS ', '', 0, '0000-00-00', '0000-00-00'),
(275, 68, '22', 'POSITIVA', '', 0, '0000-00-00', '0000-00-00'),
(276, 68, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(277, 69, '20', 'C2', 'CARTAGO', 0, '2020-07-07', '2023-07-07'),
(278, 69, '21', 'COOMEVA', '', 0, '0000-00-00', '0000-00-00'),
(279, 69, '22', 'LA EQUIDAD', '', 0, '0000-00-00', '0000-00-00'),
(280, 69, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(281, 70, '20', 'C2', 'CARTAGO', 0, '2019-08-30', '2022-08-30'),
(282, 70, '21', 'NUEVA EPS ', '', 0, '0000-00-00', '0000-00-00'),
(283, 70, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(284, 70, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(285, 71, '20', 'C1', 'CARTAGO', 0, '2018-07-30', '2021-07-30'),
(286, 71, '21', 'SANITAS ', '', 0, '0000-00-00', '0000-00-00'),
(287, 71, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(288, 71, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(289, 72, '20', 'C2', 'CARTAGO', 0, '2019-11-08', '2022-11-08'),
(290, 72, '21', 'COOSALUD', '', 0, '0000-00-00', '0000-00-00'),
(291, 72, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(292, 72, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(293, 73, '20', 'C2', 'LA VIRGINIA', 0, '2020-12-15', '2023-12-15'),
(294, 73, '21', 'NUEVA EPS', '', 0, '0000-00-00', '0000-00-00'),
(295, 73, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(296, 73, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(297, 74, '20', 'C2', 'CARTAGO', 0, '2018-07-04', '2021-07-04'),
(298, 74, '21', 'COOMEVA', '', 0, '0000-00-00', '0000-00-00'),
(299, 74, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(300, 74, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(301, 75, '20', 'C2', 'LA VIRGINIA', 0, '2020-09-01', '2023-09-15'),
(302, 75, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(303, 75, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(304, 75, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(305, 76, '20', 'C2', 'CARTAGO', 0, '2020-12-11', '2021-12-11'),
(306, 76, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(307, 76, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(308, 76, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(309, 77, '20', 'C2', 'CARTAGO', 0, '2020-12-30', '2021-12-30'),
(310, 77, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(311, 77, '22', ' POSITIVA', '', 0, '0000-00-00', '0000-00-00'),
(312, 77, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(313, 78, '20', 'C2', 'CARTAGO', 0, '2021-02-04', '2024-02-04'),
(314, 78, '21', 'SANITAS', '', 0, '0000-00-00', '0000-00-00'),
(315, 78, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(316, 78, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(317, 79, '20', 'C2', 'LA VIRGINIA', 0, '2020-09-14', '2021-09-14'),
(318, 79, '21', 'BARRIOS UNIDOS', '', 0, '0000-00-00', '0000-00-00'),
(319, 79, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(320, 79, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(321, 80, '20', 'C2', 'CARTAGO', 0, '2020-01-07', '2023-01-07'),
(322, 80, '21', 'COOMEVA', '', 0, '0000-00-00', '0000-00-00'),
(323, 80, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(324, 80, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(325, 81, '20', 'C2', 'LA VIRGINIA', 0, '2020-12-09', '2023-12-09'),
(326, 81, '21', 'MEDIMAS ', '', 0, '0000-00-00', '0000-00-00'),
(327, 81, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(328, 81, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(329, 82, '20', 'C1', 'PEREIRA', 0, '2018-12-13', '2021-12-13'),
(330, 82, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(331, 82, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(332, 82, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(333, 83, '20', 'C1', 'CARTAGO', 0, '2020-10-23', '2023-10-23'),
(334, 83, '21', 'COOMEVA', '', 0, '0000-00-00', '0000-00-00'),
(335, 83, '22', 'POSITIVA', '', 0, '0000-00-00', '0000-00-00'),
(336, 83, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(337, 84, '20', 'C2', 'CARTAGO', 0, '2020-08-27', '2023-06-27'),
(338, 84, '21', 'NUEVA EPS', '', 0, '0000-00-00', '0000-00-00'),
(339, 84, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(340, 84, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(341, 85, '20', 'C2', 'CARTAGO', 0, '2020-07-09', '2023-07-09'),
(342, 85, '21', 'SANITAS', '', 0, '0000-00-00', '0000-00-00'),
(343, 85, '22', 'LA EQUIDAD', '', 0, '0000-00-00', '0000-00-00'),
(344, 85, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(345, 86, '20', 'C2', 'LA VIRGINIA', 0, '2021-04-06', '2024-04-06'),
(346, 86, '21', 'COOSALUD', '', 0, '0000-00-00', '0000-00-00'),
(347, 86, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(348, 86, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(349, 87, '20', 'C2', 'CARTAGO', 0, '2020-08-03', '2021-08-03'),
(350, 87, '21', 'SANITAS', '', 0, '0000-00-00', '0000-00-00'),
(351, 87, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(352, 87, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(353, 88, '20', 'C2', 'CARTAGO', 0, '2021-03-25', '2022-03-25'),
(354, 88, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(355, 88, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(356, 88, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(357, 89, '20', 'C2', 'CARTAGO', 0, '2018-06-08', '2021-06-08'),
(358, 89, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(359, 89, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(360, 89, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(361, 90, '20', 'C2', 'LA VIRGINIA', 0, '2018-06-25', '2021-06-25'),
(362, 90, '21', 'COLSANITAS', '', 0, '0000-00-00', '0000-00-00'),
(363, 90, '22', 'POSITIVA', '', 0, '0000-00-00', '0000-00-00'),
(364, 90, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(365, 91, '20', 'C1', 'LA VIRGINIA', 0, '2020-10-09', '2021-10-09'),
(366, 91, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(367, 91, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(368, 91, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(369, 92, '20', 'C2', 'CARTAGO', 0, '2020-11-10', '2021-11-10'),
(370, 92, '21', 'NUEVA EPS', '', 0, '0000-00-00', '0000-00-00'),
(371, 92, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(372, 92, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(373, 93, '20', 'C2', 'LA VIRGINIA', 0, '2021-03-09', '2022-03-09'),
(374, 93, '21', 'NUEVA EPS', '', 0, '0000-00-00', '0000-00-00'),
(375, 93, '22', 'POSITIVA', '', 0, '0000-00-00', '0000-00-00'),
(376, 93, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(377, 94, '20', 'C1', 'CARTAGO ', 0, '2018-07-25', '2021-07-25'),
(378, 94, '21', 'NUEVA EPS', '', 0, '0000-00-00', '0000-00-00'),
(379, 94, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(380, 94, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(381, 95, '20', 'C1', 'CARTAGO', 0, '2018-12-12', '2021-12-12'),
(382, 95, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(383, 95, '22', 'POSITIVA', '', 0, '0000-00-00', '0000-00-00'),
(384, 95, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(385, 96, '20', 'C2', 'CARTAGO', 0, '2020-11-30', '2023-11-30'),
(386, 96, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(387, 96, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(388, 96, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(389, 97, '20', 'C2', 'CARTAGO', 0, '2019-08-12', '2022-08-12'),
(390, 97, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(391, 97, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(392, 97, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(393, 98, '20', 'C2', 'CARTAGO ', 0, '2019-01-08', '2022-01-08'),
(394, 98, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(395, 98, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(396, 98, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(397, 99, '20', 'C2', 'LA VIRGINIA', 0, '2020-07-02', '2021-07-02'),
(398, 99, '21', 'S.O.S-PENSIONADO-', '', 0, '0000-00-00', '0000-00-00'),
(399, 99, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(400, 99, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(401, 100, '20', 'C2', 'CARTAGO', 0, '2020-06-16', '2023-06-16'),
(402, 100, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(403, 100, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(404, 100, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(405, 101, '20', 'C1', 'CARTAGO', 0, '2020-10-13', '2021-10-13'),
(406, 101, '21', 'SANITAS', '', 0, '0000-00-00', '0000-00-00'),
(407, 101, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(408, 101, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(409, 102, '20', 'C2', 'LA VIRGINIA', 0, '2020-02-17', '2023-02-17'),
(410, 102, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(411, 102, '22', 'SURTAEP', '', 0, '0000-00-00', '0000-00-00'),
(412, 102, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(413, 103, '20', 'C2', 'CARTAGO', 0, '2020-09-18', '2023-09-18'),
(414, 103, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(415, 103, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(416, 103, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(417, 104, '20', 'C2', 'LA VIRGINIA', 0, '2021-02-17', '2024-02-17'),
(418, 104, '21', 'COOSALUD', '', 0, '0000-00-00', '0000-00-00'),
(419, 104, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(420, 104, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(421, 105, '20', 'C2', 'CARTAGO', 0, '2020-06-27', '2021-06-27'),
(422, 105, '21', '', '', 0, '0000-00-00', '0000-00-00'),
(423, 105, '22', '', '', 0, '0000-00-00', '0000-00-00'),
(424, 105, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(425, 106, '20', 'C2', 'CARTAGO', 0, '2020-07-10', '2021-07-10'),
(426, 106, '21', 'COOSALUD', '', 0, '0000-00-00', '0000-00-00'),
(427, 106, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(428, 106, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(429, 107, '20', 'C1', 'CARTAGO', 0, '2021-02-09', '2024-02-09'),
(430, 107, '21', '', '', 0, '0000-00-00', '0000-00-00'),
(431, 107, '22', '', '', 0, '0000-00-00', '0000-00-00'),
(432, 107, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(433, 108, '20', 'C2', 'LA VIRGINIA', 0, '2020-09-03', '2023-09-03'),
(434, 108, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(435, 108, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(436, 108, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(437, 109, '20', 'C2', 'CARTAGO', 0, '2018-11-06', '2021-11-06'),
(438, 109, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(439, 109, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(440, 109, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(441, 110, '20', 'C1', 'CARTAGO', 0, '2020-06-18', '2023-06-18'),
(442, 110, '21', 'SANITAS ', '', 0, '0000-00-00', '0000-00-00'),
(443, 110, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(444, 110, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(445, 111, '20', 'C2', 'CARTAGO', 0, '2020-11-26', '2023-11-26'),
(446, 111, '21', 'COOSALUD', '', 0, '0000-00-00', '0000-00-00'),
(447, 111, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(448, 111, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(449, 112, '20', 'C2', 'CARTAGO', 0, '2019-07-11', '2022-07-11'),
(450, 112, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(451, 112, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(452, 112, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(453, 113, '20', 'C1', 'CALARCA', 0, '2018-06-12', '2021-06-12'),
(454, 113, '21', 'SURA', '', 0, '0000-00-00', '0000-00-00'),
(455, 113, '22', 'SURA', '', 0, '0000-00-00', '0000-00-00'),
(456, 113, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(457, 114, '20', 'C2', 'CARTAGO', 0, '2020-12-30', '2021-12-30'),
(458, 114, '21', 'PENSIONADO', '', 0, '0000-00-00', '0000-00-00'),
(459, 114, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(460, 114, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(461, 115, '20', 'C2', 'CARTAGO', 0, '2018-06-19', '2021-06-19'),
(462, 115, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(463, 115, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(464, 115, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(465, 116, '20', 'C2', 'LA VIRGINIA', 0, '2020-12-22', '2021-12-22'),
(466, 116, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(467, 116, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(468, 116, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(469, 117, '20', 'C2', 'CARTAGO', 0, '2020-08-26', '2021-08-26'),
(470, 117, '21', 'MEDIMAS', '', 0, '0000-00-00', '0000-00-00'),
(471, 117, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(472, 117, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(473, 118, '20', 'C2', 'CARTAGO', 0, '2019-09-28', '2021-09-28'),
(474, 118, '21', 'SANITAS', '', 0, '0000-00-00', '0000-00-00'),
(475, 118, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(476, 118, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(477, 119, '20', 'C2', 'CARTAGO', 0, '2020-07-09', '2023-07-09'),
(478, 119, '21', 'COOSALUD', '', 0, '0000-00-00', '0000-00-00'),
(479, 119, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(480, 119, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(481, 120, '20', 'C2', 'CARTAGO', 0, '2021-02-26', '2022-02-26'),
(482, 120, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(483, 120, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(484, 120, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(485, 121, '20', 'C2', 'DOSQUEBRADAS', 0, '2019-06-11', '2022-06-11'),
(486, 121, '21', 'NUEVA EPS', '', 0, '0000-00-00', '0000-00-00'),
(487, 121, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(488, 121, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(489, 122, '20', 'C1', 'CARTAGO', 0, '2020-07-24', '2023-07-24'),
(490, 122, '21', 'COOMEVA', '', 0, '0000-00-00', '0000-00-00'),
(491, 122, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(492, 122, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(493, 123, '20', 'C2', 'LA VIRGINIA', 0, '2020-11-03', '2023-11-03'),
(494, 123, '21', 'COOMEVA', '', 0, '0000-00-00', '0000-00-00'),
(495, 123, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(496, 123, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(497, 124, '20', 'C1', 'CARTAGO ', 0, '2020-07-22', '2023-07-22'),
(498, 124, '21', 'COOSALUD', '', 0, '0000-00-00', '0000-00-00'),
(499, 124, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(500, 124, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(501, 125, '20', 'C2', 'CARTAGO', 0, '2018-05-16', '2021-05-16'),
(502, 125, '21', 'SANITAS ', '', 0, '0000-00-00', '0000-00-00'),
(503, 125, '22', 'POSITIVA', '', 0, '0000-00-00', '0000-00-00'),
(504, 125, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(505, 126, '20', 'C2', 'CARTAGO', 0, '2019-04-22', '2022-04-22'),
(506, 126, '21', 'COOMEVA ', '', 0, '0000-00-00', '0000-00-00'),
(507, 126, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(508, 126, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(509, 127, '20', 'C1', 'CARTAGO', 0, '2019-09-04', '2022-09-04'),
(510, 127, '21', 'COOSALUD', '', 0, '0000-00-00', '0000-00-00'),
(511, 127, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(512, 127, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(513, 128, '20', 'C1', 'CARTAGO', 0, '2019-09-30', '2022-09-30'),
(514, 128, '21', 'COOSALUD', '', 0, '0000-00-00', '0000-00-00'),
(515, 128, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(516, 128, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(517, 129, '20', 'C2', 'CARTAGO', 0, '2019-10-23', '2022-10-23'),
(518, 129, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(519, 129, '22', 'SURAETEP', '', 0, '0000-00-00', '0000-00-00'),
(520, 129, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(521, 130, '20', 'C2', 'CARTAGO', 0, '2018-07-31', '2021-07-31'),
(522, 130, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(523, 130, '22', ' SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(524, 130, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(525, 131, '20', 'C1', 'CARTAGO', 0, '2020-01-03', '2023-01-03'),
(526, 131, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(527, 131, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(528, 131, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(529, 132, '20', 'C1', 'CARTAGO', 0, '2018-09-04', '2021-09-04'),
(530, 132, '21', 'NUEVA EPS', '', 0, '0000-00-00', '0000-00-00'),
(531, 132, '22', 'POSITIVA', '', 0, '0000-00-00', '0000-00-00'),
(532, 132, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(533, 133, '20', 'C2', 'CARTAGO', 0, '2020-11-19', '2023-11-19'),
(534, 133, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(535, 133, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(536, 133, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(537, 134, '20', 'C2', 'CARTAGO', 0, '2019-04-05', '2022-04-05'),
(538, 134, '21', 'COOMEVA', '', 0, '0000-00-00', '0000-00-00'),
(539, 134, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(540, 134, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(541, 135, '20', 'C2', 'CARTAGO', 0, '2019-01-18', '2022-01-18'),
(542, 135, '21', 'NUEVA EPS ', '', 0, '0000-00-00', '0000-00-00'),
(543, 135, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(544, 135, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(545, 136, '20', 'C2', 'LA VIRGINIA', 0, '2021-04-06', '2024-04-06'),
(546, 136, '21', 'COOSALUD ', '', 0, '0000-00-00', '0000-00-00'),
(547, 136, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(548, 136, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(549, 137, '20', 'C2', 'CARTAGO', 0, '2020-07-01', '2023-07-01'),
(550, 137, '21', 'COOMEVA', '', 0, '0000-00-00', '0000-00-00'),
(551, 137, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(552, 137, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(553, 138, '20', 'C1', 'CARTAGO', 0, '2019-05-21', '2022-05-21'),
(554, 138, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(555, 138, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(556, 138, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(557, 139, '20', 'C1', 'CARTAGO', 0, '2019-10-22', '2022-10-22'),
(558, 139, '21', 'SANITAS', '', 0, '0000-00-00', '0000-00-00'),
(559, 139, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(560, 139, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(561, 140, '20', 'c2', 'PEREIRA', 0, '2019-01-15', '2022-01-15'),
(562, 140, '21', 'SANITAS', '', 0, '0000-00-00', '0000-00-00'),
(563, 140, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(564, 140, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(565, 141, '20', 'C2', 'RONDANILLO', 0, '2019-03-27', '2022-03-27'),
(566, 141, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(567, 141, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(568, 141, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(569, 142, '20', 'C2', 'CARTAGO', 0, '2020-07-17', '2023-07-07'),
(570, 142, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(571, 142, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(572, 142, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(573, 143, '20', 'C2', 'CARTAGO', 0, '2016-06-26', '2022-06-26'),
(574, 143, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(575, 143, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(576, 143, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(577, 144, '20', 'C1', 'CARTAGO', 0, '2019-06-13', '2022-06-13'),
(578, 144, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(579, 144, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(580, 144, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(581, 145, '20', 'C1', 'CARTAGO', 0, '2019-05-31', '2022-05-31'),
(582, 145, '21', 'SANITAS', '', 0, '0000-00-00', '0000-00-00'),
(583, 145, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(584, 145, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(585, 146, '20', 'C2', 'LA VIRGINIA', 0, '2020-02-03', '2023-02-03'),
(586, 146, '21', 'COOSALUD', '', 0, '0000-00-00', '0000-00-00'),
(587, 146, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(588, 146, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(589, 147, '20', 'C2', 'LA VIRGINIA', 0, '2020-07-06', '2023-07-06'),
(590, 147, '21', 'BARRIOS UNIDOS', '', 0, '0000-00-00', '0000-00-00'),
(591, 147, '22', 'POSITIVA', '', 0, '0000-00-00', '0000-00-00'),
(592, 147, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(593, 148, '20', 'C2', 'GINEBRA', 0, '2020-10-13', '2021-09-19'),
(594, 148, '21', 'COOMEVA ', '', 0, '0000-00-00', '0000-00-00'),
(595, 148, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(596, 148, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(597, 149, '20', 'C2', 'LA UNION', 0, '2021-02-18', '2022-02-18'),
(598, 149, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(599, 149, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(600, 149, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(601, 150, '20', 'C2', 'CARTAGO', 0, '2018-10-02', '2021-10-02'),
(602, 150, '21', 'NUEVA EPS', '', 0, '0000-00-00', '0000-00-00'),
(603, 150, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(604, 150, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(605, 151, '20', 'C2', 'CARTAGO', 0, '2019-02-19', '2022-02-19'),
(606, 151, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(607, 151, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(608, 151, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(609, 152, '20', 'C3', 'LA UNION', 0, '2018-05-07', '2021-05-07'),
(610, 152, '21', 'NUEVA EPS', '', 0, '0000-00-00', '0000-00-00'),
(611, 152, '22', 'POSITIVA', '', 0, '0000-00-00', '0000-00-00'),
(612, 152, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(613, 153, '20', 'C1', 'CARTAGO', 0, '2020-06-25', '2021-06-25'),
(614, 153, '21', 'SANITAS', '', 0, '0000-00-00', '0000-00-00'),
(615, 153, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(616, 153, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(617, 154, '20', 'C1', 'CARTAGO', 0, '2020-03-20', '2023-03-20'),
(618, 154, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(619, 154, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(620, 154, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(621, 155, '20', 'C2', 'LA VIRGINIA', 0, '2020-10-31', '2023-10-31'),
(622, 155, '21', 'COOSALUD', '', 0, '0000-00-00', '0000-00-00'),
(623, 155, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(624, 155, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(625, 156, '20', 'C2', 'CARTAGO', 0, '2018-11-26', '2021-11-26'),
(626, 156, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(627, 156, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(628, 156, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(629, 157, '20', 'C1', 'CARTAGO', 0, '2019-03-21', '2022-03-21'),
(630, 157, '21', 'PENSIONADO', '', 0, '0000-00-00', '0000-00-00'),
(631, 157, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(632, 157, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(633, 158, '20', 'C1', 'LA VIRGINIA', 0, '2020-11-06', '2023-11-06'),
(634, 158, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(635, 158, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(636, 158, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(637, 159, '20', 'C1', 'CARTAGO', 0, '2019-01-29', '2022-01-29'),
(638, 159, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(639, 159, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(640, 159, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(641, 160, '20', 'C3', 'LA VIRGINIA', 0, '2021-02-18', '2022-02-18'),
(642, 160, '21', 'PENSIONADO', '', 0, '0000-00-00', '0000-00-00'),
(643, 160, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(644, 160, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(645, 161, '20', 'C2', 'CARTAGO', 0, '2021-03-23', '2022-08-28'),
(646, 161, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(647, 161, '22', 'LA EQUIDAD', '', 0, '0000-00-00', '0000-00-00'),
(648, 161, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(649, 162, '20', 'C3', 'CARTAGO', 0, '2018-07-19', '2021-07-19'),
(650, 162, '21', 'SANITAS', '', 0, '0000-00-00', '0000-00-00'),
(651, 162, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(652, 162, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(653, 163, '20', 'C2', 'CARTAGO', 0, '2021-03-31', '2022-03-31'),
(654, 163, '21', 'S.O.S-PENSIONADO', '', 0, '0000-00-00', '0000-00-00'),
(655, 163, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(656, 163, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(657, 164, '20', 'C2', 'CALI', 0, '2020-12-11', '2021-12-11'),
(658, 164, '21', 'PENSIONADO', '', 0, '0000-00-00', '0000-00-00'),
(659, 164, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(660, 164, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(661, 165, '20', 'C2', 'CARTAGO', 0, '2020-09-28', '2021-09-28'),
(662, 165, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(663, 165, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(664, 165, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(665, 166, '20', 'C2', 'CARTAGO', 0, '2020-06-09', '2021-06-09'),
(666, 166, '21', 'COOSALUD', '', 0, '0000-00-00', '0000-00-00'),
(667, 166, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(668, 166, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(669, 167, '20', 'C2', 'CARTAGO', 0, '2021-01-08', '2022-01-08'),
(670, 167, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(671, 167, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(672, 167, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(673, 168, '20', 'C1', 'CARTAGO', 0, '2019-08-13', '2022-08-13'),
(674, 168, '21', '', '', 0, '0000-00-00', '0000-00-00'),
(675, 168, '22', '', '', 0, '0000-00-00', '0000-00-00'),
(676, 168, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(677, 169, '20', 'C1', 'CARTAGO', 0, '2020-10-26', '2021-10-26'),
(678, 169, '21', 'COOMEVA', '', 0, '0000-00-00', '0000-00-00'),
(679, 169, '22', 'LA EQUIDAD', '', 0, '0000-00-00', '0000-00-00'),
(680, 169, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(681, 170, '20', 'C2', 'CARTAGO', 0, '2021-03-15', '2022-04-15'),
(682, 170, '21', 'S.O.S ', '', 0, '0000-00-00', '0000-00-00'),
(683, 170, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(684, 170, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(685, 171, '20', 'C2', 'CARTAGO', 0, '2019-05-17', '2022-05-17'),
(686, 171, '21', 'COOMEVA', '', 0, '0000-00-00', '0000-00-00'),
(687, 171, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(688, 171, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(689, 172, '20', 'C1', 'CARTAGO', 0, '2019-12-03', '2022-12-03'),
(690, 172, '21', 'COOMEVA', '', 0, '0000-00-00', '0000-00-00'),
(691, 172, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(692, 172, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(693, 173, '20', 'C2', 'CARTAGO', 0, '2021-02-15', '2022-02-15'),
(694, 173, '21', 'COOSALUD', '', 0, '0000-00-00', '0000-00-00'),
(695, 173, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(696, 173, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(697, 174, '20', 'C2', 'PEREIRA', 0, '2018-12-03', '2021-12-03'),
(698, 174, '21', 'COOMEVA', '', 0, '0000-00-00', '0000-00-00'),
(699, 174, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(700, 174, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(701, 175, '20', 'C2', 'CARTAGO', 0, '2021-04-16', '2024-04-16'),
(702, 175, '21', 'SOS', '', 0, '0000-00-00', '0000-00-00'),
(703, 175, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(704, 175, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(705, 176, '20', 'C2', 'CARTAGO', 0, '2020-03-13', '2023-03-13'),
(706, 176, '21', 'MEDIMAS', '', 0, '0000-00-00', '0000-00-00'),
(707, 176, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(708, 176, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(709, 177, '20', 'C2', 'BUENAVENTURA', 0, '2020-12-03', '2023-12-03'),
(710, 177, '21', 'COOMEVA', '', 0, '0000-00-00', '0000-00-00'),
(711, 177, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(712, 177, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(713, 178, '20', 'C1', 'CARTAGO', 0, '2019-02-28', '2021-08-03'),
(714, 178, '21', 'S.O.S ', '', 0, '0000-00-00', '0000-00-00'),
(715, 178, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(716, 178, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(717, 179, '20', 'C2', 'LA VIRGINIA', 0, '2020-11-13', '2023-11-13'),
(718, 179, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(719, 179, '22', 'LA EQUIDAD', '', 0, '0000-00-00', '0000-00-00'),
(720, 179, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(721, 180, '20', 'C3', 'CARTGAO', 0, '2019-06-13', '2022-06-13'),
(722, 180, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(723, 180, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(724, 180, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(725, 181, '20', 'C1', 'CARTAGO', 0, '2019-10-21', '2022-10-21'),
(726, 181, '21', 'COOMEVA', '', 0, '0000-00-00', '0000-00-00'),
(727, 181, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(728, 181, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(729, 182, '20', 'C2', 'CARTAGO', 0, '2021-03-03', '2024-03-03'),
(730, 182, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(731, 182, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(732, 182, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(733, 183, '20', 'C2', 'DOSQUEBRADAS', 0, '2019-06-10', '2022-06-10'),
(734, 183, '21', 'SANITAS', '', 0, '0000-00-00', '0000-00-00'),
(735, 183, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(736, 183, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(737, 184, '20', 'C2', 'LA VIRGINIA', 0, '2020-07-08', '2021-07-08'),
(738, 184, '21', 'NUEVA EPS', '', 0, '0000-00-00', '0000-00-00'),
(739, 184, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(740, 184, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(741, 185, '20', 'C2', 'CARTAGO', 0, '2018-11-06', '2021-11-06'),
(742, 185, '21', 'COOSALUD', '', 0, '0000-00-00', '0000-00-00'),
(743, 185, '22', 'POSITIVA', '', 0, '0000-00-00', '0000-00-00'),
(744, 185, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(745, 186, '20', 'C2', 'CARTAGO', 0, '2019-12-02', '2022-12-02'),
(746, 186, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(747, 186, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(748, 186, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(749, 187, '20', 'C2', 'CARTAGO', 0, '2020-02-06', '2023-02-06'),
(750, 187, '21', 'SANITAS', '', 0, '0000-00-00', '0000-00-00'),
(751, 187, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(752, 187, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(753, 188, '20', 'C1', 'CARTAGO', 0, '2020-07-07', '2021-07-07'),
(754, 188, '21', 'S.O.S ', '', 0, '0000-00-00', '0000-00-00'),
(755, 188, '22', 'POSITIVA', '', 0, '0000-00-00', '0000-00-00'),
(756, 188, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(757, 189, '20', 'C2', 'CARTAGO', 0, '2020-06-26', '2023-06-26'),
(758, 189, '21', 'COOMEVA', '', 0, '0000-00-00', '0000-00-00'),
(759, 189, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(760, 189, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(761, 190, '20', 'C2', 'CARTAGO', 0, '2020-08-31', '2023-08-31'),
(762, 190, '21', 'NUEVA EPS', '', 0, '0000-00-00', '0000-00-00'),
(763, 190, '22', 'LA EQUIDAD', '', 0, '0000-00-00', '0000-00-00'),
(764, 190, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(765, 191, '20', 'C2', 'LA VIRGINIA', 0, '2021-04-23', '2024-04-23'),
(766, 191, '21', 'COOMEVA', '', 0, '0000-00-00', '0000-00-00'),
(767, 191, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(768, 191, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(769, 192, '20', 'C1', 'CARTAGO', 0, '2018-07-30', '2021-07-30'),
(770, 192, '21', 'COOMEVA', '', 0, '0000-00-00', '0000-00-00'),
(771, 192, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(772, 192, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(773, 193, '20', 'C2', 'CARTAGO', 0, '2020-12-17', '2023-12-17'),
(774, 193, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(775, 193, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(776, 193, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(777, 194, '20', 'C1', 'CARTAGO', 0, '2018-07-27', '2021-07-27'),
(778, 194, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(779, 194, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(780, 194, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(781, 195, '20', 'C1', 'CARTAGO', 0, '2019-10-19', '2022-10-19'),
(782, 195, '21', 'COOMEVA', '', 0, '0000-00-00', '0000-00-00'),
(783, 195, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(784, 195, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(785, 196, '20', 'C2', 'LA VIRGINIA', 0, '2020-07-07', '2023-07-07'),
(786, 196, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(787, 196, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(788, 196, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(789, 197, '20', 'C2', 'CARTAGO', 0, '2019-12-12', '2022-12-12'),
(790, 197, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(791, 197, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(792, 197, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(793, 198, '20', 'C2', 'LA UNION', 0, '2021-01-26', '2022-01-26'),
(794, 198, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(795, 198, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(796, 198, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(797, 199, '20', 'C2', 'LA VIRGINIA', 0, '2020-08-20', '2023-08-20'),
(798, 199, '21', 'NUEVA EPS', '', 0, '0000-00-00', '0000-00-00'),
(799, 199, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(800, 199, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(801, 200, '20', 'C3', 'LA VIRGINIA', 0, '2020-10-29', '2021-10-29'),
(802, 200, '21', 'PENSIONADO', '', 0, '0000-00-00', '0000-00-00'),
(803, 200, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(804, 200, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(805, 201, '20', 'C1', 'CARTAGO', 0, '2019-01-08', '2022-01-08'),
(806, 201, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(807, 201, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(808, 201, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(809, 202, '20', 'C2', 'CARTAGO', 0, '2021-02-02', '2024-02-02'),
(810, 202, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(811, 202, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(812, 202, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(813, 203, '20', 'C2', 'CARTAGO', 0, '2018-12-13', '2021-12-13'),
(814, 203, '21', 'BARRIOS UNIDOS ', '', 0, '0000-00-00', '0000-00-00'),
(815, 203, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(816, 203, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(817, 204, '20', 'C2', 'CARTAGO', 0, '2020-10-28', '2023-10-28'),
(818, 204, '21', 'NUEVA EPS ', '', 0, '0000-00-00', '0000-00-00'),
(819, 204, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(820, 204, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(821, 205, '20', 'C1', 'CARTAGO', 0, '2019-12-13', '2022-12-13'),
(822, 205, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00');
INSERT INTO `con_doc` (`id`, `id_conductor`, `id_doc`, `numero`, `categoria`, `id_eps`, `fecha_ant`, `fecha_vence`) VALUES
(823, 205, '22', 'SURTEP', '', 0, '0000-00-00', '0000-00-00'),
(824, 205, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(825, 206, '20', 'C1', 'CARTAGO', 0, '2019-06-05', '2022-06-05'),
(826, 206, '21', 'BARRIOS UNIDOS ', '', 0, '0000-00-00', '0000-00-00'),
(827, 206, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(828, 206, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(829, 207, '20', 'C1', 'CARTAGO', 0, '2020-10-02', '2023-10-02'),
(830, 207, '21', 'NUEVA EPS', '', 0, '0000-00-00', '0000-00-00'),
(831, 207, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(832, 207, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(833, 208, '20', 'C1', 'CARTAGO', 0, '2021-03-23', '2022-03-23'),
(834, 208, '21', 'COOMEVA', '', 0, '0000-00-00', '0000-00-00'),
(835, 208, '22', 'POSITIVA', '', 0, '0000-00-00', '0000-00-00'),
(836, 208, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(837, 209, '20', 'C2', 'CARTAGO', 0, '2020-09-25', '2023-09-25'),
(838, 209, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(839, 209, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(840, 209, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(841, 210, '20', 'C1', 'CARTAGO', 0, '2019-04-04', '2022-04-04'),
(842, 210, '21', 'NUEVA EPS ', '', 0, '0000-00-00', '0000-00-00'),
(843, 210, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(844, 210, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(845, 211, '20', 'C2', 'CARTAGO', 0, '2020-02-17', '2023-02-17'),
(846, 211, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(847, 211, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(848, 211, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(849, 212, '20', 'C3', 'CARTAGO', 0, '2020-10-13', '2021-10-13'),
(850, 212, '21', 'PENSIONDO', '', 0, '0000-00-00', '0000-00-00'),
(851, 212, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(852, 212, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(853, 213, '20', 'C2', 'CARTAGO', 0, '2020-07-02', '2021-07-02'),
(854, 213, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(855, 213, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(856, 213, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(857, 214, '20', 'C2', 'CARTAGO', 0, '2019-03-08', '2022-03-08'),
(858, 214, '21', 'SANITAS ', '', 0, '0000-00-00', '0000-00-00'),
(859, 214, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(860, 214, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(861, 215, '20', 'C2', 'LA VIRGINIA', 0, '2020-11-03', '2023-11-03'),
(862, 215, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(863, 215, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(864, 215, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(865, 216, '20', 'C2', 'CARTAGO', 0, '2019-08-23', '2022-08-23'),
(866, 216, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(867, 216, '22', ' POSITIVA', '', 0, '0000-00-00', '0000-00-00'),
(868, 216, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(869, 217, '20', 'C2', 'CARTAGO', 0, '2021-04-13', '2022-04-13'),
(870, 217, '21', 'NUEVA EPS', '', 0, '0000-00-00', '0000-00-00'),
(871, 217, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(872, 217, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(873, 218, '20', 'C2', 'CARTAGO', 0, '2021-01-13', '2022-01-14'),
(874, 218, '21', 'S.O.S-PENSIONADO', '', 0, '0000-00-00', '0000-00-00'),
(875, 218, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(876, 218, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(877, 219, '20', 'C2', 'CARTAGO', 0, '2018-05-28', '2021-05-28'),
(878, 219, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(879, 219, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(880, 219, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(881, 220, '20', 'C2', 'CARTAGO ', 0, '2020-07-03', '2021-07-03'),
(882, 220, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(883, 220, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(884, 220, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(885, 221, '20', 'C2', 'CARTAGO', 0, '2019-04-23', '2022-04-23'),
(886, 221, '21', 'COOSALUD', '', 0, '0000-00-00', '0000-00-00'),
(887, 221, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(888, 221, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(889, 222, '20', 'C2', 'CARTAGO', 0, '2020-12-21', '2023-12-21'),
(890, 222, '21', 'COOSALUD', '', 0, '0000-00-00', '0000-00-00'),
(891, 222, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(892, 222, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(893, 223, '20', 'C2', 'CARTAGO', 0, '2020-06-23', '2023-06-23'),
(894, 223, '21', 'SANITAS', '', 0, '0000-00-00', '0000-00-00'),
(895, 223, '22', 'POSITIVA', '', 0, '0000-00-00', '0000-00-00'),
(896, 223, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(897, 224, '20', 'C2', 'CARTAGO', 0, '2020-07-28', '2023-07-28'),
(898, 224, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(899, 224, '22', 'SURA', '', 0, '0000-00-00', '0000-00-00'),
(900, 224, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(901, 225, '20', 'C2', 'CARTAGO', 0, '2019-07-22', '2022-07-22'),
(902, 225, '21', 'NUEVA EPS', '', 0, '0000-00-00', '0000-00-00'),
(903, 225, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(904, 225, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(905, 226, '20', 'C1', 'LA UNION', 0, '2020-09-08', '2021-09-08'),
(906, 226, '21', '', '', 0, '0000-00-00', '0000-00-00'),
(907, 226, '22', '', '', 0, '0000-00-00', '0000-00-00'),
(908, 226, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(909, 227, '20', 'C2', 'CARTAGO', 0, '2020-06-25', '2023-06-25'),
(910, 227, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(911, 227, '22', 'POSITIVA', '', 0, '0000-00-00', '0000-00-00'),
(912, 227, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(913, 228, '20', 'C2', 'CARTAGO', 0, '2021-03-23', '2024-03-23'),
(914, 228, '21', 'COOSALUD', '', 0, '0000-00-00', '0000-00-00'),
(915, 228, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(916, 228, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(917, 229, '20', 'C1', 'CARTAGO', 0, '2018-06-20', '2021-06-20'),
(918, 229, '21', 'COOSALUD', '', 0, '0000-00-00', '0000-00-00'),
(919, 229, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(920, 229, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(921, 230, '20', 'C2', 'CARTAGO', 0, '2020-06-25', '2021-06-25'),
(922, 230, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(923, 230, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(924, 230, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(925, 231, '20', 'C2', 'LA VIRGINIA', 0, '2020-11-27', '2023-11-27'),
(926, 231, '21', 'SANITAS', '', 0, '0000-00-00', '0000-00-00'),
(927, 231, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(928, 231, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(929, 232, '20', 'C2', 'CARTAGO', 0, '2020-06-10', '2023-06-10'),
(930, 232, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(931, 232, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(932, 232, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(933, 233, '20', 'C2', 'CARTAGO', 0, '2020-07-10', '2023-07-10'),
(934, 233, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(935, 233, '22', 'LA EQUIDAD', '', 0, '0000-00-00', '0000-00-00'),
(936, 233, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(937, 234, '20', 'C2', 'CARTAGO', 0, '2019-11-26', '2022-11-25'),
(938, 234, '21', 'EPS', '', 0, '0000-00-00', '0000-00-00'),
(939, 234, '22', 'POSITIVA', '', 0, '0000-00-00', '0000-00-00'),
(940, 234, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(941, 235, '20', 'C2', 'LA VIRGINIA', 0, '2020-11-17', '2021-11-17'),
(942, 235, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(943, 235, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(944, 235, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(945, 236, '20', 'C1', 'CARTAGO', 0, '2020-07-14', '2023-07-14'),
(946, 236, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(947, 236, '22', 'POSITIVA', '', 0, '0000-00-00', '0000-00-00'),
(948, 236, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(949, 237, '20', 'C1', 'CARTAGO', 0, '2019-05-13', '2022-05-13'),
(950, 237, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(951, 237, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(952, 237, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(953, 238, '20', 'C1', 'CARTGAO', 0, '2021-02-04', '2024-02-04'),
(954, 238, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(955, 238, '22', 'LA EQUIDAD', '', 0, '0000-00-00', '0000-00-00'),
(956, 238, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(957, 239, '20', 'C1', 'CARTAGO', 0, '2020-06-12', '2023-06-12'),
(958, 239, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(959, 239, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(960, 239, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(961, 240, '20', 'C1', 'CARTAGO', 0, '2020-08-26', '2023-08-26'),
(962, 240, '21', 'BARRIOS UNIDOS', '', 0, '0000-00-00', '0000-00-00'),
(963, 240, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(964, 240, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(965, 241, '20', 'C1', 'LA VIRGINIA', 0, '2020-10-26', '2023-10-26'),
(966, 241, '21', 'S.O.S ', '', 0, '0000-00-00', '0000-00-00'),
(967, 241, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(968, 241, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(969, 242, '20', 'C2', 'LA VIRGINIA', 0, '2020-02-26', '2023-02-26'),
(970, 242, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(971, 242, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(972, 242, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(973, 243, '20', 'C2', 'CARTAGO', 0, '2020-08-28', '2023-08-28'),
(974, 243, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(975, 243, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(976, 243, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(977, 244, '20', 'C1', 'LA VIRGINIA', 0, '2020-10-05', '2023-10-05'),
(978, 244, '21', 'COOMEVA', '', 0, '0000-00-00', '0000-00-00'),
(979, 244, '22', 'COLPENSIONES', '', 0, '0000-00-00', '0000-00-00'),
(980, 244, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(981, 245, '20', 'C2', 'CARTAGO', 0, '2020-07-14', '2023-07-14'),
(982, 245, '21', 'SANITAS', '', 0, '0000-00-00', '0000-00-00'),
(983, 245, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(984, 245, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(985, 246, '20', 'C2', 'CARTAGO', 0, '2019-11-26', '2022-11-26'),
(986, 246, '21', 'SANITAS', '', 0, '0000-00-00', '0000-00-00'),
(987, 246, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(988, 246, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(989, 247, '20', 'C1', 'CARTAGO', 0, '2020-02-19', '2023-02-19'),
(990, 247, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(991, 247, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(992, 247, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(993, 248, '20', 'C2', 'CARTAGO', 0, '2029-07-24', '2022-07-24'),
(994, 248, '21', 'COOSALUD', '', 0, '0000-00-00', '0000-00-00'),
(995, 248, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(996, 248, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(997, 249, '20', 'c2', 'LA VIRGINIA', 0, '2020-11-05', '2021-11-05'),
(998, 249, '21', '', '', 0, '0000-00-00', '0000-00-00'),
(999, 249, '22', '', '', 0, '0000-00-00', '0000-00-00'),
(1000, 249, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(1001, 250, '20', 'C1', 'CARTAGO', 0, '2021-01-22', '2022-01-22'),
(1002, 250, '21', 'COOMEVA', '', 0, '0000-00-00', '0000-00-00'),
(1003, 250, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(1004, 250, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(1005, 251, '20', 'C1', 'CARTAGO', 0, '2020-06-09', '2023-06-09'),
(1006, 251, '21', 'PENSIONADO', '', 0, '0000-00-00', '0000-00-00'),
(1007, 251, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(1008, 251, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(1009, 252, '20', 'C2', 'CARTAGO', 0, '2021-02-26', '2024-02-26'),
(1010, 252, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(1011, 252, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(1012, 252, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(1013, 253, '20', 'C2', 'CARTAGO', 0, '2019-04-09', '2022-04-09'),
(1014, 253, '21', 'SANITAS', '', 0, '0000-00-00', '0000-00-00'),
(1015, 253, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(1016, 253, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(1017, 254, '20', 'C1', 'CARTAGO', 0, '2019-03-12', '2022-03-12'),
(1018, 254, '21', 'BARRIOS UNIDOS ', '', 0, '0000-00-00', '0000-00-00'),
(1019, 254, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(1020, 254, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(1021, 255, '20', 'C1', 'CARTAGO', 0, '2019-10-25', '2022-10-25'),
(1022, 255, '21', 'SANITAS', '', 0, '0000-00-00', '0000-00-00'),
(1023, 255, '22', 'POSITIVA', '', 0, '0000-00-00', '0000-00-00'),
(1024, 255, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(1025, 256, '20', 'C2', 'CARTAGO', 0, '2020-09-02', '2023-09-02'),
(1026, 256, '21', 'COOMEVA', '', 0, '0000-00-00', '0000-00-00'),
(1027, 256, '22', 'POSITIVA', '', 0, '0000-00-00', '0000-00-00'),
(1028, 256, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(1029, 257, '20', 'C1', 'CARTAGO', 0, '2019-07-24', '2021-07-24'),
(1030, 257, '21', 'PENSIONADO', '', 0, '0000-00-00', '0000-00-00'),
(1031, 257, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(1032, 257, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(1033, 258, '20', 'C2', 'CARTAGO', 0, '2018-12-14', '2021-12-14'),
(1034, 258, '21', 'S.O.S ', '', 0, '0000-00-00', '0000-00-00'),
(1035, 258, '22', ' SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(1036, 258, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(1037, 259, '20', 'C2', 'CARTAGO', 0, '2019-02-15', '2022-02-15'),
(1038, 259, '21', 'SANITAS', '', 0, '0000-00-00', '0000-00-00'),
(1039, 259, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(1040, 259, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(1041, 260, '20', 'C1', 'CARTAGO', 0, '2019-03-11', '2022-03-11'),
(1042, 260, '21', 'COOSALUD', '', 0, '0000-00-00', '0000-00-00'),
(1043, 260, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(1044, 260, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(1045, 261, '20', 'C2', 'CARTAGO', 0, '2020-02-06', '2023-02-06'),
(1046, 261, '21', 'COOSALUD', '', 0, '0000-00-00', '0000-00-00'),
(1047, 261, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(1048, 261, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(1049, 262, '20', 'C1', 'CARTAGO', 0, '2019-10-16', '2022-10-16'),
(1050, 262, '21', 'SANITAS', '', 0, '0000-00-00', '0000-00-00'),
(1051, 262, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(1052, 262, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(1053, 263, '20', 'C2', 'CARTAGO', 0, '2020-11-04', '2021-11-04'),
(1054, 263, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(1055, 263, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(1056, 263, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(1057, 264, '20', 'C1', 'CARTAGO', 0, '2018-10-16', '2021-10-16'),
(1058, 264, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(1059, 264, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(1060, 264, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(1061, 265, '20', 'C1', 'CARTAGO', 0, '2018-05-16', '2021-05-16'),
(1062, 265, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(1063, 265, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(1064, 265, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(1065, 266, '20', 'C2', 'CARTAGO', 0, '2019-10-03', '2022-10-03'),
(1066, 266, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(1067, 266, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(1068, 266, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(1069, 267, '20', 'C2', 'CARTAGO', 0, '2020-09-29', '2021-09-29'),
(1070, 267, '21', 'COOSALUD', '', 0, '0000-00-00', '0000-00-00'),
(1071, 267, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(1072, 267, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(1073, 268, '20', 'C2', 'CARTAGO', 0, '2020-07-09', '2023-07-09'),
(1074, 268, '21', 'S.O.S ', '', 0, '0000-00-00', '0000-00-00'),
(1075, 268, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(1076, 268, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(1077, 269, '20', 'C2', 'CARTAGO', 0, '2019-07-15', '2022-07-15'),
(1078, 269, '21', 'SANITAS ', '', 0, '0000-00-00', '0000-00-00'),
(1079, 269, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(1080, 269, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(1081, 270, '20', 'C2', 'CARTAGO', 0, '2020-07-09', '2021-07-09'),
(1082, 270, '21', 'PENSIONADO- COOMEVA', '', 0, '0000-00-00', '0000-00-00'),
(1083, 270, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(1084, 270, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(1085, 271, '20', 'C2', 'CARTAGO', 0, '2020-12-18', '2021-12-18'),
(1086, 271, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(1087, 271, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(1088, 271, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(1089, 272, '20', 'C2', 'CARTAGO', 0, '2019-05-29', '2022-05-29'),
(1090, 272, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(1091, 272, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(1092, 272, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(1093, 273, '20', 'C1', 'CARTAGO', 0, '2018-06-18', '2021-06-18'),
(1094, 273, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(1095, 273, '22', 'POSITIVA', '', 0, '0000-00-00', '0000-00-00'),
(1096, 273, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(1097, 274, '20', 'C1', 'LA VIRGINIA', 0, '2018-06-20', '2021-06-20'),
(1098, 274, '21', 'COOMEVA', '', 0, '0000-00-00', '0000-00-00'),
(1099, 274, '22', 'POSITIVA', '', 0, '0000-00-00', '0000-00-00'),
(1100, 274, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(1101, 275, '20', 'C1', 'BOGOTA', 0, '2018-08-31', '2021-08-31'),
(1102, 275, '21', 'NUEVA EPS', '', 0, '0000-00-00', '0000-00-00'),
(1103, 275, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(1104, 275, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(1105, 276, '20', 'C3', 'CARTAGO', 0, '2019-05-27', '2022-05-27'),
(1106, 276, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(1107, 276, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(1108, 276, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(1109, 277, '20', 'C1', 'ANSERMA', 0, '2020-12-01', '2023-12-01'),
(1110, 277, '21', 'NUEVA EPS', '', 0, '0000-00-00', '0000-00-00'),
(1111, 277, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(1112, 277, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(1113, 278, '20', 'C1', 'LA UNION', 0, '2020-08-05', '2023-08-05'),
(1114, 278, '21', 'SOS', '', 0, '0000-00-00', '0000-00-00'),
(1115, 278, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(1116, 278, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(1117, 279, '20', 'C2', 'CARTAGO', 0, '2018-08-24', '2021-08-24'),
(1118, 279, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(1119, 279, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(1120, 279, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(1121, 280, '20', 'C2', 'CARTAGO', 0, '2020-08-20', '2021-08-22'),
(1122, 280, '21', 'BARRIOS UNIDOS', '', 0, '0000-00-00', '0000-00-00'),
(1123, 280, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(1124, 280, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(1125, 281, '20', 'C2', 'CARTAGO', 0, '2020-12-30', '2023-01-14'),
(1126, 281, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(1127, 281, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(1128, 281, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(1129, 282, '20', 'C2', 'CARTAGO', 0, '2019-05-16', '2022-05-16'),
(1130, 282, '21', 'SANITAS', '', 0, '0000-00-00', '0000-00-00'),
(1131, 282, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(1132, 282, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(1133, 283, '20', 'C2', 'CARTAGO', 0, '2020-07-22', '2023-07-22'),
(1134, 283, '21', 'S.O.S', '', 0, '0000-00-00', '0000-00-00'),
(1135, 283, '22', 'COLPATRIA', '', 0, '0000-00-00', '0000-00-00'),
(1136, 283, '23', '', '', 0, '0000-00-00', '0000-00-00'),
(1137, 284, '20', 'C2', 'CARTAGO', 0, '2020-01-10', '2023-01-10'),
(1138, 284, '21', 'COOSALUD', '', 0, '0000-00-00', '0000-00-00'),
(1139, 284, '22', 'SURATEP', '', 0, '0000-00-00', '0000-00-00'),
(1140, 284, '23', '', '', 0, '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_contra`
--

CREATE TABLE `detalle_contra` (
  `id_deta_contra` int(5) NOT NULL,
  `id_contra` int(5) NOT NULL,
  `id_movil` varchar(5) NOT NULL,
  `periodo` varchar(10) NOT NULL,
  `vrecibo` float NOT NULL,
  `nrecibo` int(15) NOT NULL,
  `frecibo` date NOT NULL,
  `fdesde` date NOT NULL,
  `fhasta` date NOT NULL,
  `ncuota` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_tarjeta`
--

CREATE TABLE `detalle_tarjeta` (
  `id_tarjeta` int(10) NOT NULL,
  `id_doc` varchar(5) NOT NULL,
  `documento` varchar(45) NOT NULL,
  `categoria` varchar(5) NOT NULL,
  `fecha_vence` date NOT NULL,
  `numero_doc` varchar(25) NOT NULL,
  `tipo_doc` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detalle_tarjeta`
--

INSERT INTO `detalle_tarjeta` (`id_tarjeta`, `id_doc`, `documento`, `categoria`, `fecha_vence`, `numero_doc`, `tipo_doc`) VALUES
(1, '01', 'SOAT                     ', '0', '2021-05-15', '77840054 MUNDIAL', 'V'),
(1, '02', 'TARJETA OPERACION        ', '0', '2021-07-27', 'I52822', 'V'),
(1, '03', 'CONTRACTUAL Y EXTRACONT  ', '0', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 'V'),
(1, '04', 'TECNICO MECANICA', '0', '2021-03-05', '', 'V');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detelle_pagos`
--

CREATE TABLE `detelle_pagos` (
  `id_detalle_pago` int(11) UNSIGNED NOT NULL,
  `pagonum` int(11) DEFAULT NULL,
  `id_movil` varchar(5) DEFAULT NULL,
  `id_deta` int(11) DEFAULT NULL,
  `detalle_otro` varchar(100) DEFAULT NULL,
  `valor_otro` double DEFAULT NULL,
  `codigo_otro` varchar(10) DEFAULT NULL,
  `tipo_pago` enum('debito','credito') DEFAULT 'debito',
  `fecha_detapago` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `diarios`
--

CREATE TABLE `diarios` (
  `id_diario` double UNSIGNED NOT NULL,
  `id_movil` varchar(4) DEFAULT NULL,
  `pagos_dia` int(10) NOT NULL,
  `admin` double DEFAULT NULL,
  `radio` float DEFAULT NULL,
  `total` double DEFAULT NULL,
  `estado` enum('anulado','activo') DEFAULT NULL,
  `fecha_pago` datetime DEFAULT NULL,
  `modifica_user` int(3) DEFAULT NULL,
  `date_mod` datetime DEFAULT NULL,
  `motivo_anula` text DEFAULT NULL,
  `desc` enum('si','no') DEFAULT 'no',
  `descuento` double DEFAULT NULL,
  `id_descuento` int(10) DEFAULT NULL,
  `aporte` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `directorio`
--

CREATE TABLE `directorio` (
  `telefono` varchar(25) NOT NULL,
  `direccion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documento`
--

CREATE TABLE `documento` (
  `id_doc` varchar(5) NOT NULL,
  `documento` varchar(25) NOT NULL,
  `obligatorio` enum('si','no') DEFAULT 'no',
  `isnotif` enum('si','no') DEFAULT 'no'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `documento`
--

INSERT INTO `documento` (`id_doc`, `documento`, `obligatorio`, `isnotif`) VALUES
('20', 'LICENCIA DE CONDUCCION', 'si', 'no'),
('21', 'EPS', 'si', 'no'),
('22', 'ARL', 'si', 'no'),
('23', 'APP', 'no', 'si');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documentos_v`
--

CREATE TABLE `documentos_v` (
  `id_docv` int(5) NOT NULL,
  `id_documento` varchar(2) NOT NULL,
  `descripcion` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `documentos_v`
--

INSERT INTO `documentos_v` (`id_docv`, `id_documento`, `descripcion`) VALUES
(1, '01', 'SOAT                     '),
(2, '02', 'TARJETA OPERACION        '),
(3, '03', 'CONTRACTUAL Y EXTRACONT  '),
(4, '04', 'TECNICO MECANICA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE `empresa` (
  `id_empresa` int(5) NOT NULL,
  `nombre` varchar(100) NOT NULL DEFAULT '',
  `nit` varchar(20) NOT NULL,
  `direccion` varchar(30) NOT NULL,
  `telefono` varchar(40) NOT NULL,
  `logo` varchar(30) NOT NULL,
  `grupo` varchar(2) NOT NULL,
  `inicio_p` int(10) NOT NULL,
  `fin_p` int(10) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`id_empresa`, `nombre`, `nit`, `direccion`, `telefono`, `logo`, `grupo`, `inicio_p`, `fin_p`, `email`) VALUES
(1, 'COOMOCART LTDA', '891.900.232-7', 'CARRERA 7a. # 10 - 69', '2111111', 'transargeliaycairo.jpg', 'TA', 0, 0, 'coomocart@hotmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entidad_salud`
--

CREATE TABLE `entidad_salud` (
  `id_eps` int(5) NOT NULL,
  `eps` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `festivos`
--

CREATE TABLE `festivos` (
  `fecha` date NOT NULL,
  `dia` varchar(40) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `festivos`
--

INSERT INTO `festivos` (`fecha`, `dia`) VALUES
('2011-01-01', 'A?o Nuevo'),
('2011-01-10', 'Reyes'),
('2011-03-21', 'San Jos'),
('2011-04-21', 'Jueves Santo'),
('2011-04-22', 'Viernes Santo'),
('2011-05-01', 'Trabajo'),
('2011-06-06', 'Ascenci?n Jes?s'),
('2011-06-27', 'Corpus Christi'),
('2011-07-04', 'Sagrado Coraz?n'),
('2011-07-20', 'Independencia'),
('2011-08-07', 'Boyaca'),
('2011-08-15', 'Asenci?n Nuestra Se??ra'),
('2011-10-17', 'Raza'),
('2011-11-07', 'Santos'),
('2011-11-14', 'Cartagena'),
('2011-12-08', 'Virgen'),
('2011-12-25', 'Navidad'),
('2012-01-01', 'A?o Nuevo'),
('2012-01-09', 'Reyes'),
('2012-03-19', 'San Jos'),
('2012-04-05', 'Jueves Santo'),
('2012-04-06', 'Viernes Santo'),
('2012-05-01', 'Trabajo'),
('2012-05-21', 'Ascenci?n Jes?s'),
('2012-06-11', 'Corpus Christi'),
('2012-06-18', 'Sagrado Coraz?n'),
('2012-07-02', 'San Pedro & Pablo'),
('2012-07-20', 'Independencia'),
('2012-08-07', 'Boyaca'),
('2012-08-20', 'Asenci?n Nuestra Se?ora'),
('2012-10-15', 'Raza'),
('2012-11-05', 'Santos'),
('2012-11-12', 'Cartagena'),
('2012-12-08', 'Virgen'),
('2012-12-25', 'Navidad'),
('2013-01-01', 'A?o Nuevo'),
('2013-01-07', 'Reyes'),
('2013-03-25', 'San Jos'),
('2013-03-28', 'Jueves Santo'),
('2013-03-29', 'Viernes Santo'),
('2013-05-01', 'Trabajo'),
('2013-05-13', 'Ascenci?n Jes?s'),
('2013-06-03', 'Corpus Christi'),
('2013-06-10', 'Sagrado Coraz?n'),
('2013-07-01', 'San Pedro & Pablo'),
('2013-07-20', 'Independencia'),
('2013-08-07', 'Boyaca'),
('2013-08-19', 'Asenci?n Nuestra Se?ora'),
('2013-10-14', 'Raza'),
('2013-11-04', 'Santos'),
('2013-11-11', 'Cartagena'),
('2013-12-08', 'Virgen'),
('2013-12-25', 'Navidad'),
('2014-01-01', 'A?o Nuevo'),
('2014-01-06', 'Reyes'),
('2014-03-24', 'San Jos'),
('2014-04-17', 'Jueves Santo'),
('2014-04-18', 'Viernes Santo'),
('2014-05-01', 'Trabajo'),
('2014-06-02', 'Ascenci?n Jes?s'),
('2014-06-23', 'Corpus Christi'),
('2014-06-30', 'Sagrado Coraz?n'),
('2014-07-20', 'Independencia'),
('2014-08-07', 'Boyaca'),
('2014-08-18', 'Asenci?n Nuestra Se?ora'),
('2014-10-13', 'Raza'),
('2014-11-03', 'Santos'),
('2014-11-17', 'Cartagena'),
('2014-12-08', 'Virgen'),
('2014-12-25', 'Navidad'),
('2015-01-01', 'A?o Nuevo'),
('2015-01-12', 'Reyes'),
('2015-03-23', 'San Jos'),
('2015-04-02', 'Jueves Santo'),
('2015-04-03', 'Viernes Santo'),
('2015-05-01', 'Trabajo'),
('2015-05-18', 'Ascenci?n Jes?s'),
('2015-06-08', 'Corpus Christi'),
('2015-06-15', 'Sagrado Coraz?n'),
('2015-06-29', 'San Pedro & Pablo'),
('2015-07-20', 'Independencia'),
('2015-08-07', 'Boyaca'),
('2015-08-17', 'Asenci?n Nuestra Se?ora'),
('2015-10-12', 'Raza'),
('2015-11-02', 'Santos'),
('2015-11-16', 'Cartagena'),
('2015-12-08', 'Virgen'),
('2015-12-25', 'Navidad'),
('2016-01-01', ''),
('2016-01-11', ''),
('2016-03-21', ''),
('2016-03-24', ''),
('2016-03-25', ''),
('2016-05-09', ''),
('2016-05-30', ''),
('2016-06-06', ''),
('2016-07-04', ''),
('2016-07-20', ''),
('2016-08-15', ''),
('2016-10-17', ''),
('2016-11-07', ''),
('2016-11-14', ''),
('2016-12-08', ''),
('2017-01-01', ''),
('2017-01-09', ''),
('2017-03-20', ''),
('2017-04-13', ''),
('2017-04-14', ''),
('2017-05-01', ''),
('2017-05-29', ''),
('2017-06-19', ''),
('2017-06-26', ''),
('2017-07-03', ''),
('2017-07-20', ''),
('2017-08-07', ''),
('2017-08-21', ''),
('2017-10-16', ''),
('2017-11-06', ''),
('2017-11-13', ''),
('2017-12-08', ''),
('2017-12-25', 'FESTIVO'),
('2018-01-01', ''),
('2018-01-08', ''),
('2018-03-19', ''),
('2018-03-29', ''),
('2018-03-30', ''),
('2018-05-01', ''),
('2018-05-14', ''),
('2018-06-04', ''),
('2018-06-11', ''),
('2018-07-02', ''),
('2018-07-20', ''),
('2018-08-07', ''),
('2018-08-20', ''),
('2018-10-15', ''),
('2018-11-05', ''),
('2018-11-12', ''),
('2018-12-08', ''),
('2018-12-25', 'FESTIVO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formatos`
--

CREATE TABLE `formatos` (
  `idFormato` int(11) NOT NULL,
  `formato` varchar(45) DEFAULT NULL,
  `texto` text DEFAULT NULL,
  `fila2` text DEFAULT NULL,
  `fila3` text DEFAULT NULL,
  `fila4` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `formatos`
--

INSERT INTO `formatos` (`idFormato`, `formato`, `texto`, `fila2`, `fila3`, `fila4`) VALUES
(1, 'Sello no pension', 'Doy fe, que conozco el tipo de seguridad social que como persona independiente y sin ningún vínculo laboral, estoy soportando ante la Cooperativa de Motoristas de Cartago con el fin que me expidan la Ficha de Control. La cual cancelo de mi propio peculio y en forma voluntaria y consciente, con pleno conocimiento que debido a mis condiciones y bajo los lineamientos de la ley 100 del 93, artículos 31, 51, circular 032. Decreto 758 de 1.990, Decreto 3085 de 2007, Resolución 1747 de 2008, Ministerio de Salud y Protección Social, Resolución 2377 de 2008, Ministerio de Salud y Protección Social.', NULL, NULL, 'Para Constancia se firma En la ciudad de Cartago (V), a los '),
(2, 'Estadistica Conductor', 'Dejo constancia que mi compromiso consiste en la prestación de servicio público Individual en vehículos tipo Taxi, de conformidad con lo normado en el decreto 172 del 5 de febrero del 2001, en forma autónoma y sin subordinación laboral con la empresa o el propietario, obligándome a cumplir los lineamientos que para el cumplimiento de la actividad del transporte dicten las autoridades nacionales, locales y entes que deban regular la actividad del transporte, dentro de los parámetros de la ley, las buenas costumbres, la moral y la ética, dando ejemplo de buen comportamiento y responsabilizándome de las acciones propias que me corresponden.', 'Coomocart se reserva, según el manual de la radiofrecuencia, el derecho de permitir o no el uso de los servicios de radio y aplicativo, por parte del conductor.', 'Para todos los efectos legales, certifico que toda la información anotadas por mí en el presente documento es veraz, y autorizo que sea confirmada por los interesados.', 'Para Constancia se firma En la ciudad de Cartago (V), a los ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `frecuencia`
--

CREATE TABLE `frecuencia` (
  `id_movil` varchar(5) NOT NULL,
  `id_tarjeta` int(10) NOT NULL,
  `fecha` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_movil`
--

CREATE TABLE `historial_movil` (
  `id_historial` int(4) NOT NULL,
  `id_movil` varchar(4) NOT NULL,
  `placa` varchar(7) DEFAULT NULL,
  `modelo` int(4) DEFAULT NULL,
  `clase` varchar(50) DEFAULT NULL,
  `id_marca` int(5) DEFAULT NULL,
  `referencia` varchar(50) DEFAULT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `motor` varchar(35) DEFAULT NULL,
  `serie` varchar(35) DEFAULT NULL,
  `color` varchar(15) DEFAULT NULL,
  `pago_hasta` date DEFAULT NULL,
  `grupo` varchar(3) DEFAULT NULL,
  `id_prop` varchar(11) DEFAULT NULL,
  `estado` int(2) DEFAULT 1,
  `poliza` int(2) DEFAULT 1,
  `managerid` varchar(30) DEFAULT NULL,
  `combustible` varchar(50) DEFAULT NULL,
  `dtaller` int(5) DEFAULT NULL,
  `fcontrato` date DEFAULT NULL,
  `radio` enum('si','no') DEFAULT 'si',
  `ultimo_pago` date DEFAULT NULL,
  `cilindraje` varchar(10) DEFAULT NULL,
  `fechaMod` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historico_conductor`
--

CREATE TABLE `historico_conductor` (
  `idHistoCondu` int(11) NOT NULL,
  `idCondu` int(10) DEFAULT NULL,
  `idMovilHisto` varchar(5) DEFAULT NULL,
  `fechaInicioTC` varchar(20) DEFAULT NULL,
  `fechaFin` varchar(20) DEFAULT NULL,
  `docReferencia` int(10) DEFAULT NULL,
  `numTarjeta` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `info_sistema`
--

CREATE TABLE `info_sistema` (
  `plazo_diarios` int(2) NOT NULL,
  `nro_pl_inicio` int(20) NOT NULL,
  `nro_pl_fin` int(20) NOT NULL,
  `plazo_planilla` int(5) NOT NULL,
  `planillas_mes` int(5) NOT NULL,
  `origen_planilla` varchar(25) COLLATE utf8_bin NOT NULL,
  `fbloqueo` date DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `info_sistema`
--

INSERT INTO `info_sistema` (`plazo_diarios`, `nro_pl_inicio`, `nro_pl_fin`, `plazo_planilla`, `planillas_mes`, `origen_planilla`, `fbloqueo`) VALUES
(720, 1, 10, 5, 3, 'Tulua', '1969-12-31');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `linea_atencion`
--

CREATE TABLE `linea_atencion` (
  `id_linea` int(5) NOT NULL,
  `linea` varchar(25) NOT NULL,
  `id_tipo_linea` int(5) NOT NULL,
  `estado` enum('activo','inactivo') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE `marca` (
  `id_marca` int(5) NOT NULL,
  `marca` varchar(35) NOT NULL,
  `idm` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `marca`
--

INSERT INTO `marca` (`id_marca`, `marca`, `idm`) VALUES
(1, 'HYUNDAI        ', 1),
(2, 'MAZDA          ', 2),
(3, 'CHEVROLET      ', 3),
(4, 'RENAULT        ', 4),
(5, 'JIAN CHANGHE   ', 5),
(6, 'KIA            ', 6),
(7, 'DAEWOO         ', 7),
(8, 'CHERY          ', 8),
(9, 'JAC            ', 9),
(10, 'DFSK', 10),
(11, 'BYD', 11),
(12, 'GEELY', 12),
(13, 'SUZUKI', 13),
(14, 'GREAT WALL', 14),
(15, 'LIFAN', 15),
(16, 'FIAT', 16);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensaje105`
--

CREATE TABLE `mensaje105` (
  `id_msj` int(5) NOT NULL,
  `id_movil` varchar(5) NOT NULL,
  `msj` varchar(250) NOT NULL,
  `fecha_reg` date NOT NULL,
  `usr` varchar(20) NOT NULL,
  `estado` int(1) NOT NULL COMMENT '0 x trasmitir,1 trasmitido,2 descartado'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movil_desvinculados`
--

CREATE TABLE `movil_desvinculados` (
  `id_des` int(11) NOT NULL,
  `id_movil` varchar(10) NOT NULL,
  `admin` double NOT NULL,
  `radio` double NOT NULL,
  `taller` double NOT NULL,
  `diarios` int(10) NOT NULL,
  `recibo` varchar(10) NOT NULL,
  `concepto` varchar(100) NOT NULL,
  `total` double NOT NULL,
  `fecha_pago` date NOT NULL,
  `pago_hasta` datetime NOT NULL,
  `fecha_retiro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimiento_diarios`
--

CREATE TABLE `movimiento_diarios` (
  `id_mov_diarios` int(11) UNSIGNED NOT NULL,
  `recibo_num` int(11) DEFAULT NULL,
  `id_movil` varchar(4) DEFAULT NULL,
  `pagos_dia` int(11) DEFAULT NULL,
  `concepto` varchar(20) DEFAULT NULL,
  `admin` double DEFAULT NULL,
  `radio` double DEFAULT NULL,
  `taller` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  `fecha_create` date DEFAULT NULL,
  `saldo_hasta` datetime DEFAULT NULL,
  `aporte` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movi_contra`
--

CREATE TABLE `movi_contra` (
  `id_mov` int(5) NOT NULL,
  `usuario` varchar(20) NOT NULL,
  `fecha_mov` date NOT NULL,
  `n_recibo` varchar(15) NOT NULL,
  `concepto` varchar(200) NOT NULL,
  `id_movil` varchar(4) NOT NULL,
  `ingreso` float NOT NULL,
  `egreso` float NOT NULL,
  `saldo` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `noficacionVencidos`
--

CREATE TABLE `noficacionVencidos` (
  `id_notif` int(4) NOT NULL,
  `fecha` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `noficacionVencidos`
--

INSERT INTO `noficacionVencidos` (`id_notif`, `fecha`) VALUES
(1, '2021-04-25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `novedad_diario`
--

CREATE TABLE `novedad_diario` (
  `id_nov` int(20) NOT NULL,
  `id_movil` varchar(5) COLLATE utf8_bin NOT NULL,
  `fecha` datetime NOT NULL,
  `pago_hasta_n` date NOT NULL,
  `pago_hasta_a` date NOT NULL,
  `novedad` varchar(50) COLLATE utf8_bin NOT NULL,
  `control` int(1) NOT NULL,
  `control2` int(1) NOT NULL,
  `control3` int(2) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `novedad_servicio`
--

CREATE TABLE `novedad_servicio` (
  `id_nov_serv` int(5) NOT NULL,
  `id_movil` varchar(5) NOT NULL,
  `operacion` varchar(30) NOT NULL,
  `estado` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `otros_pagos`
--

CREATE TABLE `otros_pagos` (
  `id_otros` int(11) UNSIGNED NOT NULL,
  `codigo_concepto` varchar(20) DEFAULT NULL,
  `detalle_concepto` varchar(255) DEFAULT NULL,
  `tipo_con` enum('show','hidden') DEFAULT 'show',
  `campoadm` varchar(10) DEFAULT NULL,
  `tipoc` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago_descuento`
--

CREATE TABLE `pago_descuento` (
  `id_descuento` double UNSIGNED NOT NULL,
  `id_movil` varchar(4) DEFAULT NULL,
  `diarios_mora` int(10) NOT NULL,
  `vt_admin` double DEFAULT NULL,
  `porcen_admin` float DEFAULT NULL,
  `vt_radio` double DEFAULT NULL,
  `porcen_radio` float DEFAULT NULL,
  `vtdescuento` double DEFAULT NULL,
  `estado` enum('anulado','activo','asignado') DEFAULT NULL,
  `fecha_pago` datetime DEFAULT NULL,
  `modifica_user` int(3) DEFAULT NULL,
  `date_mod` datetime DEFAULT NULL,
  `motivo_anula` text DEFAULT NULL,
  `concepto_desc` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago_taller`
--

CREATE TABLE `pago_taller` (
  `id_ptaller` double UNSIGNED NOT NULL,
  `id_movil` varchar(4) DEFAULT NULL,
  `pagos_dia` int(10) NOT NULL,
  `saldo` int(11) DEFAULT NULL,
  `vdia` float DEFAULT NULL,
  `total` double DEFAULT NULL,
  `estado` enum('anulado','activo') DEFAULT NULL,
  `fecha_pago` datetime DEFAULT NULL,
  `modifica_user` int(3) DEFAULT NULL,
  `date_mod` datetime DEFAULT NULL,
  `motivo_anula` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planilla`
--

CREATE TABLE `planilla` (
  `id_planilla` int(10) NOT NULL,
  `n_planilla` int(15) NOT NULL,
  `fecha_elaboracion` datetime NOT NULL,
  `id_tarjeta` int(10) NOT NULL,
  `tarjeta` varchar(10) COLLATE utf8_bin NOT NULL,
  `ciudad_o` varchar(35) COLLATE utf8_bin NOT NULL,
  `fecha_inicio` datetime NOT NULL,
  `ciudad_d` varchar(35) COLLATE utf8_bin NOT NULL,
  `fecha_retorno` datetime NOT NULL,
  `contra` varchar(50) COLLATE utf8_bin NOT NULL,
  `tipo_doc` varchar(5) COLLATE utf8_bin NOT NULL,
  `doc` varchar(25) COLLATE utf8_bin NOT NULL,
  `dircontra` varchar(50) COLLATE utf8_bin NOT NULL,
  `telcontra` varchar(50) COLLATE utf8_bin NOT NULL,
  `npasajero` varchar(20) COLLATE utf8_bin NOT NULL,
  `compania` varchar(25) COLLATE utf8_bin NOT NULL,
  `estado` int(1) NOT NULL COMMENT '1 Entregada ,2 recibida,3 anulada,4 Por Reclamar',
  `fecha_plazo_e` datetime NOT NULL,
  `est_ant` int(1) NOT NULL,
  `fecha_dev` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `usr_elab` varchar(25) COLLATE utf8_bin NOT NULL,
  `usr_rec` varchar(25) COLLATE utf8_bin DEFAULT NULL,
  `liquidado` int(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `propietario`
--

CREATE TABLE `propietario` (
  `id_prop` varchar(11) NOT NULL,
  `nombre` varchar(40) NOT NULL DEFAULT '',
  `apellidos` varchar(40) NOT NULL DEFAULT '',
  `ciudad` varchar(40) NOT NULL DEFAULT '',
  `fecha_nac` date NOT NULL,
  `direccion` varchar(100) NOT NULL DEFAULT '',
  `telefono` varchar(100) NOT NULL DEFAULT '',
  `ciudad_nac` varchar(30) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL,
  `estado_prop` enum('activo','inactivo') NOT NULL DEFAULT 'activo',
  `fecha_exp` date DEFAULT NULL,
  `escondu` enum('si','no') DEFAULT 'no'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `propietario`
--

INSERT INTO `propietario` (`id_prop`, `nombre`, `apellidos`, `ciudad`, `fecha_nac`, `direccion`, `telefono`, `ciudad_nac`, `email`, `estado_prop`, `fecha_exp`, `escondu`) VALUES
('10004633', 'ALVARO', 'MORENO TELLEZ', 'Cartago', '1977-11-29', 'MZ 10 CS 7 BOSQUE LOS LAGOS', '3008367680', 'Cartago', 'raba1417@hotmail.com', 'activo', '0000-00-00', 'no'),
('10024123', 'JUAN PABLO ', 'LOAIZA CANO', 'PEREIRA', '1973-07-15', 'CALLE 15 # 5-71 APTO 4B', '3116054945', '', 'juanplc2014@hotmail.com', 'activo', '0000-00-00', 'no'),
('1004004995', 'JUAN SEBASTIAN ', 'RUEDA MUÑOZ', 'CARTAGO', '2001-08-06', 'CRA 2 # 35-86', '3205957169', '', 'servicios.bmedic@gmail.com', 'activo', '0000-00-00', 'no'),
('1004716926', 'LUZ ANDREA ', 'CEBALLOS MORALES', 'CARTAGO', '1994-08-19', 'MAZ 6 CASA 9 LOS ANGELES', '3128156600', '', 'ceballosandreita22@gmail.com', 'activo', '0000-00-00', 'no'),
('10062589', 'MARIO ', 'RODRIGUEZ GIL', 'CARTGO', '1948-03-30', 'CRA 2A # 28-09', '3122971604', '', 'gl989248@gmail.com', 'activo', '0000-00-00', 'no'),
('10069903', 'JAIME ENRIQUE ', 'PARRA LOPEZ', 'CARTAGO', '1944-06-26', 'CRA 11 # 8-41', '2126011', '', 'coomocart.asociados@gmail.com', 'activo', '0000-00-00', 'no'),
('10092040', 'LUIS ALBERTO ', 'VALENCIA BERMUDEZ', 'CARTAGO', '1955-12-21', 'CL 45B #3N-33', '3207444247', '', 'albertovalenciab123@gmail.com', 'activo', '0000-00-00', 'si'),
('10109451', 'EMIR ', 'GUTIERREZ GUERRERO', 'CARTAGO', '1962-05-17', 'BARRIO BELMONTE CONJUNTO 4 CS 42', '3137951802', '', 'coomocart.asociados@gmail.com', 'activo', '0000-00-00', 'si'),
('10110394', 'WILMAR ', 'PEREZ CAMACHO', 'CARTAGO', '1963-03-18', 'CRA 2# 1T-75', '3155726534', '', 'wilmarperez1963@gmail.com', 'activo', '0000-00-00', 'no'),
('10119427', 'JOHN JAIRO ', 'MARIN CARDENAS', 'CARTAGO', '1964-09-05', 'MZ 6 CS9 LOS ANGELES', '3103688873', '', 'jhonmarincardenas2016@gmail.com', 'activo', '0000-00-00', 'si'),
('10199261', 'ALFONSO ', 'QUINTERO CORREA', 'CARTAGO', '1972-05-26', 'CALLE 20 # 5N-21', '3147550492', '', 'alfonsoquin1972@gmail.com', 'activo', '0000-00-00', 'no'),
('1031641210', 'MARIA PAULA ', 'HERNANDEZ SALINAS', 'CARTAGO', '2004-02-23', 'CALLE 52 # 2-44', '3183269068', '', 'salinasgarcia1974@gmail.com', 'activo', '0000-00-00', 'no'),
('10483745', 'JAVIER ', 'CORDOBA CORSINO', 'CARTAGO', '1965-09-22', 'CRA 6 # 21-34', '3122909982', '', 'javiercordobaf2018@gmail.com', 'activo', '0000-00-00', 'no'),
('1059784970', 'CARLOS ANDRES ', 'ECHEVERRI ARENAS', 'CARTAGO', '1988-12-25', 'CALLE 11 # 22-02', '3123398033', '', 'carlosandresecheverriarenas@gmail.com', 'activo', '0000-00-00', 'si'),
('1076350546', 'JUAN CARLOS ', 'GIRALDO PINEDA', 'CARTAGO', '1987-02-24', 'CALLE 7 # 7B-14', '3218592014', '', 'sebasjuankabea@gmail.com', 'activo', '0000-00-00', 'si'),
('10965799', 'JORGE ARMANDO ', 'ARIZAL ARCIRIA', 'PEREIRA', '1985-04-25', 'Barrio Galan Mz 10 Cs 18', '3004047521', '', 'coomocart.asociados@gmail.com', 'activo', '0000-00-00', 'no'),
('1112769579', 'LUIS CARLOS ', 'CORRALES GARCIA', 'CARTAGO', '1990-02-06', '', '3215187727', '', 'luiscarloscorralesgarcia5@gmail.com', 'activo', '0000-00-00', 'no'),
('1112771617', 'JONATHAN STEVEN ', 'TORO TAMAYO', 'CARTAGO', '1990-10-30', 'MONTE ESMERALDA MZ H CS 27', '3184295563', '', 'jonathansteventorotamayo@gmail.com', 'activo', '0000-00-00', 'si'),
('1112771980', 'BEATRIZ ELENA ', 'SALAZAR TAPIERO', 'CARTAGO', '1990-09-02', 'DIAGONAL 2 # 1D-38', '3108970156', '', 'beaelesalazartapiero@gmail.com', 'activo', '0000-00-00', 'no'),
('1112772876', 'JUAN DAVID ', 'MURCIA RODRIGUEZ', 'CARTAGO', '1990-11-04', 'CRA 10 # 15-51', '3178355521', '', 'juandavidmurciarodriguez2@gmail.com', 'activo', '0000-00-00', 'si'),
('1112773446', 'JHON EDISON ', 'IBARRA DUQUE', 'CARTAGO', '1991-05-10', 'CRA 11 # 5B-84', '3057045533', '', 'edi_77@hotmail.com', 'activo', '0000-00-00', 'si'),
('1112773517', 'CAROLINA ', 'ISAZA BERNAL', 'CARTAGO', '1991-07-05', 'CRA 2AN # 19-06', '3128075591', '', 'isaza2202@gmail.com', 'activo', '0000-00-00', 'no'),
('1112775301', 'LEIDY VANESSA ', 'PARRA CASTRO', 'CARTAGO', '1992-02-08', 'CALLE 13 # 7-78', '3117594952', '', 'vanessaparracastro@hotmail.com', 'activo', '0000-00-00', 'no'),
('1112781014', 'DANIELA ', 'ECHEVERRY ARANGO', 'CARTAGO', '1994-01-26', 'TRANSV. 6 # 15-46', '3207405574', '', 'daniela0126@hotmail.com', 'activo', '0000-00-00', 'no'),
('1112785236', 'VALENTINA ', 'VARGAS VARGAS', 'CARTAGO', '1995-07-20', 'LA CABAÑA MZ 5 CS 13', '3017973431', '', 'valen.v7@gmail.com', 'activo', '0000-00-00', 'no'),
('1112788536', 'ALEJANDRO ', 'ALZATE AGUDELO', 'CARTAGO', '1996-11-12', 'TRANSV 20 # 1AN-90', '3106738711', '', 'a1296alzate@outlook.es', 'activo', '0000-00-00', 'no'),
('1112790244', 'ANGIE LISETH ', 'DUQUE AGUDELO', 'CARTAGO', '1997-09-21', 'KRA 6 # 18-21', '3014205740', '', 'lisethduque21@gmail.com', 'activo', '0000-00-00', 'no'),
('1112790897', 'ANA MARIA ', 'CORREA MAFLA', 'CARTAGO', '1997-12-26', 'CRA 15 # 12-09', '3154061992', '', 'anamariac896@gmail.com', 'activo', '0000-00-00', 'no'),
('1112791847', 'VALENTINA ', 'CATAÑO ALVAREZ', 'CARTAGO', '1998-07-04', 'CRA 2A # 21-45', '34643362569', '', 'tinacata123@gmail.com', 'activo', '0000-00-00', 'no'),
('1112794339', 'EDWIN ', 'VILLEGAS GARCIA', 'CARTAGO', '1999-10-24', 'CALLE 14 # 62-09', '3215744237', '', 'edwinvillegas2499@gmail.com', 'activo', '0000-00-00', 'no'),
('1113533829', 'KARINA ', 'ORTIZ RINCON', 'PEREIRA', '1995-12-11', 'CALLE 75 # 45-03', '3235767379', '', 'karinarincon1995@gmail.com', 'activo', '0000-00-00', 'no'),
('1113593318', 'VICTOR ALFONSO ', 'GARCIA SANCHEZ', 'CARTAGO', '1988-10-24', 'CALLE 10B # 20-09', '3174934789', '', 'victorobando1345@gmail.com', 'activo', '0000-00-00', 'si'),
('1114787481', 'ERIK SANTIAGO ', 'GUERRERO RAMIREZ', 'CARTAGO', '2004-01-09', 'cra 36 # 2AN-71', '3113387044', '', 'coomocart.asociados@gmail.com', 'activo', '0000-00-00', 'no'),
('1118237016', 'MARIA TERESA ', 'HERRERA HURTADO', 'ALCALA', '1996-04-17', 'finca villafatima ', '3144647827', '', 'maria-t27@hotmail.com', 'activo', '0000-00-00', 'no'),
('1130655598', 'ESTHER DANI ', 'MESA CAMPO', 'CARTAGO', '1987-05-20', 'CALLE 9B# 18A-30', '3102456609', '', 'dana201982@hotmail.com', 'activo', '0000-00-00', 'no'),
('1378409', 'BENJAMIN ', 'ANTONIO GUTIERREZ', 'CARTAGO', '1936-04-21', 'Calle 13 # 7-32', '3104138384', '', 'gutierrezgomezl08@gmail.com', 'activo', '0000-00-00', 'no'),
('14252134', 'GIOVANY ', 'BENITEZ CLAVIJO', 'TULUA', '1976-01-04', 'CALLE 22A # 7-21', '3137349359', '', 'giovanny76@gmail.com', 'activo', '0000-00-00', 'no'),
('14455406', 'JOSE RODRIGO ', 'MEJIA RIVERA', 'CARTAGO', '1964-02-20', 'CRA 14 # 15-49', '3207109610', '', 'vanessaparracastro@hotmail.com', 'activo', '0000-00-00', 'no'),
('14566202', 'ANDRES FELIPE ', 'LOAIZA VIVAS', 'CARTAGO', '1981-05-14', 'CRA 10 # 21-123', '3102087480', '', 'afloaiza2011@gmail.com', 'activo', '0000-00-00', 'si'),
('14566740', 'JOSE OMAR ', 'GARCIA TOSCANO', 'CARTGAO', '1981-09-30', 'CRA 1 # 41-64', '3116334691', '', 'omar.garcia81@hotmail.com', 'activo', '0000-00-00', 'no'),
('14567609', 'JUAN ALEXANDER ', 'BUSTAMANTE HOLGUIN', 'CARTAGO', '1982-04-20', 'BARRIO EL REBAÑO CS 96', '3164498771', '', 'alexander14567609@gmail.com', 'activo', '0000-00-00', 'no'),
('14569348', 'ARNIBAR IVAN ', 'CRUZ MELLIZO', 'CARTAGO', '1983-09-22', 'EL TREBOL MZ 25 CS 349', '3154232290', '', 'anicruz2209@hotmail.com', 'activo', '0000-00-00', 'si'),
('14569711', 'SERGIO AUGUSTO ', 'AMAYA GARCIA', 'CARTAGO', '1984-03-01', 'CRA 19# 4-67', '3136131047', '', 'sergioamaya71184@hotmail.com', 'activo', '0000-00-00', 'no'),
('14570425', 'NONDIER ANDREZ ', 'CARDONA SALAZAR', 'CARTAGO', '1984-04-15', 'CALLE 5 # 8-16', '3128031465', '', 'coomocart.asociados@gmail.com', 'activo', '0000-00-00', 'no'),
('14570529', 'LEONEL ', 'SALAZAR RODAS', 'CARTAGO', '1984-09-28', 'LOS ALMENDROS MZ 4 CSA 6', '3156021001', '', 'leonelsalazarrodas@gmail.com', 'activo', '0000-00-00', 'no'),
('14572552', 'DIEGO ALEJANDRO ', 'FEO MEJIA', 'CARTAGO', '1986-01-15', 'KRA 2N # 28-56', '3164386283', '', 'coomocart.asociados@gmail.com', 'activo', '0000-00-00', 'no'),
('16200578', 'GENARO ', 'MEDINA RIVERA ', 'CARTAGO', '1948-05-24', 'Cra 1 # 31-51', '3147379556', '', 'riveragenaro94@gmail.com', 'activo', '0000-00-00', 'no'),
('16201930', 'LUIS FELIPE ', 'MEDINA LOPEZ', 'CARTAGO', '1950-02-24', 'CALLE 9A # 15-55', '3127223602', '', 'lm9342947@gmail.com', 'activo', '0000-00-00', 'si'),
('16202471', 'GUILLERMO LEON ', 'HENAO ARIAS', 'CARTAGO', '1950-04-15', 'CALLE 18 # 5N-31 BL 4 APART 404', '3155536765', '', 'guillermoleonhenao@gmail.com', 'activo', '0000-00-00', 'no'),
('16202691', 'IGNACIO ABAD ', 'GIRALDO ZULUAGA', 'CARTAGO', '1950-05-01', 'CRA 4 # 24A-33', '3128019293', '', 'ignaciogiraldo174@gmail.com', 'activo', '0000-00-00', 'no'),
('16203545', 'RAMON ANGEL', 'QUEBRADA TTRUJILLO', 'CARTAGO', '1951-09-07', 'CRA 3B # 3-25', '3137214206', '', 'raquebrada@gmail.com', 'activo', '0000-00-00', 'no'),
('16204913', 'JULIO CESAR ', 'BEDOYA BILBAO', 'CARTAGO', '1952-10-10', 'CR 62 # 13-45', '3116444340', '', 'juliobedoya17@hotmail.com', 'activo', '0000-00-00', 'si'),
('16205524', 'LUIS ALFREDO ', 'ARENAS AGUIRRE', 'CARTAGO', '1953-12-18', 'CALLE 46A # 2AN-38', '3203555238', '', 'luisarenas2933@gmail.com', 'activo', '0000-00-00', 'no'),
('16206135', 'JOSE BALMORY ', 'ARROYAVE GIRALDO', 'CARTAGO', '1953-11-07', 'CRA 16A # 16-48', '3172495143', '', 'balmoryarroyave@gmail.com', 'activo', '0000-00-00', 'si'),
('16206744', 'AUNER DE JESUS ', 'NARVAEZ CASTAÑO', 'CARTAGO', '1955-12-08', 'CALLE 35B # 1-19', '3104358547', '', 'juancamilonarvaezmartinez@gmail.com', 'activo', '0000-00-00', 'no'),
('16207059', 'CARLOS ALBERTO ', 'CORTES VALDERRAMA', 'CARTAGO', '1957-06-05', 'CRA 2C # 33-41 Montanar', '3113605265', '', 'que.bonitaesestavida@hotmail.com', 'activo', '0000-00-00', 'no'),
('16207433', 'GUSTAVO ANTONIO', 'CANO ALZATE', 'CARTAGO', '1954-03-25', 'Calle 20 # 3-37', '3113560884', '', 'gcano2246@gmail.com', 'activo', '0000-00-00', 'no'),
('16208265', 'ARIEL DE JESUS ', 'CATAÑO BLANDON', 'CARTAGO', '1957-03-20', 'Kra 63 # 11-99', '3176748778', '', 'arielcatano1957@gmail.com', 'activo', '0000-00-00', 'si'),
('16208949', 'ARZULEY ANTONIO ', 'PINO TREJOS', 'CARTAGO', '1955-02-11', 'Cra 19N # 16B-73', '3122812653', '', 'arzuley2019@gmail.com', 'activo', '0000-00-00', 'si'),
('16209082', 'JUAN BAUTISTA ', 'GIRALDO ZULUAGA', 'CARTAGO', '1956-03-08', 'LOS ALMENDROS MZ 5 CSA 23', '3147747799', '', 'giraldojuan301@gmail.com', 'activo', '0000-00-00', 'si'),
('16209711', 'GERARDO ', 'ECHEVERRI SERNA', 'CARTAGO', '1958-11-15', 'CRA 2D # 33-46', '3135444611', '', 'g.echeverry15@gmail.com', 'activo', '0000-00-00', 'no'),
('16210194', 'GUSTAVO ', 'GOMEZ HERRERA', 'CARTAGO', '1956-05-28', 'CALLE 27 # 3B-22', '3183584332', '', 'coomocart.asociados@gmail.com', 'activo', '0000-00-00', 'si'),
('16210920', 'JOHNNY ', 'CABALLERO SANCHEZ', 'CARTAGO', '1959-06-06', 'CRA 10 # 18-62', '3205737433', '', 'johnnycaballero59@hotmail.com', 'activo', '0000-00-00', 'no'),
('16210988', 'JESUS ANTONIO ', 'SALAZAR GOMEZ', 'CARTAGO ', '1959-09-28', 'VILLA DEL ROBLE MZ 1 CS 3', '3163886889', '', 'juanfeosalazar@gmail.com', 'activo', '0000-00-00', 'si'),
('16211512', 'ALONSO ', 'ALZATE ALZATE', 'CARTAGO', '1959-03-10', 'CRA 1 # 15-26', '3164435496', '', 'alo-al@hotmail.com', 'activo', '0000-00-00', 'no'),
('16211594', 'ORLANDO ', 'MARIN RIOS', 'CARTAGO', '1955-09-07', 'CRA 2 # 39-20', '3213625949', '', 'coomocart.asociados@gmail.com', 'activo', '0000-00-00', 'si'),
('16212192', 'ALVARO ', 'ALZATE ALZATE', 'CARTAGO', '1960-07-16', 'CRA 4 # 16-87 ', '3128538135', '', 'alvaroalzate1687@gmail.com', 'activo', '0000-00-00', 'no'),
('16213284', 'JUAN DE JESUS', 'MARIN CUERVO', 'Cartago', '1960-01-24', 'CRA 13 # 20-24', '3207504224', 'Cartago', 'juanmarincuervo@gmail.com', 'activo', '0000-00-00', 'no'),
('16213658', 'FELIX ANGEL ', 'GIRALDO BERMUDEZ', 'CARTAGO', '1961-04-16', 'CALLE 9 # 6-40', '3136815792', '', 'coomocart.asociados@gmail.com', 'activo', '0000-00-00', 'no'),
('16214014', 'ARTURO ', 'VILLEGAS LOPEZ ', 'CARTAGO', '1962-09-05', 'CRA 3 # 18-01', '3508864124', '', 'coomocart.asociados@gmail.com', 'activo', '0000-00-00', 'no'),
('16214118', 'JESUS MARIA ', 'CIFUENTES PATIÑO', 'CARTAGO', '1961-09-29', 'CALLE 35 # 1G-14', '3136042134', '', 'jesusmariacifuentes6@gmail.com', 'activo', '0000-00-00', 'si'),
('16214640', 'JAIRO DE JESUS ', 'PALACIO PALACIO', 'CARTAGO', '2018-12-20', 'CRA 2B # 31-23', '3186623820', '', 'jairopalacio80@gmail.com', 'activo', '0000-00-00', 'no'),
('16215103', 'SILVIO ', 'SIERRA GONZALEZ', 'CARTAGO', '1959-08-02', 'CALLE 43 # 3A-84', '3154252908', '', 'coomocart.asociados@gmail.com', 'activo', '0000-00-00', 'no'),
('16215577', 'ARTURO ', 'ALZATE', 'CARTAGO', '1961-08-10', 'TRASV 7 N. 17-19', '3104399039', '', 'arturoalzate921@gmail.com', 'activo', '0000-00-00', 'si'),
('16216170', 'CARLOS ALBERTO ', 'TAMAYO HERNANDEZ', 'CARTAGO', '1963-06-08', 'CRA 14 # 3-88', '3195872528', '', 'carlosalbertotamayo78@gmail.com', 'activo', '0000-00-00', 'no'),
('16216936', 'PAULO ', 'ALENCASTRE MAZUERA', 'CARTAGO', '1963-11-15', 'CRA 3N # 12B-16', '3207468796', '', 'pauloalencastre63@gmail.com', 'activo', '0000-00-00', 'si'),
('16218015', 'JORGE HUMBERTO', 'LARGO PENILLA', 'CARTAGO', '1964-06-29', 'CRA 7 # 6-58', '3117493377', '', 'jorgelargo2008@hotmail.com', 'activo', '0000-00-00', 'no'),
('16219855', 'FERNANDO ', 'CARDONA BEDOYA', 'CARTAGO', '1966-08-05', 'Calle 14A # 13-17 El Diamante', '3184456598', '', 'ferchocarbe55@gmail.com', 'activo', '0000-00-00', 'si'),
('16220189', 'JOSE CONRADO ', 'AGUDELO SALAZAR', 'CARTAGO', '1966-12-05', 'CRA 18 # 15-25', '3126913032', '', 'joseconris@hotmail.com', 'activo', '0000-00-00', 'no'),
('16220347', 'JOSE LUIS ', 'GOMEZ VARGAS', 'CARTAGO', '1966-04-18', 'CRA 3 # 24A-58', '3218450129', '', 'gerogegomez0418@gmail.com', 'activo', '0000-00-00', 'si'),
('16220879', 'CESAR AUGUSTO ', 'MARLES VICTORIA', 'CARTAGO', '1967-06-20', 'CRA 10 # 17-22', '3115279506', '', 'alsamarvic@hotmail.com', 'activo', '0000-00-00', 'si'),
('16221130', 'JOSE FABIAN ', 'GIRALDO MARIN', 'CARTAGO', '1967-06-09', 'CRA 4 # 2-57', '3116341001', '', 'coomocart.asociados@gmail.com', 'activo', '0000-00-00', 'no'),
('16221204', 'ENRIQUE ', 'HOYOS GONZALEZ ', 'CARTAGO', '1967-09-12', 'CRA 4CN # 41B-69', '3152573959', '', 'kikehoyos50@outlook.com', 'activo', '0000-00-00', 'si'),
('16221636', 'WALTER ALIRIO ', 'GIRALDO GRANADA', 'CARTAGO', '1967-04-09', 'CRA 19BIS # 6-09', '3167178488', '', 'walteraliriogiraldog@gmail.com', 'activo', '0000-00-00', 'no'),
('16222435', 'FABIO ALBERTO ', 'AGUDELO', 'CARTAGO', '1967-12-08', 'Calle 12 # 11-21', '3184244351', '', 'fabioagu1303@gmail.com', 'activo', '0000-00-00', 'si'),
('16222497', 'GEOVANY', ' MURILLO LOPEZ ', 'CARTAGO', '1968-11-20', 'CRA 2D # 25A-04', '3146881678', '', 'samuelmejiamontoya0925@gmail.com', 'activo', '0000-00-00', 'no'),
('16222721', 'LUIS EDUARDO ', 'TRIANA ORREGO', 'CARTAGO', '1967-10-04', 'CRA 20 # 4-85', '3176823062', '', 'luistriana720@gmail.com', 'activo', '0000-00-00', 'no'),
('16222894', 'JOSE FERNELY ', 'GIRALDO GALLEGO', 'CARTAGO', '1969-03-08', 'KRA 8N # 18-04', '3183971712', '', 'fercho5389@hotmail.com', 'activo', '0000-00-00', 'si'),
('16222936', 'JUAN CARLOS ', 'HOYOS GIRALDO', 'CARTAGO', '1968-11-02', 'KRA 3 # 1A-153', '3218172786', '', 'juanhoyos802@gmail.com', 'activo', '0000-00-00', 'si'),
('16223066', 'JHON JAIRO ', 'PATIÑO TORRES', 'CARTAGO', '1969-04-20', 'CRA 4A # 16-04', '3216124523', '', 'coomocart.asociados@gmail.com', 'activo', '0000-00-00', 'no'),
('16223205', 'JAIR  ANTONIO', ' ROJAS MARIN ', 'CARTAGO', '1969-03-07', 'CALLE 10 # 12-81', '3127702840', '', 'coomocart.asociados@gmail.com', 'activo', '0000-00-00', 'no'),
('16223852', 'JESUS HUMBERTO ', 'RESTREPO YEPES', 'CARTAGO', '1969-10-13', 'LOS GIRASOLES MZ F CS 1', '3234937283', '', 'olgacubillos72@gmail.com', 'activo', '0000-00-00', 'si'),
('16224017', 'JORGE MARIO ', 'CARRANZA QUINTERO', 'CARTAGO', '1970-01-15', 'CRA 3N # 54-20', '3218767482', '', 'jorgecarranza2307@gmail.com', 'activo', '0000-00-00', 'si'),
('16224713', 'FABIO ANTONIO ', 'CARDONA ECHEVERRY', 'CARTAGO', '1968-10-12', 'CRA 1H # 39F-50', '3186687987', '', 'fabiocardona@gmail.com', 'activo', '0000-00-00', 'si'),
('16225188', 'LUCIANO ', 'VARGAS NAVARRO', 'CARTAGO', '1971-01-06', 'KRA 4 # 1-108E', '3184055324', '', 'danilo.taxi288@gmail.com', 'activo', '0000-00-00', 'si'),
('16225240', 'ANCIZAR ', 'MONTES SERNA', 'CARTAGO', '1971-02-06', 'CRA 3 # 16-05', '3206832888', '', 'coco_54@hotmail.com', 'activo', '0000-00-00', 'si'),
('16225785', 'RAMIRO ', 'MONTAÑO JIMENEZ', 'CARTAGO', '1971-07-08', 'CALLE 39B # 1B-40', '3153210910', '', 'ramiro15932@hotmail.com', 'activo', '0000-00-00', 'si'),
('16225806', 'DIEGO ', 'SARMIENTO MARIN', 'CARTAGO', '1950-01-16', 'CALLE 1E # 3-16', '3163891495', '', 'diegosarmiento1971@hotmail.com', 'activo', '0000-00-00', 'si'),
('16226263', 'RAUL FERNANDO ', 'TORRES ALARCON', 'CARTAGO', '1972-05-19', 'CALLE 23 # 4C-15', '3167030682', '', 'todo-res@hotmail.com', 'activo', '0000-00-00', 'no'),
('16226268', 'SANTIAGO ', 'LONDOÑO LONDOÑO', 'CARTAGO', '1972-05-02', 'CALLE 8 # 9-55', '3117495892', '', 'santi_0205@hotmail.com', 'activo', '0000-00-00', 'no'),
('16226835', 'ADOLFO LEON ', 'GIRALDO ACEVEDO', 'CARTAGO', '1972-09-10', 'CRA 4A # 21E-40', '3158954840', '', 'aleongi@hotmail.com', 'activo', '0000-00-00', 'no'),
('16227132', 'RAFAEL JOSE ', 'YARCE OCHOA', 'CARTAGO', '1972-12-26', 'CRA 3N # 17-29', '3136517131', '', 'rayao72@hotmail.com', 'activo', '0000-00-00', 'no'),
('16228613', 'FERNEY ', 'PALACIO ATEHORTUA', 'CARTAGO', '1974-04-28', 'CALLE 4 # 3B-08', '3157810127', '', 'coomocart.asociados@gmail.com', 'activo', '0000-00-00', 'no'),
('16228835', 'JHON JAIRO ', 'OSORIO MEJIA', 'CARTAGO', '1974-07-07', 'CRA 13 # 16D-42', '3122287893', '', 'jhonjairoosoriomejia@gmail.com', 'activo', '0000-00-00', 'no'),
('16228911', 'EDISON  ', 'PARRA DIAS', 'CARTAGO', '1974-06-15', 'KRA 11 # 7-01', '3124041708', '', 'edisonpar@msn.com', 'activo', '0000-00-00', 'no'),
('16229313', 'JUAN CARLOS ', 'MONTAÑO JIMENEZ', 'CARTAGO', '1973-07-10', 'CRA 10 BIS 11A-37', '3225244925', '', 'coomocart.asociados@gmail.com', 'activo', '0000-00-00', 'no'),
('16230260', 'HECTOR DARIO ', 'LOPEZ ZAPATA', 'CARTAGO', '1975-09-18', 'BOSQUE LOS LAGOS MZ6 CS 42', '3183938083', '', 'hectordariolz245@gmail.com', 'activo', '0000-00-00', 'si'),
('16230634', 'JUAN CARLOS ', 'FLOREZ RENDON', 'CARTAGO', '1975-12-18', 'CRA 13A # 14A-77 El Diamante', '3132183798', '', 'juancholleida@hotmail.com', 'activo', '0000-00-00', 'no'),
('16230730', 'DEISON JAVIER ', 'SALAZAR RODRIGUEZ', 'CARTAGO', '1976-01-25', 'CRA 21 # 5-33', '3206445518', '', 'deison2514@hotmail.com', 'activo', '0000-00-00', 'si'),
('16230896', 'JUAN MIGUEL ', 'SAAVEDRA MARQUEZ', 'CARTAGO', '1975-12-27', 'KRA 12A # 12-105 CS 66', '3173215307', '', 'coomocart.asociados@gmail.com', 'activo', '0000-00-00', 'no'),
('16231085', 'HENRY ', 'ZAPATA GOMEZ', 'CARTAGO', '1976-07-15', 'CRA 13 # 16D-58', '3127510261', '', 'henrysansumg18@gmail.com', 'activo', '0000-00-00', 'si'),
('16231511', 'OSCAR DE JESUS', ' MESA NIETO', 'CARTAGO', '1971-08-20', 'CRA 2N # 44-31', '3208633876', '', 'oscarmesanieto@gmail.com', 'activo', '0000-00-00', 'si'),
('16231596', 'MAURICIO ALBERTO ', 'ZULUAGA MONSALVE', 'CARTAGO', '1976-11-20', 'CALLE 14 # 8-54', '3146288512', '', 'mauro.zuluaga.mz@gmail.com', 'activo', '0000-00-00', 'si'),
('16231907', 'MARTIN HERNANDO ', 'VILLADA GRAJALES', 'CARTAGO', '1976-11-03', 'CALLE 4 # 6-44', '3165716997', '', 'mvillagraja@hotmail.com', 'activo', '0000-00-00', 'si'),
('16232064', 'JAIME ANDRES ', 'PERALTA GUTIERREZ', 'CARTAGO', '1977-03-25', 'CALLE 19 # 1-19N', '3208831183', '', 'coomocart.asociados@gmail.com', 'activo', '0000-00-00', 'no'),
('16233024', 'CARLOS ANDRES ', 'BUENO ARIAS', 'CARTAGO', '1977-12-11', 'MZ B CS 24 EL POBLADO', '3168872531', '', 'carlosandres7712@gmail.com', 'activo', '0000-00-00', 'si'),
('16261919', 'CARLOS ALBERTO ', 'CASTAÑO PALACIOS', 'CARTAGO', '1959-10-23', 'CRA 15 # 12-45', '3105419858', '', 'catalina.98@hotmail.es', 'activo', '0000-00-00', 'si'),
('16400250', 'CARLOS ALBERTO ', 'RIVEROS GUTIERREZ', 'CARTAGO', '1969-03-22', 'calle 3 # 6-95', '3136681127', '', 'coomocart.asociados@gmail.com', 'activo', '0000-00-00', 'no'),
('16400465', 'ARGEMIRO ', 'SEPULVEDA SEPULVEDA', 'CARTAGO ', '1971-08-10', 'CALLE 7 Nº 7-25 APTO 301', '3216030231', '', 'argemirosepulveda1971@gmail.com', 'activo', '0000-00-00', 'si'),
('16401388', 'ROBINSO ', 'PEREZ NOSCUE', 'CARTAGO', '1977-04-12', 'CRA 2A # T1-93', '3147084718', '', 'jesusmariapereznoscue@gmail.com', 'activo', '0000-00-00', 'no'),
('16488366', 'LEON JAIME ', 'MESA LONDOÑO', 'CARTAGO', '1967-03-14', 'CALLE 49 # 3A-50', '3113400438', '', 'coomocart.asociados@gmail.com', 'activo', '0000-00-00', 'si'),
('16581439', 'GERARDO ', 'ORTEGON VERGARA', 'CARTAGO', '1954-09-03', 'CRA 5BN # 24-48', '3058807914', '', 'gerardoortegon24@gmail.com', 'activo', '0000-00-00', 'si'),
('16780112', 'JHON JAIRO ', 'CARVAJAL TORRES', 'CARTAGO', '1969-09-24', 'KRA 63 # 13A-10', '3157536234', '', 'jhoncarvajalcjm@hotmail.com', 'activo', '0000-00-00', 'si'),
('18394791', 'JHON MARIO ', 'LOPEZ VALENCIA', 'CARTAGO', '1973-02-27', 'CRA 14 # 11B-69', '3128387726', '', 'lopezvalenciajhonmario@gmail.com', 'activo', '0000-00-00', 'no'),
('18506967', 'MIGUEL ANGEL ', 'CORTES HINCAPIE', 'PEREIRA', '1967-06-11', 'CONDOMINIO ALTA PRADERA CS 5', '3108403463', '', 'coomocart.asociados@gmail.com', 'activo', '0000-00-00', 'no'),
('19144110', 'JESUS ALBEIRO ', 'FRANCO ARENAS', 'CARTAGO', '1951-01-21', 'Kra 17 # 9A-09', '3143026761', '', 'albeirofarenas@gmail.com', 'activo', '0000-00-00', 'si'),
('19196763', 'HECTOR ', 'PINZON', 'CARTAGO', '1953-03-04', 'Cra 1 # 28-36', '3173219993', '', 'pinoroma1122@gmail.com', 'activo', '0000-00-00', 'si'),
('24548890', 'LUZ MARIA ', 'VELEZ', 'CARTAGO', '1969-02-28', 'calle 1A# 1A-27', '3136094296', '', 'luzmaria.4890@gmail.com', 'activo', '0000-00-00', 'no'),
('24550612', 'OLGA LUCIA ', 'VELEZ HEREDIA', 'CARTAGO', '1975-11-18', 'CALLE 1A # 1-27', '3117827708', '', 'olgalucia705@gmail.com', 'activo', '0000-00-00', 'no'),
('24589917', 'OLGA LUCIA ', 'CUBILLOS AVILA', 'CARTAGO', '1977-01-25', 'KRA 65 # 12-03', '3122030925', '', 'olgacubillos72@gmail.com', 'activo', '0000-00-00', 'no'),
('2459893', 'HUMBERTO ', 'IBARRA HERNANDEZ', 'CARTAGO', '1954-11-02', 'Kra 16 # 14A-161', '3113254937', '', 'humbertoibarra002@hotmail.com', 'activo', '0000-00-00', 'si'),
('2470070', 'LUIS ALBERTO ', 'LOPEZ', 'CARTAGO', '1958-04-24', 'B/ LA ORQUIDEA MZ 1 CS 2', '3147002474', '', '3225344335n@gmail.com', 'activo', '0000-00-00', 'no'),
('2470678', 'HERNANDO DE JESUS ', 'GALLON LEON', 'CARTAGO', '1962-11-20', 'Calle 5 # 15B-03', '3225835614', '', 'coomocart.asociados@gmail.com', 'activo', '0000-00-00', 'no'),
('2470835', 'IVAN ', 'RAMIREZ ZULUAGA', 'CARTAGO', '1962-02-06', 'KRA 1 # 18-32', '3225978897', '', 'ir558365@gmail.com', 'activo', '0000-00-00', 'no'),
('2471221', 'LUIS FERNANDO ', 'GUTIERREZ GOMEZ', 'CARTAGO', '1964-08-01', 'TRANSV. 37A DIAG 38B-30', '3184411417', '', 'gutierrezgomezl08@gmail.com', 'activo', '0000-00-00', 'si'),
('2471557', 'JOSE DANIEL ', 'GOMEZ CASTAÑO', 'CARTAGO', '1966-07-31', 'CRA 1N # 54-61', '3023573975', '', 'danydalcy23@hotmail.com', 'activo', '0000-00-00', 'no'),
('2472836', 'HEBER ALONSO ', 'MARULANDA OCAMPO', 'CARTAGO', '1972-06-02', 'CALLE 3 # 3A-33', '3145704449', '', 'heberla43@gmail.com', 'activo', '0000-00-00', 'no'),
('2473687', 'ANCIZAR DE JESUS ', 'HERNANDEZ PATIÑO', 'CARTAGO', '1977-04-08', 'CRA 1D # 41B-16', '3106022694', '', 'alexmolano565@gmail.com', 'activo', '0000-00-00', 'si'),
('2474352', 'JESUS ERNESTO', ' SALAZAR OLIVAR', 'CARTAGO', '1979-12-18', 'CALLE 22B # 3DN-22', '3164213285', '', 'jernestosalazar616@gmail.com', 'activo', '0000-00-00', 'si'),
('2474555', 'RAFAEL ANTONIO ', 'CASTAÑEDA ZULUAGA', 'CARTAGO', '1980-03-15', 'MZ 12 CS 11 CUDADELA DE PAZ', '3128300811', '', 'castanedazuluagar@gmail.com', 'activo', '0000-00-00', 'si'),
('25080137', 'LUZ DANELLY ', 'ARENAS LOPEZ', 'CARTAGO', '1970-03-07', 'CALLE 11 # 22-02', '3146579155', '', 'isabelsofiaecheverrizapata@gmail.com', 'activo', '0000-00-00', 'no'),
('25171123', 'DORALBA ', 'AGUDELO MEDINA', 'CARTAGO', '1972-01-16', 'CRA 6 # 18-21', '3206829583', '', 'coomocart.asociados@gmail.com', 'activo', '0000-00-00', 'no'),
('25209689', 'MARIA FABIOLA ', 'QUICENO DE HOYOS', 'CARTAGO', '1931-12-08', 'CRA 12N # 18-02', '3117710314', '', 'gustavogi09@hotmail.com', 'activo', '0000-00-00', 'no'),
('29175668', 'MARIA DORIS ', 'SUAREZ RAMIREZ', 'CARTAGO', '1963-06-16', 'KRA 7 # 8-109', '3146512562', '', 'dorissuarez939@gmail.com', 'activo', '0000-00-00', 'no'),
('29373198', 'Mª DE LAS MERCEDES ', 'CARDONA DE NARVAEZ', 'CARTAGO', '1925-06-21', 'CALLE 18 # 5N-31 BL 4 APART 404', '3155536765', '', 'coomocart.asociados@gmail.com', 'activo', '0000-00-00', 'no'),
('29376937', 'MARIA LIGIA ', 'SALINAS', 'CARTAGO', '1940-08-22', 'CALLE 16A # 10-56', '3114747222', '', 'coomocart.asociados@gmail.com', 'activo', '0000-00-00', 'no'),
('29380434', 'DELFINA ', 'ZAPATA DE AGUDELO', 'CARTAGO', '1943-05-01', 'CALLE 18 # 10-24', '3166235364', '', 'coomocart.asociados@gmail.com', 'activo', '0000-00-00', 'no'),
('29382120', 'MARIA GABRIELA ', 'SALDARRIAGA', 'CARTAGO', '1946-04-02', 'CALLE 3 # 6-13', '3113203211', '', 'coomocart.asociados@gmail.com', 'activo', '0000-00-00', 'no'),
('29382553', 'AMANDA ', 'PENILLA SUAREZ', 'CARTAGO', '1971-06-12', 'Cra 3CN # 18-05', '3113202337', '', 'coomocart.asociados@gmail.com', 'activo', '0000-00-00', 'no'),
('29382835', 'GRACIELA ', 'ABADIA SANTACRUZ', 'CARTAGO', '1949-09-20', 'Calle 13 # 63B-89', '3128945217', '', 'coomocart.asociados@gmail.com', 'activo', '0000-00-00', 'no'),
('29382963', 'GLORIA VICTORIA', ' BERRIO', 'CARTAGO', '1950-09-25', 'CALLE 14 # 10-76', '3172644275', '', 'alsamarvic@hotmail.com', 'activo', '0000-00-00', 'no'),
('29446983', 'MARLENY ', 'MEDINA DE BEDOYA', 'CARTAGO', '2017-01-11', 'CRA 9 # 18-59', '3154113703', '', 'coomocart.asociados@gmail.com', 'activo', '0000-00-00', 'no'),
('29449420', 'KELLY YOHANA ', 'YARCE BETANCOURT', 'EL AGUILA', '1985-05-04', 'CRA 4 # 11-17', '3218332975', '', 'coomocart.asociados@gmail.com', 'activo', '0000-00-00', 'no'),
('29458619', 'NANCY ', 'MEDINA', 'CARTAGO', '0000-00-00', '', '3215223486', '', 'coomocart.asociados@gmail.com', 'activo', '0000-00-00', 'no'),
('29462026', 'IRMA ', 'PATIÑO VALENCIA', 'CARTAGO', '1948-03-19', 'CRA 2 # 18-36', '3004682608', '', 'carolina_mejia97@hotmail.com', 'activo', '0000-00-00', 'no'),
('29462213', 'MARIA ORBILIA ', 'RAMIREZ OSSA', 'CARTAGO', '1949-07-03', 'CRA 7 # 14-61', '3148246551', '', 'coomocart.asociados@gmail.com', 'activo', '0000-00-00', 'no'),
('29464652', 'NELSY ', 'ARISTIZABAL MARIN', 'EL CAIRO', '1977-11-09', 'CRA 5 # 11-07', '3104159587', '', 'nearma2007@hotmail.com', 'activo', '0000-00-00', 'no'),
('29605550', 'ALBA ESNELIA ', 'ALZATE RUA', 'CARTAGO', '1967-05-04', 'CRA 6 # 21-34  LOS ANGELES', '3104102299', '', 'alzatealba64@gmail.com', 'activo', '0000-00-00', 'no'),
('29643066', 'MARIA SOCORRO ', 'PALACIOS DE CASTAÑO', 'CARTAGO', '1941-04-02', 'CRA 15 # 12-45', '3125672639', '', 'coomocart.asociados@gmail.com', 'activo', '0000-00-00', 'no'),
('29662965', 'CLAUDIA LORENA ', 'HERRERA CASTAÑO', 'CARTAGO', '1979-08-23', 'CRA 14A # 16B-37', '3113145529', '', 'rinconstiven331@gmail.com', 'activo', '0000-00-00', 'no'),
('29779461', 'MARIA AGRIPINA', ' GOMEZ DE MOLINA', 'CARTAGO', '1939-12-31', 'KRA 4AN # 20-15', '3216036682', '', 'margarettori@hotmail.com', 'activo', '0000-00-00', 'no'),
('29900401', 'MARIA EDIGLADIS ', 'ROJAS TORO', 'CARTAGO', '1972-09-09', 'CRA 2N # 33-56', '3127559407', '', 'albeirodejesussoto4@gmail.com', 'activo', '0000-00-00', 'no'),
('29951224', 'PATRICIA LILIAN ', 'DOMINGUEZ GUZMAN', 'CARTAGO', '1963-04-21', 'BOSQUE LOS LAGOS MZ 11 CS 25', '3176357883', '', 'pato_doguz@hotmail.com', 'activo', '0000-00-00', 'no'),
('31396716', 'ORFILIA ', 'GARCIA VARGAS', 'CARTAGO', '1954-09-18', 'KRA 2A # 28-09', '3168690403', '', 'gl989248@gmail.com', 'activo', '0000-00-00', 'no'),
('31397673', 'MARTHA LILIA ', 'BETANCOURTH BENITEZ', 'CARTAGO', '1954-12-10', 'CALLE 16A # 12-11', '3218543587', '', 'coomocart.asociados@gmail.com', 'activo', '0000-00-00', 'no'),
('31397853', 'ALBA LUCIA ', 'CORREA GONZALEZ', 'CARTAGO', '1958-01-01', 'CRA 16A # 16-48', '3146139039', '', 'albalucogo@gmail.com', 'activo', '0000-00-00', 'no'),
('31398220', 'BLANCA LUCIA ', 'ARROYAVE GIRALDO', 'CARTAGO', '1958-09-22', 'KRA 2E # 33-70 MONTANAR', '3115092676', '', 'blancarroyave@hotmail.com', 'activo', '0000-00-00', 'no'),
('31398651', 'MARIA FANNY ', 'ARIAS DE BUENO', 'CARTAGO', '1955-01-23', 'CIUDADELA CONFANDI MZ 1 CS 1', '3113472651', '', 'coomocart.asociados@gmail.com', 'activo', '0000-00-00', 'no'),
('31400330', 'LUZ DARY ', 'FRANCO SANCHEZ', 'CARTAGO', '1957-10-10', 'CRA 3N # 18-12', '3146740751', '', 'coomocart.asociados@gmail.com', 'activo', '0000-00-00', 'no'),
('31402770', 'MARIA GAVI ', 'ZAPATA DE PEREZ', 'CARTAGO', '1959-11-09', 'CALLE 18 # 4-95', '3174977826', '', 'cristianpelaez64@gmail.com', 'activo', '0000-00-00', 'no'),
('31403151', 'MARIA ELENA ', 'GUTIERREZ ACEVEDO', 'CARTAGO', '1958-03-22', 'CRA 4 # 16-87 ', '3103771144', '', 'alvaroalzate1687@gmail.com', 'activo', '0000-00-00', 'no'),
('31403757', 'OLGA LILIAN ', 'GIL BENITEZ', 'CARTAGO', '1961-12-27', 'CRA 12C # 11A-45', '3206809634', '', 'coomocart.asociados@gmail.com', 'activo', '0000-00-00', 'no'),
('31405540', 'MARIELA DE JESUS', ' DUQUE HERRERA', 'CARTAGO', '1958-05-22', 'Cra 6 # 14-45', '3127494429', '', 'duquesamariela@gmail.com', 'activo', '0000-00-00', 'no'),
('31407622', 'YELENA ', 'MONTOYA DUCUARA', 'CARTAGO', '1963-08-09', 'CRA 3 # 1A-153', '3122131573', '', 'juanhoyos802@gmail.com', 'activo', '0000-00-00', 'no'),
('31408138', 'MARGARITA ', 'RENDON BUSTAMANTE', 'CARTAGO', '1961-09-07', 'CRA 2A # 21-45', '3175363980', '', 'margaritarendonbustamante@hotmail.com', 'activo', '0000-00-00', 'no'),
('31408266', 'OLGA NELLY ', 'DUQUE ARROYAVE', 'CARTAGO', '1965-02-18', 'CRA 13 # 13-21 TERRAZAD DE LA 14', '3155448278', '', 'olga_2013@hotmail.com', 'activo', '0000-00-00', 'no'),
('31410008', 'AURA ESTRELLA ', 'ORREGO MONSALVE', 'CARTAGO', '1965-09-04', 'KRA 4N # 21-30', '3116349871', '', 'lauraeorregom@gmail.com', 'activo', '0000-00-00', 'no'),
('31411428', 'LUZ ADRIANA ', 'PALACIO MACHACDO', 'CARTAGO', '1966-02-22', 'CRA 8 # 18-43', '3182746102', '', 'martinfierro8@hotmail.com', 'activo', '0000-00-00', 'no'),
('31411798', 'MARIA LORENA ', 'MARULANDA', 'CARTAGO', '0000-00-00', 'CRA 4 # 2-57', '3104412945', '', 'coomocart.asociados@gmail.com', 'activo', '0000-00-00', 'no'),
('31413616', 'BLANCA LUDIVIA ', 'CARDONA HERNANDEZ', 'CARTAGO', '1969-04-24', 'TORRE LA VEGA CS 15', '3213796628', '', 'coomocart.asociados@gmail.com', 'activo', '0000-00-00', 'no'),
('31414341', 'STELLA ', 'MARIN AGUIRRE', 'CARTAGO', '1969-06-30', 'CRA 7N # 19-90', '3155691663', '', 'stellafdo@gmail.com', 'activo', '0000-00-00', 'no'),
('31414519', 'ANA VIANEY ', 'ZAPATA CARDONA', 'CARTAGO', '1969-05-05', 'CRA 3 # 18-01', '3103910614', '', 'anavianeyzapatacardona@gmail.com', 'activo', '0000-00-00', 'no'),
('31414606', 'LUZ STELLA ', 'ORTIZ JURADO', 'CARTAGO', '1969-09-14', 'CRA 11 # 10-32', '3167384190', '', 'fabioagu1303@gmail.com', 'activo', '0000-00-00', 'no'),
('31415338', 'MARTHA YANETH ', 'BEDOYA QUEBRADA', 'CARTAGO', '1970-06-10', 'calle 2  # 2-44', '3116144255', '', 'yanetbed16@gmail.com', 'activo', '0000-00-00', 'no'),
('31415450', 'BEATRIZ HELENA ', 'RENDON PATIÑO', 'CARTAGO', '1970-08-14', 'CALL 24D # 2B-56', '3128203951', '', 'beatrizelenarendon17@gmail.com', 'activo', '0000-00-00', 'no'),
('31416166', 'MARTHA LUCIA', ' ARCILA SANCHEZ', 'CARTAGO', '1966-02-01', 'DIAGONAL 1C # T1-25', '3127076272', '', 'coomocart.asociados@gmail.com', 'activo', '0000-00-00', 'no'),
('31417040', 'NORALBA ', 'OSORIO MONTOYA', 'CARTAGO', '1971-05-26', 'CRA 7 # 6-58', '3002494276', '', 'noraosorio05@hotmail.com', 'activo', '0000-00-00', 'no'),
('31417890', 'CLAUDIA LORENA ', 'RAMIREZ SALDARRIAGA', 'CARTAGO', '1972-05-03', 'CALLE 3#  3A-62', '3216269652', '', 'clalora@hotmail.fr', 'activo', '0000-00-00', 'no'),
('31418945', 'SULAIDE ', 'CIFUETES NAVALES', 'CARTAGO', '1971-02-07', 'CRA 6 # 14-69', '3145078629', '', 'amador4733@gmail.com', 'activo', '0000-00-00', 'no'),
('31419038', 'ANA MILENA ', 'FAJARDO DIAZ', 'CARTAGO', '1972-07-18', 'CALLE 12B # 9A-71', '3116256273', '', 'amifadi@yahoo.es', 'activo', '0000-00-00', 'no'),
('31419056', 'DRIGELIA ', 'RESTREPO GARCES', 'CARTAGO', '1973-01-10', 'KRA 5C # 21A-58', '3113047880', '', 'duviervelez3@gmail.com', 'activo', '0000-00-00', 'no'),
('31420615', 'MARIA EDILIA ', 'GIRALDO HERNANDEZ', 'CARTAGO', '1969-11-21', 'KRA 1N # 33-27', '3136554095', '', 'ediliagiraldo408@gmail.com', 'activo', '0000-00-00', 'no'),
('31421356', 'BEATRIZ HELENA ', 'MARTINEZ GIRALDO', 'CARTAGO', '1974-10-09', 'CALLE 35N # 1BN-19', '3104358547', '', 'juancamilonarvaezmartinez@gmail.com', 'activo', '0000-00-00', 'no'),
('31422330', 'NANCY ', 'BECERRA CORTES ', 'CARTAGO', '1974-05-04', 'Calle 14A # 13-17 El Diamante', '3218338016', '', 'kenafer2019@gmail.com', 'activo', '0000-00-00', 'no'),
('31422708', 'YINED ', 'TAPIERO CABALLERO', 'CARTAGO', '1974-06-10', 'DIAGONAL 2 #1D 38', '3228498725', '', 'yinedtapiero1974@hotmail.com', 'activo', '0000-00-00', 'no'),
('31424513', 'BEATRIZ EUGENIA ', 'TORO RIOS', 'CARTAGO', '1975-12-16', 'KRA 4AN # 20-15', '3154681686', '', 'margarettori@hotmail.com', 'activo', '0000-00-00', 'no'),
('31425573', 'SANDRA MILENA ', 'CASTAÑEDA ZULUAGA', 'CARTAGO', '1977-06-05', 'CRA 30 # 1-43', '3122928267', '', 'castanedazuluagar@gmail.com', 'activo', '0000-00-00', 'no'),
('31426027', 'ELIZABETH ', 'GIRALDO ACEVEDO', 'CARTAGO', '1978-08-06', 'CALLE 12 # 1N-66', '3108922612', '', 'aleongi@hotmail.com', 'activo', '0000-00-00', 'no'),
('31427747', 'ANA MARIA ', 'BARRERA MONTENEGRO', 'CARTAGO', '1979-06-15', 'CALLE 49 # 3B-124', '3113793987', '', 'ana.barrera@abbott.com', 'activo', '0000-00-00', 'no'),
('31429184', 'MARIA DUFAY ', 'GRAJALES JARAMILLO', 'CARTAGO', '1977-03-11', 'CRA 2 # 1E-22', '3105948379', '', 'correan426@gmail.com', 'activo', '0000-00-00', 'no'),
('31429437', 'LINA MILDREY ', 'CORTES', 'CARTAGO', '1980-09-07', 'CRA 3A # 24A-21', '3102013995', '', 'limicortezo@hotmail.com', 'activo', '0000-00-00', 'no'),
('31429762', 'DIANA SHIRLEY ', 'REYES ARROYAVE', 'CARTAGO', '1980-05-01', 'CRA 10 # 21-123', '3105072444', '', 'coomocart.asociados@gmail.com', 'activo', '0000-00-00', 'no'),
('31429908', 'BIBIANA ', 'BARRENECHE PEÑARALDA', 'CARTAGO', '1980-09-05', 'CRA 21 #5-33 Parqueadero', '3136655799', '', 'bibibape@hotmail.com', 'activo', '0000-00-00', 'no'),
('31431367', 'FRANCIA ELENA ', 'RUA AGUDELO', 'CARTAGO', '1979-11-20', 'Calle 10A # 20-22', '3116932099', '', 'felenarua@gmail.com', 'activo', '0000-00-00', 'no'),
('31432656', 'JOHANNA MARIA ', 'GIRALDO RIOS', 'CARTAGO', '1982-08-23', 'Cra 9 # 21B-20', '3006204024', '', 'coomocart.asociados@gmail.com', 'activo', '0000-00-00', 'no'),
('31433584', 'GLORIA EYICELLY ', 'ARIAS OROZCO', 'CARTAGO', '1983-07-14', 'LOS ANGELES MZ 3 CS 6', '3136178861', '', 'eyi1212@hotmail.com', 'activo', '0000-00-00', 'no'),
('31434132', 'ANGELICA MARIA ', 'LOPEZ SILVA', 'CARTAGO', '1983-10-14', 'CALLE 4 # 18-26', '3177823186', '', 'angelicalopez280gmail.com', 'activo', '0000-00-00', 'no'),
('31434165', 'PAOLA ANDREA ', 'CALDERON ABADIA', 'CARTAGO', '1983-11-10', 'CALLE 13 # 63B-89', '3116148012', '', 'coomocart.asociados@gmail.com', 'activo', '0000-00-00', 'no'),
('31436851', 'VANNESA ', 'POSADA ORREGO', 'CARTAGO', '1985-07-15', 'KRA 4N # 21-30', '3113117287', '', 'coomocart.asociados@gmail.com', 'activo', '0000-00-00', 'no'),
('34042291', 'MARLENY ', 'GUTIERREZ', 'CARTAGO', '1956-01-03', 'Calle 45B # 3N-73', '3142438878', '', 'albertovalenciab123@hotmail.com', 'activo', '0000-00-00', 'no'),
('34059712', 'NELLY ', 'RAMIREZ ZAPATA', 'CARTAGO', '1960-08-12', 'CRA 14A # 11B-55', '3117529176', '', 'coomocart.asociados@gmail.com', 'activo', '0000-00-00', 'no'),
('38580272', 'ROSA ', 'BEDOYA', 'CARTAGO', '0000-00-00', 'CALLE 9 # 6-40', '3505258269', '', 'coomocart.asociados@gmail.com', 'activo', '0000-00-00', 'no'),
('41931224', 'BEATRIZ HELENA ', 'SALINAS GARCIA', 'CARTAGO', '1974-05-10', 'CALLE 52 # 2-44', '3183269068', '', 'salinasgarcias1974@gmail.com', 'activo', '0000-00-00', 'si'),
('42062564', 'LUZ DARY ', 'GALLEGO PINEDA', 'PEREIRA', '2017-11-27', 'CALLE 101 # 16B-12', '3147530494', '', 'luzdya@yahoo.com.co', 'activo', '0000-00-00', 'no'),
('42089563', 'ISABEL PATRICIA ', 'HENAO BONILLA', 'PEREIRA', '1968-02-26', 'CORALES MZ 9 CS 26', '3240100', '', 'coomocart.asociados@gmail.com', 'activo', '0000-00-00', 'no'),
('42090788', 'MARTHA CECILIA ', 'LOAIZA CANO', 'PEREIRA', '1969-03-13', 'CRA 36 # 33-73', '3113128364', '', 'macheloaiza@hotmail.com', 'activo', '0000-00-00', 'no'),
('42120266', 'CLAUDIA MARCELA ', 'LOAIZA CANO', 'PEREIRA', '1976-09-10', 'CALLE 15 # 5-71 APTO 4B', '3116054945', '', 'macheloaiza@hotmail.com', 'activo', '0000-00-00', 'no'),
('42135061', 'MARCELA ', 'CARDONA TORRES', 'PEREIRA', '1979-06-08', 'CALLE 12 # 33-55 APTO 302 A', '3216081485', '', 'santiyjuan0129@yahoo.es', 'activo', '0000-00-00', 'no'),
('42145266', 'ISABEL CRISTINA ', 'PELAEZ GUTIERREZ', 'PEREIRA', '2021-03-05', 'CALLE 68 # 25-69', '3007673909', '', 'magazacal@gmail.com', 'activo', '0000-00-00', 'no'),
('4356562', 'CARLOS URIEL ', 'DUQUE RIVERA', 'CARTAGO', '1955-01-13', 'CRA 6 # 18-21', '3188480179', '', 'carlosurielduquerivera@gmail.com', 'activo', '0000-00-00', 'no'),
('4379502', 'JOSE LIBARDO ', 'ALVAREZ PEREZ', 'CARTAGO', '1961-02-12', 'CRA 3CN # 16C-22', '3108618895', '', 'libardoalbaperez@gmail.com', 'activo', '0000-00-00', 'si'),
('4453645', 'JOSE BIANEY ', 'SALAZAR FRANCO', 'CARTAGO', '1964-07-28', 'CRA 8 # 9-79', '3128957153', '', 'salazarbianey93@gmail.com', 'activo', '0000-00-00', 'no'),
('4859312', 'TULIO ANCIZAR ', 'RAMIREZ JIMENEZ', 'CARTAGO', '1950-10-29', 'CALLE 18 # 6-60', '3234873270', '', 'coomocart.asociados@gmail.com', 'activo', '0000-00-00', 'no'),
('4860090', 'JOSE ALONSO ', 'SALAZAR CORREA', 'CARTAGO', '1967-09-16', 'DIAGONAL 2 # 1D-38 ', '3117246715', '', 'josealonsosalazar223@gmail.com', 'activo', '0000-00-00', 'si'),
('51833348', 'ELVIA PATRICIA ', 'ROJAS MEJIA', 'DOSQUEBRADAS', '1966-01-06', 'Calle 14 # 18-30 Apto 501 torre 2 Granate', '3182065880', '', 'paticorojasm@hotmail.com', 'activo', '0000-00-00', 'no'),
('52797785', 'JOHANA ANDREA ', 'GAVIRIA RANGEL', 'CARTAGO', '1979-10-09', 'CRA 13A # 14A-77 El Diamante', '3116110858', '', 'johanalleida@hotmail.com', 'activo', '0000-00-00', 'no'),
('6131358', 'JESUS ALIRIO ', 'QUINTERO HENAO', 'CARTAGO', '1966-07-27', 'CALLE32 #7CN-16', '3115939686', '', 'alirioquim31@gmail.com', 'activo', '0000-00-00', 'si'),
('6133632', 'ARIEL ANTONIO ', 'SUAREZ RAMIREZ', 'CARTAGO', '1967-12-18', 'TORRE LA VEGA CS 15', '3016939541', '', 'ariel1812@hotmail.com', 'activo', '0000-00-00', 'no'),
('6240229', 'OSCAR AUGUSTO ', 'OSORIO GUZMAN', 'CARTAGO', '1979-09-22', 'CALLE 50 # 1N-38', '3218839945', '', 'coomocart.asociados@gmail.com', 'activo', '0000-00-00', 'si'),
('6241319', 'JHON JAIRO ', 'OSORIO', 'CARTAGO', '1979-09-19', 'CALLE 2 # 2-59', '3184464099', '', 'jonhosorio71@gmail.com', 'activo', '0000-00-00', 'si'),
('6241428', 'LUIS EDUARDO ', 'PALACIOS MEDINA', 'CARTAGO', '1980-11-13', 'Carrera 11 No.16A-33', '3148752172', '', 'rpm_0266@hotmail.com', 'activo', '0000-00-00', 'no'),
('6244672', 'CENON ', 'TAMAYO MONTOYA', 'CARTAGO', '1951-03-26', 'Cra 60 # 11-66', '3104475960', '', 'senontamayo@gmail.com', 'activo', '0000-00-00', 'si'),
('6271507', 'LIBARDO ANTONIO ', 'MARIN OSORIO', 'CARTAGO', '1941-09-25', 'CALLE 19 # 3-18', '3217156130', '', 'coomocart.asociados@gmail.com', 'activo', '0000-00-00', 'no'),
('6275040', 'GUSTAVO ', 'RENDON GIL', 'CARTAGO', '1960-07-22', 'CR 4 #1A-68', '3128341080', '', 'gustavorendon1960@gmail.com', 'activo', '0000-00-00', 'si'),
('6280484', 'GUILLERMO LEON ', 'GIRALDO ECHEVERRI', 'CARTAGO', '1955-11-11', 'VILLA DEL ROBLE MZ 8 CS 5', '3108225077', '', 'guillermogiraldo0484@gmail.com', 'activo', '0000-00-00', 'si'),
('6280938', 'WILLIAM  ', 'OCAMPO MONTOYA', 'CARTAGO', '1959-04-18', 'CRA 4N # 33-63', '3136475483', '', 'coomocart.asociados@gmail.com', 'activo', '0000-00-00', 'no'),
('6281111', 'JOSE ABELARDO ', 'CARDONA ECHEVERRY', 'CARTAGO', '1960-06-01', 'KRA 1H # 39F-50', '3187125857', '', 'joselito_00048@hotmail.com', 'activo', '0000-00-00', 'no'),
('6283991', 'FERNANDO ', 'LOPEZ BURITICA', 'CARTAGO', '1972-03-07', 'CRA 30B # 2-27', '3104031798', '', 'coomocart.asociados@gmail.com', 'activo', '0000-00-00', 'no'),
('6284462', 'NOLBERTO ', 'LOPEZ BUTIRICA', 'CARTAGO', '1978-05-09', 'CALLE 14A # 61-15', '3206551874', '', 'nolbertolopez462@gmail.com', 'activo', '0000-00-00', 'si'),
('6360224', 'FELIX ANTONIO ', 'ZULETA GARCIA', 'CARTAGO', '1955-05-10', 'CALLE 16A # 12-11', '3172321752', '', 'felizzuleta5@gmail.com', 'activo', '0000-00-00', 'no'),
('6360986', 'JOSE ALBEIRO ', 'GIRALDO MURILLO', 'CARTAGO', '1964-03-12', 'EL JAZMIN MZ 3 CS 15', '3117329628', '', 'giraldomurillojosealbeiro@gmail.com', 'activo', '0000-00-00', 'si'),
('6361044', 'JOSE LUIS ', 'VARGAS DIAZ', 'CARTAGO', '1964-09-10', 'CALLE 3 # 5-62', '3113873367', '', 'joseluis3113873367@gmail.com', 'activo', '0000-00-00', 'si'),
('6476568', 'JOSE ABSALON ', 'BEDOYA GUZMAN ', 'CARTAGO', '1939-05-18', 'Calle 2 # 2-44', '3156465015', '', 'coomocart.asociados@gmail.com', 'activo', '0000-00-00', 'no'),
('6479488', 'JESUS MARIA ', 'PEREZ NOSCUE', 'CARTAGO', '1969-11-28', 'CRA 23 # 4B-34', '3134687372', '', 'jesusmariapereznoscue@gmail.com', 'activo', '0000-00-00', 'si'),
('6480417', 'ARGEMIRO ', 'RINCON ARIAS', 'CARTAGO', '1948-07-29', 'CRA 8 # 2C-40', '3146568041', '', 'argemiro.rincon@hotmail.com', 'activo', '0000-00-00', 'si'),
('6481115', 'OCTAVIO ENRIQUE ', 'ARISTIZABAL GOMEZ', 'CARTAGO', '1955-05-23', 'CALLE 2E # 3AA-46', '3122356391', '', 'octavio947@hotmail.com', 'activo', '0000-00-00', 'no'),
('6482219', 'LUBIAN ', 'IBARRA MURIEL', 'CARTAGO', '1968-07-29', 'CRA 11 No 5B-84', '3216510802', '', 'lubianibarram68@hotmail.com', 'activo', '0000-00-00', 'no'),
('6526358', 'GUSTAVO ADOLFO ', 'GIRALDO HOYOS', 'CARTAGO', '1980-11-18', 'KRA 12N # 18-08', '3117710314', '', 'gustavogi09@hotmail.com', 'activo', '0000-00-00', 'no'),
('6526654', 'JAIR ALEXANDER ', 'GALLEGO RINCON', 'CARTAGO', '1983-07-16', 'El limonar Mz A Cs 6', '3128207991', '', 'monogallego654@hotmail.com', 'activo', '0000-00-00', 'si'),
('66651826', 'MARIA NELLY ', 'CARVAJAL HERNANDEZ', 'CARTAGO', '1965-03-01', 'KRA 8 # 14-43', '3182746103', '', 'martinfierro8@hotmail.com', 'activo', '0000-00-00', 'no'),
('66741997', 'MARIA GLADIS ', 'HENAO PATIÑO', 'CARTAGO', '1971-09-30', 'Kra 5 calle 18 esquina', '3117403584', '', 'coomocart.asociados@gmail.com', 'activo', '0000-00-00', 'no'),
('70068241', 'RODRIGO ', 'NOREÑA MARIN', 'CARTAGO', '1954-09-07', 'TRANSV. 16 # 9-39', '3147420027', '', 'norenarodrigo627@gmail.com', 'activo', '0000-00-00', 'si'),
('70810348', 'FERNANDO DE JESUS', ' GIRALDO LOPEZ', 'CARTAGO', '1961-02-08', 'CRA 18N # 17-56', '3165330535', '', 'stellafdo@gmail.com', 'activo', '0000-00-00', 'no'),
('71311877', 'MIGUEL ANDRES ', 'PATIÑO DIAZ', 'CARTAGO', '1980-06-08', 'CRA 8 # 15-50', '3193180957', '', 'miguelpd80@gmail.com', 'activo', '0000-00-00', 'no'),
('75035177', 'MAURICIO ', 'CARVAJAL VELASQUEZ', 'PEREIRA', '1978-11-17', 'URB. ALTAVISTA MZ 18 CS 19', '3175949384', '', 'macavea@outlook.com', 'activo', '0000-00-00', 'no'),
('75144891', 'PEDRO NEL ', 'ASPRILLA MOSQUERA', 'CARTAGO', '1973-12-12', 'LOS ANGELES MZ A CS 5', '3122955483', '', 'pedris1273@hotmail.com', 'activo', '0000-00-00', 'si'),
('7532119', 'DORANCE DE JESUS ', 'LOAIZA HERNANDEZ', 'CARTAGO', '1960-07-08', 'CRA 7 # 8-109 APTO 203', '3127794161', '', 'doranceospina@hotmail.com', 'activo', '0000-00-00', 'no'),
('79668626', 'NOOVER DE JESUS ', 'GOMEZ HENAO', 'CARTAGO', '1974-09-06', 'CRA 5N # 19-51', '3212484662', '', 'sandracristina34@gmail.com', 'activo', '0000-00-00', 'si'),
('79860024', 'RAFAEL FERNANDO ', 'GARCIA CORTES', 'BOGOTA', '1975-08-14', 'CALLE 34 # 20-08 APTO 202', '3122877088', '', 'rafagiras@hotmail.com', 'activo', '0000-00-00', 'no'),
('80231626', 'JUAN CARLOS ', 'OROZCO PALACIOS', 'CARTGAO', '1980-08-18', 'KRA 13 # 16D-51', '3164012480', '', 'ojuancarlos970@gmail.com', 'activo', '0000-00-00', 'si'),
('80362734', 'GUILLERMO ', 'ORTIZ MORENO', 'CARTAGO', '1965-06-23', 'CRA 5AN # 24-23', '3137480266', '', 'memito2306@hotmail.com', 'activo', '0000-00-00', 'no'),
('82270089', 'LUIS HORACIO ', 'MEJIA ZAPATA', 'CARTAGO', '1965-03-14', 'CALLE 33 # 8N-15 ', '3128362843', '', 'orbilia7419@gmail.com', 'activo', '0000-00-00', 'si'),
('82290041', 'LEONEL DE JESUS ', 'GAÑAN BAÑOL', 'CARTAGO', '1963-09-06', 'CALLE 4 # 30-96', '3127541159', '', 'ttaxcartago@gmail.com', 'activo', '0000-00-00', 'si'),
('93416076', 'AUDBERTO ', 'QUITIAN ROJAS', 'CARTAGO', '1967-01-23', 'CRA 9 # 7-75', '3128462018', '', 'aquiro867@gmail.com', 'activo', '0000-00-00', 'no'),
('94225292', 'WILMER ARNOBY ', 'QUICENO CEBALLOS', 'CARTGO', '1963-04-22', 'TRANS. 5B # 15-28', '3216392480', '', 'alextonza2015@gmail.com', 'activo', '0000-00-00', 'no'),
('94263039', 'JESUS ANTONIO ', 'GUERRERO DIAZ', 'CARTAGO', '1979-04-12', 'CIUDADELA LOS ANGELES MZ 8 CS7', '3113387044', '', 'jesusantonioguerrerodiaz@gmail.com', 'activo', '0000-00-00', 'no'),
('94350866', 'HECTOR ELIECER ', 'GALVIZ HERNANDEZ', 'CARTAGO', '1973-09-25', 'CALLE 23D # 1N-03', '3137505813', '', 'gahehe2012@hotmail.com', 'activo', '0000-00-00', 'no'),
('94351175', 'MAURICIO ALEJANDRO ', 'CARVAJAL ZAPATA', 'CARTAGO', '1977-03-05', 'CRA 22B # 4A-43', '3133973259', '', 'mauriciocarvajal3000@gmail.com', 'activo', '0000-00-00', 'no'),
('94368995', 'JESUS ANTONIO ', 'GARZON MESA', 'CARTAGO', '1973-12-24', 'CRA 3B # 24A-106', '3117095361', '', 'coomocart.asociados@gmail.com', 'activo', '0000-00-00', 'no'),
('9534204', 'DUVIER ARTURO ', 'VELEZ GOMEZ', 'CARTAGO', '1969-12-05', 'KRA 5C # 21A-58', '3137118709', '', 'duviervelez3@gmail.com', 'activo', '0000-00-00', 'no'),
('9698083', 'EDUARDO ANTONIO', 'QUIROZ MONTOYA', 'CARTAGO', '1982-10-23', 'CALLE 35A 1C 33', '3127059838', '', 'quirozmontoyaeduardo@gmail.com', 'activo', '0000-00-00', 'si'),
('97610895', 'WILSON HUMBERTO ', 'PARRA MURCIA', 'CARTAGO', '1978-07-13', 'CALLE 9 # 7-35', '3142245311', '', 'wilsonph31@gmail.com', 'activo', '0000-00-00', 'si'),
('9956350', 'ORLANDO ANTONIO ', 'OROZCO RODRIGUEZ', 'CARTAGO', '1970-12-14', 'CALLE 19 # 4-34', '3154857614', '', 'orlandoorozco556@gmail.com', 'activo', '0000-00-00', 'no'),
('9970267', 'MARTIN ORLANDO ', 'BUITRAGO CUERVO', 'CARTAGO', '1969-07-26', 'CRA 8 # 18-43', '3182746103', '', 'martinfierro8@hotmail.com', 'activo', '0000-00-00', 'no');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reporte_planilla`
--

CREATE TABLE `reporte_planilla` (
  `fecha` datetime DEFAULT NULL,
  `id_planilla` int(10) DEFAULT NULL,
  `n_planilla` int(10) NOT NULL,
  `id_movil` varchar(5) DEFAULT '',
  `grupo` varchar(2) DEFAULT '',
  `id_conductor` int(5) DEFAULT NULL,
  `codigo` varchar(15) DEFAULT '',
  `nombre_con` varchar(30) DEFAULT '',
  `destino` varchar(25) DEFAULT '',
  `elab` varchar(15) DEFAULT '',
  `recibido` varchar(15) DEFAULT '',
  `estado` int(1) DEFAULT 0,
  `observaciones` varchar(100) DEFAULT NULL,
  `liquidado` int(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE `servicio` (
  `id_ser` int(15) NOT NULL,
  `fecha_reg` datetime NOT NULL,
  `linea` varchar(25) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `detalle_serv` varchar(50) NOT NULL,
  `id_movil` varchar(10) NOT NULL,
  `id_movil2` varchar(10) DEFAULT NULL,
  `placa` varchar(10) DEFAULT NULL,
  `fecha_asig` datetime DEFAULT NULL,
  `id_tarjeta` int(10) DEFAULT NULL,
  `tarjeta` varchar(10) DEFAULT NULL,
  `id_conductor` int(10) DEFAULT NULL,
  `codigo` varchar(20) DEFAULT NULL,
  `nombres` varchar(50) DEFAULT NULL,
  `estado` int(1) DEFAULT NULL COMMENT '0 pendiente,1 asignado,2 descartado',
  `observacion` varchar(100) DEFAULT NULL,
  `usuario` varchar(20) NOT NULL,
  `recep_serv` int(1) NOT NULL COMMENT '0 pbx 1 celular,2pto de radio'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio_h`
--

CREATE TABLE `servicio_h` (
  `id_ser` int(15) NOT NULL,
  `id_ser_ref` int(10) NOT NULL,
  `fecha_reg` datetime NOT NULL,
  `linea` varchar(25) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `detalle_serv` varchar(50) NOT NULL,
  `id_movil` varchar(10) NOT NULL,
  `id_movil2` varchar(10) NOT NULL,
  `placa` varchar(10) NOT NULL,
  `fecha_asig` datetime NOT NULL,
  `id_tarjeta` int(10) NOT NULL,
  `tarjeta` varchar(10) NOT NULL,
  `id_conductor` int(10) NOT NULL,
  `codigo` varchar(20) NOT NULL,
  `nombres` varchar(50) NOT NULL,
  `estado` int(1) NOT NULL COMMENT '0 pendiente,1 asignado,2 descartado',
  `observacion` varchar(100) NOT NULL,
  `usuario` varchar(20) NOT NULL,
  `recep_serv` int(1) NOT NULL COMMENT '0 pbx 1 celular,2pto de radio'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio_h2`
--

CREATE TABLE `servicio_h2` (
  `id_ser` int(15) NOT NULL,
  `id_ser_ref` int(10) NOT NULL,
  `fecha_reg` datetime NOT NULL,
  `linea` varchar(25) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `detalle_serv` varchar(50) NOT NULL,
  `id_movil` varchar(10) NOT NULL,
  `id_movil2` varchar(10) NOT NULL,
  `placa` varchar(10) NOT NULL,
  `fecha_asig` datetime NOT NULL,
  `id_tarjeta` int(10) NOT NULL,
  `tarjeta` varchar(10) NOT NULL,
  `id_conductor` int(10) NOT NULL,
  `codigo` varchar(20) NOT NULL,
  `nombres` varchar(50) NOT NULL,
  `estado` int(1) NOT NULL COMMENT '0 pendiente,1 asignado,2 descartado',
  `observacion` varchar(100) NOT NULL,
  `usuario` varchar(15) NOT NULL,
  `recep_serv` int(1) NOT NULL COMMENT '0 pbx 1 celular,2pto de radio'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `simit`
--

CREATE TABLE `simit` (
  `id_simit` int(5) NOT NULL,
  `id_conductor` int(10) NOT NULL,
  `n_parte` varchar(50) NOT NULL DEFAULT '',
  `cod_infraccion` varchar(10) NOT NULL,
  `id_eps` int(5) DEFAULT NULL,
  `valor` int(20) NOT NULL,
  `fecha_parte` date NOT NULL,
  `fecha_pago` date DEFAULT '0000-00-00',
  `convenio` varchar(5) DEFAULT NULL,
  `observacion` varchar(150) DEFAULT NULL,
  `estado` varchar(20) NOT NULL COMMENT '1,activa,2 pago'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `suspension`
--

CREATE TABLE `suspension` (
  `id_susp` int(5) NOT NULL,
  `id_movil` varchar(5) NOT NULL,
  `f_inicio` datetime NOT NULL,
  `f_fin` datetime NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `usuario` varchar(20) NOT NULL,
  `est` int(1) NOT NULL,
  `justificacion` varchar(150) DEFAULT '',
  `id_tarjeta` int(10) NOT NULL,
  `id_conductor` int(15) NOT NULL,
  `conductor` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarifas`
--

CREATE TABLE `tarifas` (
  `id_tarifa` int(11) UNSIGNED NOT NULL,
  `concepto` varchar(100) DEFAULT NULL,
  `tarifa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarjeta_control`
--

CREATE TABLE `tarjeta_control` (
  `id_tarjeta` int(10) NOT NULL,
  `tarjeta` varchar(10) NOT NULL,
  `id_conductor` int(10) NOT NULL,
  `id_movil` varchar(5) NOT NULL,
  `id_empresa` int(5) NOT NULL,
  `fecha_vigencia` date NOT NULL,
  `fecha_plazo_a` datetime NOT NULL,
  `fecha_elab` date NOT NULL,
  `id_doc_ref` int(5) NOT NULL,
  `planilla` varchar(15) DEFAULT NULL,
  `estado` int(2) NOT NULL COMMENT '1 activo,2 cerrada,3 anulada',
  `est_ant` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipov`
--

CREATE TABLE `tipov` (
  `id_tipov` int(5) NOT NULL,
  `tipov` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipov`
--

INSERT INTO `tipov` (`id_tipov`, `tipov`) VALUES
(1, 'MICROBUS URBANO'),
(2, 'MICROBUS ESPECIAL'),
(3, 'MICROBUS INTERMUNICIPAL'),
(4, 'BUS ESPECIAL'),
(5, 'BUS INTERMUNICIPAL'),
(6, 'CAMPERO'),
(7, 'CAMIONETA ESPECIAL'),
(8, 'CAMIONETA DOBLE CABINA'),
(9, 'TAXI');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_accidente`
--

CREATE TABLE `tipo_accidente` (
  `id_tipo_a` int(3) NOT NULL COMMENT 'id interna del tipo de accidente',
  `tipo_accidente` varchar(35) NOT NULL COMMENT 'descripcion del tipo de accidente'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_doc`
--

CREATE TABLE `tipo_doc` (
  `tipo_doc` int(2) NOT NULL COMMENT 'Tipo Documento',
  `abreviatura` varchar(5) NOT NULL COMMENT 'Documento de identidad',
  `descrip` varchar(50) NOT NULL COMMENT 'Descripción Documento'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_doc`
--

INSERT INTO `tipo_doc` (`tipo_doc`, `abreviatura`, `descrip`) VALUES
(1, 'CC', 'Cédula de Ciudadanía'),
(2, 'NIT', 'Número Identificación Tributaria');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_linea`
--

CREATE TABLE `tipo_linea` (
  `id_tipo_linea` int(5) NOT NULL,
  `tipo_linea` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_taxi`
--

CREATE TABLE `tipo_taxi` (
  `id_movil` varchar(4) NOT NULL,
  `id_tipov` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transaccion`
--

CREATE TABLE `transaccion` (
  `id_tran` int(5) NOT NULL,
  `detalle_tran` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `utilidades`
--

CREATE TABLE `utilidades` (
  `estado` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `utilidades`
--

INSERT INTO `utilidades` (`estado`) VALUES
(1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `valor_poliza`
--

CREATE TABLE `valor_poliza` (
  `id_valorp` int(5) NOT NULL,
  `id_tipov` int(5) NOT NULL,
  `valorp` float NOT NULL,
  `vini` float NOT NULL,
  `vc1` float NOT NULL,
  `vc2` float NOT NULL,
  `fini` datetime NOT NULL,
  `ffin` datetime NOT NULL,
  `grupo` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculo`
--

CREATE TABLE `vehiculo` (
  `id_movil` varchar(4) NOT NULL,
  `placa` varchar(7) DEFAULT NULL,
  `modelo` int(4) DEFAULT NULL,
  `clase` varchar(50) DEFAULT NULL,
  `id_marca` int(5) DEFAULT NULL,
  `referencia` varchar(50) DEFAULT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `motor` varchar(35) DEFAULT NULL,
  `serie` varchar(35) DEFAULT NULL,
  `color` varchar(15) DEFAULT NULL,
  `pago_hasta` date DEFAULT NULL,
  `grupo` varchar(3) DEFAULT NULL,
  `id_prop` varchar(11) DEFAULT NULL,
  `estado` int(2) DEFAULT 1,
  `poliza` int(2) DEFAULT 1,
  `managerid` varchar(30) DEFAULT NULL,
  `combustible` varchar(50) DEFAULT NULL,
  `dtaller` int(5) DEFAULT NULL,
  `fcontrato` date DEFAULT NULL,
  `radio` enum('si','no') DEFAULT 'si',
  `ultimo_pago` date DEFAULT NULL,
  `cilindraje` varchar(10) DEFAULT NULL,
  `obs` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `vehiculo`
--

INSERT INTO `vehiculo` (`id_movil`, `placa`, `modelo`, `clase`, `id_marca`, `referencia`, `tipo`, `motor`, `serie`, `color`, `pago_hasta`, `grupo`, `id_prop`, `estado`, `poliza`, `managerid`, `combustible`, `dtaller`, `fcontrato`, `radio`, `ultimo_pago`, `cilindraje`, `obs`) VALUES
('006', 'VLH-054', 2006, 'AUTOMOVIL', 1, 'ATOS', 'HATCH-BACK', 'G4HC5M685954', 'MALAB51GP6M747272', 'AMARILLO', '0000-00-00', 'TA', '16213284', 1, 0, '', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('007', 'STH-042', 2012, 'AUTOMOVIL', 1, 'ATOS', 'HATCH-BACK', 'G4HCBM210876', 'MALAB51GACM647464', 'AMARILLO', '0000-00-00', 'TA', '6353360', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1000', ''),
('008', 'STH-262', 2015, 'AUTOMOVIL', 6, 'PICANTO', 'HATCH-BACK', 'G3LAEP095429', 'KNABE511AFT890361', 'AMARILLO', '0000-00-00', 'TA', '6240229', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '998', ''),
('009', 'STH-045', 2011, 'AUTOMOVIL', 6, 'PICANTO', 'HATCH-BACK', 'G4HGA859443', 'KNABJ513ABT132433', 'AMARILLO', '0000-00-00', 'TA', '14567609', 1, 0, '', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1086', ''),
('011', 'VLH-332', 2007, 'AUTOMOVIL', 1, 'ATOS', 'SEDAN', 'G4HC6M010522', 'MALAB51GP7M011757', 'AMARILLO', '0000-00-00', 'TA', '16228613', 1, 0, '', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('012', 'VLH-227', 2007, 'AUTOMOVIL', 1, 'ATOS', 'HATCH-BACK', 'G4HC6M878868', 'MALAB51GP7M905120', 'AMARILLO', '0000-00-00', 'TA', '19196763', 1, 0, '', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('013', 'STH-313', 2016, 'AUTOMOVIL', 1, 'GRAND I10', 'SEDAN', 'G4LAFM844555', 'MALA741CAGM145714', 'AMARILLO', '0000-00-00', 'TA', '31422708', 1, 0, '4860090', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1248', ''),
('016', 'VLH-548', 2010, 'AUTOMOVIL', 1, 'ATOS', 'HATCH-BACK', 'G4HC9M907550', 'MALAB51GAAM487078', 'AMARILLO', '0000-00-00', 'TA', '31436851', 1, 0, '31410008', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1000', ''),
('017', 'VLH-445', 2008, 'AUTOMOVIL', 1, 'ATOS', 'SEDAN', 'G4HC7M332554', 'MALAB51GP8M249294', 'AMARILLO', '0000-00-00', 'TA', '31398651', 1, 0, '16233024', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('019', 'VLH-399', 2008, 'AUTOMOVIL', 3, 'SPARCK', 'SEDAN', 'B10S1897126KA2', '9GAMM610X8B016000', 'AMARILLO', '0000-00-00', 'TA', '6476568', 1, 0, '31415338', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1000', ''),
('020', 'STH-209', 2014, 'AUTOMOVIL', 6, 'PICANTO', 'HATCH-BACK', 'G4LADP119717', 'KNABE512AET693217', 'AMARILLO', '0000-00-00', 'TA', '2471557', 1, 0, '2471557', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1248', ''),
('021', 'VLG-661', 2005, 'AUTOMOVIL', 1, 'ATOS', 'SEDAN', 'G4HC4D38070', 'MALAB51GP5M459381', 'AMARILLO', '0000-00-00', 'TA', '31403757', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1000', ''),
('024', 'VLH-446', 2008, 'AUTOMOVIL', 6, 'RIO', 'HATCH-BACK', 'G4HG6223174', 'KNABA24328T560820', 'AMARILLO', '0000-00-00', 'TA', '1031641210', 1, 0, '41931224', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1100', ''),
('028', 'STH-252', 2015, 'AUTOMOVIL', 6, 'PICANTO', 'HATCH-BACK', 'G4LAEP091446', 'KNABE512AFT882416', 'AMARILLO', '0000-00-00', 'TA', '1130655598', 1, 0, '', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1248', ''),
('030', 'VLG-699', 2005, 'AUTOMOVIL', 1, 'ATOS', 'SEDAN', 'G4HC4D51279', 'MALAB51GP5M472731', 'AMARILLO', '0000-00-00', 'TA', '1112794339', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('031', 'VLH-514', 2010, 'AUTOMOVIL', 3, 'SPARK', 'SEDAN', 'B10S1219074KC2', '9GAMM6100AB169149', 'AMARILLO', '0000-00-00', 'TA', '16581439', 1, 0, '', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1000', ''),
('034', 'VLH-060', 2006, 'AUTOMOVIL', 1, 'ATOS', 'HATCH-BACK', 'G4HC5M719864', 'MALAB51GP6M772799', 'AMARILLO', '0000-00-00', 'TA', '14455406', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('040', 'VLG-816', 2005, 'AUTOMOVIL', 1, 'ATOS', 'SEDAN', 'G4HC4E58073', 'MALAB51GP5M565918', 'AMARILLO', '0000-00-00', 'TA', '6480417', 1, 0, '', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('042', 'STH-057', 2011, 'AUTOMOVIL', 6, 'ECOTAXI', 'HATCH-BACK', 'G4HGA852746', 'KNABJ513ABT131153', 'AMARILLO', '0000-00-00', 'TA', '31417890', 1, 0, '29382120', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1086', ''),
('044', 'STH-369', 2019, 'AUTOMOVIL', 6, 'PICANTO', 'HATCH-BACK', 'G4LAJP129821', 'KNAB2512AKT432699', 'AMARILLO', '0000-00-00', 'TA', '2459893', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1248', ''),
('045', 'STH-231', 2014, 'AUTOMOVIL', 1, 'i10', 'HATCH-BACK', 'G4HGDM737641', 'MALAM51BAEM502568', 'AMARILLO', '0000-00-00', 'TA', '1118237016', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1086', ''),
('047', 'STH-046', 2012, 'AUTOMOVIL', 1, 'ATOS', 'HATCH-BACK', 'G4HCBM229983', 'MALAB51GACM647563', 'AMARILLO', '0000-00-00', 'TA', '16214640', 1, 0, '', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1000', ''),
('049', 'VLG-704', 2005, 'AUTOMOVIL', 1, 'ATOS', 'SEDAN', 'G4HC4D52523', 'MALAB51GP5M481732', 'AMARILLO', '0000-00-00', 'TA', '29449420', 1, 0, '', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('052', 'STH-339', 2017, 'AUTOMOVIL', 6, 'PICANTO', 'HATCH-BACK', 'G44LAGP139910', 'KNABE512AHT446215', 'AMARILLO', '0000-00-00', 'TA', '24589917', 1, 0, '16223852', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1248', ''),
('054', 'VLH-406', 2008, 'AUTOMOVIL', 6, 'EKOTAXI', 'HATCH-BACK', 'G4HG7245336', 'KNABA24328T436235', 'AMARILLO', '0000-00-00', 'TA', '1112772876', 1, 0, '', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1086', ''),
('055', 'VLH-542', 2010, 'AUTOMOVIL', 1, 'ATOS', 'SEDAN', 'G4HC9M902861', 'MALAB51GAAM483098', 'AMARILLO', '0000-00-00', 'TA', '16229313', 1, 0, '16225785', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('057', 'VLH-157', 2007, 'AUTOMOVIL', 1, 'ATOS', 'SEDAN', 'G4HC6M831133', 'MALAB51GP7M864781', 'AMARILLO', '0000-00-00', 'TA', '31426027', 1, 0, '16226835', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('059', 'STH-292', 2016, 'AUTOMOVIL', 6, 'PICANTO', 'HATCH-BACK', 'G4LAFP061507', 'KNABE512AGT087190', 'AMARILLO', '0000-00-00', 'TA', '66651826', 1, 0, '9970267', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1248', ''),
('061', 'VLH-462', 2009, 'AUTOMOVIL', 1, 'ATOS', 'HATCH-BACK', 'G4HC8M413162', 'MALAB51GP9M285421', 'AMARILLO', '0000-00-00', 'TA', '31414519', 1, 0, '16214014', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('065', 'VLG-588', 2004, 'AUTOMOVIL', 1, 'ATOS', 'SEDAN', 'G4HC3C06142', 'MALAB51GP4M328137', 'AMARILLO', '0000-00-00', 'TA', '31414606', 1, 0, '16222435', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('066', 'STH-056', 2012, 'AUTOMOVIL', 1, 'ATOS', 'HATCH-BACK', 'G4HCBM229901', 'MALAB51GACM647607', 'AMARILLO', '0000-00-00', 'TA', '29382963', 1, 0, '16220879', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1000', ''),
('069', 'VLH-546', 2010, 'AUTOMOVIL', 1, 'ATOS', 'HATCH-BACK', 'G4HC9M902042', 'MALAB51GAAM4822533', 'AMARILLO', '0000-00-00', 'TA', '79668626', 1, 0, '', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('074', 'STI-076', 2011, 'AUTOMOVIL', 1, 'ATOS', 'HATCH-BACK', 'G4HCAM998011', 'MALAB51GABM529075', 'AMARILLO', '0000-00-00', 'TA', '24550612', 1, 0, '24548890', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1000', ''),
('084', 'VLH-259', 2007, 'AUTOMOVIL', 1, 'ATOS', 'HATCH-BACK', 'G4HG6M901130', 'MALAB51HP7M923318', 'AMARILLO', '0000-00-00', 'TA', '29380434', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('085', 'VLG-678', 2005, 'AUTOMOVIL', 1, 'ATOS', 'SEDAN', 'G4HC4D46106', 'MALAB51GP5M465528', 'AMARILLO', '0000-00-00', 'TA', '1112773517', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('092', 'STI-260', 2010, 'AUTOMOVIL', 1, 'ATOS', 'HATCH-BACK', 'G4HCAM952479', 'MALAB51GAAM507227', 'AMARILLO', '0000-00-00', 'TA', '16225806', 1, 0, '', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1000', ''),
('093', 'VLG-562', 2004, 'AUTOMOVIL', 1, 'ATOS', 'SEDAN', 'G4HC3C05197', 'MALAB51GP4M327600', 'AMARILLO', '0000-00-00', 'TA', '29382553', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('094', 'STH-333', 2017, 'AUTOMOVIL', 6, 'PICANTO', 'HATCH-BACK', 'G4LAGP098366', 'KNABE512AHT386376', 'AMARILLO', '0000-00-00', 'TA', '10965799', 1, 0, '10199261', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1248', ''),
('095', 'VLH-117', 2006, 'AUTOMOVIL', 1, 'ATOS', 'HATCH-BACK', 'G4HC6M766112', 'MALAB51GP6M808673', 'AMARILLO', '0000-00-00', 'TA', '16230896', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('097', 'STH-389', 2020, 'AUTOMOVIL', 6, 'SEPHIA', 'SEDAN', 'G4HC4E96565', 'LJD0AA29AL0080834', 'AMARILLO', '0000-00-00', 'TA', '1112771980', 1, 0, '1076350546', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1368', ''),
('098', 'STH-051', 2011, 'AUTOMOVIL', 6, 'EKOTAXI', 'HATCH-BACK', 'G4HCA858608', 'KNABJ513ABT130673', 'AMARILLO', '0000-00-00', 'TA', '6360224', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1100', ''),
('107', 'VLH-472', 2009, 'AUTOMOVIL', 1, 'ATOS', 'HATCH-BACK', 'G4HC8M476138', 'MALAB51GP9M309234', 'AMARILLO', '0000-00-00', 'TA', '16212192', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('110', 'STH-222', 2014, 'AUTOMOVIL', 6, 'EKOTAXI', 'HATCH-BACK', 'G4LADP119091', 'KNABE512AET692674', 'AMARILLO', '0000-00-00', 'TA', '31434132', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1248', ''),
('111', 'VLG-610', 2004, 'AUTOMOVIL', 1, 'ATOS', 'SEDAN', 'G4HC3742370', 'KMHAG51GP4U350084', 'AMARILLO', '0000-00-00', 'TA', '29373198', 1, 0, '16202471', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('120', 'VLG-734', 2005, 'AUTOMOVIL', 1, 'ATOS', 'SEDAN', 'G4HC4D88387', 'MALAB51GP5M503924', 'AMARILLO', '0000-00-00', 'TA', '16221130', 1, 0, '31411798', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1000', ''),
('121', 'VLG-684', 2005, 'AUTOMOVIL', 1, 'ATOS', 'SEDAN', 'G4HC4D51235', 'MALAB51GP5M472729', 'AMARILLO', '0000-00-00', 'TA', '2470678', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1000', ''),
('123', 'STH-176', 2014, 'AUTOMOVIL', 1, '1-10 GL', 'HATCH-BACK', 'G4HGDM683715', 'MALAM51BAEM434303', 'AMARILLO', '0000-00-00', 'TA', '10024123', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1086', ''),
('125', 'VLH-069', 2006, 'AUTOMOVIL', 1, 'ATOS', 'HATCH-BACK', 'G4HC5M68092', 'MALAB51GP6M477588', 'AMARILLO', '0000-00-00', 'TA', '25209689', 1, 0, '6526358', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('131', 'STH-084', 2012, 'AUTOMOVIL', 1, 'ATOS', 'HATCH-BACK', 'G4HCGBM392025', 'MALAB51HACM726520', 'AMARILLO', '0000-00-00', 'TA', '31419038', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1086', ''),
('134', 'VLH-078', 2006, 'AUTOMOVIL', 1, 'ATOS', 'HATCH-BACK', 'G4HC5M719183', 'MALAB51GP6M772771', 'AMARILLO', '0000-00-00', 'TA', '29175668', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('138', 'STH-327', 2017, 'AUTOMOVIL', 3, 'CHEVRITAXY', 'HATCH-BACK', 'LU*162013802*', '9GASA68M8HB028283', 'AMARILLO', '0000-00-00', 'TA', '16205524', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1399', ''),
('140', 'STH-087', 2012, 'AUTOMOVIL', 1, 'ATOS', 'HATCH-BACK', 'G4HGBM420803', 'MALAB51HACM737492', 'AMARILLO', '0000-00-00', 'TA', '16210194', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1086', ''),
('141', 'STH-243', 2015, 'AUTOMOVIL', 6, 'PICANTO', 'HATCH-BACK', 'G4LAEP052149', 'KNABE512AFT827600', 'AMARILLO', '0000-00-00', 'TA', '16220347', 1, 0, '', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1248', ''),
('144', 'STH-192', 2014, 'AUTOMOVIL', 6, 'PICANTO', 'HATCH-BACK', 'G4LADP078284', 'KNABE512AET615393', 'AMARILLO', '0000-00-00', 'TA', '16211512', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1248', ''),
('145', 'STH-320', 2017, 'AUTOMOVIL', 6, 'PICANTO', 'HATCH-BACK', 'G4LAFP150250', 'KNABE512AHT260527', 'AMARILLO', '0000-00-00', 'TA', '42135061', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1248', ''),
('146', 'STH-371', 2019, 'AUTOMOVIL', 6, 'PICANTO', 'HATCH-BACK', 'G4LAFP150250', 'KNABE512AHT260527', 'AMARILLO', '0000-00-00', 'TA', '42135061', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1248', ''),
('147', 'VLG-827', 2005, 'AUTOMOVIL', 1, 'ATOS', 'SEDAN', 'G4HC4E56822', 'MALAB51GP5M565334', 'AMARILLO', '0000-00-00', 'TA', '1378409', 1, 0, '2471221', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('149', 'STH-178', 2014, 'AUTOMOVIL', 1, 'I10', 'HATCH-BACK', 'G4HDM658180', 'MALAM51BAEM399079', 'AMARILLO', '0000-00-00', 'TA', '31396716', 1, 0, '10062589', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1086', ''),
('150', 'STH-299', 2016, 'AUTOMOVIL', 6, 'PICANTO', 'HATCH-BACK', 'G4LAFP0826667', 'KNAB512AGT126817', 'AMARILLO', '0000-00-00', 'TA', '18506967', 1, 0, '', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1248', ''),
('152', 'STH-007', 2011, 'AUTOMOVIL', 1, 'ATOS', 'HATCH-BACK', 'G4HCAM093171', 'MALAB51GAB576003', 'AMARILLO', '0000-00-00', 'TA', '31422330', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1000', ''),
('156', 'VLH-226', 2007, 'AUTOMOVIL', 1, 'ATOS', 'SEDAN', 'G4HC6M877170', 'MALAB51GP7M904215', 'AMARILLO', '0000-00-00', 'TA', '29605550', 1, 0, '10483745', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('158', 'STH386', 2020, 'AUTOMOVIL', 1, 'GRAND I10', 'HATCH-BACK', 'G4LAKM255664', 'MALA751CALM013401', 'AMARILLO', '0000-00-00', 'TA', '6133632', 1, 0, '97610895', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1248', ''),
('159', 'VLG-573', 2004, 'AUTOMOVIL', 1, 'ATOS', 'SEDAN', 'G4HC3C05850', 'MALAB51GP4M327532', 'AMARILLO', '0000-00-00', 'TA', '42145266', 1, 0, '16400250', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('160', 'VLH-431', 2008, 'AUTOMOVIL', 1, 'ATOS', 'HATCH-BACK', 'G4HC7M298369', 'MALAB51GP8M234760', 'AMARILLO', '0000-00-00', 'TA', '31402770', 1, 0, '', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('164', 'STH-244', 2014, 'AUTOMOVIL', 16, 'VIVACE', 'HATCH-BACK', '327A0B84114885', '9BD195354E0498877', 'AMARILLO', '0000-00-00', 'TA', '42062564', 1, 0, '10109451', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1368', ''),
('166', 'VLH-315', 2007, 'AUTOMOVIL', 1, 'ATOS', 'HATCH-BACK', 'G4HC6M007361', 'MALAB51GP7M007800', 'AMARILLO', '0000-00-00', 'TA', '29446983', 1, 0, '29458619', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('167', 'VLG-691', 2005, 'AUTOMOVIL', 1, 'ATOS', 'SEDAN', 'G4HC4D62569', 'MALAB51GP5M481948', 'AMARILLO', '0000-00-00', 'TA', '31417040', 1, 0, '16218015', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('169', 'VLH-528', 2010, 'AUTOMOVIL', 6, 'EKOTAXI', 'HATCH-BACK', 'G4HG9P000074', 'KNABJ513AAT794820', 'AMARILLO', '0000-00-00', 'TA', '1112790897', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1100', ''),
('170', 'VLG-404', 2002, 'AUTOMOVIL', 1, 'ATOS', 'STAT-WAGON', 'G4HC1508339', 'KMHAB51GP2U276173', 'AMARILLO', '0000-00-00', 'TA', '31405540', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1000', ''),
('175', 'VLH-294', 2007, 'AUTOMOVIL', 1, 'ATOS', 'SEDAN', 'G4HC6M929769', 'MALAB51GP7M945390', 'AMARILLO', '0000-00-00', 'TA', '16401388', 1, 0, '6479488', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('176', 'STH-207', 2014, 'AUTOMOVIL', 6, 'PICANTO', 'HATCH-BACK', 'G4LADP118598', 'KNABE512AET692795', 'AMARILLO', '0000-00-00', 'TA', '1114787481', 1, 0, '94263039', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1248', ''),
('177', 'STH-289', 2016, 'AUTOMOVIL', 6, 'PICANTO', 'HATCH-BACK', 'G4LAFP061916', 'KNABE512AGT087183', 'AMARILLO', '0000-00-00', 'TA', '1112791847', 1, 0, '31408138', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1248', ''),
('180', 'STH-126', 2013, 'AUTOMOVIL', 1, 'PLUS I10', 'HATCH-BACK', 'G4HGCM490351', 'MALAM51BADM164021', 'AMARILLO', '0000-00-00', 'TA', '6281111', 1, 0, '16224713', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1086', ''),
('181', 'STH-267', 2015, 'AUTOMOVIL', 6, 'PICANTO', 'HATCH-BACK', 'G3LAEP095376', 'KNABE511AFT890358', 'AMARILLO', '0000-00-00', 'TA', '29464652', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('182', 'VLG-707', 2005, 'AUTOMOVIL', 1, 'ATOS', 'SEDAN', 'G4HC4D65066', 'MALAB51GP5M483951', 'AMARILLO', '0000-00-00', 'TA', '31421356', 1, 0, '16206744', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1000', ''),
('183', 'STH-132', 2013, 'AUTOMOVIL', 1, 'PLUS I10', 'HATCH-BACK', 'G4HGCM493243', 'MALAM51BADM166303', 'AMARILLO', '0000-00-00', 'TA', '16231511', 1, 0, '', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1086', ''),
('185', 'STH-340', 2017, 'AUTOMOVIL', 1, 'GRAN I 10', 'HATCH-BACK', 'G4LAFM900253', 'MALAB51CAMM396714', 'AMARILLO', '0000-00-00', 'TA', '31397853', 1, 0, '16206135', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1248', ''),
('186', 'STH-337', 2017, 'AUTOMOVIL', 6, 'PICANTO', 'HATCH-BACK', 'G4LAGP102122', 'KNABE512AHT393043', 'AMARILLO', '0000-00-00', 'TA', '31407622', 1, 0, '16222936', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1248', ''),
('187', 'VLH-348', 2008, 'AUTOMOVIL', 1, 'ATOS', 'HATCH-BACK', 'G4HC7M089427', 'MALAB51GP8M074376', 'AMARILLO', '0000-00-00', 'TA', '16232064', 1, 0, '16228835', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('189', 'STH-212', 2014, 'AUTOMOVIL', 6, 'PICANTO', 'HATCH-BACK', 'G4LADP118256', 'KNABE512AET693218', 'AMARILLO', '0000-00-00', 'TA', '51833348', 1, 0, '31429437', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1248', ''),
('192', 'STH-277', 2015, 'AUTOMOVIL', 6, 'PICANTO', 'HATCH-BACK', 'G4LAEP147182', 'KNABE512AFT980859', 'AMARILLO', '0000-00-00', 'TA', '31434165', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1248', ''),
('193', 'STH-162', 2014, 'AUTOMOVIL', 1, '1-10 GL', 'HATCH-BACK', 'G4HGDM657944', 'MALAM51BAEM399147', 'AMARILLO', '0000-00-00', 'TA', '1004716926', 1, 0, '10119427', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1086', ''),
('196', 'STH-362', 2019, 'AUTOMOVIL', 6, 'PICANTO', 'HATCH-BACK', 'G3LAJD174024', 'KNAB2511AKT381156', 'AMARILLO', '0000-00-00', 'TA', '16488366', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '998', ''),
('197', 'STH-092', 2012, 'AUTOMOVIL', 1, 'ATOS', 'HATCH-BACK', 'G4HGBM389670', 'MALAM51BACM054694', 'AMARILLO', '0000-00-00', 'TA', '31419038', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1086', ''),
('198', 'VLH-257', 2007, 'AUTOMOVIL', 1, 'ATOS', 'HATCH-BACK', 'G4HC6M903481', 'MALAB51GP7M923795', 'AMARILLO', '0000-00-00', 'TA', '16231596', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('199', 'STH-387', 2020, 'AUTOMOVIL', 1, 'GRAND I10', 'HATCH-BACK', 'G4LAKM256458', 'MALA751CALM013469', 'AMARILLO', '0000-00-00', 'TA', '25171123', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1248', ''),
('200', 'STH-245', 2014, 'AUTOMOVIL', 1, 'PLUS I10', 'HATCH-BACK', 'G4HGDM759523', 'MALAM51BAEM523743', 'AMARILLO', '0000-00-00', 'TA', '29900401', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1086', ''),
('201', 'VLG-705', 2005, 'AUTOMOVIL', 1, 'ATOS', 'SEDAN', 'G4HC4D65184', 'MALAB51GP5M483946', 'AMARILLO', '0000-00-00', 'TA', '16223205', 1, 0, '', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('202', 'STH-151', 2013, 'AUTOMOVIL', 1, 'PLUS I10', 'HATCH-BACK', 'G4HGCM570664', 'MALAM51BADM270664', 'AMARILLO', '0000-00-00', 'TA', '31403151', 1, 0, '16212192', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1086', ''),
('203', 'STH-300', 2016, 'AUTOMOVIL', 6, 'PICANTO', 'HATCH-BACK', 'G4LAFP091389', 'KNABE512AGT140334', 'AMARILLO', '0000-00-00', 'TA', '16232064', 1, 0, '16228835', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1248', ''),
('206', 'STH-376', 2019, 'AUTOMOVIL', 1, 'GRAND I10', 'HATCH-BACK', 'G4LAKM217796', 'MALA751CAKM985672', 'AMARILLO', '0000-00-00', 'TA', '4356562', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1248', ''),
('209', 'VLH-138', 2007, 'AUTOMOVIL', 1, 'ATOS', 'HATCH-BACK', 'G4HC6M807854', 'MALAB51GP7M844936', 'AMARILLO', '0000-00-00', 'TA', '31429762', 1, 0, '14566202', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('210', 'VLH-152', 2007, 'AUTOMOVIL', 1, 'ATOS', 'HATCH-BACK', 'G4HC6M829714', 'MALAB51GP7M863064', 'AMARILLO', '0000-00-00', 'TA', '6280484', 1, 0, '', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('211', 'STH-255', 2015, 'AUTOMOVIL', 1, 'PLUS I10', 'HATCH-BACK', 'G4HEGM799825', 'MALAM51BAFM556851', 'AMARILLO', '0000-00-00', 'TA', '42089563', 1, 0, '16224017', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1086', ''),
('212', 'VLH-055', 2006, 'AUTOMOVIL', 1, 'ATOS', 'HATCH-BACK', 'G4HC5M685246', 'MALAB51GP6M746449', 'AMARILLO', '0000-00-00', 'TA', '2459893', 1, 0, '', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('213', 'STH-194', 2014, 'AUTOMOVIL', 6, 'PICANTO', 'HATCH-BACK', 'G4LADP090669', 'KNABE512AET641678', 'AMARILLO', '0000-00-00', 'TA', '2470835', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1248', ''),
('214', 'VLG-846', 2005, 'AUTOMOVIL', 1, 'ATOS', 'SEDAN', 'G4HC5E96631', 'MALAB51GP5M99155', 'AMARILLO', '0000-00-00', 'TA', '6241428', 1, 0, '', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('215', 'VLH-282', 2007, 'AUTOMOVIL', 1, 'ATOS', 'HATCH-BACK', 'G4HC6M929172', 'MALAB51GP7M944478', 'AMARILLO', '0000-00-00', 'TA', '16210920', 1, 0, '', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('219', 'VLG-788', 2005, 'AUTOMOVIL', 1, 'ATOS', 'SEDAN', 'G4HC4E44943', 'MALAB51GP5MM554572', 'AMARILLO', '0000-00-00', 'TA', '16207059', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('223', 'VLH-309', 2007, 'AUTOMOVIL', 1, 'ATOS', 'HATCH-BACK', 'G4HC6M958272', 'MALAB51GP7M969501', 'AMARILLO', '0000-00-00', 'TA', '4379502', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1000', ''),
('231', 'VLG-587', 2004, 'AUTOMOVIL', 1, 'ATOS', 'SEDAN', 'G4HC3C06113', 'MALAB51GP4M328131', 'AMARILLO', '0000-00-00', 'TA', '16226268', 1, 0, '', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('232', 'VLG-679', 2005, 'AUTOMOVIL', 1, 'ATOS', 'SEDAN', 'G4HC4D46155', 'MALAB51GP5M465578', 'AMARILLO', '0000-00-00', 'TA', '16232064', 1, 0, '16228835', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('233', 'VLH-132', 2007, 'AUTOMOVIL', 1, 'ATOS', 'HATCH-BACK', 'G4HC6M807838', 'MALAB51GP7M844906', 'AMARILLO', '0000-00-00', 'TA', '31424513', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('234', 'VLH-508', 2009, 'AUTOMOVIL', 1, 'ATOS', 'HATCH-BACK', 'G4H8M663748', 'MALB51GP9M382465', 'AMARILLO', '0000-00-00', 'TA', '4859312', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('241', 'VLH-129', 2007, 'AUTOMOVIL', 3, 'SPARK', 'HATCH-BACK', 'B10S1507817KA2', '9GAMM61027B001859', 'AMARILLO', '0000-00-00', 'TA', '16215577', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1000', ''),
('245', 'STH-283', 2015, 'AUTOMOVIL', 6, 'PICANTO', 'HATCH-BACK', 'G4ALEP145849', 'KNABE512AFT978511', 'AMARILLO', '0000-00-00', 'TA', '16230260', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1248', ''),
('246', 'STH-228', 2014, 'AUTOMOVIL', 1, 'PLUS I10', 'HATCH-BACK', 'G4HGDM737650', 'MALAM51B1EM502585', 'AMARILLO', '0000-00-00', 'TA', '31396716', 1, 0, '10062589', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1086', ''),
('249', 'STH-385', 2020, 'AUTOMOVIL', 1, 'GRAND I10', 'HATCH-BACK', 'G4LAKM256040', 'MALA751CALM013393', 'AMARILLO', '0000-00-00', 'TA', '31413616', 1, 0, '97610895', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1248', ''),
('250', 'VLH-160', 2007, 'AUTOMOVIL', 3, 'SPARK', 'SEDAN', 'B10S1542343KA2', '9GAMM61027B002722', 'AMARILLO', '0000-00-00', 'TA', '16209711', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1000', ''),
('251', 'STH-332', 2017, 'AUTOMOVIL', 6, 'PICANTO', 'HATCH-BACK', 'G4LAGP095958', 'KNABE512AHT385545', 'AMARILLO', '0000-00-00', 'TA', '1004004995', 1, 0, '', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1248', ''),
('259', 'VLH-039', 2006, 'AUTOMOVIL', 1, 'ATOS', 'HATCH-BACK', 'G4HC5M680000', 'MALAB51GP6M74254', 'AMARILLO', '0000-00-00', 'TA', '16223205', 1, 0, '', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('260', 'VLH-362', 2008, 'AUTOMOVIL', 1, 'ATOS', 'HATCH-BACK', 'G4HC7M114187', 'MALAB51GP8M095575', 'AMARILLO', '0000-00-00', 'TA', '16208949', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('261', 'VLG-609', 2004, 'AUTOMOVIL', 1, 'ATOS', 'SEDAN', 'G4HC3750009', 'KMHAG51GP4U352268', 'AMARILLO', '0000-00-00', 'TA', '1112781014', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('262', 'STH-354', 2019, 'AUTOMOVIL', 6, 'EKOTAXI', 'HATCH-BACK', 'G4LAJP020743', 'KNAB2512AKT251020', 'AMARILLO', '0000-00-00', 'TA', '1113593318', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1248', ''),
('265', 'STH-291', 2016, 'AUTOMOVIL', 6, 'PICANTO', 'HATCH-BACK', 'G4LAFP061917', 'KNABE512AGT087191', 'AMARILLO', '0000-00-00', 'TA', '16221636', 1, 0, '', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1248', ''),
('266', 'STH-181', 2014, 'AUTOMOVIL', 1, 'PLUS I10', 'HATCH-BACK', 'G4HGDM684109', 'MALAM51BAEM434281', 'AMARILLO', '0000-00-00', 'TA', '9698083', 1, 0, '', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1086', ''),
('268', 'STH-374', 2020, 'AUTOMOVIL', 6, 'PICANTO', 'HATCH-BACK', 'G4LAKP040496', 'KNAB2512ALT507319', 'AMARILLO', '0000-00-00', 'TA', '16214118', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1248', ''),
('273', 'VLH-218', 2007, 'AUTOMOVIL', 1, 'ATOS SANTRO', 'SEDAN', 'G4HG6M852369', 'MALAB51HP7M882597', 'AMARILLO', '0000-00-00', 'TA', '16222721', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('275', 'VLG-668', 2005, 'AUTOMOVIL', 1, 'ATOS', 'SEDAN', 'G4HC4D38647', 'MALAB51GP5M460034', 'AMARILLO', '0000-00-00', 'TA', '2473687', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('276', 'VLH-059', 2006, 'AUTOMOVIL', 1, 'ATOS', 'HATCH-BACK', 'G4HC5M6885243', 'MALAB51GP6M746432', 'AMARILLO', '0000-00-00', 'TA', '29605550', 1, 0, '10483745', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('277', 'VLG-624', 2004, 'AUTOMOVIL', 1, 'ATOS', 'SEDAN', 'G4HC3750898', 'KMHAG51GP44352502', 'AMARILLO', '0000-00-00', 'TA', '1112769579', 1, 0, '52797785', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('279', 'VLH-195', 2007, 'AUTOMOVIL', 1, 'ATOS', 'HATCH-BACK', 'G4HC6M851846', 'MALAB51HP7M882483', 'AMARILLO', '0000-00-00', 'TA', '16230634', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('281', 'STH-078', 2012, 'AUTOMOVIL', 1, 'ATOS', 'HATCH-BACK', 'G4HGBM391004', 'MALAB51HACM725981', 'AMARILLO', '0000-00-00', 'TA', '2472836', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1086', ''),
('284', 'STH-317', 2016, 'AUTOMOVIL', 3, 'CHEVITAXY', 'SEDAN', 'DXB000316', '9GAJA6914GB041286', 'AMARILLO', '0000-00-00', 'TA', '6360986', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1796', ''),
('285', 'STH-380', 2020, 'AUTOMOVIL', 6, 'PICANTO', 'HATCH-BACK', 'G4LAKP053439', 'KNAB2512ALT530590', 'AMARILLO', '0000-00-00', 'TA', '2470835', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1248', ''),
('289', 'STH-359', 2019, 'AUTOMOVIL', 1, 'GRAND I10', 'SEDAN', 'G4LAJM859033', 'MALA741CAKM317026', 'AMARILLO', '0000-00-00', 'TA', '713177877', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1248', ''),
('290', 'VLG-874', 2006, 'AUTOMOVIL', 1, 'ATOS', 'SEDAN', 'G4HC5M512088', 'MALAB51GP6M611915', 'AMARILLO', '0000-00-00', 'TA', '80362734', 1, 0, '', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1000', ''),
('294', 'STH-155', 2014, 'AUTOMOVIL', 13, 'ALTO-K10', 'HATCH-BACK', 'K10BN4494950', 'MA3FB41S6E0432883', 'AMARILLO', '0000-00-00', 'TA', '14570529', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('295', 'VLH-080', 2006, 'AUTOMOVIL', 1, 'ATOS', 'HATCH-BACK', 'G4HC5M719755', 'MALAB51GP6M772785', 'AMARILLO', '0000-00-00', 'TA', '31408266', 1, 0, '', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('296', 'STH-127', 2013, 'AUTOMOVIL', 1, 'PLUS I10', 'HATCH-BACK', 'G4HGCM489968', 'MALAM51BADM163213', 'AMARILLO', '0000-00-00', 'TA', '10062589', 1, 0, '', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1086', ''),
('298', 'VLG-733', 2005, 'AUTOMOVIL', 1, 'ATOS', 'SEDAN', 'G4HC4D87783', 'MALAB51G95M503923', 'AMARILLO', '0000-00-00', 'TA', '31436851', 1, 0, '31410008', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1000', ''),
('299', 'STH-302', 2016, 'AUTOMOVIL', 6, 'PICANTO', 'HATCH-BACK', 'G4LAFP090737', 'KNABE512AGT140653', 'AMARILLO', '0000-00-00', 'TA', '31431367', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1248', ''),
('304', 'STH-240', 2015, 'AUTOMOVIL', 6, 'PICANTO ', 'HATCH-BACK', 'G4LAEP055856', 'KNABE512AFT828213', 'AMARILLO', '0000-00-00', 'TA', '14572552', 1, 0, '82270089', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1248', ''),
('308', 'VLG-898', 2006, 'AUTOMOVIL', 1, 'ATOS', 'SEDAN', 'G4HC5M531281', 'MALAB51GPM624576', 'AMARILLO', '0000-00-00', 'TA', '16210988', 1, 0, '', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('309', 'STH-239', 2014, 'AUTOMOVIL', 1, 'PLUS I10', 'HATCH-BACK', 'G4HGDM759485', 'MALAM51BAEM523746', 'AMARILLO', '0000-00-00', 'TA', '25171123', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1086', ''),
('315', 'STH-235', 2015, 'AUTOMOVIL', 1, 'I-10 GL', 'HATCH-BACK', 'G4HGDM769489', 'MALAM51BAFM533683', 'AMARILLO', '0000-00-00', 'TA', '16400465', 1, 0, '', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1086', ''),
('325', 'VLG-886', 2006, 'AUTOMOVIL', 1, 'ATOS', 'SEDAN', 'G4HC5M527944', 'MALAB51GP6M622018', 'AMARILLO', '0000-00-00', 'TA', '16207433', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1000', ''),
('326', 'STH-394', 2020, 'AUTOMOVIL', 6, 'PICANTO', 'HATCH-BACK', 'G4LAKP102062', 'KNAB2512ALT610830', 'AMARILLO', '0000-00-00', 'TA', '16218015', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1248', ''),
('330', 'STH-198', 2014, 'AUTOMOVIL', 6, 'PICANTO', 'HATCH-BACK', 'G4LADP090676', 'KNABE512AET641675', 'AMARILLO', '0000-00-00', 'TA', '80231626', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1248', ''),
('332', 'VLG-833', 2005, 'AUTOMOVIL', 1, 'ATOS', 'SEDAN', 'G4HC4E77084', 'MALAB51GP5M582188', 'AMARILLO', '0000-00-00', 'TA', '6482219', 1, 0, '1112773446', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('333', 'VLH-048', 2006, 'AUTOMOVIL', 1, 'ATOS', 'HATCH-BACK', 'G4HC5M684546', 'MALAB51GP6M745886', 'AMARILLO', '0000-00-00', 'TA', '16200578', 1, 0, '', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('338', 'STH-000', 2011, 'AUTOMOVIL', 1, 'ATOS', 'HATCH-BACK', 'G4HCAM019217', 'MALAB51GABM539210', 'AMARILLO', '0000-00-00', 'TA', '31418945', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1000', ''),
('342', 'VLG-579', 2004, 'AUTOMOVIL', 1, 'ATOS', 'STAT-WAGON', 'G4HC3741565', 'KMHAG51GP4U349723', 'AMARILLO', '0000-00-00', 'TA', '9534204', 1, 0, '', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1000', ''),
('346', 'STH-175', 2014, 'AUTOMOVIL', 6, 'EKOTAXI', 'HATCH-BACK', 'G4LADP065364', 'KNABE512AET595559', 'AMARILLO', '0000-00-00', 'TA', '29462213', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1248', ''),
('349', 'STH-201', 2014, 'AUTOMOVIL', 1, 'PLUS I10', 'HATCH-BACK', 'G4HGDM683258', 'MALAM51BAEM423977', 'AMARILLO', '0000-00-00', 'TA', '10110394', 1, 0, '6481115', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1086', ''),
('353', 'STH-370', 2019, 'AUTOMOVIL', 6, 'PICANTO', 'HATCH-BACK', 'G4LAJP128469', 'KNAB2512AKT430692', 'AMARILLO', '0000-00-00', 'TA', '31433584', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1248', ''),
('354', 'VLG-620', 2004, 'AUTOMOVIL', 1, 'ATOS', 'SEDAN', 'G4HC3749113', 'KMHAG51GP4U352079', 'AMARILLO', '0000-00-00', 'TA', '1112785236', 1, 0, '', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('356', 'VLG-681', 2005, 'AUTOMOVIL', 1, 'ATOS', 'SEDAN', 'G4HC4D46446', 'MALAB51GP5M466961', 'AMARILLO', '0000-00-00', 'TA', '31403151', 1, 0, '16212192', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('357', 'STH-135', 2013, 'AUTOMOVIL', 1, 'PLUS I10', 'HATCH-BACK', 'G4HGCM490775', 'MALAM51BADM164165', 'AMARILLO', '0000-00-00', 'TA', '14569711', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1086', ''),
('359', 'VLH-068', 2006, 'AUTOMOVIL', 1, 'ATOS', 'HATCH-BACK', 'G4HC5M686095', 'MALAB51GP6M747582', 'AMARILLO', '0000-00-00', 'TA', '29779461', 1, 0, '31424513', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('360', 'STH-363', 2019, 'AUTOMOVIL', 1, 'GRAND I10', 'HATCH-BACK', 'G4LAJM997465', 'MALA751CAKM894060', 'AMARILLO', '0000-00-00', 'TA', '1112790244', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1248', ''),
('363', 'VLG-912', 2006, 'AUTOMOVIL', 1, 'ATOS', 'HATCH-BACK', 'G4HC5M554153', 'MALAB51GP6M643278', 'AMARILLO', '0000-00-00', 'TA', '7532119', 1, 0, '', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('364', 'VLG-764', 2005, 'AUTOMOVIL', 1, 'ATOS', 'SEDAN', 'G4HC4E0834', 'MALAB51G95M521803', 'AMARILLO', '0000-00-00', 'TA', '31432656', 1, 0, '16202691', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('367', 'STI-237', 2011, 'AUTOMOVIL', 3, 'SPARCK', 'HATCH-BACK', 'B10S1547500KC2', '9GAMM6104BB011480', 'AMARILLO', '0000-00-00', 'TA', '75035177', 1, 0, '', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('368', 'STH-384', 2020, 'AUTOMOVIL', 6, 'PICANTO', 'HATCH-BACK', 'G4LAKP053443', 'KNAB2512ALT5360595', 'AMARILLO', '0000-00-00', 'TA', '1112771617', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1248', ''),
('370', 'VLH-271', 2007, 'AUTOMOVIL', 1, 'ATOS', 'HATCH-BACK', 'G4HC6M927610', 'MALAB51GP7M943447', 'AMARILLO', '0000-00-00', 'TA', '31429908', 1, 0, '16230730', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('378', 'VLH-094', 2006, 'AUTOMOVIL', 1, 'ATOS', 'HATCH-BACK', 'G4HC5M720148', 'MALA51GP6M772892', 'AMARILLO', '0000-00-00', 'TA', '1112788536', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('383', 'STI-767', 2011, 'AUTOMOVIL', 3, 'SPARCK', 'HATCH-BACK', 'B10S1511249KC2', '9GAMM6102BB002566', 'AMARILLO', '0000-00-00', 'TA', '14566740', 1, 0, '', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('386', 'STH-166', 2014, 'AUTOMOVIL', 6, 'PICANTO', 'HATCH-BACK', 'G3LADP066515', 'KNABE511AET574042', 'AMARILLO', '0000-00-00', 'TA', '2470070', 1, 0, '', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('389', 'STH-161', 2014, 'AUTOMOVIL', 6, 'PICANTO', 'HATCH-BACK', 'G3LADP044195', 'KNABE511AET541437', 'AMARILLO', '0000-00-00', 'TA', '9956350', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('392', 'VLG-659', 2005, 'AUTOMOVIL', 1, 'ATOS', 'SEDAN', 'G4HC4D37891', 'MALAB51GP5M457666', 'AMARILLO', '0000-00-00', 'TA', '16780112', 1, 0, '', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1000', ''),
('394', 'STH-120', 2013, 'AUTOMOVIL', 1, 'I-10 GL', 'HATCH-BACK', 'G4HGCM451785', 'MALAM51BADM118049', 'AMARILLO', '0000-00-00', 'TA', '42090788', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1086', ''),
('396', 'VLG-727', 2005, 'AUTOMOVIL', 1, 'ATOS', 'SEDAN', 'G4HC4D88465', 'MALAB51GPM503919', 'AMARILLO', '0000-00-00', 'TA', '6280938', 1, 0, '', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('397', 'STH-308', 2016, 'AUTOMOVIL', 6, 'PICANTO', 'HATCH-BACK', 'G4LAFP127590', 'KNABE512AGT195475', 'AMARILLO', '0000-00-00', 'TA', '94225292', 1, 0, '16400465', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1248', ''),
('398', 'VLH-538', 2010, 'AUTOMOVIL', 1, 'ATOS', 'HATCH-BACK', 'G4HC9M909763', 'MALAB51GAAM487083', 'AMARILLO', '0000-00-00', 'TA', '31436851', 1, 0, '31410008', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('400', 'STH-232', 2014, 'AUTOMOVIL', 6, 'PICANTO', 'HATCH-BACK', 'G4LADP123968', 'KNABE512AET699148', 'AMARILLO', '0000-00-00', 'TA', '16231085', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1248', ''),
('402', 'STH-213', 2014, 'AUTOMOVIL', 6, 'PICANTO ', 'HATCH-BACK', 'G4LADP118239', 'KNABE512AET693220', 'AMARILLO', '0000-00-00', 'TA', '14569348', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1248', ''),
('403', 'STH-293', 2016, 'AUTOMOVIL', 6, 'PICANTO', 'HATCH-BACK', 'G4LAFP027345', 'KNABE512AGT038962', 'AMARILLO', '0000-00-00', 'TA', '31400330', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1248', ''),
('408', 'VLG-811', 2005, 'AUTOMOVIL', 1, 'ATOS', 'SEDAN', 'G4HC4E45078', 'MALAB51GP5M554573', 'AMARILLO', '0000-00-00', 'TA', '31420615', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('409', 'VLH-063', 2006, 'AUTOMOVIL', 1, 'ATOS', 'HATCH-BACK', 'G4HC5M684956', 'MALAB51GP6M746441', 'AMARILLO', '0000-00-00', 'TA', '6133632', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('413', 'VLG-765', 2005, 'AUTOMOVIL', 1, 'ATOS', 'SEDAN', 'G4HC4E41514', 'MALAB51GP5M551957', 'AMARILLO', '0000-00-00', 'TA', '31427747', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('418', 'VLG-974', 2006, 'AUTOMOVIL', 1, 'ATOS', 'SEDAN', 'G4HC5M607372', 'MALAB51GP6M699401', 'AMARILLO', '0000-00-00', 'TA', '16228613', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('419', 'VLH-463', 2009, 'AUTOMOVIL', 3, 'SPARCK', 'SEDAN', 'B10S1081200KB2', '9GAMM61029B019233', 'AMARILLO', '0000-00-00', 'TA', '2474352', 1, 0, '', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1000', ''),
('421', 'STH-052', 2012, 'AUTOMOVIL', 1, 'ATOS', 'HATCH-BACK', 'G4HCBM229979', 'MALAB51GACM647550', 'AMARILLO', '0000-00-00', 'TA', '94368995', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1000', ''),
('422', 'STH-254', 2015, 'AUTOMOVIL', 6, 'PICANTO', 'HATCH-BACK', 'G4LAEP020520', 'KNABE511AFT766655', 'AMARILLO', '0000-00-00', 'TA', '6361044', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('424', 'VLH-310', 2007, 'AUTOMOVIL', 1, 'ATOS', 'HATCH-BACK', 'G4HC6M957135', 'MALAB51GP7M968996', 'AMARILLO', '0000-00-00', 'TA', '82290041', 1, 0, '', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('425', 'VLH-485', 2009, 'AUTOMOVIL', 1, 'ATOS', 'HATCH-BACK', 'G4HC8M449618', 'MALAB51GP9M298816', 'AMARILLO', '0000-00-00', 'TA', '31416166', 1, 0, '', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('426', 'VLG-682', 2005, 'AUTOMOVIL', 1, 'ATOS', 'SEDAN', 'G4HCAD37873', 'MALAB51GP5M457663', 'AMARILLO', '0000-00-00', 'TA', '29951224', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('427', 'VLH-413', 2008, 'AUTOMOVIL', 1, 'ATOS', 'SEDAN', 'G4HC7M242799', 'MALAB51GP8M193785', 'AMARILLO', '0000-00-00', 'TA', '6271507', 1, 0, '31414341', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('428', 'STH-105', 2013, 'AUTOMOVIL', 1, 'CITY PLUS', 'HATCH-BACK', 'G4HGCM453560', 'MALAM51BADM120042', 'AMARILLO', '0000-00-00', 'TA', '25171123', 1, 0, '', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1086', ''),
('430', 'VLH-345', 2007, 'AUTOMOVIL', 1, 'ATOS', 'HATCH-BACK', 'G4HC7M038141', 'MALAB51GP7M031217', 'AMARILLO', '0000-00-00', 'TA', '6526654', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('431', 'STH-118', 2013, 'AUTOMOVIL', 1, 'PLUS I10', 'HATCH-BACK', 'G4HGCM471213', 'MALAM51BADM143685', 'AMARILLO', '0000-00-00', 'TA', '31419056', 1, 0, '9534204', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1086', ''),
('436', 'STH-211', 2014, 'AUTOMOVIL', 6, 'PICANTO', 'HATCH-BACK', 'G4LADP108276', 'KNABE512AET674657', 'AMARILLO', '0000-00-00', 'TA', '31425573', 1, 0, '2474555', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1248', ''),
('438', 'STH-020', 2011, 'AUTOMOVIL', 1, 'ATOS', 'HATCH-BACK', 'G4HCAM094823', 'MALAB51GAB576829', 'AMARILLO', '0000-00-00', 'TA', '31418945', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1000', ''),
('443', 'VLH-285', 2007, 'AUTOMOVIL', 1, 'ATOS', 'HATCH-BACK', 'G4HC6M94863', 'MALAB51GP7M924646', 'AMARILLO', '0000-00-00', 'TA', '1031641210', 1, 0, '41931224', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('445', 'VLH-515', 2010, 'AUTOMOVIL', 3, '7:24S/a', 'SEDAN', 'B10S1233738KC2', '9GAMM6103AB172322', 'AMARILLO', '0000-00-00', 'TA', '80362734', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1000', ''),
('447', 'VLH-058', 2006, 'AUTOMOVIL', 1, 'ATOS', 'HATCH-BACK', 'G4HC5M687677', 'MALAB51GP6M747986', 'AMARILLO', '0000-00-00', 'TA', '16222497', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('449', 'VLH-507', 2009, 'AUTOMOVIL', 1, 'ATOS', 'HATCH-BACK', 'G4HC8M664195', 'MALAB51GP9M382356', 'AMARILLO', '0000-00-00', 'TA', '70810348', 1, 0, '31414341', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('451', 'STH-221', 2014, 'AUTOMOVIL', 1, 'I-10', 'HATCH-BACK', 'G4HGDM721565', 'MALAM51BAEM483682', 'AMARILLO', '0000-00-00', 'TA', '10062589', 1, 0, '', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1086', ''),
('452', 'VLH-417', 2008, 'AUTOMOVIL', 1, 'ATOS', 'SEDAN', 'G4HC7M243414', 'MALAB51GP8M194766', 'AMARILLO', '0000-00-00', 'TA', '31429184', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('454', 'STH-298', 2016, 'AUTOMOVIL', 6, 'PICANTO', 'HATCH-BACK', 'G4LAFP083459', 'KNAB512AGT126618', 'AMARILLO', '0000-00-00', 'TA', '93416076', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1248', ''),
('456', 'STH-206', 2014, 'AUTOMOVIL', 4, 'CLIO', 'HATCH-BACK', 'G728Q155307', '9FBBB8305EM896451', 'AMARILLO', '0000-00-00', 'TA', '14252134', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1149', ''),
('459', 'VLG-665', 2005, 'AUTOMOVIL', 1, 'ATOS', 'SEDAN', 'G4HC4D38832', 'MALAB51GP5M460029', 'AMARILLO', '0000-00-00', 'TA', '16228613', 1, 0, '', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('463', 'STH-290', 2016, 'AUTOMOVIL', 6, 'PICANTO', 'HATCH-BACK', 'G4LAFP061914', 'KNABE512AGT087189', 'AMARILLO', '0000-00-00', 'TA', '31411428', 1, 0, '9970267', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1248', ''),
('469', 'VLH-316', 2007, 'AUTOMOVIL', 1, 'ATOS', 'HATCH-BACK', 'G4HC6M958246', 'MALAB51GP7M969504', 'AMARILLO', '0000-00-00', 'TA', '16211594', 1, 0, '', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('470', 'STI-754', 2010, 'AUTOMOVIL', 1, 'ATOS', 'HATCH-BACK', 'G4HCAM952289', 'MALAB51GAAM507190', 'AMARILLO', '0000-00-00', 'TA', '16213658', 1, 0, '38580272', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1000', ''),
('472', 'VLG-639', 2004, 'AUTOMOVIL', 1, 'ATOS', 'SEDAN', 'G4HC3752693', 'KMHAG51GPAU353126', 'AMARILLO', '0000-00-00', 'TA', '2459893', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1000', ''),
('474', 'STH-341', 2015, 'AUTOMOVIL', 6, 'PICANTO', 'HATCH-BACK', 'G3LAEP093935', 'KNABE511AFT856631', 'AMARILLO', '0000-00-00', 'TA', '16231085', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1000', ''),
('477', 'VLH-347', 2007, 'AUTOMOVIL', 6, 'PICANTO', 'HATCH-BACK', 'G4HG6219980', 'KMABA24327T407172', 'AMARILLO', '0000-00-00', 'TA', '16213284', 1, 0, '', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1100', ''),
('479', 'VLH-297', 2007, 'AUTOMOVIL', 1, 'ATOS', 'HATCH-BACK', 'G4HC6M903957', 'MALAB51GP7M924618', 'AMARILLO', '0000-00-00', 'TA', '16213284', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('483', 'VLH-192', 2007, 'AUTOMOVIL', 1, 'ATOS', 'HATCH-BACK', 'G4HC6M877105', 'MALAB51GP7M904209', 'AMARILLO', '0000-00-00', 'TA', '16216170', 1, 0, '', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('485', 'STH-334', 2017, 'AUTOMOVIL', 6, 'PICANTO', 'HATCH-BACK', 'G4LAGP095978', 'KNABE512AHT385644', 'AMARILLO', '0000-00-00', 'TA', '42120266', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1248', ''),
('486', 'VLH-095', 2006, 'AUTOMOVIL', 1, 'ATOS', 'HATCH-BACK', 'G4HC5M698730', 'MALAB51GP6M756281', 'AMARILLO', '0000-00-00', 'TA', '10062589', 1, 0, '', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1100', ''),
('490', 'VLG-820', 2005, 'AUTOMOVIL', 1, 'ATOS', 'SEDAN', 'G4HC4E57771', 'MALAB51GP5M562042', 'AMARILLO', '0000-00-00', 'TA', '16215103', 1, 0, '', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('493', 'STH-257', 2015, 'AUTOMOVIL', 6, 'PICANTO ', 'HATCH-BACK', 'G3LAEP093970', 'KNABE511AFT856845', 'AMARILLO', '0000-00-00', 'TA', '66741997', 1, 0, '31415450', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('498', 'VLG-759', 2005, 'AUTOMOVIL', 1, 'ATOS', 'SEDAN', 'G4HC4E41498', 'MALAB51GP5M551951', 'AMARILLO', '0000-00-00', 'TA', '10069903', 1, 0, '', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('502', 'VLG-836', 2005, 'AUTOMOVIL', 1, 'ATOS', 'SEDAN', 'G4HC4E58103', 'MALAB51GP5M566241', 'AMARILLO', '0000-00-00', 'TA', '19144110', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('503', 'STH-368', 2020, 'AUTOMOVIL', 6, 'PICANTO', 'HATCH-BACK', 'G4LAKP19627', 'KNAB2512ALT473735', 'AMARILLO', '0000-00-00', 'TA', '31416166', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1248', ''),
('506', 'STH-005', 2011, 'AUTOMOVIL', 1, 'ATOS', 'HATCH-BACK', 'G4HCAM094160', 'MALA51GABM576648', 'AMARILLO', '0000-00-00', 'TA', '16226263', 1, 0, '', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1000', ''),
('508', 'STH-325', 2016, 'AUTOMOVIL', 3, 'CHEVITAXY', 'SEDAN', 'DXB000605', '9GAJA6915GB050353', 'AMARILLO', '0000-00-00', 'TA', '16231907', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1796', ''),
('509', 'VLH-511', 2009, 'AUTOMOVIL', 1, 'ATOS', 'HATCH-BACK', 'G4HC9M712380', 'MALAB51GP9M401323', 'AMARILLO', '0000-00-00', 'TA', '6244672', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('512', 'STH-268', 2015, 'AUTOMOVIL', 6, 'PICANTO', 'HATCH-BACK', 'G4LAEP148901', 'KNABE512AFT981755', 'AMARILLO', '0000-00-00', 'TA', '29382835', 1, 0, '', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1248', ''),
('514', 'STH-050', 2012, 'AUTOMOVIL', 1, 'ATOS', 'HATCH-BACK', 'G4HCBM229902', 'MALAB51GACM647529', 'AMARILLO', '0000-00-00', 'TA', '16208949', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1000', ''),
('517', 'VLH-498', 2009, 'AUTOMOVIL', 3, '724/SA', 'SEDAN', 'B10S1195932KC2', '9GAMM61079B164588', 'AMARILLO', '0000-00-00', 'TA', '10004633', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1000', ''),
('518', 'VLH-113', 2006, 'AUTOMOVIL', 1, 'ATOS', 'HATCH-BACK', 'G4HC6M777263', 'MALAB51GP6MB15913', 'AMARILLO', '0000-00-00', 'TA', '94351175', 1, 0, '', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('521', 'VLG-636', 2004, 'AUTOMOVIL', 1, 'ATOS', 'HATCH-BACK', 'G4HC3745964', 'KMHAG51GP4U351177', 'AMARILLO', '0000-00-00', 'TA', '75144891', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('526', 'STH-143', 2013, 'AUTOMOVIL', 6, 'RIO LS', 'SEDAN', 'A5D404689', '8LCDC2233DE031968', 'AMARILLO', '0000-00-00', 'TA', '1112775301', 1, 0, '', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1493', ''),
('527', 'STH-347', 2018, 'AUTOMOVIL', 1, 'GRAND I10', 'HATCH-BACK', 'G4LAHM549110', 'MALA751CAJM695528', 'AMARILLO', '0000-00-00', 'TA', '1113533829', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1248', ''),
('534', 'VLG-726', 2005, 'AUTOMOVIL', 1, 'ATOS', 'SEDAN', 'G4HC4D88728', 'MALAB51GP5M505766', 'AMARILLO', '0000-00-00', 'TA', '29643066', 1, 0, '16261919', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('535', 'STH-173', 2014, 'AUTOMOVIL', 1, 'PLUS I10', 'HATCH-BACK', 'G4HGDM683704', 'MALAM51BAEM434294', 'AMARILLO', '0000-00-00', 'TA', '4453645', 1, 0, '', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1086', ''),
('536', 'VLG-597', 2004, 'AUTOMOVIL', 1, 'ATOS', 'SEDAN', 'G4HC3B91629', 'MALAB51GP4M313528', 'AMARILLO', '0000-00-00', 'TA', '16222894', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('537', 'VLH-233', 2007, 'AUTOMOVIL', 1, 'ATOS', 'HATCH-BACK', 'G4HC6M875950', 'MALAB51GP7M904174', 'AMARILLO', '0000-00-00', 'TA', '16208265', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('540', 'VLH-040', 2006, 'AUTOMOVIL', 1, 'ATOS', 'SEDAN', 'G4HC5M680371', 'MALAB51GP6M742555', 'AMARILLO', '0000-00-00', 'TA', '25080137', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('541', 'STH-406', 2020, 'AUTOMOVIL', 1, 'GRAND', 'SEDAN', 'G4LAKM405863', 'MALA741CALM384789', 'AMARILLO', '0000-00-00', 'TA', '1059784970', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1248', ''),
('542', 'VLG-869', 2005, 'AUTOMOVIL', 1, 'ATOS', 'SEDAN', 'G4HC5E98366', 'MALAB51GP5M600709', 'AMARILLO', '0000-00-00', 'TA', '16228911', 1, 0, '', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('543', 'VLH-475', 2008, 'AUTOMOVIL', 1, 'HACHBACK', 'HATCH-BACK', 'G4HC7M223411', 'MALAB51GP8M179933', 'AMARILLO', '0000-00-00', 'TA', '31426027', 1, 0, '16226835', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('545', 'VLG-603', 2004, 'AUTOMOVIL', 1, 'ATOS', 'HATCH-BACK', 'G4HC3734615', 'KMHAG51GP4U347573', 'AMARILLO', '0000-00-00', 'TA', '94350866', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('546', 'VLH-289', 2007, 'AUTOMOVIL', 1, 'ATOS', 'HATCH-BACK', 'G4HC6M929602', 'MALAB51GP7M9451663', 'AMARILLO', '0000-00-00', 'TA', '6275040', 1, 0, '', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('547', 'STH-408', 2021, 'AUTOMOVIL', 6, 'EOTAXI', 'HATCH-BACK', 'G4LALP007453', 'KNAB2512AMT651617', 'AMARILLO', '0000-00-00', 'TA', '16204913', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1248', ''),
('550', 'VLG-991', 2006, 'AUTOMOVIL', 3, '724/SA', 'SEDAN', 'B10S1266839KA2', 'KL1MJ61096C125156', 'AMARILLO', '0000-00-00', 'TA', '29376937', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1248', ''),
('553', 'VLH-308', 2007, 'AUTOMOVIL', 1, 'ATOS', 'HATCH-BACK', 'G4HC6M956196', 'MALAB51GP7M966634', 'AMARILLO', '0000-00-00', 'TA', '16219855', 1, 0, '', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', '');
INSERT INTO `vehiculo` (`id_movil`, `placa`, `modelo`, `clase`, `id_marca`, `referencia`, `tipo`, `motor`, `serie`, `color`, `pago_hasta`, `grupo`, `id_prop`, `estado`, `poliza`, `managerid`, `combustible`, `dtaller`, `fcontrato`, `radio`, `ultimo_pago`, `cilindraje`, `obs`) VALUES
('554', 'STH-367', 2019, 'AUTOMOVIL', 1, 'GRAND I10', 'SEDAN', 'G4LAJM013495', 'MALA741CAKM340151', 'AMARILLO', '0000-00-00', 'TA', '16223066', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1248', ''),
('560', 'VLG-926', 2006, 'AUTOMOVIL', 1, 'ATOS', 'HATCH-BACK', 'G4HC5M551694', 'MALAB51GP6M641015', 'AMARILLO', '0000-00-00', 'TA', '16225240', 1, 0, '', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('561', 'VLH-543', 2010, 'AUTOMOVIL', 3, '724/SA', 'HATCH-BACK', 'B10S1330080KC2', '9GAMM6106AB191995', 'AMARILLO', '0000-00-00', 'TA', '16216936', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '995', ''),
('562', 'VLH-290', 2007, 'AUTOMOVIL', 1, 'ATOS', 'HATCH-BACK', 'G4HC6M930635', 'MALAB51GP7M945452', 'AMARILLO', '0000-00-00', 'TA', '14455406', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('564', 'STH-306', 2017, 'AUTOMOVIL', 1, 'GRAND I10', 'SEDAN', 'G4LAFM900428', 'MALA741CAHM156247', 'AMARILLO', '0000-00-00', 'TA', '31398220', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1248', ''),
('566', 'VLH-460', 2009, 'AUTOMOVIL', 1, 'ATOS', 'HATCH-BACK', 'G4HC8M355644', 'MALAB51GP9M269424', 'AMARILLO', '0000-00-00', 'TA', '31434132', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('567', 'STH-136', 2013, 'AUTOMOVIL', 1, 'PLUS I10', 'HATCH-BACK', 'G4HGCM489943', 'MALAM51BADM163154', 'AMARILLO', '0000-00-00', 'TA', '16203545', 1, 0, '', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1086', ''),
('568', 'STH-225', 2014, 'AUTOMOVIL', 6, 'PICANTO', 'HATCH-BACK', 'G4LADP122814', 'KNABE512AET699035', 'AMARILLO', '0000-00-00', 'TA', '18394791', 1, 0, '', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1248', ''),
('571', 'STH-163', 2014, 'AUTOMOVIL', 6, 'PICANTO', 'HATCH-BACK', 'G4LADP078266', 'KNABE512AET616131', 'AMARILLO', '0000-00-00', 'TA', '14570425', 1, 0, '', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1248', ''),
('572', 'VLH-299', 2007, 'AUTOMOVIL', 3, 'SPARK', 'SEDAN', 'B10S1597926KA2', '9GAMM61037B005810', 'AMARILLO', '0000-00-00', 'TA', '16208949', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1000', ''),
('576', 'VLG-712', 2005, 'AUTOMOVIL', 1, 'ATOS', 'SEDAN', 'G4HC4D65181', 'MALAB51GP5M483953', 'AMARILLO', '0000-00-00', 'TA', '29662965', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('580', 'VLG-640', 2004, 'AUTOMOVIL', 1, 'ATOS', 'SEDAN', 'G4HC3752692', 'KMHAG51GP4U353123', 'AMARILLO', '0000-00-00', 'TA', '16225188', 1, 0, '', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('582', 'VLH-521', 2009, 'AUTOMOVIL', 1, 'ATOS', 'SEDAN', 'G4HC8M678306', 'MALAB51GP9M386788', 'AMARILLO', '0000-00-00', 'TA', '31397673', 1, 0, '6360224', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('589', 'VLG-875', 2006, 'AUTOMOVIL', 1, 'ATOS', 'SEDAN', 'G4CH5M518557', 'MALAB51GP6M612501', 'AMARILLO', '0000-00-00', 'TA', '16780112', 1, 0, '', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('590', 'VLH-379', 2008, 'AUTOMOVIL', 1, 'ATOS', 'SEDAN', 'G4HC7M141933', 'MALAB51GP8M116946', 'AMARILLO', '0000-00-00', 'TA', '31424513', 1, 0, '', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('591', 'STH-011', 2011, 'AUTOMOVIL', 1, 'ATOS', 'HATCH-BACK', 'G4HCAM1185598', 'MALAB51GABM588949', 'AMARILLO', '0000-00-00', 'TA', '6241319', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1000', ''),
('592', 'VLG-786', 2005, 'AUTOMOVIL', 1, 'ATOS', 'SEDAN', 'G4HC4E45052', 'MALAB51GP5M554536', 'AMARILLO', '0000-00-00', 'TA', '29462026', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('595', 'STH-365', 2019, 'AUTOMOVIL', 1, 'GRAND I10', 'SEDAN', 'G4LAJM996157', 'MALA741CAKM335600', 'AMARILLO', '0000-00-00', 'TA', '16227132', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1248', ''),
('609', 'VLH-442', 2008, 'AUTOMOVIL', 1, 'ATOS', 'HATCH-BACK', 'G4HC7M298606', 'MALAB51GPBM234829', 'AMARILLO', '0000-00-00', 'TA', '31422330', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('612', 'VLH-191', 2007, 'AUTOMOVIL', 1, 'ATOS', 'SEDAN', 'G4HC6M877394', 'MALAB51GP7M904212', 'AMARILLO', '0000-00-00', 'TA', '16225240', 1, 0, '', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('615', 'VLH-335', 2007, 'AUTOMOVIL', 1, 'ATOS', 'SEDAN', 'G4HC6M008247', 'MALAB51GP7M008452', 'AMARILLO', '0000-00-00', 'TA', '6283991', 1, 0, '6284462', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('616', 'VLH-395', 2008, 'AUTOMOVIL', 6, 'EKOTAXI', 'SEDAN', 'G4HG7245378', 'KNABA24328T436593', 'AMARILLO', '0000-00-00', 'TA', '16221204', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1100', ''),
('620', 'VLG-932', 2006, 'AUTOMOVIL', 1, 'ATOS', 'SEDAN', 'G4HC5M570442', 'MALAB51GP6M665178', 'AMARILLO', '0000-00-00', 'TA', '16220189', 1, 0, '9534204', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('623', 'VLH-164', 2007, 'AUTOMOVIL', 1, 'ATOS', 'HATCH-BACK', 'G4HC6M831660', 'MALAB51GP7M864810', 'AMARILLO', '0000-00-00', 'TA', '16201930', 1, 0, '', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('625', 'STH-001', 2010, 'AUTOMOVIL', 1, 'ATOS', 'HATCH-BACK', 'G4HCAM953374', 'MALAB51GAAM507308', 'AMARILLO', '0000-00-00', 'TA', '34042291', 1, 0, '10092040', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '1000', ''),
('627', 'VLG-766', 2005, 'AUTOMOVIL', 1, 'ATOS', 'HATCH-BACK', 'G4HC4E44539', 'MALAB51GP5M554562', 'AMARILLO', '0000-00-00', 'TA', '70068241', 1, 0, '', 'GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', ''),
('630', 'VLH-476', 2009, 'AUTOMOVIL', 1, 'ATOS', 'HATCH-BACK', 'G4HC8M509659', 'MALAB51GP9M319651', 'AMARILLO', '0000-00-00', 'TA', '6131358', 1, 0, '', 'GAS-GASOLINA', 0, '0000-00-00', '', '0000-00-00', '999', '');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `veh_dias_mora`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `veh_dias_mora` (
`id_movil` int(1)
,`placa` int(1)
,`clase` int(1)
,`id_marca` int(1)
,`marca` int(1)
,`referencia` int(1)
,`tipo` int(1)
,`motor` int(1)
,`serie` int(1)
,`color` int(1)
,`modelo` int(1)
,`pago_hasta` int(1)
,`dias_mora` int(1)
,`grupo` int(1)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `veh_doc`
--

CREATE TABLE `veh_doc` (
  `id_movil` varchar(4) DEFAULT NULL,
  `id_documento` varchar(2) DEFAULT NULL,
  `fecha_exp` date DEFAULT '0000-00-00',
  `fecha_ven` date DEFAULT '0000-00-00',
  `numero` varchar(35) DEFAULT NULL,
  `idcons` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `veh_doc`
--

INSERT INTO `veh_doc` (`id_movil`, `id_documento`, `fecha_exp`, `fecha_ven`, `numero`, `idcons`) VALUES
('006', '01', '2021-02-04', '2022-02-04', '6015800372', 1),
('006', '02', '2020-11-30', '2021-11-30', '23620', 2),
('006', '03', '2020-08-09', '2021-08-09', '2000073923/24', 3),
('006', '04', '2021-02-02', '2022-02-02', '151615949', 4),
('007', '01', '2020-09-07', '2021-09-07', '14175100024770', 5),
('007', '02', '2020-11-30', '2021-11-30', '23621', 6),
('007', '03', '2020-08-09', '2021-08-09', '2000073923/24', 7),
('007', '04', '2020-09-06', '2021-09-06', '148676660', 8),
('008', '01', '2020-06-07', '2021-06-07', '10860500005670', 9),
('008', '02', '2020-11-30', '2021-11-30', '23754', 10),
('008', '03', '2020-08-09', '2021-08-09', '2000073923/24', 11),
('008', '04', '2020-06-30', '2021-06-30', '46626469', 12),
('009', '01', '2020-09-04', '2021-09-04', '1086050006460', 13),
('009', '02', '2020-11-30', '2021-11-30', '23585', 14),
('009', '03', '2020-08-09', '2021-08-09', '2000073923/24', 15),
('009', '04', '2020-09-22', '2021-09-22', '149045737', 16),
('011', '01', '2021-04-12', '2022-04-12', '10860500008510', 17),
('011', '02', '2020-11-30', '2021-11-30', '23746', 18),
('011', '03', '2020-08-09', '2021-08-09', '2000073923/24', 19),
('011', '04', '2020-07-03', '2021-07-03', '45626640', 20),
('012', '01', '2020-10-01', '2021-10-01', '601521824', 21),
('012', '02', '2020-11-30', '2021-11-30', '23742', 22),
('012', '03', '2020-08-09', '2021-08-09', '2000073923/24', 23),
('012', '04', '2020-10-10', '2021-10-10', '149416311', 24),
('013', '01', '2020-06-02', '2021-06-02', '601464642', 25),
('013', '02', '2020-11-30', '2021-11-30', '23549', 26),
('013', '03', '2020-08-09', '2021-08-09', '2000073923/24', 27),
('013', '04', '2020-06-03', '2021-06-03', '45625471', 28),
('016', '01', '2020-09-07', '2021-09-07', '10860500006480', 29),
('016', '02', '2020-11-30', '2021-11-30', '23741', 30),
('016', '03', '2020-08-09', '2021-08-09', '2000073923/24', 31),
('016', '04', '2020-09-08', '2021-09-08', '148758374', 32),
('017', '01', '2021-04-14', '2022-04-14', '1508004665599000', 33),
('017', '02', '2020-11-30', '2021-11-30', '23658', 34),
('017', '03', '2020-08-09', '2021-08-09', '2000073923/24', 35),
('017', '04', '2021-01-14', '2022-01-14', '151243086', 36),
('019', '01', '2020-10-13', '2021-10-13', '10860500006910', 37),
('019', '02', '2020-11-30', '2021-11-30', '23703', 38),
('019', '03', '2020-08-09', '2021-08-09', '2000073923/24', 39),
('019', '04', '2020-10-30', '2021-10-30', '149727079', 40),
('020', '01', '2021-02-17', '2022-02-17', '10860500008040', 41),
('020', '02', '2020-11-30', '2021-11-30', '23682', 42),
('020', '03', '2020-08-09', '2021-08-09', '2000073923/24', 43),
('020', '04', '2021-02-19', '2022-02-19', '151943430', 44),
('021', '01', '2020-11-23', '2021-11-23', '566948615', 45),
('021', '02', '2020-11-30', '2021-11-30', '23782', 46),
('021', '03', '2020-08-09', '2021-08-09', '2000073923/24', 47),
('021', '04', '2020-06-11', '2021-06-11', '48436552', 48),
('024', '01', '2021-03-04', '2022-03-04', '10860500008210', 49),
('024', '02', '2020-11-30', '2021-11-30', '23696', 50),
('024', '03', '2020-08-09', '2021-08-09', '2000073923/24', 51),
('024', '04', '2020-07-10', '2021-07-10', '49170865', 52),
('028', '01', '2020-11-12', '2021-11-12', '108605000007210', 53),
('028', '02', '2020-11-30', '2021-11-30', '23550', 54),
('028', '03', '2020-08-09', '2021-08-09', '2000073923/24', 55),
('028', '04', '2020-11-23', '2021-11-23', '150172645', 56),
('030', '01', '2020-09-13', '2021-09-13', '108605000006570', 57),
('030', '02', '2020-11-30', '2021-11-30', '23495', 58),
('030', '03', '2020-08-09', '2021-08-09', '2000073923/24', 59),
('030', '04', '2020-11-12', '2021-11-12', '149991107', 60),
('031', '01', '2020-05-18', '2021-05-18', '10860500005550', 61),
('031', '02', '2020-11-30', '2021-11-30', '23672', 62),
('031', '03', '2020-08-09', '2021-08-09', '2000073923/24', 63),
('031', '04', '2020-06-04', '2021-06-04', '146620049', 64),
('034', '01', '2021-02-08', '2022-02-08', '10860500007970', 65),
('034', '02', '2020-11-30', '2021-11-30', '23659', 66),
('034', '03', '2020-08-09', '2021-08-09', '2000073923/24', 67),
('034', '04', '2021-03-05', '2022-03-05', '152205894', 68),
('040', '01', '2021-02-20', '2022-02-20', '10860500008090', 69),
('040', '02', '2020-11-30', '2021-11-30', '23704', 70),
('040', '03', '2020-08-09', '2021-08-09', '2000073923/24', 71),
('040', '04', '2021-03-01', '2022-03-01', '152108019', 72),
('042', '01', '2020-12-19', '2021-12-19', '10860500007540', 73),
('042', '02', '2020-11-30', '2021-11-30', '23740', 74),
('042', '03', '2020-08-09', '2021-08-09', '2000073923/24', 75),
('042', '04', '2021-01-12', '2022-01-12', '151188151', 76),
('044', '01', '2021-03-05', '2022-03-05', '601591561', 77),
('044', '02', '2020-11-30', '2021-11-30', '23502', 78),
('044', '03', '2020-08-09', '2021-08-09', '2000073923/24', 79),
('044', '04', '2021-03-06', '2022-03-06', '152236596', 80),
('045', '01', '2020-07-18', '2021-07-18', '10860500006040', 81),
('045', '02', '2020-11-30', '2021-11-30', '23697', 82),
('045', '03', '2020-08-09', '2021-08-09', '2000073923/24', 83),
('045', '04', '2020-07-23', '2021-07-23', '49171365', 84),
('047', '01', '2020-10-01', '2021-10-01', '14521900024380', 85),
('047', '02', '2020-11-30', '2021-11-30', '23609', 86),
('047', '03', '2020-08-09', '2021-08-09', '2000073923/24', 87),
('047', '04', '2020-10-02', '2021-10-02', '149237176', 88),
('049', '01', '2020-09-12', '2021-09-12', '79239309-601512389', 89),
('049', '02', '2020-11-30', '2021-11-30', '23705', 90),
('049', '03', '2020-08-09', '2021-08-09', '2000073923/24', 91),
('049', '04', '2020-09-26', '2021-09-26', '149120083', 92),
('052', '01', '2020-12-07', '2021-12-07', '14521100056510', 93),
('052', '02', '2020-11-30', '2021-11-30', '23706', 94),
('052', '03', '2020-08-09', '2021-08-09', '2000073923/24', 95),
('052', '04', '2020-12-10', '2021-12-10', '150501223', 96),
('054', '01', '2020-11-12', '2021-11-12', '600470899', 97),
('054', '02', '2020-11-30', '2021-11-30', '23503', 98),
('054', '03', '2020-08-09', '2021-08-09', '2000073923/24', 99),
('054', '04', '0000-00-00', '2022-02-04', '151645396', 100),
('055', '01', '0000-00-00', '2022-02-25', '10860500008140', 101),
('055', '02', '2020-11-30', '2021-11-30', '23622', 102),
('055', '03', '2020-08-09', '2021-08-09', '2000073923/24', 103),
('055', '04', '2021-02-27', '2022-02-27', '152082215', 104),
('057', '01', '2020-07-19', '2021-07-19', '10860500006020', 105),
('057', '02', '2020-11-30', '2021-11-30', '23739', 106),
('057', '03', '2020-08-09', '2021-08-09', '2000073923/24', 107),
('057', '04', '2020-08-24', '2021-08-24', '148425175', 108),
('059', '01', '2020-10-14', '2021-10-14', '3096980600', 109),
('059', '02', '2020-11-30', '2021-11-30', '23623', 110),
('059', '03', '2020-08-09', '2021-08-09', '2000073923/24', 111),
('059', '04', '2020-10-09', '2021-10-09', '149398989', 112),
('061', '01', '2020-07-04', '2021-07-04', '10860500005880', 113),
('061', '02', '2020-11-30', '2021-11-30', '23660', 114),
('061', '03', '2020-08-09', '2021-08-09', '2000073923/24', 115),
('061', '04', '2020-07-16', '2021-07-16', '49171053', 116),
('065', '01', '2020-10-29', '2021-10-29', '25568149', 117),
('065', '02', '2020-11-30', '2021-11-30', '23683', 118),
('065', '03', '2020-08-09', '2021-08-09', '2000073923/24', 119),
('065', '04', '2020-07-03', '2021-07-03', '45626639', 120),
('066', '01', '2020-10-05', '2021-10-05', '25414594', 121),
('066', '02', '2020-11-30', '2021-11-30', '23569', 122),
('066', '03', '2020-08-09', '2021-08-09', '2000073923/24', 123),
('066', '04', '2020-10-05', '2021-10-05', '149261611', 124),
('069', '01', '2021-03-07', '2022-03-07', '1568004636166000', 125),
('069', '02', '2020-11-30', '2021-11-30', '23747', 126),
('069', '03', '2020-08-09', '2021-08-09', '2000073923/24', 127),
('069', '04', '2020-06-03', '2021-06-03', '48436089', 128),
('074', '01', '2020-09-03', '2021-09-03', '14521900024100', 129),
('074', '02', '2020-11-30', '2021-11-30', '23684', 130),
('074', '03', '2020-08-09', '2021-08-09', '2000073923/24', 131),
('074', '04', '2020-08-10', '2021-08-10', '148178970', 132),
('084', '01', '2020-11-12', '2021-11-12', '11700400002100', 133),
('084', '02', '2020-11-30', '2021-11-30', '23534', 134),
('084', '03', '2020-08-09', '2021-08-09', '2000073923/24', 135),
('084', '04', '2020-11-17', '2021-11-17', '150071161', 136),
('085', '01', '2020-07-22', '2021-07-22', '10860500006070', 137),
('085', '02', '2020-11-30', '2021-11-30', '23624', 138),
('085', '03', '2020-08-09', '2021-08-09', '2000073923/24', 139),
('085', '04', '2020-08-15', '2021-08-15', '148282713', 140),
('092', '01', '2020-06-02', '2021-06-02', '10860500005630', 141),
('092', '02', '2020-11-30', '2021-11-30', '23685', 142),
('092', '03', '2020-08-09', '2021-08-09', '2000073923/24', 143),
('092', '04', '2020-06-12', '2021-06-12', '45625875', 144),
('093', '01', '2020-11-10', '2021-11-10', '13116600004950', 145),
('093', '02', '2020-11-30', '2021-11-30', '23673', 146),
('093', '03', '2020-08-09', '2021-08-09', '2000073923/24', 147),
('093', '04', '2020-07-11', '2021-07-11', '147616859', 148),
('094', '01', '2020-03-30', '2021-03-30', '10860500004210', 149),
('094', '02', '2020-11-30', '2021-11-30', '23698', 150),
('094', '03', '2020-08-09', '2021-08-09', '2000073923/24', 151),
('094', '04', '2020-07-10', '2021-07-10', '49170828', 152),
('095', '01', '2020-05-28', '2021-05-28', '10860500005610', 153),
('095', '02', '2020-11-30', '2021-11-30', '23551', 154),
('095', '03', '2020-08-09', '2021-08-09', '2000073923/24', 155),
('095', '04', '2020-06-06', '2021-06-06', '45625628', 156),
('097', '01', '2020-11-18', '2021-11-18', '10865000007260', 157),
('097', '02', '2020-11-30', '2021-11-30', '23738', 158),
('097', '03', '2020-08-09', '2021-08-09', '2000073923/24', 159),
('097', '04', '2020-12-12', '2021-12-12', 'NUEVO', 160),
('098', '01', '2020-10-19', '2021-10-19', '10860500006960', 161),
('098', '02', '2020-11-30', '2021-11-30', '23586', 162),
('098', '03', '2020-08-09', '2021-08-09', '2000073923/24', 163),
('098', '04', '2020-10-02', '2021-10-02', '149233750', 164),
('107', '01', '2020-10-21', '2021-10-21', '10860500007020', 165),
('107', '02', '2020-11-30', '2021-11-30', '23686', 166),
('107', '03', '2020-08-09', '2021-08-09', '2000073923/24', 167),
('107', '04', '2020-11-11', '2021-11-11', '149819357', 168),
('110', '01', '2021-04-14', '2022-04-14', '10860500008520', 169),
('110', '02', '2020-11-30', '2021-11-30', '23552', 170),
('110', '03', '2020-08-09', '2021-08-09', '2000073923/24', 171),
('110', '04', '2020-06-05', '2021-06-05', '48436233', 172),
('111', '01', '2021-03-17', '2022-03-17', '10860500008350', 173),
('111', '02', '2020-11-30', '2021-11-30', '23570', 174),
('111', '03', '2020-08-09', '2021-08-09', '2000073923/24', 175),
('111', '04', '2020-08-25', '2021-08-25', '148432039', 176),
('120', '01', '2020-10-25', '2021-10-25', '601256706', 177),
('120', '02', '2020-11-30', '2021-11-30', '23625', 178),
('120', '03', '2020-08-09', '2021-08-09', '2000073923/24', 179),
('120', '04', '2020-10-24', '2021-10-24', '149659844', 180),
('121', '01', '2020-08-02', '2021-08-02', '14521900006170', 181),
('121', '02', '2020-11-30', '2021-11-30', '23674', 182),
('121', '03', '2020-08-09', '2021-08-09', '2000073923/24', 183),
('121', '04', '2020-09-01', '2021-09-01', '148557803', 184),
('123', '01', '2020-10-22', '2021-10-22', '14541100084590', 185),
('123', '02', '2020-11-30', '2021-11-30', '23587', 186),
('123', '03', '2020-08-09', '2021-08-09', '2000073923/24', 187),
('123', '04', '2020-11-23', '2021-11-23', '150181839', 188),
('125', '01', '2021-02-21', '2022-02-21', '10860500008050', 189),
('125', '02', '2020-11-30', '2021-11-30', '23518', 190),
('125', '03', '2020-08-09', '2021-08-09', '2000073923/24', 191),
('125', '04', '2021-02-21', '2022-02-21', '151978273', 192),
('131', '01', '2020-05-07', '2021-05-07', '600432148', 193),
('131', '02', '2020-11-30', '2021-11-30', '23553', 194),
('131', '03', '2020-08-09', '2021-08-09', '2000073923/24', 195),
('131', '04', '2020-07-03', '2021-07-03', '48437534', 196),
('134', '01', '2021-03-24', '2022-03-24', '10860500008410', 197),
('134', '02', '2020-11-30', '2021-11-30', '23554', 198),
('134', '03', '2020-08-09', '2021-08-09', '2000073923/24', 199),
('134', '04', '0000-00-00', '2021-06-25', '48437159', 200),
('138', '01', '0000-00-00', '2021-10-12', '10860500006860', 201),
('138', '02', '2020-11-30', '2021-11-30', '23517', 202),
('138', '03', '2020-08-09', '2021-08-09', '2000073923/24', 203),
('138', '04', '2020-10-12', '2021-10-12', '149434054', 204),
('140', '01', '2020-06-06', '2021-06-06', '14514400032610', 205),
('140', '02', '2020-11-30', '2021-11-30', '23610', 206),
('140', '03', '2020-08-09', '2021-08-09', '2000073923/24', 207),
('140', '04', '2020-06-08', '2021-06-08', '45625687', 208),
('141', '01', '2020-08-31', '2021-08-31', '10860500006440', 209),
('141', '02', '2020-11-30', '2021-11-30', '23611', 210),
('141', '03', '2020-08-09', '2021-08-09', '2000073923/24', 211),
('141', '04', '2020-09-21', '2021-09-21', '149007928', 212),
('144', '01', '2020-11-22', '2021-11-22', '79874444600473125', 213),
('144', '02', '2020-11-30', '2021-11-30', '23571', 214),
('144', '03', '2020-08-09', '2021-08-09', '2000073923/24', 215),
('144', '04', '2021-01-25', '2022-01-25', '151417761', 216),
('145', '01', '2020-09-02', '2021-09-02', '10860500006450', 217),
('145', '02', '2020-11-30', '2021-11-30', '23588', 218),
('145', '03', '2020-08-09', '2021-08-09', '2000073923/24', 219),
('145', '04', '2020-09-07', '2021-09-07', '148696480', 220),
('146', '01', '2021-03-12', '2022-03-12', '601350707', 221),
('146', '02', '2020-11-30', '2021-11-30', '23589', 222),
('146', '03', '2020-08-09', '2021-08-09', '2000073923/24', 223),
('146', '04', '2021-03-14', '2022-03-14', '152370776', 224),
('147', '01', '2021-03-26', '2022-03-26', '10860500008440', 225),
('147', '02', '2020-11-30', '2021-11-30', '23519', 226),
('147', '03', '2020-08-09', '2021-08-09', '2000073923/24', 227),
('147', '04', '2020-06-06', '2021-06-06', '48436322', 228),
('149', '01', '2020-11-17', '2021-11-17', '10860500007240', 229),
('149', '02', '2020-11-30', '2021-11-30', '23707', 230),
('149', '03', '2020-08-09', '2021-08-09', '2000073923/24', 231),
('149', '04', '2020-11-10', '2021-11-10', '149947629', 232),
('150', '01', '2021-01-28', '2022-01-28', '10860500007830', 233),
('150', '02', '2020-11-30', '2021-11-30', '23720', 234),
('150', '03', '2020-08-09', '2021-08-09', '2000073923/24', 235),
('150', '04', '2021-01-29', '2022-01-29', '151524675', 236),
('152', '01', '2020-11-10', '2021-11-10', '10860500007190', 237),
('152', '02', '2020-11-30', '2021-11-30', '23590', 238),
('152', '03', '2020-08-09', '2021-08-09', '2000073923/24', 239),
('152', '04', '2020-11-18', '2021-11-18', '150066032', 240),
('156', '01', '2020-10-28', '2021-10-28', '10860500007120', 241),
('156', '02', '2020-11-30', '2021-11-30', '23626', 242),
('156', '03', '2020-08-09', '2021-08-09', '2000073923/24', 243),
('156', '04', '2020-12-01', '2021-12-01', '150316540', 244),
('158', '01', '2020-08-27', '2021-08-27', '10860500006380', 245),
('158', '02', '2020-11-30', '2021-11-30', '23535', 246),
('158', '03', '2020-08-09', '2021-08-09', '2000073923/24', 247),
('158', '04', '2020-08-27', '2021-08-27', 'NUEVO', 248),
('159', '01', '2020-11-05', '2021-11-05', '79503723601857278', 249),
('159', '02', '2020-11-30', '2021-11-30', '23751', 250),
('159', '03', '2020-08-09', '2021-08-09', '2000073923/24', 251),
('159', '04', '2020-06-09', '2021-06-09', '48436458', 252),
('160', '01', '2021-01-17', '2022-01-17', '10860500007750', 253),
('160', '02', '2020-11-30', '2021-11-30', '23520', 254),
('160', '03', '2020-08-09', '2021-08-09', '2000073923/24', 255),
('160', '04', '2021-01-26', '2022-01-26', '151459399', 256),
('164', '01', '2020-10-03', '2021-10-03', '108605000006820', 257),
('164', '02', '2020-11-30', '2021-11-30', '23572', 258),
('164', '03', '2020-08-09', '2021-08-09', '2000073923/24', 259),
('164', '04', '2021-01-30', '2022-01-30', '151556173', 260),
('166', '01', '2021-03-04', '2022-03-04', '10860500008180', 261),
('166', '02', '2020-11-30', '2021-11-30', '23661', 262),
('166', '03', '2020-08-09', '2021-08-09', '2000073923/24', 263),
('166', '04', '2020-07-02', '2021-07-02', '45626578', 264),
('167', '01', '2020-09-12', '2021-09-12', '25295920', 265),
('167', '02', '2020-11-30', '2021-11-30', '23627', 266),
('167', '03', '2020-08-09', '2021-08-09', '2000073923/24', 267),
('167', '04', '2020-09-14', '2021-09-14', '148857203', 268),
('169', '01', '2020-09-24', '2021-09-24', '601517911', 269),
('169', '02', '2020-11-30', '2021-11-30', '23765', 270),
('169', '03', '2020-08-09', '2021-08-09', '2000073923/24', 271),
('169', '04', '2020-11-10', '2021-11-10', '149951286', 272),
('170', '01', '2021-01-05', '2022-01-05', '10860500007670', 273),
('170', '02', '2020-11-30', '2021-11-30', '23521', 274),
('170', '03', '2020-08-09', '2021-08-09', '2000073923/24', 275),
('170', '04', '2020-06-01', '2021-06-01', '45625393', 276),
('175', '01', '2019-12-15', '2020-12-14', '10860500003900', 277),
('175', '02', '2020-11-30', '2021-11-30', '23708', 278),
('175', '03', '2020-08-09', '2021-08-09', '2000073923/24', 279),
('175', '04', '2019-12-29', '2020-12-28', '46501211', 280),
('176', '01', '2021-01-14', '2022-01-14', '10860500007721', 281),
('176', '02', '2020-11-30', '2021-11-30', '23628', 282),
('176', '03', '2020-08-09', '2021-08-09', '2000073923/24', 283),
('176', '04', '2021-01-13', '2022-01-13', '151211718', 284),
('177', '01', '2020-10-08', '2021-10-08', '601525613', 285),
('177', '02', '2020-11-30', '2021-11-30', '23591', 286),
('177', '03', '2020-08-09', '2021-08-09', '2000073923/24', 287),
('177', '04', '2020-10-16', '2021-10-16', '149510322', 288),
('180', '01', '2020-11-22', '2021-11-22', '10860500007310', 289),
('180', '02', '2020-11-30', '2021-11-30', '23592', 290),
('180', '03', '2020-08-09', '2021-08-09', '2000073923/24', 291),
('180', '04', '2020-11-21', '2021-11-21', '150152684', 292),
('181', '01', '2020-05-07', '2021-05-07', '601454620', 293),
('181', '02', '2020-11-30', '2021-11-30', '23629', 294),
('181', '03', '2020-08-09', '2021-08-09', '2000073923/24', 295),
('181', '04', '2020-06-12', '2021-06-12', '45625892', 296),
('182', '01', '2020-10-21', '2021-10-21', '601253538', 297),
('182', '02', '2020-11-30', '2021-11-30', '23630', 298),
('182', '03', '2020-08-09', '2021-08-09', '2000073923/24', 299),
('182', '04', '0000-00-00', '2021-10-20', '149575419', 300),
('183', '01', '0000-00-00', '2021-12-21', '601295036', 301),
('183', '02', '2020-11-30', '2021-11-30', '23536', 302),
('183', '03', '2020-08-09', '2021-08-09', '2000073923/24', 303),
('183', '04', '2020-12-19', '2021-12-19', '150727649', 304),
('185', '01', '2020-10-29', '2021-10-29', '13251500007130', 305),
('185', '02', '2020-11-30', '2021-11-30', '23573', 306),
('185', '03', '2020-08-09', '2021-08-09', '2000073923/24', 307),
('185', '04', '2020-10-15', '2021-10-15', '149479537', 308),
('186', '01', '2020-08-15', '2021-08-15', '10860500006290', 309),
('186', '02', '2020-11-30', '2021-11-30', '23555', 310),
('186', '03', '2020-08-09', '2021-08-09', '2000073923/24', 311),
('186', '04', '2020-08-16', '2021-08-16', '14897334', 312),
('187', '01', '2020-07-03', '2021-07-03', '10860500005840', 313),
('187', '02', '2020-11-30', '2021-11-30', '23737', 314),
('187', '03', '2020-08-09', '2021-08-09', '2000073923/24', 315),
('187', '04', '2020-07-06', '2021-07-06', '49170659', 316),
('189', '01', '2021-02-20', '2022-02-20', '10860500008060', 317),
('189', '02', '2020-11-30', '2021-11-30', '23574', 318),
('189', '03', '2020-08-09', '2021-08-09', '2000073923/24', 319),
('189', '04', '2020-07-19', '2021-07-19', '49171194', 320),
('192', '01', '2020-07-15', '2021-07-15', '10860500005960', 321),
('192', '02', '2020-11-30', '2021-11-30', '23662', 322),
('192', '03', '2020-08-09', '2021-08-09', '2000073923/24', 323),
('192', '04', '2020-07-26', '2021-07-26', '147922447', 324),
('193', '01', '2020-10-08', '2021-10-08', '14541100064210', 325),
('193', '02', '2020-11-30', '2021-11-30', '23593', 326),
('193', '03', '2020-08-09', '2021-08-09', '2000073923/24', 327),
('193', '04', '2020-10-28', '2021-10-28', '149730856', 328),
('196', '01', '2020-12-10', '2021-12-10', '600477304', 329),
('196', '02', '2020-11-30', '2021-11-30', '23736', 330),
('196', '03', '2020-08-09', '2021-08-09', '2000073923/24', 331),
('196', '04', '2020-12-21', '2021-12-21', '150783247', 332),
('197', '01', '2020-05-09', '2021-05-09', '600431946', 333),
('197', '02', '2020-11-30', '2021-11-30', '23612', 334),
('197', '03', '2020-08-09', '2021-08-09', '2000073923/24', 335),
('197', '04', '2020-07-04', '2021-07-04', '45626726', 336),
('198', '01', '2020-11-09', '2021-11-09', '79627914-601266849', 337),
('198', '02', '2020-11-30', '2021-11-30', '23496', 338),
('198', '03', '2020-08-09', '2021-08-09', '2000073923/24', 339),
('198', '04', '2020-11-10', '2021-11-10', '149950584', 340),
('199', '01', '2020-09-26', '2021-09-26', '14773100002930', 341),
('199', '02', '2020-11-30', '2021-11-30', '23631', 342),
('199', '03', '2020-08-09', '2021-08-09', '2000073923/24', 343),
('199', '04', '2020-09-25', '2021-09-25', 'NUEVO', 344),
('200', '01', '2020-10-21', '2021-10-21', '10860500006970', 345),
('200', '02', '2020-11-30', '2021-11-30', '23769', 346),
('200', '03', '2020-08-09', '2021-08-09', '2000073923/24', 347),
('200', '04', '2020-10-15', '2021-10-15', '149479637', 348),
('201', '01', '2020-10-31', '2021-10-31', '601535292', 349),
('201', '02', '2020-11-30', '2021-11-30', '23559', 350),
('201', '03', '2020-08-09', '2021-08-09', '2000073923/24', 351),
('201', '04', '2020-10-30', '2021-10-30', '149773359', 352),
('202', '01', '2020-06-09', '2021-06-09', '10860500005690', 353),
('202', '02', '2020-11-30', '2021-11-30', '23687', 354),
('202', '03', '2020-08-09', '2021-08-09', '2000073923/24', 355),
('202', '04', '2020-07-03', '2021-07-03', '147417833', 356),
('203', '01', '2021-01-22', '2022-01-22', '10860500007800', 357),
('203', '02', '2020-11-30', '2021-11-30', '23688', 358),
('203', '03', '2020-08-09', '2021-08-09', '2000073923/24', 359),
('203', '04', '2021-01-26', '2022-01-26', '151463230', 360),
('206', '01', '2020-08-03', '2021-08-03', '10860500006190', 361),
('206', '02', '2020-11-30', '2021-11-30', '23632', 362),
('206', '03', '2020-08-09', '2021-08-09', '2000073923/24', 363),
('206', '04', '2020-07-18', '2021-07-18', 'NUEVO', 364),
('209', '01', '2020-07-06', '2021-07-06', '10860500005900', 365),
('209', '02', '2020-11-30', '2021-11-30', '23613', 366),
('209', '03', '2020-08-09', '2021-08-09', '2000073923/24', 367),
('209', '04', '2020-07-07', '2021-07-07', '45626826', 368),
('210', '01', '2020-07-27', '2021-07-27', '10860500006130', 369),
('210', '02', '2020-11-30', '2021-11-30', '23735', 370),
('210', '03', '2020-08-09', '2021-08-09', '2000073923/24', 371),
('210', '04', '2020-07-16', '2021-07-16', '147753762', 372),
('211', '01', '2020-11-23', '2021-11-23', '10860500007350', 373),
('211', '02', '2020-11-30', '2021-11-30', '23689', 374),
('211', '03', '2020-08-09', '2021-08-09', '2000073923/24', 375),
('211', '04', '2020-12-01', '2021-12-01', '150331495', 376),
('212', '01', '2021-02-09', '2022-02-09', '601582402', 377),
('212', '02', '2020-11-30', '2021-11-30', '23504', 378),
('212', '03', '2020-08-09', '2021-08-09', '2000073923/24', 379),
('212', '04', '2021-03-17', '2022-03-17', '152431399', 380),
('213', '01', '2020-12-07', '2021-12-07', '79923484-601285265', 381),
('213', '02', '2020-11-30', '2021-11-30', '23752', 382),
('213', '03', '2020-08-09', '2021-08-09', '2000073923/24', 383),
('213', '04', '2020-11-30', '2021-11-30', '150307739', 384),
('214', '01', '2021-04-15', '2022-04-15', '13754700003800', 385),
('214', '02', '2020-11-30', '2021-11-30', '23505', 386),
('214', '03', '2020-08-09', '2021-08-09', '2000073923/24', 387),
('214', '04', '2020-06-01', '2021-06-01', '45625365', 388),
('215', '01', '2020-12-18', '2021-12-18', '501294156', 389),
('215', '02', '2020-11-30', '2021-11-30', '23556', 390),
('215', '03', '2020-08-09', '2021-08-09', '2000073923/24', 391),
('215', '04', '2020-12-22', '2021-12-22', '150808491', 392),
('219', '01', '2021-01-25', '2022-01-25', '601575012', 393),
('219', '02', '2020-11-30', '2021-11-30', '23575', 394),
('219', '03', '2020-08-09', '2021-08-09', '2000073923/24', 395),
('219', '04', '2021-02-11', '2022-02-11', '151783429', 396),
('223', '01', '2021-01-21', '2022-01-21', '1395130003240', 397),
('223', '02', '2020-11-30', '2021-11-30', '23734', 398),
('223', '03', '2020-08-09', '2021-08-09', '2000073923/24', 399),
('223', '04', '0000-00-00', '2022-02-22', '151397586', 400),
('231', '01', '0000-00-00', '2021-10-26', '14850000012320', 401),
('231', '02', '2020-11-30', '2021-11-30', '23633', 402),
('231', '03', '2020-08-09', '2021-08-09', '2000073923/24', 403),
('231', '04', '2020-10-31', '2021-10-31', '149794664', 404),
('232', '01', '2020-07-16', '2021-07-16', '10860500005990', 405),
('232', '02', '2020-11-30', '2021-11-30', '23709', 406),
('232', '03', '2020-08-09', '2021-08-09', '2000073923/24', 407),
('232', '04', '2020-07-07', '2021-07-07', '49170720', 408),
('233', '01', '2020-08-04', '2021-08-04', '15050500000850', 409),
('233', '02', '2020-11-30', '2021-11-30', '23743', 410),
('233', '03', '2020-08-09', '2021-08-09', '2000073923/24', 411),
('233', '04', '2020-08-31', '2021-08-31', '148567391', 412),
('234', '01', '2020-05-13', '2021-05-13', '10860500005220', 413),
('234', '02', '2020-11-30', '2021-11-30', '23675', 414),
('234', '03', '2020-08-09', '2021-08-09', '2000073923/24', 415),
('234', '04', '2020-06-04', '2021-06-04', '48436122', 416),
('241', '01', '2020-06-20', '2021-06-20', '60169902', 417),
('241', '02', '2020-11-30', '2021-11-30', '23663', 418),
('241', '03', '2020-08-09', '2021-08-09', '2000073923/24', 419),
('241', '04', '2020-07-06', '2021-07-06', '49170611', 420),
('245', '01', '2020-08-26', '2021-08-26', '1086050006360', 421),
('245', '02', '2020-11-30', '2021-11-30', '23733', 422),
('245', '03', '2020-08-09', '2021-08-09', '2000073923/24', 423),
('245', '04', '2020-08-24', '2021-08-24', '148446330', 424),
('246', '01', '2020-06-08', '2021-06-08', '10860500005680', 425),
('246', '02', '2020-11-30', '2021-11-30', '23710', 426),
('246', '03', '2020-08-09', '2021-08-09', '2000073923/24', 427),
('246', '04', '2020-06-16', '2021-06-16', '45625959', 428),
('249', '01', '2020-08-27', '2021-08-27', '10860500006390', 429),
('249', '02', '2020-11-30', '2021-11-30', '23557', 430),
('249', '03', '2020-08-09', '2021-08-09', '2000073923/24', 431),
('249', '04', '2020-08-28', '2021-08-28', 'NUEVO', 432),
('250', '01', '2020-08-03', '2021-08-03', '10860500006180', 433),
('250', '02', '2020-11-30', '2021-11-30', '23558', 434),
('250', '03', '2020-08-09', '2021-08-09', '2000073923/24', 435),
('250', '04', '2020-08-13', '2021-08-13', '148246689', 436),
('251', '01', '2021-03-13', '2022-03-13', '6013500015', 437),
('251', '02', '2020-11-30', '2021-11-30', '23634', 438),
('251', '03', '2020-08-09', '2021-08-09', '2000073923/24', 439),
('251', '04', '2021-03-11', '2022-03-11', '152313291', 440),
('259', '01', '2021-02-03', '2022-02-03', '601422833', 441),
('259', '02', '2020-11-30', '2021-11-30', '23760', 442),
('259', '03', '2020-08-09', '2021-08-09', '2000073923/24', 443),
('259', '04', '2020-06-05', '2021-06-05', '48436249', 444),
('260', '01', '2020-10-04', '2021-10-04', '10860500006810', 445),
('260', '02', '2020-11-30', '2021-11-30', '23560', 446),
('260', '03', '2020-08-09', '2021-08-09', '2000073923/24', 447),
('260', '04', '2020-10-08', '2021-10-08', '149332498', 448),
('261', '01', '2021-02-03', '2022-02-03', '10860500007930', 449),
('261', '02', '2020-11-30', '2021-11-30', '23664', 450),
('261', '03', '2020-08-09', '2021-08-09', '2000073923/24', 451),
('261', '04', '2021-01-13', '2022-01-13', '151128245', 452),
('262', '01', '2020-06-26', '2021-06-26', '15050500000110', 453),
('262', '02', '2020-11-30', '2021-11-30', '23690', 454),
('262', '03', '2020-08-09', '2021-08-09', '2000073923/24', 455),
('262', '04', '2020-07-29', '2021-07-29', '147986900', 456),
('265', '01', '2020-09-30', '2021-09-30', '10860500006780', 457),
('265', '02', '2020-11-30', '2021-11-30', '23665', 458),
('265', '03', '2020-08-09', '2021-08-09', '2000073923/24', 459),
('265', '04', '2020-09-30', '2021-09-30', '149166416', 460),
('266', '01', '2020-11-05', '2021-11-05', '14541100087430', 461),
('266', '02', '2020-11-30', '2021-11-30', '23594', 462),
('266', '03', '2020-08-09', '2021-08-09', '2000073923/24', 463),
('266', '04', '2020-11-06', '2021-11-06', '149882251', 464),
('268', '01', '2020-06-20', '2021-06-20', '10860500005760', 465),
('268', '02', '2020-11-30', '2021-11-30', '23522', 466),
('268', '03', '2020-08-09', '2021-08-09', '2000073923/24', 467),
('268', '04', '2020-06-21', '2021-06-21', 'NUEVO', 468),
('273', '01', '2020-09-07', '2021-09-07', '10860500006490', 469),
('273', '02', '2020-11-30', '2021-11-30', '23732', 470),
('273', '03', '2020-08-09', '2021-08-09', '2000073923/24', 471),
('273', '04', '2020-07-16', '2021-07-16', '49171093', 472),
('275', '01', '2020-09-23', '2021-09-23', '10860500006700', 473),
('275', '02', '2020-11-30', '2021-11-30', '23635', 474),
('275', '03', '2020-08-09', '2021-08-09', '2000073923/24', 475),
('275', '04', '2020-08-07', '2021-08-07', '148136164', 476),
('276', '01', '2021-02-01', '2022-02-01', '10860500007910', 477),
('276', '02', '2020-11-30', '2021-11-30', '23636', 478),
('276', '03', '2020-08-09', '2021-08-09', '2000073923/24', 479),
('276', '04', '2021-01-31', '2022-01-31', '151442728', 480),
('277', '01', '2021-02-26', '2022-02-26', '601589146', 481),
('277', '02', '2020-11-30', '2021-11-30', '23614', 482),
('277', '03', '2020-08-09', '2021-08-09', '2000073923/24', 483),
('277', '04', '2021-02-27', '2022-02-27', '152072186', 484),
('279', '01', '2020-11-26', '2021-11-26', '10860500007370', 485),
('279', '02', '2020-11-30', '2021-11-30', '23748', 486),
('279', '03', '2020-08-09', '2021-08-09', '2000073923/24', 487),
('279', '04', '2020-07-30', '2021-07-30', '147994060', 488),
('281', '01', '2021-03-03', '2022-03-03', '601344470', 489),
('281', '02', '2020-11-30', '2021-11-30', '23576', 490),
('281', '03', '2020-08-09', '2021-08-09', '2000073923/24', 491),
('281', '04', '2021-03-06', '2022-03-06', '152226246', 492),
('284', '01', '2020-07-27', '2021-07-27', '10860500006140', 493),
('284', '02', '2020-11-30', '2021-11-30', '23637', 494),
('284', '03', '2020-08-09', '2021-08-09', '2000073923/24', 495),
('284', '04', '2020-08-01', '2021-08-01', '148035665', 496),
('285', '01', '2020-08-13', '2021-08-13', '1445220004940', 497),
('285', '02', '2020-11-30', '2021-11-30', '23768', 498),
('285', '03', '2020-08-09', '2021-08-09', '2000073923/24', 499),
('285', '04', '0000-00-00', '2021-08-15', 'NUEVO', 500),
('289', '01', '0000-00-00', '2021-07-27', '600446846', 501),
('289', '02', '2020-11-30', '2021-11-30', '23561', 502),
('289', '03', '2020-08-09', '2021-08-09', '2000073923/24', 503),
('289', '04', '2020-07-27', '2021-07-27', '45627477', 504),
('290', '01', '2020-05-08', '2021-05-08', '10860500005460', 505),
('290', '02', '2020-11-30', '2021-11-30', '23595', 506),
('290', '03', '2020-08-09', '2021-08-09', '2000073923/24', 507),
('290', '04', '2020-07-02', '2021-07-02', '45626557', 508),
('294', '01', '2020-08-01', '2021-08-01', '250531115', 509),
('294', '02', '2020-11-30', '2021-11-30', '23676', 510),
('294', '03', '2020-08-09', '2021-08-09', '2000073923/24', 511),
('294', '04', '2020-08-04', '2021-08-04', '148084164', 512),
('295', '01', '2021-03-19', '2022-03-19', '10860500008360', 513),
('295', '02', '2020-11-30', '2021-11-30', '23638', 514),
('295', '03', '2020-08-09', '2021-08-09', '2000073923/24', 515),
('295', '04', '2021-03-20', '2022-03-20', '152482316', 516),
('296', '01', '2020-12-28', '2021-12-28', '601564533', 517),
('296', '02', '2020-11-30', '2021-11-30', '23711', 518),
('296', '03', '2020-08-09', '2021-08-09', '2000073923/24', 519),
('296', '04', '2021-01-09', '2022-01-09', '151162740', 520),
('298', '01', '2020-11-09', '2021-11-09', '10860500007180', 521),
('298', '02', '2020-11-30', '2021-11-30', '23731', 522),
('298', '03', '2020-08-09', '2021-08-09', '2000073923/24', 523),
('298', '04', '2020-11-04', '2021-11-04', '149827196', 524),
('299', '01', '2021-03-01', '2022-03-01', '1504600001200', 525),
('299', '02', '2020-11-30', '2021-11-30', '23562', 526),
('299', '03', '2020-08-09', '2021-08-09', '2000073923/24', 527),
('299', '04', '2021-03-01', '2022-03-01', '152115592', 528),
('304', '01', '2020-08-15', '2021-08-15', '10860500006330', 529),
('304', '02', '2020-11-30', '2021-11-30', '23639', 530),
('304', '03', '2020-08-09', '2021-08-09', '2000073923/24', 531),
('304', '04', '2020-08-19', '2021-08-19', '148319423', 532),
('308', '01', '2021-02-11', '2022-02-11', '80424439-601331656', 533),
('308', '02', '2020-11-30', '2021-11-30', '23777', 534),
('308', '03', '2020-08-09', '2021-08-09', '2000073923/24', 535),
('308', '04', '2021-02-12', '2022-02-12', '151806688', 536),
('309', '01', '2020-08-17', '2021-08-17', '601218103', 537),
('309', '02', '2020-11-30', '2021-11-30', '23640', 538),
('309', '03', '2020-08-09', '2021-08-09', '2000073923/24', 539),
('309', '04', '2020-08-26', '2021-08-26', '148474871', 540),
('315', '01', '2020-07-22', '2021-07-22', '14541100071990', 541),
('315', '02', '2020-11-30', '2021-11-30', '23596', 542),
('315', '03', '2020-08-09', '2021-08-09', '2000073923/24', 543),
('315', '04', '2020-07-25', '2021-07-25', '49171403', 544),
('325', '01', '2020-06-03', '2021-06-03', '10860500005660', 545),
('325', '02', '2020-11-30', '2021-11-30', '23677', 546),
('325', '03', '2020-08-09', '2021-08-09', '2000073923/24', 547),
('325', '04', '2020-10-23', '2021-10-23', '149623182', 548),
('326', '01', '2021-02-09', '2022-02-09', '10860500007980', 549),
('326', '02', '2020-11-30', '2021-11-30', '23757', 550),
('326', '03', '2020-08-09', '2021-08-09', '2000073923/24', 551),
('326', '04', '2021-02-06', '2022-02-06', 'NUEVO', 552),
('330', '01', '2020-12-11', '2021-12-11', '10860500007450', 553),
('330', '02', '2020-11-30', '2021-11-30', '23497', 554),
('330', '03', '2020-08-09', '2021-08-09', '2000073923/24', 555),
('330', '04', '2020-12-14', '2021-12-14', '150597736', 556),
('332', '01', '2021-04-21', '2022-04-21', '26544304', 557),
('332', '02', '2020-11-30', '2021-11-30', '23641', 558),
('332', '03', '2020-08-09', '2021-08-09', '2000073923/24', 559),
('332', '04', '2020-07-08', '2021-07-08', '49170778', 560),
('333', '01', '2021-01-20', '2022-01-20', '13945800011920', 561),
('333', '02', '2020-11-30', '2021-11-30', '23730', 562),
('333', '03', '2020-08-09', '2021-08-09', '2000073923/24', 563),
('333', '04', '2021-02-09', '2022-02-09', '151550615', 564),
('338', '01', '2020-10-13', '2021-10-13', '10860500006920', 565),
('338', '02', '2020-11-30', '2021-11-30', '23597', 566),
('338', '03', '2020-08-09', '2021-08-09', '2000073923/24', 567),
('338', '04', '2020-09-17', '2021-09-17', '148933931', 568),
('342', '01', '2021-01-25', '2022-01-25', '10860500007810', 569),
('342', '02', '2020-11-30', '2021-11-30', '23712', 570),
('342', '03', '2020-08-09', '2021-08-09', '2000073923/24', 571),
('342', '04', '2020-12-28', '2021-12-28', '150939686', 572),
('346', '01', '2020-10-22', '2021-10-22', '10860500007000', 573),
('346', '02', '2020-11-30', '2021-11-30', '23642', 574),
('346', '03', '2020-08-09', '2021-08-09', '2000073923/24', 575),
('346', '04', '2020-10-17', '2021-10-17', '149524431', 576),
('349', '01', '2020-12-17', '2021-12-17', '10860500007530', 577),
('349', '02', '2020-11-30', '2021-11-30', '23523', 578),
('349', '03', '2020-08-09', '2021-08-09', '2000073923/24', 579),
('349', '04', '2021-01-12', '2022-01-12', '151217062', 580),
('353', '01', '2021-03-05', '2022-03-05', '14478400001090', 581),
('353', '02', '2020-11-30', '2021-11-30', '23577', 582),
('353', '03', '2020-08-09', '2021-08-09', '2000073923/24', 583),
('353', '04', '2021-03-18', '2022-03-18', '152441270', 584),
('354', '01', '2021-02-11', '2022-02-11', '10860500008010', 585),
('354', '02', '2020-11-30', '2021-11-30', '23524', 586),
('354', '03', '2020-08-09', '2021-08-09', '2000073923/24', 587),
('354', '04', '2021-02-13', '2022-02-13', '152354845', 588),
('356', '01', '2020-08-20', '2021-08-20', '10860500006350', 589),
('356', '02', '2020-11-30', '2021-11-30', '23691', 590),
('356', '03', '2020-08-09', '2021-08-09', '2000073923/24', 591),
('356', '04', '2020-08-30', '2021-08-30', '148552435', 592),
('357', '01', '2021-01-28', '2022-01-28', '10860500007860', 593),
('357', '02', '2020-11-30', '2021-11-30', '23578', 594),
('357', '03', '2020-08-09', '2021-08-09', '2000073923/24', 595),
('357', '04', '2021-01-30', '2022-01-30', '151546560', 596),
('359', '01', '2021-03-03', '2022-03-03', '1505500004530', 597),
('359', '02', '2020-11-30', '2021-11-30', '23744', 598),
('359', '03', '2020-08-09', '2021-08-09', '2000073923/24', 599),
('359', '04', '0000-00-00', '2021-11-26', '150209146', 600),
('360', '01', '0000-00-00', '2021-11-23', '14175100027830', 601),
('360', '02', '2020-11-30', '2021-11-30', '23643', 602),
('360', '03', '2020-08-09', '2021-08-09', '2000073923/24', 603),
('360', '04', '2020-11-24', '2021-11-24', '150191251', 604),
('363', '01', '2020-07-01', '2021-07-01', '10860500005820', 605),
('363', '02', '2020-11-30', '2021-11-30', '23537', 606),
('363', '03', '2020-08-09', '2021-08-09', '2000073923/24', 607),
('363', '04', '2020-07-02', '2021-07-02', '48437514', 608),
('364', '01', '2021-02-02', '2022-02-02', '8059354400', 609),
('364', '02', '2020-11-30', '2021-11-30', '23598', 610),
('364', '03', '2020-08-09', '2021-08-09', '2000073923/24', 611),
('364', '04', '2021-02-10', '2022-02-10', '47492625', 612),
('367', '01', '2020-08-15', '2021-08-15', '145406000065320', 613),
('367', '02', '2020-11-30', '2021-11-30', '23615', 614),
('367', '03', '2020-08-09', '2021-08-09', '2000073923/24', 615),
('367', '04', '2020-08-20', '2021-08-20', '148342981', 616),
('368', '01', '2020-08-26', '2021-08-26', '10860500006370', 617),
('368', '02', '2020-11-30', '2021-11-30', '23538', 618),
('368', '03', '2020-08-09', '2021-08-09', '2000073923/24', 619),
('368', '04', '2020-08-27', '2021-08-27', 'NUEVO', 620),
('370', '01', '2020-11-23', '2021-11-23', '10860500007340', 621),
('370', '02', '2020-11-30', '2021-11-30', '23525', 622),
('370', '03', '2020-08-09', '2021-08-09', '2000073923/24', 623),
('370', '04', '2020-11-12', '2021-11-12', '149987005', 624),
('378', '01', '2021-04-07', '2022-04-07', '15305000000350', 625),
('378', '02', '2020-11-30', '2021-11-30', '23713', 626),
('378', '03', '2020-08-09', '2021-08-09', '2000073923/24', 627),
('378', '04', '2020-07-02', '2021-07-02', '45626598', 628),
('383', '01', '2020-10-17', '2021-10-17', '12894300000680', 629),
('383', '02', '2020-11-30', '2021-11-30', '23699', 630),
('383', '03', '2020-08-09', '2021-08-09', '2000073923/24', 631),
('383', '04', '2020-11-12', '2021-11-12', '149730945', 632),
('386', '01', '2020-10-09', '2021-10-09', '10860500006870', 633),
('386', '02', '2020-11-30', '2021-11-30', '23599', 634),
('386', '03', '2020-08-09', '2021-08-09', '2000073923/24', 635),
('386', '04', '2020-10-13', '2021-10-13', '149446156', 636),
('389', '01', '2020-09-12', '2021-09-12', '10860500006540', 637),
('389', '02', '2020-11-30', '2021-11-30', '23644', 638),
('389', '03', '2020-08-09', '2021-08-09', '2000073923/24', 639),
('389', '04', '2020-09-12', '2021-09-12', '148839831', 640),
('392', '01', '2020-07-05', '2021-07-05', '10860500005850', 641),
('392', '02', '2020-11-30', '2021-11-30', '23539', 642),
('392', '03', '2020-08-09', '2021-08-09', '2000073923/24', 643),
('392', '04', '2020-06-24', '2021-06-24', '48437112', 644),
('394', '01', '2020-10-25', '2021-10-25', '601256744', 645),
('394', '02', '2020-11-30', '2021-11-30', '23700', 646),
('394', '03', '2020-08-09', '2021-08-09', '2000073923/24', 647),
('394', '04', '2020-10-24', '2021-10-24', '149662509', 648),
('396', '01', '2020-11-17', '2021-11-17', '14521900024740', 649),
('396', '02', '2020-11-30', '2021-11-30', '23645', 650),
('396', '03', '2020-08-09', '2021-08-09', '2000073923/24', 651),
('396', '04', '2020-08-01', '2021-08-01', '148036536', 652),
('397', '01', '2021-04-28', '2022-04-28', '14605700008560', 653),
('397', '02', '2020-11-30', '2021-11-30', '23600', 654),
('397', '03', '2020-08-09', '2021-08-09', '2000073923/24', 655),
('397', '04', '2020-06-16', '2021-06-16', '48436750', 656),
('398', '01', '2021-03-06', '2022-03-06', '10860500008240', 657),
('398', '02', '2020-11-30', '2021-11-30', '23729', 658),
('398', '03', '2020-08-09', '2021-08-09', '2000073923/24', 659),
('398', '04', '2021-03-16', '2022-03-16', '152394608', 660),
('400', '01', '2020-07-06', '2021-07-06', '10860500005910', 661),
('400', '02', '2020-11-30', '2021-11-30', '23526', 662),
('400', '03', '2020-08-09', '2021-08-09', '2000073923/24', 663),
('400', '04', '2020-07-09', '2021-07-09', '49170823', 664),
('402', '01', '2021-03-06', '2022-03-06', '4085797300', 665),
('402', '02', '2020-11-30', '2021-11-30', '23506', 666),
('402', '03', '2020-08-09', '2021-08-09', '2000073923/24', 667),
('402', '04', '2021-03-09', '2022-03-09', '152282244', 668),
('403', '01', '2020-10-30', '2021-10-30', '10860500007140', 669),
('403', '02', '2020-11-30', '2021-11-30', '23646', 670),
('403', '03', '2020-08-09', '2021-08-09', '2000073923/24', 671),
('403', '04', '2020-11-25', '2021-11-25', '150213527', 672),
('408', '01', '2021-02-12', '2022-02-12', '10860500008000', 673),
('408', '02', '2020-11-30', '2021-11-30', '23579', 674),
('408', '03', '2020-08-09', '2021-08-09', '2000073923/24', 675),
('408', '04', '2021-03-09', '2022-03-09', '152271183', 676),
('409', '01', '2021-03-03', '2022-03-03', '10860500008190', 677),
('409', '02', '2020-11-30', '2021-11-30', '23540', 678),
('409', '03', '2020-08-09', '2021-08-09', '2000073923/24', 679),
('409', '04', '2020-06-24', '2021-06-24', '48437101', 680),
('413', '01', '2021-01-20', '2022-01-20', '10860500007770', 681),
('413', '02', '2020-11-30', '2021-11-30', '23749', 682),
('413', '03', '2020-08-09', '2021-08-09', '2000073923/24', 683),
('413', '04', '2021-01-28', '2022-01-28', '151453045', 684),
('418', '01', '2020-11-06', '2021-11-06', '79633973', 685),
('418', '02', '2020-11-30', '2021-11-30', '23541', 686),
('418', '03', '2020-08-09', '2021-08-09', '2000073923/24', 687),
('418', '04', '2020-11-08', '2021-11-08', '149925599', 688),
('419', '01', '2020-07-31', '2021-07-31', '10860500006110', 689),
('419', '02', '2020-11-30', '2021-11-30', '23498', 690),
('419', '03', '2020-08-09', '2021-08-09', '2000073923/24', 691),
('419', '04', '2020-07-24', '2021-07-24', '45627374', 692),
('421', '01', '2020-09-15', '2021-09-15', '10860500006610', 693),
('421', '02', '2020-11-30', '2021-11-30', '23527', 694),
('421', '03', '2020-08-09', '2021-08-09', '2000073923/24', 695),
('421', '04', '2020-09-15', '2021-09-15', '148883110', 696),
('422', '01', '2020-11-21', '2021-11-21', '10860500007300', 697),
('422', '02', '2020-11-30', '2021-11-30', '23666', 698),
('422', '03', '2020-08-09', '2021-08-09', '2000073923/24', 699),
('422', '04', '0000-00-00', '2021-11-20', '150127017', 700),
('424', '01', '0000-00-00', '2022-01-15', '117004002280', 701),
('424', '02', '2020-11-30', '2021-11-30', '23728', 702),
('424', '03', '2020-08-09', '2021-08-09', '2000073923/24', 703),
('424', '04', '2021-01-12', '2022-01-12', '151202494', 704),
('425', '01', '2020-12-12', '2021-12-12', '10860500007470', 705),
('425', '02', '2020-11-30', '2021-11-30', '23542', 706),
('425', '03', '2020-08-09', '2021-08-09', '2000073923/24', 707),
('425', '04', '2020-12-18', '2021-12-18', '150715755', 708),
('426', '01', '2020-08-08', '2021-08-08', '10860500006250', 709),
('426', '02', '2020-11-30', '2021-11-30', '23543', 710),
('426', '03', '2020-08-09', '2021-08-09', '2000073923/24', 711),
('426', '04', '2020-07-17', '2021-07-17', '45627213', 712),
('427', '01', '2020-11-19', '2021-11-19', '14175100027710', 713),
('427', '02', '2020-11-30', '2021-11-30', '23601', 714),
('427', '03', '2020-08-09', '2021-08-09', '2000073923/24', 715),
('427', '04', '2020-11-01', '2021-11-01', '149775590', 716),
('428', '01', '2020-08-08', '2021-08-08', '79074804-601495953', 717),
('428', '02', '2020-11-30', '2021-11-30', '23714', 718),
('428', '03', '2020-08-09', '2021-08-09', '2000073923/24', 719),
('428', '04', '2020-09-28', '2021-09-28', '149143612', 720),
('430', '01', '2020-05-28', '2021-05-28', '10860500005620', 721),
('430', '02', '2020-11-30', '2021-11-30', '23692', 722),
('430', '03', '2020-08-09', '2021-08-09', '2000073923/24', 723),
('430', '04', '2020-07-02', '2021-07-02', '45626604', 724),
('431', '01', '2020-09-20', '2021-09-20', '10860500006550', 725),
('431', '02', '2020-11-30', '2021-11-30', '23715', 726),
('431', '03', '2020-08-09', '2021-08-09', '2000073923/24', 727),
('431', '04', '2020-10-05', '2021-10-05', '149282335', 728),
('436', '01', '2021-03-12', '2022-03-12', '10860500008280', 729),
('436', '02', '2020-11-30', '2021-11-30', '23499', 730),
('436', '03', '2020-08-09', '2021-08-09', '2000073923/24', 731),
('436', '04', '2021-02-19', '2022-02-19', '151934726', 732),
('438', '01', '2021-01-21', '2022-01-21', '10860500007780', 733),
('438', '02', '2020-11-30', '2021-11-30', '23563', 734),
('438', '03', '2020-08-09', '2021-08-09', '2000073923/24', 735),
('438', '04', '2021-01-30', '2022-01-30', '15139714', 736),
('443', '01', '2021-01-02', '2022-01-02', '10860500007650', 737),
('443', '02', '2020-11-30', '2021-11-30', '23647', 738),
('443', '03', '2020-08-09', '2021-08-09', '2000073923/24', 739),
('443', '04', '2021-03-06', '2022-03-06', '152224825', 740),
('445', '01', '2020-05-13', '2021-05-13', '10860500005530', 741),
('445', '02', '2020-11-30', '2021-11-30', '23648', 742),
('445', '03', '2020-08-09', '2021-08-09', '2000073923/24', 743),
('445', '04', '2020-10-27', '2021-10-27', '149629538', 744),
('447', '01', '2020-12-09', '2021-12-09', '601287244', 745),
('447', '02', '2020-11-30', '2021-11-30', '23755', 746),
('447', '03', '2020-08-09', '2021-08-09', '2000073923/24', 747),
('447', '04', '2020-12-09', '2021-12-09', '150491312', 748),
('449', '01', '2020-05-17', '2021-05-17', '10860500005540', 749),
('449', '02', '2020-11-30', '2021-11-30', '23602', 750),
('449', '03', '2020-08-09', '2021-08-09', '2000073923/24', 751),
('449', '04', '2020-07-01', '2021-07-01', '48437438', 752),
('451', '01', '2020-04-16', '2021-04-16', '10860500005290', 753),
('451', '02', '2020-11-30', '2021-11-30', '23716', 754),
('451', '03', '2020-08-09', '2021-08-09', '2000073923/24', 755),
('451', '04', '2020-07-01', '2021-07-01', '45626518', 756),
('452', '01', '2020-11-17', '2021-11-17', '14521900024720', 757),
('452', '02', '2020-11-30', '2021-11-30', '23616', 758),
('452', '03', '2020-08-09', '2021-08-09', '2000073923/24', 759),
('452', '04', '2020-11-30', '2021-11-30', '150290886', 760),
('454', '01', '2020-12-16', '2021-12-16', '10860500007510', 761),
('454', '02', '2020-11-30', '2021-11-30', '23727', 762),
('454', '03', '2020-08-09', '2021-08-09', '2000073923/24', 763),
('454', '04', '2020-12-19', '2021-12-19', '150732944', 764),
('456', '01', '2021-01-18', '2022-01-18', '1411610000930', 765),
('456', '02', '2020-11-30', '2021-11-30', '23750', 766),
('456', '03', '2020-08-09', '2021-08-09', '2000073923/24', 767),
('456', '04', '2021-01-20', '2022-01-20', '151343480', 768),
('459', '01', '2020-07-03', '2021-07-03', '76483830-600375496', 769),
('459', '02', '2020-11-30', '2021-11-30', '23726', 770),
('459', '03', '2020-08-09', '2021-08-09', '2000073923/24', 771),
('459', '04', '2020-07-04', '2021-07-04', '45626683', 772),
('463', '01', '2020-09-28', '2021-09-28', '14176100025530', 773),
('463', '02', '2020-11-30', '2021-11-30', '23649', 774),
('463', '03', '2020-08-09', '2021-08-09', '2000073923/24', 775),
('463', '04', '2020-09-28', '2021-09-28', '149144146', 776),
('469', '01', '2021-02-25', '2022-02-25', '10860500008150', 777),
('469', '02', '2020-11-30', '2021-11-30', '23580', 778),
('469', '03', '2020-08-09', '2021-08-09', '2000073923/24', 779),
('469', '04', '2021-03-06', '2022-03-06', '152221578', 780),
('470', '01', '2020-05-08', '2021-05-08', '10860500005470', 781),
('470', '02', '2020-11-30', '2021-11-30', '23564', 782),
('470', '03', '2020-08-09', '2021-08-09', '2000073923/24', 783),
('470', '04', '2020-06-20', '2021-06-20', '45626140', 784),
('472', '01', '2021-04-16', '2022-04-16', '3106846300', 785),
('472', '02', '2020-11-30', '2021-11-30', '23507', 786),
('472', '03', '2020-08-09', '2021-08-09', '2000073923/24', 787),
('472', '04', '2020-06-28', '2021-06-28', '147244068', 788),
('474', '01', '2020-10-26', '2021-10-26', '10860500007090', 789),
('474', '02', '2020-11-30', '2021-11-30', '23528', 790),
('474', '03', '2020-08-09', '2021-08-09', '2000073923/24', 791),
('474', '04', '2020-10-29', '2021-10-29', '149748032', 792),
('477', '01', '2020-06-02', '2021-06-02', '10860500005640', 793),
('477', '02', '2020-11-30', '2021-11-30', '23650', 794),
('477', '03', '2020-08-09', '2021-08-09', '2000073923/24', 795),
('477', '04', '2020-06-27', '2021-06-27', '45626404', 796),
('479', '01', '2020-12-31', '2021-12-31', '14823700002840', 797),
('479', '02', '2020-11-30', '2021-11-30', '23651', 798),
('479', '03', '2020-08-09', '2021-08-09', '2000073923/24', 799),
('479', '04', '0000-00-00', '2022-01-12', '151202307', 800),
('483', '01', '0000-00-00', '2021-09-21', '10860500006680', 801),
('483', '02', '2020-11-30', '2021-11-30', '23652', 802),
('483', '03', '2020-08-09', '2021-08-09', '2000073923/24', 803),
('483', '04', '2020-09-19', '2021-09-19', '148979399', 804),
('485', '01', '2021-04-10', '2022-04-10', '14541100106770', 805),
('485', '02', '2020-11-30', '2021-11-30', '23603', 806),
('485', '03', '2020-08-09', '2021-08-09', '2000073923/24', 807),
('485', '04', '2020-06-04', '2021-06-04', '48436169', 808),
('486', '01', '2020-05-02', '2021-05-02', '78218392', 809),
('486', '02', '2020-11-30', '2021-11-30', '23717', 810),
('486', '03', '2020-08-09', '2021-08-09', '2000073923/24', 811),
('486', '04', '2020-09-26', '2021-09-26', '149128152', 812),
('490', '01', '2021-02-28', '2022-02-28', '10860500008170', 813),
('490', '02', '2020-11-30', '2021-11-30', '23529', 814),
('490', '03', '2020-08-09', '2021-08-09', '2000073923/24', 815),
('490', '04', '2020-06-01', '2021-06-01', '45625368', 816),
('493', '01', '2020-12-05', '2021-12-05', '79816433-601552272', 817),
('493', '02', '2020-11-30', '2021-11-30', '23693', 818),
('493', '03', '2020-08-09', '2021-08-09', '2000073923/24', 819),
('493', '04', '2020-12-05', '2021-12-05', '150411235', 820),
('498', '01', '2020-12-29', '2021-12-29', '901288008', 821),
('498', '02', '2020-11-30', '2021-11-30', '23678', 822),
('498', '03', '2020-08-09', '2021-08-09', '2000073923/24', 823),
('498', '04', '2020-12-21', '2021-12-21', '150514630', 824),
('502', '01', '2020-05-11', '2021-05-11', '10860500005490', 825),
('502', '02', '2020-11-30', '2021-11-30', '23530', 826),
('502', '03', '2020-08-09', '2021-08-09', '2000073923/24', 827),
('502', '04', '2020-06-08', '2021-06-08', '48436395', 828),
('503', '01', '2020-05-22', '2021-05-22', '10860500005590', 829),
('503', '02', '2020-11-30', '2021-11-30', '23544', 830),
('503', '03', '2020-08-09', '2021-08-09', '2000073923/24', 831),
('503', '04', '2020-05-28', '2021-05-28', 'NUEVO', 832),
('506', '01', '2020-10-26', '2021-10-26', '10860500007100', 833),
('506', '02', '2020-11-30', '2021-11-30', '23617', 834);
INSERT INTO `veh_doc` (`id_movil`, `id_documento`, `fecha_exp`, `fecha_ven`, `numero`, `idcons`) VALUES
('506', '03', '2020-08-09', '2021-08-09', '2000073923/24', 835),
('506', '04', '2020-10-21', '2021-10-21', '149602996', 836),
('508', '01', '2020-09-29', '2021-09-29', '10860500006760', 837),
('508', '02', '2020-11-30', '2021-11-30', '23531', 838),
('508', '03', '2020-08-09', '2021-08-09', '2000073923/24', 839),
('508', '04', '2020-09-27', '2021-09-27', '149139074', 840),
('509', '01', '2021-04-24', '2022-04-24', '10860500008550', 841),
('509', '02', '2020-11-30', '2021-11-30', '23565', 842),
('509', '03', '2020-08-09', '2021-08-09', '2000073923/24', 843),
('509', '04', '2020-07-08', '2021-07-08', '45626855', 844),
('512', '01', '2021-02-28', '2022-02-28', '10860500008160', 845),
('512', '02', '2020-11-30', '2021-11-30', '23667', 846),
('512', '03', '2020-08-09', '2021-08-09', '2000073923/24', 847),
('512', '04', '2020-06-23', '2021-06-23', '48437032', 848),
('514', '01', '2020-09-19', '2021-09-19', '10860500006630', 849),
('514', '02', '2020-11-30', '2021-11-30', '23545', 850),
('514', '03', '2020-08-09', '2021-08-09', '2000073923/24', 851),
('514', '04', '2020-12-29', '2021-12-29', '150953185', 852),
('517', '01', '2021-04-21', '2022-04-21', '14478400001150', 853),
('517', '02', '2020-11-30', '2021-11-30', '23581', 854),
('517', '03', '2020-08-09', '2021-08-09', '2000073923/24', 855),
('517', '04', '2020-07-03', '2021-07-03', '48437587', 856),
('518', '01', '2020-06-02', '2021-06-02', '24682597', 857),
('518', '02', '2020-11-30', '2021-11-30', '23758', 858),
('518', '03', '2020-08-09', '2021-08-09', '2000073923/24', 859),
('518', '04', '2020-07-21', '2021-07-21', '49171241', 860),
('521', '01', '2021-03-20', '2022-03-20', '10860500008380', 861),
('521', '02', '2020-11-30', '2021-11-30', '23500', 862),
('521', '03', '2020-08-09', '2021-08-09', '2000073923/24', 863),
('521', '04', '2020-06-08', '2021-06-08', '45625665', 864),
('526', '01', '2021-04-05', '2022-04-05', '10860500008480', 865),
('526', '02', '2020-11-30', '2021-11-30', '23582', 866),
('526', '03', '2020-08-09', '2021-08-09', '2000073923/24', 867),
('526', '04', '2020-07-04', '2021-07-04', '147466476', 868),
('527', '01', '2021-03-09', '2022-03-09', '10860500008290', 869),
('527', '02', '2020-11-30', '2021-11-30', '23725', 870),
('527', '03', '2020-08-09', '2021-08-09', '2000073923/24', 871),
('527', '04', '2021-03-09', '2022-03-09', '152275281', 872),
('534', '01', '2020-10-23', '2021-10-23', '10860500007040', 873),
('534', '02', '2020-11-30', '2021-11-30', '23653', 874),
('534', '03', '2020-08-09', '2021-08-09', '2000073923/24', 875),
('534', '04', '2020-11-03', '2021-11-03', '149819206', 876),
('535', '01', '2020-10-17', '2021-10-17', '10860500006950', 877),
('535', '02', '2020-11-30', '2021-11-30', '23568', 878),
('535', '03', '2020-08-09', '2021-08-09', '2000073923/24', 879),
('535', '04', '2020-10-21', '2021-10-21', '149567697', 880),
('536', '01', '2020-11-05', '2021-11-05', '79615536-601538574', 881),
('536', '02', '2020-11-30', '2021-11-30', '23694', 882),
('536', '03', '2020-08-09', '2021-08-09', '2000073923/24', 883),
('536', '04', '2020-11-03', '2021-11-03', '149741046', 884),
('537', '01', '2020-09-21', '2021-09-21', '10860500006690', 885),
('537', '02', '2020-11-30', '2021-11-30', '23724', 886),
('537', '03', '2020-08-09', '2021-08-09', '2000073923/24', 887),
('537', '04', '2020-10-06', '2021-10-06', '149307360', 888),
('540', '01', '2021-01-25', '2022-01-25', '10860500007820', 889),
('540', '02', '2020-11-30', '2021-11-30', '23654', 890),
('540', '03', '2020-08-09', '2021-08-09', '2000073923/24', 891),
('540', '04', '2021-03-12', '2022-03-12', '152337554', 892),
('541', '01', '2020-11-11', '2021-11-11', '10860500007200', 893),
('541', '02', '2020-11-30', '2021-11-30', '23756', 894),
('541', '03', '2020-08-09', '2021-08-09', '2000073923/24', 895),
('541', '04', '2021-12-11', '2022-12-11', 'NUEVO', 896),
('542', '01', '2020-05-02', '2021-05-02', '14175100017160', 897),
('542', '02', '2020-11-30', '2021-11-30', '23701', 898),
('542', '03', '2020-08-09', '2021-08-09', '2000073923/24', 899),
('542', '04', '0000-00-00', '2021-07-03', '48437561', 900),
('543', '01', '0000-00-00', '2021-10-22', '10860500007010', 901),
('543', '02', '2020-11-30', '2021-11-30', '23723', 902),
('543', '03', '2020-08-09', '2021-08-09', '2000073923/24', 903),
('543', '04', '2020-10-13', '2021-10-13', '149438859', 904),
('545', '01', '2020-12-22', '2021-12-22', '10860500007580', 905),
('545', '02', '2020-11-30', '2021-11-30', '23583', 906),
('545', '03', '2020-08-09', '2021-08-09', '2000073923/24', 907),
('545', '04', '2020-12-23', '2021-12-23', '150822093', 908),
('546', '01', '2020-12-25', '2021-12-25', '601562742', 909),
('546', '02', '2020-11-30', '2021-11-30', '23584', 910),
('546', '03', '2020-08-09', '2021-08-09', '2000073923/24', 911),
('546', '04', '2020-06-08', '2021-06-08', '48436390', 912),
('547', '01', '2021-01-12', '2022-01-12', '80169363-601310775', 913),
('547', '02', '2020-11-30', '2021-11-30', '23763', 914),
('547', '03', '2020-08-09', '2021-08-09', '2000073923/24', 915),
('547', '04', '2022-01-22', '2023-01-22', 'NUEVO', 916),
('550', '01', '2020-11-26', '2021-11-26', '79627977-601277472', 917),
('550', '02', '2020-11-30', '2021-11-30', '23718', 918),
('550', '03', '2020-08-09', '2021-08-09', '2000073923/24', 919),
('550', '04', '2020-11-26', '2021-11-26', '150223486', 920),
('553', '01', '2021-01-27', '2022-01-27', '3102787800', 921),
('553', '02', '2020-11-30', '2021-11-30', '23604', 922),
('553', '03', '2020-08-09', '2021-08-09', '2000073923/24', 923),
('553', '04', '2020-12-26', '2021-12-26', '150895490', 924),
('554', '01', '2021-01-03', '2022-01-03', '600483325', 925),
('554', '02', '2020-11-30', '2021-11-30', '23605', 926),
('554', '03', '2020-08-09', '2021-08-09', '2000073923/24', 927),
('554', '04', '2021-01-19', '2022-01-19', '151324004', 928),
('560', '01', '2020-07-13', '2021-07-13', '10860500005950', 929),
('560', '02', '2020-11-30', '2021-11-30', '23655', 930),
('560', '03', '2020-08-09', '2021-08-09', '2000073923/24', 931),
('560', '04', '2020-08-15', '2021-08-15', '148289831', 932),
('561', '01', '2020-12-04', '2021-12-04', '10860500007420', 933),
('561', '02', '2020-11-30', '2021-11-30', '23532', 934),
('561', '03', '2020-08-09', '2021-08-09', '2000073923/24', 935),
('561', '04', '2020-06-01', '2021-06-01', '45625360', 936),
('562', '01', '2020-12-07', '2021-12-07', '10860500007430', 937),
('562', '02', '2020-11-30', '2021-11-30', '23668', 938),
('562', '03', '2020-08-09', '2021-08-09', '2000073923/24', 939),
('562', '04', '2020-12-30', '2021-12-30', '1520890039', 940),
('564', '01', '2021-02-10', '2022-02-10', '13251500018200', 941),
('564', '02', '2020-11-30', '2021-11-30', '23508', 942),
('564', '03', '2020-08-09', '2021-08-09', '2000073923/24', 943),
('564', '04', '2021-02-08', '2022-02-08', '151728124', 944),
('566', '01', '2020-04-24', '2021-04-24', '10860500005330', 945),
('566', '02', '2020-11-30', '2021-11-30', '23566', 946),
('566', '03', '2020-08-09', '2021-08-09', '2000073923/24', 947),
('566', '04', '2020-06-16', '2021-06-16', '45625985', 948),
('567', '01', '2020-12-10', '2021-12-10', '3552147282302', 949),
('567', '02', '2020-11-30', '2021-11-30', '23722', 950),
('567', '03', '2020-08-09', '2021-08-09', '2000073923/24', 951),
('567', '04', '2021-02-16', '2022-02-16', '151635639', 952),
('568', '01', '2020-05-21', '2021-05-21', '14175100016920', 953),
('568', '02', '2020-11-30', '2021-11-30', '23509', 954),
('568', '03', '2020-08-09', '2021-08-09', '2000073923/24', 955),
('568', '04', '2020-06-19', '2021-06-19', '48436877', 956),
('571', '01', '2020-10-01', '2021-10-01', '601521778', 957),
('571', '02', '2020-11-30', '2021-11-30', '23695', 958),
('571', '03', '2020-08-09', '2021-08-09', '2000073923/24', 959),
('571', '04', '2020-10-01', '2021-10-01', '149219892', 960),
('572', '01', '2020-11-20', '2021-11-20', '10860500007270', 961),
('572', '02', '2020-11-30', '2021-11-30', '23546', 962),
('572', '03', '2020-08-09', '2021-08-09', '2000073923/24', 963),
('572', '04', '2020-11-19', '2021-11-19', '150107870', 964),
('576', '01', '2020-09-12', '2021-09-12', '1860500006580', 965),
('576', '02', '2020-11-30', '2021-11-30', '23669', 966),
('576', '03', '2020-08-09', '2021-08-09', '2000073923/24', 967),
('576', '04', '2020-10-04', '2021-10-04', '149227596', 968),
('580', '01', '2021-03-30', '2022-03-30', '15046000001310', 969),
('580', '02', '2020-11-30', '2021-11-30', '23670', 970),
('580', '03', '2020-08-09', '2021-08-09', '2000073923/24', 971),
('580', '04', '2020-07-14', '2021-07-14', '49171003', 972),
('582', '01', '2020-07-29', '2021-07-29', '10860500006150', 973),
('582', '02', '2020-11-30', '2021-11-30', '23606', 974),
('582', '03', '2020-08-09', '2021-08-09', '2000073923/24', 975),
('582', '04', '2020-08-03', '2021-08-03', '148069081', 976),
('589', '01', '2020-05-13', '2021-05-13', '10860500005500', 977),
('589', '02', '2020-11-30', '2021-11-30', '23567', 978),
('589', '03', '2020-08-09', '2021-08-09', '2000073923/24', 979),
('589', '04', '2020-06-10', '2021-06-10', '48436549', 980),
('590', '01', '2020-09-10', '2021-09-10', '10860500006530', 981),
('590', '02', '2020-11-30', '2021-11-30', '23745', 982),
('590', '03', '2020-08-09', '2021-08-09', '2000073923/24', 983),
('590', '04', '2020-09-25', '2021-09-25', '148846218', 984),
('591', '01', '2020-06-17', '2021-06-17', '10860500005740', 985),
('591', '02', '2020-11-30', '2021-11-30', '23547', 986),
('591', '03', '2020-08-09', '2021-08-09', '2000073923/24', 987),
('591', '04', '2020-07-01', '2021-07-01', '48437398', 988),
('592', '01', '2021-01-29', '2022-01-29', '150460001040', 989),
('592', '02', '2020-11-30', '2021-11-30', '23679', 990),
('592', '03', '2020-08-09', '2021-08-09', '2000073923/24', 991),
('592', '04', '2020-07-12', '2021-07-12', '45627025', 992),
('595', '01', '2020-12-12', '2021-12-12', '10860500007460', 993),
('595', '02', '2020-11-30', '2021-11-30', '23510', 994),
('595', '03', '2020-08-09', '2021-08-09', '2000073923/24', 995),
('595', '04', '2020-12-12', '2021-12-12', '150563862', 996),
('609', '01', '2020-12-30', '2021-12-30', '3101439100', 997),
('609', '02', '2020-11-30', '2021-11-30', '23607', 998),
('609', '03', '2020-08-09', '2021-08-09', '2000073923/24', 999),
('609', '04', '0000-00-00', '2021-06-13', '48436677', 1000),
('612', '01', '0000-00-00', '2021-09-27', '10860500006750', 1001),
('612', '02', '2020-11-30', '2021-11-30', '23618', 1002),
('612', '03', '2020-08-09', '2021-08-09', '2000073923/24', 1003),
('612', '04', '2020-10-01', '2021-10-01', '149212265', 1004),
('615', '01', '2021-03-23', '2022-03-23', '10860500008390', 1005),
('615', '02', '2020-11-30', '2021-11-30', '23511', 1006),
('615', '03', '2020-08-09', '2021-08-09', '2000073923/24', 1007),
('615', '04', '2020-06-11', '2021-06-11', '45625818', 1008),
('616', '01', '2020-09-29', '2021-09-29', '25389260', 1009),
('616', '02', '2020-11-30', '2021-11-30', '23656', 1010),
('616', '03', '2020-08-09', '2021-08-09', '2000073923/24', 1011),
('616', '04', '2020-10-28', '2021-10-28', '149722067', 1012),
('620', '01', '2020-08-29', '2021-08-29', '10860500006410', 1013),
('620', '02', '2020-11-30', '2021-11-30', '23719', 1014),
('620', '03', '2020-08-09', '2021-08-09', '2000073923/24', 1015),
('620', '04', '2020-09-22', '2021-09-22', '149043141', 1016),
('623', '01', '2020-09-24', '2021-09-24', '10860500006720', 1017),
('623', '02', '2020-11-30', '2021-11-30', '23501', 1018),
('623', '03', '2020-08-09', '2021-08-09', '2000073923/24', 1019),
('623', '04', '2020-10-05', '2021-10-05', '149284477', 1020),
('625', '01', '2020-10-10', '2021-10-10', '10860500006900', 1021),
('625', '02', '2020-11-30', '2021-11-30', '23608', 1022),
('625', '03', '2020-08-09', '2021-08-09', '2000073923/24', 1023),
('625', '04', '2020-10-13', '2021-10-13', '149442117', 1024),
('627', '01', '2020-05-27', '2021-05-27', '10860500005600', 1025),
('627', '02', '2020-11-30', '2021-11-30', '23657', 1026),
('627', '03', '2020-08-09', '2021-08-09', '2000073923/24', 1027),
('627', '04', '2020-01-31', '2021-01-30', '47492313', 1028),
('630', '01', '2020-10-28', '2021-10-28', '10860500007110', 1029),
('630', '02', '2020-11-30', '2021-11-30', '23721', 1030),
('630', '03', '2020-08-09', '2021-08-09', '2000073923/24', 1031),
('630', '04', '2020-12-02', '2021-12-02', '150359132', 1032);

-- --------------------------------------------------------

--
-- Estructura para la vista `veh_dias_mora`
--
DROP TABLE IF EXISTS `veh_dias_mora`;

CREATE ALGORITHM=UNDEFINED DEFINER=`coomoc`@`localhost` SQL SECURITY DEFINER VIEW `veh_dias_mora`  AS  select 1 AS `id_movil`,1 AS `placa`,1 AS `clase`,1 AS `id_marca`,1 AS `marca`,1 AS `referencia`,1 AS `tipo`,1 AS `motor`,1 AS `serie`,1 AS `color`,1 AS `modelo`,1 AS `pago_hasta`,1 AS `dias_mora`,1 AS `grupo` ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `accidente`
--
ALTER TABLE `accidente`
  ADD PRIMARY KEY (`id_acc`);

--
-- Indices de la tabla `acc_group_user`
--
ALTER TABLE `acc_group_user`
  ADD PRIMARY KEY (`id_group`);

--
-- Indices de la tabla `acc_grupo`
--
ALTER TABLE `acc_grupo`
  ADD PRIMARY KEY (`id_grupo`);

--
-- Indices de la tabla `acc_opcion`
--
ALTER TABLE `acc_opcion`
  ADD PRIMARY KEY (`id_opcion`);

--
-- Indices de la tabla `acc_permiso`
--
ALTER TABLE `acc_permiso`
  ADD PRIMARY KEY (`id_permiso`);

--
-- Indices de la tabla `acc_usuario`
--
ALTER TABLE `acc_usuario`
  ADD PRIMARY KEY (`id_usr`);

--
-- Indices de la tabla `actual_doc`
--
ALTER TABLE `actual_doc`
  ADD PRIMARY KEY (`id_act`),
  ADD KEY `id_eps` (`id_eps`),
  ADD KEY `id_conductor` (`id_conductor`),
  ADD KEY `id_doc` (`id_doc`);

--
-- Indices de la tabla `aportes`
--
ALTER TABLE `aportes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `compania_poliza`
--
ALTER TABLE `compania_poliza`
  ADD PRIMARY KEY (`id_compoliza`);

--
-- Indices de la tabla `comprobante`
--
ALTER TABLE `comprobante`
  ADD PRIMARY KEY (`id_comp`);

--
-- Indices de la tabla `comp_egresos`
--
ALTER TABLE `comp_egresos`
  ADD PRIMARY KEY (`id_egreso`);

--
-- Indices de la tabla `comp_servicio`
--
ALTER TABLE `comp_servicio`
  ADD PRIMARY KEY (`id_comp_serv`);

--
-- Indices de la tabla `concepto_pago`
--
ALTER TABLE `concepto_pago`
  ADD PRIMARY KEY (`id_con_pago`);

--
-- Indices de la tabla `conductor`
--
ALTER TABLE `conductor`
  ADD PRIMARY KEY (`id_conductor`);

--
-- Indices de la tabla `consecutivo`
--
ALTER TABLE `consecutivo`
  ADD PRIMARY KEY (`id_consecutivo`);

--
-- Indices de la tabla `contractual`
--
ALTER TABLE `contractual`
  ADD PRIMARY KEY (`id_contra`);

--
-- Indices de la tabla `con_doc`
--
ALTER TABLE `con_doc`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_conductor` (`id_conductor`),
  ADD KEY `id_doc` (`id_doc`);

--
-- Indices de la tabla `detalle_contra`
--
ALTER TABLE `detalle_contra`
  ADD PRIMARY KEY (`id_deta_contra`),
  ADD KEY `id_contra` (`id_contra`,`id_movil`),
  ADD KEY `id_movil` (`id_movil`),
  ADD KEY `id_contra_2` (`id_contra`);

--
-- Indices de la tabla `detelle_pagos`
--
ALTER TABLE `detelle_pagos`
  ADD PRIMARY KEY (`id_detalle_pago`);

--
-- Indices de la tabla `diarios`
--
ALTER TABLE `diarios`
  ADD PRIMARY KEY (`id_diario`);

--
-- Indices de la tabla `directorio`
--
ALTER TABLE `directorio`
  ADD PRIMARY KEY (`telefono`);

--
-- Indices de la tabla `documento`
--
ALTER TABLE `documento`
  ADD PRIMARY KEY (`id_doc`);

--
-- Indices de la tabla `documentos_v`
--
ALTER TABLE `documentos_v`
  ADD PRIMARY KEY (`id_docv`);

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`id_empresa`);

--
-- Indices de la tabla `entidad_salud`
--
ALTER TABLE `entidad_salud`
  ADD PRIMARY KEY (`id_eps`);

--
-- Indices de la tabla `festivos`
--
ALTER TABLE `festivos`
  ADD PRIMARY KEY (`fecha`);

--
-- Indices de la tabla `formatos`
--
ALTER TABLE `formatos`
  ADD PRIMARY KEY (`idFormato`);

--
-- Indices de la tabla `historial_movil`
--
ALTER TABLE `historial_movil`
  ADD PRIMARY KEY (`id_historial`);

--
-- Indices de la tabla `historico_conductor`
--
ALTER TABLE `historico_conductor`
  ADD PRIMARY KEY (`idHistoCondu`);

--
-- Indices de la tabla `linea_atencion`
--
ALTER TABLE `linea_atencion`
  ADD PRIMARY KEY (`id_linea`);

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`idm`);

--
-- Indices de la tabla `mensaje105`
--
ALTER TABLE `mensaje105`
  ADD PRIMARY KEY (`id_msj`);

--
-- Indices de la tabla `movil_desvinculados`
--
ALTER TABLE `movil_desvinculados`
  ADD PRIMARY KEY (`id_des`);

--
-- Indices de la tabla `movimiento_diarios`
--
ALTER TABLE `movimiento_diarios`
  ADD PRIMARY KEY (`id_mov_diarios`);

--
-- Indices de la tabla `movi_contra`
--
ALTER TABLE `movi_contra`
  ADD PRIMARY KEY (`id_mov`);

--
-- Indices de la tabla `noficacionVencidos`
--
ALTER TABLE `noficacionVencidos`
  ADD PRIMARY KEY (`id_notif`);

--
-- Indices de la tabla `novedad_diario`
--
ALTER TABLE `novedad_diario`
  ADD PRIMARY KEY (`id_nov`);

--
-- Indices de la tabla `novedad_servicio`
--
ALTER TABLE `novedad_servicio`
  ADD PRIMARY KEY (`id_nov_serv`);

--
-- Indices de la tabla `otros_pagos`
--
ALTER TABLE `otros_pagos`
  ADD PRIMARY KEY (`id_otros`);

--
-- Indices de la tabla `pago_descuento`
--
ALTER TABLE `pago_descuento`
  ADD PRIMARY KEY (`id_descuento`);

--
-- Indices de la tabla `pago_taller`
--
ALTER TABLE `pago_taller`
  ADD PRIMARY KEY (`id_ptaller`);

--
-- Indices de la tabla `planilla`
--
ALTER TABLE `planilla`
  ADD PRIMARY KEY (`id_planilla`);

--
-- Indices de la tabla `propietario`
--
ALTER TABLE `propietario`
  ADD PRIMARY KEY (`id_prop`);

--
-- Indices de la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`id_ser`);

--
-- Indices de la tabla `servicio_h`
--
ALTER TABLE `servicio_h`
  ADD PRIMARY KEY (`id_ser`);

--
-- Indices de la tabla `servicio_h2`
--
ALTER TABLE `servicio_h2`
  ADD PRIMARY KEY (`id_ser`);

--
-- Indices de la tabla `simit`
--
ALTER TABLE `simit`
  ADD PRIMARY KEY (`id_simit`),
  ADD KEY `id_conductor` (`id_conductor`);

--
-- Indices de la tabla `suspension`
--
ALTER TABLE `suspension`
  ADD PRIMARY KEY (`id_susp`);

--
-- Indices de la tabla `tarifas`
--
ALTER TABLE `tarifas`
  ADD PRIMARY KEY (`id_tarifa`);

--
-- Indices de la tabla `tarjeta_control`
--
ALTER TABLE `tarjeta_control`
  ADD PRIMARY KEY (`id_tarjeta`),
  ADD KEY `id_conductor` (`id_conductor`),
  ADD KEY `id_empresa` (`id_empresa`),
  ADD KEY `id_vehi_cond` (`fecha_vigencia`),
  ADD KEY `id_doc_ref` (`id_doc_ref`);

--
-- Indices de la tabla `tipov`
--
ALTER TABLE `tipov`
  ADD PRIMARY KEY (`id_tipov`);

--
-- Indices de la tabla `tipo_accidente`
--
ALTER TABLE `tipo_accidente`
  ADD PRIMARY KEY (`id_tipo_a`);

--
-- Indices de la tabla `tipo_linea`
--
ALTER TABLE `tipo_linea`
  ADD PRIMARY KEY (`id_tipo_linea`);

--
-- Indices de la tabla `tipo_taxi`
--
ALTER TABLE `tipo_taxi`
  ADD PRIMARY KEY (`id_movil`),
  ADD KEY `id_movil` (`id_movil`),
  ADD KEY `id_tipov` (`id_tipov`);

--
-- Indices de la tabla `transaccion`
--
ALTER TABLE `transaccion`
  ADD PRIMARY KEY (`id_tran`);

--
-- Indices de la tabla `valor_poliza`
--
ALTER TABLE `valor_poliza`
  ADD PRIMARY KEY (`id_valorp`);

--
-- Indices de la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD PRIMARY KEY (`id_movil`);

--
-- Indices de la tabla `veh_doc`
--
ALTER TABLE `veh_doc`
  ADD PRIMARY KEY (`idcons`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `accidente`
--
ALTER TABLE `accidente`
  MODIFY `id_acc` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id interno del reporte de accidente';

--
-- AUTO_INCREMENT de la tabla `acc_group_user`
--
ALTER TABLE `acc_group_user`
  MODIFY `id_group` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `acc_grupo`
--
ALTER TABLE `acc_grupo`
  MODIFY `id_grupo` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `acc_opcion`
--
ALTER TABLE `acc_opcion`
  MODIFY `id_opcion` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT de la tabla `acc_permiso`
--
ALTER TABLE `acc_permiso`
  MODIFY `id_permiso` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1503;

--
-- AUTO_INCREMENT de la tabla `acc_usuario`
--
ALTER TABLE `acc_usuario`
  MODIFY `id_usr` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `actual_doc`
--
ALTER TABLE `actual_doc`
  MODIFY `id_act` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `aportes`
--
ALTER TABLE `aportes`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `compania_poliza`
--
ALTER TABLE `compania_poliza`
  MODIFY `id_compoliza` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `comprobante`
--
ALTER TABLE `comprobante`
  MODIFY `id_comp` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `comp_egresos`
--
ALTER TABLE `comp_egresos`
  MODIFY `id_egreso` int(5) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `comp_servicio`
--
ALTER TABLE `comp_servicio`
  MODIFY `id_comp_serv` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `concepto_pago`
--
ALTER TABLE `concepto_pago`
  MODIFY `id_con_pago` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `conductor`
--
ALTER TABLE `conductor`
  MODIFY `id_conductor` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=285;

--
-- AUTO_INCREMENT de la tabla `consecutivo`
--
ALTER TABLE `consecutivo`
  MODIFY `id_consecutivo` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `contractual`
--
ALTER TABLE `contractual`
  MODIFY `id_contra` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `con_doc`
--
ALTER TABLE `con_doc`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1141;

--
-- AUTO_INCREMENT de la tabla `detalle_contra`
--
ALTER TABLE `detalle_contra`
  MODIFY `id_deta_contra` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detelle_pagos`
--
ALTER TABLE `detelle_pagos`
  MODIFY `id_detalle_pago` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `documentos_v`
--
ALTER TABLE `documentos_v`
  MODIFY `id_docv` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `empresa`
--
ALTER TABLE `empresa`
  MODIFY `id_empresa` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `entidad_salud`
--
ALTER TABLE `entidad_salud`
  MODIFY `id_eps` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `formatos`
--
ALTER TABLE `formatos`
  MODIFY `idFormato` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `historial_movil`
--
ALTER TABLE `historial_movil`
  MODIFY `id_historial` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `historico_conductor`
--
ALTER TABLE `historico_conductor`
  MODIFY `idHistoCondu` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `linea_atencion`
--
ALTER TABLE `linea_atencion`
  MODIFY `id_linea` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `marca`
--
ALTER TABLE `marca`
  MODIFY `idm` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `mensaje105`
--
ALTER TABLE `mensaje105`
  MODIFY `id_msj` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `movil_desvinculados`
--
ALTER TABLE `movil_desvinculados`
  MODIFY `id_des` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `movimiento_diarios`
--
ALTER TABLE `movimiento_diarios`
  MODIFY `id_mov_diarios` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `movi_contra`
--
ALTER TABLE `movi_contra`
  MODIFY `id_mov` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `noficacionVencidos`
--
ALTER TABLE `noficacionVencidos`
  MODIFY `id_notif` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `novedad_diario`
--
ALTER TABLE `novedad_diario`
  MODIFY `id_nov` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `novedad_servicio`
--
ALTER TABLE `novedad_servicio`
  MODIFY `id_nov_serv` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `otros_pagos`
--
ALTER TABLE `otros_pagos`
  MODIFY `id_otros` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `planilla`
--
ALTER TABLE `planilla`
  MODIFY `id_planilla` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `servicio`
--
ALTER TABLE `servicio`
  MODIFY `id_ser` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `servicio_h`
--
ALTER TABLE `servicio_h`
  MODIFY `id_ser` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `servicio_h2`
--
ALTER TABLE `servicio_h2`
  MODIFY `id_ser` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `simit`
--
ALTER TABLE `simit`
  MODIFY `id_simit` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `suspension`
--
ALTER TABLE `suspension`
  MODIFY `id_susp` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tarifas`
--
ALTER TABLE `tarifas`
  MODIFY `id_tarifa` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tarjeta_control`
--
ALTER TABLE `tarjeta_control`
  MODIFY `id_tarjeta` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipov`
--
ALTER TABLE `tipov`
  MODIFY `id_tipov` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `tipo_accidente`
--
ALTER TABLE `tipo_accidente`
  MODIFY `id_tipo_a` int(3) NOT NULL AUTO_INCREMENT COMMENT 'id interna del tipo de accidente';

--
-- AUTO_INCREMENT de la tabla `tipo_linea`
--
ALTER TABLE `tipo_linea`
  MODIFY `id_tipo_linea` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `transaccion`
--
ALTER TABLE `transaccion`
  MODIFY `id_tran` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `valor_poliza`
--
ALTER TABLE `valor_poliza`
  MODIFY `id_valorp` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `veh_doc`
--
ALTER TABLE `veh_doc`
  MODIFY `idcons` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1033;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
