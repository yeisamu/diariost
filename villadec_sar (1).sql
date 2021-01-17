-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 17-01-2021 a las 14:26:24
-- Versión del servidor: 5.7.32-cll-lve
-- Versión de PHP: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `villadec_sar`
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
  `estado` int(2) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(2, 'GESTION DE USUARIOS DEL SISTEMAS', 'Gestión de los Usuarios del Sistema y Sus Permisos', 4, 'usuario/gesusu.php', 1, '', '', ''),
(4, 'CONDUCTORES Y DOCUMENTOS', 'Gestion de Conductores y Vinculacion de Documentos', 1, 'gespersona/gescon.php', 1, '', '', ''),
(5, 'GESTION DE TARJETA y ACTUALIZACION', 'Crear, Actualizar, Cerrar', 1, 'gesdocs/documento.php', 1, '', '', ''),
(6, 'GESTION DE OPCIONES', 'Administracion de Opciones del Menu ppal', 4, 'usuario/gesopcion.php', 1, '', '', ''),
(7, 'GESTION DE DOCUMENTOS', 'Gestión de los Documentos del Conductor', 4, 'gesdocs/gesdocumento.php', 1, '', '', ''),
(8, 'GESTION DE EMPRESA', 'Gestion de Empresas Administradas', 3, 'gesempresa/gesemp.php', 1, '', '', ''),
(9, 'RELACION DE PAGO DE DIARIOS', 'Informe de Pago de Diarios', 2, 'radio_operador/gesvehi.php', 1, '', '', ''),
(10, 'GESTION DE GRUPOS', 'Gestion de Grupo de opciones del MenÃº ppal', 4, 'usuario/gesgrupo.php', 1, '', '', ''),
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
(36, 'Administracion y aportes', 'Pagos de administracion', 1, 'sart.php/sistemasart/diarios', 0, 'mvc', 'card-user-orange', 'diarios.png'),
(37, 'Informes', 'Generaci&oacute;n de Informes', 1, 'sart.php/sistemasart/informes', 0, 'mvc', 'card-user-green', 'informes.png'),
(38, 'Configuraci&oacute;n', 'Configuraci&oacute;n valores y taller', 1, 'sart.php/sistemasart/confi', 0, 'mvc', 'card-user-red', 'confi.jpeg'),
(39, 'Propietarios', 'Gestion de propietarios', 2, 'sart.php/sistemasart/propietario', 0, 'mvc', 'car-user-yellow', 'taxiprop.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acc_permiso`
--

CREATE TABLE `acc_permiso` (
  `id_permiso` int(5) NOT NULL,
  `id_usr` int(3) NOT NULL,
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

INSERT INTO `acc_permiso` (`id_permiso`, `id_usr`, `id_opcion`, `permiso`, `leer`, `borrar`, `crear`, `editar`) VALUES
(1, 1, 1, 1, 'no', 'no', 'no', 'no'),
(2, 1, 2, 1, 'no', 'no', 'no', 'no'),
(3, 1, 3, 1, 'no', 'no', 'no', 'no'),
(4, 1, 4, 1, 'no', 'no', 'no', 'no'),
(5, 1, 5, 1, 'no', 'no', 'no', 'no'),
(6, 1, 6, 1, 'no', 'no', 'no', 'no'),
(7, 1, 7, 1, 'no', 'no', 'no', 'no'),
(8, 1, 8, 1, 'no', 'no', 'no', 'no'),
(9, 1, 9, 1, 'no', 'no', 'no', 'no'),
(10, 1, 10, 1, 'no', 'no', 'no', 'no'),
(11, 1, 11, 1, 'no', 'no', 'no', 'no'),
(12, 1, 12, 1, 'no', 'no', 'no', 'no'),
(13, 1, 13, 1, 'no', 'no', 'no', 'no'),
(14, 1, 14, 1, 'no', 'no', 'no', 'no'),
(15, 1, 15, 1, 'no', 'no', 'no', 'no'),
(16, 1, 16, 1, 'no', 'no', 'no', 'no'),
(17, 1, 17, 1, 'no', 'no', 'no', 'no'),
(18, 1, 18, 1, 'no', 'no', 'no', 'no'),
(19, 1, 19, 1, 'no', 'no', 'no', 'no'),
(20, 1, 20, 1, 'no', 'no', 'no', 'no'),
(21, 1, 21, 1, 'no', 'no', 'no', 'no'),
(22, 1, 22, 0, 'no', 'no', 'no', 'no'),
(23, 1, 23, 1, 'no', 'no', 'no', 'no'),
(24, 1, 24, 0, 'no', 'no', 'no', 'no'),
(25, 1, 25, 1, 'no', 'no', 'no', 'no'),
(26, 1, 26, 0, 'no', 'no', 'no', 'no'),
(27, 1, 27, 1, 'no', 'no', 'no', 'no'),
(28, 1, 28, 0, 'no', 'no', 'no', 'no'),
(29, 1, 29, 1, 'no', 'no', 'no', 'no'),
(30, 1, 30, 1, 'no', 'no', 'no', 'no'),
(31, 1, 31, 0, 'no', 'no', 'no', 'no'),
(32, 1, 32, 1, 'no', 'no', 'no', 'no'),
(33, 1, 33, 0, 'no', 'no', 'no', 'no'),
(34, 1, 34, 1, 'no', 'no', 'no', 'no'),
(647, 1, 35, 1, 'no', 'no', 'si', 'si'),
(649, 1, 36, 1, 'si', 'si', 'si', 'si'),
(793, 1, 37, 1, 'si', 'si', 'si', 'si'),
(815, 1, 38, 1, 'si', 'si', 'si', 'si'),
(906, 2, 1, 1, 'no', 'no', 'no', 'no'),
(907, 2, 2, 0, 'no', 'no', 'no', 'no'),
(908, 2, 4, 1, 'no', 'no', 'no', 'no'),
(909, 2, 5, 1, 'no', 'no', 'no', 'no'),
(910, 2, 6, 0, 'no', 'no', 'no', 'no'),
(911, 2, 7, 0, 'no', 'no', 'no', 'no'),
(912, 2, 8, 0, 'no', 'no', 'no', 'no'),
(913, 2, 9, 0, 'no', 'no', 'no', 'no'),
(914, 2, 10, 0, 'no', 'no', 'no', 'no'),
(915, 2, 11, 1, 'no', 'no', 'no', 'no'),
(916, 2, 12, 0, 'no', 'no', 'no', 'no'),
(917, 2, 13, 0, 'no', 'no', 'no', 'no'),
(918, 2, 14, 1, 'no', 'no', 'no', 'no'),
(919, 2, 15, 1, 'no', 'no', 'no', 'no'),
(920, 2, 16, 0, 'no', 'no', 'no', 'no'),
(921, 2, 17, 0, 'no', 'no', 'no', 'no'),
(922, 2, 18, 0, 'no', 'no', 'no', 'no'),
(923, 2, 19, 0, 'no', 'no', 'no', 'no'),
(924, 2, 20, 0, 'no', 'no', 'no', 'no'),
(925, 2, 21, 0, 'no', 'no', 'no', 'no'),
(926, 2, 22, 0, 'no', 'no', 'no', 'no'),
(927, 2, 23, 1, 'no', 'no', 'no', 'no'),
(928, 2, 24, 0, 'no', 'no', 'no', 'no'),
(929, 2, 25, 0, 'no', 'no', 'no', 'no'),
(930, 2, 26, 0, 'no', 'no', 'no', 'no'),
(931, 2, 31, 0, 'no', 'no', 'no', 'no'),
(932, 2, 32, 1, 'no', 'no', 'no', 'no'),
(933, 2, 33, 0, 'no', 'no', 'no', 'no'),
(934, 2, 34, 0, 'no', 'no', 'no', 'no'),
(935, 2, 35, 1, 'no', 'no', 'si', 'si'),
(936, 2, 36, 1, 'no', 'no', 'no', 'no'),
(937, 2, 37, 1, 'no', 'no', 'no', 'no'),
(938, 2, 38, 0, 'no', 'no', 'no', 'no'),
(939, 3, 1, 1, 'no', 'no', 'no', 'no'),
(940, 3, 2, 0, 'no', 'no', 'no', 'no'),
(941, 3, 4, 1, 'no', 'no', 'no', 'no'),
(942, 3, 5, 1, 'no', 'no', 'no', 'no'),
(943, 3, 6, 0, 'no', 'no', 'no', 'no'),
(944, 3, 7, 0, 'no', 'no', 'no', 'no'),
(945, 3, 8, 0, 'no', 'no', 'no', 'no'),
(946, 3, 9, 1, 'no', 'no', 'no', 'no'),
(947, 3, 10, 0, 'no', 'no', 'no', 'no'),
(948, 3, 11, 1, 'no', 'no', 'no', 'no'),
(949, 3, 12, 1, 'no', 'no', 'no', 'no'),
(950, 3, 13, 0, 'no', 'no', 'no', 'no'),
(951, 3, 14, 1, 'no', 'no', 'no', 'no'),
(952, 3, 15, 1, 'no', 'no', 'no', 'no'),
(953, 3, 16, 1, 'no', 'no', 'no', 'no'),
(954, 3, 17, 1, 'no', 'no', 'no', 'no'),
(955, 3, 18, 0, 'no', 'no', 'no', 'no'),
(956, 3, 19, 0, 'no', 'no', 'no', 'no'),
(957, 3, 20, 0, 'no', 'no', 'no', 'no'),
(958, 3, 21, 0, 'no', 'no', 'no', 'no'),
(959, 3, 22, 1, 'no', 'no', 'no', 'no'),
(960, 3, 23, 1, 'no', 'no', 'no', 'no'),
(961, 3, 24, 0, 'no', 'no', 'no', 'no'),
(962, 3, 25, 0, 'no', 'no', 'no', 'no'),
(963, 3, 26, 1, 'no', 'no', 'no', 'no'),
(964, 3, 31, 1, 'no', 'no', 'no', 'no'),
(965, 3, 32, 1, 'no', 'no', 'no', 'no'),
(966, 3, 33, 1, 'no', 'no', 'no', 'no'),
(967, 3, 34, 0, 'no', 'no', 'no', 'no'),
(968, 3, 35, 1, 'no', 'no', 'no', 'no'),
(969, 3, 36, 0, 'no', 'no', 'no', 'no'),
(970, 3, 37, 1, 'no', 'no', 'no', 'no'),
(971, 3, 38, 0, 'no', 'no', 'no', 'no'),
(972, 1, 39, 1, 'no', 'no', 'no', 'no'),
(973, 2, 39, 1, 'no', 'no', 'no', 'no'),
(974, 3, 39, 1, 'no', 'no', 'no', 'no'),
(975, 4, 1, 1, 'no', 'no', 'no', 'no'),
(976, 4, 2, 0, 'no', 'no', 'no', 'no'),
(977, 4, 4, 1, 'no', 'no', 'no', 'no'),
(978, 4, 5, 1, 'no', 'no', 'no', 'no'),
(979, 4, 6, 0, 'no', 'no', 'no', 'no'),
(980, 4, 7, 0, 'no', 'no', 'no', 'no'),
(981, 4, 8, 0, 'no', 'no', 'no', 'no'),
(982, 4, 9, 0, 'no', 'no', 'no', 'no'),
(983, 4, 10, 0, 'no', 'no', 'no', 'no'),
(984, 4, 11, 1, 'no', 'no', 'no', 'no'),
(985, 4, 12, 0, 'no', 'no', 'no', 'no'),
(986, 4, 13, 0, 'no', 'no', 'no', 'no'),
(987, 4, 14, 0, 'no', 'no', 'no', 'no'),
(988, 4, 15, 0, 'no', 'no', 'no', 'no'),
(989, 4, 16, 0, 'no', 'no', 'no', 'no'),
(990, 4, 17, 0, 'no', 'no', 'no', 'no'),
(991, 4, 18, 0, 'no', 'no', 'no', 'no'),
(992, 4, 19, 0, 'no', 'no', 'no', 'no'),
(993, 4, 20, 0, 'no', 'no', 'no', 'no'),
(994, 4, 21, 0, 'no', 'no', 'no', 'no'),
(995, 4, 22, 0, 'no', 'no', 'no', 'no'),
(996, 4, 23, 0, 'no', 'no', 'no', 'no'),
(997, 4, 24, 0, 'no', 'no', 'no', 'no'),
(998, 4, 25, 0, 'no', 'no', 'no', 'no'),
(999, 4, 26, 0, 'no', 'no', 'no', 'no'),
(1000, 4, 31, 0, 'no', 'no', 'no', 'no'),
(1001, 4, 32, 0, 'no', 'no', 'no', 'no'),
(1002, 4, 33, 0, 'no', 'no', 'no', 'no'),
(1003, 4, 34, 0, 'no', 'no', 'no', 'no'),
(1004, 4, 35, 1, 'no', 'no', 'no', 'no'),
(1005, 4, 36, 0, 'no', 'no', 'no', 'no'),
(1006, 4, 37, 0, 'no', 'no', 'no', 'no'),
(1007, 4, 38, 0, 'no', 'no', 'no', 'no'),
(1008, 4, 39, 1, 'no', 'no', 'no', 'no'),
(1009, 5, 1, 1, 'no', 'no', 'no', 'no'),
(1010, 5, 2, 0, 'no', 'no', 'no', 'no'),
(1011, 5, 4, 1, 'no', 'no', 'no', 'no'),
(1012, 5, 5, 1, 'no', 'no', 'no', 'no'),
(1013, 5, 6, 0, 'no', 'no', 'no', 'no'),
(1014, 5, 7, 0, 'no', 'no', 'no', 'no'),
(1015, 5, 8, 0, 'no', 'no', 'no', 'no'),
(1016, 5, 9, 0, 'no', 'no', 'no', 'no'),
(1017, 5, 10, 0, 'no', 'no', 'no', 'no'),
(1018, 5, 11, 1, 'no', 'no', 'no', 'no'),
(1019, 5, 12, 0, 'no', 'no', 'no', 'no'),
(1020, 5, 13, 0, 'no', 'no', 'no', 'no'),
(1021, 5, 14, 1, 'no', 'no', 'no', 'no'),
(1022, 5, 15, 0, 'no', 'no', 'no', 'no'),
(1023, 5, 16, 0, 'no', 'no', 'no', 'no'),
(1024, 5, 17, 1, 'no', 'no', 'no', 'no'),
(1025, 5, 18, 0, 'no', 'no', 'no', 'no'),
(1026, 5, 19, 0, 'no', 'no', 'no', 'no'),
(1027, 5, 20, 0, 'no', 'no', 'no', 'no'),
(1028, 5, 21, 0, 'no', 'no', 'no', 'no'),
(1029, 5, 22, 0, 'no', 'no', 'no', 'no'),
(1030, 5, 23, 0, 'no', 'no', 'no', 'no'),
(1031, 5, 24, 0, 'no', 'no', 'no', 'no'),
(1032, 5, 25, 0, 'no', 'no', 'no', 'no'),
(1033, 5, 26, 0, 'no', 'no', 'no', 'no'),
(1034, 5, 31, 0, 'no', 'no', 'no', 'no'),
(1035, 5, 32, 1, 'no', 'no', 'no', 'no'),
(1036, 5, 33, 0, 'no', 'no', 'no', 'no'),
(1037, 5, 34, 0, 'no', 'no', 'no', 'no'),
(1038, 5, 35, 0, 'no', 'no', 'no', 'no'),
(1039, 5, 36, 0, 'no', 'no', 'no', 'no'),
(1040, 5, 37, 0, 'no', 'no', 'no', 'no'),
(1042, 5, 39, 0, 'no', 'no', 'no', 'no'),
(1043, 6, 1, 1, 'no', 'no', 'no', 'no'),
(1044, 6, 2, 0, 'no', 'no', 'no', 'no'),
(1045, 6, 4, 1, 'no', 'no', 'no', 'no'),
(1046, 6, 5, 1, 'no', 'no', 'no', 'no'),
(1047, 6, 6, 0, 'no', 'no', 'no', 'no'),
(1048, 6, 7, 0, 'no', 'no', 'no', 'no'),
(1049, 6, 8, 0, 'no', 'no', 'no', 'no'),
(1050, 6, 9, 0, 'no', 'no', 'no', 'no'),
(1051, 6, 10, 0, 'no', 'no', 'no', 'no'),
(1052, 6, 11, 1, 'no', 'no', 'no', 'no'),
(1053, 6, 12, 0, 'no', 'no', 'no', 'no'),
(1054, 6, 13, 0, 'no', 'no', 'no', 'no'),
(1055, 6, 14, 0, 'no', 'no', 'no', 'no'),
(1056, 6, 15, 0, 'no', 'no', 'no', 'no'),
(1057, 6, 16, 0, 'no', 'no', 'no', 'no'),
(1058, 6, 17, 1, 'no', 'no', 'no', 'no'),
(1059, 6, 18, 0, 'no', 'no', 'no', 'no'),
(1060, 6, 19, 0, 'no', 'no', 'no', 'no'),
(1061, 6, 20, 1, 'no', 'no', 'no', 'no'),
(1062, 6, 21, 0, 'no', 'no', 'no', 'no'),
(1063, 6, 22, 1, 'no', 'no', 'no', 'no'),
(1064, 6, 23, 0, 'no', 'no', 'no', 'no'),
(1065, 6, 24, 0, 'no', 'no', 'no', 'no'),
(1066, 6, 25, 0, 'no', 'no', 'no', 'no'),
(1067, 6, 26, 0, 'no', 'no', 'no', 'no'),
(1068, 6, 31, 0, 'no', 'no', 'no', 'no'),
(1069, 6, 32, 1, 'no', 'no', 'no', 'no'),
(1070, 6, 33, 0, 'no', 'no', 'no', 'no'),
(1071, 6, 34, 0, 'no', 'no', 'no', 'no'),
(1072, 6, 35, 0, 'no', 'no', 'no', 'no'),
(1073, 6, 36, 0, 'no', 'no', 'no', 'no'),
(1074, 6, 37, 0, 'no', 'no', 'no', 'no'),
(1076, 6, 39, 0, 'no', 'no', 'no', 'no'),
(1077, 5, 38, 0, 'no', 'no', 'no', 'no'),
(1078, 6, 38, 0, 'no', 'no', 'no', 'no'),
(1079, 7, 1, 1, 'no', 'no', 'no', 'no'),
(1080, 7, 2, 0, 'no', 'no', 'no', 'no'),
(1081, 7, 4, 1, 'no', 'no', 'no', 'no'),
(1082, 7, 5, 1, 'no', 'no', 'no', 'no'),
(1083, 7, 6, 0, 'no', 'no', 'no', 'no'),
(1084, 7, 7, 0, 'no', 'no', 'no', 'no'),
(1085, 7, 8, 0, 'no', 'no', 'no', 'no'),
(1086, 7, 9, 0, 'no', 'no', 'no', 'no'),
(1087, 7, 10, 0, 'no', 'no', 'no', 'no'),
(1088, 7, 11, 1, 'no', 'no', 'no', 'no'),
(1089, 7, 12, 0, 'no', 'no', 'no', 'no'),
(1090, 7, 13, 0, 'no', 'no', 'no', 'no'),
(1091, 7, 14, 0, 'no', 'no', 'no', 'no'),
(1092, 7, 15, 0, 'no', 'no', 'no', 'no'),
(1093, 7, 16, 0, 'no', 'no', 'no', 'no'),
(1094, 7, 17, 1, 'no', 'no', 'no', 'no'),
(1095, 7, 18, 0, 'no', 'no', 'no', 'no'),
(1096, 7, 19, 0, 'no', 'no', 'no', 'no'),
(1097, 7, 20, 1, 'no', 'no', 'no', 'no'),
(1098, 7, 21, 0, 'no', 'no', 'no', 'no'),
(1099, 7, 22, 0, 'no', 'no', 'no', 'no'),
(1100, 7, 23, 0, 'no', 'no', 'no', 'no'),
(1101, 7, 24, 0, 'no', 'no', 'no', 'no'),
(1102, 7, 25, 0, 'no', 'no', 'no', 'no'),
(1103, 7, 26, 0, 'no', 'no', 'no', 'no'),
(1104, 7, 31, 0, 'no', 'no', 'no', 'no'),
(1105, 7, 32, 1, 'no', 'no', 'no', 'no'),
(1106, 7, 33, 0, 'no', 'no', 'no', 'no'),
(1107, 7, 34, 0, 'no', 'no', 'no', 'no'),
(1108, 7, 35, 0, 'no', 'no', 'no', 'no'),
(1109, 7, 36, 0, 'no', 'no', 'no', 'no'),
(1110, 7, 37, 0, 'no', 'no', 'no', 'no'),
(1111, 7, 38, 0, 'no', 'no', 'no', 'no'),
(1112, 7, 39, 0, 'no', 'no', 'no', 'no'),
(1113, 8, 1, 1, 'no', 'no', 'no', 'no'),
(1114, 8, 2, 0, 'no', 'no', 'no', 'no'),
(1115, 8, 4, 1, 'no', 'no', 'no', 'no'),
(1116, 8, 5, 1, 'no', 'no', 'no', 'no'),
(1117, 8, 6, 0, 'no', 'no', 'no', 'no'),
(1118, 8, 7, 0, 'no', 'no', 'no', 'no'),
(1119, 8, 8, 0, 'no', 'no', 'no', 'no'),
(1120, 8, 9, 0, 'no', 'no', 'no', 'no'),
(1121, 8, 10, 0, 'no', 'no', 'no', 'no'),
(1122, 8, 11, 1, 'no', 'no', 'no', 'no'),
(1123, 8, 12, 0, 'no', 'no', 'no', 'no'),
(1124, 8, 13, 0, 'no', 'no', 'no', 'no'),
(1125, 8, 14, 0, 'no', 'no', 'no', 'no'),
(1126, 8, 15, 0, 'no', 'no', 'no', 'no'),
(1127, 8, 16, 0, 'no', 'no', 'no', 'no'),
(1128, 8, 17, 1, 'no', 'no', 'no', 'no'),
(1129, 8, 18, 0, 'no', 'no', 'no', 'no'),
(1130, 8, 19, 0, 'no', 'no', 'no', 'no'),
(1131, 8, 20, 0, 'no', 'no', 'no', 'no'),
(1132, 8, 21, 0, 'no', 'no', 'no', 'no'),
(1133, 8, 22, 0, 'no', 'no', 'no', 'no'),
(1134, 8, 23, 0, 'no', 'no', 'no', 'no'),
(1135, 8, 24, 0, 'no', 'no', 'no', 'no'),
(1136, 8, 25, 0, 'no', 'no', 'no', 'no'),
(1137, 8, 26, 0, 'no', 'no', 'no', 'no'),
(1138, 8, 31, 0, 'no', 'no', 'no', 'no'),
(1139, 8, 32, 1, 'no', 'no', 'no', 'no'),
(1140, 8, 33, 0, 'no', 'no', 'no', 'no'),
(1141, 8, 34, 0, 'no', 'no', 'no', 'no'),
(1142, 8, 35, 0, 'no', 'no', 'no', 'no'),
(1143, 8, 36, 0, 'no', 'no', 'no', 'no'),
(1144, 8, 37, 0, 'no', 'no', 'no', 'no'),
(1145, 8, 38, 0, 'no', 'no', 'no', 'no'),
(1146, 8, 39, 0, 'no', 'no', 'no', 'no'),
(1147, 9, 1, 1, 'no', 'no', 'no', 'no'),
(1148, 9, 2, 0, 'no', 'no', 'no', 'no'),
(1149, 9, 4, 1, 'no', 'no', 'no', 'no'),
(1150, 9, 5, 1, 'no', 'no', 'no', 'no'),
(1151, 9, 6, 0, 'no', 'no', 'no', 'no'),
(1152, 9, 7, 0, 'no', 'no', 'no', 'no'),
(1153, 9, 8, 0, 'no', 'no', 'no', 'no'),
(1154, 9, 9, 0, 'no', 'no', 'no', 'no'),
(1155, 9, 10, 0, 'no', 'no', 'no', 'no'),
(1156, 9, 11, 1, 'no', 'no', 'no', 'no'),
(1157, 9, 12, 0, 'no', 'no', 'no', 'no'),
(1158, 9, 13, 0, 'no', 'no', 'no', 'no'),
(1159, 9, 14, 0, 'no', 'no', 'no', 'no'),
(1160, 9, 15, 0, 'no', 'no', 'no', 'no'),
(1161, 9, 16, 0, 'no', 'no', 'no', 'no'),
(1162, 9, 17, 1, 'no', 'no', 'no', 'no'),
(1163, 9, 18, 0, 'no', 'no', 'no', 'no'),
(1164, 9, 19, 0, 'no', 'no', 'no', 'no'),
(1165, 9, 20, 0, 'no', 'no', 'no', 'no'),
(1166, 9, 21, 0, 'no', 'no', 'no', 'no'),
(1167, 9, 22, 0, 'no', 'no', 'no', 'no'),
(1168, 9, 23, 0, 'no', 'no', 'no', 'no'),
(1169, 9, 24, 0, 'no', 'no', 'no', 'no'),
(1170, 9, 25, 0, 'no', 'no', 'no', 'no'),
(1171, 9, 26, 0, 'no', 'no', 'no', 'no'),
(1172, 9, 31, 0, 'no', 'no', 'no', 'no'),
(1173, 9, 32, 1, 'no', 'no', 'no', 'no'),
(1174, 9, 33, 0, 'no', 'no', 'no', 'no'),
(1175, 9, 34, 0, 'no', 'no', 'no', 'no'),
(1176, 9, 35, 0, 'no', 'no', 'no', 'no'),
(1177, 9, 36, 0, 'no', 'no', 'no', 'no'),
(1178, 9, 37, 0, 'no', 'no', 'no', 'no'),
(1179, 9, 38, 0, 'no', 'no', 'no', 'no'),
(1180, 9, 39, 0, 'no', 'no', 'no', 'no'),
(1181, 10, 1, 1, 'no', 'no', 'no', 'no'),
(1182, 10, 2, 0, 'no', 'no', 'no', 'no'),
(1183, 10, 4, 1, 'no', 'no', 'no', 'no'),
(1184, 10, 5, 1, 'no', 'no', 'no', 'no'),
(1185, 10, 6, 0, 'no', 'no', 'no', 'no'),
(1186, 10, 7, 0, 'no', 'no', 'no', 'no'),
(1187, 10, 8, 0, 'no', 'no', 'no', 'no'),
(1188, 10, 9, 0, 'no', 'no', 'no', 'no'),
(1189, 10, 10, 0, 'no', 'no', 'no', 'no'),
(1190, 10, 11, 1, 'no', 'no', 'no', 'no'),
(1191, 10, 12, 0, 'no', 'no', 'no', 'no'),
(1192, 10, 13, 0, 'no', 'no', 'no', 'no'),
(1193, 10, 14, 0, 'no', 'no', 'no', 'no'),
(1194, 10, 15, 0, 'no', 'no', 'no', 'no'),
(1195, 10, 16, 0, 'no', 'no', 'no', 'no'),
(1196, 10, 17, 1, 'no', 'no', 'no', 'no'),
(1197, 10, 18, 0, 'no', 'no', 'no', 'no'),
(1198, 10, 19, 0, 'no', 'no', 'no', 'no'),
(1199, 10, 20, 0, 'no', 'no', 'no', 'no'),
(1200, 10, 21, 0, 'no', 'no', 'no', 'no'),
(1201, 10, 22, 0, 'no', 'no', 'no', 'no'),
(1202, 10, 23, 0, 'no', 'no', 'no', 'no'),
(1203, 10, 24, 0, 'no', 'no', 'no', 'no'),
(1204, 10, 25, 0, 'no', 'no', 'no', 'no'),
(1205, 10, 26, 0, 'no', 'no', 'no', 'no'),
(1206, 10, 31, 0, 'no', 'no', 'no', 'no'),
(1207, 10, 32, 1, 'no', 'no', 'no', 'no'),
(1208, 10, 33, 0, 'no', 'no', 'no', 'no'),
(1209, 10, 34, 0, 'no', 'no', 'no', 'no'),
(1210, 10, 35, 0, 'no', 'no', 'no', 'no'),
(1211, 10, 36, 0, 'no', 'no', 'no', 'no'),
(1212, 10, 37, 0, 'no', 'no', 'no', 'no'),
(1213, 10, 38, 0, 'no', 'no', 'no', 'no'),
(1214, 10, 39, 0, 'no', 'no', 'no', 'no'),
(1215, 11, 1, 1, 'no', 'no', 'no', 'no'),
(1216, 11, 2, 0, 'no', 'no', 'no', 'no'),
(1217, 11, 4, 1, 'no', 'no', 'no', 'no'),
(1218, 11, 5, 1, 'no', 'no', 'no', 'no'),
(1219, 11, 6, 0, 'no', 'no', 'no', 'no'),
(1220, 11, 7, 0, 'no', 'no', 'no', 'no'),
(1221, 11, 8, 0, 'no', 'no', 'no', 'no'),
(1222, 11, 9, 0, 'no', 'no', 'no', 'no'),
(1223, 11, 10, 0, 'no', 'no', 'no', 'no'),
(1224, 11, 11, 1, 'no', 'no', 'no', 'no'),
(1225, 11, 12, 0, 'no', 'no', 'no', 'no'),
(1226, 11, 13, 0, 'no', 'no', 'no', 'no'),
(1227, 11, 14, 0, 'no', 'no', 'no', 'no'),
(1228, 11, 15, 0, 'no', 'no', 'no', 'no'),
(1229, 11, 16, 0, 'no', 'no', 'no', 'no'),
(1230, 11, 17, 1, 'no', 'no', 'no', 'no'),
(1231, 11, 18, 0, 'no', 'no', 'no', 'no'),
(1232, 11, 19, 0, 'no', 'no', 'no', 'no'),
(1233, 11, 20, 0, 'no', 'no', 'no', 'no'),
(1234, 11, 21, 0, 'no', 'no', 'no', 'no'),
(1235, 11, 22, 0, 'no', 'no', 'no', 'no'),
(1236, 11, 23, 0, 'no', 'no', 'no', 'no'),
(1237, 11, 24, 0, 'no', 'no', 'no', 'no'),
(1238, 11, 25, 0, 'no', 'no', 'no', 'no'),
(1239, 11, 26, 0, 'no', 'no', 'no', 'no'),
(1240, 11, 31, 0, 'no', 'no', 'no', 'no'),
(1241, 11, 32, 1, 'no', 'no', 'no', 'no'),
(1242, 11, 33, 0, 'no', 'no', 'no', 'no'),
(1243, 11, 34, 0, 'no', 'no', 'no', 'no'),
(1244, 11, 35, 0, 'no', 'no', 'no', 'no'),
(1245, 11, 36, 0, 'no', 'no', 'no', 'no'),
(1246, 11, 37, 0, 'no', 'no', 'no', 'no'),
(1247, 11, 38, 0, 'no', 'no', 'no', 'no'),
(1248, 11, 39, 0, 'no', 'no', 'no', 'no'),
(1249, 12, 1, 1, 'no', 'no', 'no', 'no'),
(1250, 12, 2, 0, 'no', 'no', 'no', 'no'),
(1251, 12, 4, 1, 'no', 'no', 'no', 'no'),
(1252, 12, 5, 1, 'no', 'no', 'no', 'no'),
(1253, 12, 6, 0, 'no', 'no', 'no', 'no'),
(1254, 12, 7, 0, 'no', 'no', 'no', 'no'),
(1255, 12, 8, 0, 'no', 'no', 'no', 'no'),
(1256, 12, 9, 0, 'no', 'no', 'no', 'no'),
(1257, 12, 10, 0, 'no', 'no', 'no', 'no'),
(1258, 12, 11, 1, 'no', 'no', 'no', 'no'),
(1259, 12, 12, 0, 'no', 'no', 'no', 'no'),
(1260, 12, 13, 0, 'no', 'no', 'no', 'no'),
(1261, 12, 14, 0, 'no', 'no', 'no', 'no'),
(1262, 12, 15, 0, 'no', 'no', 'no', 'no'),
(1263, 12, 16, 0, 'no', 'no', 'no', 'no'),
(1264, 12, 17, 1, 'no', 'no', 'no', 'no'),
(1265, 12, 18, 0, 'no', 'no', 'no', 'no'),
(1266, 12, 19, 0, 'no', 'no', 'no', 'no'),
(1267, 12, 20, 0, 'no', 'no', 'no', 'no'),
(1268, 12, 21, 0, 'no', 'no', 'no', 'no'),
(1269, 12, 22, 0, 'no', 'no', 'no', 'no'),
(1270, 12, 23, 0, 'no', 'no', 'no', 'no'),
(1271, 12, 24, 0, 'no', 'no', 'no', 'no'),
(1272, 12, 25, 0, 'no', 'no', 'no', 'no'),
(1273, 12, 26, 0, 'no', 'no', 'no', 'no'),
(1274, 12, 31, 0, 'no', 'no', 'no', 'no'),
(1275, 12, 32, 1, 'no', 'no', 'no', 'no'),
(1276, 12, 33, 0, 'no', 'no', 'no', 'no'),
(1277, 12, 34, 0, 'no', 'no', 'no', 'no'),
(1278, 12, 35, 0, 'no', 'no', 'no', 'no'),
(1279, 12, 36, 0, 'no', 'no', 'no', 'no'),
(1280, 12, 37, 0, 'no', 'no', 'no', 'no'),
(1281, 12, 38, 0, 'no', 'no', 'no', 'no'),
(1282, 12, 39, 0, 'no', 'no', 'no', 'no'),
(1283, 13, 1, 1, 'no', 'no', 'no', 'no'),
(1284, 13, 2, 0, 'no', 'no', 'no', 'no'),
(1285, 13, 4, 1, 'no', 'no', 'no', 'no'),
(1286, 13, 5, 1, 'no', 'no', 'no', 'no'),
(1287, 13, 6, 0, 'no', 'no', 'no', 'no'),
(1288, 13, 7, 0, 'no', 'no', 'no', 'no'),
(1289, 13, 8, 0, 'no', 'no', 'no', 'no'),
(1290, 13, 9, 0, 'no', 'no', 'no', 'no'),
(1291, 13, 10, 0, 'no', 'no', 'no', 'no'),
(1292, 13, 11, 1, 'no', 'no', 'no', 'no'),
(1293, 13, 12, 0, 'no', 'no', 'no', 'no'),
(1294, 13, 13, 0, 'no', 'no', 'no', 'no'),
(1295, 13, 14, 0, 'no', 'no', 'no', 'no'),
(1296, 13, 15, 0, 'no', 'no', 'no', 'no'),
(1297, 13, 16, 0, 'no', 'no', 'no', 'no'),
(1298, 13, 17, 1, 'no', 'no', 'no', 'no'),
(1299, 13, 18, 0, 'no', 'no', 'no', 'no'),
(1300, 13, 19, 0, 'no', 'no', 'no', 'no'),
(1301, 13, 20, 0, 'no', 'no', 'no', 'no'),
(1302, 13, 21, 0, 'no', 'no', 'no', 'no'),
(1303, 13, 22, 0, 'no', 'no', 'no', 'no'),
(1304, 13, 23, 0, 'no', 'no', 'no', 'no'),
(1305, 13, 24, 0, 'no', 'no', 'no', 'no'),
(1306, 13, 25, 0, 'no', 'no', 'no', 'no'),
(1307, 13, 26, 0, 'no', 'no', 'no', 'no'),
(1308, 13, 31, 0, 'no', 'no', 'no', 'no'),
(1309, 13, 32, 1, 'no', 'no', 'no', 'no'),
(1310, 13, 33, 0, 'no', 'no', 'no', 'no'),
(1311, 13, 34, 0, 'no', 'no', 'no', 'no'),
(1312, 13, 35, 0, 'no', 'no', 'no', 'no'),
(1313, 13, 36, 0, 'no', 'no', 'no', 'no'),
(1314, 13, 37, 0, 'no', 'no', 'no', 'no'),
(1315, 13, 38, 0, 'no', 'no', 'no', 'no'),
(1316, 13, 39, 0, 'no', 'no', 'no', 'no'),
(1317, 14, 1, 1, 'no', 'no', 'no', 'no'),
(1318, 14, 2, 0, 'no', 'no', 'no', 'no'),
(1319, 14, 4, 1, 'no', 'no', 'no', 'no'),
(1320, 14, 5, 1, 'no', 'no', 'no', 'no'),
(1321, 14, 6, 0, 'no', 'no', 'no', 'no'),
(1322, 14, 7, 0, 'no', 'no', 'no', 'no'),
(1323, 14, 8, 0, 'no', 'no', 'no', 'no'),
(1324, 14, 9, 0, 'no', 'no', 'no', 'no'),
(1325, 14, 10, 0, 'no', 'no', 'no', 'no'),
(1326, 14, 11, 1, 'no', 'no', 'no', 'no'),
(1327, 14, 12, 0, 'no', 'no', 'no', 'no'),
(1328, 14, 13, 0, 'no', 'no', 'no', 'no'),
(1329, 14, 14, 0, 'no', 'no', 'no', 'no'),
(1330, 14, 15, 0, 'no', 'no', 'no', 'no'),
(1331, 14, 16, 0, 'no', 'no', 'no', 'no'),
(1332, 14, 17, 0, 'no', 'no', 'no', 'no'),
(1333, 14, 18, 0, 'no', 'no', 'no', 'no'),
(1334, 14, 19, 0, 'no', 'no', 'no', 'no'),
(1335, 14, 20, 0, 'no', 'no', 'no', 'no'),
(1336, 14, 21, 0, 'no', 'no', 'no', 'no'),
(1337, 14, 22, 0, 'no', 'no', 'no', 'no'),
(1338, 14, 23, 0, 'no', 'no', 'no', 'no'),
(1339, 14, 24, 0, 'no', 'no', 'no', 'no'),
(1340, 14, 25, 0, 'no', 'no', 'no', 'no'),
(1341, 14, 26, 0, 'no', 'no', 'no', 'no'),
(1342, 14, 31, 0, 'no', 'no', 'no', 'no'),
(1343, 14, 32, 1, 'no', 'no', 'no', 'no'),
(1344, 14, 33, 0, 'no', 'no', 'no', 'no'),
(1345, 14, 34, 0, 'no', 'no', 'no', 'no'),
(1346, 14, 35, 0, 'no', 'no', 'no', 'no'),
(1347, 14, 36, 0, 'no', 'no', 'no', 'no'),
(1348, 14, 37, 0, 'no', 'no', 'no', 'no'),
(1349, 14, 38, 0, 'no', 'no', 'no', 'no'),
(1350, 14, 39, 0, 'no', 'no', 'no', 'no'),
(1351, 15, 1, 1, 'no', 'no', 'no', 'no'),
(1352, 15, 2, 0, 'no', 'no', 'no', 'no'),
(1353, 15, 4, 1, 'no', 'no', 'no', 'no'),
(1354, 15, 5, 1, 'no', 'no', 'no', 'no'),
(1355, 15, 6, 0, 'no', 'no', 'no', 'no'),
(1356, 15, 7, 0, 'no', 'no', 'no', 'no'),
(1357, 15, 8, 0, 'no', 'no', 'no', 'no'),
(1358, 15, 9, 0, 'no', 'no', 'no', 'no'),
(1359, 15, 10, 0, 'no', 'no', 'no', 'no'),
(1360, 15, 11, 1, 'no', 'no', 'no', 'no'),
(1361, 15, 12, 0, 'no', 'no', 'no', 'no'),
(1362, 15, 13, 0, 'no', 'no', 'no', 'no'),
(1363, 15, 14, 0, 'no', 'no', 'no', 'no'),
(1364, 15, 15, 0, 'no', 'no', 'no', 'no'),
(1365, 15, 16, 0, 'no', 'no', 'no', 'no'),
(1366, 15, 17, 0, 'no', 'no', 'no', 'no'),
(1367, 15, 18, 0, 'no', 'no', 'no', 'no'),
(1368, 15, 19, 0, 'no', 'no', 'no', 'no'),
(1369, 15, 20, 0, 'no', 'no', 'no', 'no'),
(1370, 15, 21, 0, 'no', 'no', 'no', 'no'),
(1371, 15, 22, 0, 'no', 'no', 'no', 'no'),
(1372, 15, 23, 0, 'no', 'no', 'no', 'no'),
(1373, 15, 24, 0, 'no', 'no', 'no', 'no'),
(1374, 15, 25, 0, 'no', 'no', 'no', 'no'),
(1375, 15, 26, 0, 'no', 'no', 'no', 'no'),
(1376, 15, 31, 0, 'no', 'no', 'no', 'no'),
(1377, 15, 32, 1, 'no', 'no', 'no', 'no'),
(1378, 15, 33, 0, 'no', 'no', 'no', 'no'),
(1379, 15, 34, 0, 'no', 'no', 'no', 'no'),
(1380, 15, 35, 0, 'no', 'no', 'no', 'no'),
(1381, 15, 36, 0, 'no', 'no', 'no', 'no'),
(1382, 15, 37, 0, 'no', 'no', 'no', 'no'),
(1383, 15, 38, 0, 'no', 'no', 'no', 'no'),
(1384, 15, 39, 0, 'no', 'no', 'no', 'no'),
(1385, 16, 1, 1, 'no', 'no', 'no', 'no'),
(1386, 16, 2, 0, 'no', 'no', 'no', 'no'),
(1387, 16, 4, 1, 'no', 'no', 'no', 'no'),
(1388, 16, 5, 1, 'no', 'no', 'no', 'no'),
(1389, 16, 6, 0, 'no', 'no', 'no', 'no'),
(1390, 16, 7, 0, 'no', 'no', 'no', 'no'),
(1391, 16, 8, 0, 'no', 'no', 'no', 'no'),
(1392, 16, 9, 0, 'no', 'no', 'no', 'no'),
(1393, 16, 10, 0, 'no', 'no', 'no', 'no'),
(1394, 16, 11, 1, 'no', 'no', 'no', 'no'),
(1395, 16, 12, 0, 'no', 'no', 'no', 'no'),
(1396, 16, 13, 0, 'no', 'no', 'no', 'no'),
(1397, 16, 14, 0, 'no', 'no', 'no', 'no'),
(1398, 16, 15, 0, 'no', 'no', 'no', 'no'),
(1399, 16, 16, 0, 'no', 'no', 'no', 'no'),
(1400, 16, 17, 0, 'no', 'no', 'no', 'no'),
(1401, 16, 18, 0, 'no', 'no', 'no', 'no'),
(1402, 16, 19, 0, 'no', 'no', 'no', 'no'),
(1403, 16, 20, 0, 'no', 'no', 'no', 'no'),
(1404, 16, 21, 0, 'no', 'no', 'no', 'no'),
(1405, 16, 22, 0, 'no', 'no', 'no', 'no'),
(1406, 16, 23, 0, 'no', 'no', 'no', 'no'),
(1407, 16, 24, 0, 'no', 'no', 'no', 'no'),
(1408, 16, 25, 0, 'no', 'no', 'no', 'no'),
(1409, 16, 26, 0, 'no', 'no', 'no', 'no'),
(1410, 16, 31, 0, 'no', 'no', 'no', 'no'),
(1411, 16, 32, 1, 'no', 'no', 'no', 'no'),
(1412, 16, 33, 0, 'no', 'no', 'no', 'no'),
(1413, 16, 34, 0, 'no', 'no', 'no', 'no'),
(1414, 16, 35, 0, 'no', 'no', 'no', 'no'),
(1415, 16, 36, 0, 'no', 'no', 'no', 'no'),
(1416, 16, 37, 0, 'no', 'no', 'no', 'no'),
(1417, 16, 38, 0, 'no', 'no', 'no', 'no'),
(1418, 16, 39, 0, 'no', 'no', 'no', 'no');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acc_usuario`
--

CREATE TABLE `acc_usuario` (
  `id_usr` int(3) NOT NULL,
  `login` varchar(35) NOT NULL,
  `clave` varchar(100) NOT NULL,
  `admin` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `acc_usuario`
--

INSERT INTO `acc_usuario` (`id_usr`, `login`, `clave`, `admin`) VALUES
(1, 'admin', 'a30e576eddb4876952e1e8dc4c73d569', 1),
(2, 'yohana', 'b59312ff2dc7e9e5dfb6f7d42411ede0', 0),
(3, 'nora', 'b2087a72046e348057dd44531bd726f0', 0),
(4, 'oficina', '9271ebf72938661333ab68298d41d5d6', 0),
(5, 'oscar', 'ec751d48a1c93edbedc2241de31bb9f4', 0),
(6, 'cooperativa', '04dd54ff7ac2c1d78918214c2ee66ac0', 0),
(7, 'FaencyPlaza', 'fd6e6d02c8429cbb0aa5c743c6a2c53f', 0),
(8, 'yesenia', '94c75faf0371bf7a0e5c1483d742efb7', 0),
(9, 'Jennifer', '99432ca87f532c317938ca42a92da83f', 0),
(10, 'AdrianaOrtiz', '95e1be1ec1e9423f214997a9076da518', 0),
(11, 'DianaCuervo', 'a6a5c8146e8ab533f7a571469623c93d', 0),
(12, 'alvaro', '1254126ab09682c111a7d456073376fc', 0),
(13, 'MAYERLY', '34adb178552bc5f29f53ccceef0ec1bd', 0),
(14, 'EUGENIA', '8ef8a41a764be29a9c9525e9e31fd4c0', 0),
(15, 'JUAN', 'f6d27c83bec7172d2128d91cd0a434e8', 0),
(16, 'FABIOLA', '6f8a9db00dd17bdd33b70f9d7e35565a', 0);

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

--
-- Volcado de datos para la tabla `aportes`
--

INSERT INTO `aportes` (`id`, `id_movil`, `aporte`, `fecha_aporte`, `estado`, `nrec`) VALUES
(17, '002', 5500, '2018-02-02', 'activo', 1),
(18, '002', 407000000, '2018-09-12', 'activo', 3),
(19, '073', 27500, '2020-09-15', 'activo', 4);

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
  `nombre1` varchar(25) DEFAULT NULL,
  `nombre2` varchar(25) DEFAULT NULL,
  `apellido1` varchar(25) DEFAULT NULL,
  `apellido2` varchar(25) DEFAULT NULL,
  `direccion` varchar(35) DEFAULT NULL,
  `telefono` varchar(25) DEFAULT NULL,
  `fecha_nace` date DEFAULT '0000-00-00',
  `est_civil` varchar(20) DEFAULT NULL,
  `tipo_rh` varchar(10) DEFAULT NULL,
  `acudiente` varchar(50) DEFAULT NULL,
  `telefonoa` varchar(30) DEFAULT NULL,
  `celulara` varchar(30) DEFAULT NULL,
  `eps` varchar(100) DEFAULT NULL,
  `arl` varchar(100) DEFAULT NULL,
  `emailc` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `conductor`
--

INSERT INTO `conductor` (`id_conductor`, `codigo`, `nombre1`, `nombre2`, `apellido1`, `apellido2`, `direccion`, `telefono`, `fecha_nace`, `est_civil`, `tipo_rh`, `acudiente`, `telefonoa`, `celulara`, `eps`, `arl`, `emailc`) VALUES
(57, '94394409', 'JHON ALEXANDER', '', 'ORREGO HENAO', '', 'DG 26c3   25-22', '3113610034', '1977-11-22', 'soltero', 'O-', 'ORLANDO HENAO', '3173678956', '', '', '', ''),
(100, '10549539', 'FABIO', 'CLAROS', 'ANDRADE', '', '', '', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(101, '1114058049', 'VICTOR', 'ALONSO', 'HERRERA', 'VELEZ', 'c 26c 8-10', '3137667822', '1986-07-12', 'soltero', 'O-', 'ORLANDO HENAO', '3173678956', '', '', '', ''),
(103, '16365676', 'FREDY', '', 'GONZALEZ', 'GARCIA', 'CALLE 24 8-82', '3186176482', '0000-00-00', 'soltero', 'O+', 'orlando henao', '3173678956', '3186176482', 'sisben', '.', NULL),
(106, '94395986', 'HENRY', 'ALEXANDER', 'GOMEZ', 'SALGADO', '', '', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(109, '14796343', 'FABIAN', 'ANDRES', 'CARDENAS', 'MARIN', 'CALLE 9 17-110 SANTA INES', '3174140942', '1956-09-01', 'soltero', 'O+', 'ORLANDO HENAO', '', '3173678956', '', '', ''),
(111, '16200833', 'BERNARDO', '', 'RODRIGUEZ', '', 'CALLE 25 10-91 PLAYAS', '3148881358', '0000-00-00', '', 'A+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(112, '94367271', 'ALEXANDER', '', 'QUINTERO', 'ACEVEDO', 'MANZ 17 CASA 13 BOSQUES', '3046173869', '1972-10-25', 'soltero', 'A-', 'ORLANDO HENAO', '3173678956', '', '', '', 'alexanderquinteroacevedo@hotmail.com'),
(113, '1116242194', 'JONATAN', '', 'GOMEZ', 'RAMIREZ', 'CALLEJON CRUZ C6', '3175881218', '1988-10-15', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '', '', '', ''),
(114, '94388969', 'JAIDER', '', 'SUAREZ', 'LOPEZ', 'CL 26A 12-31', '3152129100', '1974-09-19', 'soltero', 'B+', 'ORLANDO HENAO', '3173678956', '', 'NUEVA EPS', 'R-4 BOLIVAR', ''),
(115, '14801440', 'EDWIN', '-', 'GONZALEZ', '-', 'CALLE 6 T20-28 SANTA ISABEL', '3206913063', '1980-10-18', 'Union libre', 'A+', 'ORLANDO HENAO', '3173678956', '3173678956', 'NUEVA EPS', 'SEGUROS BOLIVAR', NULL),
(116, '16347577', 'OSCAR DE', 'JESUS', 'AMELINES', 'MARIN', '', '', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(117, '16346910', 'ALFONSO', '', 'CEBALLOS', 'CASTRO', 'CRA 1A 22-21', '2332318-3188585661', '0000-00-00', '', 'O-', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(119, '6141045', 'JAIME', '', 'SANCHEZ', 'ARIAS', 'CALLE 24A 5AOESTE-38', '3157102243', '1961-03-17', 'soltero', 'A+', 'ORLANDO HENAO', '3173678956', '', '', '', 'jaimesanchezarias1961@hotmail.com'),
(120, '79333930', 'JOSE', 'ALDEMAR', 'VERGARA', 'QUERUBIN', 'CRA 20A 13-03', '3163352921', '1964-04-11', 'soltero', 'A+', 'ORLANDO HENAO', '-', '3173678956', 'MEDIMAS', '-', NULL),
(121, '94150632', 'OSCAR', 'EDWARDO', 'BLANDON', 'BETANCOURT', 'CALLE 5 16-82', '3126771605', '1980-03-24', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '', 'emssanar', 'sura', 'oscar.98024@gmail.com'),
(123, '16946464', 'CARLOS', 'ANDRES', 'ORREGO', 'GONZALEZ', 'MANZ M CASA 3', '3192550328', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(124, '16935703', 'RICARDO', 'ALFONSO', 'DELGADO', 'AGUDELO', '', '', '0000-00-00', '', 'A+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(125, '16640555', 'FREDY', '', 'CORRALES', 'ROMAN', 'MANZANA A CASA 8 PARAISO', '3173388628', '1960-04-11', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '', '', '', ''),
(126, '94366276', 'RODRIGO', '-', 'RESTREPO', 'CUELLAR', 'KRA 28 A- 17-25', '3175509891', '0000-00-00', 'soltero', 'O+', 'ORLANDO HENAO', '31736789956', '3173678956', 'SOS', 'NINGUNA', NULL),
(127, '16195037', 'MARCO', 'ANTONIO', 'CERON', '', 'CRA 27A 10A 20', '3147696045', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(129, '16355668', 'LUIS', 'CARLOS', 'OBANDO', 'ZULUAGA', 'calle-5--18-13', '3177284758', '0000-00-00', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '3173678956', 'EMSANAR', 'SURA', NULL),
(130, '2515531', 'MARCO', 'FIDEL', 'SUAREZ', 'SABOGAL', 'CALLE 17 29-75', '3176809884', '0000-00-00', '', 'B+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(132, '6501563', 'JOSE', 'DANIEL', 'NIETO', 'HENAO', 'MANZ 35 C 25 BOSQUES ', '3167667505', '1967-06-28', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '', '', '', ''),
(133, '94369356', 'ALVARO', 'JAMES', 'MENDIETA', 'ZULUAGA', 'TRANSVERSAL 12 26C 109', '3145020290', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(134, '15897890', 'JORGE', 'HUMBERTO', 'BUSTAMANTE', 'MARIN', 'ALTO DE LA COLINA (RANCHO PANORAMA)', '3217139988', '1954-02-02', 'soltero', 'O+', 'ORLANDO HENAO', '-', '3173678956', 'ENSSANAR', '-', NULL),
(135, '18913956', 'JOSE', 'IVAN', 'SALAZAR', 'ALFARO', 'TRANS 22 11-12 CHIMINANGOS', '3165844142', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(136, '16596778', 'LUIS', 'CARLOS', 'NIETO', 'ARANGO', 'CALLE 13B 23-15', '3113352131', '0000-00-00', '', 'A+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(137, '16351749', 'CARLOS', 'HOLMES', 'AGUILERA', 'GARCIA', '', '', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(138, '6497597', 'CARLOS', 'JULIO', 'ARCINIEGAS', 'MEJIA', 'VIA PRINC AGUACLARA 28-63', '3156682978', '1972-01-01', 'soltero', 'O+', 'ORLANDO HENAO', '-', '3173678956', 'EMSSANAR', '-', 'arciniegas6431@gmial.com'),
(139, '19128402', 'ABRAHAM', '', 'BONILLA', 'GALLEGO', 'CALLE 38C 20A 45', '3162949519', '1950-12-30', 'soltero', 'O+', 'ORLANDO HENAO', '', '3173678956', '', '', 'abrahambg098@gmail.com'),
(142, '16212677', 'NORMAN DE', 'JESUS', 'TREJOS', 'HERRERA', 'CRA 24A 12-23', '3116261674', '1960-11-14', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '', 'NUEVA EPS', 'EQUIDAD', ''),
(144, '6497838', 'MARIO', 'FERNEY', 'ARANGO', 'MARIN', 'CALLE 24 15-51', '3184765460', '1978-09-29', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '', 'ENSSANAR', '-', ''),
(146, '15255281', 'DIEGO', '', 'ALVARADO', 'VELEZ', 'MZ 2 CASA 3 BOSQUES', '3218283491', '1959-08-15', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '', 'ASMET', '', 'diegoalvaradovelez@gmail.com'),
(149, '94153714', 'DIEGO', 'ALEXANDER', 'GALEANO', 'LOPEZ', 'CALLE 14 9A-24', '3164210147', '1980-12-09', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '', 'EMSANAR', 'R-4 SURA', 'diegitolopez387@hotmail.com'),
(150, '94394689', 'DIDIER', '-', 'VACA', 'VALENCIA', 'C 10 23-70', '3163349067', '1976-08-27', 'soltero', 'O+', 'ORLANDO HENAO', '-', '3173678956', 'EMSSANAR', '-', ''),
(151, '16367053', 'AUGUSTO', 'JAMES', 'SANCHEZ', 'SAENZ', 'AVENIDA PRINC AGUACLARA 28-05', '3172657818', '1968-07-13', 'soltero', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', ''),
(152, '1117016388', 'JEIDER', '', 'FAJARDO', 'GARCIA', 'CRA 33 33-69', '3165139606', '1986-12-19', 'soltero', 'A+', 'ORLANDO HENAO', '3173678956', '', '', '', 'ceramicamena@hotmail.com'),
(153, '14801230', 'WALTER', 'MAURICIO', 'ZULUAGA', 'MARIN', 'CALLE 31 17-40', '3163210541', '1982-08-26', 'soltero', 'O-', 'ORLANDO HENAO', '', '3173678956', '', '', 'wzuluaga602@gmail.com'),
(154, '16344062', 'NESTOR', 'RAMIRO', 'PIEDRAHITA', 'CORTES', 'CRA 22 35-33', '3154686904', '1952-06-27', 'soltero', 'A+', 'DIANA CASTRILLON', '3127683084', '', '', '', ''),
(155, '16349235', 'ANDRES', '', 'HERNANDEZ', 'DUARTE', 'C 24 8-11', '3153996113', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(156, '1116263846', 'SANTIAGO', '', 'CONCHA', 'PELAEZ', 'C 7 25B 46', '3187104438', '0000-00-00', '', 'A+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(157, '16609420', 'JOSE', 'RICAURTE', 'LONDOÑO', 'ARIAS', 'CALLE 13A 28BIS 2-41', '3154562552', '0000-00-00', '', 'B+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(158, '94392715', 'GUSTAVO', 'ADOLFO', 'VALDERRAMA', 'SALAZAR', 'CRA 5B OESTE 25-16', '3186492045', '1976-12-27', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '3173678956', 'CAFESALUD', '', NULL),
(160, '94330279', 'ALEXANDER', '', 'TANGARIFE', 'MONTES', 'callejon guasimo casa 17', '3155667506', '1977-10-24', 'soltero', 'A+', 'ORLANDO HENAO', '3173678956', '3173678956', 'EMSSANAR', '-', 'documentosalex2017br@yahoo.com'),
(161, '1116267605', 'JUAN', 'DAVID', 'MESIAS', 'OSORIO', 'c25 7-10', '3185332078', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(162, '6498675', 'JORGE', 'IVAN', 'BEDOYA', 'MEZA', 'CALLE 12 A 23-23', '3172170870', '1978-12-20', 'soltero', 'O+', 'ORLANDO HENAO', '', '3173678956', 'ENSSANAR', '', ''),
(163, '16368032', 'HECTOR', 'J.', 'MUÃ‘OS', '-', 'C 25A 3-06', '3158659620', '1999-08-28', 'Union libre', 'O-', 'ORLANDO HENAO', '-', '3173678956', 'EMSSANAR', '-', NULL),
(164, '6008298', 'LUIS', 'ERNESTO', 'DEVIA', 'GUTIERREZ', 'CALLE 10C 27C-45', '3174137468', '1960-08-25', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '', 'NUEVA EPS', 'R-4', 'devia1267@gmail.com'),
(167, '6445207', 'LUIS', 'FERNANDO', 'GARCIA', 'VELASCO', 'MANZ 15 14-08 LA VILLA', '3185859970', '1970-10-09', 'soltero', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', 'fegal9@hotmail.com'),
(169, '4442638', 'JOSE', 'ITURIEL', 'ARISTIZABAL', 'MONTES', 'CALLE 4B 18--84', '3212395846', '1954-02-23', 'soltero', 'A+', 'ORLANDO HENAO', '3173678956', '', 'NUEVA EPS', '', ''),
(170, '14799539', 'ARIEL', 'FERNANDO', 'MUÃ‘OZ', 'TORRES', 'CRA 18A 30-35', '3022917723', '1981-06-17', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '', '', '', 'arisfernando3355@gmail.com'),
(171, '94150054', 'LUIS', 'HERNANDO', 'PEREZ', 'SANTACRUZ', 'CRA 6 W 26A 28 LAS NIEVES', '3113892958', '1969-09-05', 'soltero', 'O+', 'ORLANDO HENAO', '', '3173678956', '', '', 'luishernandoperez94@gmail.com'),
(172, '1007954434', 'JONNY', 'ALEXANDER', 'RENGIFO', 'ATEHORTUA', '', '', '0000-00-00', '', 'A+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(173, '16361351', 'JOSE', 'OSWALDO', 'MONEDERO', 'CUELLAR', 'CALLE 44 24-05', '3206055981', '1964-06-08', 'soltero', 'A+', 'ORLANDO HENAO', '3173678956', '', 'SANITAS', 'R-4 SURA', 'oswaldomonedero@outlook.es'),
(176, '6272483', 'ROBERTO DE', 'JESUS', 'CORREA', 'DIEZ', 'CALLE 5C 17-34', '3164766068', '1954-03-03', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '', 'COOMEVA', 'R-4 SURA', 'robertocorreadiez272@gmail.com'),
(177, '6428062', 'LUIS', 'ALBERTO', 'ESPINOSA', 'RUDAS', 'KR 27 C11 A 21', '3152454064', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(178, '16348488', 'JOSE', 'ALBEIRO', 'RIVERA', 'PORRAS', 'CRA 22A 14-24', '3162827386', '0000-00-00', '', 'A+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(179, '1116242816', 'SERGIO', '', 'DELGADO', 'ALVARADO', 'CALLE 25A 17-57 MARANDUA', '3107069886', '0000-00-00', '', 'A+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(182, '94394743', 'LUIS', 'FERNANDO', 'PEREZ', 'TREJOS', 'PASAJE 13C-49A14', '3188312132', '1978-02-02', 'Casado', 'O+', 'ORLANDO HENAO', '3173678956', '3173678956', 'EMSSANAR', '-', NULL),
(183, '1116244475', 'WILLIAM', 'ALEXANDER', 'GUERRERO', 'VARON', 'TRANS 9 DIAGONAL 20-26', '3006777816', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(184, '94151263', 'MANUEL', '', 'SALAZAR', 'HERRERA', 'Callejon pedroza C5', '3218796203', '1972-05-05', 'Casado', 'A+', 'ORLANDO HENAO', '3173678956', '', '', '', ''),
(185, '93419360', 'JOSE', 'GERMAN', 'PLAZAS', 'GARAVIÑO', 'CRA 41 28A 06', '3213188610', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(186, '9765016', 'JAIRO', '', 'GIRALDO', 'FERNANDEZ', 'CRA 18A 30-22', '3127336088', '1959-10-27', 'soltero', 'A+', 'ORLANDO HENAO', '', '3173678956', '', '', ''),
(187, '94394241', 'DIEGO', 'FERNANDO', 'TOVAR', 'HERNANDEZ', 'CALLE 24 5-24 LAS AMERICAS', '3165563760', '1977-10-21', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '', 'EMSANAR', '', 'jhonykaren07@gmail.com'),
(188, '14798330', 'NELSON', 'ENRIQUE', 'RODRIGUEZ', 'ARISTIZABAL', 'CALLE 32 42-01', '3177993882', '1983-11-04', 'soltero', 'O+', 'ORLANDO HENAO', '', '3173678956', 'COOMEVA', 'R-4 SURA', 'neslonraristizabal@gmail.com'),
(189, '2515164', 'FERNANDO', 'GERARDO', 'DE LA TORRE', 'GIRALDO', '', '', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(190, '1116232125', 'JHON', 'MARIO', 'CARDENAS', '-', 'C 23 17-41', '3017554032', '1983-06-10', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '3173678956', 'EMSSANAR', '-', NULL),
(191, '14801123', 'GERCEAR', '', 'GARCIA', 'ORTIZ', 'VIA LOS CAIMOS 29A-19', '3017103685', '1984-12-22', 'soltero', 'B+', 'ORLANDO HENAO', '3173678956', '', 'SANITAS', 'R-4 SURA', 'gercear@outlook.com'),
(192, '1116724253', 'FERNANDO', '', 'LOPEZ', '', 'CRA 1A 30-37', '3233359460', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(193, '79907130', 'DAVID', 'ALEJANDRO', 'TORRES', 'OLAYA', 'MANZ 10 CASA 35 BOSQUES', '3234372998', '1977-03-06', 'soltero', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', ''),
(194, '66710918', 'DORIS', 'MARIA', 'CALVO', 'FIGUEROA', '', '', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(195, '94151102', 'NOREMBERG', '', 'QUIJANO', 'ARIAS', 'CALLE 24 1A OESTE 47', '3163491236', '0000-00-00', '', 'B+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(196, '7169915', 'FABIO', 'AUGUSTO', 'HERNANDEZ', 'PRADA', 'CRA 22 30-36', '3178323286', '1973-09-13', 'Casado', 'A+', 'ORLANDO HENAO', '3173678956', '', 'SISBEN', '', 'fabiohernandez_33@hotmail.es'),
(198, '1118236047', 'ADRIAN', 'ANDRES', 'TORRES', 'RESTREPO', 'manz 6 casa 2 ', '3108228344', '1984-10-22', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '', '', '', 'torresaa566@gmail.com'),
(201, '94388862', 'LUIS', 'ANGEL', 'MONTOYA', 'GUEVARA', 'CALLE 31 25-34', '3116265073', '1974-08-09', 'soltero', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', ''),
(203, '16347816', 'BERTULFO', '', 'SANCHEZ', '', 'CALLE 4A 22A-18', '3174569848', '1955-11-10', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '', 'EMSANAR', '', ''),
(204, '16352898', 'ARMANDO', '-', 'LOZANO', 'MARQUEZ', 'CALLE 24A 3 OESTE - 44', '3113400820', '1960-01-02', 'Union libre', 'O+', 'ORLANDO HENAO', '-', '3173678956', 'SOS', '-', ''),
(205, '70328379', 'JOHN', 'FREDY', 'FLOREZ', 'OSPINA', 'AVENIDA AGUACLARA 27-07', '3184105639', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(207, '14801879', 'RAFAEL', 'ANTONIO', 'RODRIGUEZ', 'OSPINA', 'DG 23 7A 14', '3175502909', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(208, '94393475', 'CARLOS', 'FERNANDO', 'MENDEZ', 'GARCIA', 'MANZANA 42 CASA 25', '3046715227', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(210, '1112299560', 'JULIAN', 'ANDRES', 'CAICEDO', 'RUIZ', 'PASAJE 18B 32-40', '3156479951', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(211, '14879547', 'MARIO', 'ANTONIO', 'BETANCOURT', 'ORTIZ', 'CRA 11 26B 39', '2302619', '0000-00-00', '', 'A+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(213, '16348299', 'GUILLERMO', '', 'SALAZAR', 'CABAL', 'CRA 34 31-40', '3117508633', '1954-10-27', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '', 'SANITAS', 'R-4 BOLIVAR', 'jfnando148@gmail.com'),
(214, '74187761', 'YOVANNY', '', 'PIZARRO', 'RINCON', 'CALLE 16 29-83', '3176523684', '0000-00-00', '', 'B+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(215, '6501564', 'JORGE', 'LUIS', 'GALLEGO', 'GALVEZ', 'CRA 25CN 6A-15', '3178030576', '1966-02-24', 'soltero', 'A+', 'ORLANDO HENAO', '3173678956', '3173678956', 'ENSANAR', 'NINGUNA', ''),
(216, '94463451', 'JOVANNY', 'ANDRES', 'HERNANDEZ', 'VILLADA', 'CRA 34 27-55', '3177733183', '1982-09-19', 'soltero', 'A+', 'ORLANDO HENAO', '3173678956', '', 'MEDIMAS', '', ''),
(217, '19118868', 'RICARDO', 'ATEHORTUA', 'VALLEJO', '', 'CALLE 33 18-51 PROGRESAR', '3154906843', '1950-07-19', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '3173678956', 'EMSSANAR', '', ''),
(218, '16358710', 'ANDRES', '', 'AVILAN', '', 'CALLE 8B 13-27', '3175387667', '1963-06-11', 'Separado', 'O+', 'ORLANDO HENAO', '-', '3173678956', 'ENSSANAR', 'R-4  ', 'andresavilan1963@gmail.com'),
(219, '1116237256', 'ADRIAN', 'JOHANN', 'GONZALEZ', 'SANCHEZ', 'DIAG 12 25AI-07 LUCITANIA', '3104183679', '1987-03-27', 'soltero', 'O+', 'ORLANDO HENAO', '-', '3173678956', 'MEDIMAS', '-', 'johann2787@gmail.com'),
(220, '6481169', 'LUIS', 'NORMAN', 'RESTREPO', 'HENAO', '', '', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(221, '16357675', 'GUSTAVO', 'ANTONIO', 'OBANDO', 'ZULUAGA', 'CALLE 33 32A 42', '3183453669', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(222, '2473000', 'FABIAN DE', 'JESUS', 'BEDOYA', 'GIL', 'MANZ F CASA 3', '3113566178', '1973-01-22', 'soltero', 'O+', 'ORLANDO HENAO', '', '3173678956', '', '', 'fabiandejesus@hotmail.com'),
(224, '16344226', 'ENRIQUE', '', 'LLANOS', 'ALCALDE', '', '', '0000-00-00', '', 'A+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(225, '16361822', 'JAIME', '', 'VANEGAS', 'SANCHEZ', 'CRA 21 38-47', '3158378960', '1965-07-27', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '', 'EMSANAR', '', ''),
(227, '16359441', 'JOSE', 'IGNACIO', 'SASTOQUE', 'CORREA', 'CRA 12B 26a-05', '3168960726', '2019-10-04', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '', '', '', 'elcorreo0928@gmail.com'),
(228, '2461754', 'LUIS', 'HERNANDO', 'FRANCO', 'SALOMON', 'CALLE 41A 23-41', '3165389064', '1950-02-22', 'Casado', 'B+', 'ORLANDO HENAO', '3173678956', '', '', '', 'eneliasini@hotmail.com'),
(229, '6427997', 'SILVIO', '', 'TONUSCO', 'ERAZO', 'CALLE 30 37-36', '3005144787', '1969-01-15', 'soltero', 'O+', 'ORLANDO HENAO', '', '3173678956', '', '', 'silviotonusco1520@gmail.com'),
(230, '16358436', 'BENJAMIN DE', 'JESUS', 'AMAYA', 'SANCHEZ', 'CRA 30a 32-35', '3127282692', '1963-04-03', 'soltero', 'A+', 'DIANA CASTRILLON', '3127683084', '', '', '', 'mincho049@gmail.com'),
(231, '94150427', 'JUAN', 'MANUEL', 'GONZALEZ', 'RIVERA', '', '', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(232, '16351168', 'JOSE', 'REINEL', 'RAMIREZ', 'GAVIRIA', '', '', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(237, '16356000', 'LUIS', 'ALBERTO', 'VALENCIA', 'OSPINA', 'C21 30-34', '3186509411', '0000-00-00', '', 'A+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(239, '4380640', 'CARLOS', 'JULIO', 'RIOS', 'ORTIZ', 'CALLE 7 20A-04 SANTA ISABEL', '3147362734', '1976-03-25', 'soltero', 'O+', 'ORLANDO HENAO', '', '3173678956', '', '', 'carlosjuliorios5@gmail.com'),
(240, '79431631', 'HERIBERTO', '', 'GARCIA', 'GONZALEZ', 'CRA 22 17-48 LA UINTA', '3172855190', '1964-03-09', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '', 'EMSSANAR', '', 'eri.52.garcia@gmail.com'),
(241, '16367133', 'JOHN', 'JAIRO', 'BALLESTEROS', 'BRAVO', 'MANZ.12 CASA 21', '3152401242', '1968-11-05', 'soltero', 'O+', 'ORLANDO HANAO', '3173678956', '3173678956', 'EMSSANAR ', '-', ''),
(245, '94392656', 'PABLO', 'MAURICIO', 'LOAIZA', 'BETANCURT', 'CRA 38 23-30', '3186423610', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(246, '16348951', 'FERNANDO', '-', 'VINASCO', 'OBANDO', 'nueva aguaclara 2894', '3206038817', '1958-01-27', 'Casado', 'A+', 'ORLANDO HENAO', '-', '3173678956', 'PONAL', '-', NULL),
(247, '16345741', 'LUIS', 'FERNANDO', 'GARZON', 'MUÃ‘OZ', 'CRA 24A 12A 03', '3185598836', '1953-11-29', 'soltero', 'B+', 'ORLANDO HENAO', '3173678956', '', '', '', 'fernandogarzon045@gmail.com'),
(249, '6463740', 'LUIS', 'JAVIER', 'AGUIRRE', 'CASTAÑO', '', '', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(250, '94392568', 'ORLANDO', '', 'ARANA', 'PINILLA', 'CALLE 26B 5-08 SAN PEDRO CLAVER', '3168438788-3168427190', '0000-00-00', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '3173678956', 'EMSSANAR', '', NULL),
(251, '16880646', 'VITELIO', '', 'ARANA', 'CHAPARRO', 'CALLE 4B 22A-09', '3178674730', '1959-10-02', 'soltero', 'A+', 'ORLANDO HENAO', '3173678956', '', 'COOMEVA', 'NINGUNO', 'vitelioarana646@gmail.com'),
(252, '16345114', 'JESUS', 'MARIA', 'CASTIBLANCO', 'SALAZAR', 'CALLE 5C 17-106 NUEVO MILENIO', '3127201078', '1952-04-30', 'soltero', 'B+', 'DIANA CASTRILLON', '3127683084', '', 'EMSSANAR', '', NULL),
(253, '16351197', 'ALBERTO', 'VALDERRAMA', 'GARCIA', '', 'CRA 8 26B 54 BUENOS AIRES', '3163669346', '1958-09-17', 'soltero', 'A+', 'ORLANDO HENAO', '3173678956', '3173678956', 'PONAL', 'CASUR', NULL),
(254, '94386566', 'RODRIGO', '', 'LEMUS', 'RESTREPO', 'CRA 9 14-12', '3188190065', '1973-10-19', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '', 'S.O.S', 'R-4  POSITIVA', 'rodrigolemus103@gmail.com'),
(255, '16348309', 'JOSE', 'JERLEY', 'RUBIANO', 'SANCHEZ', 'CALLE 20 34-66', '3155798832', '1953-01-18', 'soltero', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', ''),
(260, '79824615', 'WILMER', 'EDINSON', 'GAVIRIA', 'BETANCUR', 'CRA 7 23-15', '3224387773', '0000-00-00', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '3173678956', 'ASMED SALUD', 'NINGUNA', NULL),
(261, '1116234727', 'GUSTAVO', 'ADOLFO', 'ARBELAEZ', 'ARBELAEZ', 'CALLE 26 14-12 SALESIANO', '3158308287', '0000-00-00', '', 'A+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(262, '1112101384', 'YEISSON', '', 'RAMIREZ', 'PADILLA', '****', '', '1989-11-04', 'soltero', 'A+', 'DIANA CASTRILLON', '3127683084', '', '', '', ''),
(265, '16365917', 'OSCAR', 'ALCIDES', 'NAVARRETE', 'HURTADO', 'URBANIZACON MARIA CLARA MANZ J CASA', '3168104152', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(266, '16363362', 'JUAN DE', 'JESUS', 'GIRALDO', 'RIVERA', '', '', '0000-00-00', '', 'B+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(267, '1116269565', 'JOHAN', 'MAURICIO', 'GONZALEZ', 'CARDONA', 'CALLE 25A 3-66', '3168866764', '1995-11-08', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '', 'EMSANAR', '', 'johangonzacar@gmail.com'),
(269, '16362513', 'ALBINO', '', 'TANGARIFE', 'CUERVO', 'CALLE 25 1 OESTE 31', '3188102805', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(270, '94392552', 'WALTER DE', 'JESUS', 'ZAPATA', 'GUEVARA', 'LA PAZ', '3184501834', '1974-08-15', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '', 'MEDIMAS', '', ''),
(271, '16345965', 'LUIS', 'ANCIZAR', 'LADINO', 'GRISALES', 'CRA 28A 11-21 BRISAS DE SAN ANTONIO', '3177918618', '1954-03-18', 'soltero', 'A+', 'ORLANDO HENAO', '3173678956', '', '', '', 'ancizarladinot@gmail.com'),
(272, '19134280', 'GILBERTO', '', 'CHAPARRO', 'ARANGO', 'CALLE 12 28B 30', '3182793133', '0000-00-00', '', 'A+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(273, '71742033', 'CARLOS', 'FERNEY', 'HERNANDEZ', 'HERNANDEZ', 'CALLE 25 16-28', '3152873388', '1974-01-09', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '', 'COOMEVA', '', 'carlosfercho09@gmail.com'),
(275, '94357027', 'FRANCISCO', 'ALBERTO', 'GARCIA', 'RODRIGUEZ', 'CRA 3C 21-35 ANDALUCIA', '3117077928', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(276, '1116244199', 'JOSEPH', 'DUVIAN', 'GOMEZ', 'OBANDO', 'CRA 8 20-04', '3168850503', '1989-06-16', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '', 'MEDIMAS', '', 'gomezobandojoseph@gmail.com'),
(277, '2998662', 'ALVARO', 'ISRAEL', 'DIAZ', 'DIAZ', 'CRA 21 21A 37', '3226386045', '1952-10-24', 'soltero', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', 'alvaroisraeldiazdiaz@gmail.com'),
(278, '6433128', 'JOSE', 'ALIRIO', 'CAICEDO', 'HERNANDEZ', 'C 13 26-28', '3182867661', '0000-00-00', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '3173678956', 'EMSSANAR', '', NULL),
(279, '16363992', 'DIEGO', 'FERNANDO', 'CAÑAS', 'CEBALLOS', '', '', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(280, '94389979', 'ALEXANDER', '', 'CASTELLANOS', 'RODRIGUEZ', '', '', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(281, '94395319', 'ANDRES', 'FELIPE', 'CARDENAS', '', 'CRA 15A W20', '3113462690', '1978-05-16', 'soltero', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', ''),
(283, '94154533', 'JULIO', 'CESAR', 'ANACONA', 'BARACETA', '', '', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(284, '16361147', 'JOSE', 'ALBEIRO', 'CASTRO', 'CABRERA', 'CRA 2B 19-54', '3178058875', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(285, '16367835', 'ISMAEL', 'ANGEL', 'SALAZAR', 'HINCAPIE', 'CLL 5 B 18-14', '3165003148', '1969-02-26', 'soltero', 'A+', 'ORLANDO HENAO', '3173678956', '', '', '', 'pomponio539@gmail.com'),
(287, '94152048', 'RUBEN', 'ANTONIO', 'SOTO', 'DUQUE', 'CALLE 13A 48-39', '3007975384', '1980-04-21', 'soltero', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', 'rubenantoniosoto2019@gmail.com'),
(288, '16364702', 'ROBERTO', '', 'COLORADO', 'DIAZ', '', '', '0000-00-00', '', 'A+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(289, '94391968', 'JAVIER', 'MAURICIO', 'OSORIO', 'VALENCIA', 'CALLE22A 5-31', '3158435753', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(290, '1116158173', 'ALEXANDER', '-', 'OSORIO', 'GALLEGO', 'CALLE 7 22B-40', '3137489107', '1992-11-23', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '3173678956', 'SOS', 'EQUIDAD', 'osorioalexander912@gmail.com'),
(291, '94367960', 'FERNANDO', '', 'VILLARREAL', 'MOLINA', 'CALLE 25C 11-28', '3154845498', '1972-10-01', 'soltero', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', ''),
(292, '16351328', 'JOSE', 'ALBERTO', '', 'ARIAS', 'MZA 8 C17 BOSQUES', '3165608669', '1958-03-19', 'Casado', 'O+', 'ORLANDO HENAO', '3173678956', '3173678956', 'EMSSANAR', '', NULL),
(293, '94279542', 'JOSE', 'VIDAL', 'TORRES', 'MENDEZ', 'CALLE 29 34-18', '3102962769', '2020-09-04', 'soltero', 'A+', 'ORLANDO HENAO', '3173678956', '3173678956', 'MEDIMAS', 'LIBERTY', ''),
(294, '6498256', 'GERMAN', '', 'DUQUE', 'NOREÃ‘A', 'CALLE 46 25D-18 NUEVO PRINCIPE', '3183704573', '1966-07-09', 'soltero', 'O+', 'ORLANDO  HENAO', '', '3173678956', 'EMSSANAR', '', 'germanduque011@gmail.com'),
(295, '16367886', 'GUSTAVO', '', 'SUAREZ', 'TABORDA', 'CALLEJOS MATE L 4', '3206082216', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(296, '9805605', 'DUVIER', '', 'QUINTERO', 'CARDONA', 'BARRIO EL PARAISO MANZ O CASA 28', '3166398425', '1963-03-08', 'soltero', 'O+', 'ORLNADO HENAO', '-', '3173678956', 'ENSSANAR', '-', NULL),
(297, '6197383', 'FERNANDO', '', 'MENA', 'CARDENAS', '', '', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(298, '15906786', 'EMILIO', '', 'GARZON', 'MARTINEZ', 'CALLE 26 11-07 BOLIVAR', '3173499536', '1956-09-01', 'soltero', 'O+', 'ORLANDO HENAO', '', '3173678956', '', '', ''),
(301, '16363380', 'JOSE', 'IGNACIO', 'CRUZ', 'AGUIRRE', 'CALL 9 23-03', '3162868295', '0000-00-00', 'soltero', 'O+', 'ORLANDO HENAO', '-', '3173678956', 'CAFESALUD', '', NULL),
(303, '1121851197', 'OSCAR', 'LEVINSON', 'MARTINEZ', 'JIMENEZ', '', '', '0000-00-00', '', 'AB+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(304, '18410826', 'FRANCISCO', 'ANTONIO', 'BARCO', 'RAMIREZ', '', '', '0000-00-00', '', 'O-', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(306, '6110685', 'JOSE', 'RAMIRO', 'CARDONA', 'RESTREPO', 'CRA 22 3B-19', '3164773812', '1971-05-04', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '', '', '', ''),
(307, '1116233042', 'LUIS', 'ALBERTO', 'MUÑOZ', 'MARIN', 'C 25A 392', '3155389974', '0000-00-00', '', '', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(309, '16352638', 'GERARDO', 'ANTONIO', 'DELGADO', 'RESTREPO', 'CRA 24A 39-72', '3165637418', '0000-00-00', 'soltero', 'A+', 'ORLANDO HENAO', '3173678956', '3173678956', 'EMSANAR', 'NINGUNA', NULL),
(311, '16369187', 'EUCLIDES', '', 'CRIOLLO', 'MERA', 'CRA 30 14-29 casa 28', '3184746858', '1970-06-06', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '', '', '', 'aaniibaalc.am45@gmail.com'),
(312, '1116268991', 'JULIAN', 'ALBERTO', 'ALFONSO', 'CASTELLANOS', 'CRA 18A 35-16 PROGRESAR', '3174604463', '2020-06-30', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '3173678956', 'EMSSANAR', '-', NULL),
(313, '94284630', 'HEBERT', 'ANTONIO', 'TAVAREZ', 'PATIÑO', '', '', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(314, '75143809', 'ADRIAN DE', 'JESUS', 'RODRIGUEZ', '-', 'CALLE 11 28A 125', '3177672993', '1973-10-06', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '3173678956', 'MEDIMAX ', '-', NULL),
(315, '1116271188', 'LUIS', 'FELIPE', 'OROZCO', 'BEDOYA', 'CALLE 26 B1 1-83', '3174611050', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(316, '94390679', 'DIEGO', 'FERNANDO', 'MARTINEZ', 'ORTIZ', 'CRA 10 26B 57', '3164919013', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(317, '4347381', 'JOSE', 'REINEL', 'GRANADA', 'VELASQUEZ', 'CALLE 3 BIS 24-B15', '3146624936', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(318, '16361530', 'ELIEL', '', 'MANZANO', 'SARRIA', 'CORREGIMIENTO LA MARINA', '3182522421', '1965-03-06', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '', 'PONAL', '', ''),
(319, '1116243658', 'FREDDY', 'ALBERTO', 'SUAREZ', 'GUACA', '28-74 AGUACLARA', '3196618361', '1989-04-03', 'Casado', 'A+', 'ORLANDO HENAO', '-', '3173678956', 'EMSSANAR', '-', NULL),
(320, '76267916', 'HENRY', '', 'RODRIGUEZ', 'SANDOVAL', '', '', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(322, '94152512', 'OTONIEL', '', 'LONDOÑO', 'BEDOYA', 'CRA 26 24-19 APT 207', '3128367169', '0000-00-00', '', 'A-', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(324, '6221182', 'AGOBERTO', '', 'TOVAR', 'GARCES', 'CALLE 7A 19-10', '3156464015', '1982-04-06', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '3173678956', 'ASMED SALUD', '', ''),
(325, '1112102896', 'ROBINSON', '', 'TABARES', 'BURITICA', 'CALLE 12B 28A 32', '3156820545', '0000-00-00', '', 'A+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(326, '17325703', 'RODOLFO', 'LUIS CARLOS', 'CASTELBLANCO', 'QUINCHE', 'CALLE 41 33-32', '3105395641', '0000-00-00', '', 'A+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(327, '1096034535', 'PEDRO', 'LUIS', 'MARTINEZ', 'GOMEZ', '', '', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(328, '6433114', 'GERARDO', 'ANTONIO', 'CASTAÃ‘O', 'ARIAS', 'CALLEJON GUASIMO 4-98', '3168352351', '1955-03-30', 'soltero', 'A+', 'ORLANDO HENAO', '3173678956', '', 'EMSANAR', '', ''),
(329, '16366739', 'JUAN', 'CARLOS', 'FLOREZ', 'AGUDELO', 'CRA 22 13B 08', '3166371143', '0000-00-00', '', 'A+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(330, '1116248566', 'VICTOR', 'ALFONSO', 'CORDOBA', 'ORTIZ', 'CALLE 27 5B W 39 VIA RIO FRIO', '3235246274', '1990-10-09', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '3173678956', 'EMSSANAR ', 'EQUIDAD', NULL),
(331, '1113037738', 'ALVARO', 'JAVIER', 'BALLESTEROS', 'YEPES', 'MZ 34 CS 15', '3045985157', '1988-07-17', 'Casado', 'O+', 'DIANA CASTRILLON', '3127683084', '', 'COOMEVA', '', NULL),
(332, '15899103', 'LEONEL DE', 'JESUS', 'AGUIRRE', 'CORTES', 'CRA 20 8-22', '3137341464', '1957-03-12', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '', 'EMSANAR', '', 'leonel.1957@outlook.com'),
(333, '16859099', 'JUAN', 'DIEGO', 'PLAZA', 'QUINTERO', 'CALLE 24A 3-27 LAS AMERICAS', '3107072543', '1969-05-10', 'soltero', 'A+', 'ORLANDO HENAO', '3173678956', '3173678956', 'EMSSANAR', '-', 'juandieplaza11@gmail.com'),
(334, '94256925', 'EDILSON', '-', 'URIBE', 'CORDERO', 'DG 26c 4  tv 3aÂ°-21', '3153317033', '1976-09-16', 'Union libre', 'O+', 'ORLANDO HERNANDO', '-', '3173678956', 'ENSANAR', '-', NULL),
(335, '94395318', 'JHON', 'JAIR', 'COY', 'VIEDMAN', 'C 5A 29-09', '3177342689', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(336, '16361756', 'JOSE', 'OLMES', 'CALERO', 'DUQUE', 'CRA 29 23a-29 VILLA NUEVA', '3155382328', '1964-12-19', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '', 'COOMEVA', 'R-4  POSITIVA', 'jocaleroduque@gmail.com'),
(337, '1116249645', 'HENRY', 'GEOVANNY', 'FLOREZ', 'AYALA', 'CR 8 24-06', '3176687498', '1990-08-26', 'soltero', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', 'nilson.florez1527@gmail.com'),
(338, '16359071', 'FELIX', 'HUMBERTO', 'GARZON', 'TOBON', 'MANZANA P CASA 5 LA PAZ', '3187817591', '1963-09-16', 'soltero', 'O-', 'ORLANDO HENAO', '3173678956', '', '', '', 'fgarzontobon@gmail.com'),
(339, '16362264', 'LUIS', 'CARLOS', 'CASTILLO', 'HERNANDEZ', 'CALLE 22 3A-18', '3167548805', '1965-07-21', 'soltero', 'B+', 'DIANA CASTRILLON', '3127683084', '', '', '', 'lc1904720@gmail.com'),
(340, '16352873', 'ALBERTO', '-', 'GALVEZ', 'NARANJO', 'CALLE 26A 14-42 LA ESPERANZA', '3186218791', '1960-01-15', 'soltero', 'A+', 'ORLANDO HENAO', '-', '3173678956', 'S.O.S', '-', 'albertogalvezn544@gmail.com'),
(341, '94395683', 'FRAY DE', 'JESUS', 'HERNANDEZ', 'GIRALDO', 'CALLE 10 DIAGONAL 20-15', '3173337570', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(342, '1116239601', 'JOHN', 'FREDY', 'GOMEZ', 'OSPINA', 'CALLE 32 18-40', '3217060487', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(343, '94153693', 'SIMON', '', 'TORRES', 'LARGO', 'CALLEJON LOS CAIMOS 28A 56', '3188191076', '0000-00-00', '', 'A+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(344, '2679282', 'LUIS', 'ALBERTO', 'ARIAS', 'QUIJANO', '', '', '0000-00-00', '', 'A+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(345, '94450957', 'EDGAR', 'FERNANDO', 'CARDONA', 'GONZALEZ', '', '', '0000-00-00', '', 'A+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(346, '94390804', 'DIEGO', 'EDICSON', 'ISAZA', 'VEGA', 'CALLE 6 25B 81', '3157154481', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(347, '7843585', 'LUIS', 'ALFONSO', 'OCAMPO', 'CALVO', 'CRA 9 24-19', '3178781735', '1972-04-06', 'soltero', 'O+', 'ORLANDO HENAO', '', '3173678956', '', '', ''),
(348, '16361856', 'JOSE', 'ALBEIRO', 'LOPEZ', 'OSORIO', 'CALLEJOEN EL DIAMENTE 32-43 AGUACLA', '3154367232', '1965-08-08', 'soltero', 'O+', 'ORLANDO HENAO', '', '3173678956', 'NUEVA EPS', 'PENSIONADO', 'josealbeirolopezosorio@hotmail.com'),
(349, '1116232216', 'HECTOR', 'MIGUEL', 'GAONA', 'LEMUS', 'CRA 20A 9A 59', '3158553669', '1986-03-03', 'soltero', 'O-', 'ORLANDO HENAO', '3173678956', '', 'EMSANAR', 'R-4 BOLIVAR', 'hectormiguelgaona@gmail.com'),
(350, '94388276', 'ROBINSON', '', 'HERNANDEZ', 'OROZCO', 'CALLE 41A 30-16', '3146954114', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(351, '6430058', 'JHON', 'JARDY', 'BOLAÃ‘OS', 'ALVARADO', 'CALLE 15 22A65 MARACAIBO', '3138177192', '1984-01-09', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '', 'EMSANAR', '', 'jhonjardyb@gmail.com'),
(352, '1116237349', 'ROBINSON', 'ADOLFO', 'VINASCO', 'GIRALDO', '', '', '0000-00-00', '', 'A+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(353, '16883057', 'FLAVIO', 'ENRIQUE', 'GUERRERO', 'GUEVARA', 'TRANS 9 DIAGONAL 20-26', '3165751071', '0000-00-00', '', 'A+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(356, '1116264655', 'SEBASTIAN', '', 'QUIJANO', 'ARENAS', 'CALLE 24 1A OESTE 45', '3178432959', '0000-00-00', '', 'A-', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(357, '16368213', 'TULIO', 'HERNANDO', 'HENAO', 'MORALES', 'CALLE 13 12BIS 70 SAN ANTONIO', '3146276261', '1969-10-13', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '', 'S.O.S', 'R-4', ''),
(358, '1144144472', 'ANDRES', 'FELIPE', 'NAVARRETE', 'OSPINA', 'CALLE 6A 16-39', '3193368160', '1990-11-17', 'Union libre', 'O+', 'ORLANDO HENAO', '3173678956', '3173678956', '-', '-', NULL),
(360, '16359332', 'JAIRO', '', 'LONDOÃ‘O', 'ARANGO', 'CALLE 40C 27A-16', '2316874-3174743996', '1963-12-31', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '', 'EMSANAR', '', 'jalondonoar@gmail.com'),
(361, '16360234', 'CARLOS', 'ALBERTO', 'GOMEZ', '', 'AGUACLARA CALLEJON CRUZ CASA 6', '3168058161', '0000-00-00', '', 'A+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(362, '2677159', 'JAIRO', '', 'HENAO', 'TORO', 'CALLE 2B-22-04', '2323849', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(363, '1116239249', 'MILTON', 'LEANDRO', 'VASQUEZ', '', 'CALLE 8A-28A-45', '3016939223', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(364, '6211443', 'SILVIO DE', 'JESUS', 'MEJIA', 'GOMEZ', 'CRA 37 29-23', '3216474761', '1959-06-08', 'soltero', 'A+', 'ORLANDO HENAO', '3173678956', '', 'S.O.S', 'NINGUNO', 'silviomejiagomez@gmial.com'),
(366, '6501773', 'HECTOR', 'HERNAN', 'GALLEGO', 'GALVEZ', '', '', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(367, '94388663', 'EFRAIN', '', 'MEJIA', 'GIRALDO', 'DIAG 21 20-49', '3186844437', '1974-06-17', 'soltero', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', ''),
(368, '16364277', 'JULIO', 'CESAR', 'DIAZ', 'GARIBELLO', 'CRA 8 26 G 75', '3175037974', '1967-03-11', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '3173678956', 'EMSSANAR', '-', NULL),
(369, '1116242525', 'JHON', 'FREDY', 'VALENCIA', 'PUPIALES', 'C26 C 14-24', '3229707695', '1988-11-18', 'Union libre', 'A+', 'ORLANDO HENAO', '3173678956', '3173678956', 'EMSANAR', 'LIBERTY', NULL),
(371, '1116258471', 'JESUS', 'DAVID', 'ARISTIZABAL', 'HIDALGO', 'CALLE 4B 18-84', '3215654229', '0000-00-00', '', 'B+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(372, '16365518', 'CARLOS', 'ARTURO', 'PERALTA', 'RESTREPO', 'CRA 25B 44-20', '3164023365', '1967-11-20', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '', 'COOMEVA', 'R-4 BOLIVAR', 'carlosarturoperalta0@gamil.com'),
(374, '1112302165', 'FABIAN', 'ANDRES', 'RAMIREZ', 'BETANCOURT', '', '', '0000-00-00', '', 'A+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(375, '1116232584', 'VICTOR', 'ALFONSO', 'GOMEZ', 'OROZCO', '', '', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(376, '16358364', 'JOSE', 'JAIR', 'RODAS', 'MONTOYA', 'CR 18 20 26', '3157088910', '1963-06-02', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '', 'EMSANAR', '', ''),
(378, '16359543', 'RICARDO', '', 'GIRALDO', 'GIRALDO', 'CRA 22B 15-18', '3104350983', '1964-04-23', 'soltero', 'A+', 'DIANA CASTRILLON', '3127683084', '', '', '', ''),
(379, '1116259669', 'DIEGO', 'ARMANDO', 'PEREZ', 'SERNA', 'Avenida principal de aguaclara 2764', '3172728898', '1193-08-04', 'Union libre', 'O+', 'ORLANDO HENAO', '3173678956', '3173678956', '', '', NULL),
(380, '1116266688', 'JAMES', 'AUGUSTO', 'SANCHEZ', 'BLANDON', 'carrera 25 14-44', '3154133996', '1995-03-13', 'soltero', 'O+', 'ORLANDO HENAO', '-', '3173678956', 'EMSSANAR', '-', NULL),
(381, '4589396', 'JOSE', 'GILBERTO', 'NAVARRO', 'ZULETA', 'CALLE 4 22C 03 EL PALMAR', '3162892133', '1963-11-25', 'soltero', 'A+', 'ORLANDO HENAO', '3173678956', '3173678956', 'EMSSANAR ', '-', NULL),
(383, '16347207', 'HECTOR', 'FABIO', 'GRAJALES', 'SANCHEZ', 'CALLE 12A 28-B-24', '3155325769', '1957-12-03', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '', 'EMSANAR', 'NINGUNO', ''),
(384, '9921199', 'DAIRO DE', 'JESUS', 'GALLEGO', 'ECHEVERRI', 'CRA 8 26-03', '3155779902', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(385, '16359305', 'ALFONSO', '', 'GAMEZ', 'BEJARANO', 'CALLE 5 18', '3127148705', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(386, '94367763', 'JOSE', 'YOHANY', 'COY', 'QUINTERO', 'CRA 3 W  26C 4-16', '3188367378', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(388, '16347927', 'CARLOS', 'ARTURO', 'CORREA', 'ALVAREZ', 'CARRERA 25 No. 35-56', '2244480', '1956-11-07', 'soltero', 'A+', 'ORLANDO HENAO', '', '3173678956', '', '', ''),
(389, '19425001', 'JORGE', 'HERNAN', 'MONAR', 'LOPEZ', 'CALLE 24A 1 OESTE 16', '3187095388', '1961-01-05', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '', '', '', 'jorgemonar0@hotmail.com'),
(390, '16347267', 'GERSAIN', '', 'MUÑOZ', '', 'CALLE 6A 22C 29', '3175368469', '0000-00-00', '', 'A+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(393, '94365416', 'JHON', 'JAIRO', 'LOPEZ', 'CESPEDES', '', '', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(395, '1114060333', 'EDWIN', 'GERARDO', 'BARON', 'SIERRA', 'MZ N CASA 44 LA PAZ', '3006939421', '1990-01-19', 'soltero', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', 'ebaron714@gmail.com'),
(397, '94279604', 'CARLOS', 'ENRIQUE', 'ARANDA', 'LOAIZA', '', '', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(398, '94393109', 'JHON', 'JAIRO', 'GIRALDO', 'RUEDA', '', '', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(399, '94367791', 'DIEGO', 'FERNANDO', 'MARIN', 'GIRALDO', '', '', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(400, '94153947', 'CARLOS', '', 'MURILLO', 'OSPINA', 'CRA 2 20-43', '3154112983', '1981-10-28', 'soltero', 'A+', 'DIANA CASTRILLON', '3127683084', '', '', '', ''),
(402, '1118293541', 'JEICSON', 'DUVAN', 'CASTRO', 'GRISALES', '', '', '0000-00-00', '', 'O-', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(404, '6277179', 'LUIS', 'CARLOS', 'DIEZ', '', 'DIAG 22 20-45 B/STA INES', '3215757506', '1968-07-20', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '', '', '', ''),
(406, '94394984', 'ALEXANDER', '', 'GONZALEZ', 'RAMIREZ', 'DIAG 21A 20-40', '3209590655', '1978-03-01', 'soltero', 'O+', 'ORLANDO HENAO', '', '3173678956', '', '', 'naslygonzanlez@gmail.com'),
(407, '94287542', 'EVER', '', 'TORO', 'PINO', 'AVEN PRINC. AGUA CLARA 28-73', '3233747181', '0000-00-00', '', 'A+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(409, '94365701', 'JORGE', 'ALBEIRO', 'SERNA', 'MOLINA', 'CRA 16 24A 02', '3165822627', '1971-08-31', 'soltero', 'A+', 'ORLANDO HENAO', '3173678956', '3173678956', 'SANIDAD POLICIA', '-', NULL),
(410, '1116242930', 'JUAN', 'CARLOS', 'CASTRO', 'LOPEZ', '', '', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(411, '16356688', 'DAVID', '', 'OSPINA', 'RIOS', 'CRA 21 PASAJE 14 14A-05', '3187694140', '1962-06-25', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '', '', '', 'davidospinarios1962@gmail.com'),
(414, '10472457', 'DIEGO', 'FERNANDO', 'JIMENEZ', 'VELASQUEZ', 'CALLE 26 B 1 1-86', '3147948569', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(415, '16353867', 'JOSE', 'FENER', 'PEREZ', 'VALLEJO', 'ASOAGRIN CALLE 2 OESTE 2C-2 22', '3154380873', '1960-04-20', 'soltero', 'A+', 'ORLANDO HENAO', '', '3173678956', '', '', ''),
(416, '1116233088', 'MIGUEL', 'ANGEL', 'ATEHORTUA', 'BELTRAN', 'CALLE 33A 18-51', '3158521416', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(417, '1112302083', 'HOOVED DE', 'JESUS', 'CASTAÃ‘EDA', 'RAMIREZ', 'CALLE 43 27A-40 LA BASTILLA', '3127737510', '1994-02-19', 'soltero', 'A+', 'ORLANDO HENAO', '3173678956', '', 'MEDIMAS', '', ''),
(419, '16348687', 'CARLOS', 'ALFONSO', 'POTES', 'VILLADA', 'CRA 22A 13A 38', '3174140962', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(420, '14802112', 'JAIDER', 'VICENTE', 'HURTADO', 'TABARES', 'CRA 1BIS 20-61', '', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(422, '1002944439', 'GEOVANY', '', 'VILLADA', 'AGUDELO', '', '', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(424, '79649049', 'OMAR', 'RICARDO', 'CUCAITA', 'GARNICA', 'CRA 25 20-71 TOMAS URIBE', '3005013032', '1972-06-15', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '', '', '', 'azomarcucaita@gmail.com'),
(425, '94367912', 'JOSE', 'LEONEL', 'GRISALES', '', 'CALLE 32 18-24', '3152174678', '1991-07-31', 'soltero', 'O+', 'ORLANDO HENAO', '', '3173678956', 'ENSSANAR', 'R-4 SURA', 'joseleonelgrisales@gmail.com'),
(426, '10111047', 'LEONARDO', '', 'DIMATE', 'MARIN', 'CALLE 9 17-11 SANTA INES', '3216032956', '1962-12-07', 'soltero', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(427, '16369364', 'JUAN', 'CARLOS', 'RIOS', 'RICO', 'AGUACLARA CALLEJON SAN ANTONIO ', '3124932802', '1970-04-16', 'soltero', 'B+', 'DIANA CASTRILLON', '3127683084', '', 'MEDIMAS', '', NULL),
(428, '16352659', 'EFRAIN DE', 'JESUS', 'HENAO', 'OCAMPO', 'CRA 15A 25-50', '3154463752', '1959-11-10', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '', '', '', 'henaoocampoefrain@gmail.com'),
(429, '94280694', 'JOSE', 'ANCIZAR', 'PALACIO', 'SANCHEZ', 'CALLE 5B 16-81 TERECR MILENIO', '3108440054', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(430, '6499446', 'WILMER', '', 'ESPITIA', 'BURBANO', '', '', '0000-00-00', '', 'B+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(431, '1112299062', 'REINER', '', 'GRAJALES', 'MUÑOZ', '', '', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(433, '94279286', 'FABIAN', '', 'RENDON', 'VELASQUEZ', 'BOSQUES MANZ 63 CASA 54', '3166840463', '1968-07-02', 'soltero', 'A+', 'DIANA CASTRILLON', '3127683084', '', '', '', ''),
(434, '1112102661', 'YEISSON', 'LEONEL', 'GRISALES', 'LARA', 'CALLE 32 18-24', '3155113835', '1991-09-02', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '3173678956', 'EMSAR', 'NINGUNA', NULL),
(435, '1116273392', 'HEYDDER', 'CAMILO', 'SUAREZ', 'MARIN', 'CRA 4 OESTE 22-25', '3137594168', '1996-10-12', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '3173678956', '', '', 'heidersuarez96@hotmail.com'),
(437, '94150422', 'LUIS', 'ERNESTO', 'NIETO', 'VELEZ', '', '', '0000-00-00', '', 'A+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(438, '1116268896', 'JOHN', 'ANDERSON', 'NAVARRETE', 'OSPINA', 'CRA 3 20-68', '3173428024', '1995-09-06', 'soltero', 'O+', 'DIANA CASTRILLON', '3127683084', '', 'NUEVA EPS', 'NINGUNO', ''),
(439, '94151908', 'FABIAN', 'ANDRES', 'JIMENEZ', 'VELASQUEZ', 'CRA 3 OESTE 24A 04', '3007948208', '0000-00-00', '', 'AB+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(440, '71625560', 'JUAN', 'HERNANDO', 'BOTERO', 'GOMEZ', 'CALLE 25 23-22', '3202607525', '0000-00-00', '', '', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(441, '16362706', 'HECTOR', 'EDILSON', 'SANCHEZ', 'TABARES', 'CALLE 12C 28A26', '3117545021', '0000-00-00', '', 'A+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(442, '14609773', 'ANDRES', 'ORLANDO', 'RAMIREZ', 'MUÑOZ', '', '', '0000-00-00', '', 'A+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(443, '94392441', 'LEON', 'FERNANDO', 'BEJARANO', 'MEDINA', 'CRA 18 19-29', '2305445', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(444, '1113302627', 'LEONARDO', 'FABIO', 'AGUDELO', 'VALENCIA', 'CRA 36 32-42', '', '0000-00-00', '', '', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(445, '1116257173', 'JOSE', 'MIGUEL', 'MEZA', 'RAMIREZ', 'CRA 23 4A-03', '3113311177', '1992-11-30', 'soltero', 'B+', 'ORLANDO HENAO', '3173678956', '1373678956', 'COOMEVA', '-', NULL),
(446, '16357384', 'ORLANDO', '', 'GARZON', 'TOBON', 'MANZ 63 CASA 13', '3137987577', '1962-10-12', 'soltero', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', 'molis862@hotmail.com'),
(447, '16355666', 'BERNARDO', '', 'NARANJO', 'LOPEZ', 'CALLE 13 28B 13', '3164218987', '1960-12-25', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '', 'NUEVA EPS', '', ''),
(448, '1116239940', 'JHONATHAN', '', 'ALVARADO', 'MONTOYA', 'CARRERA 33A 40 30', '3016493091', '1988-02-27', 'soltero', 'A+', 'DIANA CASTRILLON', '3127683084', '', 'EMSSANAR', '', NULL),
(449, '1096189068', 'LUIS', 'ADOLFO', 'SANCHEZ', 'ORTEGA', 'CALLE 26E 1OESTE 53', '3226575584', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(450, '16225306', 'MOISES', '', 'SERNA', 'BOLIVAR', 'CALLE 13 -10-48', '3178000365', '1971-03-21', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '', '', '', 'sernabolivarmoises@gmail.com'),
(451, '1116272498', 'CRISTIAN', 'ALEXANDER', 'SANCHEZ', 'BLANDON', 'C 27 BIS 12B 06', '3178812888', '1996-08-05', 'Union libre', 'O+', 'ORLANDO HENAO', '', '3173678956', 'S.O.S', 'R-4 SURA', 'cristiansanchezblandon@gmail.com'),
(452, '94395948', 'WILLIAM', 'ALONSO', 'PALACIOS', 'GALVEZ', 'CRA 35 37-34', '3155519557', '1978-09-28', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '3173678956', 'Coomeva', '-', ''),
(453, '6498984', 'EDGAR', 'ANTONIO', 'HERNANDEZ', 'LORZA', 'CRA 24 3B 19', '3165051417', '1979-03-10', 'soltero', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', 'edgarherz79@gmail.com'),
(454, '16369328', 'CARLOS', 'ALBERTO', 'SANCHEZ', 'ARCILA', 'CR 24 39-85', '3183723430', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(456, '16361760', 'OSCAR', 'WILLIAM', 'ERAZO', 'BUSTAMANTE', 'CRA 12A 15A 26', '3152765540', '0000-00-00', '', '', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(457, '94367985', 'JOHN', 'JAMES', 'BETANCOURT', '', 'CRA 25 12B-06 LA GRACIELA', '3156976955', '1972-06-11', 'Casado', 'B+', 'ORLANDO HENAO', '3173678956', '', '', '', 'johnjamesbetancourt@gmail.com'),
(460, '1116257967', 'JHONATHAN', '', 'ARISTIZABAL', '', 'M5 C 10', '3103627785', '1192-06-17', 'soltero', 'A+', 'ORLANDO HENAO', '3173678956', '3173678956', '', '', NULL),
(461, '16364520', 'JUAN', 'CARLOS', 'MONTOYA', 'MORALES', 'NARIÃ‘O CALLEJON EL LIMAR 25-57', '3184402039', '1967-05-05', 'soltero', 'A+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(462, '14795441', 'JOSE', 'LEONARDO', 'LOPEZ', 'USUGA', 'TRANV 12 25B-59', '3235159418', '1982-06-21', 'soltero', 'O+', 'ORLANDO  HENAO', '-', '3173678956', '-', '-', 'lopezusugaleonardo@gmail.com'),
(463, '8431471', 'JUAN', 'PABLO', 'OBANDO', 'OSSA', 'CRA 30 39-39', '3186489386', '1980-09-05', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '', 'EMSANAR', '', 'pablito-@hotmail.com'),
(465, '1116247105', 'JAIME', 'ANDRES', 'MAYORGA', 'URIBE', 'CALLE 22A 4-03', '3186966855', '1990-05-30', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '', 'MEDIMAS', 'NINGUNO', ''),
(466, '1116250170', 'EDWIN', 'HERNAN', 'TORO', 'TREJOS', 'DIAG 26C 3 TRANSV W 4W-28', '3122376731', '1991-04-02', 'soltero', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', 'edwin_250170@hotmail.com'),
(467, '94389730', 'FREDY', 'HERNANDO', 'MUÃ‘OZ', 'PULGARIN', 'CALLE 41 34A 109 CENEGUETA', '3157136445', '1974-06-27', 'soltero', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', 'freddymunoz192@gmail.com');
INSERT INTO `conductor` (`id_conductor`, `codigo`, `nombre1`, `nombre2`, `apellido1`, `apellido2`, `direccion`, `telefono`, `fecha_nace`, `est_civil`, `tipo_rh`, `acudiente`, `telefonoa`, `celulara`, `eps`, `arl`, `emailc`) VALUES
(468, '16364846', 'JORGE', 'IVAN', 'ROBAYO', 'MAYOR', 'CALLEJON EL MATE 2', '3137671950', '1967-07-27', 'soltero', 'AB+', 'ORLANDO HENAO', '-', '3173678956', '', '', ''),
(469, '16352276', 'LUIS', 'ORLANDO', 'PEÑA', 'CAMACHO', '', '', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(470, '79213245', 'OSCAR', 'ANDRES', 'VILLAMIL', 'ARENAS', 'CRA 26 21-30 TOMAS URIBE', '3182664750', '1977-01-30', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '', 'ENSANAR', 'NINGUNA', 'oscarandres201901@gmail.com'),
(471, '6497803', 'ROBINSON', 'JAVIER', 'PEDROZA', 'VIVAS', '', '', '0000-00-00', '', 'B+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(473, '94385804', 'HECTOR', 'FABIO', 'BERMUDEZ', 'SUAREZ', 'CRA 33 42B 38', '3174182191', '1975-01-26', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '', '', '', ''),
(477, '16368457', 'JOSE', 'ARGEMIRO', 'COY', 'VIEDMA', 'CALLE 3 BIS 24-05', '3107447581', '1969-11-30', 'soltero', 'O+', 'ORLANDO HENAO', '-', '3173678956', 'ENSSANAR', '-', 'coyviedma69@gmail.com'),
(478, '16348317', 'LUIS', 'MARIO', 'GARCIA', 'RIOS', 'CALLE 12D 28B 17 EL BOSQUE', '3128099725', '1957-01-19', 'soltero', 'A+', 'ORLANDO HENAO', '-', '3176378956', 'ENSANAR', 'LIBERTY', 'luismariogarcia1957@gmail.com'),
(479, '14802258', 'GERMAN', 'ELIAS', 'VARGAS', 'ARANGO', 'CALLE 14 49-20', '3232980246', '1983-10-21', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '', 'EMSANAR', '', 'vgermanelias@gmail.com'),
(480, '1116237768', 'JOSE', 'NELSON', 'VELEZ', 'GIRALDO', '', '', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(481, '16360437', 'JOSE', 'RAIMUNDO', 'FRANCO', '', 'CR 18 21-08', '3103850155', '0000-00-00', '', '', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(482, '6500305', 'JHON', 'PEDRO', 'GONZALEZ', 'SALAZAR', 'MANZ 64 CASA 18', '3168044992', '1979-07-10', 'soltero', 'A+', 'ORLANDO HENAO', '317678956', '317678956', 'EMSANAR', 'NINGUNA', 'jhon.gonzalez.pedro@gmail.com'),
(483, '94390390', 'LUIS', 'FELIPE', 'ALVAREZ', 'LOPEZ', 'MANZ 30 CASA 15 BOSQUES', '3146334698', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(485, '1116258069', 'DANIEL', '', 'PADILLA', 'LOPEZ', '', '', '0000-00-00', '', 'A+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(486, '94283401', 'CARLOS', 'ALBERTO', 'CORTES', 'OSPINA', 'CALLE 38 27-128', '3177874971', '1974-01-11', 'Casado', 'O-', 'ORLANDO HENAO', '3173678956', '3173678956', 'SOS', 'SURA', NULL),
(488, '16803749', 'RAUL', 'ALBERTO', 'SANTAMARIA', 'BERMUDEZ', 'CRA 1 OESTE 22 42 NUEVO FARFAN', '3176938888', '1981-05-17', 'soltero', 'B+', 'ORLANDO HENAO', '-', '3173678956', 'EMSSANAR', '-', NULL),
(489, '12256667', 'WALTHER', '-', 'VARGAS', 'ORTIZ', 'CALLE 9A 28A-37', '3157170103', '0000-00-00', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '-', 'NUEVA EPS', '-', NULL),
(490, '1116237258', 'YONATAN', 'FABIAN', 'DIAZ', 'ROJAS', '', '', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(491, '18511046', 'JOHN', 'JAMES', 'SOTO', 'VALENCIA', 'calle 7 20-08', '3174121772', '1973-08-10', 'soltero', 'B+', 'ORLANDO HENAO', '3173678956', '', 'EMSANAR', '', ''),
(493, '93379222', 'CARLOS', 'EDUARDO', 'ARISTIZABAL', 'ORTIZ', 'CALLE 5A 22-28', '3105278256', '1969-05-24', 'soltero', 'O+', 'ORLANDO HENAO', '', '3173678956', 'S.O.S', 'NINGUNO', 'CHARLIE.ARISTY@GMAIL.COM'),
(495, '16363089', 'NELSON', '', 'GARCIA', 'MENDEZ', 'CALLE 13 BIS 22-26', '3155430079-3113413191', '1965-12-23', 'soltero', 'AB+', 'ORLANDO HENAO', '3173678956', '', 'S.O.S', '', 'negame23@hotmail.com'),
(496, '6501605', 'MARTIN', 'EMILIO', 'PUENTES', 'MALAVER', 'CRA 12-544', '3156620411', '1968-10-25', 'Union libre', 'O+', 'ORLANDO HENAO', '3173678956', '3173678956', 'EMMSANAR ', '-', NULL),
(497, '1115419454', 'JOSE', 'LUIS', 'VALENCIA', 'RENDON', 'CALLE 25A 8-30', '3178309685', '1988-04-01', 'soltero', 'A+', 'ORLANDO HENAO', '3173678956', '', 'NUEVA EPS', '', ''),
(498, '94392906', 'JOSE', 'NAIN', 'GOMEZ', 'ARANGO', 'CALLE 18 1-37 LIMONAR', '3217466625', '1971-05-01', 'Casado', 'A+', 'ORLANDO HENAO', '', '3173678956', 'EMSANAR', 'NINGUNO', 'josenaingomezarango@gmail.com'),
(499, '16352171', 'EVERARDO', 'ANTONIO', 'OSPINA', 'GOMEZ', 'CRA 49B 14A 33', '3176816964', '0000-00-00', '', 'A+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(500, '94388486', 'LUIS', 'FELIPE', 'POSSO', 'GOMEZ', 'CRA 24 20A 59', '3176865690', '1974-06-02', 'soltero', 'A+', 'ORLANDO HENAO', '3173678956', '', '', '', ''),
(501, '94367721', 'FRANCINY', '', 'MORALES', 'ROZO', 'CRA 18 20-14', '3153073658', '1973-02-19', 'soltero', 'O-', 'DIANA CASTRILLON', '3127683084', '', '', '', ''),
(502, '1116259970', 'JOSE', 'JOHAN', 'MORENO', 'CEBALLOS', 'MANZ. B CASA 30 LA PAZ', '3156814741', '1993-09-01', 'soltero', 'O+', 'ORLANDO HENAO', '', '3173678956', 'S.O.S', 'R-4 LIBERTY', ''),
(503, '1116265760', 'ANDRES', 'MAURICIO', 'VILLAREAL', 'VALENCIA', 'CALLE 25 11-28', '3186938775', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(504, '94391374', 'JULIAN', '-', 'HENAO', 'HOLGUIN', 'CALLE 8 22 BIS 29 MUNICIPAL', '3178580948', '1975-06-09', 'soltero', 'O+', 'ORLANDO HENAO', '-', '3173678956', 'EMSSANAR', '-', ''),
(505, '94392582', 'GILBERTO', '', 'HENAO', 'DAVILA', '****', '', '1977-01-14', 'soltero', 'B+', 'DIANA CASTRILLON', '3127683084', '', '', '', ''),
(507, '16367145', 'JORGE', 'ENRIQUE', 'MARMOLEJO', 'BETANCOURTH', '', '', '0000-00-00', '', 'AB+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(508, '16366345', 'CARLOS', 'ALBERTO', '', 'RIVAS', 'LA VILLA', '3188081528', '1968-01-19', 'soltero', 'A+', 'ORLANDO HENAO', '', '3173678956', 'EMSSANAR', 'R-4 BOLIVAR', ''),
(510, '1112102563', 'JHONATAN', 'MARTIN', 'VELANDIA', '', 'CALLE 20 25-07', '3164961857', '1990-12-24', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '3173678956', 'SALUDCOOP ', '', 'martin90evelyn20@gmail.com'),
(514, '12196841', 'ARNOLDO DE', 'JESUS', 'AMAYA', 'COSSIO', '', '', '0000-00-00', '', 'A+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(517, '1116248207', 'MIGUEL', 'ANGEL', 'MOLINA', 'DUQUE', 'CRA 2 OESTE 22-03', '3152813437', '1990-08-27', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '', 'MEDIMAS', '', ''),
(518, '94153744', 'ORLANDO', 'ANDRES', 'DUQUE', 'ORTEGON', 'CARERRA 27A 34-11', '3157566025', '1981-09-30', 'soltero', 'O+', 'ORLANDO HENAO ', '-', '3173678956', 'ENSSANAR', '-', NULL),
(520, '16362245', 'EDILSON', '', 'ARISTIZABAL', '', 'CRA 26 38-149', '3147105542', '0000-00-00', '', 'A+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(522, '6272791', 'FRANCISCO', 'EMILIO', 'AMAYA', 'SANCHEZ', 'C 39 33A49', '3117323299', '1957-12-09', 'soltero', 'A+', 'DIANA CASTRILLON', '3127683084', '', '', '', ''),
(523, '94153386', 'CARLOS', 'HUMBERTO', 'TANGARIFE', 'CUERVO', 'C 23A 16-04', '3156750020', '1980-11-15', 'soltero', 'B+', 'ORLANDO HENAO', '3173678956', '', 'EMSSANAR', 'NINGUNO', 'carloshtangarife@gmail.com'),
(524, '6427738', 'LUIS', 'JAIR', 'CAICEDO', 'HERNANDEZ', 'C 14 22B 04', '3183754280', '2018-05-08', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '', 'EMSANAR', '', ''),
(525, '12195395', 'LUIS', 'ALEJANDRO', 'SANCHEZ', 'EMBUS', 'CALLE 13 9A 52', '3166568591', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(526, '16380040', 'EDILSON', '', 'ALZATE', 'GALVIZ', 'CRA 49B 14B 26', '3157590995', '1956-09-01', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '', 'EMSANAR', '', ''),
(529, '10051185', 'CARLOS', 'ALBERTO', 'HERNANDEZ', 'GOMEZ', 'cra 32 31-39 VICTORIA', '3188994957', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(531, '397504', 'EDWIN', '', 'RUELAS', 'CANAZA', 'CRA 24B 45-46 NUEVO PRINCIPE', '3187414155', '1971-07-25', 'soltero', 'O+', 'ORLANDO HENAO', '-', '3173678956', 'SANITAS', '-', ''),
(532, '16360326', 'JOSE', 'MANUEL', 'GONZALEZ', 'GUTIERREZ', 'CRA 30 38-57', '3172470522', '0000-00-00', '', 'A+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(533, '14802387', 'EVERT', '', 'GRISALES', 'GONZALEZ', 'LA MARINA', '3153119555', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(534, '80549563', 'WILLINTONG', '', 'AMAYA', 'LOPEZ', 'CRA 23 3B 16 PALMAR', '3148449093', '1984-11-24', 'soltero', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', 'willimtong1984@gmail.com'),
(535, '16839175', 'JOHN', 'SEIR', 'CEBALLOS', 'CASTRO', 'MANZANA F CASA 16', '3046398487', '1978-07-23', 'Casado', 'O+', 'ORLANDO HENAO', '3173678956', '3173678956', 'EMSSANAR ', '-', NULL),
(537, '16369936', 'JOHN', 'FREDDY', 'SERNA', 'VELASQUEZ', 'CRA 38C1 13-79', '3178899862', '1970-06-06', 'soltero', 'A+', 'ORLANDO HENAO', '-', '3176378956', 'MEDIMAS', '-', 'pipejohnser@gmail.com'),
(540, '1116232608', 'ANDRES', 'FELIPE', 'TREJOS', 'OSORIO', 'CRA 20 21-90', '3187399320', '0000-00-00', '', '', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(542, '16365848', 'JORGE', 'ALBEIRO', 'GOMEZ', 'OCAMPO', 'CALLE 34 35-17', '3167470470', '0000-00-00', '', 'A+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(543, '1116236838', 'GREINS', '', 'CARDONA', 'NAÃ‘ES', 'MANZ 54 CASA 30', '3188710446', '1987-04-07', 'Union libre', 'O+', 'ORLANDO HENAO', '3173678956', '', 'SANITAS', 'R-4 LA EQUIDAD', 'greins123@hotmail.com'),
(544, '16365989', 'JOSE', 'ALBEIRO', 'JARAMILLO', 'AGUIRRE', 'CRA 5 A OESTE 25-76', '3184097540', '1967-01-13', 'soltero', 'A+', 'ORLANDO HENAO', '-', '3173678956', 'MEDIMAS', 'SURA', ''),
(547, '91234588', 'HENRY', '', 'CERVERA', 'RODRIGUEZ', 'CALLE 1 24-54 PORTALES DEL RIO', '3188223964-3168223964', '1964-10-24', 'soltero', 'O+', 'ORLANDO HENAO', '', '3173678956', 'MEDIMAS', '', ''),
(548, '9845593', 'RAMIRO', '', 'SEPULVEDA', 'DIAZ', 'CALLE 18A 2A-66 PORTAL DE GUAYACAN', '3117973306', '1970-05-07', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '', 'MEDIMAS', 'NINGUNO', 'ramiro.sepulvedatax@hotmail.com'),
(549, '14801806', 'YOBANY', '', 'LOPEZ', 'USUGA', '', '3165890158', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(552, '6356956', 'JOSE', 'EDUCARDO', 'RAMIREZ', 'CARDENAS', 'CALLE 32 34-62 VICTORIA', '3122871366', '1956-09-01', 'soltero', 'O-', 'ORLANDO HENAO', '', '3173678956', 'MEDIMAS', 'R-4', ''),
(553, '94231051', 'JHON', 'FELIX', 'RIOS', 'LOAIZA', 'MANZ P CASA 20 PARAISO', '3234546769', '1979-01-06', 'soltero', 'A+', 'ORLANDO HENAO', '3173678956', '', '', '', 'jhonfelixrl060179@gmail.com'),
(554, '16364038', 'HERNANDO', '', 'LONDOÃ‘O', '', 'CRA 22 22-29 PALO BONITO', '3146180229', '1967-01-21', 'soltero', 'A+', 'ORLANDO HENAO', '3173678956', '3173678956', 'EMSSANAR', '-', 'londonoh17@gmail.com'),
(555, '16354647', 'JORGE', 'ANTONIO', 'SUAREZ', 'VALENCIA', 'CALLE 38 23-14', '3193971890', '0000-00-00', '', 'A+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(556, '94366792', 'MARINO', 'ALBERTO', 'BEJARANO', 'LANCHEROS', 'MANZ 10 C 24', '3166091649', '0000-00-00', '', 'B+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(559, '94366603', 'JAIRZINHIO', '', 'TROCHEZ', 'CALVO', 'MANZANA 36 CASA 5', '3175477335', '2019-04-25', 'soltero', 'A+', 'ORLANDO HENAO', '3173678956', '', '', '', 'jatroca25@gmail.com'),
(560, '94152482', 'ELBER', 'OBDULIO', 'GARCIA', 'CASTRO', 'DIAG 22 20-54', '3177711815', '1980-12-03', 'soltero', 'O+', 'ORLANDO HENAO', '', '3173678956', '', '', 'Garciaelber54@gmail.com'),
(562, '1094916141', 'CRISTIAN', 'CAMILO', 'CONTRERAS', 'CARDONA', 'CALLE 27 16-19 LA ESPERANZA', '3153326710', '1990-02-23', 'soltero', 'O+', 'DIANA CASTRILLON', '3127683084', '', 'EMSSANAR', '', NULL),
(564, '16346955', 'IGOR', 'ANTONIO', 'MANZANO', 'PALACIO', 'CRA 28BIS 12B 32', '3153972055', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(565, '94394043', 'MIGUEL', 'ANGEL', 'USUGA', 'HIGUITA', 'ME CASA 29', '3504867076', '1977-09-21', 'soltero', 'A+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(566, '14797015', 'ANDRES', 'MAURICIO', 'TORRES', 'RAMIREZ', 'AGUACLARA CALLEJON EL DIAMANTE 2 ET', '3186025220', '1982-09-03', 'Casado', 'A+', 'ORLANDO HENAO', '', '3173678956', 'EMSSANAR', 'R-4 BOLIVAR', ''),
(567, '94388715', 'GILMER', '', 'FLOREZ', 'BURBANO', '', '3116092798', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(569, '16362676', 'ROBINSON', '', 'MOSQUERA', 'BALANTA', 'CRA 21 8-27', '2310116 -3205745275', '1966-03-25', 'soltero', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', 'mosquerabalanta66@gmail.com'),
(570, '5887642', 'ORLANDO', '', 'CUELLAR', 'GONZALEZ', 'TRANS 12 14A 82', '3108270408', '1966-06-03', 'soltero', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', 'orcugo@hotmail.com'),
(573, '94304445', 'CEIFAR', '', 'BATALLA', 'GUERERRO', 'cl limar 25-53', '3206249763', '1979-10-20', 'soltero', 'O-', 'ORLANDO HENAO', '3173678956', '', 'EMSANAR', '', 'ceifarguerrero1979@gmail.com'),
(576, '16352745', 'CARLOS', 'ORLANDO', 'CARDONA', 'VALLEJO', 'CALLE 40A 27C 42', '3188286553', '0000-00-00', '', 'O-', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(578, '94283076', 'LUIS', 'EDUARDO', 'MARIN', 'MARIN', 'C9A 20-26', '3144339253', '0000-00-00', 'soltero', 'O+', 'ORLANDO HENAO', '-', '3173678956', 'ENSSANAR', '-', NULL),
(579, '1118288471', 'JEISON', '', 'OSPINA', 'AGUIRRE', '', '3167984000', '0000-00-00', '', '', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(580, '16354086', 'JULIO', 'CESAR', 'ISAZIGA', 'LOZANO', 'CALLE 31A 35-56', '3107386954', '1960-08-15', 'soltero', 'A+', 'ORLANDO HENAO', '-', '3173678956', 'ENSSANAR', '-', 'jullmr@hotmail.com'),
(582, '1116257491', 'YONNY', 'ALEJANDRO', 'MORALES', 'LABRADA', 'MANZANA G-C19', '3172789173', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(583, '10185219', 'FREDDY', 'ALEXANDER', 'CARDONA', 'DELGADO', 'MZ 50 C 24', '3178071077', '1977-03-18', 'soltero', 'A+', 'ORLANDO HENAO', '-', '3173678956', 'EMSANAR', '-', NULL),
(584, '14795903', 'JAIME', 'ANDRES', 'VALENCIA', 'VARON', 'TRANSV 12 5-21', '3157188054', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(586, '4486005', 'ALFONSO', '', 'GONZALEZ', 'ZULUAGA', 'M J C5 10 PARAISO', '3115843706', '0000-00-00', '', '', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(587, '94369459', 'RODRIGO', '', 'GUERRERO', 'ESCALA', 'C 12B 27C-47', '3165332986', '1974-03-25', 'soltero', 'B+', 'ORLANDO HENAO', '-', '3173678956', 'ENSSANAR', '-', NULL),
(590, '1112103351', 'JOSE', 'ABDON', 'VALENZUELA', 'GONZALEZ', 'KRA 28A 10-04', '3173461136', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(592, '16346994', 'FERNANDO', '', 'HOLGUIN', 'RIVERA', 'CALLE 26C1 12-15', '3153338664', '1956-01-25', 'soltero', 'A+', 'ORLANDO HENAO', '3173678956', '', 'SANITAS', 'NINGUNO', ''),
(593, '16353660', 'JAVIER', '', 'RESTREPO', 'SALINAS', 'CRA 36A 20-16', '2254760', '1956-09-01', 'soltero', 'O+', 'ORLANDO HENAO', '', '3173678956', '', '', ''),
(594, '1112102223', 'LORENZO', 'ANDRES', 'GONZALEZ', 'SANCHEZ', 'CALLE 5 19-87', '3184029620', '1990-09-04', 'soltero', 'O+', 'ORLANDO HENAO', '-', '3173678956', 'SANITAS', 'R-4 BOLIVAR', ''),
(595, '1116259410', 'ANDRES', '', 'GALVEZ', 'VILLEGAS', 'CALLE 31 33-41', '3185707220', '1993-07-18', 'soltero', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', ''),
(597, '16360682', 'DIEGO DE', 'JESUS', 'RIVERA', 'HERRERA', '', '', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(598, '7245232', 'HECTOR', 'OCTAVIO', 'MEJIA', 'MONTOYA', 'CRA 27 39-68', '2246237', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(599, '29756437', 'MARIA', 'EUGENIA', 'BECERRA', 'MARIN', 'CRA 27 39-68', '2246237', '1966-11-10', 'soltero', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', ''),
(600, '94152529', 'ORLANDO', '', 'CARDENAS', 'OSPINA', 'CRA 1 BIS 11-28', '3155955287', '1981-02-13', 'soltero', 'O+', 'ORLANDO HENAO', '3173678926', '', 'NUEVA EPS', '', ''),
(601, '6506107', 'CARLOS', 'ALBERTO', 'SARRIA', 'DE LA CRUZ', '', '', '0000-00-00', '', 'AB+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(604, '94153272', 'ERNESTO DE', 'JESUS', 'VASQUEZ', 'GIRALDO', 'MANZ 65 CASA 22', '3186427701', '1980-01-03', 'soltero', 'O-', 'ORLANDO HENAO', '3173678956', '', 'MEDIMAS', '', ''),
(605, '16365101', 'ARGEMIRO', '', 'QUINTERO', 'MILLAN', '', '', '0000-00-00', '', '', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(606, '1116259579', 'STIVEN', '-', 'ESPINOZA', 'GONZALEZ', 'CRA 23 5B-25', '3153158176', '1993-06-07', 'Casado', 'A+', 'ORLANDO HENAO', '3173678956', '3173678956', 'EMSSANAR', '-', NULL),
(607, '1116236677', 'APOLONIO', '', 'SAENZ', 'CORREA', 'CRA 19 31-18 B/ PUEBLO NUEVO', '3174656548', '1987-03-28', 'soltero', 'A+', 'ORLANDO HENAO', '3173678956', '', 'S.O.S.', '', ''),
(608, '4681237', 'JULIAN', '', 'MANCILLA', 'RODRIGUEZ', 'CALLE 20 1A-29 VERANERAS', '3166435219', '1969-01-09', 'soltero', 'AB+', 'ORLANDO HENAO', '3173678956', '', 'EMSSANAR', '', 'julianmancillarodriguez@gmail.com'),
(609, '94153300', 'DIDIER', 'MANUEL', 'ROJAS', 'TORO', '', '', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(611, '1006452714', 'OSCAR', 'EFREN', 'TORRES', 'RESTREPO', 'M C CASA', '3106238128', '1987-03-15', 'soltero', 'O+', 'ORLANDO HENAO', '-', '3173678956', 'EMSSANAR', '-', NULL),
(612, '1116241217', 'JEFFERSON', 'ESTIVEN', 'CORREA', 'DELGADO', 'CALLE 26B 8-03', '3022490219', '1988-07-08', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '-', 'SANITAS', '-', NULL),
(613, '71764389', 'JOSE', 'DEINER', 'ZAPATA', 'OBANDO', 'CRA 18 30-60', '3155157241', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(614, '16320068', 'ISMAEL', 'ALONSO', 'FRANCO', '', 'MANZ 2 CASA 23', '3176246284', '1968-12-06', 'soltero', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', ''),
(615, '15805098', 'ESTANISLAO', '', 'MANCILLA', '', 'CRA 28B 5-39 STA RITA DEL RIO', '3128692095', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(616, '16589351', 'DARIO DE', 'JESUS', 'VELASQUEZ', 'RAMIREZ', 'CRA 20 9A 43', '3185097115', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(617, '1116267648', 'manuel', 'alejandro', 'posso', 'sanchez', 'CALLE 34 16A 07', '3155359802', '0000-00-00', '', 'A+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(618, '6162592', 'TOMAS', 'CASTRO', 'IBASRRA', '', 'CARRERA 3OESTE 26C6 42', '3185564006', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(619, '16731115', 'HENRY', '', 'GONZALEZ', 'LOPEZ', 'CARRERA 33 35 06', '3185849877', '1966-10-15', 'soltero', 'A+', 'DIANA CASTRILLON', '3127683084', '', '', '', 'cenizo93@hotmail.com'),
(620, '16363171', 'DAVER', 'ANTONIO', 'ARISTIZABAL', '', 'DG 21 8-49', '3216216164', '0000-00-00', '', 'A+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(621, '94255026', 'LUIS', 'ALBERTO', 'SERNA', 'VELASQUEZ', 'CALLE 5A 18-09', '3183958623', '1966-01-31', 'soltero', 'A+', 'DIANA CASTRILLON', '3127683084', '', '', '', ''),
(622, '16071869', 'JHON', 'JAIRO', 'SUAREZ', 'JIMENEZ', 'CALLE 35 18-39', '3207460600', '1982-04-10', 'soltero', 'A+', 'ORLANDO HENAO', '3173678956', '', '', '', ''),
(623, '94366846', 'RODRIGO', '-', 'TREJOS', 'OSORIO', 'MANZ A CASA 9 EL MANA AGUACLARA', '3178787260', '1972-02-14', 'soltero', 'A-', 'ORLANDO HENAO', '3173678956', '3178787260', 'ASMESALUD', 'NINGUNA', 'rodrigo.trejos1402@gmail.com'),
(624, '94154612', 'JOSE', 'ABELARDO', 'CASTRO', 'ARCE', 'CALLE 33 18-58', '3202026541', '0000-00-00', '', 'O-', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(625, '16548472', 'NORBERTO', '', 'BENAVIDES', 'MARIN', 'MANZ 30 CASA 27 BOSQUES', '3108371055', '0000-00-00', '', 'O-', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(626, '6427294', 'JOSE', 'ALDEMAR', 'MOSQUERA', 'SANTA', 'CRA 28 A 2 11-34', '3008421436', '0000-00-00', '', 'A+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(628, '73167678', 'SANTIAGO', 'BARLAHA', 'GOMEZ', 'HERNANDEZ', 'DIA17LUSITANIA', '3226242029', '0000-00-00', '', '0', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(630, '14796974', 'MIGUEL', 'ANGEL', 'GIRALDO', 'GIRALDO', '', '', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(631, '6560936', 'CARLOS', 'HUMBERTO', 'GARCES', 'RIAÑOS', 'CALLE 19 13-17', '3157985971', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(633, '6500238', 'HECTOR', 'FABIO', 'FLOREZ', 'ARANGO', 'CRA 24 2C 21', '3004209674', '1978-08-31', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '', 'NUEVA EPS', 'R-4  POSITIVA', 'hectorfabioflorezarango@gmail.com'),
(634, '82385308', 'ANDRES', 'FELIPE', 'CIFUENTES', 'CRUZ', 'CRA 27A 37-174 AVEN. CALI', '3206081679', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(635, '16206986', 'JUAN', 'GREGORIO', 'AMARILES', 'RUIZ', 'CRA 9 26K 58', '3163654051', '1955-03-25', 'soltero', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', ''),
(636, '4239236', 'LUIS', 'ALBERTO', 'JIMENEZ', '', 'CALLE 19 28A 92', '3158175549', '1961-01-23', 'soltero', 'B+', 'ORLANDO HENAO', '-', '3173678956', 'PONAL', '', ''),
(637, '16367900', 'CARLOS', 'ALBERTO', 'CALERO', 'LOZANO', 'CRA 22B 14-26', '3184177406', '1969-07-10', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '3173678956', 'MEDIMAX', '-', NULL),
(640, '6427825', 'JOSE', 'RAMIRO', 'MARTINEZ', 'CASTRO', 'CALLE 26G 9-24 BUENOS AIRES', '3103513637', '1966-03-02', 'soltero', 'A+', 'ORLANDO HENAO', '3173678956', '3173678956', 'NUEVA EPS', '-', NULL),
(642, '9739182', 'RODRIGO', 'JONATHAN', 'TOVAR', 'BOBORQUEZ', 'CARRERA 22B 1651', '', '0000-00-00', '', 'A+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(643, '1121824107', 'FABIAN', 'ENRRIQUE', 'SAIZ', 'CARDONA', 'CALLE 13A 28 BIS 2-76', '3186267366', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(644, '1116232974', 'JOSE', 'ABEL', 'FORERO', 'BUITRAGO', 'CALLE 13A 49-52', '3165639612', '1956-09-01', 'soltero', 'O+', 'ORLANDO HENAO', '', '3173678956', 'MEDIMAS', '-', ''),
(645, '15896456', 'NELSON DE', 'JESUS', 'GOMEZ', 'SALAZAR', 'NARIÑO VIA ANTIGUA 24-91', '3146356380', '0000-00-00', '', 'A+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(646, '12197533', 'YILMOR', '', 'AMAYA', 'COSSIO', 'CRA 23 3B 16 EL PALMAR', '3146970057', '1977-05-30', 'soltero', 'A+', 'ORLANDO HENAO', '3173678956', '', '', '', ''),
(647, '16355940', 'ARMANDO', '', 'ROMERO', 'MARROQUIN', 'CRA 32A 32-73', '3147346185', '1961-12-02', 'soltero', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', ''),
(648, '16348580', 'JAMES', '', 'CARDONA', 'VELASQUEZ', 'CRA 9 7-54', '3113917822', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(650, '16400586', 'YONIER', '-', 'LOPEZ', 'OTALVARO', 'CALLE 33 18-14 PROGRESAR', '3137477009', '1972-02-08', 'soltero', 'O+', 'ORLANDO HENAO', '-', '3173678956', 'MEDIMAS', '-', ''),
(651, '14795137', 'FABIAN', 'ALBERTO', 'FORERO', 'QUICENO', 'MANZ U CASA 24 LA PAZ', '3153711302', '1981-03-16', 'soltero', 'O-', 'ORLANDO HENAO', '3173678956', '', 'EMSANAR', '', ''),
(653, '14802036', 'DUBERNEY', '', 'CARDOZO', 'ARENAS', 'KR 49B-14A10', '3127276969', '1985-11-16', 'soltero', 'A+', 'ORLANDO HENAO', '3173678956', '', 'S.O.S', 'R-4 BOLIVAR', 'cardoduar@hotmail.com'),
(654, '16348563', 'ARTURO', '', 'PEREZ', 'OSPINA', 'CRA 21 12-57', '3166499054', '1958-04-01', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '', '', '', 'gordo0401@hotmail.com'),
(656, '1116232961', 'JHON', 'JADER', 'OSPINA', 'BALLESTEROS', 'CARRERA 22-7A-27', '3162944294', '1986-04-25', 'soltero', 'A+', 'ORLANDO HENAO', '3173678956', '3173678956', 'EMSSANAR', '-', NULL),
(664, '1116245382', 'WISNER', 'ALEJANDRO', 'CARVAJAL', 'RESTREPO', 'CRA 4 OESTE 23-11', '3233354158', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(665, '14796354', 'KLEIMER', 'ANDRES', 'SANCHEZ', '', 'KRA 9 4-34', '3185009896', '0000-00-00', '', 'B+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(666, '94152574', 'CARLOS', 'ALBERTO', 'MADRID', 'SANCHEZ', 'CALLE 26D -12-58', '3184244348', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(667, '6499178', 'YERLEIN', '', 'CAICEDO', 'CIFUENTES', 'KRA 1 25-17', '3008487975', '1979-01-06', 'soltero', 'B+', 'DIANA CASTRILLON', '3127683084', '', '', '', 'yerleincaicedo6@hotmail.com'),
(668, '94434901', 'JORGE', 'ELIECER', 'BUITRAGO', 'DELGADO', 'CALLE 16 28-A2-08', '3008576276', '1988-04-22', 'soltero', 'A+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(669, '79691576', 'JORGE', 'LUIS', 'DURAN', 'MURIEL', 'CRA 27 36-38', '3126919409', '1976-06-05', 'soltero', 'A+', 'DIANA CASTRILLON', '3127683084', '', '', '', ''),
(672, '16358972', 'HUGO', 'FERNANDO', 'CADAVID', 'ARBELAEZ', 'CALLE 8 17-112', '3176524497', '0000-00-00', '', 'B+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(674, '75158886', 'YOVANNY', 'FERNANDO', 'RUIZ', 'LARGO', 'MANZ G CASA 12 URB. LA PAZ', '3015465388', '1984-01-07', 'soltero', 'A+', 'ORLANDO HENAO', '3173678956', '', 'S.O.S', 'R-4', 'fernandoruiz07@hotmail.com'),
(675, '1116261938', 'ANDRES', 'FELIPE', 'SERNA', 'GUEVARA', 'CALLE 6 19-36', '3184377599', '0000-00-00', '', 'A+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(676, '6200156', 'CARLOS', 'EMILIO', 'SUAREZ', 'ORDOÑEZ', 'CRA 4 6-53 LA MARINA', '3123805280', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(677, '16365007', 'NELSON', 'REINEL', 'CORREA', 'CASTAÃ‘O', 'MANZ 67 CASA 23 ', '3184281018', '1967-08-14', 'soltero', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', ''),
(678, '16985972', 'GUSTAVO', '', 'ROJAS', 'RODRIGUEZ', 'CRA 11 26B-59', '3157067294', '1979-03-15', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '', 'SISBEN', '', ''),
(682, '6423259', 'ROBERT', 'ERMINSON', 'MORENO', 'HURTADO', 'AV PRINC AGUACLARA 26-72', '3184973518', '0000-00-00', '', 'A+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(683, '94193416', 'JAMES', 'ERLEY', 'VILLA', 'LOAIZA', 'CALLE 3B 21-19', '3164843409', '1956-09-01', 'soltero', 'B+', 'ORLANDO HENAO', '3173678956', '3173678956', 'COOMEVA', 'R-4 SURA', ''),
(684, '1116254166', 'EDIER', 'FERNANDO', 'RIOS', 'MUÑOZ', 'CALLE 24 6-48 FLORESTA 2 ANDALUCIA', '3233680220', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(685, '16550680', 'FREDY', 'ANTONIO', 'MADRID', 'SANCHEZ', 'MANZ 41 CASA 6 BOSQUES ', '3162062354', '1974-09-09', 'soltero', 'A+', 'DIANA CASTRILLON', '3127683084', '', '', '', ''),
(686, '94367557', 'NORVEY', '', 'ARCE', 'QUINTERO', 'CRA 28C 11-84', '3183841101', '1971-01-22', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '', '', '', 'norbeyarce@gmail.com'),
(689, '1116249417', 'RUBEN', 'DARIO', 'LOAIZA', '-', 'AGUACLARA C- MARTINEZ', '-', '0000-00-00', 'soltero', 'O+', 'ORLANDO HENAO', '3127683084', '3126367044', 'CAFE SALUD', 'NINGUNA', NULL),
(691, '1116269368', 'EDWIN', 'ARLEY', 'QUINTERO', 'DUQUE', 'CALLE 14 10-04', '3146346861', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(693, '1116253561', 'CESAR', 'AUGUSTO', 'MENDOZA', 'ORTIZ', '****', '', '1992-02-09', 'soltero', 'AB+', 'DIANA CASTRILLON', '3127683084', '', '', '', ''),
(695, '6450725', 'JAVIER', '-', 'GRAJALES', 'OSPINA', 'CRA 48B 14A 03', '3137289132', '1957-05-01', 'soltero', 'O+', 'ORLANDO HENAO', '-', '3173678956', 'COOMEVA', '-', NULL),
(696, '2518255', 'RUBEN', 'DARIO', 'ELVIRA', 'LLANTEN', 'MANZ 32 CASA 31 BOSQUES', '3188364616', '1979-05-28', 'soltero', 'O-', 'DIANA CASTRILLON', '3127683084', '', '', '', ''),
(697, '16361021', 'JESUS', 'ORLANDO', 'LENIS', 'GALLEGO', 'CRA 18 30-46', '3166913888', '1964-03-20', 'soltero', 'O-', 'ORLANDO HENAO', '3173678956', '', 'EMSANAR', '', ''),
(698, '94154627', 'FABIAN', 'HERNAN', 'MACHADO', '', 'CRA 23 12-24', '', '1981-09-12', 'soltero', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', ''),
(699, '6315580', 'EDGAR', '', 'HENAO', 'VARELA', 'CALLE 9 17-102 STA INES TRES ESQUIN', '3155481415', '1956-05-26', 'soltero', 'A+', 'ORLANDO HENAO', '3173678956', '3173678956', 'EMSSANAR', '-', NULL),
(700, '16358681', 'JESUS', 'MARIA', 'ZAPATA', 'MAYA', 'CRA 35 27-35 VICTORIA', '3166069614', '1963-08-20', 'soltero', 'O+', 'ORLANDO HENAO', '-', '3173678956', 'EMSSANAR', '-', 'movil558@hotmail.com'),
(701, '6429968', 'HEBERTH', 'ORLANDO', 'ZAPATA', 'GUEVARA', 'CRA 2 20-49', '3234828460', '1983-11-18', 'Casado', 'O+', 'ORLANDO HENAO', '3173678956', '3173678956', 'PONAL', '', 'zapataheberth@hotmail.com'),
(703, '94393465', 'JORGE', 'IVAN', 'BAQUERO', 'GONZALEZ', 'CALLE 13A 49A 45 LA CRUZ', '3146462924', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(704, '6427774', 'ORLANDO DE', 'JESUS', 'CASTRO', '', 'CRA 22 7-22', '3162265409', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(706, '76308635', 'ERIC', 'HERNAN', 'CAÑAR', 'VELASCO', 'calle 13bis 22-63', '3102311243', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(710, '16341850', 'HENRY', '', 'LOPEZ', 'MONTILLO', 'CRA 9 9A 63', '3165730440', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(711, '70161096', 'ALBERTO', 'ANTONIO', 'HERNANDEZ', 'OSORIO', 'CALLE 25 16-28', '3113520967', '1959-11-12', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '', 'S.O.S', 'NINGUNO', ''),
(712, '94365641', 'WILLIAM', 'ESMIR', 'GALLEGO', 'GONZALEZ', 'C 15 15-24', '3165782963', '1971-09-24', 'soltero', 'B+', 'DIANA CASTRILLON', '3127683084', '', '', '', ''),
(714, '10007061', 'JOSE', 'ALIRIO', 'GALLEGO', 'RODRIGUEZ', 'CALLE 25 2-39 FARFAN 2 PISO', '3123261455', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(715, '6500160', 'JAIRO DE', 'JESUS', 'VERA', 'GAMEZ', 'CALLE 20 28A 40', '3168721584', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(716, '15252142', 'LUIS', 'FERNANDO', 'QUICENO', 'LOPEZ', 'CRA 18A 32B 06 PROGRESAR', '3122983513', '1951-12-25', 'soltero', 'A+', 'ORLANDO HENAO', '--', '3173678956', 'COLSANITAS', 'POSITIVA', ''),
(717, '94391227', 'CARLOS', 'ALBERTO', 'CARMONA', 'GONZALEZ', 'MANZ 49 CASA 6 BOSQUES', '3156471237', '0000-00-00', '', 'A+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(718, '94388482', 'LUIS', 'FERNANDO', 'DUQUE', 'MELO', 'CRA 2A 20-70 LAS BERANERAS', '3166550132', '0000-00-00', 'soltero', 'A+', 'ORLANDO HENAO', '-', '3173678956', 'EMSSANAR', '-', NULL),
(719, '1116240516', 'JUAN', 'JAIR', 'RODRIGUEZ', 'ARISTIZABAL', 'CRA 28 34-40', '3013988433', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(720, '14798738', 'LIDER', 'ALBERTO', 'SAENZ', 'BEDOYA', 'CRA 28 BIS 11-27', '3046313188', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(721, '16358960', 'HECTOR', 'FABIO', 'BETANCOUR', 'LONDOÑO', 'CRA 24 3-48', '3178847420', '0000-00-00', '', 'A+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(722, '6446614', 'JULIO', 'CESAR', 'CHACON', 'TANGARIFE', 'CRA 9A 13-13 LA INDEPENDENCIA', '3152426423', '1984-11-07', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '3173678956', 'EMSSANAR', '-', 'julio-chacon-tangarife@hotmail.com'),
(723, '14799943', 'ARLEX', '-', 'GALLEGO', 'SALAZAR', 'CRA 2 22-03', '3178946216', '1984-09-08', 'soltero', 'A+', 'ORLANDO HENAO', '-', '3173678956', 'ENSSANAR', '-', 'ARLEXGALLEGO32@GMAIL.COM'),
(724, '1116235032', 'EDWIN', 'ARMANDO', 'CERVERA', 'GOMEZ', 'CALLE 1 24-54', '3164934593', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(725, '79310988', 'LUIS', 'ALBEIRO', 'VALDES', '', 'M 39', '3106512135', '0000-00-00', '', 'O-', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(726, '94151515', 'JHON', 'JAIRO', 'JARAMILLO', 'ANDRADE', 'BOSQUES MANZ 21 CASA 27', '3014771115', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(729, '71941594', 'ERNEDY', '', 'HURTADO', 'ZAPATA', 'CRA 20 902 SANTA ISABEL', '3187220611', '1972-05-10', 'soltero', 'AB+', 'DIANA CASTRILLON', '3127683084', '', '', '', ''),
(730, '94150804', 'HECTOR', 'FABIO', 'GALLO', 'HENAO', 'CALLE 13 9A-46', '3152258733', '1979-06-20', 'soltero', 'O+', 'ORLANDO HENAO', '-', '3173678956', 'MEDIMAS', '-', 'hectorgallo94@hotmail.com'),
(731, '6428548', 'CARLOS', 'JULIAN', 'ARIAS', 'SEPULVEDA', 'MANZ 40 CASA 42 BOSQUES ', '3193665748', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(732, '16353648', 'JOSE', 'HIPOLITO', 'ROZO', 'JEREZ', 'CALLE 25B 5-63', '3186887535', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(733, '1116249226', 'JHON', 'FABIO', 'GONZALEZ', 'LOPEZ', 'CALLE 13 10-36 SEGUNDO PISO', '3188762510', '1990-12-25', 'soltero', 'O+', 'ORLANDO HENAO', '', '3173678956', 'EMSSANAR', 'R-4 BOLIVAR', 'johnraque@hotmail.com'),
(735, '7531713', 'DUVERNEY', '', 'CUERVO', 'MUÃ‘OZ', 'C 30 24A 33', '3168713525', '1960-06-06', 'soltero', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', ''),
(736, '14798905', 'JOSE', 'ALEJANDRO', 'MEJIA', 'AGUDELO', 'CRA 18D 33-19', '3225386959', '1984-03-06', 'soltero', 'AB+', 'ORLANDO HENAO', '3173678956', '', 'COOMEVA', 'NINGUNO', ''),
(737, '1112301743', 'LUIS', 'ESTIVEN', 'GALVIS', 'TASCON', 'CRA 1 BIS 11-05', '3225423914', '1993-03-08', 'soltero', 'A+', 'ORLANDO HENAO', '3173678956', '3173678956', 'EMSSANAR', 'NINGUNO', ''),
(739, '16402789', 'DIEGO', 'FERNANDO', 'ARIAS', 'GARCIA', 'MANZ 55 CASA 39 BOSQUES', '3103589456', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(741, '16366780', 'CARLOS', 'ARTURO', 'HOYOS', '', 'CALLE 12B 28B 68', '3163642639', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(743, '16364639', 'JAIRO', '', 'PELAEZ', 'CANO', 'CALLE 3B 24A 70 PORTALES DEL RIO', '3128607963', '1967-04-26', 'soltero', 'A+', 'ORLANDO HENAO', '3173678956', '', '', '', ''),
(745, '6432326', 'ARTURO', '', 'OROZCO', '', 'CALLE 25B 7-21 SAN PEDRO CLAVER', '3163952410', '0000-00-00', '', 'A+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(746, '2677059', 'GONZALO', '', 'PEÃ‘A', 'MOSQUERA', 'CALLE 13A 28 BIS 228', '3052952058', '1955-08-27', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '', '', '', 'gonzalopm27@gmail.com'),
(747, '16366645', 'JHON', 'JAIRO', 'VELEZ', 'RIVERA', 'CAR 38 31A 72', '3155026589', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(748, '1114059490', 'FIDEL', 'ARTURO', 'RODRIGUEZ', 'ALEMAN', 'CRA 8 14A 51', '3152029866', '0000-00-00', '', 'A+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(750, '94257848', 'JOSE', 'AUGUSTO', 'MUÑOZ', 'MILLAN', 'CRA 25B 13A 34', '3127597574', '0000-00-00', '', 'B+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(751, '4385797', 'ALBEIRO DE', 'JESUS', 'RUIZ', 'LARGO', 'LA PAZ MANZ E CASA 12', '3156143321', '1970-06-12', 'soltero', 'A+', 'ORLANDO HENAO', '3173678956', '', 'ASMET SALUD', '', ''),
(754, '16359415', 'HERNANDO', 'ANTONIO', 'MARIN', 'ROMERO', 'CRA 28A 11A 32', '3154730520', '1964-02-28', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '', '', '', ''),
(755, '16349306', 'HERNANDO DE', 'JESUS', 'RIVERA', 'HERRERA', 'CALLE 31 43-25 SAN BENITO', '3174402060', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(756, '94365005', 'CARLOS', 'ARTURO', 'RAMIREZ', '', 'MANZ 1 CASA 16 BOSQUES', '3182514622', '1971-05-01', 'soltero', 'A-', 'DIANA CASTRILLON', '3127683084', '', 'EMSSANAR', '', NULL),
(757, '6501735', 'JAIR', '', 'GALVEZ', 'QUIROGA', 'CALLEJON SAN ANTONIO 10', '3177578050', '0000-00-00', '', 'A+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(758, '14798581', 'JAMES', '', 'SOLIS', 'GARCIA', 'CALLE 22 2OESTE-27', '3206681734', '1984-01-01', 'soltero', 'B+', 'ORLANDO HENAO', '3173678956', '', '', '', 'jamessolisgarcia@hotmail.com'),
(759, '14799493', 'FRANCILEIDER', '', 'SANCHEZ', '', 'CALLE 21 22-40', '2327472-3126900603', '1984-01-26', 'soltero', 'O+', 'DIANA CASTRILLON', '3127683084', '', 'NUEVA EPS', '', NULL),
(760, '16549984', 'JOSE', 'ANCIZAR', 'LOAIZA', 'OROZCO', 'CALLE 13B 49A 04', '3132786123', '0000-00-00', '', 'A+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(761, '16547573', 'CARLOS', 'HUMBERTO', 'ZAMBRANO', 'BURITICA', 'DIAG 21 T 6-21', '3217403514', '1964-09-07', 'Union libre', 'A-', 'ORLANDO HENAO', '', '3173678956', 'NUEVA EPS ', 'R-4  ', 'carloshumbertozambranoburitica@hotmail.com'),
(762, '6498682', 'LUIS', 'ANCIZAR', 'TANGARIFE', 'CARDONA', 'CALLE 7A 22C 52', '3155413853', '0000-00-00', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '3173678956', 'SANITAS', 'SURA', NULL),
(763, '1116239853', 'GUSTAVO', 'ADOLFO', 'ROJAS', 'MORENO', 'CRA 19 12-53', '3205496163', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(764, '94151158', 'LUIS', 'CARLOS', 'LOPEZ', 'ACOSTA', 'CALLE 9A 3-95', '3175016051', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(765, '94394957', 'HECTOR', 'FABIO', 'GUTIERREZ', 'SOLER', 'CALLE 7 22A 82', '3178122704', '0000-00-00', '', 'O-', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(766, '16361437', 'JOSE', 'DARIO', 'CANO', 'ALVAREZ', 'CRA 13 25A 06', '3157736985', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(767, '16549435', 'CARLOS', 'HUMBERTO', 'HORTUA', 'OCAMPO', 'CALLE 26D 2OESTE 52 ASOAGRIN', '3204464530', '1971-02-18', 'soltero', 'B+', 'ORLANDO HENAO', '', '3173678956', 'ENSSANAR', 'R-4 BOLIVAR', ''),
(768, '89001190', 'HAROLD', '', 'SABU', 'OSPINA', 'MANZ 61 CASA 3 BOSQUES', '3154413818', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(769, '1116276809', 'ANDRES', 'FELIPE', 'NARANJO', 'VARGAS', 'C 13  28 B 13', '3174134714', '1997-09-30', 'soltero', 'O-', 'ORLANDO  HENAO', '-', '3173678956', 'NUEVA EPS', '-', NULL),
(770, '1116232091', 'RUBEN', 'DARIO', 'GOMEZ', 'SALGADO', 'CRA 17 26-41', '3153767267', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(772, '16359224', 'LUIS', 'ALBERTO', 'OSPINA', 'ALVAREZ', 'LA RIVERA', '3156393073', '0000-00-00', '', 'A+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(774, '1114481019', 'ANDRES', 'FELIPE', 'MELENDEZ', 'MUÑOZ', 'C 4A 24A18', '3233405075', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(777, '2515081', 'CARLOS', 'ALBERTO', 'ORTIZ', 'CAÑARTE', 'CRA 7 20-04 PRADOS DEL NORTE', '3187248722', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(779, '94388849', 'JOHN', 'MARIO', 'TOVAR', 'HERNANDEZ', 'calle 24 5-24', '3174842322', '1974-07-21', 'soltero', 'O+', 'DIANA CASTRILLON', '3127683084', '', 'COOMEVA', '', ''),
(780, '16354541', 'ELIAS', '', 'SALDAÑA', 'GONZALEZ', 'CRA 35 31A 11', '3184303092', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(782, '14796528', 'DIEGO', 'FERNANDO', 'MILLAN', '', 'CRA 8 26G-75', '3187020159', '1983-01-02', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '', 'EMSANAR', '', ''),
(783, '14839114', 'FABIAN', 'ANDRES', 'VANEGAS', 'ALVAREZ', 'MANA- MZ E CA 5', '3174470808', '0180-11-03', 'soltero', 'A+', 'ORLANDO HENAO', '3173678956', '3173678956', 'COOMEVA ', 'BOLIVAR', NULL),
(784, '94369018', 'JOHN', 'FREDY', 'GIRALDO', 'GIRALDO', 'CRA 34A 41-29', '3154759115', '1973-11-05', 'soltero', 'A+', 'DIANA CASTRILLON', '3127683084', '', '', '', ''),
(785, '6240210', 'DIEGO', 'ALEJANDRO', 'VASQUEZ', 'RAMIREZ', 'CRA 26A 39-65', '3043968400', '1980-01-09', 'soltero', 'A+', 'ORLANDO HENAO', '3173678956', '', 'MEDIMAS', '', ''),
(787, '94154382', 'EINER', 'ALBERTO', 'MONTOYA', 'TEJADA', 'CALLE 26B 1-36', '3172819484', '1982-01-08', 'soltero', 'A+', 'ORLANDO HENAO', '3173678956', '', 'MEDIMAS', '', ''),
(788, '14797043', 'NELSON', 'FABIAN', 'LOPEZ', 'QUINTERO', 'TRANSV 12 26D 12', '3162899523', '1983-02-06', 'soltero', 'O+', 'ORLANDO HENAO', '', '3173678956', 'EMSSANAR ', 'R-4  ', 'fl374801@gmail.com'),
(790, '16369850', 'MILTON', 'FABIAN', 'GONZALEZ', 'VARGAS', 'CRA 10 26C 22', '3218554022', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(791, '16355469', 'JOSE', 'DONEY', 'SOTO', 'MOLINA', 'CORREGIMIENTO SABALETAS ', '3057208832', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(792, '16369242', 'LEONARDO', '', 'SUAREZ', 'FRANCO', '', '', '0000-00-00', '', '', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(793, '16354148', 'RENAN', '', 'PORRAS', 'ZUÃ‘IGA', 'CALLE 18 28A 78', '3152868902', '1960-09-30', 'Union libre', 'O+', 'ORLANDO HENAO', '', '3173678956', 'EMSSANAR', 'R-4', ''),
(794, '16365207', 'JOSE', 'ORLANDO', 'GRANDA', 'GUAPACHE', 'CRA 16 CASA 24A 16-47', '3146290205', '1967-08-01', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '', 'EMSANAR', '', ''),
(795, '94296753', 'ENOC', '', 'LOPEZ', 'TOBON', 'CRA 27 BIS 40-107', '3107273575', '1973-01-09', 'soltero', 'A+', 'ORLANDO HENAO', '3173678956', '3173678956', 'NUEVA EPS', 'R-4', 'tobonc5@hotmail.com'),
(796, '1116255861', 'RODRIGO', '', 'LASSO', 'FORY', 'CRA 3 25-43', '3158329016', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(797, '1116256992', 'LUIS', 'ALBERTO', 'LOAIZA', 'VERGARA', 'D 20 C2 30-71', '3122527206', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(798, '16356400', 'HERNANDO', '', 'OSPINA', 'RAMIREZ', 'CALLE 9 17-34', '3148946639', '1962-04-25', 'soltero', 'O-', 'ORLANDO HENAO', '3173678956', '', 'S.O.S', '', ''),
(800, '94395659', 'ERVIN', 'ORLANDO', 'NOREÃ‘A', 'SALDARRIAGA', 'CRA 23 5B-25', '3105980860', '1978-07-29', 'soltero', 'A+', 'ORLANDO HENAO', '3173678956', '', '', '', ''),
(801, '16354942', 'JESUS', 'MARIA', 'LEDESMA', '', '', '', '0000-00-00', '', '', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(803, '88288797', 'LUIS', 'ARFIDIO', 'BASTIDAS', 'DIAZ', 'CRA 5 10-17 ANDALUCIA', '3157191798', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(804, '16628051', 'CESAR', 'TULIO', 'TRIVIÑO', 'POSSO', 'CALLE 27 12-52', '3152408597', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(806, '16205448', 'JOSE', 'NORBEY', 'CALDERON', 'ALZATE', 'CRA 30 35-37', '3128724442', '0000-00-00', '', 'B+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(807, '16360261', 'JOSE', 'ANTONIO', 'SOLANO', 'FRANCO', 'CRA 35 28-29', '3155817647', '1962-10-16', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '', 'MEDIMAS', 'R-4 BOLIVAR', 'patryarias_2006@hotmail.com'),
(808, '1116261271', 'JULIAN', 'DAVID', 'OROZCO', 'COLORADO', 'TRANSV 8 23-16 EL PORVENIR', '3219981221', '0000-00-00', '', 'A-', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(809, '6497850', 'JHON', 'ALEXANDER', 'POTES', 'OSPINA', 'CALLE 5A 12-39', '3168705685', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(810, '16349504', 'NELSON', '', 'SUAREZ', 'RIVERA', 'CRA 35 N° 34-28', '3162843033', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(811, '94366072', 'RUBEN', 'DARIO', 'GALLEGO', 'GALVEZ', 'CALLE 28C 39-23', '3188303360', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(813, '16354430', 'JAIME DE', 'JESUS', 'SEPULVEDA', 'BETANCUR', 'AGUACLARA CALLEJON BENSO CASA 1', '3158655999', '1960-12-11', 'soltero', 'O+', 'ORLANDO HENAO', '-', '3173678956', '', '', NULL),
(814, '6513411', 'DONEY DE', 'JESUS', 'GIRALDO', 'ALVAREZ', 'MANZ. D CASA 2 BOSQUES', '3156798402', '0000-00-00', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '3173678956', 'EMSSANAR', '-', NULL),
(815, '94394580', 'PABLO', 'ANDRES', 'ARROYAVE', 'GONZALEZ', 'CALLE 128 28F SL', '3103667271', '1977-07-27', 'soltero', 'O+', 'DIANA CASTRILLON', '3127683084', '3127683084', 'coomeva', 'liberty seguros', NULL),
(816, '1116251449', 'CARLOS', 'DARIO', 'BEDOYA', 'LOAIZA', '', '', '0000-00-00', '', '', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(817, '94151196', 'CESAR', 'EDUARDO', 'SALDARRIAGA', 'ARCILA', 'CALLE 26A 5-75', '3156593839', '2019-10-01', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '', '', '', ''),
(818, '94366557', 'GUSTAVO', 'ADOLFO', 'GIRALDO', 'CADAVID', 'CRA 8 25A 14', '3173155217', '1971-11-14', 'soltero', 'A+', 'DIANA CASTRILLON', '3127683084', '', '', '', ''),
(821, '1116269247', 'JUAN', 'CAMILO', 'MOSQUERA', 'GALLO', 'CRA 21 8-27', '2310116-3162921558', '1995-10-21', 'soltero', 'O-', 'DIANA CASTRILLON', '3127683084', '', '', '', ''),
(824, '1116249077', 'MOISES', 'EDUARDO', 'BLANDON', 'GONZALEZ', '', '', '0000-00-00', '', '', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(826, '1116236995', 'RODOLFO', 'A', 'GONZALEZ', '', 'PASAJE 23B 49-28', '3166243726', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(827, '16369129', 'JOSE', 'ALBEIRO', 'SUAREZ', 'VELASQUEZ', 'CRA18 21-44', '3195200274', '1970-03-02', 'soltero', 'A+', 'ORLANDO HENAO', '3173678956', '3173678956', 'SOS', '-', ''),
(832, '9728648', 'YHOAN ', 'ANDRES', 'ESPINOSA', 'CASTAÃ‘O', 'CRA8 24-06', '3152724628', '1980-11-15', 'soltero', 'A+', 'DIANA CASTRILLON', '3127683084', '', 'NUEVA EPS', '', NULL),
(833, '94393047', 'JULIO', 'CESAR', 'SORIANO', 'GARCIA', 'CRA22B 16-28', '3168409342', '0000-00-00', '', 'B+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(835, '94286653', 'GUILLERMO', 'ANDRES', 'RAMIREZ', 'BENAVIDES', '', '', '0000-00-00', '', '', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(836, '94388683', 'JAIRO', '', 'MORENO', 'CASTAÑO', 'CALLE 18A 13-26', '3217516176', '0000-00-00', '', 'O-', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(837, '73022947', 'JOHN', 'JAIRO', 'FELIZZOLA', 'MARTINEZ', '', '', '0000-00-00', '', '', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(839, '94367984', 'JORGE', 'HUMBERTO', 'MARIN', 'MURILLO', 'CALLE 22 1A OESTE 36', '3168810902', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(840, '1116235970', 'LUIS', 'ALBERTO', 'TOVAR', 'HERNANDEZ', 'CALLE 24 5-24 LAS AMERICAS', '3146373364', '1986-06-27', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '3173678956', 'EMSSANAR ', '-', 'tovarherluis27@gmail.com'),
(841, '6197423', 'JESUS', 'ALBERTO', 'DELGADO', 'URIBE', '', '', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(842, '14795919', 'JUAN', 'SEBASTIAN', 'HOLGUIN', 'MARMOLEJO', 'CALLE 31 20A 15', '3162810789', '0000-00-00', '', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(846, '17119445', 'JOSE', 'DANIEL', 'CUCAITA', 'GONZALEZ', 'CR 25 C 6 19', '3005784126', '1945-05-05', 'Casado', 'O+', 'ORLANDO HENAO', '3173678956', '3173678956', 'EMSSANR', '-', 'osmada1413@hotmail.com'),
(849, '16356589', 'JUAN', 'BAUTISTA', 'RAMIREZ', 'BURITICA', 'CRA 5A 20-33', '3104291262', '1962-05-05', 'Casado', 'A+', 'DIANA CASTRILLON', '3127683084', '3173678956', 'SOS', '', NULL),
(850, '94365059', 'JOSE', 'ALIRIO', 'LOAIZA', 'PEÃ‘A', 'CALLE 23 1A OESTE 19', '3128163743', '1971-02-25', 'Separado', 'A+', 'ORLANDO HENAO', '3173678956', '', 'EMSSANAR', '', ''),
(851, '16345461', 'EDINSON', '', 'BEJARANO', '', 'MANZANA 32 CASA 30', '2305455', '1953-09-24', 'Casado', 'O-', 'DIANA CASTRILLON', '3127683084', '', 'COOMEVA', '', NULL),
(852, '94150691', 'ADOLFO', '', 'OSPINA', '', 'CALLE 25 5 24', '3157184026', '1980-06-04', 'Union libre', 'A+', 'DIANA CASTRILLON', '3127683084', '', 'CAFESALUD', '', NULL),
(853, '1116240371', 'ANDRES', 'MAURICIO', 'CASTILLO', 'LIZARAZO', 'CLL 22 26-13', '3113900997', '1988-02-16', 'Casado', 'O+', 'DIANA CASTRILLON', '3127683084', '', 'ENSSANAR', '', NULL),
(854, '15898899', 'miguel', 'angel', 'rivera', 'gonzalez', 'calle 5 19 45', '6156506752', '1957-07-06', 'soltero', 'O+', 'DIANA CASTRILLON', '3127683084', '', 'coomeva', '', NULL),
(855, '565644', 'ijio8', '8hu9ui', 'ijo', 'uyhuuyh', 'ujiojio', '78454574', '1978-05-21', 'Separado', 'O+', 'DIANA CASTRILLON', '3127683084', '874547', 'jjnjn', '', NULL),
(857, '552555', 'gtbgtbgbt', '', 'uujummuu', '', 'ku8j89k789', '787887878778', '1978-05-05', 'soltero', 'O-', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(858, '555', 'kiuthjk', '', 'ghnmuj,', '', 'rvfbgtyhuj6789', '', '1978-03-25', 'soltero', 'O-', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(860, '6114074', 'JOSE ', 'ANCIZAR', 'CORDOBA', 'JIMENEZ', 'MZ 30 CASA 30', '3162957119', '1958-11-26', 'soltero', 'O+', 'DIANA CASTRILLON', '3127683084', '', 'COOMEVA', '', NULL),
(861, '6210861', 'JESUS', 'MARIA', 'FORERO', '', 'PARCELA 1 CASA 1 SAN FRANCISCO', '3174810025', '1958-08-23', 'Casado', 'A+', 'ORLANDO HENAO', '3173678956', '', 'EMSSANAR', '', ''),
(862, '94152860', 'JOSE ', 'AGOBARDO', 'ARIAS', 'MORALES', 'CALLE 24 120', '3104910765', '1981-02-22', 'soltero', 'A+', 'ORLANDO HENAO', '3173678956', '3173678956', 'COOMEVA', '-', NULL),
(863, '6512104', 'FABIO ', 'RIVERA', 'BEDOYA', '', 'CALLE 26 9 28', '3116386820', '1958-07-09', 'soltero', 'O-', 'DIANA CASTRILLON', '3127683084', '', 'COOMEVA', '', NULL),
(864, '6500189', 'GUILLERMO', '', 'RAMIREZ', 'VALERO', 'MZ A CASA 6', '3148010740', '1979-09-17', 'Union libre', 'O+', 'ORLANDO HENAO', '3173678956', '3173678956', 'EMSSANAR', '', 'guillermoramirez04042019@hotmail.com'),
(865, '1116276013', 'yeison', 'javier', 'marin ', 'baquero', 'trav 20nÂ°9-09', '3226005094', '1997-07-19', 'Union libre', 'O+', 'DIANA CASTRILLON', '3127683084', '3173678956', 'sos', '', NULL),
(866, '79352374', 'LUIS', 'ANTONIO ', 'MAHECHA', 'ORTIZ', 'MANZANA 47 CASA 12', '3174566520', '1965-06-23', 'soltero', 'O-', 'DIANA CASTRILLON', '3127683084', '', 'CAFESALUD', '', NULL),
(867, '16366079', 'AURELIO', '', 'MENDEZ', 'POSSO', 'CARRERA 18 23 41', '3122240551', '1967-07-21', 'soltero', 'O-', 'DIANA CASTRILLON', '3127683084', '', 'COOMEVA', '', NULL),
(868, '16355715', 'jose ', 'janel', 'vanegas', '', 'calle 24-8-27', '3104180736', '1960-05-16', 'Union libre', 'O+', 'DIANA CASTRILLON', '3127683084', '3173678956', 'nueva eps', '', NULL),
(870, '9806480', 'JOHN', 'JAIDER', 'CORREA', 'MALDONADO', 'CRA 11 26C-46 BOLIVAR', '3156604051', '1966-03-17', 'soltero', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL);
INSERT INTO `conductor` (`id_conductor`, `codigo`, `nombre1`, `nombre2`, `apellido1`, `apellido2`, `direccion`, `telefono`, `fecha_nace`, `est_civil`, `tipo_rh`, `acudiente`, `telefonoa`, `celulara`, `eps`, `arl`, `emailc`) VALUES
(872, '94391589', 'LUIS', 'FERNANDO', 'MOLINA', '', 'CALLE 29 43 29', '3175263319', '1976-01-18', 'Union libre', 'A+', 'DIANA CASTRILLON', '3127683084', '', 'SOS', '', NULL),
(873, '16863831', 'JAICINIO', '-', 'FLOREZ', 'HERNANDEZ', 'CALLE 19- 2W 82', '3015854818', '1980-04-09', 'Casado', 'O+', 'ORLANDO HENAO', '3173678956', '3173678956', 'EMSSANAR', '-', NULL),
(874, '79308008', 'EDUARDO', '', 'GARCIA', 'ROMERO', 'KRA 3 OESTE 24A 15', '3127647664', '1963-07-02', 'Casado', 'O-', 'DIANA CASTRILLON', '3127683084', '', 'SANIDAD POLICIA', '', NULL),
(875, '16365998', 'RUBEN ', 'ANTONIO', 'SANCHEZ', 'ARCILA', 'KRA 8 20 10', '3173998863', '1968-02-11', 'Casado', 'O+', 'DIANA CASTRILLON', '3127683084', '', 'NUEVA EPS', '', NULL),
(876, '1116072826', 'CRISTIAN ', 'ANDRES', 'CORRALES', 'SANTIBAÃ‘EZ', 'CRA 5 24-02', '3206837490', '1997-09-24', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '', 'EMSSANAR', '', ''),
(877, '16342061', 'GILMER', '', 'FLOREZ', 'OLAYA', 'CALLE 12 25 53', '2314947', '1950-01-26', 'Casado', 'O+', 'DIANA CASTRILLON', '3127683084', '', 'COOMEVA', '', NULL),
(878, '94391407', 'john', 'fredy', 'restrepo', 'arango', 'bloques san luis', '3186231189', '1974-05-01', 'soltero', 'O+', 'DIANA CASTRILLON', '3127683084', '', 'EMSSANAR', '', NULL),
(881, '16247481', 'JOSE', 'NEFTALI', 'GONZALEZ', '', 'CALLE 88 22A 57', '3186762921', '1951-10-27', 'Casado', 'O+', 'DIANA CASTRILLON', '3127683084', '', 'NUEVA EPS', '', NULL),
(882, '94395537', 'YOVANNY', '', 'GARCIA', 'ACEVEDO', 'CALLE 41A 24-69 PRINCIPE', '3182662590', '1978-07-07', 'Separado', 'A+', 'DIANA CASTRILLON', '3127683084', '3173678956', 'CAFESALUD', '', NULL),
(883, '1114208790', 'JHON', 'FREDY', 'LOPEZ', 'PEREZ', 'CALLE 7 25B-21 7 AGOSTO', '3185022203', '1191-10-27', 'soltero', 'A+', 'DIANA CASTRILLON', '3127683084', '3173678956', '', '', NULL),
(884, '91158443', 'JOSE ', 'DE JESUS ', 'URREA', 'TORRES', 'CALLE 17 1-69', '3212673096', '1979-07-23', 'Union libre', 'O+', 'ORLANDO HENAO', '', '3173678956', 'EMSSANAR', '', 'jose20003jesus@gmail.com'),
(886, '9955841', 'JOSE', 'RUBIEL', 'GRISALES', 'CARDONA', 'CALLE 22A 3-26', '3188073036', '1968-07-09', 'Casado', 'A+', 'ORLANDO HENAO', '', '3173678956', 'MEDIMAS', '', ''),
(887, '6499400', 'WILMER', '', 'GONZALEZ', 'LOAIZA', 'MZA K CASA 126 NARInO', '3163848227', '1979-05-19', 'Union libre', 'O+', 'DIANA CASTRILLON', '3127683084', '3173678956', 'SOS', '', NULL),
(888, '94393344', 'EFRAIN', 'ALBERTO', 'LUGO', 'RIASCOS', 'CRA 19 23A-32', '3142011096', '1977-03-12', 'Casado', 'A+', 'DIANA CASTRILLON', '3127683084', '3177367956', 'EMSANAR', '', NULL),
(889, '94394493', 'HECTOR', 'MIGUEL', 'DIAZ', 'CAMPO', 'CALLE 22 8-19', '3173305327', '1977-12-12', 'Union libre', 'O+', 'DIANA CASTRILLON', '3127683084', '3173678956', 'NUEVA EPS', '', NULL),
(890, '1116275786', 'CRISTIAN', 'DAVID', 'MEJIA', 'SALAZAR', 'CALLE 19 15E-70', '3127055222', '1997-06-28', 'soltero', 'O+', 'ORLANDO HENAO', '', '3173678956', 'MEDIMAS', 'R-4', 'cristiandavidmejiasalazar81@gmail.com'),
(891, '70830192', 'CARLOS', 'ADRIAN', 'CARDONA', 'NOREÃ‘A', 'MZA 26 CASA 10 BOSQUES', '3126142162', '1981-10-13', 'soltero', 'O+', 'DIANA CASTRILLON', '3127683084', '3173678956', '', '', 'paisa-1306@hotmail.com'),
(892, '14799261', 'GUSTAVO', 'ADOLFO', 'SANTA', 'SANCHEZ', 'CRA 20 7-51', '3162382962', '1984-05-21', 'Union libre', 'O-', 'DIANA CASTRILLON', '3127683084', '3173678956', '', '', NULL),
(893, '16353696', 'JONNY', '', 'GONZALEZ', 'REINA', 'CARRERA 27 44 55', '3105497998', '1960-04-29', 'Union libre', 'O+', 'DIANA CASTRILLON', '3127683084', '', 'EMSSANAR', '', NULL),
(894, '6512077', 'JESUS', 'MARIA', 'ARIAS', 'ANGEL', 'MZA 16 14-21 VILLA', '3103418909', '1958-09-02', 'Union libre', 'O+', 'DIANA CASTRILLON', '3127683084', '3173678956', 'SOS', '', NULL),
(895, '1121890994', 'RUBIER', 'DARIO', 'GARCIA', 'ESPINOSA', 'CALLE 8 19-05', '3168149593', '1992-07-26', 'soltero', 'A+', 'DIANA CASTRILLON', '3127683084', '3173678956', 'CAPITALSALUD', '', 'dario.garcia-458@hotmail.com'),
(896, '16360567', 'JAIME', 'DE JESUS', 'PULGARIN', 'RODRIGUEZ', 'MZA 41 CASA 25 BOSQUES', '3205850235', '1964-10-03', 'soltero', 'O+', 'DIANA CASTRILLON', '3127683084', '3173678956', 'CAFESALUD', '', NULL),
(897, '91256964', 'silvio', '', 'pelaez', 'mejia', 'manzana 35 casa 39', '3104002783', '1968-01-02', 'Casado', 'O+', 'DIANA CASTRILLON', '3127683084', '', 'sisben', '', NULL),
(898, '16330165', 'ALBERTO', '', 'PATIÃ‘O', 'HENAO', 'AV. PPAL AGUACLARA27-25B', '2305515', '1968-08-31', 'Casado', 'O+', 'DIANA CASTRILLON', '3127683084', '', 'ENSANAR', '', NULL),
(899, '6445487', 'EDINSON', '', 'ACOSTA', 'CORTEZ', 'CRA 9# 7-04', '3122110088', '1973-05-27', 'Casado', 'O-', 'DIANA CASTRILLON', '3127683084', '', 'ENSANAR', '', NULL),
(900, '70512415', 'NORBEY', 'ANTONIO', 'VILLADA', 'ACEVEDO', 'CARRERA 19A NÂ°8-23', '3146923699', '1962-03-22', 'Casado', 'A+', 'DIANA CASTRILLON', '3127683084', '', 'CAFESALUD', '', 'paolandrea0417@gmail.com'),
(901, '16369004', 'JAMEX', '', 'RODRIGUEZ', 'MALDONADO', 'CLL 26 9OSTE 16', '3116164722', '1970-06-23', 'Casado', 'O+', 'DIANA CASTRILLON', '3127683084', '3173678956', 'NUEVA EPS', '', NULL),
(902, '16349081', 'LUIS', 'ALFREDO', 'RIVERA', 'GONZALEZ', 'M K L 2', '3187580623', '1956-04-03', 'Separado', 'O+', 'DIANA CASTRILLON', '3127683084', '3173678956', 'ENSANAR', '', NULL),
(903, '14798795', 'WILVER', 'ANDRES', 'CORDOBA', '', 'CALLE 34A 18-52', '3186283996', '1982-12-13', 'Casado', 'O+', 'ORLANDO HENAO', '3173678956', '', 'CAPRECOM', '', ''),
(904, '1116248501', 'CRISTIAN', 'DAVID', 'SUAREZ', 'ARIAS', 'CRA 21 16-61', '3215639083', '1990-09-24', 'Union libre', 'O+', 'ORLANDO HENAO', '3173678956', '', 'SANITAS', '', ''),
(905, '19206485', 'VICTOR', 'MANUEL', 'HERNANDEZ', 'CHAVEZ', 'BLOQUES DE SAN LUIS Q', '3164561328', '1952-07-02', 'Casado', 'O+', 'DIANA CASTRILLON', '3127683084', '3173678956', 'MEDIMAX', '', NULL),
(906, '94365632', 'EDGAR', '', 'MONDRAGON', 'HERNANDEZ', 'CALLE 38 27BIS-04', '3182580225', '1971-09-09', 'Casado', 'A+', 'DIANA CASTRILLON', '3127683084', '3173678956', 'EMSANAR', '', NULL),
(908, '14796744', 'FABER', 'JESUS', 'FLOREZ', 'OLAYA', 'CLL 24 8-02', '3167346593', '1982-01-05', 'Union libre', 'O+', 'DIANA CASTRILLON', '3127683084', '3173678956', 'ENSANAR', '', NULL),
(909, '14800899', 'STIVEN', '', 'FORERO', 'QUICENO', 'VIA CAIMOS 27-50', '3163062150', '1985-03-10', 'Union libre', 'A+', 'DIANA CASTRILLON', '3127683084', '3173678956', 'MEDIMAX', '', NULL),
(910, '6321877', 'JOSE', 'JULIAN', 'ALARCON', 'MARTINEZ', 'CRA 10 26G-20', '3174947970', '1980-10-16', 'Casado', 'B+', 'DIANA CASTRILLON', '3127683084', '3173678956', '', '', NULL),
(911, '14795091', 'ANGEL ', 'FERMIN', 'RENGIFO', 'BLANDON', 'CRA 28A 25-102 AGUACLARA', '3206575154', '1981-01-18', 'soltero', 'A+', 'ORLANDO HENAO', '3173678956', '', 'EMSSANAR', '', 'angelferminrengifo7@gmail.com'),
(912, '16357601', 'ORLANDO', '', 'VARGAS', 'VILLEGAS', 'CALLE 14 12-13 2Â° PISO LA CAMPIÃ‘A', '3165108437', '1959-08-19', 'soltero', 'A+', 'DIANA CASTRILLON', '3127683084', '3173678956', 'SISBEN', '', NULL),
(913, '1116235414', 'LUIS', 'ALBERTO', 'MORALES', 'VELASQUEZ', 'CRA 19 NÂ° 34-08 PUEBLO NUEVO', '3103837956', '1986-10-12', 'soltero', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(914, '15990701', 'DIOMEDES', '', 'VALENCIA', 'GUTIERREZ', 'MANZANA J CASA 10 EL PARAISO', '3116130484', '1981-02-27', 'Union libre', 'O+', 'DIANA CASTRILLON', '3127683084', '3173678956', 'MEDIMAS', '', NULL),
(915, '1116246276', 'DANIEL', '', 'MEDINA', 'SOTO', 'CLL 32 43-21', '3104916671', '1990-01-11', 'Union libre', 'O+', 'DIANA CASTRILLON', '3127683084', '3173678956', 'COOMEVA', '', NULL),
(916, '14796293', 'JHON ', 'JAMER', 'HERRERA', 'VANEGAS', 'CRA 22A 8/08', '3235964497', '1982-12-30', 'Union libre', 'A+', 'ORLANDO HENAO', '3173678956', '3173678956', 'EMSSANAR', '-', NULL),
(917, '16256009', 'RAUL', '', 'SANCHEZ', 'ATEHORTUA', 'CRA 22 D 5B-16', '3117304547', '1957-03-17', 'Union libre', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(918, '16363148', 'REINALDO', '', 'BEJARANO', 'CRISPINO', 'CRA 15 26 69', '3122531213', '1964-12-13', 'Casado', 'AB+', 'DIANA CASTRILLON', '3127683084', '3173678956', 'ENSANAR', '', NULL),
(920, '94366970', 'LUIS', 'ENRIQUE', 'RICO', '', 'VIA LOS CAIOMOS 29-09', '3152142500', '1972-07-30', 'Union libre', 'O+', 'DIANA CASTRILLON', '3127683084', '3173678956', 'SOS', '', NULL),
(921, '1116236521', 'VICTOR', 'HUGO', 'BUITRAGO ', 'QUIENTERO', 'CALLE 30-41-18', '3103810364', '1987-03-02', 'Union libre', 'A+', 'DIANA CASTRILLON', '3127683084', '3173678956', 'MEDIMAS', '', NULL),
(924, '14798119', 'JORGE', 'ARMANDO', 'SALDARRIAGA', 'CAICEDO', 'CRA12-26C1-39', '3163403805', '1983-10-23', 'Casado', 'O+', 'DIANA CASTRILLON', '3127683084', '3173678956', 'ENSSANAR', '', NULL),
(925, '1116251130', 'JHON', 'ANDERSON', 'NARANJO', 'CATAÃ‘O', 'CALLEJON PEDROZA CASA 17', '3174931057', '1990-07-16', 'soltero', 'A+', 'ORLANDO HENAO', '3173678956', '3173678956', 'MEDIMAS', '-', ''),
(926, '1116239928', 'JULIAN', 'ANDRES', 'VALLEJO', '', 'CALLE 22 30-67', '3166214586', '1987-10-08', 'soltero', 'B+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(928, '1177517', 'JUAN', 'AGUSTIN', 'MONTAÃ‘EZ', 'ALVAREZ', 'CLL 33 34 A 46 victoria', '3127343531', '1954-11-23', 'Casado', 'O+', 'ORLANDO HENAO', '-', '3173678956', 'NUEVA EPS', '-', 'juanm23111954@gmail.com'),
(929, '94390540', 'HOOVER', 'DE JESUS', 'GARCIA', 'QUINTERO', 'CRA 1 0-20 BUGALAGRANDE', '3168861091', '1975-10-08', 'Union libre', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(930, '6445050', 'HECTOR ', 'FABIO', 'OSPINA', 'RODRIGUEZ', 'MANZANA K CASA 30 SAN PEDRO', '3146131069-3135156598', '1968-05-17', 'Union libre', 'B+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(932, '1073684942', 'VICTOR', 'ANDRES', 'GALINDO', 'GARCIA', 'CLL 13 49-50', '3185073522', '1990-01-09', 'Union libre', 'O+', 'ORLANDO HENAO', '3173678956', '', 'ENSANAR', '', 'andres.21-1990@hotmail.com'),
(933, '1193156114', 'DIEGO', 'STEVEN', 'SEPULVEDA', 'LOAIZA', 'CALLE 18A CRA 2C 66', '3156486987', '1999-06-22', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '', 'MEDIMAS', '', 'diego.sepul@hotmail.com'),
(934, '1116263498', 'DIEGO', 'FERNANDO', 'GARCIA', 'HENAO', 'CALLE 25A 7-69', '3172722456', '1994-04-05', 'Union libre', 'O+', 'ORLANDO HENAO', '3173678956', '', 'MEDIMAS', '', ''),
(935, '16362410', 'JOSE', 'DUVAN', 'PATIÃ‘O', 'LOPEZ', 'CRA 9 DIAGONAL 20-08', '3167915048', '1964-12-07', 'Casado', 'O+', 'DIANA CASTRILLON', '3127683084', '', 'MEDIMAS', '', NULL),
(936, '94471443', 'LUIS', 'ADOLFO', 'SAAVEDRA', 'URREGO', 'CRA 22 8-54', '3182523692', '1976-12-21', 'Casado', 'A+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(937, '16345432', 'altajerges', '-', 'porras', 'zuÃ±iga', 'kra 5a 25-30', '3162586431', '1953-09-16', 'Union libre', 'O+', 'ORLANDO HENAO', '-', '3173678956', 'ensanar', '-', NULL),
(938, '94150673', 'LUIS', 'ENRIQUE', 'LOPEZ', 'LOPEZ', 'CALLEJON EL DIAMANTE MANZ 3 CASA 35', '3153811545', '1970-06-16', 'Union libre', 'O+', 'ORLANDO HENAO', '3173678956', '', 'ENSANAR', '', ''),
(940, '1115188601', 'victor', 'alfonso', 'parra', 'mejia', 'cll13 49 A 13', '3162127962', '1991-10-14', 'Union libre', 'A+', 'DIANA CASTRILLON', '3127683084', '3173678956', 'emsanar', '', NULL),
(941, '18608186', 'WALTER', NULL, 'GONZALEZ CARDONA', NULL, 'CRA 25 12A 04', '3137144022', '1976-11-09', '', '', 'DIANA CASTRILLON', '3127683084', NULL, NULL, NULL, NULL),
(942, '14797951', 'FERNEY', '', 'BLANDON', 'GOMEZ', 'CRA 20 9-02 SANTA ISABEL', '3155857539', '1983-03-18', 'Union libre', 'O+', 'ORLANDO HENAO', '-', '3173678956', 'S.O.S.', '', 'ferneyblandon1983@gmail.com'),
(943, '1116239084', 'ALEXANDER', '', 'JARAMILLO', 'SANCHEZ', 'CALLE 20 3-85', '3185577784', '1987-10-11', 'Union libre', 'O+', 'DIANA CASTRILLON', '3127683084', '', 'MEDIMAS', '', NULL),
(944, '94154624', 'EDGAR', 'ORLANDO', 'UMAÃ‘A', 'ALFONSO', 'CALLE 33 44-54 lomitas', '3162940133', '1981-10-13', 'Casado', 'B+', 'ORLANDO HENAO', '3173678956', '', 'EMSSANAR', '', 'orlauma@hotmail.com'),
(945, '19144824', 'JULIO', 'CESAR', 'RESTREPO', 'HINCAPIE', 'MANZANA P CASA 7 LA PAZ', '3105915593', '1950-12-05', 'soltero', 'O+', 'DIANA CASTRILLON', '3127683084', '', 'EMSSANAR', '', NULL),
(946, '16342287', 'WILLIAM', '', 'QUINTERO', 'RUIZ', 'CALLE 22 5OESTE-39', '3046264528', '1950-09-01', 'soltero', 'A+', 'ORLANDO HENAO', '-', '3173678956', 'EMSSANAR', '-', 'williamqqquintero@gmail.com'),
(947, '1113624220', 'YONADELEYDER', 'ADOLFO', 'ROMERO', 'MADRIÃ‘AN', 'CRA 1 OESTE 26 I 15', '3153156244', '1986-07-19', 'Casado', 'A+', 'DIANA CASTRILLON', '3127683084', '', 'ASMESALUD', '', NULL),
(948, '10141785', 'RODRIGO', '', 'FERNANDEZ', 'TORO', 'CRA 27BIS 39-34', '3147912121', '1970-05-22', 'soltero', 'A+', 'ORLANDO HENAO', '3173678956', '-', 'ASMETSALUD', '-', NULL),
(949, '94389044', 'JAIME', 'JESUS', 'VELEZ ', 'TORRES', 'MANAZA 47 CASA 11', '3117325073', '1974-11-10', 'Casado', 'O+', 'ORLANDO HENAO', '3173678956', '3173678956', 'NUEVA EPS', '-', NULL),
(951, '94357226', 'JHONIER', '', 'DUQUE', '', 'CALLE 5 19-14', '3155743950', '1981-03-05', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '', 'SISBEN', '', 'duquejhonier01@gmail.com'),
(957, '6498576', 'JHON', 'FREDY', 'HENAO', 'BOLAÃ‘OS', 'K 2 20-09', '3177034975', '1978-08-08', 'Union libre', 'O-', 'ORLANDO HENAO', '3173678956', '3173678956', 'ENSANAR', '', NULL),
(958, '10076658', 'RUBIEL', '', 'RAMIREZ', 'FLOREZ', 'CALLE 8 21-18 LA INDEPENDENCIA', '3175720453', '1953-04-25', 'Separado', 'A+', 'ORLANDO HENAO', '3173678956', '', 'EMSSANAR', '', ''),
(959, '94064268', 'JORGE', 'ALIRIO', 'MONTOYA', 'REYES', 'CRA 11 26B 18', '3164700915', '1983-08-25', 'soltero', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(960, '80437073', 'HUGO', 'FERNANDO', 'ARENAS', 'RUIZ', 'CRA 36A 20-46', '3212386773', '1970-07-22', 'Union libre', 'O+', 'DIANA CASTRILLON', '3127683084', '', 'NUEVA EPS', '', NULL),
(961, '79392360', 'NESTOR', 'ALFONSO', 'BELTRAN', 'DUARTE', 'CALLE 33A 18-51', '3013830267', '1966-08-13', 'soltero', 'O+', 'DIANA CASTRILLON', '3127683084', '', 'SANITAS', '', NULL),
(962, '94471136', 'RAFAEL', '', 'PORRAS', 'MOSQUERA', 'CRA 5 5-45', '3178070835', '1976-04-17', 'Union libre', 'O-', 'DIANA CASTRILLON', '3127683084', '3185407559', 'SOS', '', NULL),
(963, '16227188', 'JULIO', 'ENRIQUE', 'TASAMA', '', 'MANZANA 54 CASA 35 BOSQUES', '3184982993', '1971-02-18', 'Union libre', 'A+', 'DIANA CASTRILLON', '3127683084', '', 'EMSSANAR', '', NULL),
(964, '1116282077', 'DAVIDSON', '', 'TASAMA', 'LOMBANA', 'MANZANA 54 CASA 35 BOSQUES', '3162116277', '1999-03-11', 'soltero', 'O+', 'DIANA CASTRILLON', '3127683084', '', 'EMSSANAR', '', NULL),
(966, '1117018594', 'JOSE', 'ALVARO ', 'HENAO', 'FRANCO', 'CARRERA 4E 23-10', '3176530215', '1994-02-13', 'Union libre', 'O+', 'ORLANDO HENAO', '-', '3173678956', 'CAFESALUD', '', NULL),
(967, '94286653', 'GUILLERMO', 'ANDRES', 'RAMIREZ', 'BENAVIDES', 'CALLE 4 24A10', '3146524736', '1980-05-17', 'Union libre', 'B+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(968, '7558321', 'CARLOS', 'ALBERTO', 'RAMIREZ', 'BENAVIDEZ', 'CRA 18 16-37 2DO PISO', '3136764838', '1967-09-12', 'soltero', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(969, '14796729', 'JULIAN', 'ANDRES', 'AMAYA', 'GIRALDO', 'DIAGONAL 21A 9-40', '3157533021', '1983-03-05', 'soltero', 'A+', 'DIANA CASTRILLON', '3127683084', '', 'MEDIMAS', '', NULL),
(970, '7549682', 'adelmo', '', 'chicangana', 'chicangana', 'calle 30 42-15', '2327961', '1965-03-13', 'Union libre', 'O+', 'DIANA CASTRILLON', '3127683084', '3173678956', 'isponar', '', NULL),
(971, '94151588', 'JOSE LUIS', NULL, 'VERA CORTES', NULL, 'CALLE 12D 28B 47', '3177335522-3187957299', '1980-06-06', '', '', 'DIANA CASTRILLON', '3127683084', NULL, NULL, NULL, NULL),
(972, '6497799', 'JOSE ', 'GREGORIO', 'MURCIA', 'VANEGAS', 'C 28  11-33', '3163519599', '1975-06-15', 'Union libre', 'O+', 'DIANA CASTRILLON', '3127683084', '3173678956', 'COOMEVA', '', NULL),
(973, '94388770', 'CARLOS', 'ALBERTO', 'ARIAS', '', 'CALLE 22 1 BIS OESTE 12 NUEVO FARFA', '2302535-3155061700', '1974-07-16', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '', 'MEDIMAS', 'R-4 LA EQUIDAD', ''),
(974, '1112301311', 'UBHEIMAR', '', 'MUÃ‘OZ', 'MILLAN', 'CRA 33 32-11 VICTORIA', '3215679480', '1989-01-26', 'soltero', 'O+', 'DIANA CASTRILLON', '3127683084', '3175722320', 'ENSANAR', '', 'monicar107@hotmail.com'),
(975, '16540397', 'CARLOS', 'ARMANDO', 'BENAVIDES', 'VALENZUELA', 'CRA 24A 16-62 MARACAIBO', '3163405470', '1967-05-26', 'Union libre', 'O+', 'DIANA CASTRILLON', '3127683084', '', 'EMSSANAR', '', NULL),
(976, '6430381', 'CARLOS', 'MAURICIO', 'CRUZ', 'ORTIZ', 'mz 15 villa', '3126734845', '1985-10-10', 'soltero', 'O+', 'ORLANDO HENAO', '', '3173678956', 'SANITAS', 'R-4 BOLIVAR', ''),
(978, '94367010', 'JAMES', '', 'DIMATE', 'FRANCO', 'CALLE26C 5-05', '3137727753', '1972-06-25', 'Casado', 'O+', 'DIANA CASTRILLON', '3127683084', '3173678956', 'MEDICOPREVENTIVA', '', NULL),
(979, '1116251212', 'VICTOR', 'HUGO', 'GIRALDO', 'BEDOYA', 'MANZANA G CASA 14 EL PARAISO', '3162240046', '1991-07-10', 'soltero', 'O+', 'DIANA CASTRILLON', '3127683084', '', 'COOMEVA', '', NULL),
(980, '94367904', 'JOSE', 'HUMBERTO', 'TABORDA', 'DIAZ', 'CALLE 12A 28B 71 EL BOSQUE', '3136193987', '1972-12-24', 'Union libre', 'O+', 'DIANA CASTRILLON', '3127683084', '', 'EMSSANAR', '', NULL),
(981, '94388573', 'CARLOS', 'ARIEL', 'PATIÃ‘O', 'GARZON', 'MANZ B CASA 4 HOLANDESA', '3176550429', '1973-12-24', 'soltero', 'B+', 'ORLANDO HENAO', '3173678956', '', '', '', 'carlosarielpatiÃ±o@gmail.com'),
(982, '1118028829', 'JHONATHAN', 'FABIAN', 'CORREA', 'COLLAZOS', 'CALLE 6 12-28', '3137758323', '1997-07-14', 'soltero', 'A+', 'DIANA CASTRILLON', '3127683084', '3173678956', 'ENSSANAR', '', NULL),
(983, '94301839', 'CARLOS', 'ARTURO', 'ESPEJO', 'PAEZ', 'CALLE 25B 8-16', '3174542876', '1973-08-31', 'soltero', 'B+', 'ORLANDO HENAO', '3173678956', '-', 'COOMEVA', '-', 'ccarlosespejo08@hotmail.com'),
(984, '4532426', 'IARAEL', '', 'BEDOYA', 'LOAIZA ', 'CARRERA 15A 23 42', '3112621492', '1954-05-14', 'Casado', 'O+', 'ORLANDO HENAO', '-', '3173678956', 'EMSANAR ', '', NULL),
(985, '80138638', 'YANY', 'ADRIAN', 'CRUZ', 'POSSO', 'CRA 25 36-19', '3041232845', '1982-03-09', 'Casado', 'O-', 'ORLANDO HENAO', '', '3173678956', 'SANIDAD DE LA POLICIA', 'EQUIDAD', 'yanycruzposso@gmail.com'),
(986, '16794224', 'FERNEY', '', 'MEJIA', 'LASPRILLA', 'CRA 10 14-25', '3017517880', '1971-02-13', 'Union libre', 'B+', 'ORLANDO HENAO', '', '3173678956', 'MEDIMAS', '', ''),
(987, '16345488', 'LIBARDO', 'DE JESUS', 'LOAIZA', '', 'MANZANA 17 CASA 35 BOSQUES', '3154710704', '1953-09-14', 'soltero', 'B+', 'DIANA CASTRILLON', '3127683084', '', 'EMSSANAR', '', NULL),
(988, '1116239691', 'CRISTHIAN', 'ALBERTO', 'LONDOÃ‘O', 'ALVAREZ', 'CALLLE 3B 24A 46', '3155925137', '1988-01-24', 'Union libre', 'O+', 'ORLANDO HENAO', '----', '3173678956', 'EMSSANAR', 'BOLIVAR', NULL),
(990, '29314681', 'YASMIN', '', 'CARDENAS', 'LOAIZA', 'BOSQUES MANZANA 9 CASA 14', '3136012133', '1984-08-28', 'soltero', 'O+', 'DIANA CASTRILLON', '3127683084', '', 'NUEVA EPS', '', NULL),
(992, '19375596', 'CARLOS', 'ALBEIRO', 'GUSMAN', 'MORALES', 'CALLE 14 22A 08', '3157207728', '1955-12-12', 'Casado', 'A+', 'DIANA CASTRILLON', '3127683084', '', 'COOMEVA', '', NULL),
(993, '1032399103', 'LUIS', 'ALBERTO', 'GALINDO ', 'GARCIA', 'CALLE 13 49-50', '3122525278', '1987-11-06', 'soltero', 'O+', 'ORLANDO HENAO', '', '3173678956', 'S.O.S', 'R-1', 'galindogalindo2015@hotmail.com'),
(995, '6497492', 'LUIS', 'CARLOS', 'CORDOBA', 'AGUIRRE', 'AV AGUACLARA 27-91', '3158238328', '1969-10-27', 'Union libre', 'A+', 'DIANA CASTRILLON', '3127683084', '3173678956', 'SANIDA', '', 'lccordoba@gmail.com'),
(996, '2471284', 'RAFAEL', 'ANTONIO', 'VALECIA ', 'MONTES', 'C 37 18A-27', '3187137212', '1964-06-21', 'Separado', 'A+', 'ORLANDO HENAO', '3173678956', '', 'ENSSANAR', '', ''),
(997, '16349924', 'JAIRO', '', 'CRUZ', 'PEREA', 'CRA 30 29-05', '3174404941', '1958-08-21', 'soltero', 'O-', 'DIANA CASTRILLON', '3127683084', '', 'NUEVA EPS', '', NULL),
(998, '94392262', 'LEONEL ', 'ANTONIO', 'NUÃ‘EZ', 'RODAS', 'K 28A 13B-16', '3108480216', '1975-08-20', 'Union libre', 'O+', 'DIANA CASTRILLON', '3127683084', '3173678956', 'CAFE SALUD', '', NULL),
(999, '79773301', 'JAIRO', 'ELIECER', 'CUELLAR', 'HURTADO', 'CRA 25A 14B 14 LA GRACIELA', '3233358521', '1965-11-21', 'soltero', 'A-', 'DIANA CASTRILLON', '3127683084', '', 'EMSANAR', '', NULL),
(1000, '16644340', 'OSCAR', 'JAIME', 'CUELLAR', 'HURTADO', 'CRA 25A 14B14 LA GRACIELA', '3233359748', '1958-09-24', 'soltero', 'A+', 'DIANA CASTRILLON', '3127683084', '', 'EMSSANAR', '', NULL),
(1001, '94389851', 'ALEXANDER', '', 'GARCIA', 'NOGUERA', 'CALLE 9 5-77', '3154684570', '1975-05-09', 'soltero', 'O+', 'DIANA CASTRILLON', '3127683084', '', 'ASMESALUD', '', NULL),
(1002, '1116250961', 'JOSE', 'ALEXANDER', 'RIVERA', 'CRUZ', 'CALLE 6A 12-56', '3152726519', '1991-06-14', 'soltero', 'O+', 'DIANA CASTRILLON', '3127683084', '', 'MEDIMAS', '', NULL),
(1003, '94233690', 'JULIAN', '', 'MORALES', 'BUSTOS', 'CRA 17 26-18 LAS DELICIAS', '3173764507', '1985-03-08', 'soltero', 'A+', 'DIANA CASTRILLON', '3127683084', '', 'S.O.S', '', NULL),
(1004, '94366422', 'CARLOS', 'ALBERTO', 'GARCIA ', 'PARRA', ' K 28B 17-40', '3192554957', '1971-11-17', 'Casado', 'A+', 'ORLANDO HENAO', '', '3173678956', 'COOMEVA', '', 'solrac1527@gmail.com'),
(1005, '1116279153', 'JORGE ', 'IVAN', 'MILLAN', 'HERNANDEZ', 'CALLE 13 A -28 B 284', '3159282038', '1998-05-28', 'soltero', 'O+', 'DIANA CASTRILLON', '3127683084', '3173678956', 'SISBEN', 'NINGUNA', NULL),
(1006, '1116266691', 'JUAN ', 'GUILLERMO', 'OSPINA ', 'NIETO', 'kra 15   25  70', '3158005177', '1995-03-11', 'Union libre', 'O+', 'DIANA CASTRILLON', '3127683084', '', 'COOMEVA', '', NULL),
(1007, '16368469', 'EDINSON ', '', 'VARELA', 'RADA', 'CLLE 24-610', '3168331889', '1969-10-31', 'Union libre', 'A+', 'ORLANDO HENAO', '3173678956', '3173678956', 'NUEVA EPS', 'SURA', NULL),
(1008, '2677226', 'JESUS', 'MARIA', 'MONRROY', 'SALDARRIAGA', 'CL 6 22B-52', '3166355923', '1962-12-05', 'Casado', 'O+', 'DIANA CASTRILLON', '3127683084', '3173678956', 'NUEVA EPS', '', NULL),
(1009, '94390092', 'LUIS', 'EDINSON', 'BETANCOURTH', 'RAMIREZ', 'CRA 20A 8-24', '3168882282', '1975-06-14', 'Casado', 'O-', 'ORLANDO HENAO', '', '3173678956', 'SANIDAD', '', ''),
(1010, '94365672', 'ANTONIO', 'JOSE', 'RODRIGUEZ', 'RAMIREZ', 'CRA 31 28A 04', '3015080781', '1971-09-04', 'soltero', 'B+', 'ORLANDO HENAO', '3173678956', '3173678956', 'EMSSANAR', '', NULL),
(1011, '1116234657', 'NILSON', 'REINALDO', 'FLOREZ', 'OLAYA', 'TV 12#26A 40', '3136008020', '1986-05-20', 'soltero', 'O+', 'ORLANDO HENAO', '-', '3173678956', 'MEDIMAS', '-', 'nilson.florez1527@gmail.com'),
(1012, '94365853', 'OLMEDO', '-', 'CARDENAS', 'HINCAPIE', 'CALE 24-13 A 33', '3164036245', '1971-09-23', 'soltero', 'A+', 'ORLANDO HENAO', '3173678956', '3173678956', 'COOMEVA', 'NINGUNA', NULL),
(1013, '14873581', 'ROGELIO', '', 'CORREA', 'MOLINA', 'CALLE 14 22A 31', '3183190684', '1952-08-25', 'soltero', 'A+', 'DIANA CASTRILLON', '3127683084', '', 'COSMITEL', '', NULL),
(1014, '16342789', 'JESUS', 'MARIA', 'QUIROGA', '', 'CALLE 27 14-37 URB. LA ESPERANZA', '3154186207', '1949-12-12', 'soltero', 'B+', 'DIANA CASTRILLON', '3127683084', '', 'COOPSALUD', '', NULL),
(1015, '6461691', 'LUIS', 'ALBERTO', 'FRANCO', 'RESTREPO', 'CRA 21 22-32', '3177291988', '1960-03-15', 'soltero', 'O+', 'DIANA CASTRILLON', '3127683084', '', 'NUEVA EPS', '', NULL),
(1016, '16357295', 'LUIS', 'EDUARDO', 'LARGO', 'BUITRAGO', 'TRANV 12 26-02', '3186355158', '1962-10-04', 'soltero', 'O+', 'DIANA CASTRILLON', '3127683084', '', 'COOMEVA', '', NULL),
(1017, '16882381', 'LUIS ', 'HENRY', 'MENDOZA', 'GUTIERREZ', 'MANZ 62 CA 13 BOSQUES', '31583000064', '1962-12-23', 'Union libre', 'B+', 'ORLANDO HENAO', '3173678956', '3173678956', 'COOMEVA', 'ZURA ', NULL),
(1018, '1116243421', 'FELIX', 'ROGELIO', 'GUTIERREZ', 'VALENCIA', 'CRA 24A 14-64', '3145654239', '1989-04-09', 'soltero', 'O+', 'ORLANDO HENAO', '-', '3173678956', 'MEDIMAS', '-', NULL),
(1020, '16367082', 'ARBEY', '-', 'AGUIRRE ', 'ARIZA', 'KR 9 21A-06', '3167810408', '1969-01-18', 'Casado', 'O+', 'ORLANDO HENAO', '3173678956', '3173678956', 'SISBEN', '-', NULL),
(1021, '96360719', 'RENE', '', 'GONZALEZ', 'GARZON', 'CALLE 24 15-19', '3235203066', '1976-08-02', 'soltero', 'O+', 'DIANA CASTRILLON', '3127683084', '', 'S.O.S', '', NULL),
(1022, '14797019', 'MAURICIO', '', 'ESPAÃ‘A', 'BEITIA', 'MZ 22 13-27 LA VILLA', '3157059944', '1983-04-15', 'Casado', 'O+', 'DIANA CASTRILLON', '3127683084', '3173678956', 'MEDIMAX', 'NINGUNA', NULL),
(1023, '1112105182', 'JONNATHAN', 'STIR', 'CASAÃ‘AS', 'JARAMILLO', 'CALLE 4 3-35', '3226748850', '1994-05-17', 'Union libre', 'O+', 'ORLANDO HENAO', '3173678956', '', 'NUEVA EPS', 'NINGUNA', ''),
(1024, '16594192', 'JORGE ', 'EVANGELISTA', 'TRIVIÃ‘O', 'POSSO', 'CLL 25N 6W-87', '3162826894', '1958-04-13', 'Casado', 'O+', 'DIANA CASTRILLON', '3127683084', '3173678956', 'EMSSANAR', 'NINGUNA', 'k891ballz@gmail.com'),
(1025, '16401994', 'GUSTAVO', 'ANDRES', 'CADAVID', 'MEJIA', 'CLL 27 6W 38', '3192933982', '1980-02-09', 'Union libre', 'B-', 'DIANA CASTRILLON', '3127683084', '3173678956', 'EMSSANAR', 'NINGUNA', NULL),
(1026, '16350248', 'CESAR AUGUSTO', NULL, 'SANTA RESTREPO', NULL, 'CRA 30 36-73', '3173481089', '1955-06-17', '', '', 'DIANA CASTRILLON', '3127683084', NULL, NULL, NULL, NULL),
(1027, '14799568', 'WILDER ANDRES', NULL, 'MARIN GIRALDO', NULL, 'DIAGONAL 21A T 20-22 SANTA INES', '3152810626', '1984-07-22', '', '', 'DIANA CASTRILLON', '3127683084', NULL, NULL, NULL, NULL),
(1028, '17654085', 'CARLOS ', 'ANDRES', 'GONZALEZ', 'GOMEZ', 'MZ 59 CS 7', '3128594636', '1976-02-20', 'Union libre', 'O+', 'DIANA CASTRILLON', '3127683084', '3173678956', 'MEDIMAX', 'NINGUNA', NULL),
(1029, '94395255', 'CESAR', 'ERWIN', 'ARCE', 'MACIAS', 'CRA 28 40C-012', '3127841278', '1978-05-06', 'soltero', 'O+', 'ORLANDO HENAO', '', '3173678956', 'COOMEVA', '', ''),
(1030, '6111959', 'JOSE', 'ALBERTO', 'ALZATE', 'VALENCIA', 'KRA 11 21-34', '3163677877', '1970-10-07', 'soltero', 'A+', 'ORLANDO HENAO', '3173678956', '3173678956', 'SOS', 'SURA', NULL),
(1031, '16350387', 'JOSE', 'HERLEY', 'MESA', 'VALENCIA', 'CALLE 34 #34-12', '3206808689', '1958-09-07', 'soltero', 'A+', 'DIANA CASTRILLON', '3127683084', '3173678956', 'EMSSANAR', '', NULL),
(1032, '16363333', 'JOSE ', 'ARBEY', 'ESPINOSA', '', 'NUEVO AGUACLARA ', '3107355199', '1966-05-07', 'Casado', 'O-', 'DIANA CASTRILLON', '3127683084', '3173678956', 'NUEVA EPS', 'SURAMERICANA', NULL),
(1033, '94366206', 'NESTOR', 'ADOLFO', 'VALENCIA', 'DOMINGUEZ', 'Calle 22 7- 36 LAS AMERICAS', '3138519032', '1972-04-18', 'Casado', 'O-', 'ORLANDO HENAO', '3173678956', '', 'SOS', '', 'nevado-94@hotmail.com'),
(1034, '94394347', 'ROBERTO', 'LUIS', 'HENAO', 'GARCIA', 'Mz i casa 2, paraiso', '3117741571', '1977-10-13', 'Union libre', 'O+', 'DIANA CASTRILLON', '3127683084', '3173678956', 'medimax', 'ninguna', NULL),
(1037, '94366373', 'NOLBERTO', '', 'GUTIERREZ', 'NARANJO', 'KR 4 OS 20-47', '3182829550', '1972-06-21', 'Casado', 'B+', 'ORLANDO HENAO', '3173678956', '', 'SANITAS', 'R-4 BOLIVAR', 'nolbertog1972@gmail.com'),
(1038, '70061307', 'FRANCISCO', 'ANTONIO', 'ECHEVERRY', 'ZAPATA', 'CRA 29 19-21', '3216104149', '1954-04-17', 'Union libre', 'O+', 'DIANA CASTRILLON', '3127683084', '3173678956', 'MADIMAX', 'NINGUNA', 'jesucristo.ramires@hotmail.com'),
(1039, '94152920', 'JORGE', 'ELIECER', 'GARCIA', 'URIBE', 'CRA 48B # 14a -09', '3177355476', '1980-06-20', 'Union libre', 'B+', 'ORLANDO HENAO', '3173678956', '', 'EMSSANAR', '', ''),
(1040, '94395985', 'JOSE', 'DAVID', 'LOZANO', 'OCAMPO', 'TRANSV 12 14-08 DIABLOS ROJOS', '3137345410', '1978-08-18', 'soltero', 'A+', 'ORLANDO HENAO', '-', '3173678956', 'EMSSANAR', '-', 'david20201@live.com'),
(1041, '18462981', 'JUSTINIANO', 'MARIA', 'PAREDES', 'HERNANDEZ', 'CALLE 26E # 2W 52', '320 552 54 46', '7961-11-11', 'Casado', 'O+', 'DIANA CASTRILLON', '3127683084', '317 367 89 56', 'SOS', '', NULL),
(1042, '13445103', 'VICTOR', 'ABSALON', 'PEREZ', 'HOYOS', 'C 5 20-27', '3122254488', '1958-11-19', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '3173678956', 'EMSSANAR', 'NINGUNA', ''),
(1043, '14797620', 'EUGENIO', 'MAYERLIN', 'DIAZ', '', 'C 41 33-54', '3127303145', '1983-07-27', 'Casado', 'O+', 'DIANA CASTRILLON', '3127683084', '3173678956', 'NUEVA EPS', 'SURA', NULL),
(1044, '1007544639', 'JUAN', 'CAMILO', 'ZULETA', 'MENESES', 'CALLE 26 C 3-29', '3163011078', '1999-12-07', 'Union libre', 'A+', 'DIANA CASTRILLON', '3127683084', '3173678956', 'EMSSANAR', 'NINGUNA', NULL),
(1045, '1116243428', 'BRAHIAN', 'ANDRES', 'BUENO', 'RAMIREZ', 'CALLE 14a 9B 41', '310 402 61 95', '1989-03-23', 'Casado', 'A+', 'ORLANDO HENAO', '', '3173678956', 'COOMEVA', '', ''),
(1046, '1116261734', 'GUSTAVO', 'ADOLFO', 'TANGARIFE', 'URIBE', 'CRA 20A 9A 60 BELLO HORIZONTE', '3127726930', '1994-01-19', 'soltero', 'O-', 'ORLANDO HENAO', '3173678956', '3173678956', 'NUEVA EPS', '-', NULL),
(1047, '1116252594', 'CARLOS', 'ARTURO', 'PERALTA', 'PALOMINO', 'CRA 22 12-64', '3163523825', '1991-11-06', 'soltero', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(1048, '94325033', 'CARLOS ', 'ARTURO', 'QUINTERO', 'ZAPATA', 'CALLE 4A 19-40', '3218197515', '1975-03-24', 'soltero', 'A+', 'ORLANDO HENAO', '-', '3173678956', 'S.O.S', '-', NULL),
(1049, '1004766929', 'ANYELO', '', 'BALLESTEROS', 'LONDOÃ‘O', 'CRA 24A 14-64 MARACAIBO', '3186942748', '1997-10-25', 'soltero', 'O+', 'ORLANDO HENAO', '', '3173678956', 'COOSALUD', 'R-4 BOLIVAR', ''),
(1050, '14795260', 'JAIME', 'REINALDO', 'MONCADA', 'ARANGO', 'CALLE 7A OESTE 25-52 LAS NIEVES', '3154541639', '1981-05-04', 'soltero', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(1051, '6497749', 'MAURICIO', '', 'VALDERRAMA', 'SALAZAR', 'K 28 37-130', '3186700659', '1978-10-11', 'Casado', 'A+', 'DIANA CASTRILLON', '3127683084', '3173678956', 'SANITAS', 'NINGUNA', NULL),
(1052, '1116261392', 'BRAYAN', 'ASDRUBAL', 'VILLAREAL', 'VALENCIA', 'C 25C 11-28', '3166013266', '1994-01-08', 'Union libre', 'B+', 'ORLANDO HENAO', '3173678956', '3173678956', 'EMSANAR', '', 'brayitanvillarreal@gmail.com'),
(1055, '94395749', 'ARLEY', '', 'CASTRO', 'LEON', 'CALLE 26B 13A 27 LA ESPERANZA', '3234567934', '1978-05-04', 'soltero', 'A+', 'DIANA CASTRILLON', '3127683084', '', 'COMFANDI', '', NULL),
(1057, '1116273203', 'HECTOR ', 'FABIAN', 'CASTILLO', 'LAMUS', 'CRA 8 26G-75', '3126066008', '1996-10-19', 'Union libre', 'O+', 'ORLANDO HENAO', '3173678956', '3173678956', 'S.O.S', 'SURA', 'juanlamuscastillo@hotmail.com'),
(1058, '86057194', 'HAROLD', 'FERNEY', 'VINASCO', 'RAMIREZ', 'CALLE 26 nÂ° 36-42', '3192397922', '1977-01-15', 'soltero', 'B+', 'DIANA CASTRILLON', '3127683084', '', 'EMSSANAR', '', NULL),
(1059, '1036671310', 'YEISSON', 'STIVEN', 'FRANCO', 'LOPEZ', 'C 25B 334', '3207367513', '1997-01-10', 'Union libre', 'O+', 'DIANA CASTRILLON', '3127683084', '3173678956', 'COOMEVA', 'NINGUNA', NULL),
(1061, '86057194', 'HAROLD', 'FERNEY', 'VINASCO', 'RAMIEREZ', 'C 26 36-42', '3192397922', '1977-01-15', 'soltero', 'B+', 'DIANA CASTRILLON', '3127683084', '3173678956', 'EMSANAR', 'NINGUNA', NULL),
(1062, '14877667', 'LUIS', 'EDUARDO', 'DIAZ', 'GRISALES', 'CARRERA 4A NÂ° 26 D 55', '3152043752', '1957-03-15', 'Casado', 'A+', 'DIANA CASTRILLON', '3127683084', '', 'EMSSANAR', '', NULL),
(1063, '16352831', 'JAIRO', '', 'GONZALEZ', 'CUERO', 'CRA 2 23-20', '3185375901', '1959-11-15', 'soltero', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(1064, '5820419', 'EDGAR', 'EDUARDO', 'GOMEZ', 'SILVA', 'C 13 9A-29', '3108532652', '1981-11-14', 'Separado', 'O+', 'DIANA CASTRILLON', '3127683084', '', 'PONAL', '', NULL),
(1066, '4347159', 'ANGEL ', 'DE DIOS', 'BALLESTEROS', 'OROZCO', 'K 24A 14-64', '3175785616', '1955-10-18', 'Union libre', 'A+', 'ORLANDO HENAO', '3173678956', '', 'COOMEVA', 'NINGUNA', ''),
(1067, '18466039', 'JHON ', 'JAIRO', 'VILLEGAS', 'PATIÃ‘O', 'KR 19-27-28', '3136682930', '1971-06-01', 'Union libre', 'O+', 'DIANA CASTRILLON', '3127683084', '3173678956', 'EMSANAR', 'NINGUNA', NULL),
(1068, '1116261451', 'JUAN ', 'CAMILO', 'VALENCIA ', 'VAZQUEZ', 'MZ M C 6', '3173353570', '1993-07-28', 'soltero', 'O-', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(1069, '1116261451', 'JUAN', 'CAMILO', 'VALENCIA', 'VASQUEZ', 'MZ M C 6', '3173353570', '1993-07-28', 'soltero', 'O+', 'DIANA CASTRILLON', '3127683084', '3173678956', 'MEDIMAS', 'NINGUNA', NULL),
(1070, '94357538', 'ALBERT', 'RODRIGO', 'VARGAS', 'MARULANDA', 'CRA 3 21-174 LA ISABELA ANDALUCIA', '3228751782', '1983-10-18', 'soltero', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(1071, '16368245', 'JAIRO', '', 'CORREA', 'GOMEZ', 'TV 28C 3A 30 NVO aguaclara', '310 830 73 91 ', '1967-11-14', 'Union libre', 'A+', 'DIANA CASTRILLON', '3127683084', '3173678956-3113593933', 'COOMEVA', '', NULL),
(1072, '96331399', 'FABIO', '', 'CORREA', 'RODRIGUEZ', 'CRA 6A 12 48', '320 992 90 43', '1973-10-09', 'soltero', 'O+', 'DIANA CASTRILLON', '3127683084', '3173678956-', 'SISBEN ', '', NULL),
(1073, '16358162', 'RAMIRO', '', 'PUERTAS', 'UNAS', 'K 27A 37-53', '3206067292', '1963-04-26', 'Union libre', 'O-', 'ORLANDO HENAO', '3173678956', '', 'ENSANAR', '', ''),
(1074, '2690668', 'HECTOR', 'FABIO', 'CANIZALES', 'REINA', 'CALLE 12B 28B 18', '313 758 52 19', '1951-04-26', 'Casado', 'A+', 'DIANA CASTRILLON', '3127683084', '3173678956-', 'MEDIMAS', '', NULL),
(1075, '1116239299', 'ORLANDO', 'O', 'AGUIRRE', 'GRAJALES', 'C 6A 17-82', '3158815217', '1987-11-20', 'Union libre', 'O+', 'DIANA CASTRILLON', '3127683084', '3173678956-', 'ENSSANAR', 'O', NULL),
(1076, '6494116', 'ARCADIO', 'DE JESUS', 'QUIROZ', 'RIOS', 'CALLE 15 22B 09', '3117650752', '1945-03-29', 'Casado', 'O+', 'DIANA CASTRILLON', '3127683084', '', 'NUEVA EPS', '', NULL),
(1078, '16343738', 'LUIS', 'FELIPE', 'VASQUEZ', 'GONZALES', 'CHAPINERO 12-55', '3173338960', '1951-11-01', 'Casado', 'A-', 'DIANA CASTRILLON', '3127683084', '3173678956-', 'ENSANAR', 'NINGUNA', NULL),
(1079, '94251063', 'OSCAR', 'HERNAN', 'TORO ', 'MARIN', 'DG 26C3 T 4Â°28', '2306517', '1965-03-24', 'Casado', 'O+', 'DIANA CASTRILLON', '3127683084', '3173678956-', 'ENSSANAR', '', NULL),
(1080, '6446788', 'EDGAR', 'JULIAN', 'GIRON', 'LOZANO', 'CRA 28 40C-08', '3154412982', '1986-01-27', 'Union libre', 'A+', 'DIANA CASTRILLON', '3127683084', '3173678956-', 'ENSSANAR', '', NULL),
(1081, '16361760', 'OSCAR WILLIAM', NULL, 'ERAZO BUSTAMANTE', NULL, 'CRA 30 36-73', '3173481089', '1965-07-19', '', '', 'DIANA CASTRILLON', '3127683084', NULL, NULL, NULL, NULL),
(1084, '16360245', 'VICTOR ', 'MANUEL', 'JARAMILLO', 'DUQUE ', 'CRA 23 22 17', '3187259294', '1964-04-13', 'Casado', 'O+', 'DIANA CASTRILLON', '3127683084', '3173678956-', 'COOMEVA', '', NULL),
(1085, '6446589', 'HAROL', 'MAURICIO', 'GALVEZ', 'QUIROGA', 'MZ 62 CS 1', '3185814000', '1984-07-27', 'soltero', 'O+', 'DIANA CASTRILLON', '3127683084', '3173678956-', 'CAFESALUD', 'NINGUNA', NULL),
(1086, '1116232487', 'FELIX', 'ANTONIO', 'ZAPATA', 'SALAZAR', 'K 9 7A-13', '3183720841', '1986-03-23', 'Union libre', 'O-', 'DIANA CASTRILLON', '3127683084', '3173678956', 'EMSANAR', 'NINGUNA', NULL),
(1087, '6465026', 'CARLOS', 'DAGNOVER', 'GOMEZ', '', 'K 27B40-A20', '3168065399', '1966-01-13', 'Casado', 'A+', 'ORLANDO HENAO', '', '3173678956', 'SISBEN', 'NINGUNA', ''),
(1089, '6497138', 'LIBARDO', '', 'MORANTE', 'GRANDA', 'CALLE 9B 17-66 SANTA INES', '3187434848', '1946-12-21', 'soltero', 'A-', 'ORLANDO HENAO', '3173678956', '', 'NUEVA EPS', '', ''),
(1090, '75144663', 'JORGE', 'ELIECER', 'GAVIRIA', 'RAMIREZ', 'CALLE 39-20A31', '3148610019', '1974-11-07', 'Union libre', 'O+', 'DIANA CASTRILLON', '3127683084', '3173678956-', 'COLSANITAS', 'SURA', NULL),
(1091, '94284606', 'luis', 'humberto', 'arboleda', 'toro', 'ca,32 b-18-aa-44', '3188440343', '1976-07-17', 'Casado', 'O+', 'DIANA CASTRILLON', '3127683084', '3127683084', 'ensanar', 'ninguno', NULL),
(1092, '1112303266', 'LUIS', 'ALFREDO', 'CASTAÃ‘EDA', 'ORREGO', 'C 20 1 a-13', '3233972018', '1997-05-11', 'soltero', 'O+', 'DIANA CASTRILLON', '3127683084', '3127683084', 'NUEVA EPS', '-', NULL),
(1093, '16435512', 'ELIAS', 'DE JESUS', 'MESA', 'GARCIA', 'CRA 25 15-54', '3155491286', '1966-08-25', 'soltero', 'A+', 'ORLANDO HENAO', '3173678956', '3155491216', 'EMMSANAR', 'NINGUNO', 'elias714@hotmail.com'),
(1094, '6273667', 'SAUL', NULL, 'OBANDO SAENZ', NULL, 'TV 20 7-03', '3173544729-3175528392', '1963-03-17', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(1095, '94389377', 'FABIAN', '', 'RODRIGUEZ', '', 'CALLE 9A 28-C28 SANTA RITA 2 ETAPA', '3205046417', '1969-09-17', 'soltero', 'O+', 'DIANA CASTRILLON', '3127683084', '', 'COOMEVA', '', NULL),
(1096, '1069258319', 'WILMAR', 'ERNEY', 'VALENZUELA', 'ZAMORA', 'MANZ R CASA 4 EL MANA', '3103030845', '1988-02-26', 'soltero', 'O+', 'ORLANDO HENAO', '', '3173678956', 'COOMEVA', '', ''),
(1098, '94388980', 'NELSON', 'ENRIQUE', 'OSPINA', 'PATIÃ‘O', 'CRA 9 10-42', '318 8796199', '1974-08-12', 'soltero', 'O+', 'DIANA CASTRILLON ', '3127683084', '', '', '', NULL),
(1099, '1116280817', 'DIEGO', 'FERNANDO', 'PATIÃ‘O', 'AMARILES', 'MANZ B CASA 4 AGUACLARA', '3176830165', '1998-08-20', 'soltero', 'A+', 'ORLANDO HENAO', '3173678956', '', '', '', ''),
(1100, '18595241', 'CESAR', 'AUGUSTO', 'PACHON', 'ESTRADA', 'DIAG 20 14A 06 HORIZONTE', '3138592458', '1968-09-24', 'Casado', 'B+', 'DIANA CASTRILLON', '3127683084', '', 'SANITAS', '', NULL),
(1102, '6445190', 'HENRY', '', 'PALOMINO', '', 'CALLE 7 2-03 SAN PEDRO', '3184407624', '1969-06-30', 'Union libre', 'A+', 'DIANA CASTRILLON', '3127683084', '', 'S.O.S.', '', NULL),
(1103, '16357281', 'JOSE', 'IGNACIO', 'OSORIO', 'PENAGOS', 'K 8 26 A 37', '3167952555', '1962-11-07', 'Union libre', 'O+', 'DIANA CASTRILLON', '3127683084', '3127683084', 'S.O.S', 'NINGUNA', NULL),
(1105, '14797274', 'CARLOS', 'HERNAN', 'BECERRA', 'GARZON', 'KRA 20A 7 -48', '3182767948', '1983-05-23', 'Union libre', 'A+', 'DIANA CASTRTILLON', '3127683084', '3127683084', 'SOS', 'SURA', NULL),
(1107, '1116253916', 'OSCAR', 'EDUARDO', 'PADILLA', 'CORTES', 'KRA 22 A 5 B 04', '3187099050', '1992-03-16', 'soltero', 'B+', 'ORLANDO HENAO', '', '3173678956', 'ENSANAR', 'NINGUNA', ''),
(1108, '94152004', 'FREDY', 'FERNANDO', 'ROMO', 'LOTERO', 'CRA 20 16-21 EL ROJAS', '3157061366', '1978-04-28', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '3173678956', 'MEDIMAS', '-', NULL),
(1109, '2676900', 'ORLANDO', '', 'CARDONA', 'GIRALDO', 'CALLE 11 BIS 28B-49 NUEVA HOLANDA', '3185298753', '1957-01-18', 'Union libre', 'O+', 'ORLANDO HENAO', '3173678956', '', 'MEDIMAS', '', ''),
(1110, '16535019', 'MARCO', 'TULIO', 'VARON', 'GOMEZ', 'LA VILLA MANZ 11 NÂ°38B 69', '3184742934', '1955-09-25', 'Casado', 'A+', 'DIANA CASTRILLON', '3127683084', '', 'NUEVA EPS', '', NULL),
(1111, '94394297', 'HOOVER', 'GUILLERMO', 'NARANJO', 'AGUDELO', 'CALLE 38 30-23 FATIMA', '3145018138', '1977-08-03', 'Casado', 'O+', 'ORLANDO HENAO', '', '3176378956', 'COOMEVA', '', 'guaca.h@hotmail.com'),
(1114, '79305185', 'LUIS ', 'ALFONSO', 'MORENO ', 'SANABRIA', 'CALLE 3 24A 56 PORTALES DEL RIO', '3104668963', '1964-04-26', 'soltero', 'A+', 'ORLANDO HENAO', '', '3173678956', 'SANITAS', 'R-4  ', 'pochos0464@gmail.com'),
(1116, '16731009', 'FREDDY', 'EDUARDO ', 'GARCIA', 'REYES', 'HUASANO', '3127136459', '1966-09-24', 'soltero', 'A+', 'ORLANDO HENAO', '3173678956', '', 'MEDIMAS', '-', ''),
(1117, '1112770933', 'JAIRO', 'ALONSO', 'GRANADA', 'PARRA', 'C 26F 2 O 34', '3145663115', '1990-08-18', 'soltero', 'O+', 'DIANA CASTRILLO', '0', '3127683084', 'S0S', 'SURA', NULL),
(1118, '16347503', 'JUAN', '', 'BAUTISTA', 'CASTILLO', 'VEREDA EL CAIRO VIA TRES ESQUINAS', '3135526340', '1956-01-28', 'Casado', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(1119, '1116252085', 'ISABEL', 'CRISTINA', 'AGUIRRE', 'LOPEZ', 'AV. PRINCIPAL 26-75 AGUA CLARA', '3103831659', '1991-09-18', 'soltero', 'A+', 'ORLANDO HENAO', '3173678956', '', 'MEDIMAS', '', ''),
(1121, '14894341', 'ALEXANDER', '-', 'GARCIA', 'USAQUEN', 'MANZANA 39-15', '3232878816', '1971-05-19', 'Union libre', 'O+', 'ORLANDO HENAO', '3173678956', '3173678956', 'MEDIMAS', '-', 'lauracamila1223@hotmail.com'),
(1122, '1112102799', 'NAZLY ', 'TATIANA', 'CORREA', 'BLANDON', 'CALLE 26B1 10 26', '3217531779', '1991-01-26', 'soltero', 'O+', 'DIANA CASTRILLON', '3127683084', '3127683084', 'SURA', '-', NULL),
(1123, '2622074', 'MARTIN', 'ELIAS', 'TANGARIFE', 'TANGARIFE', 'CALLE 24A 3OESTE 33', '3158690307', '1939-03-09', 'soltero', 'O+', 'DIANA CASTRILLON ', '3127683084', '3127683084', 'EMSSANAR', '-', NULL),
(1125, '94152453', 'DIEGO', 'ARBEY', 'NARANJO', 'AGUDELO', 'C 38 30-23', '3175890113', '1981-01-27', 'Separado', 'O+', 'DIANA CASTRILLON', '-', '3127683084', 'NUEVA EPS', 'POSITIVA', NULL),
(1126, '94357072', 'HAROLD', '', 'GAVIRIA', 'GONZALEZ', 'VEREDA SANJON DE PIEDRA-ANDALUCIA', '3187644804', '1981-07-24', 'Separado', 'A+', 'DIANA CASTRILLON', '-', '3127683084', 'SANIDAD-POLICIA', '-', NULL),
(1128, '14795584', 'ROBINSON', '-', 'BUITRAGO', 'QUINTERO', 'C 30 41-18', '3136069554', '1982-07-16', 'soltero', 'O+', 'DIANA CASTRILLON', '-', '3127683084', 'ASMESALUD', '-', NULL),
(1129, '10137373', 'LUIS', 'ALBERTO', 'ORTIZ', 'OSORIO', 'CRA 17 26B-17', '3148469437', '1970-08-14', 'Casado', 'O+', 'ORLANDO HENAO', '3173678956', '', 'EMSANAR', '-', ''),
(1130, '16364684', 'DIEGO', 'FERNANDO', 'ROJAS', 'MANZANO', 'KRA 34 36 36', '3183158201', '1967-06-18', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '', 'NUEVA EPS', 'POSITIVA', 'difermanro@gmail.com'),
(1131, '94367210', 'REINEL', '', 'GALLEGO', 'HURTADO', 'KRA 39 13 31', '3136438934', '1971-11-15', 'Casado', 'O+', 'DIANA CASTRILLON', '3127683084', '3127683084', 'CICASUR', '', NULL),
(1132, '1116274175', 'ANDRES', 'JOHANNY', 'MONTOYA', 'GARCIA', 'MANZANA U CASA 1', '3218583217', '1992-03-30', 'soltero', 'A+', 'DIANA CASTRILLON', '3127683084', '3127683084', 'EMSSANAR ', '-', NULL),
(1135, '16352309', 'DIEGO', 'DE JESUS', 'ZAPATA', 'GALVEZ', 'CRA 35 27-63', '3176857741', '1959-08-04', 'soltero', 'O+', 'DIANA CASTRILLON', '3127683084', '', 'EMSSANAR', '', NULL),
(1136, '94152539', 'WILSON ', 'ANDRES', 'PALACIOS', 'GALVEZ', 'KRA 35 37 34', '3145875131', '1981-01-24', 'Union libre', 'A+', 'DIANA CASTRILLON', '3127683084', '3127683084', 'NUEVA EPS', 'SURA', NULL),
(1137, '1112300035', 'JORGE', 'LUIS', 'VALENZUELA', 'SANCHEZ', 'KRA 2 10 82', '3135526140', '1989-03-31', 'Union libre', 'A+', 'DIANA CASTRILLON', '3127683084', '3127683084', 'EMSSANAR', 'NINGUNO', NULL),
(1138, '16347468', 'CARLOS', 'ARTURO', 'AGUDELO', '', 'CRA 1 OESTE 22-48 FARFAN', '3162388257', '1957-10-29', 'soltero', 'A+', 'DIANA CASTRILLON', '3127683084', '', '', '', NULL),
(1139, '14797849', 'JHON', 'FREDDY', 'MARIN', 'ALVAREZ', 'MANZANA 29 CASA 30', '3132830983', '1983-06-17', 'soltero', 'O+', 'DIANA CASTRILLON', '3127683084', '317683084', 'EMSSANAR', '-', NULL),
(1140, '1107053512', 'FABIAN', 'CAMILO', 'DELGADO', 'GRISALES', 'CARRERA 26A 38 25', '3206192022', '1989-02-17', 'Union libre', 'O+', 'ORLANDO HENAO', '', '3173678956', 'MEDIMAS', '', ''),
(1141, '1075876007', 'BRANDONN', 'DAVID', 'PARDO', 'AREVALO', 'HOTEL LA LUNA', '3193176837', '1996-02-26', 'Casado', 'O-', 'DIANA CASTRILLON', '3127683084', '3127683084', 'SANITAS', 'NINGUNO', NULL),
(1144, '16359264', 'JOSE', 'IGNACIO', 'IZQUIERDO', 'VALENCIA', 'DG 23A 9-72', '3173958591', '1962-06-18', 'Union libre', 'B+', 'DIANA CASTRILLON', '-', '3127683084', 'NUEVA EPS', '-', NULL),
(1145, '16535019', 'EDWIN ', 'TULIO', 'TORO ', 'TREJOS', 'carrera 35 # 20-68', '3504867076', '1990-05-01', 'soltero', 'O-', 'ORLANDO HENAO-LUZ MARINA', '-', '3173678956-3117005311', 'NUEVA EPS', '-', NULL),
(1146, '71312505', 'JORGE', 'HERNAN', 'SALCEDO', 'GUTIERREZ', 'CRA 21 14A-13 LA CAMPIÃ‘A', '3103133830', '1979-05-14', 'soltero', 'B+', 'ORLANDO HENAO', '3173678956', '', 'SANITAS', 'R-4 SURA', 'jorgesalcedo1979@hotmail.com'),
(1147, '1096243636', 'GEOVANNY', 'ANDRES', 'SERRANO', 'CAICEDO', 'CARRERA 13 26-87', '3204007051', '1997-07-05', 'soltero', 'O+', 'DIANA CASTRILLON', '3127683084', '3127683084', 'COOMEVA', '-', 'andresserrano05.as@gmail.com'),
(1148, '94193155', 'HAROLD', 'HOONER', 'GOMEZ', 'CARDENAS', 'CALLE 12A 28E -06', '3046423579', '1977-10-30', 'soltero', 'A+', 'ORLANDO HENAO', '3173678956', '', '', '', 'honer30@hotmail.com'),
(1149, '94389056', 'MARCO', 'FIDEL', 'MONTOYA', 'GIRALDO', 'CALLE 23 4 OESTE 12', '3187946474', '1974-04-08', 'Casado', 'O+', 'ORLANDO HENAO', '3173678956', '', 'NUEVA EPS', '', ''),
(1150, '14799697', 'JOSE', 'MAURICIO', 'SARMIENTO', 'MERCADO', 'MANZ. 67 CASA 9 BOSQUES', '3215999086', '1984-07-18', 'Union libre', 'O+', 'DIANA CASTRILLON', '', '', 'EMSANAR', '', NULL),
(1151, '1116266923', 'JULIAN', 'ANDRES', 'CASTAÃ‘O', 'VARELA', 'CALLE 25 12-65 PLAYAS', '3187506619', '1995-03-18', 'soltero', 'O-', 'ORLANDO HENAO', '3173678956', '3173678956', 'SOS', 'COLPATRIA', NULL),
(1153, '1116271278', 'JHON ', 'ANDERSON', 'RINCON', 'MOSCOSO', 'MANZ B LOTE 9 PARCELA 2', '3173906658', '1996-04-26', 'soltero', 'A+', 'ORLANDO HENAO', '3173678956', '', '', '', 'rumirydiana2012@gmail.com'),
(1154, '94357515', 'RUBEN', 'ALONSO', 'BENITEZ', 'NIETO', 'C 12b 28a-28', '3113420296', '1983-08-14', 'Union libre', 'A+', 'ORLANDO HENAO', '-', '3173678956', 'S.O,S', 'SURA', ''),
(1155, '1070599738', 'JHONATAN ', 'DAVID', 'SILVA', 'SANCHEZ', 'CALLE 18 1 03 ', '3114267178', '1990-01-28', 'Union libre', 'A+', 'DIANA CASTRILLON', '3127683084', '3127683084', 'SALUD TOTAL', '', NULL),
(1156, '16915526', 'ALEXANDER', '', 'MARTINEZ', 'RUIZ', 'KRA 33a 40-39', '3166891874', '1980-11-15', 'Casado', 'O+', 'DIANA CASTRILLON', '-', '3166891874', 'NUEVA EPS', '-', 'martinezjhon8043@gmail.com'),
(1157, '18595417', 'JORGE', 'EDUARD', 'RENDON', 'RODRIGUEZ', 'CALLE 9A 18-46 FLOR DE LA CAMPANA', '3155251423', '1969-06-24', 'soltero', 'O+', 'DIANA CASTRILLON', '', '', '', '', 'flaco0040@hotmail.es'),
(1158, '18395602', 'DIDIER', 'ORLANDO', 'COY', 'PAEZ', 'CALLE 4A 24-29 PORTALES DEL RIO', '3175579504', '1974-09-16', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '3173678956', 'MEDIMAX', '', 'didiercoy6@gmail.com'),
(1160, '1116281688', 'FRANCK', 'NICOLAS', 'ROJAS ', 'BEDOYA', 'CALLE 8a 28 b-43', '3127177095', '1999-02-02', 'Union libre', 'A+', 'ORLANDO HENAO', '-', '3173678956', 'ENSSANAR', 'SURA', NULL),
(1162, '1018451560', 'JHON', 'CESAR', 'PERDOMO', 'ESCOBAR', 'AGUACLARA CALLEJON EL MATE 2 CASA 8', '3014505510', '1992-04-25', 'soltero', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', 'jhonceperes1992@hotmail.com'),
(1163, '18392167', 'BAUDELINO', '', 'PULGARIN', 'NOREÃ‘A', 'CRA 5B OESTE 25-69 LAURELES 2', '3157110857', '1969-04-14', 'soltero', 'B-', 'DIANA CASTRILLON', '3127683084', '', 'EMSSANAR', '', ''),
(1164, '1116725650', 'JHON', 'STIVEN', 'GONZALEZ', 'CARDONA', 'CALLE 26B 1-35 SAN PEDRO CLAVER', '3195809984', '1993-09-11', 'soltero', 'B+', 'ORLANDO HENAO', '', '3173678956', 'NUEVA EPS', '', 'johncardona09@hotmail.com'),
(1165, '98431473', 'WILSON', 'FREDY', 'CASAS', 'MOLINA', 'CALLE 26M 10-39 BUENOSAIRES', '3163422824', '1979-02-20', 'Union libre', 'O+', 'ORLANDO HENAO', '', '3173678956', 'NUEVA EPS', 'R-4 BOLIVAR', ''),
(1166, '14695677', 'ORLANDO', '', 'VALENCIA', 'RODRIGUEZ', 'CALLE 5 19-56 JORGE ELIECER GAITAN', '3172973705', '1976-10-23', 'soltero', 'B+', 'DIANA CASTRILLON', '3127683084', '', 'COOPSALUD', '', ''),
(1168, '94231179', 'JOSE', 'HEIBAR', 'CARDENAS', 'OSPINA', 'CALLE 17 1A-50 VILLA LILIANA', '3135094710', '1979-07-14', 'soltero', 'O-', 'DIANA CASTRILLON', '3127683084', '', '', '', 'josemanuel0722@hotmail.com'),
(1169, '7549367', 'HECTOR', 'FABIO', 'GONZALEZ', 'DELGADO', 'CALLE 13 10-36 EL REFUGIO', '3185800647', '1966-03-22', 'Casado', 'O+', 'ORLANDO HENAO', '-', '3173678956', 'PONAL', '-', ''),
(1170, '1116263587', 'Jhon ', 'Janer', 'Alvarado', 'Cardona', 'Pasaje C 28 A 53', '3116697555', '1994-06-22', 'Union libre', 'A+', 'Diana Castrillon', '-', '3127683084', 'SOS', '-', NULL),
(1171, '6357588', 'JOSE', 'BERNARDO', 'LONDOÃ‘O', 'RIVERA', 'CRA 12B 26-47 LA CEIBA', '3184637311', '1965-07-16', 'soltero', 'A+', 'DIANA CASTRILLON', '3127683084', '', 'EMSSANAR', '', ''),
(1172, '14801418', 'CESAR', 'ANDRES', 'VALENCIA', 'JIMENEZ', 'MZ 40 C 28', '3164772404', '1985-06-23', 'Union libre', 'A+', 'ORLANDO HENAO', '-', '3173678956', 'ENSANAR', '-', ''),
(1173, '94301631', 'DOLMER', '', 'CAÃ‘AS', 'HERNANDEZ', 'CALLE 14 10-23 EL REFUGIO', '3137171833', '1974-07-08', 'soltero', 'O-', 'ORLANDO HENAO', '3173678956', '', 'EMSSANAR', 'R-4 SURA', ''),
(1174, '1116247561', 'LUIS', 'ALFONSO', 'BALCAZAR', 'IDROBO', 'K 2 O 20-47', '3177745219', '1989-08-23', 'Casado', 'A+', 'ORLANDO HENAO', '3173678956', '', 'S O S', '-', ''),
(1176, '94450340', 'WILLIAN', 'ANDRES', 'HINCAPIE', 'ALVAREZ', 'CLL 3 23-09', '3104903938', '1983-10-13', 'soltero', 'O+', 'DIANA CASTRILLON', '-', '3127683084', 'EMSANAR', 'SURA', NULL),
(1177, '94480340', 'WILLIAM', 'ANDRES', 'HINCAPIE', 'ALVAREZ', 'CALLE 25 10 15', '3184706451', '1983-10-13', 'soltero', 'O+', 'DIANA CASTRILLON', '3127683084', '3127683084', 'EMSSANAR', 'SURA', NULL),
(1178, '1116250866', 'JHON', 'ALEXANDER', 'GIRALDO', 'RESTREPO', 'KRA  2 OEST-20-41', '3158498952', '1991-05-15', 'Union libre', 'A+', 'ORLANDO HENAO', '-', '3173678956', 'MEDIMAS', 'NINGUNA', ''),
(1179, '94151191', 'RUBEN', 'DARIO', 'ROSERO', 'MARTINEZ', 'KRA 28 5 23', '3157098746', '1980-04-19', 'soltero', 'AB+', 'ORLANDO HENAO', '3173678956', '3173678956', 'EMSSANAR', 'NINGUNA', NULL),
(1180, '4572403', 'FAURICIANO', '', 'JIMENEZ', 'MONTOYA', 'CALLE 26A1 13-23 LA ESPERANZA', '3175863096', '1957-12-18', 'Casado', 'A+', 'ORLANDO HENAO', '3173678956', '', 'SURA', 'NINGUNO', 'jimenezfauriciano@gmail.com'),
(1181, '94368325', 'JIMMY', '', 'CALDERON ', 'CRUZ', 'C 17 24 a-30', '3183431895', '1973-06-23', 'Union libre', 'A+', 'ORLANDO HENAO', '3173678956', '3127683084', 'NUEVA EPS', 'SURA', 'americalalocuraroja@gmail.com'),
(1182, '15988656', 'ROGELIO', '', 'MEJIA', 'SALAZAR', 'CALLE 19 No. 15E 70', '3116271327', '1971-11-10', 'soltero', 'O+', 'DIANA CASTRILLON', '3127683084', '', '', '', '');
INSERT INTO `conductor` (`id_conductor`, `codigo`, `nombre1`, `nombre2`, `apellido1`, `apellido2`, `direccion`, `telefono`, `fecha_nace`, `est_civil`, `tipo_rh`, `acudiente`, `telefonoa`, `celulara`, `eps`, `arl`, `emailc`) VALUES
(1183, '1116280158', 'MARIO', 'ALEXANDER', 'PRIETO', 'VASQUEZ', 'CRA 27 20-34 TOMAS URIBE', '3173262254', '1998-09-07', 'Union libre', 'A+', 'ORLANDO HENAO', '3173678956', '', 'NUEVA EPS', '', 'prietoalexander182@gmail.com'),
(1184, '16348816', 'ELIAS', '', 'GIL', 'RODRIGUEZ', 'CALLE 13B 23-18', '3153920946', '1957-04-03', 'Union libre', 'A+', 'DIANA CASTRILLON', '3127683084', '', '', '', ''),
(1185, '16368605', 'UBERNEY', '-', 'LOPEZ', 'GUTIERREZ', 'K 27 35-63', '3214695688', '1970-01-14', 'Casado', 'O+', 'DIANA CASTRILLON', '-', '3127683084', 'MEDIMAS', '-', NULL),
(1186, '1116724014', 'edwin', 'alexis', 'holguin', 'betancur', 'clle 26C 12-03', '3165412201', '1989-08-12', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '3173678956', 'nueva eps', '-', NULL),
(1188, '79991631', 'DIEGO', 'FERNANDO', 'ARANA', 'ARDILA', 'BOSQUES MANZ 44 CASA 22', '3143860028', '1979-04-17', 'soltero', 'O-', 'ORLANDO HENAO', '3173678956', '', 'EMSANAR', '', ''),
(1189, '6497889', 'WILMER', 'ARTURO', 'RIOS', 'PERLAZA', 'CRA 36 32-35', '3183070819', '1978-07-26', 'Union libre', 'O+', 'DIANA CASTRILLON', '3127683084', '', 'EMSSANAR', '', 'riosmaximiliano45@gmail.com'),
(1190, '1116268968', 'BRAYAN', 'STIVEN', 'BRAVO', 'ARIAS', 'CRA 3B 24-23 PORTALES DEL RIO', '3185657349', '1995-02-07', 'soltero', 'O+', 'DIANA CASTRILLON', '3127683084', '', 'S.O.S', '', 'zurdo1510@hotmail.com'),
(1191, '94289436', 'JOHN', 'JAIRO', 'ARIAS', 'FRANCO', 'CALLE 24 2-40', '3156762628', '1985-11-10', 'soltero', 'O+', 'DIANA CASTRILLON', '3127683084', '', 'EMSSANAR', '', ''),
(1192, '1116724016', 'EDWIN', 'ALBERTO', 'RODRIGUEZ', 'OSPINA', 'CALLE 26E 16-15 LA ESPERANZA', '3127123775', '1989-12-28', 'Union libre', 'O+', 'ORLANDO HENAO', '3173678956', '', 'MEDIMAS', '', 'ospinakevin44@gmail.com'),
(1194, '6496472', 'FABIO', '', 'VELASQUEZ', 'LONDOÃ‘O', 'CALLE 25A 38-29', '3132007245', '1947-06-30', 'Casado', 'A-', 'DIANA CASTRILLON', '3127683084', '', 'EMSSANAR', '', ''),
(1195, '14801358', 'LEYDER', '-', 'ENRIQUEZ', 'BEDOYA', 'CALLE 23 15 62 ', '3126738516', '1983-01-20', 'Union libre', 'A+', 'ORLANDO HENAO', '-', '3173678956', 'EMMSANAR', 'NINGUNO', NULL),
(1196, '94256989', 'EDGAR', 'FERNANDO', 'BEDOYA', 'YEPES', 'CALLE 28 35-34', '3157449984', '1977-03-15', 'soltero', 'O+', 'DIANA CASTRILLON', '3127683084', '', 'MEDIMASS', '', ''),
(1197, '14799196', 'JESUS', 'ANTONIO', 'CASTRILLON', 'HENAO', 'MZ X C 6 PARAISO', '3136924448', '1984-04-19', 'Casado', 'O-', 'DIANA CASTRILLON', '-', '3127683084', 'MEDIMAS', '-', NULL),
(1198, '1006461577', 'LUIS', 'EDUARDO', 'GIRALDO', 'MARIN', 'MANZANA E CASA 16', '3156607134', '2000-10-17', 'Union libre', 'O+', 'ORLANDO HENAO', '', '3173678956', 'MEDIMAS', 'R-4 BOLIVAR', ''),
(1200, '16369081', 'HAROLD ALBERTO', NULL, 'IBARGUEN MORENO', NULL, 'CALLE 25B 2-21', '3234735807', '1965-12-17', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(1201, '16354191', 'MIGUEL ANGEL ', NULL, 'BAENA VILLADA', NULL, 'CALLE 25A 11A-15', '3148733543', '1960-07-21', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(1202, '6429051', 'MIGUEL', 'DE JESUS', 'OSORIO', 'VASQUEZ', 'CLLE 25-1629', '3108912099', '1971-08-28', 'Casado', 'O+', 'DIANA CASTRILLON', '-', '3127683084', 'SALUD TOTAL', '-', NULL),
(1203, '6468701', 'CARLOS ', 'ARIEL ', 'PATIÃ‘O', 'PEÃ‘UELA', 'CALLE 24 CRA 9 ESQUINA', '3502983936', '1958-04-20', 'soltero', 'O-', 'ORLANDO HENAO', '3173678956', '3173678956', 'NUEVA EPS', 'NINGUNO', ''),
(1204, '94320522', 'EDISON', '', 'CASTAÃ‘EDA', 'GAMBOA', 'BLOQUES DE SAN LUIS 8B APTO 202', '3225390761', '1974-09-30', 'soltero', 'B+', 'ORLANDO HENAO', '', '3173678956', 'EMSSANAR', '-', ''),
(1205, '94281910', 'MARCOS', 'FIDEL', 'ORREGO', 'RAMIREZ', 'TV 28 C 4', '3182006862', '1969-11-23', 'Union libre', 'O+', 'DIANA CASTRILLON', '-', '3127683084', 'MEDIMAS', 'SURA', NULL),
(1206, '1033785851', 'JOSE', 'DAVID', 'RODRIGUEZ', 'LOPEZ', 'KRA-21-2613', '3016386607', '1996-03-08', 'Union libre', 'A+', 'ORLANDO HENAO', '3173678956', '3173678956', 'S.O.S', '-', NULL),
(1207, '16347751', 'RICAURTE', 'HIGINIO', 'ECHEVERRY', 'HENAO', 'MANZ 9 CASA 40 BOSQUES', '3505429316', '1956-04-19', 'soltero', 'A+', 'DIANA CASTRILLON', '3127683084', '', 'NUEVA EPS', '', ''),
(1208, '1112299562', 'LUIS', 'EVELIO', 'ZAPATA', 'VASQUEZ', 'CARRERA 2 20 49', '3217322609', '1988-06-28', 'Casado', 'O+', 'DIANA CASTRILLON', '3127683084', '3127683084', 'S.O.S', 'SURA', NULL),
(1209, '6499839', 'MANUEL', 'ANDRES', 'RAMIREZ', 'OSSA', 'CRA 24A 14-12 MARACAIBO', '3218101454', '1979-09-03', 'soltero', 'B+', 'ORLANDO HENAO', '', '3173678956', 'EMSSANAR', 'R-4 BOLIVAR', 'milena27_158@hotmail.com'),
(1211, '16361702', 'JULIO', 'MARIO', 'SUELTO', 'PEREA', 'CRA 36 29-26', '2247240', '1965-07-20', 'soltero', 'B+', 'ORLANDO HENAO ', '-', '3173678956', 'COLSANITAS', 'SURA', ''),
(1212, '14801112', 'DARWIN', 'ALONSO', 'ARROYO', 'BLANDON', 'K 2 a 20-24', '3165705056', '1985-04-30', 'Union libre', 'A+', 'ORLANDO HENAO', '-', '3173678956', 'COOMEVA', '-', ''),
(1213, '16367424', 'JAMES', '', 'LASSO', 'CASTRO', 'LA IBERIA ', '3153075246', '1969-01-05', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '', 'MEDIMAS', '', ''),
(1214, '16233595', 'JOHN', '', 'ARISTIZABAL', 'HERRERA', 'CALE--33-20-29', '3137240774', '1977-11-19', 'Union libre', 'A+', 'ORLANDO HENAO', '', '3173678956', 'SANITAS', 'NINGUNA', 'john.1199256@gmail.com'),
(1215, '6505958', 'HECTOR', 'DARIO', 'CRUZ', 'POSSO', 'KRA- 38 A-14-33', '3122058279', '1963-08-07', 'Casado', 'A+', 'DIANA CASTRILLON', '3127683084', '3127683084', 'S-O-S.', 'NINGUNA', NULL),
(1216, '16363336', 'JAMES', '', 'QUINTERO', 'CUERVO', 'MANZ 25 CASA 26 BOSQUES', '3205463254', '1966-01-06', 'soltero', 'O-', 'ORLANDO HENAO', '', '3173678956', 'EMSSANAR', '', ''),
(1217, '94390710', 'OMAR', 'EFREN', 'LOTERO', 'BELLO', 'CALLEJON CORINTO 31-55', '3122980151', '1975-11-06', 'soltero', 'A+', 'DIANA CASTRILLON', '3127683084', '', 'EMSSANAR', '', ''),
(1218, '8276198', 'HECTOR', 'FABIO', 'RUIZ', 'PARRA', 'CALLE 14 22B -03', '3154334825', '1947-07-06', 'soltero', 'O+', 'ORLANDO HENAO', '-', '3173678956', 'MEDIMAS', '', ''),
(1219, '1116234954', 'ALFONSO', '', 'SUAREZ', 'SANCHEZ', 'CRA 3 OESTE 23-30', '3196645054', '1986-09-30', 'soltero', 'O+', 'DIANA CASTRILLON', '3127683084', '', 'NUEVA EPS', '', ''),
(1220, '16366700', 'VICTOR', '', 'QUINTERO', 'CUERVO', 'CALLEJON DIAMANTE AGUACLARA LA ELIS', '3165131875', '1968-02-03', 'Casado', 'A+', 'ORLANDO HENAO', '', '3173678956', 'MEDIMAS', 'R-4 BOLIVAR', ''),
(1221, '38797197', 'MAYERLY ', 'PAOLA', 'PEREZ', 'GARCIA', 'CALLE 6 22 B 25 ', '3113820177', '2000-12-12', 'soltero', 'A+', 'DIANA CASTRILLON', '3127683084', '3127683084', 'COLSANITAS', 'equidad', NULL),
(1223, '94367256', 'JOSE', 'EVELIO', 'NOREÃ‘A', 'CARDONA', 'CALLE 31A 18-104', '3152704308', '1972-10-13', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '', 'EMSANAR', '', ''),
(1225, '79279934', 'RUBEN', 'DARIO', 'GIRALDO', 'PEREZ', 'CRA 22B 15-73', '3117094792', '1963-04-13', 'soltero', 'A+', 'ORLANDO HENAO', '3173678956', '', 'ASMET SALUD', '', ''),
(1226, '10081500', 'JAIRO', NULL, 'RODAS OROZCO', NULL, 'CRA 1A OESTE 22-29', '3207628185-2302876', '1953-11-18', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(1227, '79693305', 'LUIS', 'MAURICIO', 'FIGUEROA', 'GOMEZ', 'CRA 7A 3A-34', '3186417317', '1975-06-27', 'Union libre', 'O+', 'ORLANDO HENAO', '3173678956', '', 'S.O.S', '', ''),
(1228, '1007726013', 'CARLOS', 'YAIR', 'SOTO', 'VANEGAS', 'CALLE 25B 2-21', '3054885947', '1998-10-20', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '', 'EMSANAR', '', ''),
(1229, '94365136', 'MANUEL', 'DE JESUS', 'BECERRA', 'GUTIERREZ', 'CALLE 31A 18-86', '3185937950', '1971-05-27', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '', 'COOMEVA', '', ''),
(1230, '94152844', 'JORGE', 'HERNAN', 'JARAMILLO', 'ECHEVERRY', 'CALLE 22 19-19', '3183929680', '1980-07-26', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '', 'EMSANAR', '', ''),
(1232, '1112101662', 'CRISTHIAN', 'FERNANDO', 'AGUDELO', 'AGUIRRE', 'CALLE 26C2 2OESTE-28', '3187932785', '1990-02-18', 'Union libre', 'A+', 'ORLANDO HENAO', '3173678956', '', 'S.O.S', '', ''),
(1233, '16348902', 'LUIS', 'CARLOS', 'HENAO', 'JIMENEZ', 'CRA 34 36-37', '3137117174', '1956-07-17', 'soltero', 'B+', 'ORLANDO HENAO', '3173678956', '', 'MEDIMAS', '', ''),
(1234, '522912', 'YOSUNEY', '', 'MARTINEZ', 'PERALTA', 'CALLE 38B 20A-40', '3184880980', '1979-04-15', 'soltero', 'A+', 'ORLANDO HENAO', '3173678956', '', 'S.O.S', '', ''),
(1235, '6212521', 'HERNANDO', '-', 'ARIAS', 'RAMIREZ', 'C 32a 18 a-20', '3127082344', '1961-01-23', 'Union libre', 'O+', 'ORLANDO HENAO', '-', '3173678956', 'MEDIMAS', '-', NULL),
(1236, '94153525', 'DIEGO ', 'EDILSON', 'GONZALEZ', 'CORTES', 'CALLE 6 22C-64', '3158686807', '1981-04-09', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '', 'EMSANAR', '', ''),
(1238, '94366174', 'LUIS ', 'RIGOBERTO', 'PEREZ', 'PEREZ', 'CLL 38B 22A- 40', '3184880980', '0000-00-00', 'Casado', 'B+', 'ORLANDO HENAO', '3173678956', '3173678956', '-', '-', NULL),
(1239, '9760997', 'NESTOR', 'JULIO', 'MAYA', 'GUAPACHA', 'C 27 18 a-38', '3127134933', '1963-06-23', 'Union libre', 'O+', 'ORLANDO HENAO', '-', '3173678956', 'EMSSANAR', 'SURA', NULL),
(1240, '6497805', 'JOSE', 'HERNANDO', 'URREA', 'JARAMILLO', 'CALLEJON SAN ANTONIO 30-51', '3232079588', '1978-11-12', 'Union libre', 'A+', 'ORLANDO HENAO', '3173678956', '', 'EMSANAR', 'NINGUNO', 'nandourrea12@gmail.com'),
(1241, '10197548', 'MANUEL', 'OBAIDO', 'GOMEZ', 'GOMEZ', 'CRA 19 33-58', '3156774255//3013172046', '1962-12-03', 'Casado', 'O+', 'ORLANDO HENAO', '-', '3173678956', 'EMSSANAR', '-', NULL),
(1242, '16368204', 'MARIO', '', 'PARRA', 'PIEDRAHITA', 'CALLE 19 1-88', '3164100417', '1969-10-05', 'soltero', 'AB+', 'ORLANDO HENAO', '3173678956', '3173678956', 'MEDIMAX', '-', NULL),
(1244, '94369199', 'FRANCISCO', 'JAVIER', 'OCAMPO', 'JIMENEZ', 'CALLE 12 B 27 C 51', '3168643812', '1973-10-27', 'Union libre', 'O+', 'ORLANDO HENAO', '', '3173678956', 'MEDIMAS', 'R-4 BOLIVAR', 'ocampof939@gmail.com'),
(1245, '1114787256', 'GUSTAVO ', 'DE JESUS', 'SANCHEZ', 'MORENO', 'CALLE 17 1 A 88', '3197937749', '0000-00-00', 'soltero', 'O+', 'ORLANDO HENAO', '----', '3173678956', 'MEDIMAX', 'SURA', NULL),
(1246, '71710894', 'MARTIN', 'EMILIO', 'TANGARIFE', 'TABARES', 'CALLE 23 1AW-33', '3105085487', '1969-08-24', 'Casado', 'A+', 'ORLANDO HENAO', '-', '3173678956', 'COOMEVA', '', ''),
(1247, '16346697', 'CARLOS', 'AGUSTIN', 'ESPAÃ‘A', 'MOSQUERA', 'C 22 30-36', '3147498204', '1954-08-12', 'Union libre', 'A+', 'ORLANDO HENAO', '-', '3173678956', 'ASMETSALUD', '-', NULL),
(1248, '1116263078', 'MIGUEL', 'ANGEL', 'CUADRADO', 'BERNAL', 'KRA 6-23-25', '3217466625', '0000-00-00', 'soltero', 'O-', 'ORLANDO HENAO', '3173678956', '3173678956', 'ENSANAR', 'NINGUNA', NULL),
(1249, '1116273203', 'HECTOR ', 'FABIAN', 'CASTILLO', 'LAMUS', 'MAN-21-15', '3126066008', '0000-00-00', 'soltero', 'O-', 'ORLANDO HENAO', '3173678956', '3173678965', 'ENSANAR', 'NINGUNA', NULL),
(1250, '16346896', 'FREDY', '-', 'PEREZ', 'VALLEJO', 'CRA 1W- 26C2-22', '3184393823', '1954-08-27', 'Separado', 'A+', 'ORLANDO HENAO', '3173678956', '3173678956', 'EMSSANAR', '-', ''),
(1251, '6462730', 'etelberto', '-', 'sanchez', 'montoya', 'kra 10-25-c 09', '3053197603', '0000-00-00', 'Casado', 'O+', 'orlando henao', '3173678956', '3173678956', 'ponal', 'ninguna', NULL),
(1252, '94522709', 'LUIS', 'FERNANDO', 'ROBLES', 'CHAVEZ', 'CALLEJON SAN ANTONIO', '3164934534', '1978-08-01', 'Casado', 'O+', 'ORLANDO HENAO', '-', '3173678956', 'PONAL', '-', NULL),
(1253, '1114061075', 'JOHN', 'FREDY', 'MOSQUERA', 'CAICEDO', 'CLL 9- 546', '3166308127', '1991-05-27', 'Union libre', 'O+', 'ORLANDO HENAO', '3173678956', '3173678956', 'MEDIMAX', '-', NULL),
(1254, '16320051', 'ALFREDO', '-', 'BENITEZ', 'PLAZA', '27-04  AGUACLARA', '3172708962', '1962-06-20', 'Union libre', 'O+', 'ORLANDO HENAO', '-', '3173678956', 'MEDIMAS', '-', NULL),
(1255, '16496938', 'JHON', 'JAIRO', 'GOMEZ', 'HENAO', 'C 25a 1  8-23', '3186024124', '1971-02-17', 'Union libre', 'A+', 'ORLANDO HENAO', '-', '3173678956', 'EMSSANAR', '-', NULL),
(1256, '94355754', 'HAROLD', '', 'ANACONA', 'TABORDA', 'CRA 17 26-40 DELICIAS', '3184581593', '1972-07-22', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '', 'EMSANAR', '', NULL),
(1257, '94394947', 'DIEGO', 'FERNANDO', 'LOPEZ', 'VELASQUEZ', 'K 28a 3  4-366', '3188744885', '1978-03-04', 'Casado', 'A+', 'ORLANDO HENAO', '-', '3173678956', 'S.O.S', 'POSITIVA', NULL),
(1258, '14795603', 'JULIAN', 'ANDRES', 'ARANGO', 'LOPEZ', 'KRA 1 A- 11-66', '3113595154', '0000-00-00', 'soltero', 'A+', 'ORLANDO HENAO', '3173678956', '3173678956', 'SANITAS', 'SURA', NULL),
(1259, '1116243973', 'STIVEN', '-', 'HERNANDEZ', '-', 'TRASV 12- 6A-28', '3164472540', '1989-05-26', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '3173678956', 'SOS', 'PORVENIR', NULL),
(1260, '1112298580', 'ROBINSON', 'ARLEY', 'LOPEZ', 'CALLEJAS', 'CLL 26D-14-31', '3008682149', '1985-06-02', 'Union libre', 'A+', 'ORLANDO HENAO', '', '3173678956', 'COOMEVA', 'R-4  ', ''),
(1261, '1094980226', 'JAVIER', 'ALIRIO', 'GAMEZ', 'RAMOS', 'CALLE 25 8-37', '3213980535', '1985-04-06', 'Casado', 'O+', 'ORLANDO HENAO', '3173678956', '', 'EMSANAR', '', ''),
(1262, '19187097', 'JUAN ', 'DAVID', 'CELY', 'URUEÃ‘A', 'TRANSV. 7A DIAGONAL 21A-27', '3167488111', '1952-12-31', 'soltero', 'O+', 'ORLANDO HENAO', '', '3173678956', 'EMSANAR', '', ''),
(1263, '94391954', 'GUSTAVO', 'ANTONIO', 'CARDONA ', 'PEREZ', 'CALLE 5 22B-04', '3175671973', '1976-05-06', 'Union libre', 'O+', 'ORLANDO HENAO', '3173678956', '', 'EMSANAR', '', ''),
(1264, '6200065', 'DIEGO', 'FERNANDO', 'GIRALDO', 'VILLEGAS', 'AV PRINCIPAL 26-a 65', '3136554852', '1982-09-21', 'Separado', 'O+', 'ORLANDO HENAO', '-', '3173678956', 'S O S', '-', NULL),
(1265, '14886230', 'JOSE', 'ANA', 'CREONTE NOGUERA', 'NARVAEZ', 'CALLE 2933-32', '3117325295', '1964-02-25', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '', '', '', NULL),
(1266, '16348467', 'LISIMACO', '', 'VALDERRAMA', 'PANESSO', 'CRA 22 32-02', '3168059598', '1954-08-13', 'soltero', 'B+', 'ORLANDO HENAO', '', '3173678956', 'NUEVA EPS', '', ''),
(1267, '16341802', 'JOSE FORNES', 'HEBER', 'MARIN', 'MOLINA', 'CALLE 5 20-27', '3158921170', '1949-05-25', 'soltero', 'O+', 'ORLANDO HENAO', '', '3173678956', 'EMSANAR', '', ''),
(1268, '16356679', 'HECTOR', 'FREDDY', 'RESTREPO', 'LOPEZ', 'CALLE 39 A 24-19', '3176777270', '1962-02-22', 'soltero', 'O+', 'ORLANDO HENAO', '', '3173678956', 'MEDIMAS', '', ''),
(1269, '6497332', 'MARCO', 'AURELIO', 'BERMUDEZ', 'VICTORIA', 'CRA 23A-5A46', '3146322619', '1959-12-27', 'Casado', 'O+', 'ORLANDO HENAO', '3173678956', '3173678956', 'MEDIMAX', 'POSITIVA', NULL),
(1270, '14802361', 'VICTOR', 'ALFONSO', 'LOPEZ', 'MARIN', 'K 9 9a -63', '3184707631', '1985-10-22', 'soltero', 'O+', 'ORLANDO HENAO', '-', '3173678956', 'NUEVA EPS', 'POSITIVA', NULL),
(1271, '16362897', 'sigifredo', 'antonio', 'valencia', 'lopez', 'cle.38-27-142', '3174950558', '0000-00-00', 'soltero', 'O-', 'orlando henao', '3173678956', '3173678956', 'proensanar', '-', NULL),
(1272, '163361387', 'NOLBERTO', '-', 'ARANDA', '-', 'TRAV-12-26B1-10', '3104912851', '0000-00-00', 'soltero', 'A+', 'ORLANDO HENAO', '3173678956', '3173678956', 'ENSANAR', '-', NULL),
(1274, '1113038296', 'ALVARO ', '', 'PEREZ ', 'SERNA', 'AV 27 64', '3186296270', '1989-09-19', 'Union libre', 'B+', 'ORLANDO HENAO', '3173678956', '3173678956', 'NUEVA EPS', 'NINGUNA', NULL),
(1275, '94357364', 'JULIAN', '-', 'GALLON', 'GARCIA', 'DELIRIO 28-B-234', '3166023473', '0000-00-00', 'soltero', 'A+', 'ORLANDO HENAO', '3173678956', '3173678956', 'ENSANAR', '-', NULL),
(1276, '94395648', 'DANY', 'ALEJANDRO', 'LONDOÃ‘O', 'TELLO', 'CLL 11B-27C 20', '3154474121', '1978-07-17', 'Casado', 'A+', 'ORLANDO HENAO', '3173678956', '3173678956', 'EMSSANAR ', '-', NULL),
(1277, '1116263897', 'julian', 'andres', 'trujillo', 'sanchez', 'kra 25-16-34-', '3185880268', '0000-00-00', 'soltero', 'O+', 'orlando  henao', '3173678956', '3173678956', 'sanitas', '-', NULL),
(1278, '16219831', 'JOSE', 'IGNACIO', 'VILLAMIL', 'RESTREPO', 'MZ 54 CS 29', '3168749019', '1966-06-25', 'Union libre', 'O+', 'ORLANDO HENAO', '----------', '3173678956', 'S.O.S', 'COLPATRIA', NULL),
(1279, '1116241259', 'LUIS', 'ANDRES', 'PUERTAS', '-', ' CLL  9 22-103', '3172751237', '1988-07-05', 'soltero', 'O+', 'ORLANDO HENAO', '-', '3173678956', 'MEDIDAS', '-', NULL),
(1280, '1112100895', 'JHON', 'JAIRO', 'VALDERRAMA', 'OSORIO', 'C 23 a 16-40', '2303826', '1989-07-03', 'Union libre', 'AB+', 'ORLANDO HENAO', '-', '3173678956', 'NUEVA EPS', 'SURA', NULL),
(1281, '16362964', 'jose', 'alberto', 'zapata', 'castro', 'c-8-17-39', '3185828370', '0000-00-00', 'Union libre', 'O-', 'ORLANDO HENAO', '3173678956', '3173678956', 'EMSANAR', 'NINGUNA', NULL),
(1282, '94386379', 'HERNANDO', '-', 'LEON', 'TORRES', 'C-5-B-16-81', '3173628277', '0000-00-00', 'Union libre', 'O+', 'OELANDO HENAO', '3173678956', '3173678956', 'ENSANAR', 'NINGUNA', NULL),
(1283, '16363886', 'LUIS', 'EDUARDO', 'LONDOÃ‘O', 'SALAZAR', 'DIAMANTE 31-22', '3134487242', '1966-12-13', 'Casado', 'O+', 'ORLANDO HENAO', '-----', '3173678956', 'S.O.S', 'NINGUNA', NULL),
(1284, '1116273074', 'CEIR', '-', 'MARTINEZ', 'LOPEZ', 'K 28 a 1  11-19', '3184716456', '1996-10-04', 'soltero', 'A+', 'ORLANDO HENAO', '-', '3173678956', 'SANITAS', 'EQUIDAD', NULL),
(1285, '94151927', 'HECTOR', 'FABIO', 'CASTAÃ‘EDA', '----', 'CALLE 4 B 19-62', '3173302409', '1979-11-07', 'Union libre', 'A+', 'ORLANDO HENAO', '-----', '3173678956', 'COOMEVA', '----', NULL),
(1286, '16353649', 'ANCIZAR', '', 'OSPINA', 'VERA', 'CRA13-2649', '3137474263', '1959-11-22', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '3173678956', 'MEDIMAS', '', ''),
(1287, '94394070', 'JORGE', 'ENRIQUE', 'VALENCIA', 'CARDONA', 'CALLE 42 33-10', '3128896903', '1977-07-23', 'Union libre', 'A+', 'ORLANDO HENAO', '3173678956', '3173678956', 'COOMEVA', 'R-4 SURA', 'jorgeenriquevalencia6@gmail.com'),
(1288, '98522773', 'CARLOS', 'GIOVANNI', 'RESTREPO', 'GALEANO', 'CLL 43- 25-91', '3158887233', '1968-04-01', 'Union libre', 'O+', 'ORLANDO HENAO', '3173678956', '3173678956', 'COOMEVA ', '-', NULL),
(1289, '16363997', 'GERMAN', '-', 'GONZALES ', 'CARDONA', 'CALLE 34 30-18', '318-280-4504', '0000-00-00', 'soltero', 'AB+', 'ORLANDO HENAO ', '3173678956', '3173678956', 'MEDIMAS', '-', NULL),
(1290, '1115065648', 'HECTOR', 'FABIO', 'GIL', 'GARCIA', 'K 25 20-62', '3177759645', '1986-08-25', 'Union libre', 'O+', 'ORLANDO HENAO', '-', '3173678956', 'S O S', '-', NULL),
(1291, '14795584', 'ROBINSON ', '', 'BUITRAGO', 'QUINTERO', 'CALLE 30 41 18', '3164416214', '1982-07-16', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '3173678956', 'ASMESALUD', 'NINGUNA', NULL),
(1292, '11797866', 'LEOVIL', '-', 'QUINTO', 'MOSQUERA', 'CLL 25A-816', '3222324758', '1970-07-22', 'Casado', 'O+', 'ORLANDO HENAO', '3173678956', '3173678956', 'ASMED SALUD', '-', NULL),
(1293, '11116278524', 'ANDERSON', '', 'OLAYA', 'FLOREZ', 'CARRERA 25 12B 22', '3226499211', '1998-03-18', 'soltero', 'O-', 'ORLANDO HENAO', '3173678956', '3173678956', 'EMSSANAR', 'NINGUNA', NULL),
(1294, '14796494', 'JORGE ', 'ELIECER', 'DIAZ', 'AGUIRRE', 'CRA 11A-25A-13', '3013876769', '1982-12-17', 'Casado', 'O+', 'ORLANDO HENAO', '3173678956', '3173678956', 'SANITAS', 'SURA ', NULL),
(1295, '16362357', 'SIGIFREDO', '', 'BARCO', 'RAMIREZ', 'DELICIAS DEL CAMPO 32-15', '3177073603', '1963-03-21', 'Separado', 'O+', 'ORLANDO HENAO', '', '3173678956', 'EMSSANAR ', '', ''),
(1296, '1116268596', 'GUSTAVO', 'ADOLFO', 'MARIN', 'ACEVEDO', 'CARRERA 30 OS 14 30 3031', '3154883424', '1995-08-01', 'Union libre', 'O+', 'ORLANDO HENAO', '', '3173678956', 'SANITAS', 'R-4 BOLIVAR', 'dianitac2517@hotmail.com'),
(1297, '1116261658', 'HECTOR', 'FABIO', 'CASTRO', 'VASQUEZ', 'M 53  C 25', '3046441543', '1994-01-24', 'soltero', 'O+', 'ORLANDO HENAO', '', '3173678956', 'NUEVA EPS', 'R-4 SURA', ''),
(1298, '34369071', 'ALVARO', '', 'HURTADO', 'SANCHEZ', 'CALLE 24 13 04', '3014665124', '1974-01-16', 'soltero', 'O-', 'ORLANDO HENAO', '3173678956', '3173678956', 'COOMEVA', 'POSITIVA', NULL),
(1299, '94369071', 'ALVARO', ' ', 'HURTADO ', 'SANCHEZ', 'CALLE 24 13 04', '3014665124', '1974-01-16', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '3173678956', 'COOMEVA', 'POSITIVA', NULL),
(1300, '94390149', 'FERNELY', '', 'CARDONA ', 'GUARIN', 'CALLE 5 8 21', '3186658769', '1973-01-03', 'Casado', 'A+', 'ORLANDO HENAO', '3173678956', '3173678956', 'NUEVA EPS', 'SURA', NULL),
(1301, '91473213', 'JUAN ', 'CARLOS', 'COTE', 'GARCIA', 'MZ A CS 2-MANA', '3053841793', '1974-11-20', 'Casado', 'O+', 'ORLANDO HENAO', '---', '3173678956', 'PONAL', '---', NULL),
(1302, '94152440', 'OLMEDO', '', 'SEPULVEDA', 'BERMUDES', 'K50 14--B 52', '3148769121', '1981-02-01', 'Casado', 'O+', 'ORLANDO HENAO', '', '3173678956', 'S.O.S', '', ''),
(1303, '14796668', 'ISAAC', '', 'SEPULVEDA', 'ARENAS', 'CALLE 41 34-38', '2347980', '1983-02-25', 'soltero', 'O-', 'ORLANDO HENAO', '3173678956', '3176715779', 'ENSANAR', '', 'isa25sepulveda@gmail.com'),
(1305, '9870176', 'CARLOS', 'ANDRES', 'GIRALDO', 'ALVAREZ', 'DG  22 TV 7 A  -03', '31577474444', '1960-12-10', 'soltero', 'O+', 'ORLANDO HENAO', '-', '3173678956', 'ENSSANAR', '-', NULL),
(1306, '6430291', 'RICARDO ', 'ANDRES ', 'CAMACHO', 'ZAPATA', 'CARRERA9O 25 36', '3104554656', '1985-01-28', 'Union libre', 'A+', 'ORLANDO HENAO', '3173678956', '3173678956', 'EMSSANAR', 'NINGUNO', NULL),
(1307, '1116248520', 'JABER', 'ANDRES ', 'LONDONO', 'GORDILLO', 'CALLE 40C 27A16', '3184629774', '1990-09-30', 'soltero', 'B+', 'ORLANDO HENAO', '3113678956', '2347980', 'SOS', 'rR-4 COLMENA', 'jaber.londono@correounivalle.edu.co'),
(1309, '1116250831', 'ANDRES', 'FELIPE', 'HERNANDEZ', 'HERNANDEZ', 'K 48 13-27', '3154524619', '1991-05-14', 'soltero', 'O+', 'ORLANDO HENAO', '-', '3173678956', 'COOMEVA', 'SURA', NULL),
(1310, '6198893', 'JOSE', 'WILSON', 'HERNANDEZ', 'MUÃ‘OZ', 'KRA 15 23-12', '3156789603', '1974-03-31', 'Separado', 'O+', 'ORLANDO HENAO', '-', '3173678956', 'S.O.S', '-', NULL),
(1311, '6457006', 'JAVIER', '-', 'CORREA', 'CARDONA', 'K 27 A 34-69', '3164489680', '1953-04-18', 'soltero', 'O+', 'ORLANDO HENAO', '-', '3173678956', 'ENSSANAR', '-', NULL),
(1312, '94459394', 'RICARDO', '', 'GUTIERREZ ', 'BEDOYA', 'PASAJE 13  23 35', '3146194766', '1974-10-22', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '3173678956', 'SANITAS', 'NINGUNA', NULL),
(1313, '94388102', 'WUILMER', '-', 'GALVIS', 'HERRERA', 'C-36-18-39', '3178725677', '1974-04-10', 'Union libre', 'O+', 'ORLANDO HENAO ', '3173678956', '3173678956', 'MESIMAX', '-', NULL),
(1314, '16349333', 'ALVARO', 'HUMBERTO', 'CAMACHO', 'MERA', 'CALLE 13B 38D95', '3006266630', '1956-01-21', 'soltero', 'O+', 'ORLANDO HENAO', '', '3173678956', '', '', 'alvarocamachomera@hotmail.com'),
(1315, '6197639', 'JOSELITO', '', 'VELEZ', 'TORRES', 'DIAG 23 9-58', '3177283528', '1965-01-17', 'Casado', 'O+', 'ORLANDO HENAO', '', '3173678956', 'NUEVA EPS', 'NINGUNO', ''),
(1316, '94390796', 'LUIS', 'ANDRES', 'FUQUENE', 'RAMIREZ', 'CALLE 25 A 3-42', '3182024895', '1974-07-24', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '3173678956', 'SISBEN', 'NINGUNO', NULL),
(1317, '6428564', 'JHON', 'JAIRO', 'AGUIRRE', 'GRAJALES', 'CALLE 6 A 17-82', '3126692786', '1974-02-25', 'Union libre', 'O+', 'ORLANDO HENAO', '-', '3173678956', 'MEDIMAS', 'NINGUNO', NULL),
(1318, '1113781125', 'JULIAN', 'ALBERTO', 'CORRALES', 'SERNA', 'DG 21 A TRV 10-24', '3174047226', '1988-01-08', 'Union libre', 'O+', 'ORLANDO HENAO', '-', '3173678956', 'NINGUNA', 'NINGUNA', NULL),
(1319, '14796177', 'RONALD CRISTIAN', NULL, 'ORTEGON SANTANA', NULL, 'CALLE 7 25A-27', '3107276152', '1982-12-18', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(1320, '94475105', 'MIGUEL', 'ANGEL', 'RUEDA', 'RAVE', 'CALLE 18A 3-96', '3108321930', '1956-09-01', 'soltero', 'O-', 'ORLANDO HENAO', '', '3173678956', 'ASMET SALUD', 'NINGUNO', ''),
(1321, '80386131', 'EDWIN', '', 'VERJAN', 'CASTAÃ‘O', 'CALLE 11 28A-51', '3152334630', '1966-11-02', 'soltero', 'A+', 'ORLANDO HENAO', '', '3173678956', '', '', 'edwinverjan@yahoo.com'),
(1323, '94305845', 'ALEJANDRO', '', 'ACERO', 'LOPEZ', 'CALLE33 18-20', '3187340343', '1969-06-15', 'soltero', 'A+', 'ORLANDO HENAO', '3173678956', '3173678956', 'MEDIMAS', 'COLPATRIA', NULL),
(1324, '16224735', 'LUIS', 'DANIEL', 'ESCOBAR', 'MEDINA', 'C 40 34-58', '3016911641', '1970-10-21', 'Casado', 'A+', 'ORLANDO HENAO', '-', '3173678956', 'NUEVA EPS', '-', NULL),
(1325, '16359178', 'ROBINSON', '', 'CASTAÃ‘O', 'SERNA', 'CALLE 10 20-34', '3185597352', '1963-05-26', 'soltero', 'O+', 'ORLANDO HENAO', '', '3173678956', 'MEDIMAS', '', ''),
(1326, '6427444', 'ROBERTO', '', 'HURTADO', 'VALENCIA', 'CALLE 15 25-07', '3177001123', '1958-10-18', 'soltero', 'A+', 'ORLANDO HENAO', '', '3173678956', 'COSMITEC', 'NINGUNO', ''),
(1327, '16364529', 'LUIS', 'EDILSON', 'MALDONADO', 'MILLAN', 'K-18-P.22-17-36', '3185112885', '0000-00-00', 'soltero', 'O-', 'ORLANDO HENAO', '3173678956', '3173678956', 'EMMSANAR', '-', NULL),
(1328, '14360013', 'FABIAN', '', 'MARIN', 'RAMIREZ', 'CALLEJON PRIMAVERA 22-59 NARIÃ‘O', '3168820772', '1960-09-01', 'Casado', 'O-', 'ORLANDO HENAO', '', '3173678956', 'S.O.S', '', 'famara1960@hotmail.com'),
(1329, '6133362', 'JAIME', 'DE JESUS', 'GOMEZ', 'PALACIO', 'CALLE 31 17-22', '3162978159', '1957-03-01', 'Casado', 'O+', 'ORLANDO HENAO', '', '3173678956', 'COOMEVA', '', ''),
(1330, '16548327', 'ALVARO', 'JOSE', 'CASTAÃ‘EDA', 'LOPEZ', 'K 19 35-48', '3186790185', '1967-04-15', 'Casado', 'B+', 'ORLANDO HENAO', '-', '3173678956', 'ENSSANAR', '-', NULL),
(1331, '16343959', 'OMAR', '', 'OSPINA', 'TASCON', 'CALLE 26 C2 13-78', '3122631374', '1952-04-21', 'soltero', 'O+', 'ORLANDO HENAO', '', '3173678956', 'COLSANITAS', '', ''),
(1332, '94151460', 'GIOVANNI', '', 'OSPINA', 'OSPINA', 'CRA 18 20-49', '3118505765', '1980-07-24', 'soltero', 'O+', 'ORLANDO HENAO', '', '3173678956', 'PONAL', '', 'gios1980@hotmail.com'),
(1333, '66463666', 'JOHN', 'JAMES', 'RAMIREZ', 'PUERTAS', 'K-23-A--2-A-04', '3115684889', '0000-00-00', 'soltero', 'O+', 'ORLANDO HENAO', '3173678956', '3173678956', 'CONSALUD', 'POSITIVA', NULL),
(1334, '14798017', 'TULIO', 'ANDRES', 'BERMUEDZ', 'FRANCO', 'C-3-B-24-A-90', '3002324241', '0000-00-00', 'Union libre', 'O+', 'ORLANDO HENAO', '3173678956', '3173678956', 'SANITAS', 'POSITIVA', NULL),
(1335, '16365810', 'JESUS', 'HERVEY', 'BUENO', '-', 'C 4  A 20-68', '3155623703', '1967-12-25', 'Casado', 'A+', 'ORLANDO HENAO', '-', '3173678956', 'COOMEVA', '-', NULL),
(1336, '16344097', 'JESUS ANTONIO', NULL, 'GIRON VILLAFAÑE', NULL, 'CRA 18 A1 31-35 URB. LA HERRADURA', '3113084192', '1952-06-09', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(1337, '1116260860', 'JOHN ALEJANDRO', NULL, 'ACERO ALVIAR', NULL, 'CALLE 34 18-05 PROGRESAR', '3187340343', '1993-11-27', '', '', NULL, NULL, NULL, NULL, NULL, NULL),
(1338, '6202546', 'GILDARDO', '-', 'LOPEZ', 'MONTOYA', 'AGUA-AVEN-27-27', '3226655793', '0000-00-00', 'Casado', 'O+', 'ORLANDO HENAO', '3173678956', '3173678956', 'ENSANAR', '-', NULL),
(1339, '1114832401', 'YOJHAN', 'ESTIVEN', 'GARCIA', 'HERNANDEZ', 'CALLE 20 2A-09', '3156573086', '1992-12-01', 'soltero', 'O+', 'ORLANDO HENAO', '', '3173678956', 'NUEVA EPS', 'NINGUNO', '');

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
  `saldo` float NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `convenio`
--

CREATE TABLE `convenio` (
  `id_movil` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Disparadores `convenio`
--
DELIMITER $$
CREATE TRIGGER `reporte_conv` BEFORE INSERT ON `convenio` FOR EACH ROW begin
insert into `novedad_servicio` (`id_movil`, `operacion`, `estado`) values (new.`id_movil`,"Movil Habilitado",1);
end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `sale_conv` AFTER DELETE ON `convenio` FOR EACH ROW BEGIN 
      set @can_dias=(select  plazo_diarios from info_sistema);
set @cant_hab=(SELECT count(vehiculo.id_movil)  FROM vehiculo WHERE NOT ( id_movil IN (SELECT DISTINCT vehiculo.id_movil FROM vehiculo INNER JOIN veh_doc ON vehiculo.id_movil = veh_doc.id_movil WHERE (DATE_FORMAT( concat( fecha_ven, ' 11:59:59' ) , '%Y-%m-%d %H:%i' ) < DATE_FORMAT( now( ) , '%Y-%m-%d %H:%i' )) OR ADDDATE( DATE_FORMAT( concat( vehiculo.pago_hasta, ' 11:59:59' ) , '%Y-%m-%d %H:%i' ) , @can_dias ) < DATE_FORMAT( now( ) , '%Y-%m-%d %H:%i' ))) AND id_movil =old.id_movil);
set @cant_inhab=(SELECT count(vehiculo.id_movil) FROM vehiculo WHERE id_movil IN ( SELECT DISTINCT vehiculo.id_movil FROM vehiculo INNER JOIN veh_doc ON vehiculo.id_movil = veh_doc.id_movil WHERE ( DATE_FORMAT( concat( fecha_ven, ' 11:59:59' ) , '%Y-%m-%d %H:%i' ) < DATE_FORMAT( now( ) , '%Y-%m-%d %H:%i' ) ) OR ADDDATE( DATE_FORMAT( concat( vehiculo.pago_hasta, ' 11:59:59' ) , '%Y-%m-%d %H:%i' ) ,  @can_dias ) < DATE_FORMAT( now( ) , '%Y-%m-%d %H:%i' )) AND id_movil =old.id_movil);	  
	  if(@cant_hab>0) then 
	  insert into `novedad_servicio` (`id_movil`, `operacion`, `estado`) values (old.`id_movil`,"Movil Habilitado",1);
	  elseif (@cant_inhab>0) then 
	   insert into `novedad_servicio` (`id_movil`, `operacion`, `estado`) values (old.`id_movil`,"Movil Inhabilitado",1);
	   end if;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `con_doc`
--

CREATE TABLE `con_doc` (
  `id` int(5) NOT NULL,
  `id_conductor` int(10) DEFAULT NULL,
  `id_doc` varchar(5) DEFAULT NULL,
  `numero` varchar(25) DEFAULT NULL,
  `categoria` varchar(5) DEFAULT NULL,
  `id_eps` int(5) DEFAULT NULL,
  `fecha_ant` date DEFAULT '0000-00-00',
  `fecha_vence` date DEFAULT '0000-00-00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `motivo_anula` text,
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
  `documento` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `documento`
--

INSERT INTO `documento` (`id_doc`, `documento`) VALUES
('20', 'LICENCIA DE CONDUCCION');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documentos_v`
--

CREATE TABLE `documentos_v` (
  `id_docv` int(5) NOT NULL,
  `id_documento` varchar(2) NOT NULL,
  `descripcion` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(1, 'COOP. DE TRANSPORTADORES VILLA DE CESPEDES LTDA', '891.900.606-8', 'Calle 34 #35-05', '2316122', 'transargeliaycairo.jpg', 'TA', 0, 0, 'villadecespedes@hotmail.com');

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
-- Estructura de tabla para la tabla `frecuencia`
--

CREATE TABLE `frecuencia` (
  `id_movil` varchar(5) NOT NULL,
  `id_tarjeta` int(10) NOT NULL,
  `fecha` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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
(15, 'LIFAN', 15);

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
  `fecha_retiro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
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
  `control3` int(2) NOT NULL DEFAULT '0'
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

--
-- Volcado de datos para la tabla `otros_pagos`
--

INSERT INTO `otros_pagos` (`id_otros`, `codigo_concepto`, `detalle_concepto`, `tipo_con`, `campoadm`, `tipoc`) VALUES
(1, '1108-04', 'Aportes Sociales', 'hidden', 'adm', 'ap'),
(2, NULL, 'Frecuencia de Radio', 'show', NULL, NULL),
(3, '1110', 'Préstamos', 'show', NULL, NULL),
(4, '4101', 'Seguro Obligatorio', 'show', NULL, NULL),
(5, '4101', 'Ingresos', 'show', NULL, NULL),
(6, NULL, 'Fondos Sociales', 'show', NULL, NULL),
(7, '4104', 'Intereses de Mora', 'show', NULL, NULL),
(8, '2301', 'Depositos', 'show', NULL, NULL),
(9, NULL, 'Poliza de Responsabilidad Civil', 'show', NULL, NULL),
(10, NULL, 'Planillas', 'show', NULL, NULL),
(11, NULL, 'CxP Socios', 'show', NULL, NULL),
(12, '1108-03', 'Cuota Sostenimiento', 'hidden', 'adm', 'adm'),
(13, '', 'Descuento', 'hidden', 'admdes', NULL);

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
  `motivo_anula` text,
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
  `motivo_anula` text
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
  `liquidado` int(1) DEFAULT '0'
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
('10051185', 'CARLOS ALBERTO', 'HERNANDEZ GOMEZ', '', '1984-08-11', 'CRA 32 N° 31-39', '3226901470', 'TULUA', '', 'activo', '2002-09-09', 'no'),
('10081500', 'JAIRO', 'RODAS OROZCO', 'TULUA', '1953-11-18', 'CRA 1A OESTE 22-29', '3207628185-2302876', 'TULUA', '', 'activo', '1975-11-07', 'si'),
('1024499590', 'OSCAR EDUARDO', 'GIRALDO GIRALDO ', '', '1969-12-31', 'CALLE 13A 49A-45', '3234828460', 'TULUA', '', 'activo', '1969-12-31', 'no'),
('1024502988', 'YULIANA ANDREA', 'LONDOÑO GUTIERREZ', '', '1990-04-14', 'TRAV 20 4B05', '3175844838', 'TULUA', '', 'activo', '2008-04-21', 'no'),
('1032399103', 'LUIS ALBERTO', 'GALINDO GARCIA', 'TULUA', '1987-11-06', 'CALLE 13 49-50', '3122525278', 'TULUA', '', 'activo', '2005-11-08', 'si'),
('1057410232', 'CLAUDIA PATRICIA', 'MORENO VALLEJO', 'TULUÁ', '1986-04-22', 'CRA 18 N° 20-49', '3118085083', 'TULUÁ', '', 'activo', '2004-09-30', 'no'),
('1060650442', 'SINDY WILLIANA ', 'GARCIA RIVERA ', '', '1969-12-31', 'DIAGONAL 21A 20-40', '3173574960', 'TULUA', '', 'activo', '1969-12-31', 'no'),
('1069258319', 'WILMAR ERNEY', 'VALENZUELA ZAMORA', 'TULUA', '1988-02-26', 'URB. EL MANA MZ F CASA 4', '3103030845', 'TULUA', '', 'activo', '2006-08-02', 'si'),
('1112099110', 'MARTHA LILIANA', 'MAYORGA URIBE', 'TULUA', '1964-10-03', 'MZ 54 CASA 30', '3188710446', 'TULUA', '', 'activo', '1983-01-30', 'no'),
('1112102171', 'JOHANNA', 'FLOREZ ESPINOSA', 'TULUA', '1990-08-27', 'CALLE 38 30-23 FATIMA', '3105003155', 'TULUA', 'johannaflorezespinos@gmail.com', 'activo', '2008-09-01', 'no'),
('1112102563', 'JHONATAN MARTIN', 'VELANDIA', '', '1990-12-24', 'CALLE 20 No. 25-07', '3164961857', 'TULUA', '', 'activo', '2009-01-15', 'si'),
('1112103351', 'JOSE ABDON', 'VALENZUELA GONZALEZ', 'TULUA', '1991-07-29', 'CRA 28A 10-04', '3152957378', 'TULUA', '', 'activo', '2009-10-15', 'si'),
('1112301311', 'UBHEIMAR', 'MUÑOZ MILLAN', '', '1989-01-26', 'CRA 7 No. 20-34', '3146500582', 'TULUA', '', 'activo', '2010-04-06', 'si'),
('1112620592', 'JESSICA FERNANDA', 'OCHOA AGUIRRE', 'TULUA', '1988-02-12', 'CALLE 2C 16-17 PORTALES DE SAN FELIPE', '3152379715', 'TULUA', '', 'activo', '2006-04-10', 'no'),
('1113624220', 'YONADELYDER ADOLFO', 'ROMERO MADRI', '', '1986-07-19', 'MANZ 56  CASA 32', '3158063198', 'TULUA', '', 'activo', '2004-12-23', 'si'),
('1114061320', 'HECTOR ANDRES', 'GIRALDO BEDOYA', '', '1990-11-28', 'LA MARINA', '3182257430', 'TULUA', '', 'activo', '2009-11-25', 'no'),
('1114119656', 'EDWIN GIOVANNY', 'SERRANO IBAÑEZ', '', '1990-06-09', 'CALLE 8 No. 2-77', '3003980216', 'TULUA', '', 'activo', '2009-05-28', 'no'),
('1114209115', 'LINA MARCELA ', 'OCAMPO ALVAREZ', 'TULUÁ', '1988-05-29', 'CALE 33 4430', '3218004476', 'TULUÁ', '', 'activo', '2006-06-14', 'no'),
('1116232216', 'HECTOR MIGUEL', 'GAONA LEMUS', '', '1986-03-03', 'CRA 20A No. 9A 59', '3158553669', 'TULUA', '', 'activo', '2004-03-10', 'si'),
('1116234314', 'DIANA MARCELA', 'RANGEL RESTREPO', '', '1986-06-05', 'CALLE 34A 18-52', '3148481466', 'TULUA', '', 'activo', '2004-08-30', 'no'),
('1116234543', 'DIANA PATRICIA', 'MEJIA GALVIS', '', '2017-05-04', 'CRA 37 No. 29-23', '2261284 -320697', 'TULUA', '', 'activo', '1969-12-31', 'no'),
('1116234727', 'GUSTAVO ADOLFO', 'ARBELAEZ ARBELAEZ', '', '1986-02-03', 'CALLE 26 E 14-12', '3104339024', 'TULUA', '', 'activo', '2004-10-04', 'si'),
('1116235053', 'GUSTAVO ADOLFO', 'SOTO AGUDELO', 'TULUA', '1985-04-22', 'VEREDA SABALETAS', '3057208832', 'TULUA', '', 'inactivo', '2004-11-04', 'no'),
('1116236030', 'CARLOS ARTURO ', 'CORREA ZACIPA', '', '2017-05-03', 'CARRERA 25 No. 35-56', '2244480', 'TULUA', '', 'activo', NULL, 'no'),
('1116236838', 'GREINS', 'CARDONA NAÑEZ', '', '1987-04-07', 'MANZ 54 CASA 30', '3188710446', 'TULUA', '', 'activo', '2005-04-13', 'no'),
('1116237256', 'ADRIAN JOHANN', 'GONZALEZ SANCHEZ', '', '1987-03-27', 'MANZ 63 CASA 4', '3137246293-3146', 'TULUA', '', 'activo', '2005-05-16', 'si'),
('1116237974', 'DANIEL FELIPE', 'GARZON ORTIZ', '', '1987-07-05', 'MANZ P CASA 5 LA PAZ', '3187817591', 'TULUA', '', 'activo', '2005-07-15', 'si'),
('1116239601', 'JOHN FREDY', 'GOMEZ OSPINA', '', '1987-03-16', 'CALLE 32 No. 18-10', '3127060487', 'TULUA', '', 'activo', '2006-01-17', 'si'),
('1116239940', 'JHONATHAN', 'ALVARADO MONTOYA', '', '1988-02-27', 'CRA 33A 40-30', '3016493091', 'TULUA', '', 'activo', '2006-02-28', 'no'),
('1116240819', 'YURI JANETH', 'GUTIERREZ CASTAÑO', '', '1987-11-19', 'CALLE 9B No.17-20', '3117765247', 'TULUA', '', 'activo', '2006-06-27', 'no'),
('1116243658', 'FREDDY ALBERTO', 'SUAREZ GUACA', '', '1989-04-03', 'CRA 29 101 NUEVO AGUACLARA', '3196618361', 'TULUA', '', 'activo', '2007-05-03', 'no'),
('1116243840', 'ZULY JOHANNA', 'VALENCIA BUITRAGO', 'TULUA', '1989-04-30', 'CALLE 4 24-22', '3123068638', 'TULUA', '', 'activo', '2007-05-16', 'no'),
('1116244934', 'LUZ ADRIANA', 'YAZO MONTOYA', 'TULUA', '1989-08-20', 'AGUACLARA CALLEJON EL DIAMANTE 2 ETAPA', '3166119697', 'TULUA', '', 'activo', '2007-09-25', 'no'),
('1116248207', 'MIGUEL ANGEL', 'MOLINA DUQUE', '', '1990-08-27', 'CALLE 27  No- 3-346 ASOAGRIN', '3152813437', 'TULUA', '', 'activo', '2008-08-28', 'si'),
('1116249226', 'JHON FABIO', 'GONZALEZ LOPEZ', '', '1990-11-25', 'CALLE 13 No. 10-36', '2310930', 'TULUA', '', 'activo', '2009-01-09', 'si'),
('1116250170', 'EDWIN HERNAN', 'TORO TREJOS', '', '1991-04-02', 'DIAG 26C 3 TRANSV W 4W-28', '3122376731', 'TULUA', '', 'activo', '2009-04-06', 'si'),
('1116252101', 'YULI ANDREA', 'MORENO MONCADA', 'TULUA', '1991-09-19', 'CALLE 24 26-69 TOMAS URIBE', '2248471 - 3188560000', 'TULUA', '', 'activo', '2009-10-07', 'no'),
('1116252426', 'BRAYAN ALEXIS', 'GALVIZ CORRALES', '', '1991-09-21', 'CALLE 14 10-28', '3017718907', 'TULUA', '', 'activo', '2009-10-30', 'no'),
('1116253412', 'RUBEN DARIO', 'VELASQUEZ CARDONA', 'TULUA', '1992-01-26', 'CRA 20 7-22 STA ISABEL', '3152807801', 'TULUA', '', 'activo', '2010-02-02', 'no'),
('1116256435', 'EFRAIN', 'HENAO LOPEZ', '', '1992-10-28', 'CRA 15A No. 25-50', '3154463752', 'TULUA', '', 'activo', '2010-11-05', 'no'),
('1116258487', 'CRISTIN DANIELA', 'GUERRERO QUINTERO', 'TULUA', '1993-05-08', 'TRANSVERSAL 9 DIAG 20-26', '3183653953', 'TULUA', '', 'activo', '2011-05-09', 'no'),
('1116260860', 'JOHN ALEJANDRO', 'ACERO ALVIAR', 'TULUÁ', '1993-11-27', 'CALLE 34 18-05 PROGRESAR', '3187340343', 'TULUÁ', '', 'activo', '2011-11-28', 'si'),
('1116264638', 'JUAN CAMILO', 'TONUSCO', '', '1994-07-15', 'CRA 22B No. 15-15', '2300097 -315498', 'TULUA', '', 'activo', '2012-09-24', 'no'),
('1116264735', 'DAYAN STEFANY', 'ALVARADO MONTOYA', '', '1994-10-01', 'CRA 30 Bo. 28-113', '3153952271', 'TULUA', '', 'activo', '2012-10-04', 'no'),
('1116265485', 'LEONARDO ', 'VILLEGAS GONZALEZ ', '', '2017-05-03', 'CRA 25 No. 12A 04', '3216729186', 'TULUA', '', 'activo', NULL, 'no'),
('1116266923', 'JULIAN ANDRES', 'CASTAÑO VARELA', 'TULUA', '1995-03-18', 'CALLE 25 12-65 PLAYAS', '3187506619', 'TULUA', '', 'activo', '2013-04-09', 'si'),
('1116268966', 'VALERIA', 'VALENCIA MARTINEZ', '', '1995-09-21', 'CALLE 36 No.24-05', '3173041817', 'TULUA', '', 'activo', '2013-09-27', 'no'),
('1116272835', 'KAREN DAYANA', 'CASALLAS MARIN', 'TULUA', '1996-09-20', 'CALLE 13 38A 58', '3152464794', 'TULUA', '', 'activo', '2014-09-22', 'no'),
('1116280014', 'KELLY TATIANA', 'PARAMO RINCÓN', 'TULUA', '1998-08-23', 'CRA 13 25A 25 LA CEIBA', '3182160502', 'TULUA', '', 'activo', '2016-08-26', 'no'),
('1116281267', 'MARIA CAMILA', 'GARCIA CARMONA', 'TULUÁ', '1999-01-01', 'MANZANA 34 CASA 2 LA VILLA', '3187669840', 'TULUÁ', '', 'activo', '2017-01-03', 'no'),
('1117017594', 'JOSE ALVARO ', 'HENAO FRANCO ', '', '1969-12-31', 'CRA 3 OESTE 24A -40', '3158013685', 'TULUA', '', 'activo', '1969-12-31', 'no'),
('1125079242', 'DIANA MILENA', 'OCAMPO MEDINA', '', '1986-11-01', 'CALLE 6A No. 18-92', '2306761', 'TULUA', '', 'activo', '2006-07-10', 'no'),
('1193231306', 'JESSICA ALEJANDRA', 'GALVEZ CASALLAS', 'TULUÁ', '2001-10-24', 'CORREGIMIENTO LA MORALIA', '3167480461', 'TULUÁ', 'casallassalazarm@gmail.com', 'activo', '2019-11-19', 'no'),
('12991074', 'EDUARDO ALIRIO', 'MARCILLO BENAVIDEZ', 'TULUA', '1967-05-01', 'CALLE 24 16-07', '3164439208', 'TULUA', '', 'inactivo', '1985-11-30', 'no'),
('13107513', 'BOLIVAR', 'SOLIS SINISTERRA', '', '1978-03-28', 'TRANSV 7B No. 21-40', '3204255846', 'TULUA', '', 'activo', '1999-09-15', 'si'),
('13445103', 'VICTOR ABSALON', 'PEREZ HOYOS', 'TULUA', '1958-11-19', 'CALLE 5 20-27 2PISO', '3173278044', 'TULUA', 'donvictorperez59@hotmail.com', 'activo', '1977-12-22', 'si'),
('1364316', 'JAIRO', 'HERNANDEZ ARBELAEZ', 'ARMENIA', '1953-10-10', 'CRA 19 31-77', '3186801503', 'ARMENIA', '', 'activo', '1975-01-22', 'no'),
('14795107', 'HEDILBERTO', 'BUITRAGO HOYOS', '', '1982-03-23', 'CALLE 9  No. 17-75', '3176243828', 'TULUA', '', 'activo', '2000-05-16', 'si'),
('14796095', 'OSCAR MAURICIO', 'CARDONA MEJIA', '', '1982-11-27', 'CALLE 40 27C 42', '3113131848', 'TULUA', '', 'activo', '2000-12-06', 'no'),
('14796177', 'RONALD CRISTIAN', 'ORTEGON SANTANA', 'TULUÁ', '1982-12-18', 'CALLE 7 25A-27', '3107276152', 'TULUÁ', 'ronaldsantana69@hotmail.com', 'activo', '2000-12-20', 'si'),
('14798905', 'JOSE ALEJANDRO', 'MEJIA AGUDELO', 'TULUA', '1984-03-06', 'CALLE 28C 37-40', '3225386959', 'TULUA', '', 'inactivo', '2002-03-21', 'si'),
('14799476', 'FABIAN ANDRES', 'AGUIRRE MUÑOZ', '', '1984-07-04', 'CALLE 25A 3-06', '2325516', 'TULUA', '', 'activo', '2002-07-12', 'no'),
('14799568', 'WILDER ANDRES', 'MARIN GIRALDO', 'TULUA', '1984-07-22', 'DIAGONAL 21A T 20-22 SANTA INES', '3152810626', 'TULUA', '', 'activo', '2002-07-25', 'si'),
('14799769', 'CESAR AUGUSTO', 'RIVERA LOPEZ', '', '1984-08-09', 'CALLE 31 43-25', '3174402060', 'TULUA', '', 'activo', '2002-08-21', 'si'),
('14799943', 'ARLEX', 'GALLEGO SALAZAR', '', '1984-09-08', 'CALLE 37 33-25', '3178946216', 'TULUA', '', 'activo', '2002-09-17', 'no'),
('14800114', 'JAIME', 'CAICEDO VALENCIA', '', '1984-10-11', 'CALLE 23 No. 39-15', '3152089636', 'TULUA', '', 'activo', '2002-10-15', 'si'),
('14801230', 'WALTER MAURICIO', 'ZULUAGA MARIN', '', '1982-08-26', 'CALLE 31 No. 17-40', '3163210541', 'TULUA', '', 'activo', '2003-06-06', 'si'),
('14801801', 'JUAN FERNANDO', 'SALAZAR CESPEDES', '', '1985-10-01', 'CRA 33A No. 38-51', '3186749592', 'TULUA', '', 'activo', '2003-10-08', 'si'),
('14801946', 'JOHAN CAMILO', 'HERNANDEZ RAMIREZ', 'TULUA', '1985-10-08', 'CALLE 36A 44-144', '3185257662', 'TULUA', '', 'activo', '2003-12-05', 'no'),
('14802204', 'EDWARD ANTONIO', 'SALCEDO ZAMBRANO', '', '1986-01-05', 'CARRERA 7AW No. 25-62', '2249582 -316870', 'TULUA', '', 'activo', '2004-01-27', 'no'),
('14802384', 'FABIO ANDRES', 'TORO HENAO', '', '1986-02-19', 'CRA 3 OESTE 22-34', '3185483117', 'TULUA', '', 'activo', '2004-02-19', 'no'),
('14880779', 'JAIRO', 'GIRALDO SALINAS', '', '1960-02-15', 'CRA23A 1F NORTE 33', '3164229810', 'TULUA', '', 'activo', '1978-09-05', 'no'),
('14953603', 'OMAR', 'CERON', '', '1947-06-05', 'CRA 31 No. 28-38', '3165223514', 'TULUA', '', 'activo', '1970-01-19', 'no'),
('14983834', 'JOSE HALADIER', 'GIRALDO BETANCOURT', 'TULUA', '1969-12-31', 'CALLE 6 22B 20', '3174291452', 'TULUA', '', 'activo', '1969-12-31', 'si'),
('15898899', 'MIGUEL ANGEL', 'RIVERA GONZALEZ', 'TULUA', '1957-07-06', 'CALLE 5 19-45', '3153506752', 'TULUA', '', 'activo', '1976-01-17', 'si'),
('15988656', 'ROGELIO', 'MEJIA SALAZAR', '', '1971-11-10', 'CALLE 19 No. 15E 70', '3116271327', 'TULUA', '', 'activo', '1989-12-11', 'si'),
('16247481', 'JOSE NEFTALI', 'GONZALEZ', 'TULUA', '1951-10-27', 'CALLE 22 B 3 A 22', '3186762921', 'TULUA', '', 'activo', '1973-02-08', 'si'),
('16270841', 'CARLOS HUMBERTO', 'MONDRAGON GORDILLO', '', '1963-07-24', 'CALLE 38 No. 24-30', '2246638 - 31585', 'TULUA', '', 'activo', '1981-09-25', 'no'),
('16340039', 'ANTONIO MARIA ', 'MARULAMDA LOPEZ', '', '2017-05-03', 'CRA 24 No. 46-11', '3113759492', 'TULUA', '', 'activo', NULL, 'no'),
('16340717', 'OSCAR TULIO', 'JIMENEZ TIGREROS', '', '1949-05-20', 'CRA 3 OESTE No. 24A04', '2325157- 313679', 'TULUA', '', 'activo', '1970-07-22', 'no'),
('16341566', 'JOSE ALBERTO', 'GUTIERREZ GUTIERREZ', '', '1950-02-07', 'CRA 24 No. 31-45', '2245015', '', '', 'activo', '1971-02-25', 'no'),
('16344097', 'JESUS ANTONIO', 'GIRON VILLAFAÑE', 'TULUÁ', '1952-06-09', 'CRA 18 A1 31-35 URB. LA HERRADURA', '3113084192', 'TULUÁ', 'giron1952@hotmail.com', 'activo', '1973-08-13', 'si'),
('16346414', 'LEONEL AUGUSTO', 'BARONA TASCON', 'TRUJILLO', '1953-04-08', 'VEREDA EL TOPASIO', '3128104729', 'TRUJILLO', '', 'activo', '1975-10-01', 'si'),
('16347636', 'EVELIO DE JESUS', 'RESTREPO HENAO', '', '1954-08-14', 'CARRERA 22 No. 25-66', '2244400 - 31463', 'TULUA', '', 'activo', '1976-01-17', 'si'),
('16348317', 'LUIS MARIO', 'GARCIA RIOS', 'TULUA', '1957-01-19', 'CALLE 12D 28B-17', '3128099725', 'TULUA', '', 'inactivo', '1976-06-14', 'si'),
('16349333', 'ALVARO HUMBERTO', 'CAMACHO MERA', 'TULUÁ', '1956-01-21', 'CALLE 13B 38D95', '3006266630', 'TULUÁ', 'alvarocamachomera@hotmail.com', 'activo', '1976-10-08', 'si'),
('16349504', 'NELSON', 'SUAREZ RIVERA', 'TULUA', '1955-01-15', 'CRA 35 34-28', '3162843033', 'TULUA', '', 'inactivo', '1976-10-08', 'si'),
('16350248', 'CESAR AUGUSTO', 'SANTA RESTREPO', 'TULUA', '1955-06-17', 'CRA 30 36-73', '3173481089', 'TULUA', '', 'activo', '1977-04-11', 'si'),
('16351168', 'JOSE REINEL ', 'RAMIREZ GAVIRIA', '', '2017-05-03', 'CRA 27A No. 35-52', '2241803 ', 'TULUA ', '', 'activo', NULL, 'no'),
('16351749', 'CARLOS HOLMES', 'AGUILERA GARCIA', '', '1959-05-16', 'CRA 38 A NO. 17A -11', '31284111812', 'TULUA', '', 'activo', '1977-08-12', 'no'),
('16352873', 'ALBERTO', 'GALVEZ NARANJO', '', '1960-01-15', 'CALLE 26A No. 14-42', '2304973', 'TULUA', '', 'activo', '1978-03-03', 'si'),
('16352898', 'ARMANDO ', 'LOZANO MARQUEZ', '', '2017-05-03', 'CALLE 24 No. 3OESTE 44', '3113400820', 'TULUA', '', 'activo', NULL, 'no'),
('16353660', 'JAVIER', 'RESTREPO SALINAS', '', '1958-12-02', 'CRA 36 No.20-16', '2254760', 'TULUA', '', 'activo', '1978-11-28', 'si'),
('16354191', 'MIGUEL ANGEL ', 'BAENA VILLADA', 'TULUA', '1960-07-21', 'CALLE 25A 11A-15', '3148733543', 'TULUA', '', 'activo', '1979-02-26', 'si'),
('16354395', 'ORLANDO', 'CORTES TORO', 'TULUA', '1960-12-18', 'DIAGONAL 21 6-04 SANTA INES', '3184313409', 'TULUA', '', 'activo', '1979-04-05', 'no'),
('16357029', 'OMAR ARBEY', 'POTES VILLADA', '', '1962-03-07', 'CRA 22 A No. 13A38', '2308020-3176768', 'TULUA', '', 'activo', '1980-10-17', 'no'),
('16358364', 'JOSE JAIR', 'RODAS MONTOYA', 'TULUA', '1963-06-02', 'CRA 18 20-26 ROJAS', '3157088910', 'TULUA', '', 'activo', '1981-07-21', 'si'),
('16358436', 'BENJAMIN DE JESUS ', 'AMAYA SANCHEZ', '', '2017-05-03', 'CARRERA 32 No. 30-06', '2254641-3127282', 'TULUA', '', 'activo', NULL, 'no'),
('16358681', 'JESUS MARIA', 'ZAPATA MAYA', '', '1963-08-20', 'CRA 35 No. 27-35', '3166069614', 'TULUA', '', 'activo', '1981-10-10', 'no'),
('16359071', 'FELIX HUMBERTO', 'GARZON TOBON', '', '1963-09-16', 'MANZ P CASA 5 LA PAZ', '3187817591', 'TULUA', '', 'activo', '1981-12-10', 'si'),
('16359332', 'JAIRO ', 'LONDOÑO ARANGO ', '', '2017-05-03', 'CALLE 23 No. 3OESTE65', '2303743', 'TULUA', '', 'activo', NULL, 'no'),
('16359543', 'RICARDO', 'GIRALDO GIRALDO', '', '1964-04-23', 'CALLE 14 No. 49-02', '3157428545-3104', 'TULUA', '', 'activo', '1982-07-02', 'si'),
('16360261', 'JOSE ANTONIO', 'SOLANO FRANCO', '', '1962-10-16', 'CARRERA 35 No.28-29', '3155817647', 'TULUA', '', 'activo', '1982-11-30', 'no'),
('16360549', 'HUGO HERNAN', 'CAIPA GOMEZ', '', '1964-10-15', 'CALLE 30 37-67', '3122800948', 'TULUA', '', 'activo', '1983-01-30', 'no'),
('16360567', 'JAIME DE JESUS', 'PULGARIN RODRIGUEZ', 'TULUA', '1969-12-31', 'MZ 41 CASA 25', '3205850235', 'TULUA', '', 'activo', '1969-12-31', 'no'),
('16361437', 'JOSE DARIO', 'CANO ALVAREZ', '', '1965-03-19', 'CRA 13 No. 25A06', '3157736985', 'TULUA', '', 'activo', '1983-07-29', 'no'),
('16361683', 'NORBEY', 'GALLEGO HURTADO', 'TULUA', '1969-12-31', 'CALLE 34 A 18-15 PROGRESAR', '3122126392', 'TULUA', '', 'activo', '1969-12-31', 'si'),
('16361756', 'JOSE OLMES', 'CALERO DUQUE', '', '1964-12-19', 'CARERRA 29 No. 23-29', '3155382328', 'TULUA', '', 'activo', '1983-10-28', 'si'),
('16361760', 'OSCAR WILLIAM', 'ERAZO BUSTAMANTE', 'TULUA', '1965-07-19', 'CRA 30 36-73', '3173481089', 'TULUA', '', 'activo', '1983-10-28', 'si'),
('16361856', 'JOSE ALBEIRO', 'LOPEZ OSORIO', '', '1965-08-08', 'CALLEJ EL DIAMANTE No.32-43', '2306049 -315436', 'TULUA', '', 'activo', '1983-10-28', 'si'),
('16362410', 'JOSE DUVAN', 'PATIÑO LOPEZ', 'TULUA', '1964-12-07', 'CRA 9 N° 20-08', '3167915048', 'TULUA', '', 'activo', '1983-12-12', 'no'),
('16362676', 'ROBINSON', 'MOSQUERA  BALANTA', '', '1966-03-25', 'CALLE 46 24A -14', '3127661948-2328', 'TULUA', '', 'activo', '1984-06-30', 'si'),
('16362706', 'HECTOR EDILSON', 'SANCHEZ TABARES', 'TULUA', '1966-03-30', 'CALLE 35 18 A 45 PROGRESAR', '3117545021', 'TULUA', '', 'activo', '1984-06-30', 'si'),
('16363089', 'NELSON', 'GARCIA MENDEZ', '', '1965-12-23', 'CALLE 13 BIS N°22-26', '3113413191-2313', 'TULUA', '', 'activo', '1984-08-30', 'si'),
('16363242', 'EDIDSON', 'GALVIZ DELGADO', '', '1966-01-28', 'CALLE 14 No. 10-28', '3157978058', 'TULUA', '', 'activo', '1984-10-28', 'no'),
('16365518', 'CARLOS ARTURO', 'PERALTA RESTREPO', '', '1967-11-20', 'DIAG 16 No 25 A1-02', '3164023365', 'TULUA', '', 'activo', '1985-12-09', 'si'),
('16366459', 'BERNARDO', 'JIMENEZ ARIAS', '', '1968-08-30', 'CALLE 35 No. 23-10', '3163693478', 'TULUA', '', 'activo', '1986-11-28', 'si'),
('16366645', 'JHON JAIRO', 'VELEZ RIVERA', '', '1968-09-20', 'CRA 38 No. 31A72', '3183617562', 'TULUA', '', 'activo', '1986-12-22', 'no'),
('16366698', 'JAVIER DE JESUS', 'HERNANDEZ RAMIREZ', '', '1968-02-06', 'CRA 27 BIS No. 39-39', '2258096', 'TULUA', '', 'activo', '1987-02-06', 'no'),
('16367978', 'SERGIO ALIRIO', 'RIOS VERGARA', 'TULUA', '1969-07-08', 'CRA 30 38-83 FATIMA', '3168193394', 'TULUA', '', 'activo', '1987-10-30', 'no'),
('16369072', 'JOHN MILLER', 'LABRADA MARIN', '', '2017-05-03', 'CRA 37 No. 18-11', '2321023 -315407', 'TULUA', '', 'activo', '1969-12-31', 'no'),
('16369081', 'HAROLD ALBERTO', 'IBARGUEN MORENO', 'TULUA', '1965-12-17', 'CALLE 25B 2-21', '3234735807', 'TULUA', '', 'activo', '1988-10-31', 'si'),
('16369850', 'MILTON  FABIAN', 'GONZALEZ VARGAS', '', '1970-11-30', 'CRA 10 No. 26C22', '3218554022', 'TULUA', '', 'activo', '1989-02-28', 'si'),
('16369936', 'JOHN FREDDY', 'SERNA VELASQUEZ', '', '1970-12-30', 'CALLE 6 19-36', '3178899862-2303', 'TULUA', '', 'activo', '1989-03-31', 'no'),
('16369940', 'HECTOR JAIRO', 'JARAMILLO MARIN', '', '1970-09-16', 'CRA 22 25-66', '2244400', 'TULUA', '', 'activo', '1989-03-28', 'si'),
('16633980', 'CARLOS EMIRO', 'GUEVARA LOAIZA', '', '1957-09-20', 'CALLE 26C4 2W-45', '3162274884', '', '', 'activo', '1977-12-22', 'no'),
('16883057', 'FLAVIO ENRIQUE', 'GUERRERO GUEVARA', '', '1962-08-02', 'TRANSV 9 DIAG 20 -26', '3165751071', 'TULUA', '', 'activo', '1982-11-30', 'si'),
('17325703', 'RODOLFO LUIS CARLOS', 'CASTELBLANCO QUINCHE', '', '1963-08-22', 'CRA 41 35-32', '3105395641-2322', 'TULUA', '', 'activo', '1981-09-30', 'si'),
('17654085', 'CARLOS ANDRES', 'GONZALEZ GOMEZ', 'TULUA', '1976-02-20', 'MANZ 59 CASA 7 BOSQUES', '3128594636', 'TULUA', '', 'activo', '1994-06-20', 'si'),
('17655579', 'FABIO', 'CASTRO', '', '1974-09-17', 'CALLE 9 T 5-33', '3013943649', 'TULUA', '', 'activo', '1995-05-15', 'si'),
('18608186', 'WALTER', 'GONZALEZ CARDONA', 'TULUA', '1976-11-09', 'CRA 25 12A 04', '3137144022', 'TULUA', '', 'activo', '1996-04-17', 'si'),
('19128402', 'ABRAHAN ', 'BONILLA GALLEGO', '', '1969-12-31', 'CALLE 38C 20A-45', '3162949519', 'TULUA', '', 'activo', '1969-12-31', 'no'),
('20576619', 'LUZ MIREYA', 'ZAMORA MAYORGA', 'TULUA', '1970-07-11', 'MANZ F CASA 4 URB. EL MANA', '3143078135', 'TULUA', '', 'activo', '1988-09-21', 'no'),
('22002861', 'ANGELICA', 'JARAMILLO BEDOYA', '', '1936-06-04', 'CALLE 25 A 3-06', '2325516', 'TULUA', '', 'activo', '1958-07-20', 'no'),
('24347496', 'PAOLA JIMENA', 'LOEZ RIVERA', 'TULUA', '1980-01-20', 'DIAGONAL 21 20-40', '3209590655', 'TULUA', '', 'activo', '1999-01-20', 'no'),
('2473000', 'FABIAN DE JUESUS', 'BEDOYA GIL', '', '1973-01-22', 'MANZANA M CASA 8', '3113566178', 'TULUA', '', 'activo', '1991-08-28', 'si'),
('24995431', 'LUZ ESTELLA', 'YEPEZ GIRALDO', 'ARMENIA', '1960-04-26', 'CRA 19 31-77 POPULAR ', '3172471511', 'ARMENIA', '', 'activo', '1978-09-18', 'no'),
('25055676', 'MARIA DIOSELINA', 'CARDONA', 'TULUA', '1956-08-18', 'CALLE 9 28B 37', '3185097115', 'TULUA', '', 'activo', '1977-03-01', 'no'),
('25152042', 'ELIZABETH', 'RODRIGUEZ MUÑOZ', 'TULUA', '1950-02-19', 'CALLE 9A 18-46 FLOR DE LA CAMPANA', '3155251423', 'TULUA', '', 'activo', '1972-07-27', 'no'),
('2515543', 'HERNANDO', 'VEGA VALENCIA', 'TULUA', '1957-11-29', 'CALLE 26B 2-04 SAN PEDRO CLAVER', '3117609996', 'TULUA', '', 'activo', '1976-10-05', 'si'),
('25158503', 'GLORIA INES', 'AGUIRRE DE CAMPIÑO', '', '1954-11-19', 'CALLE 33 No. 44-54', '3158404942', 'TULUA', '', 'activo', '1981-12-14', 'no'),
('2517535', 'FRANCISCO ELADIO', 'YUSTI DUQUE', 'TULUA', '1969-12-31', 'CALLE 31 35-34', '2241267', 'TULUA', '', 'inactivo', '1969-12-31', 'no'),
('25349425', 'SAIDY', 'BAICUE CAMAYO', '', '1979-05-12', 'CALLE 16 1A13', '3186011061', 'TULUA', '', 'activo', '1997-09-23', 'no'),
('2620745', 'ALBERTO', 'GUITIERREZ SUAREZ', '', '1966-12-13', 'CALLE 9 No. 19A10', '3194153881', 'TULUA', '', 'activo', '1985-04-25', 'no'),
('2659569', 'MANUEL OVIDIO', 'BUSTAMANTE DELGADO ', '', '1969-12-31', 'MANZANA 8 CASA 36', '2305408', 'TULUA', '', 'activo', '1969-12-31', 'no'),
('2677059', 'GONZALO', 'PEÑA MOSQUERA', '', '1955-08-27', 'CRA 38 23 -30', '3186423610', 'TULUA', '', 'activo', '1977-10-05', 'si'),
('2679314', 'JOSE FERNANDO', 'QUIJANO ARIAS', '', '1974-01-18', 'CALLE 24 No. 1AW E47', '2311290', 'TULUA', '', 'activo', '1992-05-28', 'si'),
('27365149', 'MARIA DE JESUS', 'GRANJA DE CAICEDO', '', '1940-01-16', 'CALLE 24 N', '2308853', 'CALLE 24 No. 10', '', 'activo', '1965-04-23', 'no'),
('27697273', 'ANGELA BEATRIZ', 'SOSA BARRERA', 'TULUA', '1972-02-16', 'CALLE 30 42-15', '3105067877', 'TULUA', '', 'activo', '1994-06-20', 'no'),
('28556871', 'MARIA NOHORA', 'LOMBANA TRUJILLO', 'TULUA', '1980-10-20', 'MZ 54 CASA 35 BOSQUES', '3147373540', 'TULUA', '', 'activo', '2001-02-13', 'no'),
('28901559', 'ANGELINA', 'SALAS DE MARTINEZ', 'TULUA', '1953-11-14', 'CALLE 9A TRANSV 20-21', '3148005288', 'TULUA', '', 'activo', '1981-09-21', 'no'),
('29141890', 'ENELIA', 'SINISTERRA DE FRANCO', '', '1951-03-09', 'CALLE 41A 23-41', '2326546 - 31653', 'TULUA', '', 'activo', '1972-11-09', 'no'),
('29143423', 'LUZ ALBA', 'CORREA CORREA', 'TULUA', '1965-09-09', 'CALLE 22 # 32-17', '3168935441', 'TULUA', '', 'activo', '1983-12-12', 'no'),
('29186664', 'MONICA IDALY', 'GARCIA LOPEZ', 'TULUA', '2017-05-03', 'CALLE 42 A No. 24-11', '2324862', 'TULUA', '', 'inactivo', '1969-12-31', 'no'),
('29266772', 'MARIA DE LA PAZ ', 'RODRIGUEZ ', '', '2017-05-04', 'CALLE 46 No. 24A14', '3127661948', 'TULUA', '', 'activo', NULL, 'no'),
('29307227', 'LUZ STELLA', 'LOPEZ MARULANDA', 'TULUA', '1973-11-29', 'CRA 9 14A 23 DIABLOS ROJOS', '3218502530', 'TULUA', '', 'activo', '1993-02-24', 'no'),
('29331054', 'PIEDAD', 'SUAREZ LOPEZ', 'TULUA', '1966-09-13', 'CALLE 26A 12-31', '3152129103', 'TULUA', '', 'activo', '1986-07-28', 'no'),
('29331074', 'PIEDAD', 'SAUREZ LOPEZ', 'TULUA', '1966-09-13', 'CALLE 26A 12-31', '3152129103', 'TULUA', '', 'activo', '1986-07-28', 'no'),
('29603641', 'MARIA ROSMIRA', 'HENAO URIBE', 'TULUA', '1967-07-06', 'CALLE 42 30-45 FATIMA', '3153132552', 'TULUA', '', 'activo', '1985-12-09', 'no'),
('29612966', 'ARACELLY', 'ARIAS LOPEZ', '', '1957-08-14', 'CRA 26A No.39-10', '2246918-3104461', 'TULUA', '', 'activo', '1977-08-10', 'no'),
('29756437', 'MARIA EUGENIA', 'BECERRA MARIN', '', '1966-11-10', 'CRA 27 No. 39-68', '2246237 - 32342', 'TULUA', '', 'activo', '1985-04-25', 'no'),
('29809591', 'FLOR DE MARIA', 'DIAZ CARDONA', '', '1955-01-17', 'CRA 19 No. 20-41', '31365212114', 'TULUA', '', 'activo', '1997-12-05', 'no'),
('29843416', 'TERESA DE JESUS', 'BUENO ARIAS', '', '1961-07-08', 'CALLE 6A No. 12-26', '3136440830', 'TULUA', '', 'activo', '1983-12-12', 'no'),
('29861550', 'FABIOLA ', 'FRANCO DE REBELLON', '', '2017-05-04', 'CRA 32 No. 21-51', '2243107-2251228', 'TULUA', '', 'activo', NULL, 'no'),
('29863069', 'DOLLY', 'RESTREPO DE PERALTA', '', '1938-03-03', 'DIAG 16 No.25 A1 -02', '2243564', 'TULUA', '', 'activo', '1961-06-24', 'no'),
('29863901', 'ANA ELVIA', 'VILLEGAS DE VARGAS', '', '2017-05-02', 'CALLE 28A 33-36', '2243059', 'TULUA', '', 'activo', NULL, 'no'),
('29867109', 'AURA MARIA ', 'SERRANO DE PIMIENTA', '', '2017-05-03', 'CARRERA 18A No. 30-25', '3172491267', 'TULUA', '', 'activo', NULL, 'no'),
('29871729', 'MARGARITA', 'CRISTANCHO', 'TULUA', '1950-08-16', 'CALLE 21 N° 17-39', '3164714607', 'TULUA', '', 'activo', '1971-10-19', 'no'),
('29871816', 'JULIETA', 'BARONA TASCON', '', '1949-11-11', 'CALLE 41 No. 23-46', '3104158880', 'TULUA', '', 'activo', '1971-11-23', 'no'),
('29872955', 'SANDRA MILENA', 'DUQUE', 'TULUA', '1978-05-08', 'CALLE 5 19-14', '3182652721', 'TULUA', '', 'activo', '1996-05-03', 'no'),
('29875914', 'DIANA PATRICIA', 'CORREA SANCHEZ', 'TULUA', '1979-03-05', 'CALLE 5B 12-45 B/7 DE AGOSTO', '3183450335', 'TULUA', '', 'activo', '1997-05-24', 'no'),
('29876385', 'ANA MILENA', 'VALENCIA GRAJALES', '', '1979-05-06', 'CARRERA 2C 20-71', '3172240518-3156', 'TULUA', '', 'activo', '1997-06-19', 'no'),
('29876653', 'ANGELICA MARIA', 'CASTAÑO MOLINA', '', '1978-12-20', 'CLLJON SAN FRANCISCO 30-05', '3157567719', 'TULUA', '', 'activo', '1997-08-27', 'no'),
('29877783', 'ANGELICA MARIA', 'VELASQUEZ MUÑOZ', '', '1979-09-28', 'CRA 40 No. 43-88', '3164829120', 'TULUA', '', 'activo', '1998-02-12', 'no'),
('29886550', 'GRACIELA', 'GONZALEA CASTRO', '', '1958-08-29', 'CALLE 12C 28A - 26', '3117545021-2261', 'TULUA', '', 'activo', '1976-12-29', 'no'),
('29897200', 'LIBIA', 'GOMEZ MONTOYA', '', '1947-07-10', 'CRA 21 32-45', '3136556889-3136', '', '', 'activo', '1969-08-21', 'no'),
('31187388', 'GLORIA AMPARO', 'ORTIZ SANCHEZ', '', '1952-12-04', 'CRA 23 No.4-26', '2306851', 'TULUA', '', 'activo', '1974-01-21', 'no'),
('31188479', 'OLGA LIDIA', 'ZAMBRANO JURADO ', '', '2017-05-03', 'CARRERA 12 No. 4-89', '2236494 ', 'BUGALAGRANDE', '', 'activo', NULL, 'no'),
('31189498', 'MARLENE', 'RODRIGUEZ', '', '1953-05-20', 'CARRERA 24A No.44-25', '3216153020', 'TULUA', '', 'activo', '1975-12-15', 'no'),
('31191823', 'MARIA NORALBA', 'OSPINA RAMIREZ', 'TULUA', '1957-09-16', 'CRA 22 13 A 88', '3183885921', 'TULUA', '', 'activo', '1977-04-13', 'no'),
('31194558', 'HERLINDA', 'BEDOYA AGUDELO', 'TULUA', '1950-03-02', 'CRA 44 28A-25 SAN BENITO', '3105217422', 'TULUA', 'chacho1137@hotmail.com', 'activo', '1977-12-22', 'no'),
('31196906', 'ANA DORIS', 'MEJIA LASPRILLA', 'TULUA', '1960-03-19', 'CALLE 31 18-118 B/ LA HERRADURA', '3176622948', 'TULUA', '', 'activo', '1979-07-27', 'no'),
('31197273', 'MARIA ROSALBA', 'JIMENEZ MONTOYA', '', '1960-11-03', 'CRA 15A No.15C23', '2303297', 'TULUA', '', 'activo', '1979-09-03', 'no'),
('31198246', 'GLORIA AMPARO', 'RODAS MONTOYA', '', '1957-06-23', 'CALLE 21 No. 22-37', '3167506837', 'TULUA', '', 'activo', '1980-04-24', 'no'),
('31198636', 'CLARA INES', 'RODAS MONTOYA', '', '1961-01-16', 'CARRERA 18 No. 20-66', '3153349979 -314', 'TULUA', '', 'activo', '1980-06-25', 'no'),
('31198668', 'MARIA MERY', 'NOREÑA CARDONA', '', '1961-11-14', 'CALLE 25 A No.11A15', '', 'TULUA', '', 'activo', '1980-06-25', 'no'),
('31198855', 'NANCY AMPARO', 'JIMENEZ MONTOYA', '', '1962-03-26', 'CALLE 14A No. 21-13', '3163918917', 'TULUA', '', 'activo', '1980-07-17', 'no'),
('31199484', 'LUZ YANETH ', 'ORTIZ ARANGO', 'TULUÁ', '1969-12-31', 'MANZANA 63 CASA 63', '3137987577', 'TULUÁ', '', 'activo', '1969-12-31', 'no'),
('31199542', 'ALBA RUTH', 'PALOMINO DE GIL', '', '1959-05-19', 'CALLE 14 No. 24-11', '2315889', 'TULUA', '', 'activo', '1980-11-07', 'no'),
('31200103', 'ELIZABETH', 'BEJARANO PRIETO', '', '1962-10-23', 'CALLE 34 No. 35-17', '2244687', 'TULUA', '', 'activo', '1981-04-07', 'no'),
('31200428', 'BLANCA LIBIA', 'LOAIZA', 'TULUA', '1961-05-05', 'CALLE 7 22-47', '2310825', 'TULUA', '', 'activo', '1981-06-03', 'no'),
('31202048', 'MARIA SULDERY', 'CALLE MONTOYA', 'TULUA', '1969-12-31', 'CALLE 13C 38B 60', '3196942202', 'TULUA', '', 'activo', '1969-12-31', 'no'),
('31202152', 'FAQUILETH', 'PINILLOS RODRIGUEZ', 'TULUA', '1960-06-30', 'CALLE 31 18-28 LA HERRADURA', '', 'TULUA', '', 'activo', '1982-07-30', 'no'),
('31202555', 'ALBA LUCY', 'AMEZQUITA MALDONADO', 'TULUA', '1969-12-31', 'DIAGONAL 23 8-48 PORVENIR', '3153349785', 'TULUA', '', 'activo', '1969-12-31', 'no'),
('31204060', 'LILIANA', 'CRUZ', '', '1964-11-06', 'CRA 27 BIS15-113', '3185944911', 'TULUA', '', 'activo', '1983-07-29', 'no'),
('31330661', 'LILIANA MILENA', 'TAMAYO BUENO', 'TULUA', '1979-10-25', 'CALLE 6A 12-26 B/ 7 AGOSTO', '3183231033', 'TULUA', '', 'activo', '1998-01-07', 'no'),
('31471008', 'AMELIA', 'MEDINA GOMEZ', 'TULUA', '1963-04-21', 'CALLE 29 33-32 VICTORIA', '3117325295', 'TULUA', 'jann.64@hotmail.com', 'activo', '1983-02-25', 'no'),
('31471445', 'MARIELA', 'IMBACHI', 'TULUA', '1963-11-09', 'CALLE 26D 12-04 2 PISO LA ESPERANZA', '3182481096', 'TULUA', '', 'activo', '1983-09-28', 'no'),
('31491057', 'BLANCA RUBY ', 'BENAVIDEZ VALENZUEL A', '', '1969-12-31', 'CRA 24A 16-62', '2255626', 'TULUA', '', 'activo', '1969-12-31', 'no'),
('31491366', 'DAYRA MILENA', 'BENAVIDES VALENZUELA', '', '1974-01-10', 'CRA 24 A 16-62', '2255626', 'TULUA', '', 'activo', '1993-01-28', 'no'),
('31791415', 'SANDRINE ', 'RIOS MARQUEZ', 'TULUA', '1980-10-01', 'CALLE 21 22-40 PALOBONITO', '3117899288-2244786', 'TULUA', '', 'activo', '1998-10-05', 'no'),
('31791676', 'LUZ MARY', 'RIOS PEREZ', 'TULUA', '1980-11-11', 'LA MARINA VIA LA COLONIA M 27 C8', '3172184237', 'TULUA', '', 'activo', '1998-11-24', 'no'),
('31791791', 'ELIZABETH', 'BAUTISTA ARIAS', '', '1979-04-24', 'CALLE 15B 25-69', '3104402553-3117', 'TULUA', '', 'activo', '1998-12-16', 'no'),
('31793621', 'CAROLINA', 'LOAIZA VELEZ', 'TULUA', '1981-07-24', 'CRA 35 N° 28-12 B/VICTORIA', '3156679766', 'TULUA', '', 'activo', '1999-11-08', 'no'),
('31794563', 'LUCELLY', 'GIRALDO GIRALDO', '', '1979-10-05', 'CALLE 16 29A 55', '3206794072', 'TULUA', '', 'activo', '2000-03-16', 'no'),
('31794715', 'PAULA ANDREA', 'CASAÑAS ZUBIETA', '', '1982-02-18', 'CALLE 37 33-25', '2322886-3153562', 'TULUA', '', 'activo', '2000-04-24', 'no'),
('31949165', 'MARIA CONSUELO', 'BETANCUR SANCHEZ', 'TULUA', '1960-10-26', 'CALLE 24 10-33', '3164056211', 'TULUA', '', 'activo', '1984-11-30', 'no'),
('32055115', 'MARIA OFELIA', 'GUTIERREZ GUTIERREZ', '', '1964-06-19', 'CALLE 14 No. 24-11', '2315889', 'TULUA', '', 'activo', '1984-06-25', 'no'),
('38790645', 'FRANCY ELENA', 'CORREA GRISALEZ', 'TULUA', '1981-02-14', 'CALLE 10 9A 16 EL REFUGIO', '3166349170', 'TULUA', '', 'activo', '2000-09-27', 'no'),
('38791760', 'ROSA ELVIRA', 'MUÑOZ TANGARIFE', 'TULUA', '1983-02-11', 'CRA 23 4-50', '3122249649', 'TULUA', '', 'activo', '2001-03-08', 'no'),
('38793648', 'DIANA CAROLINA', 'PIEDRAHITA LOZADA', '', '2017-05-02', 'CRA 34 31-74', '3178948522', 'TULUA', '', 'inactivo', '1969-12-31', 'no'),
('38794625', 'JESSICA', 'TRUJILLO MARTINEZ', '', '1984-07-07', 'CALLE 40 No. 24-120', '3104910765', 'TULUA', '', 'activo', '2002-07-09', 'no'),
('38794781', 'ERIKA LORENA', 'CADAVID RODRIGUEZ', 'TULUA', '2017-05-04', 'CRA 27B No. 42-33', '2328320 -313726', 'TULUA', '', 'inactivo', '1969-12-31', 'no'),
('38795926', 'SANDRA LISBED', 'VELANDIA LOPEZ', 'TULUA', '1985-02-19', 'CRA 25 36-19', '3162277263', 'TULUA', '', 'activo', '2003-02-20', 'no'),
('38796424', 'CAROLINA', 'GARZON ORTIZ', 'TULUA', '1985-05-13', 'MANZANA P CASA 5 LA ´PAZ', '3187817591', 'TULUA', '', 'activo', '2003-06-12', 'no'),
('38797273', 'BETHZY MAGALLY', 'ALVAREZ TORO', 'TULUA', '1986-01-21', 'CRA 10 14-25 DIABLOS ROJOS', '3178309996', 'TULUA', '', 'inactivo', '2004-01-23', 'no'),
('38797275', 'LUZ ARGENIS', 'LONDOÑO ZULETA', 'TULUÁ', '1985-09-07', 'CARRERA 2 OESTE 22-41', '3154485667', 'TULUÁ', '', 'activo', '2004-01-25', 'no'),
('38800042', 'ADALFI', 'VALLEJO GIRALDO', 'TULUA', '1958-01-14', 'CRA 34 35-20', '3145875131', 'TULUA', '', 'activo', '1977-04-14', 'no'),
('38856105', 'CARMENZA', 'GUZMAN SANTOS', '', '2017-05-03', 'CARRERA 41 No. 35-32', '3138290911', 'TULUA', '', 'activo', NULL, 'no'),
('40613950', 'CENELIA', 'BELTRAN ELSONS', '', '1984-07-09', 'CRA 2 24-06', '3106690246', 'TULUA', '', 'activo', '2003-02-03', 'no'),
('42024629', 'MARIA EUGENIA', 'ESCUDERO PALACIO', 'TULUA', '1969-09-15', 'CALLE 4 24A 10 PORTALES DEL RIO', '3146524736', 'TULUA', '', 'activo', '1987-12-14', 'no'),
('42142119', 'LUZ AYDE', 'GARCIA LOPEZ', '', '2017-05-03', 'CALLE 42A No. 24-11', '2324862	3184787', 'TULUA', '', 'activo', '1969-12-31', 'no'),
('43743391', 'GLORIA WBENI', 'ARBOLEDA LOPEZ', 'TULUA', '1972-10-28', 'CALLE 39 30-46 FATIMA', '3173689959-3155837138', 'TULUA', '', 'activo', '1992-08-31', 'no'),
('4375822', 'MAURICIO DE JESUS', 'ZAPATA OBANDO', 'TULUA', '1982-04-17', 'TRANSV 20 7-03', '3175528392', 'TULUA', '', 'activo', '2000-06-16', 'no'),
('4442638', 'JOSE ITURIEL ', 'ARISTIZABAL MONTES', '', '2017-05-03', 'CALLE 4B No. 18-84', '3108298056', 'TULUA', '', 'activo', NULL, 'no'),
('4472655', 'JORGE OSWALDO', 'MEJIA CARDONA', 'TULUA', '1982-04-23', 'CALLE 33 44-30', '3218004476', 'TULUA', '', 'activo', '2000-05-03', 'si'),
('4589027 ', 'LUIS ORLANDO', 'PALACIO AGUIRRE', 'TULUA', '1980-07-18', 'CALLE 1 24-124', '3167003309-2327', 'TULUA', '', 'inactivo', '1962-06-11', 'no'),
('4681237', 'JULIAN', 'MANCILLA RODRIGUEZ', 'TULUA', '1969-01-09', 'CALLE 20 1A-29 LAS VERANERAS', '3166435219', 'TULUA', '', 'activo', '1989-03-31', 'no'),
('55162861', 'MYRIAM', 'LOPEZ ESCALANTE', 'TULUA', '1972-03-24', 'CALLE 13 10-36', '3176716219', 'TULUA', '', 'activo', '1990-08-24', 'no'),
('5887642', 'ORLANDO', 'CUELLAR GONZALEZ', '', '1966-06-03', 'TRANVS 12No. 14A82', '3108270408', 'TULUA', '', 'activo', '1985-03-20', 'no'),
('6240210', 'DIEGO ALEJANDRO', 'VASQUEZ RAMIREZ', 'TULUA', '1980-01-09', 'CRA 26A 39-65', '3043968400', 'TULUA', '', 'activo', '1998-01-23', 'si'),
('6272483', 'ROBERTO DE JESUS', 'CORREA DIEZ', 'TULUÁ', '1954-03-03', 'CALLE 5C 17-34', '3164766068', 'TULUÁ', '', 'activo', '1975-07-15', 'no'),
('6273667', 'SAUL', 'OBANDO SAENZ', 'TULUA', '1963-03-17', 'TV 20 7-03', '3173544729-3175528392', 'TULUA', '', 'activo', '1981-06-23', 'si'),
('6277179', 'LUIS CARLOS', 'DIEZ', '', '1968-07-20', 'DIAGONAL 22 No. 20-45', '3146951228', '', '', 'activo', '1986-12-04', 'si'),
('6427193', 'GENTIL', 'BUITRAGO HOYOS', 'TULUA', '1969-12-31', 'CALLE 30 41-18', '3103810364', 'TULUA', '', 'activo', '1969-12-31', 'no'),
('6427261', 'JESUS ANTONIO', 'GIRALDO MARQUEZ', '', '1953-06-11', 'MANZANA A CASA 9 URBA. MANA', '3218509006', 'TULUA', '', 'activo', '1975-03-18', 'no'),
('6428734', 'JESUS ARNOBIO ', 'MARIN RENDON', 'TULUA', '1976-02-05', 'CALLE 26B 17-21', '3145886876', 'TULUA', 'rd690497@gmail.com', 'activo', '1994-06-30', 'no'),
('6429968', 'HEBERTH ORLANDO', 'ZAPATA GUEVARA', 'TULUA', '1983-11-18', 'CALLE 13 S 49 A 45', '3234828460', 'TULUA', '', 'activo', '2002-05-17', 'si'),
('6433114', 'GERARDO ANTONIO', 'CASTAÑO ARIAS', '', '1955-03-30', 'CALLE 6 No. 22-20', '3166349170', 'TULUA', '', 'activo', '1976-01-17', 'si'),
('64475180', 'ZORAIDA', 'MONTOYA DE BUITRAGO', '', '1959-11-03', 'CALLE 43 No. 23A05', '2249590', 'TULUA', '', 'activo', '1979-05-17', 'no'),
('6462730', 'ETELBERTO', 'SANCHEZ MONTOYA', 'TULUA', '1962-09-19', 'CRA 10 25C-09 MARANDUA', '3053197603', 'TULUA', '', 'activo', '1980-11-26', 'no'),
('6485283', 'HERNEY', 'REBELLO BONILLA ', '', '1969-12-31', 'CRA 32 21-51', '2251228-2243107', 'TULUA', '', 'activo', '1969-12-31', 'no'),
('64891245', 'ARLEY DE JESUS', 'PALENCIA CARDENAS', '', '1967-08-19', 'CALLE 18A 13-26', '3217516176-2243', 'TULUA', '', 'activo', '1987-04-07', 'no'),
('6490785', 'CRISTOBAL', 'BEJARANO CASTAÑO', '', '1939-07-25', 'CR 22 8A -09', '2305052 - 31566', 'TULUA', '', 'activo', '1961-12-18', 'si'),
('6497993', 'LUIS FERNANDO', 'GIRALDO FERNANDEZ', '', '1978-09-15', 'CRA 18A 30-22', '3127336088', 'TULUA', '', 'activo', '1997-02-03', 'no'),
('6498256', 'GERMAN', 'DUQUE NOREÑA', 'TULUA', '1966-07-09', 'CALLE 29 38-04', '3167902839', 'TULUA', '', 'activo', '1985-11-29', 'si'),
('6499807', 'RICARDO', 'CONTRERAS VALLEJO', '', '1979-07-02', 'CALLE 4 No. 22C 35 EL PALMAR', '3166111657', 'TULUA', '', 'activo', '1997-09-05', 'si'),
('6505932', 'CARLOS MARIA', 'GONZALEZ FLORES', '', '1969-12-31', 'NARIÑO(ESQUINA APTO VILLA LORE', '3177378569-2255', 'TULUA', '', 'activo', '1969-12-31', 'no'),
('6558617', 'JAIME HUMBERTO ', 'MUÑOZ GRANDA', 'TULUÁ', '1958-06-26', 'CARRERA 23B 4-50', '3122249646', 'TULUÁ', 'villadecespedes@hotmail.com', 'activo', '1969-12-31', 'no'),
('66675130', 'ALBA NELLY', 'QUINTERO VARELA', 'TULUA', '1969-12-31', 'CRA 33 A CON 40 ESQU.', '3185389861', 'TULUA', '', 'activo', '1969-12-31', 'no'),
('66678695', 'ANA MERCEDES', 'JIMENEZ GUERRERO', 'TULUA', '1970-09-22', 'CALLE 5A 22C 43 EL PALMAR', '3148342062 3147306322', 'TULUA', '', 'activo', '1989-10-27', 'no'),
('66703197', 'MARIA MILVIA', 'MAJIA ARICAPA', '', '1970-05-11', 'CALLE 25 10-62', '2319350', 'TULUA', '', 'activo', '1989-05-31', 'no'),
('66708398', 'CIELO', 'CARVAJAL OLAVE', '', '1964-10-04', 'CRA 24B 45-46', '3225394708-2332', 'TULUA', '', 'activo', '1983-12-12', 'no'),
('66708551', 'LUZ MARINA', 'RIOS VERGARA', 'TULUA', '1965-10-18', 'CARRERA 30 # 38-83', '3186363820', 'TULUA', '', 'activo', '1984-06-30', 'no'),
('66708707', 'DAYSI', 'GALVIZ DELGADO', '', '1965-03-28', 'DIAGONAL 22 T8-25', '2304896 -318448', 'TULUA', '', 'activo', '1984-06-28', 'no'),
('66709225', 'MARTHA CECILIA', 'DUQUE NOREÑA', 'TULUA', '1965-04-20', 'CALLE 29 38-04', '3167902839', 'TULUA', '', 'activo', '1984-09-30', 'no'),
('66709471', 'MARIA TERESA', 'GOMEZ MOLINA', 'TULUA', '1962-10-11', 'CALLE 13 10-60 EL REFUGIO', '3166663996', 'TULUA', '', 'activo', '1984-11-30', 'no'),
('66712208', 'ANA LEYDA', 'JIMENEZ MONTOYA', '', '1968-03-27', 'CRA 21 No. 14A29', '3188385507', 'TULUA', '', 'activo', '1986-05-16', 'no'),
('66713382', 'MARILU', 'ZUÑIGA FERNANDEZ', '', '1968-09-05', 'CRA 27 BIS No. 39-39', '2258096', 'TULUA', '', 'activo', '1987-02-03', 'no'),
('66713393', 'CLARA INES', 'PALOMINO GARCIA', 'TULUA', '1966-05-17', 'CRA 25B 44-20', '2302230', 'TULUA', '', 'activo', '1987-02-03', 'no'),
('66713675', 'MARIA LUISA', 'MOLINA RUBIO', '', '1967-06-21', 'CALLE 37 No. 25-47', '3165343034', 'TULUA', '', 'activo', '1987-04-03', 'no'),
('66714371', 'MARIA NANCY', 'GUEVARA CARVAJAL', '', '1968-05-19', 'CALLE 6 No. 19-36', '3178896915', 'TULUA', '', 'activo', '1987-08-31', 'no'),
('66714665', 'ROSALBA', 'MERCADO', '', '1969-03-17', 'CRA 12 No. 15A 26', '3152765546', 'TULUA', '', 'activo', '1987-10-30', 'no'),
('66714849', 'LUZ DARY', 'CARDOZO ARENAS', 'TULUA', '1969-04-30', 'TRANSVERSAL 4 OESTE D26 C4-40', '3154845498', 'TULUA', '', 'activo', '1987-11-30', 'no'),
('66717155', 'ROSANA', 'CORRALES TORRES', '', '1971-02-24', 'CALLE 14 No. 10-24', '3187728045', 'TULUA', '', 'activo', '1989-06-30', 'no'),
('66717772', 'MARIA NISNEY', 'MARIN  VELASQUEZ', '', '1970-02-12', 'CRA 5 OESTE 22-17', '3233996402', 'TULUA', '', 'activo', '1989-10-31', 'no'),
('66720080', 'AURA LIGIA', 'QUINTERO GIRALDO', '', '1971-10-11', 'TRANVS 9 DIAG 20-26', '3167588109', 'TULUA', '', 'activo', '1991-03-27', 'no'),
('66720657', 'GLORIA TERESA', 'LOPEZ HERNANDEZ', '', '1972-08-24', 'CALLE 5A No. 22B55', '2307559 3206059', 'TULUA', '', 'activo', '1990-07-31', 'no'),
('66720857', 'MARIA TERESA', 'PINILLA LOPEZ', '', '1972-06-21', 'CALLE 1 No.24-114', '3172297365', 'TULUA', '', 'activo', '1991-08-30', 'no'),
('66721503', 'YAMILETH', 'ALZATE ARBOLEDA', '', '1973-06-06', 'CRA 37 No. 18-11', '2321023', 'TULUA', '', 'activo', '1991-08-30', 'no'),
('66721600', 'NORALBA', 'VILLA', 'TULUÁ', '1967-06-28', 'CRA 13 25A-06', '3176535020', 'TULUÁ', 'andres.felipe.betancourt.r@hotmail.com', 'activo', '1991-11-08', 'no'),
('66722065', 'LUZ MARINA', 'OSPINA GONZALEZ', '', '1971-04-19', 'CALLE 31 34A-37', '3175277156', 'TULUA', '', 'activo', '1992-05-29', 'no'),
('66723057', 'MIRYAN ', 'CASTILLO SUAZA ', '', '1969-12-31', 'MANZANA 56 CAS 32', '3158063198', 'TULUA', '', 'activo', '1969-12-31', 'no'),
('66727098', 'NANCY LEONOR', 'MINA CUERVO', '', '1976-03-27', 'MANZ A CASA 9 URB EL MANA', '3178787260', '', '', 'activo', '1994-10-31', 'no'),
('66729006', 'MARIA LILIANA', 'RESTREPO HENAO', '', '1977-09-03', 'CRA 7 OESTE  25-87', '3164843409', 'TULUA', '', 'activo', '1995-11-02', 'no'),
('66729334', 'LUZ ASCENETH', 'SANTAMARIA GUTIERREZ', 'TULUA', '1976-11-21', 'CALLE 40 33 A 22 FATIMA', '3152623311', 'TULUA', '', 'activo', '1996-01-05', 'no'),
('66729939', 'CANDY ZULEIDY', 'OLAVE PINILLOS', '', '1977-08-01', 'CALLE 46 No. 24A 14', '2328240 - 31276', 'TULUA', '', 'activo', '1996-05-03', 'no'),
('66872626', 'YAMILETH', 'GARCIA VELEZ', '', '1978-02-06', 'CRA 38A 17-13', '3128515861', 'TULUA', '', 'activo', '1996-10-03', 'no'),
('66963003', 'MARISELA', 'HERNANDEZ VILLADA', 'TULUA', '1981-01-28', 'CRA 19 23 A 20', '3147657990', 'TULUA', '', 'activo', '1999-03-30', 'no'),
('70161391', 'NABOR DE JESUS', 'QUINTERO DUQUE', '', '1961-11-17', 'CALLE 14 10-04', '3216144439', 'TULUA', '', 'activo', '1979-12-09', 'no'),
('71742033', 'CARLOS FERNEY', 'HERNANDEZ HERNANDEZ', 'TULUA', '1974-01-09', 'CALLE 25 16-28 LAS DELICIAS', '3152873388', 'TULUA', 'carlosfercho09@gmail.com', 'activo', '1992-03-09', 'si'),
('72192650', 'JUAN PABLO', 'TORRES TORRES', '', '1971-08-28', 'CRA 1425-85', '3167732449-3508', 'TULUA', '', 'activo', '1991-07-22', 'si'),
('73022947', 'JOHN JAIRO', 'FELIZZOLA MARTINEZ', '', '1985-07-26', 'MANZ 12 CASA 09', '3122413131', 'TULUA', '', 'activo', '2003-09-20', 'no'),
('75158886', 'YOVANNY FERNANDO', 'RUIZ LARGO', '', '1984-01-07', 'MANZ G CASA 12 LA PAZ', '3176867741', 'TULUA', '', 'activo', '2002-02-06', 'si'),
('7549682', 'ADELMO', 'CHICANGANA CHICANGANA', '', '1969-12-31', 'CALLE 30 42-15', '2327961	3105067', 'TULUA', '', 'activo', '1969-12-31', 'no'),
('7843585', 'LUIS ALFONSO', 'OCAMPO CALVO', '', '1972-04-06', 'CALLE 12 25-53', '3184505102', 'TULUA', '', 'activo', '1991-03-26', 'si'),
('79305185', 'LUIS ALFONSO', 'MORENO SANABRIA', 'TULUA', '1964-04-26', 'CALLE 3 24A 56 PORTALES DEL RIO', '3104668963', 'TULUA', '', 'activo', '1982-09-15', 'si'),
('80386131', 'EDWIN', 'VERJAN CASTAÑO', 'TULUÁ', '1966-11-02', 'CALLE 11 28A-51', '3152334630', 'TULUÁ', 'edwinverjan@yahoo.com', 'activo', '1991-09-30', 'si'),
('94150054', 'LUIS HERNANDO', 'PEREZ SANTACRUZ', '', '1969-09-05', 'CRA 6W 26A28 LAS NIEVES', '3113892958', 'TULUA', '', 'activo', '1987-11-30', 'si'),
('94150321', 'JUAN CARLOS', 'VELASQUEZ CARDONA', '', '1979-11-07', 'CRA 20 No. 9A43', '3185097115', 'TULUA', '', 'activo', '1996-02-03', 'no'),
('94150427', 'JUAN MANUEL', 'GONZALEZ RIVERA', 'TULUA', '1969-12-31', 'CRA 33 33-16', '3104461891', 'TULUA', '', 'activo', '1969-12-31', 'si'),
('94150461', 'DIEGO FERNANDO ', 'CORREA ZACIPA', '', '1969-12-31', 'CRA 25 35-56', '2244480', 'TULUA', '', 'activo', '1969-12-31', 'no'),
('94150804', 'HECTOR FABIO', 'GALLO HENAO', 'TULUA', '1979-06-20', 'TRANSVERSAL 12 4A-24', '3152258733', 'TULUA', '', 'activo', '1998-04-23', 'si'),
('94150845', 'FABIAN ANDRES', 'LONDOÑO ROJAS', 'TULUA', '1980-04-25', 'CRA 33A 36-10 FATIMA', '3177700763', 'TULUA', '', 'activo', '1998-04-29', 'si'),
('94151588', 'JOSE LUIS', 'VERA CORTES', 'TULUA', '1980-06-06', 'CALLE 12D 28B 47', '3177335522-3187957299', 'TULUA', '', 'activo', '1998-09-03', 'si'),
('94152881', 'JOSE DANIEL', 'CAÑAS PRADO', '', '1980-06-25', 'CARRERA 37 No. 18-11', '2321023 - 31540', 'TULUA', '', 'activo', '1999-04-28', 'si'),
('94152920', 'JORGE ELIECER', 'GARCIA URIBE', 'TULUA', '1999-05-05', 'CRA 48B 14A-09 LA CRUZ', '3177355476', 'TULUA', '', 'activo', '1980-06-20', 'si'),
('94153714', 'DIEGO ALEXANDER', 'GALEANO LOPEZ', '', '1980-12-09', 'CALLE 14 No. 9A24', '3164210147', 'TULUA', '', 'activo', '1999-09-20', 'no'),
('94193416', 'JAMES ERLEY', 'VILLA LOAIZA', '', '1980-04-08', 'CALLE 46 24A-14', '3127661948', 'TULUA', '', 'activo', '1998-06-08', 'si'),
('94257848', 'JOSE AUGUSTO', 'MUÑOZ MILLAN', '', '1983-07-14', 'CRA 25B 13 A 34', '3127597574', '', 'josetecnico507@hotmail.com', 'activo', '2002-02-18', 'no'),
('94301631', 'DOLMER', 'CAÑAS HERNANDEZ', 'TULUA', '1974-07-08', 'CRA 24 42A-26 PRINCIPE', '3137171833', 'TULUA', '', 'activo', '1992-07-30', 'si'),
('94301839', 'CARLOS ARTURO', 'ESPEJO PAEZ', 'TULUA', '1973-08-31', 'CALLE 25B 8-16 SAN PEDRO CLAVER', '3174542876', 'TULUA', '', 'activo', '1992-10-30', 'si'),
('94319623', 'DIEGO FERNANDO', 'LOZANO HERRERA', 'PALMIRA', '1974-06-21', 'CRA 33A DIAGONAL 66-51 ', '3185986720', 'PALMIRA', '', 'activo', '1992-09-16', 'no'),
('94357226', 'JHONIER', 'DUQUE', 'TULUA', '1981-03-05', 'MZ 32 CASA 30', '3155743950', 'TULUA', '', 'activo', '2000-03-24', 'si'),
('94365239', 'HUGO HERNAN ', 'JARAMILLO MAYA', 'TULUA', '1971-03-17', 'CALLE 19A 12A-03', '3146098369', 'TULUA', '', 'activo', '1989-09-29', 'no'),
('94366373', 'NOLBERTO', 'GUTIERREZ NARANJO', 'TULUA', '1972-06-21', 'CRA 4 OESTE 20-47', '', 'TULUA', '', 'activo', '1990-09-28', 'si'),
('94366846', 'RODRIGO', 'TREJOS OSORIO', '', '1972-02-14', 'MANZ A CASA9 EL MANA', '3182537757', 'TULUA', '', 'activo', '1990-11-30', 'si'),
('94367256', 'JOSE EVELIO', 'NOREÑA CARDONA', '', '1972-10-13', 'CALLE 31 A 18-104 URB LA HERRA', '3152704308', 'TULUA', '', 'activo', '1991-01-31', 'si'),
('94367960', 'FERNANDO', 'VILLAREAL MOLINA', 'TULUA', '1972-10-01', 'CALLE 25C 11-58', '3154845498', 'TULUA', '', 'activo', '1991-07-31', 'si'),
('94385804', 'HECTOR FABIO', 'BERMUDEZ SUAREZ', '', '1975-01-26', 'CRA 33 No. 42B-38', '3174182191', 'TULUA', '', 'activo', '1993-03-29', 'si'),
('94386566', 'RODRIGO', 'LEMUS RESTREPO', '', '1973-10-19', 'CRA 9 No. 14-12', '3177861639', 'TULUA', '', 'activo', '1992-04-30', 'si'),
('94387335', 'JESUS ARMANDO', 'GUTIERREZ', '', '1979-11-07', 'CALLE 26 12-25', '3147868470', 'TULUA', '', 'activo', '1997-12-29', 'no'),
('94387703', 'CARLOS ANDRES', 'QUIROGA ARCE', 'TULUA', '1982-07-31', 'CALLE 15A 25-13 LA GRACIELA', '3154333334', 'TULUA', '', 'activo', '2000-08-30', 'si'),
('94388482', 'LUIS FERNANDO', 'DUQUE MELO', '', '1974-05-29', 'CRA 1 A No. 20-70', '3166550132', 'TULUA', '', 'activo', '1992-10-30', 'si'),
('94388573', 'CARLOS ARIEL', 'PATIÑO GARZON', 'TULUA', '1973-12-24', 'CRA 5 24-35', '541133397650', 'TULUA', '', 'activo', '1992-10-30', 'no'),
('94388980', 'NELSON ENRIQUE', 'OSPINA PATIÑO', 'TULUA', '1974-08-12', 'CRA 9 10-42', '3188796199', 'TULUA', '', 'activo', '1993-01-29', 'no'),
('94389165', 'JESUS ALONSO ', 'OROZCO ORREGO', '', '2017-05-03', 'CALLE 25 No.  5-73', '2304740', 'TULUA', '', 'activo', NULL, 'no'),
('94389296', 'WILSON HERNANDO', 'VERA ZAPATA', '', '1974-12-04', 'CALLE 23 No. 20-80 CRA 22B  14', '3172244838', 'TULUA', '', 'activo', '1993-03-31', 'no'),
('94389979', 'ALEXANDER', 'CASTELLANOS RODRIGUEZ', '', '1974-05-03', 'CALLE 46 No. 24A14', '2328240- 312766', 'TULUA', '', 'activo', '1993-06-11', 'no'),
('94390381', 'JHON JAIRO ', 'CASTAÑO JIMENEZ', '', '1969-12-31', 'CALLE 16A N° 21-23', '3153980448-2313', 'TULUA', '', 'activo', '1969-12-31', 'no'),
('94391120', 'HECTOR FABIO', 'GIRALDO GARCIA', 'TULUA', '1975-11-12', 'CRA 29A 21-80', '2240682-3168229897', 'TULUA', '', 'activo', '1994-06-20', 'si'),
('94391954', 'GUSTAVO ANTONIO', 'CARDONA PEREZ', 'TULUA', '1976-05-06', 'CALLE 5 22B-04 EL ROJAS', '3175671973', 'TULUA', 'guscar954@gmail.com', 'activo', '1994-10-31', 'no'),
('94392441', 'LEON FERNANDO', 'BEJARANO MEDINA', '', '1976-11-07', 'MANZ 32 CASA 30 BOSQUES', '3152731764 -315', 'TULUA', '', 'activo', '1994-12-22', 'si'),
('94392656', 'PABLO MAURICIO', 'LOAIZA BETANCURT', '', '1977-01-24', 'CARRERA 38 23-30', '3186423610', 'TULUA', '', 'activo', '1995-02-09', 'no'),
('94393252', 'GERMAN', 'FLOREZ BURBANO', '', '1976-09-14', 'CALLE 12 No 25-53', '2314947', 'TULUA', '', 'activo', '1995-06-13', 'no'),
('94393280', 'JOHN JAIRO', 'SANTAMARIA PAREJA', '', '1976-10-18', 'CRA 22 No. 30-30', '3182886400', 'TULUA', '', 'activo', '1995-06-13', 'no'),
('94393715', 'WILFREDO', 'CASTILLO CASTILLO', '', '1976-08-04', 'CALLE 25A 5-06', '3167080422', 'TULUA', '', 'activo', '1995-09-04', 'no'),
('94394241', 'DIEGO FERNANDO', 'TOVAR HERNANDEZ', '', '1977-10-21', 'CALLE 24 N°5-24', '3165563760', 'TULUA', '', 'activo', '1995-12-19', 'no'),
('94394297', 'HOOVER GUILLERMO', 'NARANJO AGUDELO', 'TULUA', '1977-08-03', 'CALLE 38 30-23', '3136719239', 'TULUA', '', 'activo', '1995-12-19', 'si'),
('94394409', 'JHON ALEXANDER', 'ORREGO HENAO', '', '1977-11-22', 'CALLE 10C 27D 33', '3113610034', 'TULUA', '', 'activo', '1996-02-05', 'si'),
('94394984', 'ALEXANDER ', 'GONZALEZ RAMIREZ', '', '2017-05-03', 'DIAG 21A No. 20-40', '3173574960', 'TULUA', '', 'activo', NULL, 'no'),
('94395659', 'ERVIN ORLANDO', 'NOREÑA SALDARRIAGA', '', '1978-07-29', 'CRA 23 5B 25', '2306024-3157536', 'TULUA', '', 'activo', '1996-08-28', 'no'),
('94395986', 'HENRY ALEXANDER', 'GOMEZ SALGADO', '', '1978-09-23', 'CRA 21 No.21-50', '3186238592', 'TULUA', '', 'activo', '1996-11-18', 'no'),
('94451561', 'JUAN CARLOS', 'GIRALDO QUINTERO', '', '1975-12-02', 'CALLE 36A No.44-110', '3185257662', 'TULUA', '', 'activo', '1994-02-07', 'si'),
('98431473', 'WILSON FREDY', 'CASAS MOLINA', 'TULUA', '1979-02-20', 'CALLE 26M 10-39 BUENOS AIRES', '3163422824', 'TULUA', '', 'activo', '1997-04-23', 'si'),
('9845593', 'RAMIRO', 'SEPULVEDA DIAZ', '', '1970-05-07', 'CALLE 12B 23-06', '2256520', 'TULUA', '', 'activo', '1989-04-12', 'si'),
('9870176', 'CARLOS ANDRES', 'GIRALDO ALVAREZ', '', '1960-12-10', 'DIAG 22T 7A03', '3157747444', 'TULUA', '', 'activo', '1999-07-15', 'no'),
('AAD346229', 'YOSUNEY ', 'MARTINEZ PERALTA', 'TULUA', '1979-04-15', 'CRA 25 39-66 PRINCIPE', '3172445547', 'TULUA', 'yosuney79@hotmail.com', 'activo', '1969-12-31', 'no');

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
  `estado` int(1) DEFAULT '0',
  `observaciones` varchar(100) DEFAULT NULL,
  `liquidado` int(1) DEFAULT '0'
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

--
-- Disparadores `servicio`
--
DELIMITER $$
CREATE TRIGGER `actua_serv` BEFORE UPDATE ON `servicio` FOR EACH ROW begin
update `servicio_h` set `id_ser_ref`=old.`id_ser`,`telefono`=new.telefono, `direccion`=new.direccion, `detalle_serv`=new.detalle_serv, `id_movil`=new.id_movil, `id_movil2`=new.id_movil2, `placa`=new.placa, `fecha_asig`=new.fecha_asig, `id_tarjeta`=new.id_tarjeta, `tarjeta`=new.tarjeta, `id_conductor`=new.id_conductor, `codigo`=new.codigo, `nombres`=new.nombres, `estado`=new.estado,observacion=new.observacion,`recep_serv`=new.recep_serv where id_ser_ref=old.id_ser;
end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `actualiza_dir` AFTER INSERT ON `servicio` FOR EACH ROW begin
if(new.telefono<>"" and new.direccion<>"") then
insert into directorio (telefono,direccion) values (new.telefono,new.direccion)
on duplicate key update direccion=new.direccion;
end if;
insert into `servicio_h` (`id_ser_ref`, `fecha_reg`, `linea`, `telefono`, `direccion`, `detalle_serv`, `id_movil`, `id_movil2`, `placa`, `fecha_asig`, `id_tarjeta`, `tarjeta`, `id_conductor`, `codigo`, `nombres`, `estado`, `observacion`, `usuario`, `recep_serv`) values (new.id_ser,new.fecha_reg,new.linea, new.telefono,new.direccion, new.detalle_serv, new.id_movil, new.id_movil2, new.placa, new.fecha_asig, new.id_tarjeta, new.tarjeta, new.id_conductor, new.codigo, new.nombres,new.estado,new.observacion, new.usuario, new.recep_serv);
end
$$
DELIMITER ;

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
  `id_eps` int(5) NOT NULL,
  `valor` int(20) NOT NULL,
  `fecha_parte` date NOT NULL,
  `fecha_pago` date NOT NULL DEFAULT '0000-00-00',
  `convenio` varchar(5) NOT NULL,
  `observacion` varchar(150) NOT NULL,
  `estado` int(5) NOT NULL COMMENT '1,activa,2 pago'
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

--
-- Disparadores `suspension`
--
DELIMITER $$
CREATE TRIGGER `novedad_sus` AFTER UPDATE ON `suspension` FOR EACH ROW begin
if(old.est<>new.est) then 
insert into `novedad_servicio` (`id_movil`, `operacion`, `estado`) values (new.`id_movil`,"Termino la suspension",1);
end if;
end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `reporte_sus` AFTER INSERT ON `suspension` FOR EACH ROW begin
insert into `novedad_servicio` (`id_movil`, `operacion`, `estado`) values (new.`id_movil`,"Movil suspendido",1);
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarifas`
--

CREATE TABLE `tarifas` (
  `id_tarifa` int(11) UNSIGNED NOT NULL,
  `concepto` varchar(100) DEFAULT NULL,
  `tarifa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tarifas`
--

INSERT INTO `tarifas` (`id_tarifa`, `concepto`, `tarifa`) VALUES
(1, 'CARRERA MINIMA', 4500),
(2, 'BANDERAZO', 1300),
(4, 'RECORRIDO POR CADA 90 MTS.', 110),
(5, 'RECARGO NOCTURNO, RECARGO DOMINICAL Y FESTIVO', 500),
(6, 'SERVICIO POR HORA', 22000),
(7, 'SERVICIO POR MINUTO DE ESPERA', 110),
(8, 'CARRERA MINIMA', 4000),
(9, 'SERVICIO DE MOTELES', 9000),
(10, 'LOS TAXIS QUE NO PONGAN A FUNCIONAR EL TAXIMETRO LA CARRERA MINIMA NO PUEDE SER MAYOR A:', 3000);

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

--
-- Volcado de datos para la tabla `tipo_accidente`
--

INSERT INTO `tipo_accidente` (`id_tipo_a`, `tipo_accidente`) VALUES
(1, 'CON CICLISTA'),
(2, 'CON PEATON'),
(3, 'CON MOTOCICLISTA'),
(4, 'CON OTRO VEHICULO'),
(5, 'CON OTRO TAXI'),
(6, 'POR SI MISMO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_linea`
--

CREATE TABLE `tipo_linea` (
  `id_tipo_linea` int(5) NOT NULL,
  `tipo_linea` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_linea`
--

INSERT INTO `tipo_linea` (`id_tipo_linea`, `tipo_linea`) VALUES
(1, 'Fija'),
(2, 'Celular'),
(3, 'Pto de Radio');

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

--
-- Disparadores `utilidades`
--
DELIMITER $$
CREATE TRIGGER `tr_serv` AFTER UPDATE ON `utilidades` FOR EACH ROW begin
set @cant_reg = (select count(id_ser) from servicio);
if(@cant_reg > 100) then
   set @id_ser = (select id_ser from servicio limit 1);
   delete from servicio where id_ser = @id_ser;
end if;
end
$$
DELIMITER ;

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
  `estado` int(2) DEFAULT '1',
  `poliza` int(2) DEFAULT '1',
  `managerid` varchar(30) DEFAULT NULL,
  `combustible` varchar(50) DEFAULT NULL,
  `dtaller` int(5) DEFAULT NULL,
  `fcontrato` date DEFAULT NULL,
  `radio` enum('si','no') DEFAULT 'si',
  `ultimo_pago` date DEFAULT NULL,
  `cilindraje` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `vehiculo`
--

INSERT INTO `vehiculo` (`id_movil`, `placa`, `modelo`, `clase`, `id_marca`, `referencia`, `tipo`, `motor`, `serie`, `color`, `pago_hasta`, `grupo`, `id_prop`, `estado`, `poliza`, `managerid`, `combustible`, `dtaller`, `fcontrato`, `radio`, `ultimo_pago`, `cilindraje`) VALUES
('002', 'SQF 606', 2010, 'AUTOMOVIL', 1, 'GRAND I10', 'SEDAN', 'G4LAEM478579', 'MALA741CAGM067540', '', '2020-01-01', 'TA', '94367960', 1, 0, '', 'GAS GASOL', 0, '2017-07-18', NULL, '2018-09-12', '1248'),
('006', 'SQF520', 2015, 'AUTOMOVIL', 3, 'TAXI-724', 'HATCHBACK', 'B10S1140060297', '9GAMM6102FB002752|', '', '2020-07-27', 'TA', '6273667', 1, 0, '', 'GAS-GASOLINA', 0, '2020-07-27', NULL, '0000-00-00', '995'),
('007', 'SQF 792', 2017, 'AUTOMOVIL', 3, 'CHEVY TAXI', 'HATCH BACK', 'B10S1161830009', '9GAMM6102HB033826', '', '2020-01-01', 'TA', '1116260860', 1, 0, '94367960', 'GASOLINA', 0, '2017-12-19', NULL, '0000-00-00', '995'),
('010', 'VNA539', 2012, 'AUTOMOVIL', 1, 'ATOS PRIME GL', 'HATCH BACK', 'G4HCBM343203', 'MALAB51GACM706809', '', '2019-10-04', 'TA', '16348317', 1, 0, '', 'GAS GASOL', 0, '2019-10-04', NULL, '0000-00-00', '1000'),
('011', 'SQF439', 2014, 'AUTOMOVIL', 6, 'PICANTO EKOTAXI + LX', 'HATCH BACK', 'G3LADP087609', 'KNABE511AET605860', '', '2020-01-01', 'TA', '6498256', 1, 0, '', 'GASOLINA', 0, '2018-05-10', 'no', NULL, '998'),
('012', 'SQF 830', 2017, 'AUTOMOVIL', 8, 'TIGGO', 'HATCH BACK', 'SQRE4G16AFGH64148', 'LVVDB11B1HD012850', '', '2020-01-01', 'TA', '14799476', 1, 0, '', 'GASOLINA', 0, '2018-07-27', NULL, '0000-00-00', '1598'),
('015', 'SQF990', 2021, 'AUTOMOVIL', 13, 'ALTO', 'HATCHBCK', 'K10BN2229659', 'MA3FB42S0LA531916', '', '2020-01-01', 'TA', '38797275', 1, 0, '', 'GASOLINA', 0, '2017-11-09', NULL, '0000-00-00', '998'),
('016', 'VNB973', 2008, 'AUTOMOVIL', 3, 'TAXI POWER', 'SEDAN', '7H0010879', '9BGSE19N08B133404', '', '2019-10-16', 'TA', '6429968', 1, 0, '', 'GAS GASOL', 0, '2019-10-16', 'no', NULL, '1500'),
('017', 'SQF472', 2014, 'AUTOMOVIL', 6, 'PICANTO EKOTAXI', 'HATCH BACK', 'G4LADP118255', 'KNABE512AET693221', '', '2020-01-01', 'TA', '16365518', 1, 0, '', 'GAS GASOLINA', 0, '2017-07-27', NULL, '0000-00-00', '1248'),
('018', 'VNA 590', 2013, 'AUTOMOVIL ', 1, 'i 10 GL', 'HATCH BACK', 'G4HGCM450302', 'MALAM51BADM113600', '', '2020-01-01', 'TA', '94395659', 1, 0, '', 'GAS GASOL', 0, '2017-07-27', NULL, '0000-00-00', '1086'),
('020', 'VNC072', 2010, 'AUTOMOVIL', 1, 'ATOS PRIME GL', 'SEDAN ', 'G4HC9M839444', 'MALAB51GAAM451702', '', '2020-01-01', 'TA', '16359332', 1, 0, '', 'GAS GASOLINA ', 0, '2017-07-27', NULL, '0000-00-00', '999'),
('024', 'SQF417', 2013, 'AUTOMOVIL', 6, 'RIO LS', 'SEDAN', 'A5D404461', '8LCDC223XDE032602', '', '2020-01-01', 'TA', '6272483', 1, 0, '', 'GAS GASOL', 0, '2017-07-27', NULL, '0000-00-00', '1493'),
('027', 'VNC069', 2010, 'AUTOMOVIL', 1, 'ACCENT GL', 'SEDAN', 'G4EE9332881', 'KMHCM41AAAU373061', '', '2019-08-29', 'TA', '2677059', 1, 0, '', 'GAS GASOL', 0, '2019-08-29', NULL, '0000-00-00', '1399'),
('029', 'VNB537', 1999, 'AUTOMOVIL', 1, 'ACCENT', 'SEDAN', 'G4EKW492592', 'KMHVF11NPXU548628', '', '2020-01-01', 'TA', '4681237', 1, 0, '', 'GAS GASOL', 0, '2017-07-27', NULL, '0000-00-00', '1495'),
('030', 'SQF 750', 2017, 'AUTOMOVIL', 3, 'CHEVYTAXI PLUS', 'HATCH BACK', 'LCU*152510597*', '9GASA68M7HB000247', '', '2020-01-01', 'TA', '13445103', 1, 0, '', 'GASOLINA', 0, '2018-02-02', NULL, '0000-00-00', '1399'),
('031', 'SQF599', 2015, 'AUTOMOVIL', 1, 'GRAND I 10', 'SEDAN', 'G4LAEM442808', 'MALA741CAFM061551', '', '2020-12-15', 'TA', '66729939', 1, 0, '', 'GASOLINA', 0, '2020-12-15', NULL, NULL, '1248'),
('032', 'VNB649', 2002, 'AUTOMOVIL', 2, '323 NT', 'SEDAN', 'B3815725', '9FCBT42B020002541', '', '2020-01-01', 'TA', '16358364', 1, 0, '', 'GAS GASOL', 0, '2017-07-27', NULL, '0000-00-00', '1300'),
('034', 'SQF580', 2015, 'AUTOMOVIL', 1, 'i 10 GL', 'HATCH BACK', 'G4HGEM799614', 'MALAM51BAFM556801', '', '2020-02-03', 'TA', '38856105', 1, 0, '', 'GAS GASOL', 0, '2020-02-03', NULL, '0000-00-00', '1086'),
('036', 'SQF351', 2013, 'AUTOMOVIL', 1, 'i 10 GL', 'HATCH BACK', 'G4HGCM469475', 'MALAM51BADM141146', '', '2020-01-01', 'TA', '66729939', 1, 0, '', 'GAS GASOL', 0, '2017-07-27', NULL, '0000-00-00', '1086'),
('038', 'SQF 896', 2018, 'AUTOMOVIL', 9, 'S3(HFC7161MV)', 'HATCH BACK', 'H3373327', 'LJ12EKR24J4705156', '', '2020-01-01', 'TA', '31791415', 1, 0, '', ' GASOLINA', 0, '2017-12-02', 'no', '0000-00-00', '1590'),
('041', 'VNA463', 2010, 'AUTOMOVIL', 1, 'ATOS PRIME GL', 'HATCH BACK', 'G4HCAM951939', 'MALAB51GAAM507110', '', '2020-01-01', 'TA', '16354191', 1, 0, '', 'GAS GASOL', 0, '2017-07-27', NULL, '0000-00-00', '1000'),
('048', 'VNC034', 2009, 'AUTOMOVIL', 1, 'ACCENT GLS', 'SEDAN', 'G4EE8174293', 'KMHCN41AP9U304716', '', '2019-09-23', 'TA', '20576619', 1, 0, '', 'GAS GASOL', 0, '2019-09-23', 'no', '0000-00-00', '1399'),
('049', 'VNA338', 1987, 'AUTOMOVIL', 4, 'SIN LINEA', 'SEDAN ', 'M407377', 'G00705', '', '2020-01-01', 'TA', '16358436', 1, 0, '', 'GASOLINA ', 0, '2017-07-27', NULL, '0000-00-00', '1300'),
('054', 'VNA562', 2013, 'AUTOMOVIL', 3, 'TAXI 7:24', 'HATCH BACK', 'B10S1843066KC2', '9GAMM6100DB000348', '', '2020-01-01', 'TA', '16270841', 1, 0, '', 'GAS  GASOL', 0, '2017-07-27', NULL, '0000-00-00', '995'),
('056', 'SQF902', 2019, 'AUTOMOVIL', 6, 'PICANTO EKXLOTAXI ', 'HATCH BACK', 'G4LAJP000606', 'KNAB251AKT217900', '', '2020-01-01', 'TA', '16361756', 1, 0, '', 'GASOLINA', 0, '2017-07-27', NULL, '0000-00-00', '1248'),
('063', 'VNB969', 2008, 'AUTOMOVIL', 3, 'TAXI POWER', 'SEDAN', '7H0010657', '9BGSE19N08B130854', '', '2020-01-01', 'TA', '79305185', 1, 0, '', 'GASOLINA', 0, '2017-07-27', NULL, '0000-00-00', '1600'),
('065', 'SQG009', 2020, 'AUTOMOVIL', 1, 'GRAND I 10', 'SEDAN', 'G4LAKM474864', 'MALA741CALM394871', '', '2020-01-01', 'TA', '1057410232', 1, 0, '', 'GASOLINA', 0, '2017-10-26', NULL, '0000-00-00', '1248'),
('071', 'SQF709', 2015, 'AUTOMOVIL', 6, 'RIO LS', 'SEDAN', 'A5D410390', '8LCDC2232FE038915', '', '2020-01-01', 'TA', '38795926', 1, 0, '', 'GAS GASOL', 0, '2017-07-27', NULL, '0000-00-00', '1493'),
('073', 'VNA571', 2013, 'AUTOMOVIL', 3, 'TAXI 7 24', 'HATCHBACK', 'B10S185762KC2', '9GAMM6104DB009604', '', '2014-10-27', 'TA', '31199542', 1, 0, '', 'GASGASOL', 0, '2021-09-01', NULL, '2020-09-15', '995'),
('075', 'VNB996', 2008, 'AUTOMOVIL', 6, 'EKO TAXI', 'HATCH BACK', 'G4HG8374948', 'KNABA24328T562391', '', '2020-01-01', 'TA', '14802204', 1, 0, '', 'GASOLINA ', 0, '2017-07-27', NULL, '0000-00-00', '1100'),
('080', 'VNA 458', 2011, 'AUTOMOVIL', 1, 'ATOS PRIME GL', 'HATCH BACK', 'G4HCAM092226', 'MALAB51GABM575382', '', '2020-01-01', 'TA', '16369072', 1, 0, '', 'GASOLINA', 0, '2017-07-27', 'no', '0000-00-00', '1000'),
('085', 'SQF523', 2015, 'AUTOMOVOL', 6, 'PICANTO EKOTAXI', 'HATCH BACK', 'G4LAEP067830', 'KNABE512AFT843093', '', '2020-01-01', 'TA', '16347636', 1, 0, '', 'GAS GASOL', 0, '2017-07-27', NULL, '0000-00-00', '1248'),
('087', 'VNC006', 2009, 'AUTOMOVIL', 6, 'RIO RS', 'SEDAN ', 'A5D378417', '8LCDC22329E008044', '', '2020-01-01', 'TA', '29141890', 1, 0, '', 'GAS GASOLINA', 0, '2017-07-27', NULL, '0000-00-00', '1493'),
('096', 'VNB469', 1998, 'AUTOMOVIL', 7, 'CIELO BX', 'SEDAN', 'G15MF692374B', 'KLATF19Y1WB211908', '', '2020-01-01', 'TA', '4442638', 1, 0, '', 'GAS GASOL', 0, '2017-07-27', NULL, '0000-00-00', '1498'),
('097', 'VNC023', 2009, 'AUTOMOVIL', 1, 'ATOS PRIME GL', 'HATCH BACK', 'G4HC8M510350', 'MALAB51GP9M319825', '', '2020-01-01', 'TA', '31197273', 1, 0, '', 'GAS GASOLINA ', 0, '2017-07-27', NULL, '0000-00-00', '999'),
('101', 'SQF 557', 2015, 'AUTOMOVIL ', 3, 'TAXI 7:24', 'HATCH BACK', 'B10S1142320141', '9GAMM6100FB035684', '', '2020-01-01', 'TA', '94394984', 1, 0, '', 'GAS GASOL', 0, '2017-07-27', 'no', '0000-00-00', '995'),
('102', 'VNA560', 2012, 'AUTOMOVIL', 1, 'ATOS PRIME GL', 'HATCH BACK', 'G4HGBM360237', 'MALAB51HACM715571', '', '2020-01-01', 'TA', '31794715', 1, 0, '', 'GAS GASOL', 0, '2017-07-27', NULL, '0000-00-00', '1086'),
('103', 'SQF624', 2014, 'AUTOMOVIL', 6, 'CK 1.3 GS', 'SEDAN', 'MR479QD1N267601', 'L6T7524S0EN000518', '', '2020-07-29', 'TA', '94386566', 1, 0, '', 'GAS GASOLINA', 0, '2020-07-29', NULL, '0000-00-00', '1342'),
('108', 'SQF 625', 2014, 'AUTOMOVIL', 3, 'TAXI 7:24', 'HATCH BACK', 'B10S1085672KD2', '9GAMM610XEB023377', '', '2020-01-01', 'TA', '31198246', 1, 0, '', 'GASOLINA', 0, '2017-07-27', NULL, '0000-00-00', '995'),
('109', 'SQF886', 2018, 'AUTOMOVIL', 1, 'GRAND I10 1.25 GLS MT', 'SEDAN', 'G4LAHM579792', 'MALA741CAJM280985', '', '2020-01-01', 'TA', '1116250170', 1, 0, '', 'GASOLINA', 0, '2018-05-11', NULL, NULL, '1248'),
('110', 'SQF542', 2015, 'AUTOMOVIL', 1, 'I 10 GL', 'HATCH BACK', 'G4HGDM782952', 'MALAM51BAFM546163', '', '2020-12-10', 'TA', '16359071', 1, 0, '', 'GASGASOL', 0, '2020-12-10', NULL, NULL, '1086'),
('112', 'VNB 941', 2007, 'AUTOMOVIL', 6, 'PICANTO', 'HATCH BACK', 'G4HG6219666', 'KNABA24327T407185', '', '2020-01-01', 'TA', '6429968', 1, 0, '', 'GASOLINA', 0, '2018-05-30', NULL, NULL, '1100'),
('113', 'SQF494', 2015, 'AUTOMOVIL', 6, 'PICANTO EKOTAXI', 'HATCH BACK', 'G3LAEP021856', 'KNABE511AFT768064', '', '2020-01-01', 'TA', '6277179', 1, 0, '', 'GASOLINA ', 0, '2017-07-27', NULL, '0000-00-00', '998'),
('114', 'SQF545', 2015, 'AUTOMOVIL', 1, 'i 10 GL', 'HATCH BACK', 'G4HGD768523', 'MALAM51BAFM533297', '', '2020-01-01', 'TA', '94365239', 1, 0, '', 'GAS GASOLINA ', 0, '2017-07-27', NULL, '0000-00-00', '1086'),
('122', 'SQF672', 2016, 'AUTOMOVIL', 1, 'GRAND I10', 'SEDAN', 'G4LAFM658648', 'MALA741CAGM103126', '', '2019-09-16', 'TA', '16367978', 1, 0, '', 'GAS GASOL', 0, '2019-09-16', NULL, '0000-00-00', '1248'),
('128', 'SQF443', 2014, 'AUTOMOVIL', 3, 'TAXI 7:24', 'HATCH BACK', 'B10S1097142KD2', '9GAMM6100EB026613', '', '2020-01-01', 'TA', '16353660', 1, 0, '', 'GAS GASOLI', 0, '2017-07-27', NULL, '0000-00-00', '995'),
('132', 'SQF870', 2018, 'AUTOMOVIL', 1, 'GRAND I10 1.25 GLS MT', 'SEDAN', 'G4LAHM577899', 'MALA741CAJM280724', '', '2020-01-01', 'TA', '31791676', 1, 0, '', 'GASOLINA', 0, '2017-07-27', NULL, '0000-00-00', '1248'),
('140', 'SQF871', 2017, 'AUTOMOVIL', 6, 'PICANTO', 'HATCHBACK', 'G4LAGP139087', 'KNABE512AHT444321', '', '2019-10-11', 'TA', '94451561', 1, 0, '', 'GASOLINA', 0, '2019-10-11', NULL, '0000-00-00', '1248'),
('145', 'VNB948', 2008, 'AUTOMOVIL', 1, 'ATOS PRIME GL', 'HATCH BACK', 'G4HC7M062584', 'MALAB51GP8M052894', '', '2020-01-01', 'TA', '1116236030', 1, 0, '', 'GAS GASOLINA ', 0, '2017-07-27', NULL, '0000-00-00', '999'),
('154', 'VNA471', 2011, 'AUTOMOVIL', 3, 'TAXI 7:24', 'SEDAN ', 'B10S1560221KC2', '9GAMM6106BB018558', '', '2020-01-01', 'TA', '66675130', 1, 0, '', 'GAS GASOL', 0, '2017-07-27', NULL, '0000-00-00', '995'),
('157', 'VNA566', 2013, 'AUTOMOVIL', 1, 'I 10GL', 'HATCH BACK', 'G4HGCM515841', 'MALAM51BADM194524', '', '2019-07-27', 'TA', '66727098', 1, 0, '', 'GAS GASOL', 0, '2020-07-27', NULL, '0000-00-00', '1086'),
('158', 'VNC094', 2010, 'AUTOMOVIL', 3, 'TAXI 7:24', 'SEDAN ', 'B10S1433603KC2', '9GAMM6105AB000373', '', '2020-01-01', 'TA', '1112102563', 1, 0, '', 'GASOLINA ', 0, '2017-07-27', NULL, '0000-00-00', '995'),
('161', 'SQF817', 2015, 'AUTOMOVIL', 14, 'VOLEEX C30', 'SEDAN', 'GW4G151401120428', 'LGWEE2K53FE613485', '', '2019-09-16', 'TA', '29331054', 1, 0, '', 'GASOLINA', 0, '2019-09-16', NULL, '0000-00-00', '1497'),
('164', 'VNA465', 2011, 'AUTOMOVIL', 1, 'ATOS PRIME GL', 'HATCH BACK', 'G4HCAM110709', 'MALAB51GABM584269', '', '2020-01-01', 'TA', '31189498', 1, 0, '', 'GASOLINA ', 0, '2017-07-27', 'no', '0000-00-00', '1000'),
('167', 'VNC056', 2010, 'AUTOMOVIL', 1, 'ATOS PRIME GL', 'HATCH BACK', 'G4HC9M753866', 'MALAB51GAAM421362', '', '2019-10-01', 'TA', '16369072', 1, 0, '', 'GAS GASOL', 0, '2019-10-01', NULL, '0000-00-00', '999'),
('175', 'VNB889', 2007, 'AUTOMOVIL', 3, 'SPARK', 'SEDAN', 'B10S1550730KA2', '9GAMM61007B002539', '', '2019-10-01', 'TA', '94395659', 1, 0, '', 'GASOLINA', 0, '2019-10-01', NULL, NULL, '1000'),
('177', 'SQF446', 2014, 'AUTOMOVIL', 3, 'TAXI ELITE', 'SEDAN ', 'DPX001040', '9GAJA6915EB024882', '', '2020-01-01', 'TA', '16346414', 1, 0, '', 'GAS GASOLINA ', 0, '2017-07-01', 'no', '0000-00-00', '1796'),
('179', 'VNA 499', 2011, 'AUTOMOVIL', 1, 'ATOS PRIME GL', 'HATCH BACK', 'G4HCAM162027', 'MALAB51GABM611126', '', '2020-01-01', 'TA', '66721600', 1, 0, '', 'GAS GASOL', 0, '2018-03-16', NULL, '0000-00-00', '1000'),
('183', 'SQF428', 2014, 'AUTOMOVIL', 11, 'F3 GL-I/TAXI', 'SEDAN', 'BYD473QB613001455', 'LGXC16DFXE0000304', '', '2020-01-01', 'TA', '66963003', 1, 0, '', 'GAS GASOL', 0, '2017-09-12', NULL, '0000-00-00', '1488'),
('189', 'VNB 971', 2008, 'AUTOMOVIL', 3, 'SPARK', 'SEDAN', 'B10S1891651KA2', '9GAMM610X8B016031', '', '2020-01-01', 'TA', '16366645', 1, 0, '', 'GASOLINA', 0, '2017-07-27', NULL, '0000-00-00', '1000'),
('190', 'VNA446', 2011, 'AUTOMOVIL', 1, 'ATOS PRIME GL', 'HATCH BACK', 'G4HCAM080621', 'MALAB51GABM568523', '', '2020-01-01', 'TA', '66721503', 1, 0, '', 'GASOLINA ', 0, '2017-07-27', NULL, '0000-00-00', '1000'),
('192', 'VNA504', 2011, 'AUTOMOVIL', 1, 'ATOS PRIME GL', 'HATCH BACK', 'G4HCAM162393', 'MALAB51GABM613955', '', '2020-08-31', 'TA', '1116243840', 1, 0, '', 'GASOLINA', 0, '2020-08-31', NULL, '0000-00-00', '1000'),
('199', 'VNA533', 2012, 'AUTOMOVIL', 1, 'ATOS PRIME GL', 'HATCH BACK', 'G4HCBM341259', 'MALAB51GACM705890', '', '2019-02-06', 'TA', '94193416', 1, 0, '', 'GAS GASOL', 0, '2019-02-06', 'no', NULL, '1000'),
('200', 'SQF 924', 2019, 'AUTOMOVIL', 1, 'GRAND I10', 'SEDAN ', 'G4LAJM996152', 'MALA741CAKM335610', '', '2020-01-01', 'TA', '16361760', 1, 0, '', ' GASOLINA ', 0, '2017-07-27', NULL, '0000-00-00', '1248'),
('205', 'SQF 536', 2015, 'AUTOMOVIL', 6, 'PICANTO EKOTAXI', 'HATCH BACK', 'G3LAEP096307', 'KNABE511AFT858761', '', '2020-01-01', 'TA', '25349425', 1, 0, '', 'GAS GASOL', 0, '2017-07-27', NULL, '0000-00-00', '998'),
('206', 'SQF404', 2013, 'AUTOMOVIL', 1, 'i 10 GL', 'HATCH BACK', 'G4HGCM515128', 'MALAM51BADM193816', '', '2020-01-01', 'TA', '1024502988', 1, 0, '', 'GASOLINA ', 0, '2017-07-27', NULL, '0000-00-00', '1086'),
('217', 'SQF471', 2015, 'AUTOMOVIL', 4, 'CLIO EXPRESS', 'HATCH BACK', 'G728Q193823', '9FBBB8305FM643493', '', '2020-01-01', 'TA', '2515543', 1, 0, '', 'GASOLINA', 0, '2017-07-27', NULL, '0000-00-00', '1149'),
('219', 'VNA461', 2011, 'AUTOMOVIL', 1, 'ACCENT GLS', 'SEDAN ', 'G4EEA652663', 'KMHCN41AABU562441', '', '2020-01-01', 'TA', '16363242', 1, 0, '', 'GAS GASOLINA ', 0, '2017-07-27', NULL, '0000-00-00', '1399'),
('222', 'SQF887', 2018, 'AUTOMOVIL', 13, 'NEW ALTO K10', 'HATCH BACK', 'K10BN2052234', 'MA3FB42S2JA357666', '', '2020-01-01', 'TA', '1032399103', 1, 0, '', 'GASOLINA', 0, '2018-03-26', NULL, NULL, '998'),
('223', 'SQF484', 2014, 'AUTOMOVIL', 3, 'TAXI 7:24', 'HATCH BACK', 'B10S1133040089', '9GAMM6102EB039962', '', '2020-01-01', 'TA', '31794715', 1, 0, '', 'GAS GASOL', 0, '2017-07-27', NULL, '0000-00-00', '995'),
('230', 'SQF418', 2014, 'AUTOMOVIL', 3, 'TAXI 7:24', 'HATCH BACK', 'B10S1015148KD2', '9GAMM610XEB015084', '', '2020-01-01', 'TA', '14801230', 1, 0, '', 'GAS GASOLINA ', 0, '2017-11-16', NULL, '0000-00-00', '995'),
('239', 'SQF454', 2014, 'AUTOMOVIL', 6, 'PICANTO EKOTAXI', 'HATCH BACK', 'G4LADP119150', 'KNABE512AET692179', '', '2020-01-01', 'TA', '31330661', 1, 0, '', 'GAS GASOL', 0, '2018-01-25', 'no', '0000-00-00', '1248'),
('244', 'SQF808', 2017, 'AUTOMOVIL', 1, 'GRANDI10', 'SEDAN', 'G4LAGM925937', 'MALA741CAHM161094', '', '2019-09-16', 'TA', '16367978', 1, 0, '', 'GASOLINA', 0, '2019-09-16', NULL, '0000-00-00', '1248'),
('245', 'SQF547', 2016, 'AUTOMOVIL', 6, 'PICANTO EKOTAXI', 'HASHBACK', 'G4LAFP028257', 'KNABE512AGT039374', '', '2020-07-30', 'TA', '94357226', 1, 0, '', 'GASGASOLINA', 0, '2021-07-27', NULL, '0000-00-00', '999'),
('246', 'VNC029', 2009, 'AUTOMOVIL', 3, 'SPARK', 'SEDAN', 'B10S1137991KC2', '9GAMM61029B123995', '', '2019-11-21', 'TA', '94391954', 1, 0, '', 'GAS GASOL', 0, '2019-11-21', NULL, '0000-00-00', '1000'),
('247', 'SQF369', 2013, 'AUTOMOVIL', 1, 'i 10 GL', 'HATCH BACK', ' G4HGCM554752', 'MALAM51BADM248724', '', '2020-01-01', 'TA', '1116256435', 1, 0, '', 'GAS GASOL', 0, '2017-07-27', NULL, '0000-00-00', '1086'),
('253', 'VNA468', 2011, 'AUTOMOVIL', 1, 'ATOS PRIME GL', 'HATCH BACK', 'G4HCAM143585', 'MALAB51GABM601556', '', '2020-01-01', 'TA', '1116249226', 1, 0, '', 'GAS GASOL', 0, '2017-10-28', NULL, '0000-00-00', '1000'),
('254', 'SQF617', 2015, 'AUTOMOVIL', 6, 'PICANTO EKOTAXI', 'HATCH BACK', 'G3LAEP159749', 'KNABE511AFT941930', '', '2020-01-01', 'TA', '1112102171', 1, 0, '', 'GASOLINA', 0, '2017-07-27', NULL, '0000-00-00', '998'),
('258', 'VNC003', 2009, 'AUTOMOVIL', 1, 'ATOS PRIME GL', 'SEDAN', 'G4HC8M356426', 'MALAB51GP9M269440', '', '2019-10-04', 'TA', '55162861', 1, 0, '', 'GAS GASOL', 0, '2019-10-04', 'no', '0000-00-00', '999'),
('262', 'SQF344', 2013, 'AUTOMOVIL', 1, 'i 10 GL', 'HATCH BACK', 'G4HGCM467287', 'MALAM51BADM141078', '', '2019-09-17', 'TA', '16367978', 1, 0, '', 'GAS GASOL', 0, '2019-09-17', NULL, '0000-00-00', '1086'),
('263', 'SQF348', 2013, 'AUTOMOVIL', 1, 'i 10 GL', 'HATCH BACK', 'G4HGCM489489', 'MALAM51BADM161751', '', '2020-01-01', 'TA', '1116232216', 1, 0, '', 'GAS GASOL', 0, '2017-07-27', 'no', '0000-00-00', '1086'),
('271', 'SQF384', 2013, 'AUTOMOVIL', 1, 'i 10 GL', 'HATCH BACK', 'G4HGCM515845', 'MALAM51BADM194559', '', '2020-01-01', 'TA', '16363242', 1, 0, '', 'GAS GASOLINA', 0, '2017-07-27', NULL, '0000-00-00', '1086'),
('275', 'SQF864', 2018, 'AUTOMOVIL', 1, 'GRAND I10 1.25G', 'SEDAN', 'G4LAHM478524', 'MALA741CAJM263921', '', '2020-01-01', 'TA', '25158503', 1, 0, '', 'GASOLINA', 0, '2017-07-27', 'no', '0000-00-00', '1248'),
('276', 'SQF415', 2014, 'AUTOMOVIL', 3, 'TAXI 7:24', 'HATCH BACK', 'B10S1055186KD2', '9GAMM610XEB015635', '', '2020-01-01', 'TA', '31794715', 1, 0, '', 'GASOLINA', 0, '2017-07-27', NULL, '0000-00-00', '995'),
('281', 'VNA473', 2011, 'AUTOMOVIL', 1, 'ATOS PRIME GL', 'HATCH BACK', 'G4HCAM140987', 'MALAB51GABM600445', '', '2020-01-01', 'TA', '31791791', 1, 0, '', 'GASOLINA', 0, '2018-12-21', NULL, NULL, '10002019'),
('284', 'SQF845', 2016, 'AUTOMOVIL', 1, 'ACCENT', 'SEDAN', 'G4FCFU435913', 'KMHCT41DAGU051838', '', '2020-01-01', 'TA', '1116234314', 1, 0, '', 'GASOLINA ', 0, '2017-07-27', NULL, '0000-00-00', '1591'),
('290', 'SQF510', 2016, 'AUTOMOVIL', 3, 'TAXI 7:24', 'HATCH BACK', 'B10S1150320125', '9GAMM6101GB006440', '', '2020-01-01', 'TA', '94150427', 1, 0, '', 'GASOLINA', 0, '2017-07-27', NULL, '0000-00-00', '995'),
('293', 'SQF691', 2014, 'AUTOMOVIL', 9, 'HFC 7100 W', 'HATCH BACK', 'D3474446', 'LJ12EKP16E4606810', '', '2020-01-01', 'TA', '94150054', 1, 0, '', 'GASOLINA ', 0, '2017-07-27', NULL, '0000-00-00', '999'),
('296', 'VNB834', 2006, 'AUTOMOVIL', 1, 'ATOS PRIME GL', 'SEDAN ', 'G4HC5M665314', 'MALAB51GP6M731807', '', '2020-01-01', 'TA', '38800042', 1, 0, '', 'GAS GASOLINA ', 0, '2017-07-27', NULL, '0000-00-00', '999'),
('297', 'VNB 665', 2002, 'AUTOMOVIL', 1, 'SUPER PONY', 'SEDAN', 'G4EB1105595', 'KMHCG41GP2U311235', '', '2020-01-01', 'TA', '1116240819', 1, 0, '', 'GAS GASOL', 0, '2018-03-17', NULL, '0000-00-00', '1500'),
('306', 'SQF511', 2014, 'AUTOMOVIL', 1, 'i 10 GL', 'HATCH BACK', 'g4hgdm692477', 'malam51baem445722', '', '2019-07-16', 'TA', '31194558', 1, 0, '', 'GAS GASOL', 0, '2019-07-16', NULL, NULL, '1086'),
('310', 'SQF537', 2015, 'AUTOMOVIL', 6, 'PICANTO EKOTAXI + LX', 'HATCH BACK', 'G4LAEP091783', 'KNABE512AFT879355', '', '2019-09-30', 'TA', '9845593', 1, 0, '', 'GAS GASOL', 0, '2019-09-30', NULL, '0000-00-00', '1248'),
('312', 'SQF812', 2017, 'AUTOMOVIL', 3, 'CHEVYTAXI PLUS', 'HATCH BACK', 'LCU*163133874*', '9GASA68M6HB038701', '', '2020-01-01', 'TA', '66717155', 1, 0, '', 'GASOLINA', 0, '2018-03-09', NULL, '0000-00-00', '1399'),
('315', 'VNB788', 2005, 'AUTOMOVIL', 1, 'ACCENT GL', 'HATCH BACK', 'G4EB4626872', 'KMHCG51GP5U252156', '', '2020-01-01', 'TA', '38795926', 1, 0, '', 'GASOLINA', 0, '2017-07-27', NULL, '0000-00-00', '1495'),
('318', 'SQF722', 2016, 'AUTOMOVIL', 1, 'i 10 GL', 'HATCH BACK', 'G4HGFM916404', 'MALAM51BAGM659396', '', '2020-01-01', 'TA', '1116237256', 1, 0, '', 'GASOLINA', 0, '2017-07-27', NULL, '0000-00-00', '1086'),
('320', 'VNC 009', 2008, 'AUTOMOVIL', 1, 'ACCENT GL', 'SEDAN', 'G4EE8954254', 'KMHCM41AP8U226699', '', '2020-01-01', 'TA', '27365149', 1, 0, '', 'GAS GASOLINA', 0, '2017-07-27', NULL, '0000-00-00', '1399'),
('326', 'SQF931', 2020, 'AUTOMOVIL', 6, 'PICANTO EKOTAXI + LX', 'HATCH BACK', 'G4LAKP021041', 'KNAB2512ALT473979', '', '2020-01-01', 'TA', '24995431', 1, 0, '', 'GASOLINA', 0, '2018-03-03', NULL, '0000-00-00', '1248'),
('329', 'VNB939', 2007, 'AUTOMOVIL', 1, 'ATOS PRIME GL', 'HATCH BACK', 'G4HC6M010895', 'MALAB51GP7M011888', '', '2020-10-15', 'TA', '14796177', 1, 0, '', 'GASOLINA', 0, '2020-10-15', NULL, NULL, '1000'),
('330', 'SQF766', 2017, 'AUTOMOVIL', 6, 'PICANTO EKOTAXI + LX', 'HATCH BACK', 'G4LAGP029903', 'KNABE512AHT282907', '', '2019-10-07', 'TA', '66717772', 1, 0, '', 'GASOLINA', 0, '2019-10-07', NULL, '0000-00-00', '1248'),
('333', 'VNB803', 2006, 'AUTOMOVIL', 1, 'TAXI ATOS PRIME', 'SEDAN ', 'G4HC5M512954', 'MALAB51GP6M611918', '', '2020-01-01', 'TA', '16357029', 1, 0, '', 'GAS GASOLINA', 0, '2017-07-27', NULL, '0000-00-00', '999'),
('335', 'VNB785', 2005, 'AUTOMOVIL', 1, 'ACCENT GL', 'HATCH BACK', 'G4EB4626401', 'KMHCG51GP5U252089', '', '2020-01-01', 'TA', '6490785', 1, 0, '', 'GAS GASOLINA', 0, '2017-07-27', NULL, '0000-00-00', '1495'),
('337', 'SQF508', 2014, 'AUTOMOVIL', 1, 'i 10 GL', 'HATCH BACK', 'G4HGDM754157', 'MALAM51BAEM520443', '', '2020-01-01', 'TA', '94388482', 1, 0, '', 'GAS GASOL', 0, '2017-07-07', NULL, '0000-00-00', '1086'),
('338', 'VNB828', 2006, 'AUTOMOVIL', 1, 'ACCENT GLS', 'HATCH BACK', 'G4EB5799145', 'KMHCH51GP6U286427', '', '2020-01-01', 'TA', '66714665', 1, 0, '', 'GASOLINA', 0, '2017-07-27', NULL, '0000-00-00', '1495'),
('339', 'VNA415', 2010, 'AUTOMOVIL', 1, 'ATOS PRIME GL', 'HATCH BACK', 'G4HCAM951956', 'MALAB51GAAM507233', '', '2020-01-01', 'TA', '66720080', 1, 0, '', 'GAS GASOL', 0, '2017-07-27', NULL, '0000-00-00', '1000'),
('348', 'SQF976', 2020, 'AUTOMOVIL', 6, 'PICANTO EKOTAXI LX', 'HATCH BACK', 'G4LAKP092437', 'KNAB2512ALT600743', '', '2020-01-01', 'TA', '4472655', 1, 0, '', 'GASOLINA', 0, '2017-12-28', NULL, NULL, '1248'),
('350', 'VNB859', 2006, 'AUTOMOVIL', 1, 'ATOS GL', 'SEDAN ', 'GAHC5M698692', 'MALAB51GP6M757137', '', '2020-01-01', 'TA', '16351168', 1, 0, '', 'GASOLINA', 0, '2017-07-27', NULL, '0000-00-00', '999'),
('352', 'VNB809', 2006, 'AUTOMOVIL', 1, 'ATOS PRIME GL', 'HATCH BACK', 'G4HC5M531439', 'MALAB51GP6M625349', '', '2020-01-01', 'TA', '16359543', 1, 0, '', 'GASOLINA', 0, '2017-07-27', NULL, '0000-00-00', '999'),
('355', 'VNC035', 2009, 'AUTOMOVIL', 1, 'TAXI ATOS PRIME', 'HATCH BACK', 'G4HC8M493233', 'MALAB51GP9M320218', '', '2020-01-01', 'TA', '66713382', 1, 0, '', 'GAS GASOLINA', 0, '2018-04-11', NULL, '0000-00-00', '999'),
('356', 'SQF905', 2019, 'AUTOMOVIL', 6, 'NEW SOUL SUPER EKO TX', 'HATCH BACK', 'G4FGGH834527', 'KNAJN811AK7014424', '', '2020-02-28', 'TA', '31471008', 1, 0, '', 'GASOLINA', 0, '2020-02-28', NULL, NULL, '1591'),
('359', 'VNC064', 2010, 'AUTOMOVIL', 1, 'ATOS PRIME GL', 'HATCH BACK', 'G4HC9M826517', 'MALAB51GAAM446027', '', '2020-01-01', 'TA', '14953603', 1, 0, '', 'GAS GASOL', 0, '2017-07-27', NULL, '0000-00-00', '999'),
('360', 'VNC022', 2009, 'AUTOMOVIL', 1, 'ATOS PRIME GL', 'HATCH BACK', 'G4HC8M412198', 'MALAB51GP9M284635', '', '2020-01-01', 'TA', '31198668', 1, 0, '', 'GAS GASOL', 0, '2018-02-01', NULL, '0000-00-00', '999'),
('362', 'VNB893', 2007, 'AUTOMOVIL', 1, 'ATOS PRIME GL', 'HATCH BACK', 'G4HC6M831678', 'MALAB51GP7M864855', '', '2020-01-01', 'TA', '16352898', 1, 0, '', 'GAS GASOLINA ', 0, '2017-07-27', NULL, '0000-00-00', '1000'),
('364', 'SQF364', 2013, 'AUTOMOVIL', 1, 'I10GL', 'HACHBACK', 'G4HGCM489824', 'MALAM51BADM162613', '', '2020-07-01', 'TA', '94394297', 1, 0, '', 'GASOLINA', 0, '2020-06-24', NULL, NULL, '999'),
('367', 'SQF910', 2019, 'AUTOMOVIL', 1, 'GRAND i10', 'SEDAN', 'G4LAJM155684', 'MALA741CAKM361247', '', '2020-06-04', 'TA', '6558617', 1, 0, '', 'GASOLINA', 0, '2020-06-04', NULL, NULL, ''),
('369', 'SQF442', 2014, 'AUTOMOVIL', 6, 'RIO LS', 'SEDAN', 'A5D407246', '8LCDC2231EE033834', '', '2020-01-01', 'TA', '10081500', 1, 0, '', 'GASOLINA ', 0, '2017-07-27', NULL, '0000-00-00', '1493'),
('371', 'SQF360', 2013, 'AUTOMOVIL', 1, 'i 10 GL', 'HATCH BACK', 'G4HGCM491992', 'MALAM51BADM165500', '', '2020-01-01', 'TA', '31202152', 1, 0, '', 'GAS GASOL', 0, '2017-07-27', NULL, '0000-00-00', '1086'),
('376', 'VNA439', 2011, 'AUTOMOVIL', 1, 'ATOS PRIME GL', 'HATCH BACK', 'G4HCAM042402', 'MALAB51GABM549747', '', '2020-10-06', 'TA', '66720080', 1, 0, '', 'GAS GASOL', 0, '2020-10-06', 'no', '0000-00-00', '1000'),
('379', 'VNB903', 2007, 'AUTOMOVIL', 1, 'ATOS PRIME GL', 'HATCH BACK', 'G4HC6M903043', 'MALAB51GP7M923825', '', '2020-01-01', 'TA', '94366373', 1, 0, '', 'GASOLINA', 0, '2017-07-27', NULL, '0000-00-00', '999'),
('383', 'SQF473', 2014, 'AUTOVIL', 1, 'i 10 GL', 'HATCH BACK', 'G4HGDM739519', 'MALAM51BAEM503797', '', '2020-01-01', 'TA', '6462730', 1, 0, '', 'GAS GASOLINA ', 0, '2017-07-27', NULL, '0000-00-00', '1086'),
('387', 'VNA736', 1992, 'AUTOMOVIL', 2, '323 NB', 'SEDAN', 'E3311182', '323NT305701', '', '2020-01-01', 'TA', '94153714', 1, 0, '', 'GNV', 0, '2018-03-22', NULL, '0000-00-00', '1498'),
('390', 'VNC049', 2009, 'AUTOMOVIL', 1, 'ATOS PRIME GL', 'SEDAN', 'G4HC8M657392', 'MALAB51GP9M380672', '', '2020-01-01', 'TA', '94193416', 1, 0, '', 'DIESEL', 0, '2017-07-27', NULL, '0000-00-00', ''),
('395', 'VNA 508', 2011, 'AUTOMOVIL', 1, 'ATOS PRIME GL', 'HATCH BACK', 'G4HCAM162416', 'MALAB51GABM613947', '', '2020-01-01', 'TA', '16369072', 1, 0, '', 'GASOLINA', 0, '2017-07-27', NULL, '0000-00-00', '1000'),
('397', 'VNB692', 2003, 'AUTOMOVIL', 2, '323', 'SEDAN ', 'B3885986', '9FCBT42B430003637', '', '2020-01-01', 'TA', '1116280014', 1, 0, '', 'GAS GASOL', 0, '2017-07-27', NULL, '0000-00-00', '1324'),
('398', 'SQF600', 2015, 'AUTOMOVIL', 6, 'PICANTO EKOTAXI', 'HATCH BACK', 'G3LAEP166332', 'KNABE511AFT952369', '', '2020-01-01', 'TA', '24347496', 1, 0, '24347496', 'GASOLINA', 0, '2019-08-01', NULL, NULL, '998'),
('399', 'SQF496', 2014, 'AUTOMOVIL', 6, 'PICANTO EKOTAXI', 'HATCH BACK', 'G4LADP118578', 'KNABE512AET693383', '', '2020-01-01', 'TA', '29603641', 1, 0, '', 'GAS GASOL', 0, '2018-01-30', NULL, NULL, '1248'),
('401', 'SQF436', 2014, 'AUTOMOVIL', 1, 'i 10 GL', 'HATCH BACK', 'G4HGDM629993', 'MALAM51BAEM360581', '', '2020-01-01', 'TA', '1116239940', 1, 0, '', 'GAS GASOL', 0, '2017-07-27', NULL, '0000-00-00', '1086'),
('404', 'SQF925', 2019, 'AUTOMOVIL', 6, 'GRAND EKOTAXI', 'HATCH BACK', 'G4LAJP101982', 'KNAB2512AKT396877', '', '2020-01-01', 'TA', '66713393', 1, 0, '', 'GASOLINA', 0, '2019-01-09', NULL, NULL, '1248'),
('406', 'VNB928', 2007, 'AUTOMOVIL', 4, 'CITIUS', 'SEDAN', 'A712Q036785', '9FBLBOLCF7M402626', '', '2020-01-01', 'TA', '1116252426', 1, 0, '', 'GAS GASOL', 0, '2017-07-27', NULL, '0000-00-00', '1400'),
('410', 'SQF343', 2013, 'AUTOMOVIL', 1, 'i 10 GL', 'HATCH BACK', 'G4HGCM452645', 'MALAM51BADM118992', '', '2019-09-30', 'TA', '9870176', 1, 0, '', 'GAS GASOL', 0, '2019-09-30', NULL, '0000-00-00', '1086'),
('413', 'VNC048', 2009, 'AUTOMOVIL', 3, 'TAXI 7:24', 'SEDAN', 'B10S1195627KC2', '9GAMM61069B165151', '', '2020-01-01', 'TA', '14799476', 1, 0, '', 'GAS GASOL', 0, '2017-07-27', NULL, '0000-00-00', '1000'),
('414', 'SQF716', 2015, 'AUTOMOVIL', 11, 'F3 GL-I/TAXI', 'SEDAN ', 'BYD473QE214079561', 'LGXC16DF3F0002171', '', '2020-01-01', 'TA', '22002861', 1, 0, '', 'GASOLINA ', 0, '2017-07-27', NULL, '0000-00-00', '1497'),
('421', 'VNB959', 2008, 'AUTOMOVIL', 3, 'SPARK', 'SEDAN', 'B10S1795464KA2', '9GAMM61078B013944', '', '2020-01-01', 'TA', '29809591', 1, 0, '', 'GASOLINA ', 0, '2017-07-27', NULL, '0000-00-00', '1000'),
('422', 'VNC 050', 2010, 'AUTOMOVIL', 3, 'TAXI 7:24', 'SEDAN', 'B10S1228100KC2', '9GAMM6105AB169213', '', '2020-01-01', 'TA', '16359543', 1, 0, '', 'GASOLINA', 0, '2018-07-27', NULL, '0000-00-00', '1000'),
('425', 'VNC 039', 2009, 'AUTOMOVIL', 3, 'SPARK', 'SEDAN', 'B10S1188659KC2', '9GAMM61069B160192', '', '2020-01-01', 'TA', '94394409', 1, 0, '', 'GAS GASOL', 0, '2017-07-27', NULL, '0000-00-00', '1000'),
('426', 'SQF467', 2014, 'AUTOMOVIL', 11, 'F3 GL-I/TAXI', 'SEDAN', 'BYD473QE213394145', 'LGXC16DF2E0001270', '', '2020-01-01', 'TA', '16366459', 1, 0, '', 'GAS GASOL', 0, '2017-07-27', NULL, '0000-00-00', '1497'),
('427', 'SQF466', 2014, 'AUTOMOVIL', 6, 'PICANTO EKOTAXI + LX', 'HATCH BACK', 'G3LADP158370', 'KNABE511AET686351', '', '2019-11-13', 'TA', '31791676', 1, 0, '', 'GASOLINA', 0, '2019-11-13', NULL, NULL, '998'),
('430', 'SQF356', 2013, 'AUTOMOVIL', 1, 'i 10 GL', 'HATCH BACK', 'G4HGCM478881', 'MALAM51BADM151327', '', '2020-01-01', 'TA', '66720657', 1, 0, '', 'GAS GASOL', 0, '2017-07-27', NULL, '0000-00-00', '1086'),
('432', 'VNB954', 2008, 'AUTOMOVIL', 3, 'SPARK LOCAL', 'SEDAN ', 'B10S1778501KA2', '9GAMM61048B013190', '', '2020-01-01', 'TA', '94385804', 1, 0, '', 'GAS GASOLINA ', 0, '2017-07-27', NULL, '0000-00-00', '1000'),
('433', 'SQF834', 2017, 'AUTOMOVIL', 3, 'CHEVYTAXI PLUS', 'HATCH BACK', 'LCU*163483991*', '9GASA68M9HB041009', '', '2020-02-07', 'TA', '1116253412', 1, 0, '', 'GASOLINA', 0, '2020-02-07', NULL, NULL, '1399'),
('435', 'VNB997', 2008, 'AUTOMOVIL', 1, 'ATOS PRIME GL', 'HATCH BACK', 'G4HC7M314705', 'MALAB51GP8M245524', '', '2019-09-02', 'TA', '94367256', 1, 0, '', 'GAS GASOL', 0, '2019-09-02', NULL, '0000-00-00', '999'),
('442', 'SQF927', 2019, 'AUTOMOVIL', 6, 'PICANTO EKOTAXI + LX', 'HATCH BACK', 'G4LAJP118320', 'KNAB2512AKT418398', '', '2020-01-01', 'TA', '16369081', 1, 0, '', 'GASOLINA ', 0, '2018-11-15', NULL, NULL, '1248'),
('445', 'SQF865', 2018, 'AUTOMOVIL', 1, 'GRAND I10', 'SEDAN', 'G4LAHM577873', 'MALA741CAJM280723', '', '2020-01-01', 'TA', '6433114', 1, 0, '', 'GASOLINA', 0, '2018-01-10', 'no', NULL, '1248'),
('446', 'SQF449', 2014, 'AUTOMOVIL', 6, 'PICANTO EKOTAXI', 'HATCH BACK', 'G4LADP108248', 'KNABE512AET674766', '', '2020-01-01', 'TA', '1116244934', 1, 0, '', 'GAS GASOL', 0, '2017-07-27', 'no', '0000-00-00', '1248'),
('447', 'VNC027', 2009, 'AUTOMOVIL', 1, 'ATOS PRIME GL', 'HATCH BACK', 'G4HC8M510399', 'MALAB51GP9M319826', '', '2020-01-01', 'TA', '6429968', 1, 0, '', 'GAS GASOL', 0, '2018-03-03', 'no', '0000-00-00', '999'),
('452', 'SQF 575', 2015, 'AUTOMOVIL', 6, 'PICANTO EKOTAXI', 'HATCH BACK', 'G4LAEP115147', 'KNABE512AFT929458', '', '2020-01-01', 'TA', '14796177', 1, 0, '', 'GAS GASOL', 0, '2017-11-18', 'no', '0000-00-00', '1248'),
('460', 'VNC057', 2009, 'AUTOMOVIL', 4, 'SYMBOL CITIUS', 'SEDAN', 'A712Q042474', '9FBLB0LCD9M003814', '', '2020-01-01', 'TA', '16361856', 1, 0, '', 'GAS GASOL', 0, '2017-07-27', NULL, '0000-00-00', '1390'),
('461', 'SQF911', 2019, 'AUTOMOVIL', 1, 'GRAND I10', 'SEDAN', 'G4LAJM152840', 'MALA741CAKM361056', '', '2019-07-27', 'TA', '38795926', 1, 0, '', 'GASOLINA', 0, '2019-07-27', NULL, NULL, '1248'),
('467', 'VNB967', 2008, 'AUTOMOVIL', 1, 'ATOS PRIME GL', 'HATCH BACK', 'G4HC7M191000', 'MALAB51GP8M151789', '', '2019-10-07', 'TA', '16883057', 1, 0, '', 'GAS GASOL', 0, '2019-10-07', NULL, '0000-00-00', '999'),
('471', 'VNC091', 2010, 'AUTOMOVIL', 1, 'ATOS PRIME GL', 'SEDAN ', 'G4HC9M910198', 'MALAB51GAAM487387', '', '2020-01-01', 'TA', '6499807', 1, 0, '', 'GAS GASOLINA ', 0, '2017-07-29', NULL, '0000-00-00', '999'),
('478', 'VNB940', 2007, 'AUTOMOVIL', 3, 'SPARK', 'SEDAN', 'B10S1748294KA2', '9GAMM61007B011824', '', '2020-01-01', 'TA', '94366846', 1, 0, '', 'GASOLINA', 0, '2017-07-29', NULL, '0000-00-00', '1000'),
('481', 'VNB779', 2005, 'AUTOMOVIL', 3, 'TAXI 7:24', 'SEDAN ', 'B10S1118649KA2', 'KL1MJ61055C053354', '', '2020-01-01', 'TA', '16366698', 1, 0, '', 'GASOLINA ', 0, '2017-07-27', NULL, '0000-00-00', '1000'),
('484', 'SQF885', 2018, 'AUTOMOVIL', 6, 'PICANTO EKOTAXI', 'HATCH BACK', 'G4LAHP116570', 'KNAB2512AJT188574', '', '2020-01-01', 'TA', '17325703', 1, 0, '', 'GASOLINA', 0, '2017-07-27', NULL, '0000-00-00', '1248'),
('485', 'VNB843', 2006, 'AUTOMOVIL', 1, 'ATOS PRIME GL', 'HATCH BACK', 'G4HC5M680002', 'MALAB51GP6M742545', '', '2020-01-01', 'TA', '94391120', 1, 0, '', 'GASOLINA', 0, '2018-01-07', NULL, '0000-00-00', '999'),
('486', 'VNB826', 2006, 'AUTOMOVIL', 1, 'ACCENT GL', 'SEDAN', 'G4EA5759619', 'KMHCG51FP6U279287', '', '2019-10-10', 'TA', '66678695', 1, 0, '', 'GAS GASOL', 0, '2019-10-10', NULL, '0000-00-00', '1341'),
('487', 'SQF877', 2018, 'AUTOMOVIL', 1, 'GRAND I10', 'SEDAN', 'G4LAHM574517', 'MALA741CAJM279865', '', '2020-07-27', 'TA', '16359071', 1, 0, '', 'GAS-GASOLINA', 0, '2021-07-27', NULL, NULL, '1248'),
('488', 'VNC093', 2010, 'AUTOMOVIL', 1, 'ATOS PRIME GL', 'HATCH BACK', 'G4HC9M865455', 'MALAB51GAAM464465', '', '2019-10-04', 'TA', '94150321', 1, 0, '', 'GASOLINA', 0, '2019-10-04', NULL, '0000-00-00', '999'),
('489', 'VNA434', 2011, 'AUTOMOVIL', 3, 'TAXI 7:24', 'HATCH BACK', 'B10S1663035KC2', '9GAMM6109BB060304', '', '2020-01-01', 'TA', '15988656', 1, 0, '', 'GAS GASOLINA ', 0, '2018-04-28', NULL, '0000-00-00', '995'),
('490', 'SQF758', 2017, 'AUTOMOVIL', 3, 'CHEVYTAXI PLUS', 'HATCH BACK', 'LCU*152510431*', '9GASA68MXHB000145', '', '2020-01-01', 'TA', 'AAD346229', 1, 0, '', 'GASOLINA', 0, '2017-07-27', NULL, '0000-00-00', '1399'),
('494', 'SQF726', 2015, 'AUTOMOVIL', 6, 'RIO  LS', 'SEDAN', 'A5D409629', '8LCD2234FE039242', '', '2020-01-01', 'TA', '29861550', 1, 0, '', 'GASOLINA', 0, '2017-07-27', NULL, '0000-00-00', '1493'),
('504', 'SQF973', 2020, 'AUTOMOVIL', 6, 'PICANTO EKOTAXI', 'HATCH BACK', 'G4LAKP102644', 'KNAB2512ALT613786', '', '2020-01-01', 'TA', '94451561', 1, 0, '', 'GASOLINA ', 0, '2017-07-27', 'no', '0000-00-00', '1248'),
('505', 'SQF627', 2016, 'AUTOMOVIL', 6, 'PICANTO EKOTAXI', 'HATCH BACK', 'G4LAFP028274', 'KNABE512AGT038522', '', '2020-01-01', 'TA', '94150845', 1, 0, '', 'GASOLINA', 0, '2017-07-27', 'no', '0000-00-00', '1248'),
('508', 'SQF551', 2015, 'AUTOMOVIL', 1, 'i 10 GL', 'HATCH BACK', 'G4HGEM784434', 'MALAM51BAFM546677', '', '2020-01-01', 'TA', '38856105', 1, 0, '', 'GAS GASOL', 0, '2017-07-27', 'no', '0000-00-00', '1086'),
('511', 'VNC038', 2009, 'AUTOMOVIL', 1, 'ACCENT GLS', 'SEDAN', 'G4EE8171735', 'KMHCN41AP9U305226', '', '2020-01-01', 'TA', '16359071', 1, 0, '', 'GAS GASOL', 0, '2017-07-27', 'no', '0000-00-00', '1399'),
('516', 'VNB865', 2007, 'AUTOMOVIL', 3, 'SPARK', 'SEDAN ', 'B10S1462214KA2', '9GAMM610X7B001138', '', '2020-01-01', 'TA', '94393280', 1, 0, '', 'GASOLINA ', 0, '2017-07-27', 'no', '0000-00-00', '1000'),
('521', 'SQF498', 2014, 'AUTOMOVIL', 11, 'F3 GL-I/TAXI', 'SEDAN', 'BYD473QE213410168', 'LGXC16DF3E0003626', '', '2020-01-01', 'TA', '16344097', 1, 0, '', 'GAS GASOL', 0, '2017-07-27', NULL, '0000-00-00', '1497'),
('526', 'VNB 778', 2005, 'AUTOMOVIL', 1, 'ACCENT NEXT', 'SEDAN', 'G4EK4512551', '8X1VF21NP5Y300137', '', '2020-01-01', 'TA', '1116234543', 1, 0, '', 'GAS GASOL', 0, '2017-07-27', NULL, '0000-00-00', '1500'),
('527', 'SQF702', 2016, 'AUTOMOVIL', 1, 'GRAND I 10', 'SEDAN', 'G4LAFM821498', 'MALA741CAGM139485', '', '2020-01-01', 'TA', '1112099110', 1, 0, '', 'GASOLINA', 0, '2017-06-02', NULL, NULL, '1248'),
('529', 'SQF 751', 2017, 'AUTOMOVIL ', 6, 'PICANTO EKOTAXI', 'HATCH BACK', 'G4LAGP002645', 'KNABE512AHT24450', '', '2020-01-01', 'TA', '66727098', 1, 0, '', 'GASOLINA', 0, '2017-07-26', NULL, '0000-00-00', '1248'),
('530', 'SQF512', 2015, 'AUTOMOVIL', 6, 'PICANTO EKOTAXI', 'HATCH BACK', 'G3LAEP021863', 'KNABE511AFT768066', '', '2020-01-01', 'TA', '66723057', 1, 0, '', 'GASOLINA', 0, '2017-07-27', NULL, NULL, '998'),
('531', 'VNA569', 2011, 'AUTOMOVIL', 3, 'TAXI 7.24', 'HATCH BACK', 'B10S1641000KC2', '9GAMM6107BB052783', '', '2020-08-30', 'TA', '25055676', 1, 0, '25055676', 'GASOLINA', 0, '2020-08-30', NULL, '0000-00-00', '995'),
('538', 'VNB 453', 1998, 'AUTOMOVIL', 3, 'CHEVY TAXY', 'SEDAN', 'G13B329780', '9GAEAB35SWB747936', '', '2020-01-01', 'TA', '16358681', 1, 0, '', 'GAS GASOL', 0, '2018-04-21', 'no', '0000-00-00', '1300'),
('541', 'VNB770', 2005, 'AUTOMOVIL', 1, 'ATOS PRIME GL', 'HATCH BACK', 'G4HC4D62478', 'MALAB51GP5M481674', '', '2019-09-25', 'TA', '94395659', 1, 0, '', 'GASOLINA', 0, '2019-09-25', NULL, '0000-00-00', '999'),
('544', 'VNC065', 2010, 'AUTOMOVIL', 1, 'ATOS PRIME GL', 'SEDAN', 'G4HC9M760402', 'MALAB51GAAM423988', '', '2019-10-21', 'TA', '16352873', 1, 0, '', 'GAS GASOL', 0, '2019-10-21', NULL, '0000-00-00', '999'),
('546', 'VNA 424', 2011, 'AUTOMOVIL', 1, 'ATOS   PRIME GL', 'HATCHBACK', 'G4HCAM973732', 'MALAB51GABM517491', '', '2020-01-01', 'TA', '38794625', 1, 0, '', 'GASOLINA', 0, '2016-06-29', NULL, '0000-00-00', '1000'),
('549', 'SQF735', 2015, 'AUTOMOVIL', 15, 'LF7162E1', 'SEDAN', 'LF481Q3Y150100008', 'LLV2A3A21F0280303', '', '2020-08-11', 'TA', '2679314', 1, 0, '2679314', 'GASOLINA', 0, '2020-08-11', NULL, '0000-00-00', '1587'),
('552', 'SQF753', 2015, 'AUTOMOVIL', 14, 'VOLEEX C30', 'SEDAN', 'GW4G15 1401120427', 'LGWEE2K5XFE613483', '', '2019-10-09', 'TA', '31791676', 1, 0, '', 'GAS GASOL', 0, '2019-10-09', NULL, '0000-00-00', '1497'),
('553', 'SQF 495', 2014, 'AUTOMOVIL', 1, 'i 10 GL', 'HATCH BACK', 'G4HGDM740206', 'MALAM51BAEM505239', '', '2020-01-01', 'TA', '1116236838', 1, 0, '', 'GAS GASOL', 0, '2017-07-27', NULL, '0000-00-00', '1086'),
('557', 'SQF875', 2018, 'AUTOMOVIL', 3, 'SAIL', 'SEDAN', 'LCU172413438', '9GASA52M1JB022186', '', '2020-01-01', 'TA', '31196906', 1, 0, '', 'GASOLINA', 0, '2018-02-21', 'no', NULL, '1399'),
('561', 'VNB856', 2006, 'AUTOMOVIL', 1, 'ACCENT GL', 'SEDAN', 'G4EB5824898', 'KMHCG51GP6U289593', '', '2019-10-01', 'TA', '1116243840', 1, 0, '', 'GAS GASOL', 0, '2019-10-01', NULL, '0000-00-00', '1495'),
('562', 'SQF972', 2020, 'AUTOMOVIL', 6, 'PICANTO EKOTAXI LX', 'HATCH BACK', 'G4LAKP054492', 'KNAB2512ALT534605', '', '2019-10-11', 'TA', '94451561', 1, 0, '', 'GASOLINA', 0, '2019-10-11', NULL, NULL, ''),
('563', 'VNB981', 2008, 'AUTOMOVIL', 1, 'ATOS PRIME GL', 'HATCH BACK', 'G4HC7M298642', 'MALAB51GP8M234822', '', '2019-11-13', 'TA', '31471445', 1, 0, '', 'GASOLINA', 0, '2019-11-13', NULL, NULL, '999'),
('564', 'VNA459', 2011, 'AUTOMOVIL', 1, 'ATOS PRIME GL', 'HATCH BACK', 'G4HCAM110775', 'MALAB51GABM584713', '', '2020-01-01', 'TA', '29876653', 1, 0, '', 'GASOLINA', 0, '2017-07-27', NULL, '0000-00-00', '1000'),
('566', 'VNA428', 2010, 'AUTOMOVIL', 1, 'ATOS PRIME GL', 'HATCH BACK', 'G4HC9M827218', 'MALAB51GAAM474672', '', '2020-01-01', 'TA', '16369072', 1, 0, '', 'GASOLINA', 0, '2017-07-27', NULL, '0000-00-00', '999'),
('569', 'SQF 684', 2014, 'AUTOMOVIL', 6, 'PICANTO EKOTAXI', 'HATCH BACK', 'G3LADP004700', 'KNABE511BET490341', '', '2020-01-01', 'TA', '94301839', 1, 0, '', 'GAS GASOL', 0, '2017-07-27', NULL, '0000-00-00', '998'),
('572', 'SQF772', 2017, 'AUTOMOVIL', 3, 'CHEVYTAXI PLUS', 'HATCH BACK', 'LCU*162013734*', '9GASA68M1HB028206', '', '2020-10-22', 'TA', '4375822', 1, 0, '', 'GASOLINA', 0, '2020-10-22', NULL, '0000-00-00', '1399'),
('576', 'SQF954', 2020, 'AUTOMOVIL', 1, 'GRAND I10', 'SEDAN', 'G4LAKM284643', 'MALA741CALM372489', '', '2019-08-29', 'TA', '98431473', 1, 0, '', 'GASOLINA', 0, '2019-08-29', NULL, NULL, '1248'),
('577', 'VNB825', 2006, 'AUTOMOVIL', 3, 'TAXI 7:24', 'SEDAN', 'B10S1297335KA2', 'KL1MJ61016C126317', '', '2020-12-28', 'TA', '16363242', 1, 0, '', 'GASGASOL', 0, '2020-12-28', NULL, NULL, '1000'),
('578', 'SQF944', 2020, 'AUTOMOVIL', 3, 'CHEVY TAXI PREMIUM', 'SEDAN', 'LCU*182773047*', '9GASA52M7LB000499', '', '2020-01-01', 'TA', '94150321', 1, 0, '', 'GASOLINA', 0, '2019-07-18', NULL, NULL, '1399'),
('579', 'SQF462', 2014, 'AUTOMOVIL', 3, 'TAXI 7:24', 'HATCH BACK', 'B10S1132370118', '9GAMM6108EB031803', '', '2019-02-22', 'TA', '94451561', 1, 0, '', 'GASOLINA ', 0, '2019-02-22', NULL, NULL, '995'),
('580', 'SQF901', 2019, 'AUTOMOVIL', 6, 'GRAND EKOTAXI', 'HATCH BACK', 'G4LAJP055130', 'KNAB2512AKT312009', '', '2020-01-01', 'TA', '14799943', 1, 0, '', 'GASOLINA', 0, '2018-10-09', NULL, NULL, '1248'),
('585', 'SQF 368', 2013, 'AUTOMOVIL', 1, 'i 10 GL', 'HATCH BACK', 'G4HGCM490651', 'MALAM51BADM164050', '', '2020-01-01', 'TA', '16363242', 1, 0, '', 'GASOLINA', 0, '2017-07-27', 'no', '0000-00-00', '1086'),
('587', 'VNC071', 2010, 'AUTOMOVIL', 1, 'ATOS PRIME GL', 'HATCH BACK', 'G4HC9M827089', 'MALAB51GAAM446320', '', '2020-01-01', 'TA', '25152042', 1, 0, '', 'GAS -GASONONA', 0, '2017-07-27', 'no', '0000-00-00', '999'),
('588', 'SQF390', 2013, 'AUTOMOVIL', 1, 'i 10 GL', 'HATCH BACK', 'G4HGCM553520', 'MALAM51BADM247881', '', '2019-10-02', 'TA', '28901559', 1, 0, '', 'GASOLINA', 0, '2019-10-02', NULL, NULL, '1086'),
('596', 'VNC 008', 2009, 'AUTOMOVIL', 1, 'ATOS PRIME GL', 'HATCH BACK', 'G4HC8M382659', 'MALAB51GP9M272664', '', '2020-01-01', 'TA', '66703197', 1, 0, '', 'GASOLINA', 0, '2017-07-27', NULL, '0000-00-00', '999'),
('597', 'VNC098', 2010, 'AUTOMOVIL', 3, 'TAXI 7:24', 'SEDAN ', 'B10S1335564KC2', '9GAMM6105AB194600', '', '2020-01-01', 'TA', '72192650', 1, 0, '', 'GASOLINA ', 0, '2017-07-27', 'no', '0000-00-00', '1000'),
('600', 'SQF 747', 2016, 'AUTOMOVIL', 3, 'CHEVYTAXI', 'HATCH BACK', 'B10S1151380349', '9GAMM6105GB023533', '', '2020-01-01', 'TA', '6497993', 1, 0, '', 'GASOLINA', 0, '2017-07-14', NULL, '0000-00-00', '995'),
('601', 'SQF 685', 2016, 'AUTOMOVIL', 1, 'GRAND I10', 'SEDAN', 'G4LAFM659447', 'MALA741CAGM103390', '', '2020-01-01', 'TA', '94394241', 1, 0, '', 'GAS GASOL', 0, '2017-07-27', NULL, '0000-00-00', '1248'),
('602', 'SQG002', 2021, 'AUTOMOVIL', 6, 'SUPER VIP', 'HATCH BACK', 'G4FGLH800211', 'KNAJ281EAM7124662', '', '2020-01-01', 'TA', '16349333', 1, 0, '', 'GASOLINA', 0, '2017-07-27', NULL, '0000-00-00', '1591'),
('603', 'VNA 445', 2011, 'AUTOMOVIL', 1, 'ATOS PRIME GL', 'HATCH BACK', 'G4HCAM079871', 'MALAB51GABM568407', '', '2020-01-01', 'TA', '66729939', 1, 0, '', 'GASOLINA', 0, '2017-07-27', NULL, '0000-00-00', '1000'),
('604', 'SQF945', 2019, 'AUTOMOVIL', 1, 'GRAND I10', 'HATCH BACK', 'G4LAKM190097', 'MALA751CAKM974008', '', '2019-08-05', 'TA', '6433114', 1, 0, '', 'GASOLINA', 0, '2019-08-05', NULL, NULL, '1248'),
('608', 'SQF349', 2013, 'AUTOMOVIL', 1, 'i 10 GL', 'HATCH BACK', 'G4HGCM488818', 'MALAM51BADM161750', '', '2020-01-01', 'TA', '6485283', 1, 0, '', 'GAS GASOL', 0, '2017-07-27', NULL, '0000-00-00', '1000'),
('609', 'VNA501', 2012, 'AUTOMOVIL', 1, 'ATOS PRIME GL', 'HATCH BACK', 'G4HCBM189585', 'MALAB51GACM629689', '', '2020-01-01', 'TA', '14796177', 1, 0, '', 'GASOLINA ', 0, '2018-04-03', NULL, '0000-00-00', '1000'),
('614', 'VNB618', 2001, 'AUTOMOVIL', 1, 'ACCENT', 'SEDAN', 'G4EBYA00293', 'KMHCG51GP1U103206', '', '2020-07-24', 'TA', '31199484', 1, 0, '', 'GAS GASOLINA', 0, '2021-07-24', NULL, NULL, '1500'),
('615', 'VNB 851', 2006, 'AUTOMOVIL', 1, 'TAXI ATOS PRIME', 'HATCH BACK', 'G4HC5M684476', 'MALAB51GP6M745839', '', '2020-01-01', 'TA', '66713382', 1, 0, '', 'GASOLINA', 0, '2017-07-27', NULL, '0000-00-00', '999'),
('616', 'SQF477', 2014, 'AUTOMOVIL', 6, 'PICANTO EKOTAXI + LX', 'HATCH BACK', 'G3LADP180975', 'KNABE511AET720156', '', '2020-01-01', 'TA', '66709225', 1, 0, '', 'GAS GASOL', 0, '2018-05-10', NULL, NULL, '998'),
('619', 'SQF505', 2014, 'AUTOMOVIL', 1, 'I 10 GL', 'HATCH BACK', 'G4HGDM743895', 'MALAM51BAEM509205', '', '2019-10-22', 'TA', '6240210', 1, 0, '', 'GAS GASOLINA', 0, '2019-10-22', NULL, NULL, '1086'),
('620', 'SQF950', 2020, 'AUTOMOVIL', 1, 'GRAND I 10', 'SEDAN', 'G4LAKM256920', 'MALA741CALM369802', '', '2020-01-01', 'TA', '94152920', 1, 0, '', 'GASOLINA', 0, '2019-08-09', NULL, '0000-00-00', '1248'),
('621', 'VNA 454', 2011, 'AUTOMOVIL', 1, 'ATOS PRIME GL', 'HATCH BACK', 'G4HCAM093431', 'MALAB51GABM576181', '', '2020-01-01', 'TA', '6427193', 1, 0, '', 'GAS GASOL', 0, '2017-08-09', NULL, '0000-00-00', '1000'),
('626', 'VNB952', 2008, 'AUTOMOVIL', 4, 'SYMBOL CITIUS', 'SEDAN', 'A712Q038837', '9FBLB0LCD8M000379', '', '2020-01-01', 'TA', '1112620592', 1, 0, '', 'GAS GASOL', 0, '2017-11-01', NULL, '0000-00-00', '1400'),
('630', 'VNA455', 2010, 'AUTOMOVIL', 1, 'ATOS PRIME GL', 'HATCH BACK', 'G4HC9M901492', 'MALAB51GAAM482377', '', '2020-01-01', 'TA', '17655579', 1, 0, '', 'GAS GASOL', 0, '2017-07-27', NULL, '0000-00-00', '1000'),
('631', 'SQF946', 2020, 'AUTOMOVIL', 6, 'PICANTO EKOTAXI LX', 'HATC BACK', 'G4LAKPO53446', 'KNAB2512ALT530596', '', '2020-07-27', 'TA', '1114209115', 1, 0, '', 'GASOLINA', 0, '2020-07-28', NULL, NULL, '1.248'),
('633', 'SQF 412', 2013, 'AUTOMOVIL', 1, 'i 10 GL', 'HATCH BACK', 'G4HGCM554065', 'MALAM51BADM247930', '', '2020-01-01', 'TA', '16369072', 1, 0, '', 'GASOLINA', 0, '2017-08-09', NULL, '0000-00-00', '1086'),
('638', 'SQF558', 2015, 'AUTOMOVIL', 3, 'TAXI 7:24', 'HATCH BACK', 'B10S1142320132', '9GAMM6100FB035720', '', '2020-01-01', 'TA', '1114061320', 1, 0, '', 'GAS GASOL', 0, '2017-07-27', NULL, '0000-00-00', '995'),
('640', 'VNB984', 2008, 'AUTOMOVIL', 1, 'ATOS PRIME GL', 'HATCH BACK', 'G4HC7M298768', 'MALAB51GP8M234869', '', '2020-01-01', 'TA', '15988656', 1, 0, '', 'GAS GASOL', 0, '2017-07-27', NULL, '0000-00-00', '1000'),
('653', 'VNB989', 2008, 'AUTOMOVIL', 1, 'ATOS PRIME GL', 'HATCH BACK', 'G4HC7M314783', 'MALAB51GP8M245458', '', '2020-01-01', 'TA', '16270841', 1, 0, '', 'GAS GASOL', 0, '2017-07-27', NULL, '0000-00-00', '999'),
('654', 'SQF919', 2019, 'AUTOMOVIL', 1, 'GRAND I10 4DR 1.25 GL', 'SEDAN', 'G4LAJM012667', 'MALA741CAKM340080', '', '2019-02-28', 'TA', '66709471', 1, 0, '', 'GASOLINA', 0, '2019-02-28', NULL, NULL, '1248'),
('656', 'SQF 755', 2016, 'AUTOMOVIL ', 3, 'CHEVYTAXI', 'HATCH BACK', 'B10S1151700199', '9GAMM6107GB026921', '', '2020-01-01', 'TA', '31187388', 1, 0, '', 'HATCH BACK', 0, '2017-10-12', NULL, '0000-00-00', '995'),
('659', 'SQF982', 2020, 'AUTOMOVIL', 6, 'PICANTO EKOTAXI', 'HATCH BACK', 'G4LAKP115903', 'KNAB2512ALT635015', '', '2020-01-01', 'TA', '2659569', 1, 0, '', 'GASOLINA', 0, '2017-07-27', NULL, '0000-00-00', '1248'),
('661', 'SQF869', 2017, 'AUTOMOVIL', 8, 'TIGGO', 'HATCH BACK ', 'SQRE4G16AFGH63278', 'LVVDB11B5HD012639', '', '2020-01-01', 'TA', '40613950', 1, 0, '', 'GAS GASOL', 0, '2017-08-18', NULL, '0000-00-00', '1598'),
('663', 'VNB 272', 1997, 'AUTOMOVIL', 3, 'SWIFT', 'SEDAN', 'G13B320257', 'SP96635609', '', '2020-01-01', 'TA', '27697273', 1, 0, '', 'GAS GASOL', 0, '2017-07-27', NULL, '0000-00-00', '1300'),
('665', 'SQF550', 2015, 'AUTOMOVIL', 1, 'i 10 GL', 'HATCH BACK', 'G4HGDM783708', 'MALAM51BAFM546313', '', '2020-01-01', 'TA', '38856105', 1, 0, '', 'GAS GASOLINA ', 0, '2017-07-27', 'no', '0000-00-00', '1086'),
('670', 'SQF651', 2014, 'AUTOMOVIL', 12, 'CK 1.3 GS', 'SEDAN ', 'MR479QD3N286997', 'L6T7524S8EN001139', '', '2020-01-01', 'TA', '2473000', 1, 0, '', 'GAS GASOL', 0, '2017-07-27', NULL, '0000-00-00', '1342'),
('671', 'SQF400', 2013, 'AUTOMOVIL', 1, 'I 10 GL', 'HATCH BACK', 'G4HGCM571316', 'MALAM51BADM271654', '', '2019-06-01', 'TA', '1112103351', 1, 0, '', 'GASGASOL', 0, '2020-07-27', NULL, '0000-00-00', '1086'),
('673', 'SQF483', 2014, 'AUTOMOVIL', 6, 'PICANTO EKOTAXI + LX', 'HATCH BACK', 'G4LADP123932', 'KNABE512AET699913', '', '2020-09-07', 'TA', '16367978', 1, 0, '', 'GASGASOL', 0, '2020-09-07', NULL, NULL, '1248'),
('674', 'SQF800', 2015, 'AUTOMOVIL', 12, 'VOLEEX C30', 'SEDAN', 'GW4G15 1401137321', 'LGWEE2K50FE614352', '', '2020-01-01', 'TA', '29875914', 1, 0, '', 'GASOLINA', 0, '2018-03-01', NULL, '0000-00-00', '1497'),
('675', 'VNB644', 2002, 'AUTOMOVIL', 1, 'ACCENT VERNA GL', 'SEDAN', 'G4EB1032730', 'KMHCG51GP2U120372', '', '2020-01-01', 'TA', '19128402', 1, 0, '', 'GAS GASOL', 0, '2017-07-27', NULL, '0000-00-00', '1495'),
('676', 'VNA474', 2011, 'AUTOMOVIL', 1, 'ATOS PRIME GL', 'HATCH BACK', 'G4HCAM109753', 'MALAB51GABM584271', '', '2020-01-01', 'TA', '66729939', 1, 0, '', 'GAS GASOL', 0, '2017-07-27', NULL, '0000-00-00', '1000'),
('678', 'VNB 288', 1997, 'AUTOMOVIL', 3, 'SWIFT', 'SEDAN', 'G13B320728', 'S997720041', '', '2020-01-01', 'TA', '16363242', 1, 0, '', 'GASOLINA', 0, '2017-07-27', NULL, NULL, '1300'),
('682', 'SQF470', 2014, 'AUTOMOVIL', 6, 'RIO LS', 'SEDAN', 'A5D406419', '8LCDC2235EE034176', '', '2020-01-01', 'TA', '31204060', 1, 0, '', 'GAS GASOL', 0, '2017-07-27', NULL, '0000-00-00', '1493'),
('683', 'VNB307', 1997, 'AUTOMOVIL', 3, 'SWITF TAXI', 'SEDAN ', 'G13B324424', 'SP97741733', '', '2020-01-01', 'TA', '20576619', 1, 0, '', 'GASOLINA ', 0, '2017-07-27', NULL, '0000-00-00', '1300'),
('686', 'SQF500', 2014, 'AUTOMOVIL', 6, 'PICANTO EKOTAXI + LX', 'HATCH BACK', 'G4LADP118583', 'KNABE512AET693382', '', '2020-01-01', 'TA', '16363089', 1, 0, '', 'GASOLINA', 0, '2018-01-18', NULL, NULL, '1248'),
('687', 'VNA405', 2010, 'AUTOMOVIL', 1, 'ATOS PRIME GL', 'HATCH BACK', 'G4HC9M885041', 'MALAB51GAAM474926', '', '2020-01-01', 'TA', '1116258487', 1, 0, '', 'GASOLINA', 0, '2017-08-03', NULL, '0000-00-00', '999'),
('692', 'VNC014', 2009, 'AUTOMOVIL', 1, 'ATOS PRIME GL', 'HATCH BACK', 'G4HC8M412374', 'MALAB51GP9M284752', '', '2020-01-01', 'TA', '38791760', 1, 0, '', 'GAS GASOL', 0, '2017-07-27', NULL, '0000-00-00', '999'),
('693', 'SQF430', 2014, 'AUTOMOVIL', 1, 'i 10 GL', 'HATCH BACK', 'G4HGDM656714', 'MALAM51BAEM397251', '', '2019-09-30', 'TA', '94393252', 1, 0, '', 'GASOLINA', 0, '2019-09-30', NULL, '0000-00-00', '1086'),
('698', 'SQF694', 2016, 'AUTOMOVIL', 6, 'PICANTO EKOTAXI', 'HATCH BACK', 'G3LAFP055479', 'KNABE511AGT066863', '', '2020-01-01', 'TA', '16362676', 1, 0, '', 'GASOLINA', 0, '2017-07-27', NULL, '0000-00-00', '998'),
('703', 'VNA555', 2012, 'AUTOMOVIL', 1, 'ATOS PRIME GL', 'HATCH BACK', 'G4HGBM364185', 'MALAB51HACM716276', '', '2020-01-01', 'TA', '66729939', 1, 0, '', 'GAS GASOL', 0, '2017-07-27', NULL, '0000-00-00', '1086'),
('705', 'SQF650', 2015, 'AUTOMOVIL', 6, 'PICANTO EKOTAXI + LX', 'HATCH BACK', 'G4LAEP130217', 'KNABE512AFT953657', '', '2019-10-07', 'TA', '16883057', 1, 0, '', 'GAS GASOL', 0, '2019-10-07', 'no', '0000-00-00', '1248'),
('707', 'SQF552', 2015, 'AUTOMOVIL', 1, 'i 10 GL', 'HATCH BACK', 'G4HGEM783816', 'MALAM51BAFM546379', '', '2020-01-01', 'TA', '17325703', 1, 0, '', 'GAS GASOLINA ', 0, '2017-07-27', 'no', '0000-00-00', '1086'),
('712', 'SQF993', 2020, 'AUTOMOVIL', 3, 'CHEVITAXI', 'SEDAN', 'Z2196210L4AX0295', '9GACE5CDE3LB025312', '', '2020-07-19', 'TA', '16359071', 1, 0, '', 'GASOLINA', 0, '2021-07-20', NULL, '0000-00-00', '1206'),
('714', 'VNA546', 2012, 'AUTOMOVIL', 6, 'RIO SEPHIA EX', 'SEDAN', 'G4EEBH500721', 'KNADH411AC6869260', '', '2020-01-01', 'TA', '31793621', 1, 0, '', 'GAS GASOLINA', 0, '2018-03-14', NULL, '0000-00-00', '1399'),
('715', 'SQF680', 2016, 'AUTOMOVIL', 1, 'GRAND I 10', 'SEDAN', 'G4LAF656034', 'MALA741CAGM102803', '', '2020-11-12', 'TA', '66722065', 1, 0, '', 'GASOLINA', 0, '2020-11-12', NULL, NULL, '1248');
INSERT INTO `vehiculo` (`id_movil`, `placa`, `modelo`, `clase`, `id_marca`, `referencia`, `tipo`, `motor`, `serie`, `color`, `pago_hasta`, `grupo`, `id_prop`, `estado`, `poliza`, `managerid`, `combustible`, `dtaller`, `fcontrato`, `radio`, `ultimo_pago`, `cilindraje`) VALUES
('718', 'SQF607', 2015, 'AUTOMOVIL', 6, 'PICANTO EKOTAXI', 'HATCH BACK', 'G4LAEP144608', 'KNABE512AFT976679', '', '2020-01-01', 'TA', '16347636', 1, 0, '', 'GAS GASOL', 0, '2017-07-27', NULL, '0000-00-00', '1248'),
('719', 'SQF 425', 2014, 'AUTOMOVIL', 3, 'TAXI 7: 24|', 'HATCH BACK', 'B10S1083220KD2', '9GAMM610EB021954', '', '2020-01-01', 'TA', '16362676', 1, 0, '', 'GASOLINA', 0, '2018-07-27', NULL, NULL, '995'),
('720', 'VNA 488', 2011, 'AUTOMOVIL', 1, 'ATOS PRIME GL', 'HATCH BACK', 'G4HCAM131667', 'MALAB51GABM595759', '', '2020-01-01', 'TA', '66872626', 1, 0, '', 'GAS GASOL', 0, '2017-07-27', NULL, '0000-00-00', '1000');

--
-- Disparadores `vehiculo`
--
DELIMITER $$
CREATE TRIGGER `notifica_ac` AFTER UPDATE ON `vehiculo` FOR EACH ROW BEGIN
    set @can_dias=(select  plazo_diarios from info_sistema);
   set @cant_hab=(SELECT count(vehiculo.id_movil)  FROM vehiculo WHERE NOT ( id_movil IN (SELECT DISTINCT vehiculo.id_movil FROM vehiculo INNER JOIN veh_doc ON vehiculo.id_movil = veh_doc.id_movil WHERE (DATE_FORMAT( concat( fecha_ven, ' 11:59:59' ) , '%Y-%m-%d %H:%i' ) < DATE_FORMAT( now( ) , '%Y-%m-%d %H:%i' )) OR ADDDATE( DATE_FORMAT( concat( vehiculo.pago_hasta, ' 11:59:59' ) , '%Y-%m-%d %H:%i' ) , @can_dias ) < DATE_FORMAT( now( ) , '%Y-%m-%d %H:%i' ))) AND id_movil =new.id_movil);
     set @cant_inhab=(SELECT count(vehiculo.id_movil) FROM vehiculo WHERE id_movil IN ( SELECT DISTINCT vehiculo.id_movil FROM vehiculo INNER JOIN veh_doc ON vehiculo.id_movil = veh_doc.id_movil WHERE ( DATE_FORMAT( concat( fecha_ven, ' 11:59:59' ) , '%Y-%m-%d %H:%i' ) < DATE_FORMAT( now( ) , '%Y-%m-%d %H:%i' ) ) OR ADDDATE( DATE_FORMAT( concat( vehiculo.pago_hasta, ' 11:59:59' ) , '%Y-%m-%d %H:%i' ) ,  @can_dias ) < DATE_FORMAT( now( ) , '%Y-%m-%d %H:%i' )) AND id_movil =new.id_movil);
 if(NEW.pago_hasta <> OLD.pago_hasta) then      
    INSERT INTO novedad_diario (fecha, id_movil, pago_hasta_n, pago_hasta_a, novedad, control, control2) values (now(), NEW.id_movil, NEW.pago_hasta, OLD.pago_hasta, "Pago Diarios",1,1);
    if(@cant_hab>0) then
    insert into `novedad_servicio` (`id_movil`, `operacion`, `estado`) values (new.`id_movil`,"Movil Habilitado",1);
    elseif (@cant_inhab>0) then
     insert into `novedad_servicio` (`id_movil`, `operacion`, `estado`) values (new.`id_movil`,"Movil Inhabilitado",1);
     end if;
    end if;
  END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `veh_dias_mora`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `veh_dias_mora` (
`id_movil` varchar(4)
,`placa` varchar(7)
,`clase` varchar(50)
,`id_marca` int(5)
,`marca` varchar(35)
,`referencia` varchar(50)
,`tipo` varchar(50)
,`motor` varchar(35)
,`serie` varchar(35)
,`color` varchar(15)
,`modelo` int(4)
,`pago_hasta` date
,`dias_mora` bigint(14)
,`grupo` varchar(3)
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
('379', '01', '0000-00-00', '2021-11-09', '14859400007270 ESTADO', 6),
('379', '02', '0000-00-00', '2021-07-27', 'I52886', 7),
('379', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 8),
('379', '04', '0000-00-00', '2021-12-03', '150368375', 9),
('379', '05', '0000-00-00', '0000-00-00', '', 10),
('390', '01', '0000-00-00', '2021-03-20', '14554900033260 MUNDIAL', 11),
('390', '02', '0000-00-00', '2021-07-27', 'I52977', 12),
('390', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 13),
('390', '04', '0000-00-00', '2021-03-20', '48585295', 14),
('390', '05', '0000-00-00', '0000-00-00', '', 15),
('284', '01', '2019-09-04', '2021-09-05', '14883300045880 ESTADO', 16),
('284', '02', '2019-07-27', '2021-07-27', 'I52968', 17),
('284', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 18),
('284', '04', '0000-00-00', '2021-09-07', '', 19),
('284', '05', '0000-00-00', '0000-00-00', '', 20),
('010', '01', '2019-10-04', '2021-12-19', '79632096 MUNDIAL', 21),
('010', '02', '2020-07-27', '2021-07-27', 'I52826', 22),
('010', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 23),
('010', '04', '0000-00-00', '2021-12-15', '150615390', 24),
('010', '05', '0000-00-00', '0000-00-00', '', 25),
('626', '01', '0000-00-00', '2019-07-11', '21423388 SURAMERICANA', 31),
('626', '02', '0000-00-00', '2019-07-27', '151295', 32),
('626', '03', '2018-10-02', '2021-10-01', '2000016362-16363', 33),
('626', '04', '0000-00-00', '2019-01-10', '35311851', 34),
('626', '05', '0000-00-00', '0000-00-00', '', 35),
('587', '01', '0000-00-00', '2021-10-24', '14742800282360 ESTADO', 36),
('587', '02', '0000-00-00', '2021-07-27', 'I52998', 37),
('587', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 38),
('587', '04', '0000-00-00', '2021-11-04', '149833922', 39),
('587', '05', '0000-00-00', '0000-00-00', '', 40),
('505', '01', '0000-00-00', '2021-07-09', '78892604603488860-mundial', 41),
('505', '02', '0000-00-00', '2020-12-22', '152630', 42),
('505', '03', '2018-10-02', '2020-10-02', 'AA6911-6912 LA EQUIDAD', 43),
('505', '04', '0000-00-00', '2021-07-21', '147827695', 44),
('505', '05', '0000-00-00', '0000-00-00', '', 45),
('326', '01', '0000-00-00', '2021-05-07', '12666200018400ESTADO', 46),
('326', '02', '0000-00-00', '2021-07-27', 'I52969', 47),
('326', '03', '2018-10-02', '2021-10-02', 'AA6911-8861 LA EQUIDAD', 48),
('326', '04', '0000-00-00', '2021-05-09', '', 49),
('326', '05', '0000-00-00', '0000-00-00', '', 50),
('132', '01', '0000-00-00', '2021-01-20', '77677552 MUNDIAL', 51),
('132', '02', '2020-07-27', '2021-07-27', 'I52952', 52),
('132', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 53),
('132', '04', '0000-00-00', '2021-01-21', '45333260', 54),
('132', '05', '0000-00-00', '0000-00-00', '', 55),
('056', '01', '2020-07-31', '2021-07-31', '14525100050720 ESTADO', 56),
('056', '02', '2020-07-27', '2021-07-27', 'I52849', 57),
('056', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 58),
('056', '04', '2021-08-04', '2021-08-04', '148077461', 59),
('056', '05', '0000-00-00', '0000-00-00', '', 60),
('676', '01', '0000-00-00', '2021-02-10', '14117400068800 ESTADO', 61),
('676', '02', '0000-00-00', '2021-07-27', 'I53013', 62),
('676', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 63),
('676', '04', '0000-00-00', '2021-02-22', '48177501', 64),
('676', '05', '0000-00-00', '0000-00-00', '', 65),
('102', '01', '0000-00-00', '2021-03-14', '78187938 - MUNDIAL', 66),
('102', '02', '2020-07-27', '2021-07-27', 'I52851', 67),
('102', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 68),
('102', '04', '0000-00-00', '2021-03-14', '48585027', 69),
('102', '05', '0000-00-00', '0000-00-00', '', 70),
('698', '01', '0000-00-00', '2020-11-18', '77159476 MUNDIAL', 71),
('698', '02', '0000-00-00', '2020-07-27', 'I52191', 72),
('698', '03', '2019-10-02', '2020-10-02', 'AA006911-6912 LA EQUIDAD', 73),
('698', '04', '0000-00-00', '2020-11-22', '', 74),
('698', '05', '0000-00-00', '0000-00-00', '', 75),
('122', '01', '2019-08-27', '2021-08-29', '14883300043810 ESTADO', 76),
('122', '02', '2020-07-27', '2021-07-27', 'I52855', 77),
('122', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 78),
('122', '04', '0000-00-00', '2021-09-17', '148937274', 79),
('122', '05', '0000-00-00', '0000-00-00', '', 80),
('276', '01', '0000-00-00', '2021-07-13', '78572934-mundial', 81),
('276', '02', '0000-00-00', '2021-07-27', 'I52873', 82),
('276', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 83),
('276', '04', '0000-00-00', '2021-07-12', '49289768', 84),
('276', '05', '0000-00-00', '0000-00-00', '', 85),
('085', '01', '2019-08-22', '2021-08-22', '14525100055070-DEL ESTADO', 86),
('085', '02', '2020-07-27', '2021-07-27', 'I53073', 87),
('085', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 88),
('085', '04', '0000-00-00', '2021-08-24', '148428398', 89),
('085', '05', '0000-00-00', '0000-00-00', '', 90),
('036', '01', '0000-00-00', '2021-10-21', '79529451-001531454- MUNDIAL', 91),
('036', '02', '2020-07-27', '2021-07-27', 'I52942', 92),
('036', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 93),
('036', '04', '0000-00-00', '2021-10-26', '149698939', 94),
('036', '05', '0000-00-00', '0000-00-00', '', 95),
('041', '01', '0000-00-00', '2021-12-10', '14863700002560 ESTADO', 96),
('041', '02', '2020-07-27', '2021-07-27', 'I52846', 97),
('041', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 98),
('041', '04', '0000-00-00', '2021-12-17', '150674324', 99),
('041', '05', '0000-00-00', '0000-00-00', '', 100),
('315', '01', '0000-00-00', '2020-03-15', '75860581 MUNDIAL', 101),
('315', '02', '0000-00-00', '2020-07-27', 'I52211', 102),
('315', '03', '2019-10-02', '2020-10-02', 'AA006911-6912 LA EQUIDAD', 103),
('315', '04', '0000-00-00', '2019-12-29', '41562128', 104),
('315', '05', '0000-00-00', '0000-00-00', '', 105),
('508', '01', '0000-00-00', '2021-10-15', '79317440  MUNDIAL', 106),
('508', '02', '0000-00-00', '2021-07-27', 'I52903', 107),
('508', '03', '2018-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 108),
('508', '04', '0000-00-00', '2021-11-14', '150032711', 109),
('508', '05', '0000-00-00', '0000-00-00', '', 110),
('103', '01', '2020-05-04', '2021-05-06', '14098500006760 ESTADO', 111),
('103', '02', '2020-07-27', '2021-07-27', 'I52852', 112),
('103', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 113),
('103', '04', '0000-00-00', '2021-06-12', '146844766', 114),
('103', '05', '0000-00-00', '0000-00-00', '', 115),
('640', '01', '0000-00-00', '2021-01-31', '14525100035090 ESTADO', 116),
('640', '02', '0000-00-00', '2021-07-27', 'I53099', 117),
('640', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 118),
('640', '04', '0000-00-00', '2021-02-04', '47903252', 119),
('640', '05', '0000-00-00', '0000-00-00', '', 120),
('670', '01', '2020-08-11', '2021-08-11', '78661997 mundial', 121),
('670', '02', '0000-00-00', '2021-07-27', 'I52921', 122),
('670', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 123),
('670', '04', '0000-00-00', '2021-08-15', '148276341', 124),
('670', '05', '0000-00-00', '0000-00-00', '', 125),
('029', '01', '0000-00-00', '2020-07-12', '76583340 MUNDIAL', 126),
('029', '02', '0000-00-00', '2020-07-27', 'I52186', 127),
('029', '03', '2019-10-02', '2020-10-02', 'AA006911-6912 LA EQUIDAD', 128),
('029', '04', '0000-00-00', '2020-07-20', '44607054', 129),
('029', '05', '0000-00-00', '0000-00-00', '', 130),
('671', '01', '2020-05-28', '2021-05-28', '14613100002410', 136),
('671', '02', '2020-07-27', '2021-07-27', 'I53012', 137),
('671', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 138),
('671', '04', '0000-00-00', '2021-06-15', '48915106', 139),
('671', '05', '0000-00-00', '0000-00-00', '', 140),
('178', '01', '0000-00-00', '2020-07-04', '76581996 MUNDIAL', 141),
('178', '02', '0000-00-00', '2019-07-27', '151278', 142),
('178', '03', '2018-10-02', '2021-10-01', '2000016362-16363', 143),
('178', '04', '0000-00-00', '2019-07-12', '37857720', 144),
('178', '05', '0000-00-00', '0000-00-00', '', 145),
('075', '01', '0000-00-00', '2021-05-21', '14093500088490 DEL ESTADO', 146),
('075', '02', '2020-08-27', '2021-07-27', '153137', 147),
('075', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 148),
('075', '04', '0000-00-00', '2021-07-31', '148032762', 149),
('075', '05', '0000-00-00', '0000-00-00', '', 150),
('692', '01', '2019-10-05', '2021-10-07', '79537779 MUNDIAL', 151),
('692', '02', '2019-07-27', '2021-07-27', '153015', 152),
('692', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 153),
('692', '04', '0000-00-00', '2021-10-07', '', 154),
('692', '05', '0000-00-00', '0000-00-00', '', 155),
('370', '01', '0000-00-00', '2020-02-23', '14093500018680 ESTADO', 156),
('370', '02', '0000-00-00', '2019-07-27', '151313', 157),
('370', '03', '2018-10-02', '2021-10-01', '2000016362-16363', 158),
('370', '04', '0000-00-00', '2020-02-25', '41619789', 159),
('370', '05', '0000-00-00', '0000-00-00', '', 160),
('718', '01', '0000-00-00', '2021-03-14', '14525100040790-ESTADO', 166),
('718', '02', '2020-07-27', '2021-07-27', 'I53101', 167),
('718', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 168),
('718', '04', '0000-00-00', '2021-03-15', '48585091', 169),
('718', '05', '0000-00-00', '0000-00-00', '', 170),
('263', '01', '2019-10-21', '2021-10-22', '14525100063000- ESTADO', 171),
('263', '02', '0000-00-00', '2021-07-27', 'I52870', 172),
('263', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 173),
('263', '04', '0000-00-00', '2021-10-24', '149671277', 174),
('263', '05', '0000-00-00', '0000-00-00', '', 175),
('589', '01', '0000-00-00', '2019-07-04', '39490552 ESTADO', 176),
('589', '02', '0000-00-00', '2019-07-27', '151316', 177),
('589', '03', '2018-10-02', '2021-10-01', '2000016362-16363', 178),
('589', '04', '0000-00-00', '2019-09-19', '', 179),
('589', '05', '0000-00-00', '0000-00-00', '', 180),
('546', '01', '2020-08-02', '2021-08-01', '14093500100850-DELESTADO', 181),
('546', '02', '2020-07-27', '2021-07-27', 'I53093', 182),
('546', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 183),
('546', '04', '0000-00-00', '2021-08-27', '148493799', 184),
('546', '05', '0000-00-00', '0000-00-00', '', 185),
('183', '01', '2019-09-12', '2021-09-16', '14554900040350 ESTADO', 186),
('183', '02', '2020-07-27', '2021-07-27', 'I52860', 187),
('183', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 188),
('183', '04', '0000-00-00', '2021-10-02', '149239822', 189),
('183', '05', '0000-00-00', '0000-00-00', '', 190),
('630', '01', '0000-00-00', '2021-11-27', '1459400005820---MUNDIAL', 196),
('630', '02', '0000-00-00', '2021-07-27', 'I53008', 197),
('630', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 198),
('630', '04', '0000-00-00', '2021-12-22', '150798459', 199),
('630', '05', '0000-00-00', '0000-00-00', '', 200),
('154', '01', '0000-00-00', '2021-01-10', '14093500070200 DEL ESTADO', 201),
('154', '02', '2020-07-27', '2021-07-27', 'I52857', 202),
('154', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 203),
('154', '04', '0000-00-00', '2021-01-22', '', 204),
('154', '05', '0000-00-00', '0000-00-00', '', 205),
('338', '01', '0000-00-00', '2021-05-30', '783263600435326 ESTADO', 206),
('338', '02', '0000-00-00', '2021-07-27', 'I52881', 207),
('338', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 208),
('338', '04', '0000-00-00', '2021-07-07', '14753624', 209),
('338', '05', '0000-00-00', '0000-00-00', '', 210),
('319', '01', '0000-00-00', '2019-11-01', '14093500004330', 211),
('319', '02', '0000-00-00', '2019-07-27', '151312', 212),
('319', '03', '2018-10-02', '2021-10-01', '2000016362-16363', 213),
('319', '04', '0000-00-00', '2019-08-10', '34201273', 214),
('319', '05', '0000-00-00', '0000-00-00', '', 215),
('426', '01', '0000-00-00', '2020-05-04', '75860596 MUNDIAL', 221),
('426', '02', '0000-00-00', '2020-07-27', 'I52115', 222),
('426', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 223),
('426', '04', '0000-00-00', '2020-05-07', '43581234', 224),
('426', '05', '0000-00-00', '0000-00-00', '', 225),
('687', '01', '0000-00-00', '2021-02-19', '14093500078050 ESTADO', 226),
('687', '02', '0000-00-00', '2021-07-27', 'I52909', 227),
('687', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 228),
('687', '04', '0000-00-00', '2021-02-16', '48177184', 229),
('687', '05', '0000-00-00', '0000-00-00', '', 230),
('541', '01', '2019-09-12', '2021-09-12', '14613100003230-DEL ESTADO', 231),
('541', '02', '2019-07-27', '2021-07-27', 'I52993', 232),
('541', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 233),
('541', '04', '0000-00-00', '2021-09-18', '148966008', 234),
('541', '05', '0000-00-00', '0000-00-00', '', 235),
('063', '01', '0000-00-00', '2021-11-03', '14859400006960 ESTADO', 236),
('063', '02', '2020-07-27', '2021-07-27', 'I53072', 237),
('063', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 238),
('063', '04', '0000-00-00', '2021-07-03', '49189279', 239),
('063', '05', '0000-00-00', '0000-00-00', '', 240),
('167', '01', '2019-07-19', '2021-07-21', '14554900034830-DEL ESTADO', 241),
('167', '02', '2019-07-27', '2021-07-27', 'I53118', 242),
('167', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 243),
('167', '04', '0000-00-00', '2021-08-24', '148414450', 244),
('167', '05', '0000-00-00', '0000-00-00', '', 245),
('447', '01', '2020-10-10', '2021-10-10', '14859400005380', 256),
('447', '02', '0000-00-00', '2021-07-27', 'I52982', 257),
('447', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 258),
('447', '04', '0000-00-00', '2021-06-17', '48915310', 259),
('447', '05', '0000-00-00', '0000-00-00', '', 260),
('275', '01', '0000-00-00', '2021-12-17', '14525100068140- DEL ESTADO', 261),
('275', '02', '0000-00-00', '2021-07-27', 'I52966', 262),
('275', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 263),
('275', '04', '0000-00-00', '2021-12-19', '150743688', 264),
('275', '05', '0000-00-00', '0000-00-00', '', 265),
('360', '01', '2019-09-27', '2021-09-29', '78640259 MUNDIAL', 266),
('360', '02', '0000-00-00', '2021-07-27', 'i52883', 267),
('360', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 268),
('360', '04', '0000-00-00', '2021-09-29', '', 269),
('360', '05', '0000-00-00', '0000-00-00', '', 270),
('566', '01', '2019-08-26', '2020-08-26', '76449416 MUNDIAL', 271),
('566', '02', '2019-07-27', '2020-07-27', 'I52174', 272),
('566', '03', '2019-10-02', '2020-10-02', 'AA006911-6912 LA EQUIDAD', 273),
('566', '04', '2020-09-24', '2020-09-24', '', 274),
('566', '05', '0000-00-00', '0000-00-00', '', 275),
('544', '01', '2019-10-05', '2021-10-05', '79182137 MUNDIAL', 276),
('544', '02', '2019-10-21', '2021-07-27', 'I52906', 277),
('544', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 278),
('544', '04', '0000-00-00', '2021-10-19', '149567074', 279),
('544', '05', '0000-00-00', '0000-00-00', '', 280),
('614', '01', '0000-00-00', '2021-05-09', '78397458 MUNDIAL', 281),
('614', '02', '0000-00-00', '2021-07-27', 'I53109', 282),
('614', '03', '2018-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 283),
('614', '04', '0000-00-00', '2021-07-09', '49189451', 284),
('614', '05', '0000-00-00', '0000-00-00', '', 285),
('318', '01', '0000-00-00', '2021-04-13', '78217274 MUNDIAL', 286),
('318', '02', '0000-00-00', '2021-07-27', 'I53135', 287),
('318', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 288),
('318', '04', '0000-00-00', '2021-06-01', '48585371', 289),
('318', '05', '0000-00-00', '0000-00-00', '', 290),
('401', '01', '0000-00-00', '2021-10-22', '78662844 MUNDIAL', 291),
('401', '02', '0000-00-00', '2021-07-27', 'I52889', 292),
('401', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 293),
('401', '04', '0000-00-00', '2021-10-31', '149786381', 294),
('401', '05', '0000-00-00', '0000-00-00', '', 295),
('511', '01', '0000-00-00', '2021-03-14', '14525100040880 ESTADO', 296),
('511', '02', '0000-00-00', '2021-07-27', 'I52904', 297),
('511', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 298),
('511', '04', '0000-00-00', '2021-10-25', '149653451', 299),
('511', '05', '0000-00-00', '0000-00-00', '', 300),
('430', '01', '0000-00-00', '2021-12-19', '80077976 MUNDIAL', 301),
('430', '02', '0000-00-00', '2021-07-27', 'I52980', 302),
('430', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 303),
('430', '04', '0000-00-00', '2021-12-19', '150745759', 304),
('430', '05', '0000-00-00', '0000-00-00', '', 305),
('703', '01', '0000-00-00', '2021-03-09', '14093500081190 ESTADO', 306),
('703', '02', '0000-00-00', '2021-07-27', 'I53016', 307),
('703', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 308),
('703', '04', '0000-00-00', '2021-03-10', '', 309),
('703', '05', '0000-00-00', '0000-00-00', '', 310),
('371', '01', '0000-00-00', '2021-11-05', '79529461 MUNDIAL', 311),
('371', '02', '0000-00-00', '2021-07-27', 'I52975', 312),
('371', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 313),
('371', '04', '0000-00-00', '2021-11-09', '149930447', 314),
('371', '05', '0000-00-00', '0000-00-00', '', 315),
('096', '01', '0000-00-00', '2021-12-04', '79728193 MUNDIAL', 321),
('096', '02', '2020-07-27', '2021-07-27', 'I52850', 322),
('096', '03', '2018-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 323),
('096', '04', '0000-00-00', '2021-11-27', '150253090', 324),
('096', '05', '0000-00-00', '0000-00-00', '', 325),
('271', '01', '0000-00-00', '2021-02-27', '14093500079440 ESTADO', 326),
('271', '02', '0000-00-00', '2021-07-27', 'I52871', 327),
('271', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 328),
('271', '04', '0000-00-00', '2021-03-09', '48584788', 329),
('271', '05', '0000-00-00', '0000-00-00', '', 330),
('352', '01', '0000-00-00', '2021-08-01', '15063200000570-ESTADO', 336),
('352', '02', '0000-00-00', '2021-07-27', 'I53136', 337),
('352', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 338),
('352', '04', '0000-00-00', '2021-12-13', '150582608', 339),
('352', '05', '0000-00-00', '0000-00-00', '', 340),
('661', '01', '0000-00-00', '2021-02-01', '14093500074320 ESTADO', 346),
('661', '02', '0000-00-00', '2021-07-27', 'I52918', 347),
('661', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 348),
('661', '04', '0000-00-00', '2021-03-05', '', 349),
('661', '05', '0000-00-00', '0000-00-00', '', 350),
('113', '01', '0000-00-00', '2021-05-06', '78323082-MUNDIAL', 351),
('113', '02', '2020-07-27', '2021-07-27', 'I52854', 352),
('113', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 353),
('113', '04', '0000-00-00', '2021-06-05', '146637817', 354),
('113', '05', '0000-00-00', '0000-00-00', '', 355),
('017', '01', '0000-00-00', '2021-02-17', '77426178 MUNDIAL', 356),
('017', '02', '2020-07-27', '2021-07-27', 'I52827', 357),
('017', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 358),
('017', '04', '0000-00-00', '2021-02-20', '47689024', 359),
('017', '05', '0000-00-00', '0000-00-00', '', 360),
('478', '01', '0000-00-00', '2021-12-07', '14859400009240-ESTADO', 361),
('478', '02', '0000-00-00', '2021-07-27', 'I52985', 362),
('478', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 363),
('478', '04', '0000-00-00', '2021-12-14', '150604573', 364),
('478', '05', '0000-00-00', '0000-00-00', '', 365),
('086', '01', '0000-00-00', '2019-10-28', '19544220', 366),
('086', '02', '0000-00-00', '2019-07-27', '151307', 367),
('086', '03', '2018-10-02', '2021-10-01', '2000016362-16363', 368),
('086', '04', '0000-00-00', '2019-10-31', '', 369),
('086', '05', '0000-00-00', '0000-00-00', '', 370),
('128', '01', '0000-00-00', '2021-11-16', '14525100064750MUNDIAL', 371),
('128', '02', '2020-07-27', '2021-07-27', 'I52951', 372),
('128', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 373),
('128', '04', '0000-00-00', '2021-12-01', '', 374),
('128', '05', '0000-00-00', '0000-00-00', '', 375),
('032', '01', '0000-00-00', '2021-05-18', '78270418-MUNDIAL', 381),
('032', '02', '2020-07-27', '2021-07-27', 'I52941', 382),
('032', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 383),
('032', '04', '0000-00-00', '2021-07-03', '147412153', 384),
('032', '05', '0000-00-00', '0000-00-00', '', 385),
('682', '01', '0000-00-00', '2021-02-25', '77575354 MUNDIAL', 391),
('682', '02', '0000-00-00', '2021-07-27', 'I53014', 392),
('682', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 393),
('682', '04', '0000-00-00', '2021-03-13', '46459221', 394),
('682', '05', '0000-00-00', '0000-00-00', '', 395),
('024', '01', '0000-00-00', '2021-07-16', '14714900011010 DEL ESTADO', 406),
('024', '02', '2020-07-27', '2021-07-27', 'I52829', 407),
('024', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 408),
('024', '04', '0000-00-00', '2021-07-14', '49296500', 409),
('024', '05', '0000-00-00', '0000-00-00', '', 410),
('034', '01', '0000-00-00', '2021-01-23', '14093500072550 ESTADO', 411),
('034', '02', '2020-07-27', '2021-07-27', 'I52845', 412),
('034', '03', '0000-00-00', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 413),
('034', '04', '0000-00-00', '2021-02-01', '', 414),
('034', '05', '0000-00-00', '0000-00-00', '', 415),
('560', '01', '0000-00-00', '2019-10-24', '14093500003790', 421),
('560', '02', '0000-00-00', '2019-07-27', '151375', 422),
('560', '03', '2018-10-02', '2021-10-01', '2000016362-16363', 423),
('560', '04', '0000-00-00', '2019-11-16', '', 424),
('560', '05', '0000-00-00', '0000-00-00', '', 425),
('190', '01', '0000-00-00', '2020-11-16', '14554900022700 ESTADO', 426),
('190', '02', '2019-07-27', '2020-07-27', 'I52162', 427),
('190', '03', '2019-10-02', '2020-10-02', 'AA006911-6912 LA EQUIDAD', 428),
('190', '04', '0000-00-00', '2021-01-15', '47404438', 429),
('190', '05', '0000-00-00', '0000-00-00', '', 430),
('446', '01', '0000-00-00', '2021-12-08', '14525100067230 ESTADO', 431),
('446', '02', '0000-00-00', '2021-07-27', 'I52895', 432),
('446', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 433),
('446', '04', '0000-00-00', '2021-12-11', '150534423', 434),
('446', '05', '0000-00-00', '0000-00-00', '', 435),
('397', '01', '0000-00-00', '2021-12-19', '14525100068310 ESTADO', 436),
('397', '02', '0000-00-00', '2021-07-27', 'I52978', 437),
('397', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 438),
('397', '04', '0000-00-00', '2021-09-08', '148763422', 439),
('397', '05', '0000-00-00', '0000-00-00', '', 440),
('223', '01', '0000-00-00', '2021-03-07', '78186733-MUNDIAL', 441),
('223', '02', '0000-00-00', '2021-07-27', 'I52865', 442),
('223', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 443),
('223', '04', '0000-00-00', '2021-06-01', '46488390', 444),
('223', '05', '0000-00-00', '0000-00-00', '', 445),
('049', '01', '0000-00-00', '2021-11-06', '79583199 MUNDIAL', 446),
('049', '02', '2020-07-27', '2021-07-27', 'I52848', 447),
('049', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 448),
('049', '04', '0000-00-00', '2021-11-28', '150267475', 449),
('049', '05', '0000-00-00', '0000-00-00', '', 450),
('638', '01', '0000-00-00', '2021-11-09', '14859400007320 ESTADO', 451),
('638', '02', '0000-00-00', '2021-07-27', 'I52916', 452),
('638', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 453),
('638', '04', '0000-00-00', '2021-11-13', '150016133', 454),
('638', '05', '0000-00-00', '0000-00-00', '', 455),
('602', '01', '0000-00-00', '2022-09-15', '78941625 MUNDIAL', 456),
('602', '02', '0000-00-00', '2021-07-27', 'I53180', 457),
('602', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 458),
('602', '04', '0000-00-00', '2022-09-16', '', 459),
('602', '05', '0000-00-00', '0000-00-00', '', 460),
('054', '01', '0000-00-00', '2021-03-30', '14093500083430 ESTADO', 461),
('054', '02', '2020-07-27', '2021-07-27', '152944', 462),
('054', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 463),
('054', '04', '0000-00-00', '2021-06-25', '47271357', 464),
('054', '05', '0000-00-00', '0000-00-00', '', 465),
('038', '01', '0000-00-00', '2021-06-28', '78588724 MUNDIAL', 466),
('038', '02', '0000-00-00', '2020-07-27', 'I52231', 467),
('038', '03', '2019-10-02', '2020-10-02', 'AA006911-6912 LA EQUIDAD', 468),
('038', '04', '0000-00-00', '2021-06-29', '49283531', 469),
('038', '05', '0000-00-00', '0000-00-00', '', 470),
('262', '01', '2019-09-13', '2021-09-14', '78901281 MUNDIAL', 471),
('262', '02', '2019-07-27', '2021-07-27', 'I52869', 472),
('262', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 473),
('262', '04', '0000-00-00', '2021-09-17', '', 474),
('262', '05', '0000-00-00', '0000-00-00', '', 475),
('071', '01', '0000-00-00', '2021-02-26', '77575356 MUNDIAL', 476),
('071', '02', '2020-07-27', '2021-07-27', 'I52947', 477),
('071', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 478),
('071', '04', '0000-00-00', '2021-03-03', '48584481', 479),
('071', '05', '0000-00-00', '0000-00-00', '', 480),
('406', '01', '0000-00-00', '2021-03-18', '1425100041390 ESTADO', 481),
('406', '02', '0000-00-00', '2021-07-27', 'I52890', 482),
('406', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 483),
('406', '04', '0000-00-00', '2021-03-23', '35275152', 484),
('406', '05', '0000-00-00', '0000-00-00', '', 485),
('246', '01', '0000-00-00', '2021-10-25', '145251000063210 ESTADO', 486),
('246', '02', '0000-00-00', '2021-07-27', 'I53138', 487),
('246', '03', '0000-00-00', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 488),
('246', '04', '0000-00-00', '2021-11-10', '149957386', 489),
('246', '05', '0000-00-00', '0000-00-00', '', 490),
('387', '01', '0000-00-00', '2021-04-17', '13247900000830MUNDIAL', 491),
('387', '02', '0000-00-00', '2021-07-27', 'I52976', 492),
('387', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 493),
('387', '04', '0000-00-00', '2021-01-24', '47902732', 494),
('387', '05', '0000-00-00', '0000-00-00', '', 495),
('247', '01', '0000-00-00', '2021-12-06', '79929133 MUNDIAL', 496),
('247', '02', '0000-00-00', '2021-07-27', 'I52963', 497),
('247', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 498),
('247', '04', '0000-00-00', '2021-02-07', '47688656', 499),
('247', '05', '0000-00-00', '0000-00-00', '', 500),
('653', '01', '0000-00-00', '2021-04-15', '1488200000130 MUNDIAL', 506),
('653', '02', '0000-00-00', '2021-07-27', 'I53009', 507),
('653', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 508),
('653', '04', '0000-00-00', '2021-06-26', '49283350', 509),
('653', '05', '0000-00-00', '0000-00-00', '', 510),
('659', '01', '0000-00-00', '2021-05-21', '14663000002610-DELESTADO', 511),
('659', '02', '0000-00-00', '2021-07-27', 'I52683', 512),
('659', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 513),
('659', '04', '0000-00-00', '2022-05-27', '', 514),
('659', '05', '0000-00-00', '0000-00-00', '', 515),
('140', '01', '2019-01-24', '2021-01-23', '14596000000470-DEL ESTADO', 516),
('140', '02', '2020-07-27', '2021-07-27', 'I52856', 517),
('140', '03', '2020-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 518),
('140', '04', '0000-00-00', '2021-06-09', '46759703', 519),
('140', '05', '0000-00-00', '0000-00-00', '', 520),
('609', '01', '0000-00-00', '2021-06-22', '78662662 MUNDIAL', 521),
('609', '02', '0000-00-00', '2021-07-27', 'I53004', 522),
('609', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 523),
('609', '04', '0000-00-00', '2021-06-23', '48915700', 524),
('609', '05', '0000-00-00', '0000-00-00', '', 525),
('421', '01', '0000-00-00', '2021-07-18', '14093500099390 ESTADO', 526),
('421', '02', '0000-00-00', '2021-07-27', 'I53087', 527),
('421', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 528),
('421', '04', '0000-00-00', '2021-03-10', '47689514', 529),
('421', '05', '0000-00-00', '0000-00-00', '', 530),
('161', '01', '2019-07-22', '2021-07-22', '14093500099980 ESTADO', 536),
('161', '02', '2020-07-27', '2021-07-27', 'I52858', 537),
('161', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 538),
('161', '04', '0000-00-00', '2021-08-18', '142922681', 539),
('161', '05', '0000-00-00', '0000-00-00', '', 540),
('675', '01', '0000-00-00', '2021-11-07', '79583200 MUNDIAL', 541),
('675', '02', '0000-00-00', '2021-07-27', 'I52923', 542),
('675', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 543),
('675', '04', '0000-00-00', '2021-01-11', '45332976', 544),
('675', '05', '0000-00-00', '0000-00-00', '', 545),
('206', '01', '0000-00-00', '2021-05-11', '78270417-MUNDIAL', 546),
('206', '02', '0000-00-00', '2021-07-27', 'I52960', 547),
('206', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 548),
('206', '04', '0000-00-00', '2021-06-30', '47271354', 549),
('206', '05', '0000-00-00', '0000-00-00', '', 550),
('414', '01', '0000-00-00', '2021-04-14', '14670600005980ESTADO', 551),
('414', '02', '0000-00-00', '2021-07-27', 'I53086', 552),
('414', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 553),
('414', '04', '0000-00-00', '2021-07-10', '43136858', 554),
('414', '05', '0000-00-00', '0000-00-00', '', 555),
('424', '01', '0000-00-00', '2020-04-17', '14554900004010- ESTADO', 556),
('424', '02', '0000-00-00', '2019-07-27', '151314', 557),
('424', '03', '2018-10-02', '2021-10-01', '2000016362-16363', 558),
('424', '04', '0000-00-00', '2019-11-07', '40455512', 559),
('424', '05', '0000-00-00', '0000-00-00', '', 560),
('253', '01', '0000-00-00', '2021-02-06', '14525100036050 ESTADO', 561),
('253', '02', '0000-00-00', '2021-07-27', 'I52964', 562),
('253', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 563),
('253', '04', '0000-00-00', '2021-02-08', '48176849', 564),
('253', '05', '0000-00-00', '0000-00-00', '', 565),
('200', '01', '0000-00-00', '2021-12-07', '14525100067210-ESTADO', 566),
('200', '02', '2020-07-27', '2021-07-27', 'I52959', 567),
('200', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 568),
('200', '04', '0000-00-00', '2021-12-14', '150604555', 569),
('200', '05', '0000-00-00', '0000-00-00', '', 570),
('359', '01', '2019-09-30', '2021-09-30', '79182136 MUNDIAL', 571),
('359', '02', '0000-00-00', '2021-07-27', 'I52974', 572),
('359', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 573),
('359', '04', '0000-00-00', '2021-11-14', '150031352', 574),
('359', '05', '0000-00-00', '0000-00-00', '', 575),
('561', '01', '2019-04-15', '2021-04-16', '78217275 MUNDIAL', 576),
('561', '02', '2019-07-27', '2021-07-27', 'I52996', 577),
('561', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 578),
('561', '04', '0000-00-00', '2021-09-04', '', 579),
('561', '05', '0000-00-00', '0000-00-00', '', 580),
('339', '01', '0000-00-00', '2021-04-18', '140935000084170 MUNDIAL ESTADO', 581),
('339', '02', '0000-00-00', '2021-07-27', 'I52882', 582),
('339', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 583),
('339', '04', '0000-00-00', '2021-06-08', '48914459', 584),
('339', '05', '0000-00-00', '0000-00-00', '', 585),
('290', '01', '0000-00-00', '2021-05-12', '24562531-SURA', 586),
('290', '02', '0000-00-00', '2021-07-27', 'I53103', 587),
('290', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 588),
('290', '04', '0000-00-00', '2021-07-05', '49284178', 589),
('290', '05', '0000-00-00', '0000-00-00', '', 590),
('350', '01', '0000-00-00', '2021-05-05', '14098500006920-DEL ESTADO', 591),
('350', '02', '0000-00-00', '2021-07-27', 'I53083', 592),
('350', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 593),
('350', '04', '0000-00-00', '2021-11-11', '149981263', 594),
('350', '05', '0000-00-00', '0000-00-00', '', 595),
('435', '01', '0000-00-00', '2021-03-29', '78106054-600429423-MUNDIAL', 606),
('435', '02', '0000-00-00', '2021-07-27', 'I52892', 607),
('435', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 608),
('435', '04', '0000-00-00', '2021-08-31', '148555335', 609),
('435', '05', '0000-00-00', '0000-00-00', '', 610),
('490', '01', '2019-08-27', '2021-08-27', '78761898', 611),
('490', '02', '2020-07-27', '2021-07-27', 'I52902', 612),
('490', '03', '2018-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 613),
('490', '04', '0000-00-00', '2021-08-27', '', 614),
('490', '05', '0000-00-00', '0000-00-00', '', 615),
('027', '01', '0000-00-00', '2021-08-27', '15063200005270 ESTADO', 621),
('027', '02', '2020-07-27', '2021-07-27', 'I52830', 622),
('027', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 623),
('027', '04', '0000-00-00', '2021-12-26', '150877903', 624),
('027', '05', '0000-00-00', '0000-00-00', '', 625),
('485', '01', '0000-00-00', '2021-02-24', '14605500000150 ESTADO', 626),
('485', '02', '0000-00-00', '2021-07-27', 'I52901', 627),
('485', '03', '2018-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 628),
('485', '04', '0000-00-00', '2021-06-04', '46601152', 629),
('485', '05', '0000-00-00', '0000-00-00', '', 630),
('608', '01', '0000-00-00', '2021-10-26', '79458955 MUNDIAL', 631),
('608', '02', '0000-00-00', '2021-07-27', 'I53003', 632),
('608', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 633),
('608', '04', '0000-00-00', '2021-10-30', '149757014', 634),
('608', '05', '0000-00-00', '0000-00-00', '', 635),
('239', '01', '0000-00-00', '2021-12-23', '79695983--MUNDIAL', 636),
('239', '02', '0000-00-00', '2021-07-27', 'I52961', 637),
('239', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 638),
('239', '04', '0000-00-00', '2021-12-19', '150737339', 639),
('239', '05', '0000-00-00', '0000-00-00', '', 640),
('516', '01', '0000-00-00', '2021-11-28', '145251000066100-DEL ESTADO', 646),
('516', '02', '0000-00-00', '2021-07-27', 'I52987', 647),
('516', '03', '2018-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 648),
('516', '04', '0000-00-00', '2021-12-12', '150756487', 649),
('516', '05', '0000-00-00', '0000-00-00', '', 650),
('145', '01', '0000-00-00', '2021-07-16', '75860599 DEL ESTADO', 651),
('145', '02', '2020-07-27', '2021-07-27', 'I53078', 652),
('145', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 653),
('145', '04', '0000-00-00', '2021-03-03', '48584458', 654),
('145', '05', '0000-00-00', '0000-00-00', '', 655),
('097', '01', '0000-00-00', '2021-02-01', '77931622 MUNDIAL', 656),
('097', '02', '2020-07-27', '2021-07-27', 'I53075', 657),
('097', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 658),
('097', '04', '0000-00-00', '2021-11-18', '150067615', 659),
('097', '05', '0000-00-00', '0000-00-00', '', 660),
('597', '01', '0000-00-00', '2020-11-18', '77333261 MUNDIAL', 661),
('597', '02', '0000-00-00', '2021-07-27', 'I52958', 662),
('597', '03', '2019-10-02', '2020-10-02', 'AA006911-6912 LA EQUIDAD', 663),
('597', '04', '0000-00-00', '2020-08-03', '', 664),
('597', '05', '0000-00-00', '0000-00-00', '', 665),
('383', '01', '0000-00-00', '2021-08-25', '79028719 MUNDIAL', 666),
('383', '02', '0000-00-00', '2021-07-27', 'I53165', 667),
('383', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 668),
('383', '04', '0000-00-00', '2021-08-28', '', 669),
('383', '05', '0000-00-00', '0000-00-00', '', 670),
('333', '01', '0000-00-00', '2021-06-13', '78500142 MUNDIAL', 671),
('333', '02', '0000-00-00', '2021-07-27', 'I52970', 672),
('333', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 673),
('333', '04', '0000-00-00', '2021-01-13', '', 674),
('333', '05', '0000-00-00', '0000-00-00', '', 675),
('665', '01', '0000-00-00', '2021-10-15', '79317438 MUNDIAL', 681),
('665', '02', '0000-00-00', '2021-07-27', 'I52920', 682),
('665', '03', '2019-10-02', '2021-10-02', 'AA006911-8861LA EQUIDAD', 683),
('665', '04', '0000-00-00', '2021-11-18', '150086763', 684),
('665', '05', '0000-00-00', '0000-00-00', '', 685),
('177', '01', '0000-00-00', '2021-11-23', '12666200025120	ESTADO', 686),
('177', '02', '2020-07-27', '2021-07-27', 'I52956', 687),
('177', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 688),
('177', '04', '0000-00-00', '2021-11-25', '150194822', 689),
('177', '05', '0000-00-00', '0000-00-00', '', 690),
('410', '01', '2019-09-28', '2021-09-28', '14554900040920 ESTADO', 691),
('410', '02', '2019-07-27', '2021-07-27', 'I52891', 692),
('410', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 693),
('410', '04', '0000-00-00', '2021-09-17', '148938970', 694),
('410', '05', '0000-00-00', '0000-00-00', '', 695),
('158', '01', '0000-00-00', '2021-04-14', '14882900000090ESTADO', 696),
('158', '02', '2020-07-27', '2021-07-27', 'I52954', 697),
('158', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 698),
('158', '04', '0000-00-00', '2021-03-04', '', 699),
('158', '05', '0000-00-00', '0000-00-00', '', 700),
('310', '01', '2019-09-24', '2021-09-25', '79336039- MUNDIAL', 701),
('310', '02', '2019-07-27', '2021-07-27', 'I53080', 702),
('310', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 703),
('310', '04', '0000-00-00', '2021-09-21', '149150460', 704),
('310', '05', '0000-00-00', '0000-00-00', '', 705),
('335', '01', '0000-00-00', '2021-05-12', '78323135600432686 mundial', 706),
('335', '02', '0000-00-00', '2021-07-27', 'I52880', 707),
('335', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 708),
('335', '04', '0000-00-00', '2021-06-18', '146984084', 709),
('335', '05', '0000-00-00', '0000-00-00', '', 710),
('175', '01', '0000-00-00', '2021-01-25', '13246600003860 ESTADO', 711),
('175', '02', '2020-07-27', '2021-07-27', 'I53079', 712),
('175', '03', '2018-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 713),
('175', '04', '0000-00-00', '2021-06-26', '49283300', 714),
('175', '05', '0000-00-00', '0000-00-00', '', 715),
('432', '01', '0000-00-00', '2021-07-21', '78270662- MUNDIAL', 716),
('432', '02', '0000-00-00', '2021-07-27', 'I53089', 717),
('432', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 718),
('432', '04', '0000-00-00', '2021-03-12', '', 719),
('432', '05', '0000-00-00', '0000-00-00', '', 720),
('362', '01', '2019-08-26', '2021-08-26', '78661998 MUNDIAL', 721),
('362', '02', '0000-00-00', '2021-07-27', 'I52884', 722),
('362', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 723),
('362', '04', '0000-00-00', '2021-09-10', '', 724),
('362', '05', '0000-00-00', '0000-00-00', '', 725),
('688', '01', '0000-00-00', '2019-07-10', '39606440 ESTADO', 726),
('688', '02', '0000-00-00', '2019-07-27', '151376', 727),
('688', '03', '2018-10-02', '2021-10-01', '2000016362-16363', 728),
('688', '04', '0000-00-00', '2019-07-19', '', 729),
('688', '05', '0000-00-00', '0000-00-00', '', 730),
('164', '01', '0000-00-00', '2021-12-22', '145251000069190 DEL ESTADO', 731),
('164', '02', '2020-07-27', '2021-07-27', 'I52955', 732),
('164', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 733),
('164', '04', '0000-00-00', '2021-01-17', '', 734),
('164', '05', '0000-00-00', '0000-00-00', '', 735),
('712', '01', '2020-05-14', '2021-05-15', '78335167600423069', 736),
('712', '02', '2020-07-27', '2021-07-27', '152684', 737),
('712', '03', '2019-10-01', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 738),
('712', '04', '0000-00-00', '2023-07-01', '42431352', 739),
('712', '05', '0000-00-00', '0000-00-00', '', 740),
('572', '01', '0000-00-00', '2021-10-20', '14525100062890 ESTADO', 741),
('572', '02', '0000-00-00', '2021-07-27', 'I52908', 742),
('572', '03', '0000-00-00', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 743),
('572', '04', '0000-00-00', '2021-10-20', '', 744),
('572', '05', '0000-00-00', '0000-00-00', '', 745),
('364', '01', '2019-11-06', '2021-12-07', '14128100002240 ESTADO', 746),
('364', '02', '2020-07-27', '2021-07-27', '153018', 747),
('364', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 748),
('364', '04', '0000-00-00', '2021-12-07', '150455554', 749),
('364', '05', '0000-00-00', '0000-00-00', '', 750),
('020', '01', '2019-10-27', '2021-10-27', '14525100063280 ESTADO', 751),
('020', '02', '2020-07-27', '2021-07-27', 'I52828', 752),
('020', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 753),
('020', '04', '0000-00-00', '2021-10-26', '149680731', 754),
('020', '05', '0000-00-00', '0000-00-00', '', 755),
('568', '01', '0000-00-00', '2020-01-30', '13246600000290', 756),
('568', '02', '0000-00-00', '2019-07-27', '151119', 757),
('568', '03', '2018-10-02', '2021-10-01', '2000016362-16363', 758),
('568', '04', '0000-00-00', '2020-01-31', '', 759),
('568', '05', '0000-00-00', '0000-00-00', '', 760),
('296', '01', '0000-00-00', '2021-11-27', '14715300001720 ESTADO', 761),
('296', '02', '0000-00-00', '2021-07-27', 'I52874', 762),
('296', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 763),
('296', '04', '0000-00-00', '2021-01-24', '47902733', 764),
('296', '05', '0000-00-00', '0000-00-00', '', 765),
('245', '01', '2020-05-30', '2021-05-31', '14098500009100', 766),
('245', '02', '2020-07-27', '2021-07-27', 'I52962', 767),
('245', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 768),
('245', '04', '2021-06-14', '2021-06-14', '146903459', 769),
('245', '05', '0000-00-00', '0000-00-00', '', 770),
('114', '01', '0000-00-00', '2021-10-24', '14525100063130ESTADO', 771),
('114', '02', '2020-07-27', '2021-07-27', 'I52950', 772),
('114', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 773),
('114', '04', '0000-00-00', '2021-11-21', '150147283', 774),
('114', '05', '0000-00-00', '0000-00-00', '', 775),
('481', '01', '0000-00-00', '2020-01-14', '14093500012410 ESTADO', 776),
('481', '02', '0000-00-00', '2019-07-27', '151305', 777),
('481', '03', '2018-10-02', '2021-10-01', '2000016362-16363', 778),
('481', '04', '0000-00-00', '2020-02-28', '', 779),
('481', '05', '0000-00-00', '0000-00-00', '', 780),
('683', '01', '0000-00-00', '2019-12-26', '14093500007780-ESTADO', 781),
('683', '02', '0000-00-00', '2020-07-27', 'I52096', 782),
('683', '03', '2018-10-02', '2019-10-02', '2000016362-16363', 783),
('683', '04', '0000-00-00', '2020-01-10', '41562447', 784),
('683', '05', '0000-00-00', '0000-00-00', '', 785),
('219', '01', '0000-00-00', '2021-12-14', '14525100067770-ESTADO', 786),
('219', '02', '0000-00-00', '2021-07-27', 'I52863', 787),
('219', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 788),
('219', '04', '0000-00-00', '2021-12-18', '150698347', 789),
('219', '05', '0000-00-00', '0000-00-00', '', 790),
('489', '01', '0000-00-00', '2021-04-13', '14093500083770ESTADO', 791),
('489', '02', '0000-00-00', '2021-07-27', 'I53091', 792),
('489', '03', '2018-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 793),
('489', '04', '0000-00-00', '2021-06-04', '48914052', 794),
('489', '05', '0000-00-00', '0000-00-00', '', 795),
('684', '01', '0000-00-00', '2020-06-13', '76394609  MUNDIAL', 796),
('684', '02', '0000-00-00', '2019-07-27', '151258', 797),
('684', '03', '2018-10-02', '2021-10-01', '2000016362-16363', 798),
('684', '04', '0000-00-00', '2020-06-14', '141920582', 799),
('684', '05', '0000-00-00', '0000-00-00', '', 800),
('710', '01', '0000-00-00', '2019-11-16', '14093500005140 ESTADO', 806),
('710', '02', '0000-00-00', '2019-07-27', '151104', 807),
('710', '03', '2018-10-02', '2021-10-01', '2000016362-16363', 808),
('710', '04', '0000-00-00', '2019-05-25', '37856281', 809),
('710', '05', '0000-00-00', '0000-00-00', '', 810),
('488', '01', '2020-11-19', '2021-12-03', '14859400008920 ESTADO', 811),
('488', '02', '2019-10-04', '2021-07-27', 'I52931', 812),
('488', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 813),
('488', '04', '0000-00-00', '2021-01-24', '145563916', 814),
('488', '05', '0000-00-00', '0000-00-00', '', 815),
('420', '01', '0000-00-00', '2020-02-13', '75741073 MUNDIAL', 816),
('420', '02', '0000-00-00', '2019-07-27', '151152', 817),
('420', '03', '2018-10-02', '2021-10-01', '2000016362-16363', 818),
('420', '04', '0000-00-00', '2020-02-25', '', 819),
('420', '05', '0000-00-00', '0000-00-00', '', 820),
('369', '01', '2019-10-07', '2020-10-05', '77111749 MUNDIAL', 826),
('369', '02', '2019-10-07', '2020-07-27', '', 827),
('369', '03', '2019-10-02', '2020-10-02', 'AA006911-6912 LA EQUIDAD', 828),
('369', '04', '0000-00-00', '2020-12-04', '', 829),
('369', '05', '0000-00-00', '0000-00-00', '', 830),
('087', '01', '0000-00-00', '2021-12-30', '79632097 MUNDIAL', 831),
('087', '02', '2020-07-27', '2021-07-27', 'I53074', 832),
('087', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 833),
('087', '04', '0000-00-00', '2021-02-19', '48177298', 834),
('087', '05', '0000-00-00', '0000-00-00', '', 835),
('355', '01', '0000-00-00', '2021-11-25', '14525100065780- ESTADO', 836),
('355', '02', '2020-07-27', '2021-07-27', '152972', 837),
('355', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 838),
('355', '04', '0000-00-00', '2021-12-09', '150381490', 839),
('355', '05', '0000-00-00', '0000-00-00', '', 840),
('293', '01', '0000-00-00', '2021-11-13', '14525100064770 ESTADO', 841),
('293', '02', '0000-00-00', '2021-07-27', 'I52872', 842),
('293', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 843),
('293', '04', '0000-00-00', '2021-02-27', '48177667', 844),
('293', '05', '0000-00-00', '0000-00-00', '', 845),
('504', '01', '0000-00-00', '2021-12-30', '14596000001280- ESTADO', 846),
('504', '02', '0000-00-00', '2021-07-27', 'I52597', 847),
('504', '03', '2018-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 848),
('504', '04', '0000-00-00', '2022-01-03', '', 849),
('504', '05', '0000-00-00', '0000-00-00', '', 850),
('230', '01', '0000-00-00', '2021-08-03', '14525100051310-ESTADO', 851),
('230', '02', '0000-00-00', '2021-07-27', 'I52867', 852),
('230', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 853),
('230', '04', '0000-00-00', '2021-08-10', '14818024', 854),
('230', '05', '0000-00-00', '0000-00-00', '', 855),
('241', '01', '0000-00-00', '2019-01-14', '38129794 ESTADO', 856),
('241', '02', '0000-00-00', '2019-07-27', '151196', 857),
('241', '03', '2018-10-02', '2021-10-01', '2000016362-16363', 858),
('241', '04', '0000-00-00', '2019-01-20', '', 859),
('241', '05', '0000-00-00', '0000-00-00', '', 860),
('471', '01', '0000-00-00', '2021-05-01', '78106056-600429557-MUNDIL', 861),
('471', '02', '0000-00-00', '2021-07-27', 'I52900', 862),
('471', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 863),
('471', '04', '0000-00-00', '2021-07-03', '49283927', 864),
('471', '05', '0000-00-00', '0000-00-00', '', 865),
('707', '01', '0000-00-00', '2021-10-15', '79317439 MUNDIAL', 866),
('707', '02', '0000-00-00', '2021-07-27', 'I53017', 867),
('707', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 868),
('707', '04', '0000-00-00', '2021-10-24', '149654327', 869),
('707', '05', '0000-00-00', '0000-00-00', '', 870),
('467', '01', '2019-10-07', '2021-10-02', '14859400004590 ESTADO', 871),
('467', '02', '2019-10-07', '2021-07-27', 'I52897', 872),
('467', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 873),
('467', '04', '0000-00-00', '2021-09-09', '148779999', 874),
('467', '05', '0000-00-00', '0000-00-00', '', 875),
('646', '01', '2017-05-31', '2019-08-31', '14093500000890', 876),
('646', '02', '0000-00-00', '2019-07-27', '151298', 877),
('646', '03', '2018-10-02', '2021-10-01', '2000016362-16363', 878),
('646', '04', '0000-00-00', '2019-09-11', '', 879),
('646', '05', '0000-00-00', '0000-00-00', '', 880),
('521', '01', '0000-00-00', '2021-08-29', '79181955-MUNDIAL', 881),
('521', '02', '0000-00-00', '2021-07-27', 'I53169', 882),
('521', '03', '2018-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 883),
('521', '04', '0000-00-00', '2021-09-02', '', 884),
('521', '05', '0000-00-00', '0000-00-00', '', 885),
('413', '01', '0000-00-00', '2021-04-13', '14670600005950ESTADO', 886),
('413', '02', '0000-00-00', '2021-07-27', 'I53106', 887),
('413', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 888),
('413', '04', '0000-00-00', '2021-07-24', '147887529', 889),
('413', '05', '0000-00-00', '0000-00-00', '', 890),
('012', '01', '0000-00-00', '2021-05-30', '78312719 MUNDIAL', 891),
('012', '02', '2020-07-27', '2021-07-27', 'I52825', 892),
('012', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 893),
('012', '04', '0000-00-00', '2021-06-10', '48914682', 894),
('012', '05', '0000-00-00', '0000-00-00', '', 895),
('674', '01', '0000-00-00', '2021-02-28', '14093500079780 ESTADO', 896),
('674', '02', '2020-08-27', '2021-07-27', '152922', 897),
('674', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 898),
('674', '04', '0000-00-00', '2021-03-08', '48584730', 899),
('674', '05', '0000-00-00', '0000-00-00', '', 900),
('460', '01', '0000-00-00', '2021-07-15', '78661993 MUNDIAL', 901),
('460', '02', '0000-00-00', '2021-07-27', 'I52896', 902),
('460', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 903),
('460', '04', '0000-00-00', '2021-07-27', '147946852', 904),
('460', '05', '0000-00-00', '0000-00-00', '', 905),
('564', '01', '0000-00-00', '2021-12-04', '79583202 MUNDIAL', 906),
('564', '02', '0000-00-00', '2021-07-27', 'I53110', 907),
('564', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 908),
('564', '04', '0000-00-00', '2021-12-26', '150800953', 909),
('564', '05', '0000-00-00', '0000-00-00', '', 910),
('714', '01', '0000-00-00', '2022-01-07', '14525100071520 DEL ESTADO', 911),
('714', '02', '0000-00-00', '2021-07-27', 'I52930', 912),
('714', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 913),
('714', '04', '0000-00-00', '2022-01-07', '151116644', 914),
('714', '05', '0000-00-00', '0000-00-00', '', 915),
('015', '01', '2020-07-14', '2021-07-14', '14093500098930 ESTADO', 916),
('015', '02', '2020-07-27', '2021-07-27', 'I53112', 917),
('015', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 918),
('015', '04', '0000-00-00', '2022-07-16', '', 919),
('015', '05', '0000-00-00', '0000-00-00', '', 920),
('157', '01', '2020-04-20', '2021-04-20', '77878282-MUNDIAL', 921),
('157', '02', '2020-07-27', '2021-07-27', 'I52953', 922),
('157', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 923),
('157', '04', '0000-00-00', '2021-06-06', '46666674', 924),
('157', '05', '0000-00-00', '0000-00-00', '', 925),
('569', '01', '0000-00-00', '2021-12-09', '79874627 MUNDIAL', 936),
('569', '02', '0000-00-00', '2021-07-27', 'I52907', 937),
('569', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 938),
('569', '04', '0000-00-00', '2021-03-03', '', 939),
('569', '05', '0000-00-00', '0000-00-00', '', 940),
('018', '01', '0000-00-00', '2021-10-19', '14859400005980 ESTADO', 941),
('018', '02', '2020-07-27', '2021-07-27', 'I52940', 942),
('018', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 943),
('018', '04', '0000-00-00', '2021-10-20', '149577648', 944),
('018', '05', '0000-00-00', '0000-00-00', '', 945),
('705', '01', '2019-10-05', '2021-10-05', '14859400004890 ESTADO', 946),
('705', '02', '2019-10-01', '2021-07-27', 'I52928', 947),
('705', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 948),
('705', '04', '0000-00-00', '2021-10-24', '149655718', 949),
('705', '05', '0000-00-00', '0000-00-00', '', 950),
('073', '01', '0000-00-00', '2021-06-02', '78322477-MUNDIAL', 951),
('073', '02', '0000-00-00', '2021-07-27', 'I52948', 952),
('073', '03', '0000-00-00', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 953),
('073', '04', '0000-00-00', '2021-06-27', '49283396', 954),
('073', '05', '0000-00-00', '0000-00-00', '', 955);
INSERT INTO `veh_doc` (`id_movil`, `id_documento`, `fecha_exp`, `fecha_ven`, `numero`, `idcons`) VALUES
('526', '01', '0000-00-00', '2021-12-04', '14525100066720 ESTADO', 956),
('526', '02', '0000-00-00', '2021-07-27', 'I52988', 957),
('526', '03', '2018-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 958),
('526', '04', '0000-00-00', '2021-11-28', '150264303', 959),
('526', '05', '0000-00-00', '0000-00-00', '', 960),
('297', '01', '0000-00-00', '2021-05-28', '77933873-MUNDIAL', 961),
('297', '02', '0000-00-00', '2021-07-27', 'I52875', 962),
('297', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 963),
('297', '04', '0000-00-00', '2021-12-05', '150406695', 964),
('297', '05', '0000-00-00', '0000-00-00', '', 965),
('538', '01', '0000-00-00', '2021-11-30', '1508004558401000 PREVISORA', 966),
('538', '02', '0000-00-00', '2021-07-27', 'I52992', 967),
('538', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 968),
('538', '04', '0000-00-00', '2021-12-29', '150955216', 969),
('538', '05', '0000-00-00', '0000-00-00', '', 970),
('663', '01', '0000-00-00', '2021-12-05', '79928022 MUNDIAL', 971),
('663', '02', '0000-00-00', '2021-07-27', 'I53011', 972),
('663', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 973),
('663', '04', '0000-00-00', '2021-12-11', '150317053', 974),
('663', '05', '0000-00-00', '0000-00-00', '', 975),
('549', '01', '0000-00-00', '2021-05-06', '14098500007070-ESTADO', 981),
('549', '02', '0000-00-00', '2021-07-27', 'I53113', 982),
('549', '03', '0000-00-00', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 983),
('549', '04', '0000-00-00', '2021-06-25', '49283189', 984),
('549', '05', '0000-00-00', '0000-00-00', '', 985),
('337', '01', '0000-00-00', '2020-05-31', '76361828 MUNDIAL', 986),
('337', '02', '0000-00-00', '2020-07-27', 'I52164', 987),
('337', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 988),
('337', '04', '0000-00-00', '2020-08-08', '45023918', 989),
('337', '05', '0000-00-00', '0000-00-00', '', 990),
('553', '01', '0000-00-00', '2021-04-02', '76051004 MUNDIAL', 991),
('553', '02', '0000-00-00', '2021-07-27', 'I52995', 992),
('553', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 993),
('553', '04', '0000-00-00', '2021-06-06', '48914291', 994),
('553', '05', '0000-00-00', '0000-00-00', '', 995),
('667', '01', '0000-00-00', '2020-01-31', '14093500014890-estado', 996),
('667', '02', '0000-00-00', '2019-07-27', '151111', 997),
('667', '03', '2018-10-02', '2021-10-01', '2000016362-16363', 998),
('667', '04', '0000-00-00', '2020-02-16', '', 999),
('667', '05', '0000-00-00', '0000-00-00', '', 1000),
('217', '01', '0000-00-00', '2021-05-28', '14128100001340-DEL ESTADO', 1001),
('217', '02', '0000-00-00', '2021-07-27', 'I52862', 1002),
('217', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1003),
('217', '04', '0000-00-00', '2021-06-04', '48914110', 1004),
('217', '05', '0000-00-00', '0000-00-00', '', 1005),
('254', '01', '0000-00-00', '2020-04-13', '75860589-MUNDIAL', 1006),
('254', '02', '0000-00-00', '2020-07-27', 'I52228', 1007),
('254', '03', '2019-10-02', '2020-10-02', 'AA006911-6912 LA EQUIDAD', 1008),
('254', '04', '0000-00-00', '2020-05-04', '41621174', 1009),
('254', '05', '0000-00-00', '0000-00-00', '', 1010),
('595', '01', '0000-00-00', '2019-06-09', '19044707 MUNDIAL', 1011),
('595', '02', '0000-00-00', '2019-07-27', '151322', 1012),
('595', '03', '2018-10-02', '2021-10-01', '2000016362-16363', 1013),
('595', '04', '0000-00-00', '2019-06-25', '37112113', 1014),
('595', '05', '0000-00-00', '0000-00-00', '', 1015),
('615', '01', '0000-00-00', '2021-02-25', '14128100000980- ESTADO', 1016),
('615', '02', '0000-00-00', '2021-07-27', 'I53005', 1017),
('615', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1018),
('615', '04', '0000-00-00', '2021-07-07', '49189330', 1019),
('615', '05', '0000-00-00', '0000-00-00', '', 1020),
('596', '01', '0000-00-00', '2021-07-03', '78761625- MUNDIAL', 1021),
('596', '02', '0000-00-00', '2021-07-27', 'I52999', 1022),
('596', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1023),
('596', '04', '0000-00-00', '2021-02-25', '', 1024),
('596', '05', '0000-00-00', '0000-00-00', '', 1025),
('585', '01', '0000-00-00', '2021-12-11', '14525100067480SEGURODEL ESTADO', 1026),
('585', '02', '0000-00-00', '2021-07-27', 'I52910', 1027),
('585', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1028),
('585', '04', '0000-00-00', '2021-12-12', '150565413', 1029),
('585', '05', '0000-00-00', '0000-00-00', '', 1030),
('312', '01', '0000-00-00', '2021-03-11', '14525100040420 ESTADO', 1046),
('312', '02', '0000-00-00', '2021-07-27', 'I52877', 1047),
('312', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1048),
('312', '04', '0000-00-00', '2021-03-12', '48584913', 1049),
('312', '05', '0000-00-00', '0000-00-00', '', 1050),
('620', '01', '2020-08-01', '2021-08-09', '786611995 ESTADO', 1051),
('620', '02', '2019-07-27', '2021-07-27', 'I52914', 1052),
('620', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1053),
('620', '04', '0000-00-00', '2021-08-12', '', 1054),
('620', '05', '0000-00-00', '0000-00-00', '', 1055),
('601', '01', '0000-00-00', '2021-10-19', '79317442 MUNDIAL', 1056),
('601', '02', '0000-00-00', '2021-07-27', 'I52912', 1057),
('601', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1058),
('601', '04', '0000-00-00', '2021-10-26', '149687678', 1059),
('601', '05', '0000-00-00', '0000-00-00', '', 1060),
('189', '01', '0000-00-00', '2021-06-12', '78661441-MUNDIAL', 1076),
('189', '02', '2020-07-27', '2021-07-27', 'I52957', 1077),
('189', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1078),
('189', '04', '0000-00-00', '2021-06-09', '146758156', 1079),
('189', '05', '0000-00-00', '0000-00-00', '', 1080),
('603', '01', '2019-10-21', '2021-10-21', '14715300001220- ESTADO', 1086),
('603', '02', '0000-00-00', '2021-07-27', 'I53000', 1087),
('603', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1088),
('603', '04', '0000-00-00', '2021-11-19', '149998888', 1089),
('603', '05', '0000-00-00', '0000-00-00', '', 1090),
('642', '01', '0000-00-00', '2019-11-13', '14093500004980 ESTADO', 1091),
('642', '02', '0000-00-00', '2019-07-27', '151297', 1092),
('642', '03', '2018-10-02', '2021-10-01', '2000016362-16363', 1093),
('642', '04', '0000-00-00', '2019-11-29', '', 1094),
('642', '05', '0000-00-00', '0000-00-00', '', 1095),
('080', '01', '0000-00-00', '2021-11-20', '14554900043250-DEL ESTADO', 1096),
('080', '02', '0000-00-00', '2021-07-27', '153121', 1097),
('080', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1098),
('080', '04', '0000-00-00', '2021-12-01', '150331541', 1099),
('080', '05', '0000-00-00', '0000-00-00', '', 1100),
('621', '01', '0000-00-00', '2021-11-05', '79225855 MUNDIAL', 1101),
('621', '02', '0000-00-00', '2021-07-27', 'I52915', 1102),
('621', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1103),
('621', '04', '0000-00-00', '2021-11-10', '149953672', 1104),
('621', '05', '0000-00-00', '0000-00-00', '', 1105),
('395', '01', '2019-08-14', '2021-08-18', '14378300001390', 1111),
('395', '02', '0000-00-00', '2021-07-27', 'I53117', 1112),
('395', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1113),
('395', '04', '0000-00-00', '2021-08-08', '148150853', 1114),
('395', '05', '0000-00-00', '0000-00-00', '', 1115),
('693', '01', '2019-09-26', '2021-09-28', '79329330 MUNDIAL', 1116),
('693', '02', '2019-07-27', '2021-07-27', 'I52927', 1117),
('693', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1118),
('693', '04', '0000-00-00', '2021-10-05', '', 1119),
('693', '05', '0000-00-00', '0000-00-00', '', 1120),
('484', '01', '0000-00-00', '2021-03-07', '77840055 MUNDIAL', 1131),
('484', '02', '0000-00-00', '2021-07-27', 'I52898', 1132),
('484', '03', '2018-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1133),
('484', '04', '0000-00-00', '2021-03-16', '146415987', 1134),
('484', '05', '0000-00-00', '0000-00-00', '', 1135),
('425', '01', '0000-00-00', '2021-01-20', '14093500072040 ESTADO', 1136),
('425', '02', '0000-00-00', '2021-07-27', 'I52879', 1137),
('425', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1138),
('425', '04', '0000-00-00', '2021-02-03', '', 1139),
('425', '05', '0000-00-00', '0000-00-00', '', 1140),
('720', '01', '0000-00-00', '2021-03-12', '77840056 MUNDIAL', 1141),
('720', '02', '0000-00-00', '2021-07-27', 'I53102', 1142),
('720', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1143),
('720', '04', '0000-00-00', '2021-07-04', '49284081', 1144),
('720', '05', '0000-00-00', '0000-00-00', '', 1145),
('205', '01', '2019-10-07', '2021-10-13', '1461310003360 ESTADO', 1146),
('205', '02', '2020-07-27', '2021-07-27', 'I53116', 1147),
('205', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1148),
('205', '04', '0000-00-00', '2021-10-13', '149443528', 1149),
('205', '05', '0000-00-00', '0000-00-00', '', 1150),
('101', '01', '0000-00-00', '2021-11-26', '1459400008410DELESTADO', 1156),
('101', '02', '2020-07-27', '2021-07-27', 'I52949', 1157),
('101', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1158),
('101', '04', '0000-00-00', '2021-11-10', '149947853', 1159),
('101', '05', '0000-00-00', '0000-00-00', '', 1160),
('179', '01', '0000-00-00', '2021-06-16', '14093500092530-ESTADO', 1166),
('179', '02', '2020-07-27', '2021-07-27', 'I52859', 1167),
('179', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1168),
('179', '04', '0000-00-00', '2021-06-27', '49189064', 1169),
('179', '05', '0000-00-00', '0000-00-00', '', 1170),
('320', '01', '0000-00-00', '2021-06-27', '14093500095130-DEL ESTADO', 1171),
('320', '02', '0000-00-00', '2021-07-27', 'I53081', 1172),
('320', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1173),
('320', '04', '0000-00-00', '2021-07-17', '147777189', 1174),
('320', '05', '0000-00-00', '0000-00-00', '', 1175),
('452', '01', '0000-00-00', '2021-12-13', '14922100000210 - ESTADO', 1176),
('452', '02', '2020-07-27', '2021-07-27', 'I52983', 1177),
('452', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1178),
('452', '04', '0000-00-00', '2022-01-09', '151166063', 1179),
('452', '05', '0000-00-00', '0000-00-00', '', 1180),
('376', '01', '0000-00-00', '2021-10-01', '14859400004600 ESTADO', 1181),
('376', '02', '0000-00-00', '2021-07-27', 'I52885', 1182),
('376', '03', '0000-00-00', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1183),
('376', '04', '0000-00-00', '2021-10-30', '149757030', 1184),
('376', '05', '0000-00-00', '0000-00-00', '', 1185),
('192', '01', '0000-00-00', '2021-08-05', '15063200001110 ESTADO', 1191),
('192', '02', '0000-00-00', '2021-07-27', 'I52958', 1192),
('192', '03', '0000-00-00', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1193),
('192', '04', '0000-00-00', '2021-08-27', '', 1194),
('192', '05', '0000-00-00', '0000-00-00', '', 1195),
('591', '01', '0000-00-00', '2019-11-14', '14093500005020 ESTADO', 1196),
('591', '02', '0000-00-00', '2019-07-27', '151149', 1197),
('591', '03', '2018-10-02', '2021-10-01', '2000016362-16363', 1198),
('591', '04', '0000-00-00', '2020-04-29', '', 1199),
('591', '05', '0000-00-00', '0000-00-00', '', 1200),
('422', '01', '0000-00-00', '2021-04-16', '78217276-MUNDIAL', 1201),
('422', '02', '0000-00-00', '2021-07-27', 'I52979', 1202),
('422', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1203),
('422', '04', '0000-00-00', '2021-12-30', '151004201', 1204),
('422', '05', '0000-00-00', '0000-00-00', '', 1205),
('108', '01', '0000-00-00', '2021-04-23', '14093500084860 ESTADO', 1206),
('108', '02', '2020-07-27', '2021-07-27', 'I53076', 1207),
('108', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1208),
('108', '04', '0000-00-00', '2021-07-06', '49284199', 1209),
('108', '05', '0000-00-00', '0000-00-00', '', 1210),
('600', '01', '0000-00-00', '2021-07-14', '78572935-MUNDIAL', 1211),
('600', '02', '0000-00-00', '2021-07-27', 'I53098', 1212),
('600', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1213),
('600', '04', '0000-00-00', '2021-07-18', '147793642', 1214),
('600', '05', '0000-00-00', '0000-00-00', '', 1215),
('002', '01', '0000-00-00', '2021-03-02', '77840054 MUNDIAL', 1216),
('002', '02', '0000-00-00', '2021-07-27', 'I52822', 1217),
('002', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1218),
('002', '04', '0000-00-00', '2021-03-03', '', 1219),
('002', '05', '0000-00-00', '0000-00-00', '', 1220),
('030', '01', '0000-00-00', '2021-07-31', '78270663 MUNDIAL', 1221),
('030', '02', '2020-07-27', '2021-07-27', 'I52831', 1222),
('030', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1223),
('030', '04', '0000-00-00', '2021-08-04', '148075118', 1224),
('030', '05', '0000-00-00', '0000-00-00', '', 1225),
('494', '01', '2020-05-22', '2021-05-21', '78270419-MUNDIAL', 1226),
('494', '02', '2020-07-27', '2021-07-27', 'I52986', 1227),
('494', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1228),
('494', '04', '0000-00-00', '2021-09-26', '149122593', 1229),
('494', '05', '0000-00-00', '0000-00-00', '', 1230),
('529', '01', '2020-08-03', '2021-08-03', '14525100051060 ESTADO', 1231),
('529', '02', '0000-00-00', '2021-07-27', 'I52990', 1232),
('529', '03', '2018-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1233),
('529', '04', '2021-08-04', '2021-08-04', '148074992', 1234),
('529', '05', '0000-00-00', '0000-00-00', '', 1235),
('643', '01', '0000-00-00', '2019-07-30', '39693968 ESTADO', 1236),
('643', '02', '0000-00-00', '2019-07-27', '151094', 1237),
('643', '03', '2018-10-02', '2021-10-01', '2000016362-16363', 1238),
('643', '04', '0000-00-00', '2019-08-01', '', 1239),
('643', '05', '0000-00-00', '0000-00-00', '', 1240),
('633', '01', '0000-00-00', '2021-07-28', '14554900035700 ESTADO', 1241),
('633', '02', '0000-00-00', '2021-07-27', 'I53119', 1242),
('633', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1243),
('633', '04', '0000-00-00', '2021-07-29', '142408272', 1244),
('633', '05', '0000-00-00', '0000-00-00', '', 1245),
('656', '01', '2019-09-04', '2021-09-05', '14554900039440 ESTADO', 1246),
('656', '02', '2020-07-27', '2021-07-27', 'I52917', 1247),
('656', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1248),
('656', '04', '2021-09-07', '2021-09-07', '', 1249),
('656', '05', '0000-00-00', '0000-00-00', '', 1250),
('048', '01', '2019-01-03', '2022-01-04', '14525100070010- ESTADO', 1251),
('048', '02', '2020-07-27', '2021-07-27', 'I52943', 1252),
('048', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1253),
('048', '04', '0000-00-00', '2021-08-21', '148397454', 1254),
('048', '05', '0000-00-00', '0000-00-00', '', 1255),
('552', '01', '2019-10-09', '2021-11-04', '79661470 MUNDIAL', 1256),
('552', '02', '2019-10-09', '2021-07-27', 'I52994', 1257),
('552', '03', '2019-10-09', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1258),
('552', '04', '0000-00-00', '2021-11-06', '149847071', 1259),
('552', '05', '0000-00-00', '0000-00-00', '', 1260),
('330', '01', '2019-10-05', '2021-10-06', '79182138 MUNDIAL', 1261),
('330', '02', '2019-10-01', '2021-07-27', 'I52878', 1262),
('330', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1263),
('330', '04', '0000-00-00', '2021-10-24', '149661680', 1264),
('330', '05', '0000-00-00', '0000-00-00', '', 1265),
('065', '01', '2019-11-13', '2021-12-02', '14308400003130 ESTADO', 1266),
('065', '02', '2020-07-27', '2021-12-11', 'I53314', 1267),
('065', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1268),
('065', '04', '0000-00-00', '2022-12-04', '', 1269),
('065', '05', '0000-00-00', '0000-00-00', '', 1270),
('324', '01', '0000-00-00', '2019-11-24', '75413166 mundial', 1276),
('324', '02', '0000-00-00', '2019-07-27', '151159', 1277),
('324', '03', '2018-10-02', '2021-10-01', '2000016362-16363', 1278),
('324', '04', '0000-00-00', '2019-11-26', '', 1279),
('324', '05', '0000-00-00', '0000-00-00', '', 1280),
('007', '01', '0000-00-00', '2021-12-20', '13246600006350 DEL ESTADO', 1286),
('007', '02', '2020-07-27', '2021-07-27', 'I52824', 1287),
('007', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1288),
('007', '04', '0000-00-00', '2021-12-26', '150877948', 1289),
('007', '05', '0000-00-00', '0000-00-00', '', 1290),
('527', '01', '0000-00-00', '2021-02-08', '14637100006230 ESTADO', 1296),
('527', '02', '0000-00-00', '2021-07-27', 'I52989', 1297),
('527', '03', '2018-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1298),
('527', '04', '0000-00-00', '2021-02-09', '', 1299),
('112', '01', '0000-00-00', '2021-05-28', '14098500008770-DEL ESTADO', 1300),
('112', '02', '2019-07-27', '2021-07-27', 'I53077', 1301),
('112', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1302),
('112', '04', '0000-00-00', '2021-06-30', '147299925', 1303),
('678', '01', '2018-01-01', '2021-01-02', '14525100030860-ESTADO', 1308),
('678', '02', '0000-00-00', '2021-07-27', 'I52925', 1309),
('678', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1310),
('678', '04', '0000-00-00', '2021-01-04', '', 1311),
('719', '01', '0000-00-00', '2021-10-13', '79317437 MUNDIAL', 1312),
('719', '02', '0000-00-00', '2021-07-27', 'I53105', 1313),
('719', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1314),
('719', '04', '0000-00-00', '2021-11-20', '150122722', 1315),
('398', '01', '0000-00-00', '2021-02-25', '77988254 MUNDIAL', 1316),
('398', '02', '0000-00-00', '2021-07-27', 'I53084', 1317),
('398', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1318),
('398', '04', '0000-00-00', '2021-07-13', '147682401', 1319),
('530', '01', '0000-00-00', '2021-06-24', '14093500094100-DEL ESTADO', 1320),
('530', '02', '0000-00-00', '2021-07-27', 'I52991', 1321),
('530', '03', '2018-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1322),
('530', '04', '0000-00-00', '2021-02-07', '48176802', 1323),
('578', '01', '0000-00-00', '2021-07-17', '78810444 MUNDIAL', 1324),
('578', '02', '2020-07-27', '2021-07-27', 'I53097', 1325),
('578', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1326),
('578', '04', '0000-00-00', '2021-07-19', '', 1327),
('244', '01', '2020-04-02', '2021-04-02', '78106057-MUNDIAL', 1332),
('244', '02', '2020-07-27', '2021-07-27', '152868', 1333),
('244', '03', '0000-00-00', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1334),
('244', '04', '0000-00-00', '2021-06-23', '48915736', 1335),
('348', '01', '0000-00-00', '2021-12-24', '14715300002520 ESTADO', 1336),
('348', '02', '0000-00-00', '2021-07-27', 'I53082', 1337),
('348', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1338),
('348', '04', '0000-00-00', '2021-12-26', '', 1339),
('445', '01', '0000-00-00', '2022-01-12', '14525100072060- DEL ESTADO', 1340),
('445', '02', '0000-00-00', '2021-07-27', 'I52981', 1341),
('445', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1342),
('445', '04', '0000-00-00', '2022-01-12', '151180040', 1343),
('686', '01', '0000-00-00', '2021-06-01', '14602000019180 ESTADO', 1344),
('686', '02', '0000-00-00', '2021-07-27', 'I53100', 1345),
('686', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1346),
('686', '04', '0000-00-00', '2021-09-15', '', 1347),
('399', '01', '0000-00-00', '2021-04-14', '14882900000070ESTADO', 1348),
('399', '02', '0000-00-00', '2021-07-27', '153085', 1349),
('399', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1350),
('399', '04', '0000-00-00', '2021-05-11', '', 1351),
('474', '01', '0000-00-00', '2020-01-31', '75747753-MUNDIAL', 1352),
('474', '02', '0000-00-00', '2019-07-27', '151181', 1353),
('474', '03', '2018-10-02', '2021-10-01', '2000016362-16363', 1354),
('474', '04', '0000-00-00', '2020-02-21', '', 1355),
('487', '01', '0000-00-00', '2021-02-13', '14093500076800 ESTADO', 1356),
('487', '02', '0000-00-00', '2021-07-27', 'I53149', 1357),
('487', '03', '2018-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1358),
('487', '04', '0000-00-00', '2021-02-14', '', 1359),
('557', '01', '0000-00-00', '2021-02-13', '77575353 MUNDIAL', 1360),
('557', '02', '0000-00-00', '2021-07-27', 'I53094', 1361),
('557', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1362),
('557', '04', '0000-00-00', '2021-02-14', '48177079', 1363),
('222', '01', '0000-00-00', '2021-03-19', '78062217-MUNDIAL', 1364),
('222', '02', '0000-00-00', '2021-07-27', 'I52864', 1365),
('222', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1366),
('222', '04', '0000-00-00', '2021-06-01', '47689823', 1367),
('616', '01', '0000-00-00', '2021-04-11', '78106059MUNDIAL', 1368),
('616', '02', '0000-00-00', '2021-07-27', 'I53006', 1369),
('616', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1370),
('616', '04', '0000-00-00', '2021-06-18', '48915366', 1371),
('011', '01', '0000-00-00', '2021-10-26', '78662845 MUNDIAL', 1372),
('011', '02', '2020-07-27', '2021-07-27', 'I52939', 1373),
('011', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1374),
('011', '04', '0000-00-00', '2022-01-07', '151116969', 1375),
('109', '01', '0000-00-00', '2021-04-17', '78217277 MUNDIAL', 1376),
('109', '02', '2020-07-27', '2021-07-27', 'I52853', 1377),
('109', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1378),
('109', '04', '0000-00-00', '2021-06-12', '46851978', 1379),
('570', '01', '0000-00-00', '2019-10-14', '40119902-4 DEL ESTADO', 1380),
('570', '02', '0000-00-00', '2019-07-27', '151200', 1381),
('570', '03', '2018-10-02', '2021-10-01', '2000016362-16363', 1382),
('570', '04', '0000-00-00', '2019-07-25', '38662816', 1383),
('531', '01', '0000-00-00', '2021-08-28', '15063200005840', 1384),
('531', '02', '0000-00-00', '2021-07-27', 'I52905', 1385),
('531', '03', '0000-00-00', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1386),
('531', '04', '0000-00-00', '2021-11-21', '150155832', 1387),
('580', '01', '2019-09-23', '2021-09-24', '79182135 MUNDIAL', 1388),
('580', '02', '0000-00-00', '2021-07-27', 'I52997', 1389),
('580', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1390),
('580', '04', '0000-00-00', '2021-11-02', '149806740', 1391),
('006', '01', '2020-08-10', '2021-08-10', '78661996', 1392),
('006', '02', '2020-07-27', '2021-07-27', 'I52823', 1393),
('006', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1394),
('006', '04', '0000-00-00', '2021-08-21', '148393470', 1395),
('442', '01', '0000-00-00', '2021-05-06', '77990269	ESTADO', 1396),
('442', '02', '2020-07-27', '2021-07-27', 'I52894', 1397),
('442', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1398),
('442', '04', '0000-00-00', '2021-04-30', '', 1399),
('486', '01', '2019-10-10', '2021-10-31', '79458956 MUNDIAL', 1400),
('486', '02', '2020-07-27', '2021-07-27', 'I53122', 1401),
('486', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1402),
('486', '04', '2021-12-03', '2021-12-03', '150358855', 1403),
('281', '01', '0000-00-00', '2021-05-20', '78515780-MUNDIAL', 1404),
('281', '02', '0000-00-00', '2021-07-27', 'I52967', 1405),
('281', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1406),
('281', '04', '0000-00-00', '2021-06-30', '49283637', 1407),
('404', '01', '0000-00-00', '2021-12-19', '80002979 MUNDIAL', 1408),
('404', '02', '0000-00-00', '2021-07-27', 'I52888', 1409),
('404', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1410),
('404', '04', '0000-00-00', '2021-12-21', '150783992', 1411),
('199', '01', '0000-00-00', '2021-12-14', '14525100067700-DEL ESTADO', 1412),
('199', '02', '2020-07-27', '2021-07-27', 'I52861', 1413),
('199', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1414),
('199', '04', '0000-00-00', '2020-12-21', '45332270', 1415),
('579', '01', '0000-00-00', '2021-01-29', '14596000000510 ESTADO', 1416),
('579', '02', '0000-00-00', '2021-07-27', 'I52137', 1417),
('579', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1418),
('579', '04', '0000-00-00', '2021-02-08', '48176812', 1419),
('654', '01', '0000-00-00', '2021-02-04', '14525100035770 ESTADO', 1420),
('654', '02', '0000-00-00', '2021-07-27', 'I53010', 1421),
('654', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1422),
('654', '04', '0000-00-00', '2021-02-08', '', 1423),
('258', '01', '2019-05-01', '2021-06-01', '78322803 ESTADO', 1424),
('258', '02', '2019-07-27', '2021-07-27', 'I52965', 1425),
('258', '03', '2019-10-02', '2021-10-02', 'A006911-8861 LA EQUIDADA', 1426),
('258', '04', '0000-00-00', '2021-10-06', '149307170', 1427),
('461', '01', '2019-03-28', '2021-03-29', '78106055 MUNDIAL', 1428),
('461', '02', '2019-04-16', '2021-07-27', 'I52984', 1429),
('461', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1430),
('461', '04', '0000-00-00', '2021-03-27', '147946852', 1431),
('306', '01', '0000-00-00', '2021-05-29', '78270421-MUNDIAL', 1432),
('306', '02', '0000-00-00', '2021-07-27', 'I52876', 1433),
('306', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1434),
('306', '04', '0000-00-00', '2021-06-24', '49283135', 1435),
('604', '01', '2019-07-30', '2021-07-30', '15063200000290 ESTADO', 1436),
('604', '02', '2020-07-27', '2021-07-27', 'I53001', 1437),
('604', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1438),
('604', '04', '0000-00-00', '2021-08-08', '', 1439),
('576', '01', '2019-09-21', '2021-09-21', '79182134 MUNDIAL', 1440),
('576', '02', '2019-07-27', '2021-07-27', 'I52909', 1441),
('576', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1442),
('576', '04', '0000-00-00', '2021-09-23', '', 1443),
('175', '01', '0000-00-00', '2021-01-25', '13246600003860 ESTADO', 1444),
('175', '02', '2020-07-27', '2021-07-27', 'I53079', 1445),
('175', '03', '2018-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1446),
('175', '04', '0000-00-00', '2021-06-26', '49283300', 1447),
('588', '01', '2019-05-27', '2021-05-28', '14093500089450-DEL ESTADO', 1448),
('588', '02', '2019-07-27', '2021-07-27', 'I52911', 1449),
('588', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1450),
('588', '04', '0000-00-00', '2021-11-27', '150258965', 1451),
('562', '01', '2019-09-30', '2021-09-30', '14596000001030 ESTADO', 1452),
('562', '02', '2020-07-27', '2021-07-27', '153095', 1453),
('562', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1454),
('562', '04', '0000-00-00', '2021-10-07', '', 1455),
('016', '01', '2019-10-16', '2021-10-29', '79660776- MUNDIAL', 1456),
('016', '02', '2020-07-27', '2021-07-27', 'I53071', 1457),
('016', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1458),
('016', '04', '0000-00-00', '2021-07-06', '44213827', 1459),
('619', '01', '2020-05-05', '2021-05-05', '14098500008070-estado', 1460),
('619', '02', '2019-07-27', '2021-07-27', 'I53007', 1461),
('619', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1462),
('619', '04', '0000-00-00', '2021-06-03', '48913935', 1463),
('563', '01', '2019-11-13', '2021-07-07', '78900950-600442903', 1464),
('563', '02', '2019-11-13', '2021-07-27', 'I53096', 1465),
('563', '03', '2019-11-08', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1466),
('563', '04', '0000-00-00', '2021-11-17', '150067098', 1467),
('427', '01', '0000-00-00', '2021-02-12', '77426179 MUNDIAL', 1468),
('427', '02', '2019-11-13', '2021-07-27', 'I53088', 1469),
('427', '03', '2019-11-13', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1470),
('427', '04', '0000-00-00', '2021-06-28', '49283489', 1471),
('433', '01', '0000-00-00', '2021-07-06', '14093500097280 ESTADO', 1472),
('433', '02', '0000-00-00', '2021-07-27', 'I53104', 1473),
('433', '03', '0000-00-00', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1474),
('433', '04', '0000-00-00', '2021-07-15', '', 1475),
('356', '01', '0000-00-00', '2021-04-06', '78218542-600429742 MUNDIAL', 1476),
('356', '02', '0000-00-00', '2021-07-27', 'I52973', 1477),
('356', '03', '0000-00-00', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1478),
('356', '04', '0000-00-00', '2021-04-05', '', 1479),
('367', '01', '2020-04-19', '2021-04-19', '78427352 MUNDIAL', 1480),
('367', '02', '2019-07-27', '2021-07-27', 'I52803', 1481),
('367', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1482),
('367', '04', '0000-00-00', '2021-04-02', '', 1483),
('631', '01', '2019-07-01', '2021-09-08', '78901280 MUNDIAL', 1484),
('631', '02', '2020-07-27', '2021-07-27', 'I52935', 1485),
('631', '03', '2020-10-10', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1486),
('631', '04', '0000-00-00', '2021-08-03', '', 1487),
('364', '01', '2019-11-06', '2021-12-07', '14128100002240 ESTADO', 1488),
('364', '02', '2020-07-27', '2021-07-27', '153018', 1489),
('364', '03', '2019-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1490),
('364', '04', '0000-00-00', '2021-12-07', '150455554', 1491),
('487', '01', '0000-00-00', '2021-02-13', '14093500076800 ESTADO', 1492),
('487', '02', '0000-00-00', '2021-07-27', 'I53149', 1493),
('487', '03', '2018-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1494),
('487', '04', '0000-00-00', '2021-02-14', '', 1495),
('614', '01', '0000-00-00', '2021-05-09', '78397458 MUNDIAL', 1496),
('614', '02', '0000-00-00', '2021-07-27', 'I53109', 1497),
('614', '03', '2018-10-02', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1498),
('614', '04', '0000-00-00', '2021-07-09', '49189451', 1499),
('673', '01', '0000-00-00', '2021-05-30', '78518923 MUNDIAL', 1500),
('673', '02', '0000-00-00', '2021-07-27', 'I53172', 1501),
('673', '03', '0000-00-00', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1502),
('673', '04', '0000-00-00', '2021-02-04', '47903297', 1503),
('329', '01', '0000-00-00', '2021-05-15', '78499178 MUNDIAL', 1504),
('329', '02', '0000-00-00', '2021-07-27', 'I53186', 1505),
('329', '03', '0000-00-00', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1506),
('329', '04', '0000-00-00', '2021-08-24', '', 1507),
('715', '01', '0000-00-00', '2021-10-05', '14525100061820 ESTADO', 1508),
('715', '02', '0000-00-00', '2021-07-27', 'I53191', 1509),
('715', '03', '0000-00-00', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1510),
('715', '04', '0000-00-00', '2021-10-07', '149329176', 1511),
('110', '01', '0000-00-00', '2021-11-09', '14525100064360', 1512),
('110', '02', '0000-00-00', '2021-12-22', 'I53239', 1513),
('110', '03', '0000-00-00', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1514),
('110', '04', '0000-00-00', '2021-11-12', '149993345', 1515),
('031', '01', '0000-00-00', '2021-02-19', '14117400069790 ESTADO', 1516),
('031', '02', '0000-00-00', '2021-12-22', 'I53237', 1517),
('031', '03', '0000-00-00', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1518),
('031', '04', '0000-00-00', '2021-02-20', '48177350', 1519),
('577', '01', '0000-00-00', '2021-12-14', '14525100067790 ESTADO', 1520),
('577', '02', '0000-00-00', '2021-12-17', 'I53353', 1521),
('577', '03', '0000-00-00', '2021-10-02', 'AA006911-8861 LA EQUIDAD', 1522),
('577', '04', '0000-00-00', '2021-11-12', '149987616', 1523);

--
-- Disparadores `veh_doc`
--
DELIMITER $$
CREATE TRIGGER `notifica_inha` AFTER UPDATE ON `veh_doc` FOR EACH ROW BEGIN 
      set @can_dias=(select  plazo_diarios from info_sistema);
set @cant_hab=(SELECT count(vehiculo.id_movil)  FROM vehiculo WHERE NOT ( id_movil IN (SELECT DISTINCT vehiculo.id_movil FROM vehiculo INNER JOIN veh_doc ON vehiculo.id_movil = veh_doc.id_movil WHERE (DATE_FORMAT( concat( fecha_ven, ' 11:59:59' ) , '%Y-%m-%d %H:%i' ) < DATE_FORMAT( now( ) , '%Y-%m-%d %H:%i' )) OR ADDDATE( DATE_FORMAT( concat( vehiculo.pago_hasta, ' 11:59:59' ) , '%Y-%m-%d %H:%i' ) , @can_dias ) < DATE_FORMAT( now( ) , '%Y-%m-%d %H:%i' ))) AND id_movil =new.id_movil);
set @cant_inhab=(SELECT count(vehiculo.id_movil) FROM vehiculo WHERE id_movil IN ( SELECT DISTINCT vehiculo.id_movil FROM vehiculo INNER JOIN veh_doc ON vehiculo.id_movil = veh_doc.id_movil WHERE ( DATE_FORMAT( concat( fecha_ven, ' 11:59:59' ) , '%Y-%m-%d %H:%i' ) < DATE_FORMAT( now( ) , '%Y-%m-%d %H:%i' ) ) OR ADDDATE( DATE_FORMAT( concat( vehiculo.pago_hasta, ' 11:59:59' ) , '%Y-%m-%d %H:%i' ) ,  @can_dias ) < DATE_FORMAT( now( ) , '%Y-%m-%d %H:%i' )) AND id_movil =new.id_movil);	  
	  if(@cant_hab>0) then 
	  insert into `novedad_servicio` (`id_movil`, `operacion`, `estado`) values (new.`id_movil`,"Movil Habilitado",1);
	  elseif (@cant_inhab>0) then 
	   insert into `novedad_servicio` (`id_movil`, `operacion`, `estado`) values (new.`id_movil`,"Movil Inhabilitado",1);
	   end if;
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `v_documentos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `v_documentos` (
`id_doc` varchar(5)
,`documento` varchar(35)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `veh_dias_mora`
--
DROP TABLE IF EXISTS `veh_dias_mora`;

CREATE ALGORITHM=UNDEFINED DEFINER=`villadec`@`localhost` SQL SECURITY DEFINER VIEW `veh_dias_mora`  AS  select `vehiculo`.`id_movil` AS `id_movil`,`vehiculo`.`placa` AS `placa`,`vehiculo`.`clase` AS `clase`,`vehiculo`.`id_marca` AS `id_marca`,`marca`.`marca` AS `marca`,`vehiculo`.`referencia` AS `referencia`,`vehiculo`.`tipo` AS `tipo`,`vehiculo`.`motor` AS `motor`,`vehiculo`.`serie` AS `serie`,`vehiculo`.`color` AS `color`,`vehiculo`.`modelo` AS `modelo`,`vehiculo`.`pago_hasta` AS `pago_hasta`,floor(((unix_timestamp() - unix_timestamp(`vehiculo`.`pago_hasta`)) / 86400)) AS `dias_mora`,`vehiculo`.`grupo` AS `grupo` from (`vehiculo` join `marca` on((`vehiculo`.`id_marca` = `marca`.`id_marca`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `v_documentos`
--
DROP TABLE IF EXISTS `v_documentos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`villadec`@`localhost` SQL SECURITY DEFINER VIEW `v_documentos`  AS  select `documento`.`id_doc` AS `id_doc`,`documento`.`documento` AS `documento` from `documento` union select `documentos_v`.`id_documento` AS `id_documento`,`documentos_v`.`descripcion` AS `descripcion` from `documentos_v` ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `accidente`
--
ALTER TABLE `accidente`
  ADD PRIMARY KEY (`id_acc`);

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
  ADD KEY `id_conductor` (`id_conductor`),
  ADD KEY `id_eps` (`id_eps`);

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
-- AUTO_INCREMENT de la tabla `acc_grupo`
--
ALTER TABLE `acc_grupo`
  MODIFY `id_grupo` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `acc_opcion`
--
ALTER TABLE `acc_opcion`
  MODIFY `id_opcion` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT de la tabla `acc_permiso`
--
ALTER TABLE `acc_permiso`
  MODIFY `id_permiso` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1419;

--
-- AUTO_INCREMENT de la tabla `acc_usuario`
--
ALTER TABLE `acc_usuario`
  MODIFY `id_usr` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `actual_doc`
--
ALTER TABLE `actual_doc`
  MODIFY `id_act` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `aportes`
--
ALTER TABLE `aportes`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `compania_poliza`
--
ALTER TABLE `compania_poliza`
  MODIFY `id_compoliza` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `comprobante`
--
ALTER TABLE `comprobante`
  MODIFY `id_comp` int(5) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id_conductor` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1340;

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
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id_docv` int(5) NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT de la tabla `linea_atencion`
--
ALTER TABLE `linea_atencion`
  MODIFY `id_linea` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `marca`
--
ALTER TABLE `marca`
  MODIFY `idm` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

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
-- AUTO_INCREMENT de la tabla `novedad_diario`
--
ALTER TABLE `novedad_diario`
  MODIFY `id_nov` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `novedad_servicio`
--
ALTER TABLE `novedad_servicio`
  MODIFY `id_nov_serv` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `otros_pagos`
--
ALTER TABLE `otros_pagos`
  MODIFY `id_otros` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

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
  MODIFY `id_tarifa` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
  MODIFY `id_tipo_a` int(3) NOT NULL AUTO_INCREMENT COMMENT 'id interna del tipo de accidente', AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tipo_linea`
--
ALTER TABLE `tipo_linea`
  MODIFY `id_tipo_linea` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `idcons` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1524;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
