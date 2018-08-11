-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-08-2018 a las 00:00:39
-- Versión del servidor: 10.1.34-MariaDB
-- Versión de PHP: 5.6.37

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `unicentapos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `applications`
--

CREATE TABLE `applications` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `applications`
--

INSERT INTO `applications` (`id`, `name`, `version`) VALUES
('unicentaopos', 'uniCenta oPOS', '4.5');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `attribute`
--

CREATE TABLE `attribute` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `attributeinstance`
--

CREATE TABLE `attributeinstance` (
  `id` varchar(255) NOT NULL,
  `attributesetinstance_id` varchar(255) NOT NULL,
  `attribute_id` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `attributeset`
--

CREATE TABLE `attributeset` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `attributesetinstance`
--

CREATE TABLE `attributesetinstance` (
  `id` varchar(255) NOT NULL,
  `attributeset_id` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `attributeuse`
--

CREATE TABLE `attributeuse` (
  `id` varchar(255) NOT NULL,
  `attributeset_id` varchar(255) NOT NULL,
  `attribute_id` varchar(255) NOT NULL,
  `lineno` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `attributevalue`
--

CREATE TABLE `attributevalue` (
  `id` varchar(255) NOT NULL,
  `attribute_id` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bancos`
--

CREATE TABLE `bancos` (
  `id_banco` int(11) NOT NULL,
  `tipo_cuenta` varchar(30) NOT NULL,
  `nombre_cuenta` varchar(30) NOT NULL,
  `numero_cuenta` int(11) NOT NULL,
  `saldo_inicial` int(11) NOT NULL,
  `fecha_cuenta` date NOT NULL,
  `descripcion_cuenta` varchar(50) NOT NULL,
  `identificacion_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `bancos`
--

INSERT INTO `bancos` (`id_banco`, `tipo_cuenta`, `nombre_cuenta`, `numero_cuenta`, `saldo_inicial`, `fecha_cuenta`, `descripcion_cuenta`, `identificacion_usuario`) VALUES
(5, '123', 'cuenta estandar', 90, 900, '2018-05-11', 'cuentas natas', 100000000),
(6, '2', 'nueva cuenta', 1212, 199, '2018-05-11', 'cuenta por ip', 100000000),
(7, '2121', '', 0, 0, '2018-05-11', '', 100000000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `breaks`
--

CREATE TABLE `breaks` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `notes` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `breaks`
--

INSERT INTO `breaks` (`id`, `name`, `visible`, `notes`) VALUES
('0', 'HORA ALMUERZO', 1, ''),
('1', 'RECESO MAÑANA', 1, ''),
('2', 'RECESO TARDE', 1, ''),
('5cf779bf-2d9f-44b6-b3b1-dfdeb4173225', 'OTROS / JUSTIFICACION', 1, ''),
('d49c12ec-1076-458f-8f4e-9913e1cd94b7', 'CALAMIDAD / URGENCIA', 1, ''),
('fd2b2f07-85a5-4512-b949-0c4cb709e20b', 'OTROS / SIN JUSTIFICACION', 1, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL,
  `categoria` text NOT NULL,
  `descripcion_categoria` varchar(30) NOT NULL,
  `identificacion_usuario` int(11) DEFAULT NULL,
  `estado_categoria` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `categoria`, `descripcion_categoria`, `identificacion_usuario`, `estado_categoria`) VALUES
(1, 'activos', '', NULL, 'defecto'),
(2, 'egresos', '', NULL, 'defecto'),
(3, 'ingreso', '', NULL, 'defecto'),
(4, 'pasivos', '', NULL, 'defecto'),
(6, 'patrimonio', '', NULL, 'defecto'),
(11, 'nue', 'nue', 98, ''),
(12, 'cate', 'cca', 98, 'creadoPorUsuario'),
(13, 'te', 'te', 8829, 'creadoPorUsuario'),
(14, 'sosRp', 'sosRpp PAPAP', 222, 'creadoPorUsuario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias_item`
--

CREATE TABLE `categorias_item` (
  `id_categoria_item` int(11) NOT NULL,
  `nombre` text NOT NULL,
  `referencia` varchar(30) NOT NULL,
  `precio` double NOT NULL,
  `descripcion` varchar(30) NOT NULL,
  `id_categorizacion_rama6` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `parentid` varchar(255) DEFAULT NULL,
  `image` mediumblob,
  `texttip` varchar(255) DEFAULT NULL,
  `catshowname` smallint(6) NOT NULL DEFAULT '1',
  `catorder` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id`, `name`, `parentid`, `image`, `texttip`, `catshowname`, `catorder`) VALUES
('000', 'REDES', NULL, NULL, '', 1, ''),
('20e46da3-5a9c-486d-a779-b75d0fd09025', 'ACCESORIOS', NULL, NULL, '', 1, ''),
('359b0363-d760-4a7a-afb9-62667a793a58', 'PORTATILES', NULL, NULL, '', 1, ''),
('3aabaa11-b6a2-4a19-b4c1-b64760887afc', 'MOVILIDAD', NULL, NULL, '', 1, ''),
('b102dc65-46aa-44d9-b97b-57e08cf0aa20', 'OTROS', NULL, NULL, '', 1, ''),
('b662ee65-92bc-4167-bcad-37f2ec749ba8', 'SEGURIDAD ELECTRONICA', NULL, NULL, '', 1, ''),
('c6b39e18-09b6-4ebb-8eb8-069e265341a4', 'COMPUTADORES', NULL, NULL, '', 1, ''),
('ca02c77a-0df1-44c9-bd95-227835719cfd', 'REPUESTOS', NULL, NULL, '', 1, ''),
('e64bd4c0-3a51-44d4-a528-9bfdeab40c8a', 'PARTES', NULL, NULL, '', 1, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorizacion_rama2`
--

CREATE TABLE `categorizacion_rama2` (
  `id_categorizacion_rama2` int(11) NOT NULL,
  `titulo_categorizacion_rama2` text NOT NULL,
  `descripcion_categorizacion_rama2` varchar(40) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `estado_categorizacion_rama2` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categorizacion_rama2`
--

INSERT INTO `categorizacion_rama2` (`id_categorizacion_rama2`, `titulo_categorizacion_rama2`, `descripcion_categorizacion_rama2`, `id_categoria`, `estado_categorizacion_rama2`) VALUES
(1, 'activos corrientes', '', 1, 'defecto'),
(2, 'activos no corrientes', '', 1, 'defecto'),
(5, 'costos de ventas y operacion', '', 2, 'defecto'),
(6, 'depreciaciones, amortizaciones y deterioros', '', 2, 'defecto'),
(7, 'gastos de administracion', '', 2, 'defecto'),
(8, 'gastos por impuestos', '', 2, 'defecto'),
(9, 'otros gastos', '', 2, 'defecto'),
(10, 'ingresos de actividades ordinarias', '', 3, 'defecto'),
(11, 'otros ingresos', '', 3, 'defecto'),
(12, 'pasivos corrientes', '', 4, 'defecto'),
(13, 'pasivos no corrientes', '', 4, 'defecto'),
(14, 'ajuste por saldos iniciales', '', 6, 'defecto'),
(15, 'capital social', '', 6, 'defecto'),
(16, 'ganancia acumulada', '', 6, 'defecto'),
(17, '100 - transportes mascotas', '', 1, 'defecto'),
(18, '2', '2', 1, 'creadoPorUsuario'),
(19, 'q', 'q', 1, 'creadoPorUsuario'),
(20, 'rp', 'rp', 1, 'creadoPorUsuario'),
(21, 'www', 'www', 1, 'creadoPorUsuario'),
(23, 'wwwwwww', 'wwwwwwww', 1, 'creadoPorUsuario'),
(24, 'soyrp', 'rp', 1, 'creadoPorUsuario'),
(25, 'plusm', 'plusm', 1, 'creadoPorUsuario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorizacion_rama3`
--

CREATE TABLE `categorizacion_rama3` (
  `id_categorizacion_rama3` int(11) NOT NULL,
  `titulo_categorizacion_rama3` text NOT NULL,
  `descripcion_categorizacion_rama3` varchar(20) NOT NULL,
  `id_categorizacion_rama2` int(11) NOT NULL,
  `estado_categorizacion_rama3` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categorizacion_rama3`
--

INSERT INTO `categorizacion_rama3` (`id_categorizacion_rama3`, `titulo_categorizacion_rama3`, `descripcion_categorizacion_rama3`, `id_categorizacion_rama2`, `estado_categorizacion_rama3`) VALUES
(2, 'deudores comerciales y otras cuentas por cobrar', '', 1, 'defecto'),
(3, 'efectivo y equivalentes de efectivo', '', 1, 'defecto'),
(4, 'inventarios', '', 1, 'defecto'),
(5, 'inversiones a corto plazo', '', 1, 'defecto'),
(6, 'otos activos corrientes', '', 1, 'defecto'),
(7, 'otros activos no corrientes', '', 2, 'defecto'),
(8, 'propiedad planta y equipo(activos fijos)', '', 2, 'defecto'),
(9, 'costos de los servicios vendidos', '', 5, 'defecto'),
(10, 'costos de la mercancía vendida', '', 5, 'defecto'),
(11, 'depreciación de planta y equipo', '', 6, 'defecto'),
(12, 'deterioro de cuentas por cobrar', '', 6, 'defecto'),
(13, 'gastos de personal', '', 7, 'defecto'),
(14, 'gastos generales', '', 7, 'defecto'),
(15, 'impuestos de renta y complementarios', '', 8, 'defecto'),
(16, 'ajustes por diferencia en cambio', '', 9, 'defecto'),
(17, 'gastos financieros', '', 9, 'defecto'),
(18, 'devoluciones en ventas', '', 10, 'defecto'),
(19, 'ventas', '', 10, 'defecto'),
(20, 'ingresos financieros', '', 11, 'defecto'),
(21, 'otros ingresos diversos', '', 11, 'defecto'),
(22, 'cuentas por pagar', '', 12, 'defecto'),
(23, 'obligaciones financieras', '', 12, 'defecto'),
(24, 'obligaciones laborales y de seguridad social', '', 12, 'defecto'),
(25, 'otros pasivos corrientes', '', 12, 'defecto'),
(26, 'pasivos por impuestos corrientes', '', 12, 'defecto'),
(27, 'otros pasivos no corrientes', '', 13, 'defecto'),
(28, 'prestamos a largo plazo', '', 13, 'defecto'),
(29, 'ajuste iniciales en bancos', '', 14, 'defecto'),
(30, 'ajustes iniciales en inventarios', '', 14, 'defecto'),
(31, '1', '12', 1, 'creadoPorUsuario'),
(32, 'op', 'op', 1, 'creadoPorUsuario'),
(33, 'qq', 'q', 1, 'creadoPorUsuario'),
(35, 'sasas', 'sasas', 1, 'creadoPorUsuario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorizacion_rama4`
--

CREATE TABLE `categorizacion_rama4` (
  `id_categorizacion_rama4` int(11) NOT NULL,
  `titulo_categorizacion_rama4` text NOT NULL,
  `descripcion_categorizacion_rama4` varchar(40) NOT NULL,
  `id_categorizacion_rama3` int(11) NOT NULL,
  `estado_categorizacion_rama4` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categorizacion_rama4`
--

INSERT INTO `categorizacion_rama4` (`id_categorizacion_rama4`, `titulo_categorizacion_rama4`, `descripcion_categorizacion_rama4`, `id_categorizacion_rama3`, `estado_categorizacion_rama4`) VALUES
(1, 'activos por impuestos corrientes', '', 2, 'defecto'),
(2, 'avances y anticipos entregados', '', 2, 'defecto'),
(3, 'cunetas por cobrar clientes', '', 2, 'defecto'),
(4, 'otras cuentas por cobrar', '', 2, 'defecto'),
(5, 'cunetas por cobrar clientes', '', 2, 'defecto'),
(6, 'otras cuentas por cobrar', '', 2, 'defecto'),
(7, 'bancos', '', 3, 'defecto'),
(8, 'caja', '', 3, 'defecto'),
(9, 'bancos', '', 3, 'defecto'),
(10, 'caja', '', 3, 'defecto'),
(11, 'ajuste al inventario', '', 10, 'defecto'),
(12, 'costos del inventario', '', 10, 'defecto'),
(13, 'descuentos financieros', '', 10, 'defecto'),
(14, 'devoluciones en compras de inventarios', '', 10, 'defecto'),
(15, 'ajuste al inventario', '', 10, 'defecto'),
(16, 'costos del inventario', '', 10, 'defecto'),
(17, 'descuentos financieros', '', 10, 'defecto'),
(18, 'devoluciones en compras de inventarios', '', 10, 'defecto'),
(19, 'sueldos', '', 13, 'defecto'),
(21, 'arrendamientos', '', 14, 'defecto'),
(22, 'combustibles y lubricantes', '', 14, 'defecto'),
(23, 'comicion onorarios y servicios', '', 14, 'defecto'),
(24, 'otros gastos generales', '', 14, 'defecto'),
(25, 'papeleria', '', 14, 'defecto'),
(26, 'publicidad', '', 14, 'defecto'),
(27, 'seguros generales', '', 14, 'defecto'),
(28, 'servicios de aseo, cafeteria, restaurante y lavanderia', '', 14, 'defecto'),
(29, 'servicios publicos', '', 14, 'defecto'),
(30, 'vigilancia', '', 14, 'defecto'),
(31, 'arrendamientos', '', 14, 'defecto'),
(32, 'combustibles y lubricantes', '', 14, 'defecto'),
(33, 'comicion onorarios y servicios', '', 14, 'defecto'),
(34, 'otros gastos generales', '', 14, 'defecto'),
(35, 'papeleria', '', 14, 'defecto'),
(36, 'publicidad', '', 14, 'defecto'),
(41, 'avances y anticipos resibidos', '', 22, 'defecto'),
(42, 'cuentas por pagar a proveedores', '', 22, 'defecto'),
(43, 'otras cuenta por pagar', '', 22, 'defecto'),
(44, 'avances y anticipos resibidos', '', 22, 'defecto'),
(45, 'cuentas por pagar a proveedores', '', 22, 'defecto'),
(46, 'otras cuenta por pagar', '', 22, 'defecto'),
(47, 'targeta de credito', '', 23, 'defecto'),
(48, 'targeta de credito', '', 23, 'defecto'),
(49, 'salarios y prestaciones sociales', '', 24, 'defecto'),
(50, 'salarios y prestaciones sociales', '', 24, 'defecto'),
(51, 'impuestos por pagar', '', 26, 'defecto'),
(52, 'retenciones por pagar', '', 26, 'defecto'),
(54, '11111', '11111', 2, 'creadoPorUsuario'),
(55, '2', 'pe', 2, 'creadoPorUsuario'),
(56, 'n', 'n', 3, 'creadoPorUsuario'),
(57, 'n', 's', 30, 'creadoPorUsuario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorizacion_rama5`
--

CREATE TABLE `categorizacion_rama5` (
  `id_categorizacion_rama5` int(11) NOT NULL,
  `titulo_categorizacion_rama5` text NOT NULL,
  `descripcion_categorizacion_rama5` varchar(40) NOT NULL,
  `id_categorizacion_rama4` int(11) NOT NULL,
  `estado_categorizacion_rama5` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categorizacion_rama5`
--

INSERT INTO `categorizacion_rama5` (`id_categorizacion_rama5`, `titulo_categorizacion_rama5`, `descripcion_categorizacion_rama5`, `id_categorizacion_rama4`, `estado_categorizacion_rama5`) VALUES
(1, 'impuestos a favor', '', 1, 'defecto'),
(2, 'retenciones a favor', '', 1, ''),
(3, 'cuentas por cobrar empleados', '', 4, 'defecto'),
(4, 'devoluciones a proveedores', '', 4, ''),
(5, 'prestamos a terceros', '', 4, 'defecto'),
(9, 'bancos 1', '', 7, 'defecto'),
(11, 'caja general', '', 8, 'defecto'),
(12, 'd', 'd', 1, 'creadoPorUsuario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorizacion_rama6`
--

CREATE TABLE `categorizacion_rama6` (
  `id_categorizacion_rama6` int(11) NOT NULL,
  `titulo_categorizacion_rama6` text NOT NULL,
  `descripcion_categorizacion_rama6` varchar(30) NOT NULL,
  `id_categorizacion_rama5` int(11) NOT NULL,
  `estado_categorizacion_rama6` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categorizacion_rama6`
--

INSERT INTO `categorizacion_rama6` (`id_categorizacion_rama6`, `titulo_categorizacion_rama6`, `descripcion_categorizacion_rama6`, `id_categorizacion_rama5`, `estado_categorizacion_rama6`) VALUES
(1, 'anticipos o saldos a favor del impuesto de indus', '', 1, 'defecto'),
(2, 'impuesto a las ventas a favor', '', 1, 'defecto'),
(3, 'inpuesto de industria y comercio retenido', '', 2, 'defecto'),
(4, 'retencion de impuestos a las ventas a favor', '', 2, 'defecto'),
(5, 'retencion en la fuente a favor', '', 2, 'defecto'),
(6, 'inpuesto de industria y comercio retenido', '', 2, 'defecto'),
(7, 'retencion de impuestos a las ventas a favor', '', 2, 'defecto'),
(8, 'retencion en la fuente a favor', '', 2, 'defecto'),
(9, 'qqqqqqqqq', 'qw', 1, 'creadoPorUsuario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `closedcash`
--

CREATE TABLE `closedcash` (
  `money` varchar(255) NOT NULL,
  `host` varchar(255) NOT NULL,
  `hostsequence` int(11) NOT NULL,
  `datestart` datetime NOT NULL,
  `dateend` datetime DEFAULT NULL,
  `nosales` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `closedcash`
--

INSERT INTO `closedcash` (`money`, `host`, `hostsequence`, `datestart`, `dateend`, `nosales`) VALUES
('050bd17a-2152-40df-bf6c-cbd0bce32cd5', 'DESKTOP-HS2Q6PT', 3, '2018-05-08 17:26:22', '2018-05-08 18:11:51', 0),
('397a0dd9-c69d-409f-8311-ac38bcc46376', 'DESKTOP-HS2Q6PT', 5, '2018-05-12 10:00:02', '2018-05-16 16:04:28', 0),
('5943f404-c4f8-418c-98c5-fb0329e68c70', 'DESKTOP-HS2Q6PT', 6, '2018-05-16 16:04:28', '2018-05-18 11:32:34', 0),
('6177fb0a-0f2c-4cf9-8ed3-7580fb4ebf58', 'PUNTO GERENCIA', 2, '2018-01-15 17:46:18', NULL, 0),
('92ab574e-2b14-4d04-b145-6f2732eb012f', 'PRINCIPAL', 2, '2018-01-16 14:46:27', NULL, 0),
('adf115c3-884b-4d52-9b0d-bec4eb826ca7', 'DESKTOP-HS2Q6PT', 4, '2018-05-08 18:11:51', '2018-05-12 10:00:02', 0),
('e146aba7-157a-4f0d-8aeb-915d42b2b440', 'DESKTOP-HS2Q6PT', 7, '2018-05-18 11:32:34', NULL, 0),
('eb2d066c-436c-4109-af6f-04d095f53619', 'DESKTOP-HS2Q6PT', 2, '2018-04-20 14:40:33', '2018-05-08 17:26:22', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuraciones`
--

CREATE TABLE `configuraciones` (
  `id_configuracion` int(11) NOT NULL,
  `conf_factura` text NOT NULL,
  `conf_cotizacion` text NOT NULL,
  `identificacion_usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cotizaciones`
--

CREATE TABLE `cotizaciones` (
  `id_cotizacion` int(11) NOT NULL,
  `cod_cotizacion` varchar(20) NOT NULL,
  `cliente_cotizacion` int(11) NOT NULL,
  `observaciones_cotizacion` varchar(255) NOT NULL,
  `notas_cotizacion` varchar(255) NOT NULL,
  `fecha_cotizacion` varchar(10) NOT NULL,
  `vencimiento_cotizacion` varchar(10) NOT NULL,
  `vendedor_cotizacion` text NOT NULL,
  `precio_unitario` double NOT NULL,
  `precio_total` double NOT NULL,
  `impuesto_cotizacion` varchar(10) NOT NULL,
  `cantidad_cotizacion` varchar(10) NOT NULL,
  `hora_cotizacion` varchar(10) NOT NULL,
  `identificacion_usuario` int(11) DEFAULT NULL,
  `tipo_cotizacion` text NOT NULL,
  `producto_cotizacion` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `csvimport`
--

CREATE TABLE `csvimport` (
  `id` varchar(255) NOT NULL,
  `rownumber` varchar(255) DEFAULT NULL,
  `csverror` varchar(255) DEFAULT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `pricebuy` double DEFAULT NULL,
  `pricesell` double DEFAULT NULL,
  `previousbuy` double DEFAULT NULL,
  `previoussell` double DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `tax` varchar(255) DEFAULT NULL,
  `searchkey` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `customers`
--

CREATE TABLE `customers` (
  `id` varchar(255) NOT NULL,
  `searchkey` varchar(255) NOT NULL,
  `taxid` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `taxcategory` varchar(255) DEFAULT NULL,
  `card` varchar(255) DEFAULT NULL,
  `maxdebt` double NOT NULL DEFAULT '0',
  `address` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `postal` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `phone2` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `visible` bit(1) NOT NULL DEFAULT b'1',
  `curdate` datetime DEFAULT NULL,
  `curdebt` double DEFAULT '0',
  `image` mediumblob,
  `isvip` bit(1) NOT NULL DEFAULT b'0',
  `discount` double DEFAULT '0',
  `memodate` datetime DEFAULT '1900-01-01 00:00:01',
  `identificacion_usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `customers`
--

INSERT INTO `customers` (`id`, `searchkey`, `taxid`, `name`, `taxcategory`, `card`, `maxdebt`, `address`, `address2`, `postal`, `city`, `region`, `country`, `firstname`, `lastname`, `email`, `phone`, `phone2`, `fax`, `notes`, `visible`, `curdate`, `curdebt`, `image`, `isvip`, `discount`, `memodate`, `identificacion_usuario`) VALUES
('0b9027d7-3ba9-4032-8a9d-937102f177f6', 'JECSER ', '', 'JECSER JAVIER CORONEL', NULL, NULL, 1000000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', b'1', '2018-07-06 15:22:53', 68000, NULL, b'1', 0, NULL, NULL),
('0ed8a037-a174-4e19-9009-82ab1c098b0c', 'MARLON', '', 'MARLON QUINTERO', NULL, NULL, 2000000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', b'1', '2018-06-19 14:18:27', 990000, NULL, b'1', 0, NULL, NULL),
('1db6d3b2-a3fe-49b9-8026-91db5f2f8765', 'JHONY', '', 'JHONY ANDRES', NULL, NULL, 1000000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', b'1', NULL, NULL, NULL, b'1', 0, NULL, NULL),
('1e8a1a1f-5193-4c7f-8477-d781cc2cfff0', 'LEO ', 'LEO', 'LEO BIDESA', NULL, NULL, 2000000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', b'1', '2018-06-09 15:40:56', 26000, NULL, b'1', 0, NULL, NULL),
('23cf1268-0e2b-46d1-a8c0-71bf47a640be', 'UNIVERSIDAD SANTO TOMAS', '8600123576', 'UNIVERSIDAD SANTO TOMAS', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1', NULL, 0, NULL, b'1', NULL, NULL, NULL),
('29c56615-2acf-4f8f-bfb6-a2ca888111b1', 'RAFA', '1091667864', 'RAFAEL', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'Rafael', 'Muñoz', NULL, NULL, NULL, NULL, NULL, b'1', NULL, 0, NULL, b'1', NULL, NULL, NULL),
('38509036-8eda-4546-8450-fcd1f9b67947', '1091658157', '1091658157', 'john erik oretga sanchez', NULL, NULL, 10000000, NULL, NULL, NULL, NULL, NULL, NULL, 'john erik', 'oretga sanchez', 'erik341@hotmail.com', '3183907793', NULL, NULL, NULL, b'1', '2018-07-11 11:22:41', 681600, NULL, b'1', NULL, NULL, NULL),
('3f3aa57d-9d3d-4e32-92ef-02b1ebfdc9aa', 'TIERRA FERTIL', '', 'TIERRA FERTIL', NULL, NULL, 20000000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', b'1', '2018-08-03 15:03:08', 551100, NULL, b'1', 0, NULL, NULL),
('64963bb7-7666-41bb-b6b7-7c756ff4da95', 'ASTRID', 'ASTRID', 'ADTRID COOTRANSUNIDOS', NULL, NULL, 1000000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', b'1', NULL, NULL, NULL, b'1', 0, NULL, NULL),
('6d5d5b75-44ca-43a3-9404-4319e66f0b43', 'TORCOROMA', '', 'TORCOROMA ARMESTO', NULL, NULL, 5000000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', b'1', NULL, NULL, NULL, b'1', 0, NULL, NULL),
('71b7b489-bc26-410f-b4ab-32ec5c208300', 'COOTRAN', '890501119-7', 'COOTRANSUNIDOS ', NULL, NULL, 20000000, NULL, NULL, NULL, NULL, NULL, NULL, 'COOTRANSUNIDOS', NULL, NULL, NULL, NULL, NULL, '', b'1', '2018-08-02 15:44:22', 257000, NULL, b'1', 0, NULL, NULL),
('8aee8051-f5d8-4c7f-8aa1-bf3545a285d4', 'RAMON DAVID', 'RAMON DAVID', 'RAMON DAVID', NULL, NULL, 1000000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', b'1', '2018-05-25 16:27:17', 116000, NULL, b'1', 0, NULL, NULL),
('c004c832-c564-4b76-af6c-4c8e623bd25a', 'CATALINDA', '', 'KATALINDA', NULL, NULL, 15000000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', b'1', '2018-07-17 09:01:12', 1127000, NULL, b'1', 0, NULL, NULL),
('d59108eb-c366-419a-b071-7aba14d0314e', '', '5431328', 'REYNEL SANCHEZ  ', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'REYNEL', 'SANCHEZ', NULL, NULL, NULL, NULL, '', b'1', NULL, NULL, NULL, b'1', 0, NULL, NULL),
('f15246e2-db79-43fe-baa5-d81d3a20d764', 'IVAN', '', 'IVAN MARTINEZ', NULL, NULL, 4000000, NULL, NULL, NULL, 'SAN PABLO', NULL, NULL, 'IVAN ', 'MARTINES', NULL, NULL, NULL, NULL, '', b'1', '2018-05-19 12:00:52', 200000, NULL, b'1', 0, NULL, NULL),
('f173950d-d222-4364-9ff7-23110780cf11', 'ALONSO', '', 'ALONSO CASTILLO', NULL, NULL, 2000000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', b'1', NULL, NULL, NULL, b'1', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `descuentos`
--

CREATE TABLE `descuentos` (
  `id_descuento` int(11) NOT NULL,
  `descuento` float NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `draweropened`
--

CREATE TABLE `draweropened` (
  `opendate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `name` varchar(255) DEFAULT NULL,
  `ticketid` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `draweropened`
--

INSERT INTO `draweropened` (`opendate`, `name`, `ticketid`) VALUES
('2018-04-26 18:40:55', 'GERENCIA - 2 - COOTRANSUNIDOS ', '2'),
('2018-04-26 19:18:28', 'GERENCIA - 3 - TORCOROMA ARMESTO', '3'),
('2018-04-26 19:19:29', 'GERENCIA - 4 - COOTRANSUNIDOS ', '4'),
('2018-04-26 19:27:16', 'GERENCIA - 5 - TORCOROMA ARMESTO', '5'),
('2018-04-26 22:44:33', 'GERENCIA - 6 - COOTRANSUNIDOS ', '6'),
('2018-04-26 22:57:45', 'GERENCIA - 7 - ALONSO CASTILLO', '7'),
('2018-04-27 15:20:30', NULL, NULL),
('2018-04-28 16:17:34', 'GERENCIA - 8 - TIERRA FERTIL', '8'),
('2018-04-30 20:03:44', 'GERENCIA - (03:02 264)', 'No Sale'),
('2018-04-30 21:14:04', 'GERENCIA - 9 - TORCOROMA ARMESTO', '9'),
('2018-05-02 16:45:12', 'GERENCIA - 10 - TORCOROMA ARMESTO', '10'),
('2018-05-02 16:46:43', 'GERENCIA - 11 - TORCOROMA ARMESTO', '11'),
('2018-05-02 16:48:56', 'GERENCIA - 12 - TORCOROMA ARMESTO', '12'),
('2018-05-02 20:09:01', 'GERENCIA - 13 - TORCOROMA ARMESTO', '13'),
('2018-05-02 21:55:11', 'GERENCIA - 14 - TORCOROMA ARMESTO', '14'),
('2018-05-02 22:17:34', 'GERENCIA - 15 - JHONY ANDRES', '15'),
('2018-05-02 22:20:33', 'GERENCIA - 16', '16'),
('2018-05-03 19:04:46', 'GERENCIA - 17 - TIERRA FERTIL', '17'),
('2018-05-05 18:43:05', 'GERENCIA - 11 - TORCOROMA ARMESTO', '11'),
('2018-05-05 18:46:00', 'GERENCIA - 10 - TORCOROMA ARMESTO', '10'),
('2018-05-05 19:08:26', 'GERENCIA - 13 - TORCOROMA ARMESTO', '13'),
('2018-05-05 19:14:02', 'GERENCIA - 14 - TORCOROMA ARMESTO', '14'),
('2018-05-05 19:14:29', 'GERENCIA - 12 - TORCOROMA ARMESTO', '12'),
('2018-05-07 14:28:53', 'GERENCIA - 18 - CATALINDA', '18'),
('2018-05-07 20:03:38', 'GERENCIA - 19 - COOTRANSUNIDOS ', '19'),
('2018-05-08 20:27:22', 'GERENCIA - 20', '20'),
('2018-05-08 22:26:22', 'GERENCIA', 'Close Cash'),
('2018-05-08 22:26:22', NULL, NULL),
('2018-05-08 22:36:02', 'GERENCIA - 21', '21'),
('2018-05-08 23:04:17', 'GERENCIA - 22', '22'),
('2018-05-08 23:06:08', 'GERENCIA - 23', '23'),
('2018-05-08 23:09:08', 'CAJA ADMIN - 24', '24'),
('2018-05-08 23:10:52', 'GERENCIA - 2', '2'),
('2018-05-08 23:11:25', 'GERENCIA - 3', '3'),
('2018-05-08 23:11:51', 'GERENCIA', 'Close Cash'),
('2018-05-08 23:11:51', NULL, NULL),
('2018-05-11 16:42:19', 'GERENCIA - 25 - TIERRA FERTIL', '25'),
('2018-05-12 14:46:00', 'GERENCIA - 26 - IVAN MARTINES ', '26'),
('2018-05-12 15:00:02', 'GERENCIA', 'Close Cash'),
('2018-05-12 15:00:02', NULL, NULL),
('2018-05-16 21:03:55', 'GERENCIA - 27', '27'),
('2018-05-16 21:04:28', 'GERENCIA', 'Close Cash'),
('2018-05-16 21:04:28', NULL, NULL),
('2018-05-17 21:02:32', 'GERENCIA - 28 - UNIVERSIDAD SANTO TOMAS', '28'),
('2018-05-18 13:46:31', 'GERENCIA - 29', '29'),
('2018-05-18 16:31:05', NULL, NULL),
('2018-05-18 16:32:34', 'GERENCIA', 'Close Cash'),
('2018-05-18 16:32:34', NULL, NULL),
('2018-05-18 22:20:33', 'GERENCIA - 30', '30'),
('2018-05-19 16:13:01', 'GERENCIA - 31 - john erik oretga sanchez', '31'),
('2018-05-19 17:00:53', NULL, NULL),
('2018-05-19 19:28:53', 'GERENCIA - 32 - john erik oretga sanchez', '32'),
('2018-05-21 15:10:18', 'GERENCIA - 33 - TIERRA FERTIL', '33'),
('2018-05-21 19:29:04', 'GERENCIA - 34 - COOTRANSUNIDOS ', '34'),
('2018-05-21 19:31:06', 'GERENCIA - 35 - CATALINDA', '35'),
('2018-05-21 20:59:48', 'GERENCIA - 36 - COOTRANSUNIDOS ', '36'),
('2018-05-21 23:10:03', 'GERENCIA - 37 - ADTRID COOTRANSUNIDOS', '37'),
('2018-05-22 16:16:45', 'GERENCIA - 38 - john erik oretga sanchez', '38'),
('2018-05-25 21:27:17', 'GERENCIA - 39 - RAMON DAVID', '39'),
('2018-05-26 15:52:52', 'GERENCIA - 4 - RAMON DAVID', '4'),
('2018-05-28 16:27:04', 'GERENCIA - 40 - TORCOROMA ARMESTO', '40'),
('2018-05-29 21:46:57', 'GERENCIA - 41 - CATALINDA', '41'),
('2018-05-30 20:59:07', 'GERENCIA - 42 - LEO BIDESA', '42'),
('2018-05-31 13:54:57', 'GERENCIA - 43 - john erik oretga sanchez', '43'),
('2018-06-05 19:08:47', 'GERENCIA - 44 - john erik oretga sanchez', '44'),
('2018-06-06 22:10:13', NULL, NULL),
('2018-06-07 16:33:09', NULL, NULL),
('2018-06-07 22:27:27', 'GERENCIA - 45', '45'),
('2018-06-08 14:21:59', 'GERENCIA - 46', '46'),
('2018-06-09 20:26:06', 'GERENCIA - 47 - COOTRANSUNIDOS ', '47'),
('2018-06-09 20:40:56', 'GERENCIA - 48 - LEO BIDESA', '48'),
('2018-06-09 20:43:04', 'GERENCIA - 49 - john erik oretga sanchez', '49'),
('2018-06-11 14:43:26', 'GERENCIA - 5 - CATALINDA', '5'),
('2018-06-11 14:52:08', 'GERENCIA - 50 - TORCOROMA ARMESTO', '50'),
('2018-06-12 14:37:22', 'GERENCIA - 51 - JECSER JAVIER CORONEL', '51'),
('2018-06-13 16:48:55', 'GERENCIA - 52 - COOTRANSUNIDOS ', '52'),
('2018-06-19 19:18:28', 'GERENCIA - 53 - MARLON QUINTERO', '53'),
('2018-06-23 21:06:14', 'GERENCIA - 54', '54'),
('2018-07-05 14:47:41', 'GERENCIA - 55 - COOTRANSUNIDOS ', '55'),
('2018-07-06 19:57:17', 'GERENCIA - 56 - COOTRANSUNIDOS ', '56'),
('2018-07-06 20:22:53', 'GERENCIA - 57 - JECSER JAVIER CORONEL', '57'),
('2018-07-06 20:39:34', NULL, NULL),
('2018-07-06 21:11:35', 'GERENCIA - 58 - john erik oretga sanchez', '58'),
('2018-07-06 21:14:42', 'GERENCIA - 59 - john erik oretga sanchez', '59'),
('2018-07-09 14:34:20', 'GERENCIA - 60 - john erik oretga sanchez', '60'),
('2018-07-11 16:22:41', 'GERENCIA - 61 - john erik oretga sanchez', '61'),
('2018-07-12 19:53:41', 'GERENCIA - 62 - ADTRID COOTRANSUNIDOS', '62'),
('2018-07-16 20:48:39', 'GERENCIA - 63 - REYNEL SANCHEZ  ', '63'),
('2018-07-16 21:01:42', 'GERENCIA - (03:50 438) - CATALINDA', 'No Sale'),
('2018-07-16 21:01:43', 'GERENCIA - (03:50 438) - CATALINDA', 'No Sale'),
('2018-07-17 14:01:13', 'GERENCIA - 64 - KATALINDA', '64'),
('2018-07-19 13:23:54', 'GERENCIA - 65 - REYNEL SANCHEZ  ', '65'),
('2018-07-23 13:20:38', 'GERENCIA - (08:19 654)', 'No Sale'),
('2018-07-23 13:20:43', 'GERENCIA - (08:19 654)', 'No Sale'),
('2018-07-23 21:43:02', 'GERENCIA - 66 - RAFAEL', '66'),
('2018-07-26 13:44:45', 'GERENCIA - 67', '67'),
('2018-07-27 15:46:16', 'CAJA ADMIN - 68', '68'),
('2018-08-01 15:28:33', 'GERENCIA - 69 - TIERRA FERTIL', '69'),
('2018-08-02 19:27:42', 'GERENCIA - (02:25 129)', 'No Sale'),
('2018-08-02 19:31:08', 'GERENCIA - 70', '70'),
('2018-08-02 20:44:22', 'GERENCIA - 71 - COOTRANSUNIDOS ', '71'),
('2018-08-03 20:03:09', NULL, NULL),
('2018-08-03 20:04:19', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `id_empleado` int(11) NOT NULL,
  `identificacion_empleado` int(10) NOT NULL,
  `nombre_empleado` text NOT NULL,
  `apellido_empleado` text NOT NULL,
  `fecha_nacimiento` varchar(40) NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `cargo` varchar(50) NOT NULL,
  `salario` double NOT NULL,
  `edad` int(11) NOT NULL,
  `identificacion_usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entradas`
--

CREATE TABLE `entradas` (
  `numeracion` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  `notas` varchar(200) NOT NULL,
  `fecha` varchar(14) NOT NULL,
  `vencimiento` varchar(14) NOT NULL,
  `plazo` varchar(15) NOT NULL,
  `bodega` varchar(30) NOT NULL,
  `id_entrada` int(11) NOT NULL,
  `tipo_entrada` varchar(20) NOT NULL,
  `fecha_entrada` date NOT NULL,
  `hora_entrada` time NOT NULL,
  `subtotal` double NOT NULL,
  `descuentoTotal` double NOT NULL,
  `subtotalDescuento` double NOT NULL,
  `totalTotal` double NOT NULL,
  `id_cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `floors`
--

CREATE TABLE `floors` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` mediumblob
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `floors`
--

INSERT INTO `floors` (`id`, `name`, `image`) VALUES
('0', 'PRINCIPAL', 0x31);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gastos`
--

CREATE TABLE `gastos` (
  `id_gasto` int(11) NOT NULL,
  `nombre_gasto` varchar(30) NOT NULL,
  `descripcion_gasto` varchar(500) NOT NULL,
  `cantidad_gasto` int(11) NOT NULL,
  `fecha_gasto` date NOT NULL,
  `hora_gasto` time NOT NULL,
  `identificacion_usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `impuestos`
--

CREATE TABLE `impuestos` (
  `id_impuesto` int(11) NOT NULL,
  `nombre_impuesto` text NOT NULL,
  `porcentaje_impuesto` varchar(5) NOT NULL,
  `descripcion_impuesto` varchar(30) NOT NULL,
  `identificacion_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `impuestos`
--

INSERT INTO `impuestos` (`id_impuesto`, `nombre_impuesto`, `porcentaje_impuesto`, `descripcion_impuesto`, `identificacion_usuario`) VALUES
(15, 'nn', '32', 'impuesto retenido', 100000000),
(18, 'imp detenido', '1', 'impuesto no detenido', 100000000),
(19, 'impuestttote', '98', 'impuestote', 100000000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventarios`
--

CREATE TABLE `inventarios` (
  `id_inventario` int(11) NOT NULL,
  `codigo_inventario` int(11) NOT NULL,
  `nombre_inventario` varchar(30) NOT NULL,
  `fecha_inventario` date NOT NULL,
  `hora_inventario` time NOT NULL,
  `estado` varchar(20) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` double NOT NULL,
  `imagen` varchar(90) NOT NULL,
  `identificacion_usuario` int(11) DEFAULT NULL,
  `categoria_inventario` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventarios_item`
--

CREATE TABLE `inventarios_item` (
  `id_inventario_item` int(11) NOT NULL,
  `nombre` text NOT NULL,
  `referencia` varchar(20) NOT NULL,
  `precio_venta` float NOT NULL,
  `descripcion` varchar(30) NOT NULL,
  `impuesto` varchar(10) NOT NULL,
  `id_categoria_item` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `item_factura`
--

CREATE TABLE `item_factura` (
  `id_item_factura` int(11) NOT NULL,
  `item` varchar(30) NOT NULL,
  `referencia` varchar(30) NOT NULL,
  `precio_unitario` double NOT NULL,
  `descuento` float NOT NULL,
  `impuesto` float NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `total` double NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `id_entrada` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `leaves`
--

CREATE TABLE `leaves` (
  `id` varchar(255) NOT NULL,
  `pplid` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `startdate` datetime NOT NULL,
  `enddate` datetime NOT NULL,
  `notes` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lineremoved`
--

CREATE TABLE `lineremoved` (
  `removeddate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `name` varchar(255) DEFAULT NULL,
  `ticketid` varchar(255) DEFAULT NULL,
  `productid` varchar(255) DEFAULT NULL,
  `productname` varchar(255) DEFAULT NULL,
  `units` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `lineremoved`
--

INSERT INTO `lineremoved` (`removeddate`, `name`, `ticketid`, `productid`, `productname`, `units`) VALUES
('2018-04-23 15:22:47', 'GERENCIA', 'Void', 'xxx999_999xxx_x9x9x9', 'soporte', 1),
('2018-04-23 16:03:15', 'GERENCIA', 'Void', 'ef2d0ded-7b0f-49e2-9c26-b6f2582757c9', 'ALTAVOCES COMPACTO LOGITECH 2.1 Z213', 1),
('2018-04-23 16:05:37', 'GERENCIA', 'Void', 'ef2d0ded-7b0f-49e2-9c26-b6f2582757c9', 'ALTAVOCES COMPACTO LOGITECH 2.1 Z213', 1),
('2018-04-24 12:54:40', 'GERENCIA', 'Void', '342fa52c-7c53-42a6-a2a6-63cfaac7671c', 'COMBO DE TECLADO CON MOUSE INHALAMBRICO', 1),
('2018-04-24 23:06:51', 'GERENCIA', 'Void', 'c7b19666-822f-400a-842f-60bfca4d8980', 'DVR 8CH 2MP 1HDD 4CH AUDIO HDMI VGA', 1),
('2018-04-24 23:06:51', 'GERENCIA', 'Void', 'aae1a692-d6ed-44ea-8350-096a9f308e65', 'DVR 16CH 2MP 1HDD 4CH AUDIO HDMI VGA', 1),
('2018-04-26 18:31:56', 'GERENCIA', 'Void', 'f65236e2-5a72-405a-8ca8-9a1ae71a0888', 'IMPRESORA EPSON L575', 1),
('2018-04-26 18:31:56', 'GERENCIA', 'Void', '97ba6646-6dc8-4abf-9e7d-5bc84794bf20', 'IMPRESORA EPSON L380', 1),
('2018-04-26 18:31:56', 'GERENCIA', 'Void', '326f0b79-457f-4125-8365-84874fb3c303', 'DISCO DURO EXTERNO ADATA ANTIGOLPES 1TB', 1),
('2018-04-26 18:31:57', 'GERENCIA', 'Void', 'ef2d0ded-7b0f-49e2-9c26-b6f2582757c9', 'ALTAVOCES COMPACTO LOGITECH 2.1 Z213', 1),
('2018-04-26 18:31:57', 'GERENCIA', 'Void', '3b7394d3-05aa-4f4e-a115-4f8cb88884ac', 'DISCO DURO EXTERNO TOSHIBA 1TB', 1),
('2018-04-26 18:31:57', 'GERENCIA', 'Void', '8e3f67a3-8341-499d-8082-b397ae0a9a7e', 'BALA METALICA DE 2.8-12MM ', 1),
('2018-04-26 18:31:57', 'GERENCIA', 'Void', '4152580f-d9b5-4a49-a8bf-ba10ff0c82da', 'BASE REFRIGERANTE', 1),
('2018-04-26 18:39:44', 'GERENCIA', 'Void', '3b7394d3-05aa-4f4e-a115-4f8cb88884ac', 'DISCO DURO EXTERNO TOSHIBA 1TB', 1),
('2018-04-26 18:39:46', 'GERENCIA', 'Void', '76b24bf0-14a4-498a-a9d3-b9fe55991f4e', 'TECLADO GENIUS KB-125 USB', 1),
('2018-04-26 18:39:46', 'GERENCIA', 'Void', '9975dffd-a8e1-43df-9712-611140de31db', 'MOUSE GENIUS USB', 1),
('2018-04-26 18:39:56', 'GERENCIA', 'Void', '4152580f-d9b5-4a49-a8bf-ba10ff0c82da', 'BASE REFRIGERANTE', 1),
('2018-04-26 18:40:59', 'GERENCIA', 'Void', NULL, 'Ticket Deleted', 0),
('2018-04-26 19:18:29', 'GERENCIA', 'Void', NULL, 'Ticket Deleted', 0),
('2018-04-26 19:19:30', 'GERENCIA', 'Void', NULL, 'Ticket Deleted', 0),
('2018-04-26 19:25:09', 'GERENCIA', 'Void', '3f43d708-b1c2-48d6-9929-d25b0ee93152', 'CAJA DE PASO 10X10', 1),
('2018-04-26 19:27:17', 'GERENCIA', 'Void', NULL, 'Ticket Deleted', 0),
('2018-04-26 19:27:54', 'GERENCIA', 'Void', '3b7394d3-05aa-4f4e-a115-4f8cb88884ac', 'DISCO DURO EXTERNO TOSHIBA 1TB', 1),
('2018-04-26 22:25:11', 'GERENCIA', 'Void', '173c9da7-791e-410d-9e1f-8825a1e69e07', 'CABLE CATEGORIA 6 EXTERIOR', 1),
('2018-04-26 22:44:34', 'GERENCIA', 'Void', NULL, 'Ticket Deleted', 0),
('2018-04-26 22:44:53', 'GERENCIA', 'Void', 'c3934860-bef3-4b73-adcd-2efdf629def1', 'DIADEMA A-80 CON MICRO', 1),
('2018-04-26 22:45:06', 'GERENCIA', 'Void', '4152580f-d9b5-4a49-a8bf-ba10ff0c82da', 'BASE REFRIGERANTE', 1),
('2018-04-26 22:45:45', 'GERENCIA', 'Void', 'abe789c1-189b-4bf9-af4e-85c591da2c50', 'FUENTE LG DE CORRIENTE PARA MONITOR', 1),
('2018-04-26 22:57:46', 'GERENCIA', 'Void', NULL, 'Ticket Deleted', 0),
('2018-04-28 16:11:23', 'GERENCIA', 'Void', '76b24bf0-14a4-498a-a9d3-b9fe55991f4e', 'TECLADO GENIUS KB-125 USB', 1),
('2018-04-28 16:14:50', 'GERENCIA', 'Void', '76b24bf0-14a4-498a-a9d3-b9fe55991f4e', 'TECLADO GENIUS KB-125 USB', 10),
('2018-04-28 16:17:39', 'GERENCIA', 'Void', NULL, 'Ticket Deleted', 0),
('2018-04-30 19:39:52', 'GERENCIA', 'Void', 'cbb780ca-12df-4b19-ab88-50dd81e8de0c', 'CANALETA 10*10', 1),
('2018-04-30 19:40:12', 'GERENCIA', 'Void', '3b7394d3-05aa-4f4e-a115-4f8cb88884ac', 'DISCO DURO EXTERNO TOSHIBA 1TB', 1),
('2018-04-30 19:40:12', 'GERENCIA', 'Void', '3b7394d3-05aa-4f4e-a115-4f8cb88884ac', 'DISCO DURO EXTERNO TOSHIBA 1TB', 1),
('2018-04-30 19:40:12', 'GERENCIA', 'Void', '3b7394d3-05aa-4f4e-a115-4f8cb88884ac', 'DISCO DURO EXTERNO TOSHIBA 1TB', 1),
('2018-04-30 19:40:12', 'GERENCIA', 'Void', '3b7394d3-05aa-4f4e-a115-4f8cb88884ac', 'DISCO DURO EXTERNO TOSHIBA 1TB', 1),
('2018-04-30 19:40:12', 'GERENCIA', 'Void', '3b7394d3-05aa-4f4e-a115-4f8cb88884ac', 'DISCO DURO EXTERNO TOSHIBA 1TB', 1),
('2018-04-30 19:40:12', 'GERENCIA', 'Void', '3b7394d3-05aa-4f4e-a115-4f8cb88884ac', 'DISCO DURO EXTERNO TOSHIBA 1TB', 1),
('2018-04-30 19:40:34', 'CAJERO', 'Void', '3b7394d3-05aa-4f4e-a115-4f8cb88884ac', 'DISCO DURO EXTERNO TOSHIBA 1TB', 1),
('2018-04-30 19:40:35', 'CAJERO', 'Void', '3b7394d3-05aa-4f4e-a115-4f8cb88884ac', 'DISCO DURO EXTERNO TOSHIBA 1TB', 1),
('2018-04-30 19:40:36', 'CAJERO', 'Void', '3b7394d3-05aa-4f4e-a115-4f8cb88884ac', 'DISCO DURO EXTERNO TOSHIBA 1TB', 1),
('2018-04-30 19:40:49', 'CAJERO', 'Void', '3b7394d3-05aa-4f4e-a115-4f8cb88884ac', 'DISCO DURO EXTERNO TOSHIBA 1TB', 1),
('2018-04-30 20:02:48', 'GERENCIA', 'Void', '4152580f-d9b5-4a49-a8bf-ba10ff0c82da', 'BASE REFRIGERANTE', 1),
('2018-04-30 20:13:13', 'GERENCIA', 'Void', 'ee1ef151-1f9b-48a1-96cc-3de25fbb481e', 'DISCO DURO INTERNO TOSHIBA 1TB', 1),
('2018-04-30 20:13:14', 'GERENCIA', 'Void', 'd8dce3ae-39d4-4580-a347-1a002ba65d7f', 'FUENTE CORRIENTE 12V 1000MA', 1),
('2018-04-30 20:13:14', 'GERENCIA', 'Void', 'd8dce3ae-39d4-4580-a347-1a002ba65d7f', 'FUENTE CORRIENTE 12V 1000MA', 1),
('2018-04-30 20:13:14', 'GERENCIA', 'Void', 'dda3b042-f1ec-4cf2-8b38-244a9c32f289', 'VIDEO BALUM PASIVO (PAR) 400MT', 1),
('2018-04-30 20:13:15', 'GERENCIA', 'Void', 'dda3b042-f1ec-4cf2-8b38-244a9c32f289', 'VIDEO BALUM PASIVO (PAR) 400MT', 1),
('2018-04-30 20:13:15', 'GERENCIA', 'Void', 'b4d9023c-6a17-4f94-95af-fa5685cfdc58', 'BALA METALICA 3.6MM 720P', 1),
('2018-04-30 20:13:15', 'GERENCIA', 'Void', 'b4d9023c-6a17-4f94-95af-fa5685cfdc58', 'BALA METALICA 3.6MM 720P', 1),
('2018-04-30 20:13:15', 'GERENCIA', 'Void', 'b7ca7357-fb1a-4bbf-b250-47443c34a90b', 'DVR 4CH 2MP 1HDD ACH AUDIO HSMI VGA', 1),
('2018-04-30 20:14:27', 'GERENCIA', 'Void', 'xxx999_999xxx_x9x9x9', '***', 1),
('2018-04-30 20:14:43', 'GERENCIA', 'Void', 'xxx999_999xxx_x9x9x9', '***', 1),
('2018-04-30 20:15:00', 'GERENCIA', 'Void', 'xxx999_999xxx_x9x9x9', '***', 1),
('2018-04-30 20:17:54', 'GERENCIA', 'Void', 'd8fbd110-16d9-4fd1-b73a-7bbdd8617c79', 'DISCO DURO INTERNO TOSHIBA 2TB', 1),
('2018-04-30 20:17:56', 'GERENCIA', 'Void', 'd8fbd110-16d9-4fd1-b73a-7bbdd8617c79', 'DISCO DURO INTERNO TOSHIBA 2TB', 1),
('2018-04-30 20:17:56', 'GERENCIA', 'Void', 'd8dce3ae-39d4-4580-a347-1a002ba65d7f', 'FUENTE CORRIENTE 12V 1000MA', 1),
('2018-04-30 20:17:56', 'GERENCIA', 'Void', 'd8dce3ae-39d4-4580-a347-1a002ba65d7f', 'FUENTE CORRIENTE 12V 1000MA', 1),
('2018-04-30 20:17:56', 'GERENCIA', 'Void', 'd8dce3ae-39d4-4580-a347-1a002ba65d7f', 'FUENTE CORRIENTE 12V 1000MA', 1),
('2018-04-30 20:17:56', 'GERENCIA', 'Void', 'd8dce3ae-39d4-4580-a347-1a002ba65d7f', 'FUENTE CORRIENTE 12V 1000MA', 1),
('2018-04-30 20:17:57', 'GERENCIA', 'Void', 'd8dce3ae-39d4-4580-a347-1a002ba65d7f', 'FUENTE CORRIENTE 12V 1000MA', 1),
('2018-04-30 20:17:57', 'GERENCIA', 'Void', 'd8dce3ae-39d4-4580-a347-1a002ba65d7f', 'FUENTE CORRIENTE 12V 1000MA', 3),
('2018-04-30 20:17:57', 'GERENCIA', 'Void', 'dda3b042-f1ec-4cf2-8b38-244a9c32f289', 'VIDEO BALUM PASIVO (PAR) 400MT', 8),
('2018-04-30 20:17:57', 'GERENCIA', 'Void', 'ce638b72-3d7f-4558-9f7a-3d9a3f7e2cec', 'DOMO 2.8MM 24LED 1MP 720P', 1),
('2018-04-30 20:17:57', 'GERENCIA', 'Void', 'ce638b72-3d7f-4558-9f7a-3d9a3f7e2cec', 'DOMO 2.8MM 24LED 1MP 720P', 1),
('2018-04-30 20:17:57', 'GERENCIA', 'Void', 'ce638b72-3d7f-4558-9f7a-3d9a3f7e2cec', 'DOMO 2.8MM 24LED 1MP 720P', 1),
('2018-04-30 20:17:58', 'GERENCIA', 'Void', 'ce638b72-3d7f-4558-9f7a-3d9a3f7e2cec', 'DOMO 2.8MM 24LED 1MP 720P', 1),
('2018-04-30 20:17:58', 'GERENCIA', 'Void', 'ce638b72-3d7f-4558-9f7a-3d9a3f7e2cec', 'DOMO 2.8MM 24LED 1MP 720P', 1),
('2018-04-30 20:17:58', 'GERENCIA', 'Void', 'ce638b72-3d7f-4558-9f7a-3d9a3f7e2cec', 'DOMO 2.8MM 24LED 1MP 720P', 1),
('2018-04-30 20:17:58', 'GERENCIA', 'Void', 'ce638b72-3d7f-4558-9f7a-3d9a3f7e2cec', 'DOMO 2.8MM 24LED 1MP 720P', 1),
('2018-04-30 20:17:58', 'GERENCIA', 'Void', 'ce638b72-3d7f-4558-9f7a-3d9a3f7e2cec', 'DOMO 2.8MM 24LED 1MP 720P', 1),
('2018-04-30 20:17:59', 'GERENCIA', 'Void', 'c7b19666-822f-400a-842f-60bfca4d8980', 'DVR 8CH 2MP 1HDD 4CH AUDIO HDMI VGA', 1),
('2018-04-30 20:19:16', 'GERENCIA', 'Void', '173c9da7-791e-410d-9e1f-8825a1e69e07', 'CABLE CATEGORIA 6 EXTERIOR', 1),
('2018-04-30 20:19:16', 'GERENCIA', 'Void', 'a5abe161-9651-4d2a-bb83-722c4fec5d58', 'ANTENA INHALAMBRICA DIRECCIONAL MIMO D300 MBPS 2X2', 1),
('2018-04-30 21:14:05', 'GERENCIA', 'Void', NULL, 'Ticket Deleted', 0),
('2018-05-01 16:58:31', 'GERENCIA', 'Void', '4152580f-d9b5-4a49-a8bf-ba10ff0c82da', 'BASE REFRIGERANTE', 1),
('2018-05-02 16:45:14', 'GERENCIA', 'Void', NULL, 'Ticket Deleted', 0),
('2018-05-02 16:46:44', 'GERENCIA', 'Void', NULL, 'Ticket Deleted', 0),
('2018-05-02 16:48:59', 'GERENCIA', 'Void', NULL, 'Ticket Deleted', 0),
('2018-05-02 20:09:02', 'GERENCIA', 'Void', NULL, 'Ticket Deleted', 0),
('2018-05-02 21:51:32', 'GERENCIA', 'Void', 'ee1ef151-1f9b-48a1-96cc-3de25fbb481e', 'DISCO DURO INTERNO TOSHIBA 1TB', 1),
('2018-05-02 21:51:32', 'GERENCIA', 'Void', 'c7b19666-822f-400a-842f-60bfca4d8980', 'DVR 8CH 2MP 1HDD 4CH AUDIO HDMI VGA', 1),
('2018-05-02 21:51:33', 'GERENCIA', 'Void', '2210ff62-20d3-499b-ab64-1344d6b02da5', 'CANALETA 20*12', 5),
('2018-05-02 21:55:13', 'GERENCIA', 'Void', NULL, 'Ticket Deleted', 0),
('2018-05-02 22:17:36', 'GERENCIA', 'Void', NULL, 'Ticket Deleted', 0),
('2018-05-02 22:20:52', 'GERENCIA', 'Void', NULL, 'Ticket Deleted', 0),
('2018-05-02 22:26:41', 'GERENCIA', 'Void', '42e7efbb-59ac-461e-a101-b0744e79357d', 'DISCO DURO TOHIBA 2TB', 1),
('2018-05-02 22:36:03', 'GERENCIA', 'Void', 'b54a4b44-eb73-4d79-8fd0-30c8b87ec4ef', 'RJ45 CATEGORIA 5', 4),
('2018-05-02 22:36:04', 'GERENCIA', 'Void', 'c3934860-bef3-4b73-adcd-2efdf629def1', 'DIADEMA A-80 CON MICRO', 1),
('2018-05-02 22:36:04', 'GERENCIA', 'Void', '42e7efbb-59ac-461e-a101-b0744e79357d', 'DISCO DURO TOHIBA 2TB', 1),
('2018-05-03 19:04:00', 'GERENCIA', 'Void', '42e7efbb-59ac-461e-a101-b0744e79357d', 'DISCO DURO TOHIBA 2TB', 1),
('2018-05-03 19:04:50', 'GERENCIA', 'Void', NULL, 'Ticket Deleted', 0),
('2018-05-04 21:21:48', 'GERENCIA', 'Void', '1fe7037a-89ac-45c6-9db1-c5882cc62228', 'PROTECTOR DE VOLTAJE PARA INTERNET', 1),
('2018-05-05 18:41:23', 'GERENCIA', '11', 'b4d9023c-6a17-4f94-95af-fa5685cfdc58', 'BALA METALICA 3.6MM 720P', 5),
('2018-05-05 18:41:35', 'GERENCIA', '11', '8e3f67a3-8341-499d-8082-b397ae0a9a7e', 'BALA METALICA DE 2.8-12MM ', 1),
('2018-05-05 18:45:41', 'GERENCIA', '10', '8e3f67a3-8341-499d-8082-b397ae0a9a7e', 'BALA METALICA DE 2.8-12MM ', 2),
('2018-05-05 18:46:28', 'GERENCIA', 'Void', 'f65236e2-5a72-405a-8ca8-9a1ae71a0888', 'IMPRESORA EPSON L575', 1),
('2018-05-05 18:46:28', 'GERENCIA', 'Void', '1fe7037a-89ac-45c6-9db1-c5882cc62228', 'PROTECTOR DE VOLTAJE PARA INTERNET', 1),
('2018-05-07 14:22:32', 'GERENCIA', 'Void', '2031c239-3158-45e4-852d-cc1c14956b6a', 'REGULADOR DE VOLTAJE 8 TOMAS', 1),
('2018-05-07 14:28:55', 'GERENCIA', 'Void', NULL, 'Ticket Deleted', 0),
('2018-05-07 20:03:41', 'GERENCIA', 'Void', NULL, 'Ticket Deleted', 0),
('2018-05-07 21:42:04', 'GERENCIA', 'Void', 'c0e46984-db68-4a88-aebf-f3680facd694', 'CABLE UTP 5E INTERIOR X305MT', 1),
('2018-05-07 21:42:05', 'GERENCIA', 'Void', 'c0e46984-db68-4a88-aebf-f3680facd694', 'CABLE UTP 5E INTERIOR X305MT', 1),
('2018-05-08 14:53:06', 'GERENCIA', 'Void', 'c8c70dd3-7a47-44db-934d-8ee11819dc17', 'FUENTE DE PODER', 1),
('2018-05-08 14:59:04', 'GERENCIA', 'Void', 'd8fbd110-16d9-4fd1-b73a-7bbdd8617c79', 'DISCO DURO INTERNO TOSHIBA 2TB FOR DESKTOP', 1),
('2018-05-08 14:59:05', 'GERENCIA', 'Void', 'ee1ef151-1f9b-48a1-96cc-3de25fbb481e', 'DISCO DURO INTERNO TOSHIBA 1TB', 1),
('2018-05-08 14:59:05', 'GERENCIA', 'Void', 'fab8075c-0632-4158-8fc8-bd715bbadc3f', 'DISCO DURO INTERNO DE PORTATIL 1TB', 1),
('2018-05-08 15:21:19', 'GERENCIA', 'Void', '342fa52c-7c53-42a6-a2a6-63cfaac7671c', 'COMBO DE TECLADO CON MOUSE INHALAMBRICO', 1),
('2018-05-08 15:21:19', 'GERENCIA', 'Void', 'ee1ef151-1f9b-48a1-96cc-3de25fbb481e', 'DISCO DURO INTERNO TOSHIBA 1TB', 1),
('2018-05-08 15:21:20', 'GERENCIA', 'Void', 'fab8075c-0632-4158-8fc8-bd715bbadc3f', 'DISCO DURO INTERNO DE PORTATIL 1TB', 1),
('2018-05-08 15:21:20', 'GERENCIA', 'Void', '8e98d6c6-631a-4a5c-9e22-3cf615373b49', 'QUEMADOR DE DVD LENOVO EXTERNA', 1),
('2018-05-08 20:24:04', 'GERENCIA', 'Void', '42e7efbb-59ac-461e-a101-b0744e79357d', 'DISCO DURO TOHIBA 2TB', 1),
('2018-05-08 20:24:04', 'GERENCIA', 'Void', 'd8fbd110-16d9-4fd1-b73a-7bbdd8617c79', 'DISCO DURO INTERNO TOSHIBA 2TB FOR DESKTOP', 1),
('2018-05-08 20:24:05', 'GERENCIA', 'Void', 'fab8075c-0632-4158-8fc8-bd715bbadc3f', 'DISCO DURO INTERNO DE PORTATIL 1TB', 1),
('2018-05-08 20:24:05', 'GERENCIA', 'Void', 'ee1ef151-1f9b-48a1-96cc-3de25fbb481e', 'DISCO DURO INTERNO TOSHIBA 1TB', 1),
('2018-05-08 20:26:44', 'GERENCIA', 'Void', 'abfac013-6f59-49a4-b1b8-233f3fb4971f', 'SERVICIOS TECNICOS OFICINA ', 1),
('2018-05-08 20:27:25', 'GERENCIA', 'Void', NULL, 'Ticket Deleted', 0),
('2018-05-08 22:36:05', 'GERENCIA', 'Void', NULL, 'Ticket Deleted', 0),
('2018-05-08 23:04:19', 'GERENCIA', 'Void', NULL, 'Ticket Deleted', 0),
('2018-05-08 23:06:11', 'GERENCIA', 'Void', NULL, 'Ticket Deleted', 0),
('2018-05-08 23:09:09', 'CAJA ADMIN', 'Void', NULL, 'Ticket Deleted', 0),
('2018-05-08 23:10:20', 'GERENCIA', '22', 'abfac013-6f59-49a4-b1b8-233f3fb4971f', 'SERVICIOS TECNICOS OFICINA .', 1),
('2018-05-09 21:00:42', 'GERENCIA', 'Void', 'd8dce3ae-39d4-4580-a347-1a002ba65d7f', 'FUENTE CORRIENTE 12V 1000MA', 1),
('2018-05-09 21:00:42', 'GERENCIA', 'Void', 'a7b3e1d8-80dc-41ae-840c-7c7e351e50f3', 'TELEFONO GRANDSTREAM', 1),
('2018-05-11 16:42:22', 'GERENCIA', 'Void', NULL, 'Ticket Deleted', 0),
('2018-05-11 21:35:20', 'GERENCIA', 'Void', '4190711b-4381-4742-9730-489f4bd02e05', 'ADAPTADOR INHALAMBRICO', 1),
('2018-05-11 21:39:30', 'GERENCIA', 'Void', 'ebaa8478-68fd-4ad7-86fd-798696189d49', 'MEMORIA DDR III DE PORTATIL 4GB', 1),
('2018-05-11 22:35:29', 'GERENCIA', 'Void', 'dd07a061-237e-4322-a01f-ae6356b538a9', 'GPS', 1),
('2018-05-12 14:45:08', 'GERENCIA', 'Void', '97ba6646-6dc8-4abf-9e7d-5bc84794bf20', 'IMPRESORA EPSON L380', 1),
('2018-05-12 14:45:36', 'GERENCIA', 'Void', 'bc76f6ec-4be4-4249-a3dc-b517880c8647', 'ALTAVOCES COMPACTOS LOGITECH 5.1 Z506', 1),
('2018-05-12 14:45:36', 'GERENCIA', 'Void', 'bc76f6ec-4be4-4249-a3dc-b517880c8647', 'ALTAVOCES COMPACTOS LOGITECH 5.1 Z506', 1),
('2018-05-12 14:45:37', 'GERENCIA', 'Void', 'bc76f6ec-4be4-4249-a3dc-b517880c8647', 'ALTAVOCES COMPACTOS LOGITECH 5.1 Z506', 1),
('2018-05-12 14:46:04', 'GERENCIA', 'Void', NULL, 'Ticket Deleted', 0),
('2018-05-15 14:42:40', 'GERENCIA', 'Void', 'e53a3977-d9f0-40f6-b6df-fcdfd3259b1d', 'UPS', 1),
('2018-05-15 17:05:15', 'GERENCIA', 'Void', 'ce638b72-3d7f-4558-9f7a-3d9a3f7e2cec', 'DOMO 2.8MM 24LED 1MP 720P', 2),
('2018-05-15 17:05:15', 'GERENCIA', 'Void', '0f3f6dc5-b2a8-44c9-b8de-24bbdcc49d73', 'CAMARA DOMO METALICO 1080P', 2),
('2018-05-15 17:05:15', 'GERENCIA', 'Void', '14497dc1-8d2e-4277-ade6-7eca54d87860', 'BALA PLASTICA HD1080 3.6MM', 2),
('2018-05-15 17:05:15', 'GERENCIA', 'Void', '8e3f67a3-8341-499d-8082-b397ae0a9a7e', 'BALA METALICA DE 2.8-12MM ', 2),
('2018-05-15 17:05:15', 'GERENCIA', 'Void', 'b4d9023c-6a17-4f94-95af-fa5685cfdc58', 'BALA METALICA 3.6MM 720P', 2),
('2018-05-15 17:05:16', 'GERENCIA', 'Void', 'aae1a692-d6ed-44ea-8350-096a9f308e65', 'DVR 16CH 2MP 1HDD 4CH AUDIO HDMI VGA', 1),
('2018-05-16 18:50:45', 'GERENCIA', 'Void', 'aac4c6b0-f568-4374-afc3-d4fa1ea6c998', 'MOUSE ECONOMICO', 1),
('2018-05-16 21:03:18', 'GERENCIA', 'Void', '97ba6646-6dc8-4abf-9e7d-5bc84794bf20', 'IMPRESORA EPSON L380', 1),
('2018-05-16 21:03:58', 'GERENCIA', 'Void', NULL, 'Ticket Deleted', 0),
('2018-05-17 19:44:42', 'GERENCIA', 'Void', '8e3f67a3-8341-499d-8082-b397ae0a9a7e', 'BALA METALICA DE 2.8-12MM ', 1),
('2018-05-17 19:54:16', 'GERENCIA', 'Void', '8e3f67a3-8341-499d-8082-b397ae0a9a7e', 'BALA METALICA DE 2.8-12MM ', 1),
('2018-05-17 20:35:49', 'GERENCIA', 'Void', 'd8fbd110-16d9-4fd1-b73a-7bbdd8617c79', 'DISCO DURO INTERNO TOSHIBA 2TB FOR DESKTOP', 1),
('2018-05-17 20:35:49', 'GERENCIA', 'Void', 'ee1ef151-1f9b-48a1-96cc-3de25fbb481e', 'DISCO DURO INTERNO TOSHIBA 1TB', 1),
('2018-05-17 20:35:50', 'GERENCIA', 'Void', 'aae1a692-d6ed-44ea-8350-096a9f308e65', 'DVR 16CH 2MP 1HDD 4CH AUDIO HDMI VGA', 1),
('2018-05-17 20:35:50', 'GERENCIA', 'Void', '8e3f67a3-8341-499d-8082-b397ae0a9a7e', 'BALA METALICA DE 2.8-12MM ', 4),
('2018-05-17 21:02:32', 'GERENCIA', 'Void', NULL, 'Ticket Deleted', 0),
('2018-05-17 22:23:42', 'GERENCIA', 'Void', 'dda3b042-f1ec-4cf2-8b38-244a9c32f289', 'VIDEO BALUM PASIVO (PAR) 400MT', 4),
('2018-05-17 22:23:42', 'GERENCIA', 'Void', 'd8dce3ae-39d4-4580-a347-1a002ba65d7f', 'FUENTE CORRIENTE 12V 1000MA', 4),
('2018-05-18 13:46:32', 'GERENCIA', 'Void', NULL, 'Ticket Deleted', 0),
('2018-05-18 16:10:44', 'GERENCIA', 'Void', '26bcebd0-96bf-423d-b669-0c18cd912827', 'GAFAS DE REALIDAD VIRTUAL', 1),
('2018-05-18 16:10:48', 'GERENCIA', 'Void', 'd8dce3ae-39d4-4580-a347-1a002ba65d7f', 'FUENTE CORRIENTE 12V 1000MA', 1),
('2018-05-18 16:53:53', 'GERENCIA', 'Void', '4190711b-4381-4742-9730-489f4bd02e05', 'ADAPTADOR INHALAMBRICO', 1),
('2018-05-18 21:39:25', 'GERENCIA', 'Void', '76b24bf0-14a4-498a-a9d3-b9fe55991f4e', 'TECLADO GENIUS KB-125 USB', 1),
('2018-05-18 22:20:34', 'GERENCIA', 'Void', NULL, 'Ticket Deleted', 0),
('2018-05-19 16:13:02', 'GERENCIA', 'Void', NULL, 'Ticket Deleted', 0),
('2018-05-19 18:22:01', 'GERENCIA', 'Void', 'ce638b72-3d7f-4558-9f7a-3d9a3f7e2cec', 'DOMO 2.8MM 24LED 1MP 720P', 1),
('2018-05-19 18:28:08', 'GERENCIA', 'Void', 'b4d9023c-6a17-4f94-95af-fa5685cfdc58', 'BALA METALICA 3.6MM 720P', 1),
('2018-05-19 19:00:51', 'GERENCIA', 'Void', '0f3f6dc5-b2a8-44c9-b8de-24bbdcc49d73', 'CAMARA DOMO METALICO 1080P', 1),
('2018-05-19 19:28:53', 'GERENCIA', 'Void', NULL, 'Ticket Deleted', 0),
('2018-05-21 15:10:18', 'GERENCIA', 'Void', NULL, 'Ticket Deleted', 0),
('2018-05-21 19:29:05', 'GERENCIA', 'Void', NULL, 'Ticket Deleted', 0),
('2018-05-21 19:31:06', 'GERENCIA', 'Void', NULL, 'Ticket Deleted', 0),
('2018-05-21 20:59:48', 'GERENCIA', 'Void', NULL, 'Ticket Deleted', 0),
('2018-05-21 21:48:54', 'GERENCIA', 'Void', 'b4d9023c-6a17-4f94-95af-fa5685cfdc58', 'BALA METALICA 3.6MM 720P', 1),
('2018-05-21 21:49:07', 'GERENCIA', 'Void', '14497dc1-8d2e-4277-ade6-7eca54d87860', 'BALA PLASTICA HD1080 3.6MM', 1),
('2018-05-21 21:49:07', 'GERENCIA', 'Void', 'b4d9023c-6a17-4f94-95af-fa5685cfdc58', 'BALA METALICA 3.6MM 720P', 1),
('2018-05-21 21:49:08', 'GERENCIA', 'Void', '0f3f6dc5-b2a8-44c9-b8de-24bbdcc49d73', 'CAMARA DOMO METALICO 1080P', 1),
('2018-05-21 21:49:09', 'GERENCIA', 'Void', '14497dc1-8d2e-4277-ade6-7eca54d87860', 'BALA PLASTICA HD1080 3.6MM', 1),
('2018-05-21 21:49:09', 'GERENCIA', 'Void', 'b4d9023c-6a17-4f94-95af-fa5685cfdc58', 'BALA METALICA 3.6MM 720P', 1),
('2018-05-21 21:49:10', 'GERENCIA', 'Void', '8e3f67a3-8341-499d-8082-b397ae0a9a7e', 'BALA METALICA DE 2.8-12MM ', 1),
('2018-05-21 21:49:16', 'GERENCIA', 'Void', 'ce638b72-3d7f-4558-9f7a-3d9a3f7e2cec', 'DOMO 2.8MM 24LED 1MP 720P', 1),
('2018-05-21 21:49:22', 'GERENCIA', 'Void', '81109003-89b0-4da1-8ab2-d0f06ffa839a', 'APUNTADORES', 1),
('2018-05-21 23:10:03', 'GERENCIA', 'Void', NULL, 'Ticket Deleted', 0),
('2018-05-22 16:15:11', 'GERENCIA', 'Void', '173c9da7-791e-410d-9e1f-8825a1e69e07', 'CABLE CATEGORIA 6 EXTERIOR', 10),
('2018-05-22 16:16:45', 'GERENCIA', 'Void', NULL, 'Ticket Deleted', 0),
('2018-05-24 19:20:48', 'GERENCIA', 'Void', 'c7b19666-822f-400a-842f-60bfca4d8980', 'DVR 8CH 2MP 1HDD 4CH AUDIO HDMI VGA', 1),
('2018-05-24 19:20:49', 'GERENCIA', 'Void', 'b7ca7357-fb1a-4bbf-b250-47443c34a90b', 'DVR 4CH 2MP 1HDD ACH AUDIO HSMI VGA', 1),
('2018-05-24 19:20:50', 'GERENCIA', 'Void', 'ce638b72-3d7f-4558-9f7a-3d9a3f7e2cec', 'DOMO 2.8MM 24LED 1MP 720P', 1),
('2018-05-24 19:20:50', 'GERENCIA', 'Void', '0f3f6dc5-b2a8-44c9-b8de-24bbdcc49d73', 'CAMARA DOMO METALICO 1080P', 1),
('2018-05-24 19:20:50', 'GERENCIA', 'Void', '14497dc1-8d2e-4277-ade6-7eca54d87860', 'BALA PLASTICA HD1080 3.6MM', 1),
('2018-05-24 19:20:51', 'GERENCIA', 'Void', '8e3f67a3-8341-499d-8082-b397ae0a9a7e', 'BALA METALICA DE 2.8-12MM ', 1),
('2018-05-24 19:20:51', 'GERENCIA', 'Void', 'b4d9023c-6a17-4f94-95af-fa5685cfdc58', 'BALA METALICA 3.6MM 720P', 1),
('2018-05-24 19:56:34', 'GERENCIA', 'Void', 'c7b19666-822f-400a-842f-60bfca4d8980', 'DVR 8CH 2MP 1HDD 4CH AUDIO HDMI VGA', 1),
('2018-05-24 19:56:34', 'GERENCIA', 'Void', 'b7ca7357-fb1a-4bbf-b250-47443c34a90b', 'DVR 4CH 2MP 1HDD ACH AUDIO HSMI VGA', 1),
('2018-05-24 21:27:07', 'GERENCIA', 'Void', '5fc18d75-75dd-4230-9e2f-c12127ad7ffc', 'RJ45 CATEGORIA 6', -1),
('2018-05-25 13:59:19', 'GERENCIA', 'Void', 'ce638b72-3d7f-4558-9f7a-3d9a3f7e2cec', 'DOMO 2.8MM 24LED 1MP 720P', 1),
('2018-05-25 14:12:34', 'GERENCIA', 'Void', 'b4d9023c-6a17-4f94-95af-fa5685cfdc58', 'BALA METALICA 3.6MM 720P', 1),
('2018-05-25 14:12:34', 'GERENCIA', 'Void', '14497dc1-8d2e-4277-ade6-7eca54d87860', 'BALA PLASTICA HD1080 3.6MM', 1),
('2018-05-25 14:12:35', 'GERENCIA', 'Void', '8e3f67a3-8341-499d-8082-b397ae0a9a7e', 'BALA METALICA DE 2.8-12MM ', 1),
('2018-05-25 14:12:35', 'GERENCIA', 'Void', 'dda3b042-f1ec-4cf2-8b38-244a9c32f289', 'VIDEO BALUM PASIVO (PAR) 400MT', 1),
('2018-05-25 14:12:36', 'GERENCIA', 'Void', 'd8dce3ae-39d4-4580-a347-1a002ba65d7f', 'FUENTE CORRIENTE 12V 1000MA', 1),
('2018-05-25 15:38:20', 'GERENCIA', 'Void', '8e3f67a3-8341-499d-8082-b397ae0a9a7e', 'BALA METALICA DE 2.8-12MM ', 1),
('2018-05-25 15:38:20', 'GERENCIA', 'Void', 'd8dce3ae-39d4-4580-a347-1a002ba65d7f', 'FUENTE CORRIENTE 12V 1000MA', 1),
('2018-05-25 21:19:53', 'GERENCIA', 'Void', '3f43d708-b1c2-48d6-9929-d25b0ee93152', 'CAJA DE PASO 10X10', 1),
('2018-05-25 21:23:06', 'GERENCIA', 'Void', '0f3f6dc5-b2a8-44c9-b8de-24bbdcc49d73', 'CAMARA DOMO METALICO 1080P', 1),
('2018-05-25 21:24:38', 'GERENCIA', 'Void', 'b4d9023c-6a17-4f94-95af-fa5685cfdc58', 'BALA METALICA 3.6MM 720P', 1),
('2018-05-25 21:26:11', 'GERENCIA', 'Void', '14497dc1-8d2e-4277-ade6-7eca54d87860', 'BALA PLASTICA HD1080 3.6MM', 1),
('2018-05-25 21:27:17', 'GERENCIA', 'Void', NULL, 'Ticket Deleted', 0),
('2018-05-26 20:04:04', 'GERENCIA', 'Void', 'abe789c1-189b-4bf9-af4e-85c591da2c50', 'FUENTE LG DE CORRIENTE PARA MONITOR', 1),
('2018-05-26 20:04:08', 'GERENCIA', 'Void', 'c8c70dd3-7a47-44db-934d-8ee11819dc17', 'FUENTE DE PODER', 1),
('2018-05-26 20:04:11', 'GERENCIA', 'Void', 'abe789c1-189b-4bf9-af4e-85c591da2c50', 'FUENTE LG DE CORRIENTE PARA MONITOR', 1),
('2018-05-28 15:58:11', 'GERENCIA', 'Void', '14497dc1-8d2e-4277-ade6-7eca54d87860', 'BALA PLASTICA HD1080 3.6MM', 1),
('2018-05-28 15:59:28', 'GERENCIA', 'Void', 'b4d9023c-6a17-4f94-95af-fa5685cfdc58', 'BALA METALICA 3.6MM 720P', 1),
('2018-05-28 16:01:54', 'GERENCIA', 'Void', '6b7efc03-a955-4269-9ca5-ca2bf04c3d48', 'CINTA NEGRA', 1),
('2018-05-28 16:01:56', 'GERENCIA', 'Void', 'b4d9023c-6a17-4f94-95af-fa5685cfdc58', 'BALA METALICA 3.6MM 720P', 1),
('2018-05-28 16:02:03', 'GERENCIA', 'Void', 'ee1ef151-1f9b-48a1-96cc-3de25fbb481e', 'DISCO DURO INTERNO TOSHIBA 1TB', 1),
('2018-05-28 16:02:08', 'GERENCIA', 'Void', 'ee1ef151-1f9b-48a1-96cc-3de25fbb481e', 'DISCO DURO INTERNO TOSHIBA 1TB', 1),
('2018-05-28 16:06:10', 'GERENCIA', 'Void', 'dda3b042-f1ec-4cf2-8b38-244a9c32f289', 'VIDEO BALUM PASIVO (PAR) 400MT', 1),
('2018-05-28 16:06:10', 'GERENCIA', 'Void', '2031c239-3158-45e4-852d-cc1c14956b6a', 'REGULADOR DE VOLTAJE 8 TOMAS', 1),
('2018-05-28 16:06:11', 'GERENCIA', 'Void', '2bc44efd-bea7-4d31-ab55-f85215ed491d', 'GABINETE 17A X 40F X 47 AN', 1),
('2018-05-28 16:06:11', 'GERENCIA', 'Void', 'd8dce3ae-39d4-4580-a347-1a002ba65d7f', 'FUENTE CORRIENTE 12V 1000MA', 1),
('2018-05-28 16:06:11', 'GERENCIA', 'Void', 'c7b19666-822f-400a-842f-60bfca4d8980', 'DVR 8CH 2MP 1HDD 4CH AUDIO HDMI VGA', 1),
('2018-05-28 16:06:11', 'GERENCIA', 'Void', 'ee1ef151-1f9b-48a1-96cc-3de25fbb481e', 'DISCO DURO INTERNO TOSHIBA 1TB', 1),
('2018-05-28 16:06:12', 'GERENCIA', 'Void', 'd8fbd110-16d9-4fd1-b73a-7bbdd8617c79', 'DISCO DURO INTERNO TOSHIBA 2TB FOR DESKTOP', 1),
('2018-05-28 16:06:12', 'GERENCIA', 'Void', '2210ff62-20d3-499b-ab64-1344d6b02da5', 'CANALETA 20*12', 1),
('2018-05-28 16:06:12', 'GERENCIA', 'Void', '3f43d708-b1c2-48d6-9929-d25b0ee93152', 'CAJA DE PASO 10X10', 1),
('2018-05-28 16:06:12', 'GERENCIA', 'Void', '8e3f67a3-8341-499d-8082-b397ae0a9a7e', 'BALA METALICA DE 2.8-12MM ', 1),
('2018-05-28 16:26:06', 'GERENCIA', 'Void', 'dda3b042-f1ec-4cf2-8b38-244a9c32f289', 'VIDEO BALUM PASIVO (PAR) 400MT', 1),
('2018-05-28 16:27:04', 'GERENCIA', 'Void', NULL, 'Ticket Deleted', 0),
('2018-05-29 21:19:39', 'GERENCIA', 'Void', '3f43d708-b1c2-48d6-9929-d25b0ee93152', 'CAJA DE PASO 10X10', 1),
('2018-05-29 21:19:39', 'GERENCIA', 'Void', '2bc44efd-bea7-4d31-ab55-f85215ed491d', 'GABINETE 17A X 40F X 47 AN', 1),
('2018-05-29 21:19:39', 'GERENCIA', 'Void', '3f43d708-b1c2-48d6-9929-d25b0ee93152', 'CAJA DE PASO 10X10', 1),
('2018-05-29 21:19:39', 'GERENCIA', 'Void', 'ce638b72-3d7f-4558-9f7a-3d9a3f7e2cec', 'DOMO 2.8MM 24LED 1MP 720P', 2),
('2018-05-29 21:19:39', 'GERENCIA', 'Void', 'd8dce3ae-39d4-4580-a347-1a002ba65d7f', 'FUENTE CORRIENTE 12V 1000MA', 4),
('2018-05-29 21:19:40', 'GERENCIA', 'Void', 'dda3b042-f1ec-4cf2-8b38-244a9c32f289', 'VIDEO BALUM PASIVO (PAR) 400MT', 1),
('2018-05-29 21:43:51', 'GERENCIA', 'Void', '2bc44efd-bea7-4d31-ab55-f85215ed491d', 'GABINETE 17A X 40F X 47 AN', 1),
('2018-05-29 21:43:51', 'GERENCIA', 'Void', '2210ff62-20d3-499b-ab64-1344d6b02da5', 'CANALETA 20*12', 1),
('2018-05-29 21:43:52', 'GERENCIA', 'Void', 'dda3b042-f1ec-4cf2-8b38-244a9c32f289', 'VIDEO BALUM PASIVO (PAR) 400MT', 1),
('2018-05-29 21:46:58', 'GERENCIA', 'Void', NULL, 'Ticket Deleted', 0),
('2018-05-30 20:54:46', 'GERENCIA', 'Void', 'c7b19666-822f-400a-842f-60bfca4d8980', 'DVR 8CH 2MP 1HDD 4CH AUDIO HDMI VGA', 1),
('2018-05-30 20:57:46', 'GERENCIA', 'Void', 'd8dce3ae-39d4-4580-a347-1a002ba65d7f', 'FUENTE CORRIENTE 12V 1000MA', 1),
('2018-05-30 20:57:47', 'GERENCIA', 'Void', 'abe789c1-189b-4bf9-af4e-85c591da2c50', 'FUENTE LG DE CORRIENTE PARA MONITOR', 1),
('2018-05-30 20:59:07', 'GERENCIA', 'Void', NULL, 'Ticket Deleted', 0),
('2018-05-30 20:59:10', 'GERENCIA', 'Void', 'b4d9023c-6a17-4f94-95af-fa5685cfdc58', 'BALA METALICA 3.6MM 720P', 1),
('2018-05-30 20:59:11', 'GERENCIA', 'Void', '14497dc1-8d2e-4277-ade6-7eca54d87860', 'BALA PLASTICA HD1080 3.6MM', 1),
('2018-05-30 20:59:12', 'GERENCIA', 'Void', 'd8dce3ae-39d4-4580-a347-1a002ba65d7f', 'FUENTE CORRIENTE 12V 1000MA', 1),
('2018-05-31 13:54:31', 'GERENCIA', 'Void', 'ce638b72-3d7f-4558-9f7a-3d9a3f7e2cec', 'DOMO 2.8MM 24LED 1MP 720P', 1),
('2018-05-31 13:54:31', 'GERENCIA', 'Void', '0f3f6dc5-b2a8-44c9-b8de-24bbdcc49d73', 'CAMARA DOMO METALICO 1080P', 1),
('2018-05-31 13:54:32', 'GERENCIA', 'Void', '14497dc1-8d2e-4277-ade6-7eca54d87860', 'BALA PLASTICA HD1080 3.6MM', 1),
('2018-05-31 13:54:32', 'GERENCIA', 'Void', '8e3f67a3-8341-499d-8082-b397ae0a9a7e', 'BALA METALICA DE 2.8-12MM ', 1),
('2018-05-31 13:54:32', 'GERENCIA', 'Void', '8e3f67a3-8341-499d-8082-b397ae0a9a7e', 'BALA METALICA DE 2.8-12MM ', 1),
('2018-05-31 13:54:32', 'GERENCIA', 'Void', 'b4d9023c-6a17-4f94-95af-fa5685cfdc58', 'BALA METALICA 3.6MM 720P', 1),
('2018-05-31 13:54:57', 'GERENCIA', 'Void', NULL, 'Ticket Deleted', 0),
('2018-05-31 13:55:00', 'GERENCIA', 'Void', 'dd07a061-237e-4322-a01f-ae6356b538a9', 'GPS', 1),
('2018-05-31 13:55:01', 'GERENCIA', 'Void', '2bc44efd-bea7-4d31-ab55-f85215ed491d', 'GABINETE 17A X 40F X 47 AN', 1),
('2018-05-31 13:55:01', 'GERENCIA', 'Void', '7ea10e52-23cc-48d7-8273-dc405cc02a9f', 'RCA', 1),
('2018-05-31 13:55:01', 'GERENCIA', 'Void', '0f3f6dc5-b2a8-44c9-b8de-24bbdcc49d73', 'CAMARA DOMO METALICO 1080P', 4),
('2018-05-31 13:55:01', 'GERENCIA', 'Void', 'c7b19666-822f-400a-842f-60bfca4d8980', 'DVR 8CH 2MP 1HDD 4CH AUDIO HDMI VGA', 1),
('2018-05-31 13:55:01', 'GERENCIA', 'Void', '8e3f67a3-8341-499d-8082-b397ae0a9a7e', 'BALA METALICA DE 2.8-12MM ', 4),
('2018-05-31 16:45:21', 'GERENCIA', 'Void', 'fab8075c-0632-4158-8fc8-bd715bbadc3f', 'DISCO DURO INTERNO DE PORTATIL 1TB', 1),
('2018-05-31 16:45:21', 'GERENCIA', 'Void', 'ee1ef151-1f9b-48a1-96cc-3de25fbb481e', 'DISCO DURO INTERNO TOSHIBA 1TB', 1),
('2018-06-01 16:07:53', 'GERENCIA', 'Void', '2bc44efd-bea7-4d31-ab55-f85215ed491d', 'GABINETE 17A X 40F X 47 AN', 1),
('2018-06-01 16:07:53', 'GERENCIA', 'Void', 'b7ca7357-fb1a-4bbf-b250-47443c34a90b', 'DVR 4CH 2MP 1HDD ACH AUDIO HSMI VGA', 1),
('2018-06-01 16:07:54', 'GERENCIA', 'Void', '8e3f67a3-8341-499d-8082-b397ae0a9a7e', 'BALA METALICA DE 2.8-12MM ', 1),
('2018-06-01 16:07:54', 'GERENCIA', 'Void', '0f3f6dc5-b2a8-44c9-b8de-24bbdcc49d73', 'CAMARA DOMO METALICO 1080P', 1),
('2018-06-01 16:07:54', 'GERENCIA', 'Void', 'c7b19666-822f-400a-842f-60bfca4d8980', 'DVR 8CH 2MP 1HDD 4CH AUDIO HDMI VGA', 1),
('2018-06-01 16:08:09', 'GERENCIA', 'Void', '8e3f67a3-8341-499d-8082-b397ae0a9a7e', 'BALA METALICA DE 2.8-12MM ', 1),
('2018-06-01 16:31:49', 'GERENCIA', 'Void', 'ce638b72-3d7f-4558-9f7a-3d9a3f7e2cec', 'DOMO 2.8MM 24LED 1MP 720P', 1),
('2018-06-01 16:31:50', 'GERENCIA', 'Void', 'b4d9023c-6a17-4f94-95af-fa5685cfdc58', 'BALA METALICA 3.6MM 720P', 1),
('2018-06-05 19:08:05', 'GERENCIA', 'Void', '2bc44efd-bea7-4d31-ab55-f85215ed491d', 'GABINETE 17A X 40F X 47 AN', 1),
('2018-06-05 19:08:05', 'GERENCIA', 'Void', 'b7ca7357-fb1a-4bbf-b250-47443c34a90b', 'DVR 4CH 2MP 1HDD ACH AUDIO HSMI VGA', 1),
('2018-06-05 19:08:05', 'GERENCIA', 'Void', 'c7b19666-822f-400a-842f-60bfca4d8980', 'DVR 8CH 2MP 1HDD 4CH AUDIO HDMI VGA', 1),
('2018-06-05 19:08:48', 'GERENCIA', 'Void', NULL, 'Ticket Deleted', 0),
('2018-06-07 22:27:27', 'GERENCIA', 'Void', NULL, 'Ticket Deleted', 0),
('2018-06-08 14:22:00', 'GERENCIA', 'Void', NULL, 'Ticket Deleted', 0),
('2018-06-09 20:10:49', 'GERENCIA', 'Void', 'e08eb3e8-39fb-4d6e-b0a5-861e51b31141', 'MEMORIA DDR II DE 2GB', 1),
('2018-06-09 20:24:58', 'GERENCIA', 'Void', '97ba6646-6dc8-4abf-9e7d-5bc84794bf20', 'IMPRESORA EPSON L380', 1),
('2018-06-09 20:24:58', 'GERENCIA', 'Void', 'e08eb3e8-39fb-4d6e-b0a5-861e51b31141', 'MEMORIA DDR II DE 2GB', 1),
('2018-06-09 20:26:06', 'GERENCIA', 'Void', NULL, 'Ticket Deleted', 0),
('2018-06-09 20:40:56', 'GERENCIA', 'Void', NULL, 'Ticket Deleted', 0),
('2018-06-09 20:43:04', 'GERENCIA', 'Void', NULL, 'Ticket Deleted', 0),
('2018-06-11 14:21:26', 'GERENCIA', 'Void', '4152580f-d9b5-4a49-a8bf-ba10ff0c82da', 'BASE REFRIGERANTE', 1),
('2018-06-11 14:21:26', 'GERENCIA', 'Void', 'ee621994-b1f1-491f-bc8d-105821436a9a', 'BOLSO HP', 1),
('2018-06-11 14:52:08', 'GERENCIA', 'Void', NULL, 'Ticket Deleted', 0),
('2018-06-12 14:32:38', 'GERENCIA', 'Void', '42e7efbb-59ac-461e-a101-b0744e79357d', 'DISCO DURO TOHIBA 2TB', 1),
('2018-06-12 14:37:23', 'GERENCIA', 'Void', NULL, 'Ticket Deleted', 0),
('2018-06-12 21:52:24', 'GERENCIA', 'Void', '8e3f67a3-8341-499d-8082-b397ae0a9a7e', 'BALA METALICA DE 2.8-12MM ', 1),
('2018-06-13 16:48:13', 'GERENCIA', 'Void', '2bc44efd-bea7-4d31-ab55-f85215ed491d', 'GABINETE 17A X 40F X 47 AN', 1),
('2018-06-13 16:48:55', 'GERENCIA', 'Void', NULL, 'Ticket Deleted', 0),
('2018-06-19 19:11:42', 'GERENCIA', 'Void', 'c7b19666-822f-400a-842f-60bfca4d8980', 'DVR 8CH 2MP 1HDD 4CH AUDIO HDMI VGA', 1),
('2018-06-19 19:17:17', 'GERENCIA', 'Void', '97ba6646-6dc8-4abf-9e7d-5bc84794bf20', 'IMPRESORA EPSON L380', 1),
('2018-06-19 19:18:28', 'GERENCIA', 'Void', NULL, 'Ticket Deleted', 0),
('2018-06-19 19:40:14', 'GERENCIA', 'Void', 'xxx999_999xxx_x9x9x9', 'MINI MOUSE 3BUMEN RETRACTIL', 1),
('2018-06-23 21:06:14', 'GERENCIA', 'Void', NULL, 'Ticket Deleted', 0),
('2018-06-26 22:12:49', 'GERENCIA', 'Void', '0f3f6dc5-b2a8-44c9-b8de-24bbdcc49d73', 'CAMARA DOMO METALICO 1080P', 1),
('2018-06-26 22:13:21', 'GERENCIA', 'Void', 'b4d9023c-6a17-4f94-95af-fa5685cfdc58', 'BALA METALICA 3.6MM 720P', 1),
('2018-07-04 14:01:30', 'GERENCIA', 'Void', '97ba6646-6dc8-4abf-9e7d-5bc84794bf20', 'IMPRESORA EPSON L380', 1),
('2018-07-04 14:33:45', 'GERENCIA', 'Void', '0f3f6dc5-b2a8-44c9-b8de-24bbdcc49d73', 'CAMARA DOMO METALICO 1080P', 3),
('2018-07-04 14:33:50', 'GERENCIA', 'Void', '0f3f6dc5-b2a8-44c9-b8de-24bbdcc49d73', 'CAMARA DOMO METALICO 1080P', 3),
('2018-07-04 14:35:10', 'GERENCIA', 'Void', 'd80aef84-aec7-4965-9541-efffa57db37f', 'TINTA ROSADA EPSON', 5),
('2018-07-04 14:40:54', 'GERENCIA', 'Void', '342fa52c-7c53-42a6-a2a6-63cfaac7671c', 'COMBO DE TECLADO CON MOUSE INHALAMBRICO', 1),
('2018-07-05 14:47:41', 'GERENCIA', 'Void', NULL, 'Ticket Deleted', 0),
('2018-07-06 19:57:17', 'GERENCIA', 'Void', NULL, 'Ticket Deleted', 0),
('2018-07-06 20:22:54', 'GERENCIA', 'Void', NULL, 'Ticket Deleted', 0),
('2018-07-06 21:11:35', 'GERENCIA', 'Void', NULL, 'Ticket Deleted', 0),
('2018-07-06 21:14:42', 'GERENCIA', 'Void', NULL, 'Ticket Deleted', 0),
('2018-07-09 14:01:38', 'GERENCIA', 'Void', 'b7ca7357-fb1a-4bbf-b250-47443c34a90b', 'DVR 4CH 2MP 1HDD ACH AUDIO HSMI VGA', 1),
('2018-07-09 14:05:59', 'GERENCIA', 'Void', 'c7b19666-822f-400a-842f-60bfca4d8980', 'DVR 8CH 2MP 1HDD 4CH AUDIO HDMI VGA', 1),
('2018-07-09 14:06:01', 'GERENCIA', 'Void', 'dda3b042-f1ec-4cf2-8b38-244a9c32f289', 'VIDEO BALUM PASIVO (PAR) 400MT', 1),
('2018-07-09 14:06:04', 'GERENCIA', 'Void', 'c8c70dd3-7a47-44db-934d-8ee11819dc17', 'FUENTE DE PODER', 1),
('2018-07-09 14:06:07', 'GERENCIA', 'Void', '173c9da7-791e-410d-9e1f-8825a1e69e07', 'CABLE CATEGORIA 6 EXTERIOR', 1),
('2018-07-09 14:06:30', 'GERENCIA', 'Void', '173c9da7-791e-410d-9e1f-8825a1e69e07', 'CABLE CATEGORIA 6 EXTERIOR', 1),
('2018-07-09 14:06:34', 'GERENCIA', 'Void', 'abbc4560-5d38-4e05-a31e-ddb6bbe81c1b', 'CABLE DE PODER', 1),
('2018-07-09 14:06:49', 'GERENCIA', 'Void', '8574460b-daa1-4be7-b42f-86def1f7e5aa', 'CABLE EXTERIOR XMETRO', 1),
('2018-07-09 14:06:55', 'GERENCIA', 'Void', '3f43d708-b1c2-48d6-9929-d25b0ee93152', 'CAJA DE PASO 10X10', 1),
('2018-07-09 14:07:09', 'GERENCIA', 'Void', 'c0e46984-db68-4a88-aebf-f3680facd694', 'CABLE UTP 5E INTERIOR X305MT', 1),
('2018-07-09 14:09:49', 'GERENCIA', 'Void', '6b7efc03-a955-4269-9ca5-ca2bf04c3d48', 'CINTA NEGRA', 1),
('2018-07-09 14:09:51', 'GERENCIA', 'Void', '52602630-bf45-4d1a-9829-e4e9955eb71b', 'CAJON MONEDERO', 1),
('2018-07-09 14:10:03', 'GERENCIA', 'Void', 'abfac013-6f59-49a4-b1b8-233f3fb4971f', 'SERVICIOS TECNICOS OFICINA ', 1),
('2018-07-09 14:11:27', 'GERENCIA', 'Void', '3941df9e-4d01-4bce-81f8-12dea263db79', 'TINTA GENERICA EPSON L210 L375', 1),
('2018-07-09 14:11:54', 'GERENCIA', 'Void', '39949465-403b-455f-9077-c352fadbbfcd', 'TECLADO GENIUS KB-225 MULTIMEDIA USB', 1),
('2018-07-09 14:11:56', 'GERENCIA', 'Void', '76b24bf0-14a4-498a-a9d3-b9fe55991f4e', 'TECLADO GENIUS KB-125 USB', 1),
('2018-07-09 14:12:18', 'GERENCIA', 'Void', '8e98d6c6-631a-4a5c-9e22-3cf615373b49', 'QUEMADOR DE DVD LENOVO EXTERNA', 1),
('2018-07-09 14:12:36', 'GERENCIA', 'Void', '16a10d31-af9a-410e-a72d-650bacc52a59', 'PROTECTOR TECLADO 14\"/15.6\"', 1),
('2018-07-09 14:13:25', 'GERENCIA', 'Void', '26bcebd0-96bf-423d-b669-0c18cd912827', 'GAFAS DE REALIDAD VIRTUAL', 1),
('2018-07-09 14:13:26', 'GERENCIA', 'Void', '9975dffd-a8e1-43df-9712-611140de31db', 'MOUSE GENIUS USB', 1),
('2018-07-09 14:13:36', 'GERENCIA', 'Void', '26bcebd0-96bf-423d-b669-0c18cd912827', 'GAFAS DE REALIDAD VIRTUAL', 1),
('2018-07-09 14:34:20', 'GERENCIA', 'Void', NULL, 'Ticket Deleted', 0),
('2018-07-11 13:21:56', 'GERENCIA', 'Void', 'd8dce3ae-39d4-4580-a347-1a002ba65d7f', 'FUENTE CORRIENTE 12V 1000MA', 1),
('2018-07-11 16:22:41', 'GERENCIA', 'Void', NULL, 'Ticket Deleted', 0),
('2018-07-11 16:22:49', 'GERENCIA', 'Void', '8574460b-daa1-4be7-b42f-86def1f7e5aa', 'CABLE EXTERIOR XMETRO', 1),
('2018-07-11 21:55:15', 'GERENCIA', 'Void', '8574460b-daa1-4be7-b42f-86def1f7e5aa', 'CABLE EXTERIOR XMETRO', 40),
('2018-07-11 21:55:16', 'GERENCIA', 'Void', 'd8dce3ae-39d4-4580-a347-1a002ba65d7f', 'FUENTE CORRIENTE 12V 1000MA', 4),
('2018-07-11 21:55:16', 'GERENCIA', 'Void', 'dda3b042-f1ec-4cf2-8b38-244a9c32f289', 'VIDEO BALUM PASIVO (PAR) 400MT', 4),
('2018-07-11 21:55:16', 'GERENCIA', 'Void', 'b7ca7357-fb1a-4bbf-b250-47443c34a90b', 'DVR 4CH 2MP 1HDD ACH AUDIO HSMI VGA', 1),
('2018-07-11 21:55:16', 'GERENCIA', 'Void', 'ce638b72-3d7f-4558-9f7a-3d9a3f7e2cec', 'DOMO 2.8MM 24LED 1MP 720P', 4),
('2018-07-11 21:55:16', 'GERENCIA', 'Void', '3f43d708-b1c2-48d6-9929-d25b0ee93152', 'CAJA DE PASO 10X10G', 4),
('2018-07-12 19:53:10', 'GERENCIA', 'Void', 'ee621994-b1f1-491f-bc8d-105821436a9a', 'BOLSO HP', 1),
('2018-07-12 19:53:41', 'GERENCIA', 'Void', NULL, 'Ticket Deleted', 0),
('2018-07-16 19:47:41', 'GERENCIA', 'Void', '5fc18d75-75dd-4230-9e2f-c12127ad7ffc', 'RJ45 CATEGORIA 6', 1),
('2018-07-16 19:47:41', 'GERENCIA', 'Void', '2bc44efd-bea7-4d31-ab55-f85215ed491d', 'GABINETE 17A X 40F X 47 AN', 1),
('2018-07-16 19:47:41', 'GERENCIA', 'Void', '173c9da7-791e-410d-9e1f-8825a1e69e07', 'CABLE CATEGORIA 6 EXTERIOR', 1),
('2018-07-16 20:38:34', 'GERENCIA', 'Void', '173c9da7-791e-410d-9e1f-8825a1e69e07', 'CABLE CATEGORIA 6 EXTERIOR', 1),
('2018-07-16 20:48:39', 'GERENCIA', 'Void', NULL, 'Ticket Deleted', 0),
('2018-07-16 20:52:04', 'GERENCIA', 'Void', '0f3f6dc5-b2a8-44c9-b8de-24bbdcc49d73', 'CAMARA DOMO METALICO 1080P', 1),
('2018-07-16 20:52:23', 'GERENCIA', 'Void', '0f3f6dc5-b2a8-44c9-b8de-24bbdcc49d73', 'CAMARA DOMO METALICO 1080P', 1),
('2018-07-17 13:56:36', 'GERENCIA', 'Void', '14497dc1-8d2e-4277-ade6-7eca54d87860', 'BALA PLASTICA HD1080 3.6MM', 10),
('2018-07-17 13:56:37', 'GERENCIA', 'Void', '0f3f6dc5-b2a8-44c9-b8de-24bbdcc49d73', 'CAMARA DOMO METALICO 1080P.', 10),
('2018-07-17 13:57:08', 'GERENCIA', 'Void', '9621839b-65fb-49cd-96f3-9e1fa0c11449', 'TINTA AMARILLA EPSON', 1),
('2018-07-17 14:01:13', 'GERENCIA', 'Void', NULL, 'Ticket Deleted', 0),
('2018-07-19 13:23:55', 'GERENCIA', 'Void', NULL, 'Ticket Deleted', 0),
('2018-07-23 13:20:20', 'GERENCIA', 'Void', 'aac4c6b0-f568-4374-afc3-d4fa1ea6c998', 'MOUSE ECONOMICO', 0),
('2018-07-23 13:21:26', 'GERENCIA', 'Void', 'aac4c6b0-f568-4374-afc3-d4fa1ea6c998', 'MOUSE ECONOMICO', 0),
('2018-07-23 21:43:03', 'GERENCIA', 'Void', NULL, 'Ticket Deleted', 0),
('2018-07-26 13:44:46', 'GERENCIA', 'Void', NULL, 'Ticket Deleted', 0),
('2018-07-26 13:45:25', 'GERENCIA', 'Void', 'dda3b042-f1ec-4cf2-8b38-244a9c32f289', 'VIDEO BALUM PASIVO (PAR) 400MT', 1),
('2018-07-26 13:45:25', 'GERENCIA', 'Void', 'd8dce3ae-39d4-4580-a347-1a002ba65d7f', 'FUENTE CORRIENTE 12V 1000MA', 1),
('2018-07-26 13:45:26', 'GERENCIA', 'Void', 'b7ca7357-fb1a-4bbf-b250-47443c34a90b', 'DVR 4CH 2MP 1HDD ACH AUDIO HSMI VGA', 1),
('2018-07-26 13:45:26', 'GERENCIA', 'Void', '0f3f6dc5-b2a8-44c9-b8de-24bbdcc49d73', 'CAMARA DOMO METALICO 1080P', 1),
('2018-07-27 15:46:16', 'CAJA ADMIN', 'Void', NULL, 'Ticket Deleted', 0),
('2018-08-01 15:28:33', 'GERENCIA', 'Void', NULL, 'Ticket Deleted', 0),
('2018-08-02 19:25:50', 'GERENCIA', 'Void', '6b7efc03-a955-4269-9ca5-ca2bf04c3d48', 'CINTA NEGRA', 1),
('2018-08-02 19:27:57', 'GERENCIA', 'Void', '61c6b4b9-8986-4c45-862c-dee267867b89', 'TINTA AZUL EPSON', 0),
('2018-08-02 19:28:34', 'GERENCIA', 'Void', '61c6b4b9-8986-4c45-862c-dee267867b89', 'TINTA AZUL EPSON', -1),
('2018-08-02 19:28:47', 'GERENCIA', 'Void', '61c6b4b9-8986-4c45-862c-dee267867b89', 'TINTA AZUL EPSON', -2),
('2018-08-02 19:28:54', 'GERENCIA', 'Void', '61c6b4b9-8986-4c45-862c-dee267867b89', 'TINTA AZUL EPSON', -2),
('2018-08-02 19:31:08', 'GERENCIA', 'Void', NULL, 'Ticket Deleted', 0),
('2018-08-02 19:31:39', 'GERENCIA', 'Void', '61c6b4b9-8986-4c45-862c-dee267867b89', 'TINTA AZUL EPSON', 1),
('2018-08-02 20:44:22', 'GERENCIA', 'Void', NULL, 'Ticket Deleted', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `locations`
--

CREATE TABLE `locations` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `locations`
--

INSERT INTO `locations` (`id`, `name`, `address`) VALUES
('0', 'PRINCIPAL', 'Local');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `log_usuarios`
--

CREATE TABLE `log_usuarios` (
  `id_log_usuario` int(11) NOT NULL,
  `fecha_log_usuario` datetime NOT NULL,
  `detalle_log_usuario` varchar(50) NOT NULL,
  `identificacion_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `log_usuarios`
--

INSERT INTO `log_usuarios` (`id_log_usuario`, `fecha_log_usuario`, `detalle_log_usuario`, `identificacion_usuario`) VALUES
(1, '0000-00-00 00:00:00', 'ha iniciado session en el sistema', 100000000),
(2, '2018-05-17 17:00:00', 'ha iniciado session en el sistema', 100000000),
(3, '2018-05-17 17:00:00', 'ha iniciado session en el sistema', 100000000),
(4, '2018-05-17 17:36:54', 'ha iniciado session en el sistema', 100000000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materiales`
--

CREATE TABLE `materiales` (
  `id_material` int(11) NOT NULL,
  `nombre_material` text NOT NULL,
  `tipo_material` text NOT NULL,
  `valor_material` double NOT NULL,
  `marca_material` varchar(20) NOT NULL,
  `cantidad_material` int(11) NOT NULL,
  `hora_registro` time NOT NULL,
  `fecha_registro` date NOT NULL,
  `identificacion_usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `moorers`
--

CREATE TABLE `moorers` (
  `vesselname` varchar(255) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `days` int(11) DEFAULT NULL,
  `power` bit(1) NOT NULL DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas`
--

CREATE TABLE `notas` (
  `id_nota` int(11) NOT NULL,
  `proveedor_nota` varchar(20) NOT NULL,
  `tipo_nota` text NOT NULL,
  `observacion_nota` varchar(50) NOT NULL,
  `fecha_nota` date NOT NULL,
  `categoia_iten_nota` varchar(30) NOT NULL,
  `identificacion_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `numeraciones`
--

CREATE TABLE `numeraciones` (
  `id_numeracion` int(11) NOT NULL,
  `nombre_numeracion` varchar(30) NOT NULL,
  `preferida` text NOT NULL,
  `estado` text NOT NULL,
  `resolucion` varchar(50) NOT NULL,
  `prefijo` text NOT NULL,
  `siguiente_numero` int(11) NOT NULL,
  `tipo` varchar(30) NOT NULL,
  `identificacion_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `numeraciones_generales`
--

CREATE TABLE `numeraciones_generales` (
  `id_numeracion_general` int(11) NOT NULL,
  `numeracion_resibo_caja` int(11) NOT NULL,
  `numeracion_comprobante_pago` int(11) NOT NULL,
  `numeracion_nota_credito` int(11) NOT NULL,
  `numeracion_remicion` int(11) NOT NULL,
  `numeracion_cotizacion` int(11) NOT NULL,
  `numeracion_orden_compra` int(11) NOT NULL,
  `estado_registro` text NOT NULL,
  `identificacion_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `numeraciones_generales`
--

INSERT INTO `numeraciones_generales` (`id_numeracion_general`, `numeracion_resibo_caja`, `numeracion_comprobante_pago`, `numeracion_nota_credito`, `numeracion_remicion`, `numeracion_cotizacion`, `numeracion_orden_compra`, `estado_registro`, `identificacion_usuario`) VALUES
(1, 12, 1, 1, 1, 1, 1, 'activo', 100000000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orders`
--

CREATE TABLE `orders` (
  `id` mediumint(9) NOT NULL,
  `orderid` varchar(50) DEFAULT NULL,
  `qty` int(11) DEFAULT '1',
  `details` varchar(255) DEFAULT NULL,
  `attributes` varchar(255) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `ticketid` varchar(50) DEFAULT NULL,
  `ordertime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `displayid` int(11) DEFAULT '1',
  `auxiliary` int(11) DEFAULT NULL,
  `completetime` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `id_pago` int(11) NOT NULL,
  `cliente_pago` text NOT NULL,
  `cuenta_pago` varchar(40) NOT NULL,
  `metodo_pago` varchar(40) NOT NULL,
  `fecha_pago` date NOT NULL,
  `observaciones_pago` varchar(40) NOT NULL,
  `notas_pago` varchar(40) NOT NULL,
  `identificacion_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payments`
--

CREATE TABLE `payments` (
  `id` varchar(255) NOT NULL,
  `receipt` varchar(255) NOT NULL,
  `payment` varchar(255) NOT NULL,
  `total` double NOT NULL DEFAULT '0',
  `tip` double DEFAULT '0',
  `transid` varchar(255) DEFAULT NULL,
  `isprocessed` bit(1) DEFAULT b'0',
  `returnmsg` mediumblob,
  `notes` varchar(255) DEFAULT NULL,
  `tendered` double DEFAULT NULL,
  `cardname` varchar(255) DEFAULT NULL,
  `voucher` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `payments`
--

INSERT INTO `payments` (`id`, `receipt`, `payment`, `total`, `tip`, `transid`, `isprocessed`, `returnmsg`, `notes`, `tendered`, `cardname`, `voucher`) VALUES
('00d3b7c3-1b1e-424c-997d-c494468273df', '6be45ed6-4fcf-45d2-ad34-a56c0aea18b6', 'debt', 420000, 0, NULL, b'1', 0x41636570746172, NULL, 0, NULL, '0'),
('03f55642-4cf4-4659-9aff-f64c8b420d9c', '594baa4a-d86c-4a00-9ea2-116f382d2dcb', 'cash', 10000, 0, 'no ID', b'1', 0x41636570746172, NULL, 10000, NULL, '0'),
('04821629-d454-44bc-9d0a-45b6c866e7dc', '182a889c-022f-4c55-a4da-1125450034d7', 'debt', 15000, 0, NULL, b'1', 0x41636570746172, NULL, 0, NULL, '0'),
('06605a3e-c25c-4905-bcfe-e8ddebd98b39', '1b566833-3e13-4492-88ab-8f98e6a117ca', 'cash', 0, 0, 'no ID', b'1', 0x41636570746172, NULL, 0, NULL, '0'),
('07794945-a8b1-41fa-ae6e-9d844a8284bd', '9a2498b5-0fbc-4083-90da-921c53792f1b', 'debt', 43000, 0, NULL, b'1', 0x41636570746172, NULL, 0, NULL, '0'),
('095afefe-3b83-4f32-87bd-e5f878ed5004', 'c49a0d12-06c9-4051-8f53-67b2feaf5452', 'debt', 10000, 0, NULL, b'1', 0x41636570746172, NULL, 0, NULL, '0'),
('0e19a2c6-cc00-40f6-9e09-57a67998a8c7', 'b4e2dfca-3622-48b2-a9ac-6987706a87b5', 'debtpaid', -296000, 0, NULL, b'1', 0x41636570746172, NULL, 0, NULL, '0'),
('12d8904b-d6b5-403a-81b8-ec239166725c', '436c4bcb-1b8c-434b-b6f1-ba1d67761601', 'debt', 145000, 0, NULL, b'1', 0x41636570746172, NULL, 0, NULL, '0'),
('144512be-81fa-4437-ab40-0997ae1fa857', 'abfce397-1e03-4a59-a4c7-8944ac8c0d86', 'debt', 40000, 0, NULL, b'1', 0x41636570746172, NULL, 0, NULL, '0'),
('17080552-2e26-4153-ab94-4870875b716b', '07e69745-c30c-40b6-affd-48846d714716', 'debt', 4000, 0, NULL, b'1', 0x41636570746172, NULL, 0, NULL, '0'),
('18c9d2c6-f4e2-4835-ac8b-31ef84d05641', '162d5d4b-9a43-449f-af69-8b46ec668437', 'debt', 80000, 0, NULL, b'1', 0x41636570746172, NULL, 0, NULL, '0'),
('1db84221-b94f-4b36-b9ed-91308a40874f', '6651d21e-f826-4f22-8cdc-1dbf06fc2b49', 'debt', 280000, 0, NULL, b'1', 0x41636570746172, NULL, 0, NULL, '0'),
('2030e5d5-e314-4a6b-b688-7ae2e05fb098', '0ee2803c-f5e1-41c7-b18d-7c0e5c14426f', 'cash', 300000, 0, NULL, b'1', 0x41636570746172, NULL, 300000, NULL, '0'),
('24cca05f-d004-4c86-8a7b-5028bd3f14bd', 'bef4d334-d56d-4455-ae27-78a85574f9df', 'cashrefund', -172000, 0, NULL, b'1', 0x41636570746172, NULL, 0, NULL, '0'),
('2524b671-3892-4c7e-a3a7-729803fa133f', '07a4e03a-65f9-4f45-be2f-4cae67b74c85', 'cash', 20000, 0, 'no ID', b'1', 0x41636570746172, NULL, 20000, NULL, '0'),
('259b5e27-f2dc-4b90-8874-e7d0b6b8b851', '0962e48a-0ed0-46e9-83c9-09b6a183613f', 'cashrefund', -1000, 0, NULL, b'1', 0x41636570746172, NULL, 0, NULL, '0'),
('2cdb6612-9002-4602-876b-c7fcaf14196b', '6787ae2f-ea3d-43cd-983e-ca09c3bc1f01', 'cash', 1000, 0, 'no ID', b'1', 0x41636570746172, NULL, 1000, NULL, '0'),
('2ed3cbe7-8a0f-4f23-9c76-4050053b8072', '07b84fac-3e16-4367-8dcf-21419b31e672', 'cash', 7000, 0, 'no ID', b'1', 0x41636570746172, NULL, 7000, NULL, '0'),
('3117e915-e7ee-4c83-80c1-c271e24c95ce', 'ec90122c-6bd9-445b-b9bf-de56a8fe49c1', 'cash', 70000, 0, NULL, b'1', 0x41636570746172, NULL, 70000, NULL, '0'),
('330b2b86-7054-4a4c-aa7a-c6c8acf9a26e', 'b140f772-8376-4f9b-84d5-efa0b7fd8322', 'debtpaid', -50000, 0, NULL, b'1', 0x41636570746172, NULL, 0, NULL, '0'),
('34ff1998-5e05-4a6b-8437-18d8d141960d', 'c7daa965-c7d2-4424-a989-3887a2d4be9d', 'debt', 38000, 0, NULL, b'1', 0x41636570746172, NULL, 0, NULL, '0'),
('35270390-f082-4731-b719-6ad811bbec28', 'b4e2dfca-3622-48b2-a9ac-6987706a87b5', 'cash', 296000, 0, NULL, b'1', 0x41636570746172, NULL, 296000, NULL, '0'),
('367d2f64-a9f9-4c44-a8a8-8ee0440c17cd', '48a5593e-b616-4b06-9df5-c25ad770ba9a', 'debt', 530000, 0, NULL, b'1', 0x41636570746172, NULL, 0, NULL, '0'),
('36e583f7-1fdc-42d1-a7e7-e7223e13109a', '0ee2803c-f5e1-41c7-b18d-7c0e5c14426f', 'debtpaid', -300000, 0, NULL, b'1', 0x41636570746172, NULL, 0, NULL, '0'),
('407a0454-bfcc-4015-9595-538540081430', '880455b6-da66-432a-bfe6-38a42945133d', 'debt', 38000, 0, NULL, b'1', 0x41636570746172, NULL, 0, NULL, '0'),
('49de47bf-d1e1-43b1-b943-27da8e29a364', '23040426-f1f6-406f-aea3-83208d6bc946', 'debt', 3000, 0, NULL, b'1', 0x41636570746172, NULL, 0, NULL, '0'),
('4b041b1e-8841-4571-927c-e4fad1916e1b', '609017ac-302b-425f-97e6-9c403e84d3bb', 'free', 25000, 0, 'no ID', b'1', 0x41636570746172, NULL, 0, NULL, '0'),
('4f6942d0-8c6b-4feb-9b2c-11d22c67f774', '09c26f75-84e3-4380-a891-954518d2875e', 'cash', 1484000, 0, NULL, b'1', 0x41636570746172, NULL, 1484000, NULL, '0'),
('4ffe6f5c-7404-404e-b89a-63c8e8d65fe9', 'a3581d8e-2a38-43c1-b3b2-16f0639d940d', 'debt', 8600, 0, NULL, b'1', 0x41636570746172, NULL, 0, NULL, '0'),
('58c66db0-c768-4023-ab7a-7e984f7a7631', '3e976685-0da2-4626-aa1d-1f6264ea013c', 'cash', 1362000, 0, NULL, b'1', 0x41636570746172, NULL, 1362000, NULL, '0'),
('59bcfb48-61a6-4b4d-9d81-3b07f3254d05', 'bb8afa89-26c6-44ef-b524-c491404ed05b', 'debt', 38000, 0, NULL, b'1', 0x41636570746172, NULL, 0, NULL, '0'),
('5a0e7316-5069-4cc7-996d-0ca91ffbd18c', '3aeeaad1-23e8-462a-94d5-614126056919', 'cash', 0, 0, 'no ID', b'1', 0x41636570746172, NULL, 0, NULL, '0'),
('5b41b70c-9a30-4d97-b2c9-51e4cb91942f', 'c57f9f1f-f742-4764-a1e0-2ec9bb7907c4', 'cashin', 30000, 0, NULL, b'1', NULL, '', NULL, NULL, NULL),
('5b833b12-6a58-4ac6-b3c5-80f9261a0242', '47d32ca3-3546-4355-8100-a2f95d79b483', 'cash', 90000, 0, 'no ID', b'1', 0x41636570746172, NULL, 90000, NULL, '0'),
('5c1c2773-9d0f-4e29-818d-3a41edfe999b', 'da2e2793-b4cd-48cf-80e1-d0faa7224814', 'cash', 30000, 0, 'no ID', b'1', 0x41636570746172, NULL, 30000, NULL, '0'),
('67427c3e-972f-4390-b237-840ed904985c', '09c26f75-84e3-4380-a891-954518d2875e', 'debtpaid', -1484000, 0, NULL, b'1', 0x41636570746172, NULL, 0, NULL, '0'),
('686ccfaf-fb74-4a67-947f-ec91dfdfcdf5', '8e2ae580-a5b2-4a8e-b291-c1c4cb2ac9d0', 'debt', 116000, 0, NULL, b'1', 0x41636570746172, NULL, 0, NULL, '0'),
('68ae1c09-7024-4fbc-8d9b-19c49b1dc8bc', '9a3d3b8d-449c-400c-b159-cc638482844e', 'debt', 15000, 0, NULL, b'1', 0x41636570746172, NULL, 0, NULL, '0'),
('70ffe44e-45e4-4dc7-aed0-62baf4f164b3', 'b0bdd32d-5b1a-49dc-908e-216ed2ee5786', 'debt', 50000, 0, NULL, b'1', 0x41636570746172, NULL, 0, NULL, '0'),
('7443a57f-fdcf-46f0-9801-258f9206da59', '05aff32a-c5ce-48c8-a2f2-03cda09e3585', 'debt', 250000, 0, NULL, b'1', 0x41636570746172, NULL, 0, NULL, '0'),
('74faadc8-58f2-4d45-a8d8-44b628cb4a40', '5ab62cd5-846f-4ff5-a714-0e6208c5ef0d', 'cash', 30000, 0, NULL, b'1', 0x41636570746172, NULL, 30000, NULL, '0'),
('75242577-31ad-4a39-8fe4-6d3ebe50c50f', '1629889c-0044-4c0f-b25d-a54a428628a5', 'debt', 990000, 0, NULL, b'1', 0x41636570746172, NULL, 0, NULL, '0'),
('752f19d8-3dc3-487a-af20-411f6fc17242', '7ff68bfd-10af-4cd8-9699-2aa32c253aa6', 'debt', 11000, 0, NULL, b'1', 0x41636570746172, NULL, 0, NULL, '0'),
('755bbaf4-bed1-440e-930e-b452f9f9d7a4', '6d914aa3-3d6c-4051-b550-c4fc1d47c917', 'debt', 210000, 0, NULL, b'1', 0x41636570746172, NULL, 0, NULL, '0'),
('75c01bce-b332-420b-956c-58174e01cdf7', '8d5644fa-2992-4337-a5ba-92b4575af56b', 'debt', 55000, 0, NULL, b'1', 0x41636570746172, NULL, 0, NULL, '0'),
('77299094-958d-4e52-8539-d23d6abbd469', '59ff4ab4-9ba2-45d2-b631-294ea788fd63', 'debt', 70000, 0, NULL, b'1', 0x41636570746172, NULL, 0, NULL, '0'),
('77c2b112-d816-4f57-8600-6db33a0c0c47', '100ee8d1-cdc5-431e-8588-b90993184edd', 'debt', 25000, 0, NULL, b'1', 0x41636570746172, NULL, 0, NULL, '0'),
('7da28dd3-fdf6-41df-87c7-dea2a743e8cc', '228d053a-303a-41d6-99d4-cae2338fab64', 'debt', 80000, 0, NULL, b'1', 0x41636570746172, NULL, 0, NULL, '0'),
('80310e18-f579-4b62-a03e-54c307de12b8', '3e976685-0da2-4626-aa1d-1f6264ea013c', 'debtpaid', -1362000, 0, NULL, b'1', 0x41636570746172, NULL, 0, NULL, '0'),
('82a80868-a918-4692-8f58-663b684921a7', '44b5f289-95c5-4938-8bb0-5f8601d0a8fd', 'cash', 160000, 0, 'no ID', b'1', 0x41636570746172, NULL, 160000, NULL, '0'),
('85030f09-fdbe-4e3b-8266-09a97370fdd0', 'b140f772-8376-4f9b-84d5-efa0b7fd8322', 'cash', 50000, 0, NULL, b'1', 0x41636570746172, NULL, 50000, NULL, '0'),
('8ca1711f-0238-4535-8257-095aa9c3cae1', '466e792b-2526-4795-8983-3b531c7bd519', 'cash', 4000, 0, 'no ID', b'1', 0x41636570746172, NULL, 5000, NULL, '0'),
('8cd69a16-8633-4bfc-ac40-eb9c8eaabc21', '2e4b3ab6-0ec8-475b-bc19-9fdc2d98b5ad', 'free', 60000, 0, 'no ID', b'1', 0x41636570746172, NULL, 0, NULL, '0'),
('8ef1bca3-6765-46bd-ad88-9d2646bee200', '03665f96-773d-4a9d-84db-72e043e7259e', 'debt', 10000, 0, NULL, b'1', 0x41636570746172, NULL, 0, NULL, '0'),
('8f6accaf-e7b0-4d67-83ac-c3f565986390', 'aea6c580-040d-491d-84a3-036747f288df', 'debt', 20000, 0, NULL, b'1', 0x41636570746172, NULL, 0, NULL, '0'),
('9193ea6c-bfc8-46ef-b75c-551a70d931c6', '35544bed-3d30-4dda-a99e-386714db79b6', 'debt', 85000, 0, NULL, b'1', 0x41636570746172, NULL, 0, NULL, '0'),
('936f4093-e248-46e8-9c79-28cb0bffca71', 'ba593fed-aa36-4e27-b244-0dbc34f07a09', 'free', 40000, 0, 'no ID', b'1', 0x41636570746172, NULL, 0, NULL, '0'),
('95435498-bca2-4d41-89a3-99b519c44582', '443c5679-19d9-4953-b2a3-9a556c697ac7', 'debt', 55000, 0, NULL, b'1', 0x41636570746172, NULL, 0, NULL, '0'),
('965901f7-4d0c-4fd5-884e-debc04419221', 'abdf7967-28a5-4012-83c5-77bf4df81a45', 'cash', 500000, 0, 'no ID', b'1', 0x41636570746172, NULL, 500000, NULL, '0'),
('9a07cba0-bbc3-42eb-b26e-07ce0eaffdfb', 'ab7617b0-ab0f-4c2e-a121-c16690a02984', 'cash', 55000, 0, NULL, b'1', 0x41636570746172, NULL, 55000, NULL, '0'),
('9c89baf1-0221-4dad-ace8-337fa8fa9b04', '74dce755-d188-4c5d-bcec-edef072a2efc', 'debt', 11000, 0, NULL, b'1', 0x41636570746172, NULL, 0, NULL, '0'),
('a202f438-f7e3-49fa-a4e6-3b2b04bf1d49', '9c52480f-8017-4b8d-a475-f25da3cff897', 'debt', 10000, 0, NULL, b'1', 0x41636570746172, NULL, 0, NULL, '0'),
('ab7c39b9-7233-4924-be1a-1684db1ba96b', '58875cb0-a728-41a3-a842-f6a38746fa7a', 'debt', 90000, 0, NULL, b'1', 0x41636570746172, NULL, 0, NULL, '0'),
('b0977fe4-5b32-421c-9898-9d6e654550bc', '09d23089-55ad-4c3d-8ec1-06a85dc85cad', 'debt', 850000, 0, NULL, b'1', 0x41636570746172, NULL, 0, NULL, '0'),
('b0b9c768-ad9e-483f-9b85-587ed4350ae9', '06fec5e0-fb6c-4c4b-a125-241c76d54390', 'debt', 11000, 0, NULL, b'1', 0x41636570746172, NULL, 0, NULL, '0'),
('b3290be9-9ea1-4639-99fb-1c835d4e63b7', 'a86a5893-d372-4a0c-abe5-2248f183f4f6', 'cashrefund', -116000, 0, NULL, b'1', 0x41636570746172, NULL, 0, NULL, '0'),
('bb2b492f-c692-4f74-bc6b-1ed50ec60c7e', 'b805329e-b01b-44b4-b9cf-6abd44019383', 'free', 7000, 0, 'no ID', b'1', 0x41636570746172, NULL, 0, NULL, '0'),
('bd31e91a-b437-4ab0-bf30-f2ff9c92df5f', '29d25aa2-0398-40fe-ae1e-a723ed7a85a5', 'debt', 190000, 0, NULL, b'1', 0x41636570746172, NULL, 0, NULL, '0'),
('bf3d92de-2b36-41ed-8861-0716e30a9651', 'f3931893-d27a-4712-abb6-2dd877761d86', 'debt', 50000, 0, NULL, b'1', 0x41636570746172, NULL, 0, NULL, '0'),
('c3c2b510-bf93-409b-a6e4-a57ab382960b', '9c66fc40-492f-44de-958d-dbf7f5a100c5', 'cash', 10000, 0, 'no ID', b'1', 0x41636570746172, NULL, 10000, NULL, '0'),
('c5a18c00-31af-48cb-94cc-38d1252a9df9', '7401a5e0-16c1-4a40-881d-eb9436615ec0', 'debt', 262100, 0, NULL, b'1', 0x41636570746172, NULL, 0, NULL, '0'),
('c84af3f5-0d66-4b73-8b43-4388beb1f3f8', 'ab7617b0-ab0f-4c2e-a121-c16690a02984', 'debtpaid', -55000, 0, NULL, b'1', 0x41636570746172, NULL, 0, NULL, '0'),
('c9ed1bbf-aa46-45d4-96ab-79b1d9f41d8a', '65495e91-fe6e-475b-96ec-c3d9b753d5e6', 'debt', 136000, 0, NULL, b'1', 0x41636570746172, NULL, 0, NULL, '0'),
('cc9f3e1f-e911-476c-bef6-024991a0d991', 'b008fe18-d5c1-4ac9-b761-1a6979c1264b', 'debt', 172000, 0, NULL, b'1', 0x41636570746172, NULL, 0, NULL, '0'),
('d1ff46f5-3a1e-4a3a-9594-d39109833eea', '4178d88b-59b3-4125-9140-c17558de4c9e', 'debt', 150000, 0, NULL, b'1', 0x41636570746172, NULL, 0, NULL, '0'),
('d6703620-3dff-4f7c-b80e-48c13172bbe4', 'a60f60da-591e-4f9d-bc6c-1f4440b5c429', 'cash', 50000, 0, 'no ID', b'1', 0x41636570746172, NULL, 50000, NULL, '0'),
('d8458bbc-a1a2-46f2-9c67-f7b8eb83d2d6', '2c8d1022-bc9b-4c86-ae90-eae340b754dd', 'cash', 50000, 0, 'no ID', b'1', 0x41636570746172, NULL, 50000, NULL, '0'),
('df431921-2554-44fc-a64e-dad71f5f6be7', '1075a9ee-9a2e-46a4-95b1-337ac7bebb46', 'debt', 395000, 0, NULL, b'1', 0x41636570746172, NULL, 0, NULL, '0'),
('e12bfc12-a78e-4ba1-94d8-b8ca6ad7c970', '1a348ddd-0199-4ff0-8f52-fd8aaea278ab', 'cash', 15000, 0, 'no ID', b'1', 0x41636570746172, NULL, 15000, NULL, '0'),
('e680d0dc-9a68-4120-b227-332c43118447', '98ea0468-8336-4503-801a-a0f72a0350cf', 'debt', 485000, 0, NULL, b'1', 0x41636570746172, NULL, 0, NULL, '0'),
('e76c0689-e918-4246-b274-ba2f3ea80496', '01fbe7b8-7afe-4e1d-b503-ae8c19496d85', 'cash', 5000, 0, 'no ID', b'1', 0x41636570746172, NULL, 5000, NULL, '0'),
('e859e094-231c-471c-8305-6e0017112edc', 'b3e3b918-9c4b-4e4b-858c-030c6a80c504', 'debt', 238000, 0, NULL, b'1', 0x41636570746172, NULL, 0, NULL, '0'),
('f0b70ab4-4eac-4748-b3cc-e4392f4bc3eb', '20992dd7-d5a9-4400-8844-9b03305f2745', 'debt', 3000, 0, NULL, b'1', 0x41636570746172, NULL, 0, NULL, '0'),
('f19c150e-4c33-4f4f-9fdb-6188e664d50f', '787effa3-ecc7-426a-ae68-4fbdfa45ffa7', 'cash', 30000, 0, 'no ID', b'1', 0x41636570746172, NULL, 30000, NULL, '0'),
('f5829368-36f0-45d6-85b5-58d28ec4708d', 'e6ead73a-ba84-44d1-b7d0-af9754aafd10', 'debt', 280000, 0, NULL, b'1', 0x41636570746172, NULL, 0, NULL, '0'),
('f8b0b747-0a09-4473-a468-956481c959da', 'ec90122c-6bd9-445b-b9bf-de56a8fe49c1', 'debtpaid', -70000, 0, NULL, b'1', 0x41636570746172, NULL, 0, NULL, '0'),
('f937ec19-52f2-4e12-a702-be2bb821bac0', '6ac66d4e-b115-49b7-ac71-4243234c052c', 'debt', 551000, 0, NULL, b'1', 0x41636570746172, NULL, 0, NULL, '0'),
('f963e4ea-fb25-4b55-a305-1eb73d58bdc5', '5ab62cd5-846f-4ff5-a714-0e6208c5ef0d', 'debtpaid', -30000, 0, NULL, b'1', 0x41636570746172, NULL, 0, NULL, '0'),
('f970d750-804d-468a-a742-15e764636a17', '89882b29-cac3-41cd-9a8e-3d9c6410a6f5', 'cashrefund', -10000, 0, NULL, b'1', 0x41636570746172, NULL, 0, NULL, '0'),
('f9a866ae-3694-479e-ab0d-9c41b398152c', '0318a889-3cf3-4f7b-974f-2b04c8de7ed4', 'debt', 80000, 0, NULL, b'1', 0x41636570746172, NULL, 0, NULL, '0'),
('fb3b7b80-c8e4-454a-b77f-0dbf1f735df6', '0d91839e-b0a4-44ff-a75c-2add133e2c73', 'debt', 450000, 0, NULL, b'1', 0x41636570746172, NULL, 0, NULL, '0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `people`
--

CREATE TABLE `people` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `apppassword` varchar(255) DEFAULT NULL,
  `card` varchar(255) DEFAULT NULL,
  `role` varchar(255) NOT NULL,
  `visible` bit(1) NOT NULL,
  `image` mediumblob
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `people`
--

INSERT INTO `people` (`id`, `name`, `apppassword`, `card`, `role`, `visible`, `image`) VALUES
('0', 'SIS POS COL', 'sha1:8A1154ED47BE12FAB1718A695D9F898BC0A57ABC', NULL, '0', b'1', 0x32),
('05ddd703-90ff-470f-b42c-17a5919630c2', 'CAJA ADMIN', NULL, NULL, '604550e9-cc17-4003-9c1c-d1705ef51fb8', b'1', NULL),
('1', 'GERENCIA', NULL, NULL, '1', b'1', NULL),
('2', 'CAJERO', NULL, NULL, '2', b'1', NULL),
('3', 'MINIMO/CONSULTAS', NULL, NULL, '3', b'1', NULL),
('fce1d8a7-35e3-4450-a3b6-e2527a217348', 'BODEGA', NULL, NULL, 'd73b9003-a441-43af-a41a-d407d5c0ea52', b'1', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pickup_number`
--

CREATE TABLE `pickup_number` (
  `id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `pickup_number`
--

INSERT INTO `pickup_number` (`id`) VALUES
(101);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `places`
--

CREATE TABLE `places` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `seats` varchar(6) NOT NULL DEFAULT '',
  `x` int(11) NOT NULL,
  `y` int(11) NOT NULL,
  `floor` varchar(255) NOT NULL,
  `customer` varchar(255) DEFAULT NULL,
  `waiter` varchar(255) DEFAULT NULL,
  `ticketid` varchar(255) DEFAULT NULL,
  `tablemoved` smallint(6) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `places`
--

INSERT INTO `places` (`id`, `name`, `seats`, `x`, `y`, `floor`, `customer`, `waiter`, `ticketid`, `tablemoved`) VALUES
('1', 'MESA 1', '', 100, 50, '0', NULL, NULL, NULL, 0),
('10', 'MESA 10', '', 550, 150, '0', NULL, NULL, NULL, 0),
('11', 'MESA 11', '', 700, 150, '0', NULL, NULL, NULL, 0),
('12', 'MESA 12', '', 850, 150, '0', NULL, NULL, NULL, 0),
('13', 'MESA 13', '', 100, 250, '0', NULL, NULL, NULL, 0),
('14', 'MESA 14', '', 250, 250, '0', NULL, NULL, NULL, 0),
('15', 'MESA 15', '', 400, 250, '0', NULL, NULL, NULL, 0),
('16', 'MESA 16', '', 550, 250, '0', NULL, NULL, NULL, 0),
('17', 'MESA 17', '', 700, 250, '0', NULL, NULL, NULL, 0),
('18', 'MESA 18', '', 850, 250, '0', NULL, NULL, NULL, 0),
('19', 'MESA 19', '', 100, 350, '0', NULL, NULL, NULL, 0),
('2', 'MESA 2', '', 250, 50, '0', NULL, NULL, NULL, 0),
('20', 'MESA 20', '', 250, 350, '0', NULL, NULL, NULL, 0),
('21', 'MESA 21', '', 400, 350, '0', NULL, NULL, NULL, 0),
('22', 'MESA 22', '', 550, 350, '0', NULL, NULL, NULL, 0),
('23', 'MESA 23', '', 700, 350, '0', NULL, NULL, NULL, 0),
('24', 'MESA 24', '', 850, 350, '0', NULL, NULL, NULL, 0),
('25', 'MESA 25', '', 100, 450, '0', NULL, NULL, NULL, 0),
('26', 'MESA 26', '', 250, 450, '0', NULL, NULL, NULL, 0),
('27', 'MESA 27', '', 400, 450, '0', NULL, NULL, NULL, 0),
('28', 'MESA 28', '', 550, 450, '0', NULL, NULL, NULL, 0),
('29', 'MESA 29', '', 700, 450, '0', NULL, NULL, NULL, 0),
('3', 'MESA 3', '', 400, 50, '0', NULL, NULL, NULL, 0),
('30', 'MESA 30', '', 850, 450, '0', NULL, NULL, NULL, 0),
('31', 'MESA 31', '', 100, 550, '0', NULL, NULL, NULL, 0),
('32', 'MESA 32', '', 250, 550, '0', NULL, NULL, NULL, 0),
('33', 'MESA 33', '', 400, 550, '0', NULL, NULL, NULL, 0),
('34', 'MESA 34', '', 550, 550, '0', NULL, NULL, NULL, 0),
('35', 'MESA 35', '', 700, 550, '0', NULL, NULL, NULL, 0),
('36', 'MESA 36', '', 850, 550, '0', NULL, NULL, NULL, 0),
('4', 'MESA 4', '', 550, 50, '0', NULL, NULL, NULL, 0),
('5', 'MESA 5', '', 700, 50, '0', NULL, NULL, NULL, 0),
('6', 'MESA 6', '', 850, 50, '0', NULL, NULL, NULL, 0),
('7', 'MESA 7', '', 100, 150, '0', NULL, NULL, NULL, 0),
('8', 'MESA 8', '', 250, 150, '0', NULL, NULL, NULL, 0),
('9', 'MESA 9', '', 400, 150, '0', NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plazos`
--

CREATE TABLE `plazos` (
  `id_plazo` int(11) NOT NULL,
  `nombre_plazo` varchar(20) NOT NULL,
  `dias_plazo` int(20) NOT NULL,
  `identificacion_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL,
  `cod_producto` varchar(20) NOT NULL,
  `nombre_producto` text NOT NULL,
  `descripcion_producto` varchar(200) NOT NULL,
  `precio_producto` double NOT NULL,
  `fecha_producto` date NOT NULL,
  `identificacion_usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` varchar(255) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `codetype` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `pricebuy` double NOT NULL DEFAULT '0',
  `pricesell` double NOT NULL DEFAULT '0',
  `category` varchar(255) NOT NULL,
  `taxcat` varchar(255) NOT NULL,
  `attributeset_id` varchar(255) DEFAULT NULL,
  `stockcost` double NOT NULL DEFAULT '0',
  `stockvolume` double NOT NULL DEFAULT '0',
  `image` mediumblob,
  `iscom` bit(1) NOT NULL DEFAULT b'0',
  `isscale` bit(1) NOT NULL DEFAULT b'0',
  `isconstant` bit(1) NOT NULL DEFAULT b'0',
  `printkb` bit(1) NOT NULL DEFAULT b'0',
  `sendstatus` bit(1) NOT NULL DEFAULT b'0',
  `isservice` bit(1) NOT NULL DEFAULT b'0',
  `attributes` mediumblob,
  `display` varchar(255) DEFAULT NULL,
  `isvprice` smallint(6) NOT NULL DEFAULT '0',
  `isverpatrib` smallint(6) NOT NULL DEFAULT '0',
  `texttip` varchar(255) DEFAULT NULL,
  `warranty` smallint(6) NOT NULL DEFAULT '0',
  `stockunits` double NOT NULL DEFAULT '0',
  `printto` varchar(255) DEFAULT '1',
  `supplier` varchar(255) DEFAULT NULL,
  `uom` varchar(255) DEFAULT '0',
  `memodate` datetime DEFAULT '1900-01-01 00:00:01'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `reference`, `code`, `codetype`, `name`, `pricebuy`, `pricesell`, `category`, `taxcat`, `attributeset_id`, `stockcost`, `stockvolume`, `image`, `iscom`, `isscale`, `isconstant`, `printkb`, `sendstatus`, `isservice`, `attributes`, `display`, `isvprice`, `isverpatrib`, `texttip`, `warranty`, `stockunits`, `printto`, `supplier`, `uom`, `memodate`) VALUES
('0060f534-964c-48d5-9ced-fb55eaf5569e', 'TEATRO EN CASA', 'TEATRO EN CASA', 'CODE128', 'TEATRO SW-5.1 1020', 120000, 170000, '20e46da3-5a9c-486d-a779-b75d0fd09025', '000', NULL, 0, 0, NULL, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', '28a90c40-987f-409d-92b5-7acb86ac4684', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('010cf75d-015c-4d4a-b6f3-844e0a59cd52', 'TODO EN 1', 'TODO EN 1', 'CODE128', 'CARGADOR TODO EN UNO HP', 0, 50000, 'c6b39e18-09b6-4ebb-8eb8-069e265341a4', '000', NULL, 0, 0, NULL, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', '4af9e015-65e6-4dec-81c7-4f31278f1b68', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('08e09e9d-42eb-4690-90de-d19b6b8a0052', 'DVI A VGA', 'DVI A VGA', 'CODE128', 'CONVERTIDOR DE DVI A VGA', 0, 10000, '000', '000', NULL, 0, 0, NULL, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', '4af9e015-65e6-4dec-81c7-4f31278f1b68', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('08e2052d-cbc8-48c7-9cec-d0c24d76a287', 'SWICH 5 PUERTOS', 'SWICH 5 PUERTOS', 'CODE128', 'SWICH 5 PORTS NETIS 10/100', 20000, 28000, '000', '000', NULL, 0, 0, 0x33, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', '28a90c40-987f-409d-92b5-7acb86ac4684', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('0cac3866-4100-48ac-a229-588d49808ec9', 'PACH PANEL 5E', 'PACH PANEL 5E', 'CODE128', 'PACH PANEL CATEGORIA 5', 130000, 130000, '000', '000', NULL, 0, 0, NULL, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', '4af9e015-65e6-4dec-81c7-4f31278f1b68', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('0f3f6dc5-b2a8-44c9-b8de-24bbdcc49d73', 'DOMO 1080P', 'DOMO 1080P', 'CODE128', 'CAMARA DOMO METALICO 1080P', 130000, 230000, 'b662ee65-92bc-4167-bcad-37f2ec749ba8', '000', NULL, 0, 0, 0x34, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', '28a90c40-987f-409d-92b5-7acb86ac4684', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('14497dc1-8d2e-4277-ade6-7eca54d87860', 'BALA PLASTICA HD1080 3.6MM', 'BALA PLASTICA HD1080 3.6MM', 'CODE128', 'BALA PLASTICA HD1080 3.6MM', 98000, 180000, 'b662ee65-92bc-4167-bcad-37f2ec749ba8', '000', NULL, 0, 0, 0x35, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', '28a90c40-987f-409d-92b5-7acb86ac4684', NULL, NULL),
('15bd0371-6990-43ea-832d-9e55eb3b7916', 'ROUTER TL-WR840N', 'ROUTER TL-WR840N', 'CODE128', 'ROUTER INALABRICO 2 ANTENAS', 50000, 80000, '000', '000', NULL, 0, 0, 0x36, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', '28a90c40-987f-409d-92b5-7acb86ac4684', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('16a10d31-af9a-410e-a72d-650bacc52a59', 'PROTECTOR TECLADO', 'PROTECTOR TECLADO', 'CODE128', 'PROTECTOR TECLADO 14\"/15.6\"', 2000, 5000, '20e46da3-5a9c-486d-a779-b75d0fd09025', '000', NULL, 0, 0, NULL, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', '28a90c40-987f-409d-92b5-7acb86ac4684', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('173c9da7-791e-410d-9e1f-8825a1e69e07', 'CABLE E6', 'CABLE E6', 'CODE128', 'CABLE CATEGORIA 6 EXTERIOR', 180000, 280000, '000', '000', NULL, 0, 0, NULL, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', '28a90c40-987f-409d-92b5-7acb86ac4684', 'aa9490d4-774f-4b59-b9f1-cb00b009c4d2', NULL),
('1dd66e05-660f-43b8-8c06-07b8767ea4dd', 'CARGADOR SONY', 'CARGADOR ', 'CODE128', 'CARGADOR SONY ', 0, 50000, 'c6b39e18-09b6-4ebb-8eb8-069e265341a4', '000', NULL, 0, 0, NULL, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', '4af9e015-65e6-4dec-81c7-4f31278f1b68', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('1fe7037a-89ac-45c6-9db1-c5882cc62228', 'PROTECTOR DE VOLTAJE', 'PROTECTOR DE VOLTAJE', 'CODE128', 'PROTECTOR DE VOLTAJE PARA INTERNET', 0, 35000, '000', '000', NULL, 0, 0, NULL, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', '4af9e015-65e6-4dec-81c7-4f31278f1b68', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('2031c239-3158-45e4-852d-cc1c14956b6a', 'REGULADOR 8 TOMAS', 'REGULADOR 8 TOMAS', 'CODE128', 'REGULADOR DE VOLTAJE 8 TOMAS', 27000, 38000, '20e46da3-5a9c-486d-a779-b75d0fd09025', '000', NULL, 0, 0, NULL, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', '28a90c40-987f-409d-92b5-7acb86ac4684', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('2210ff62-20d3-499b-ab64-1344d6b02da5', 'CANALETA 20*12', 'CANALETA 20*12', 'CODE128', 'CANALETA 20*12', 5000, 5000, 'b102dc65-46aa-44d9-b97b-57e08cf0aa20', '000', NULL, 0, 0, 0x37, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', '4af9e015-65e6-4dec-81c7-4f31278f1b68', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('23539908-f5de-4db6-a47d-824ade6b2663', 'CARGADOR DELL', 'CARGADOR DELL', 'CODE128', 'CARGADOR DELL HEXAGONAL', 0, 50000, 'c6b39e18-09b6-4ebb-8eb8-069e265341a4', '000', NULL, 0, 0, NULL, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', '4af9e015-65e6-4dec-81c7-4f31278f1b68', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('26629ed1-9d86-46bc-8c9a-8271847c1a78', 'SPLITER', 'SPLITER', 'CODE128', 'SPLITER', 0, 5000, '000', '000', NULL, 0, 0, NULL, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', '4af9e015-65e6-4dec-81c7-4f31278f1b68', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('26bcebd0-96bf-423d-b669-0c18cd912827', 'GAFAS REALIDAD VIRTUAL', 'GAFAS REALIDAD VIRTUAL', 'CODE128', 'GAFAS DE REALIDAD VIRTUAL', 50000, 50000, '20e46da3-5a9c-486d-a779-b75d0fd09025', '000', NULL, 0, 0, NULL, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', '28a90c40-987f-409d-92b5-7acb86ac4684', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('2bc44efd-bea7-4d31-ab55-f85215ed491d', 'GABINETE ', 'GABINETE ', 'CODE128', 'GABINETE 17A X 40F X 47 AN', 55000, 160000, 'b662ee65-92bc-4167-bcad-37f2ec749ba8', '000', NULL, 0, 0, NULL, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', 'd7155529-c498-41de-b4ae-3f7bbd63f8c2', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('326f0b79-457f-4125-8365-84874fb3c303', 'DISCO DURO ADATA EXT', 'DISCO DURO ADATA EXT', 'CODE128', 'DISCO DURO EXTERNO ADATA ANTIGOLPES 1TB', 205000, 230000, '20e46da3-5a9c-486d-a779-b75d0fd09025', '000', NULL, 0, 0, NULL, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', '28a90c40-987f-409d-92b5-7acb86ac4684', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('342fa52c-7c53-42a6-a2a6-63cfaac7671c', 'COMBO TECLADO MOUSE', 'COMBO TECLADO MOUSE', 'CODE128', 'COMBO DE TECLADO CON MOUSE INHALAMBRICO', 45000, 70000, '20e46da3-5a9c-486d-a779-b75d0fd09025', '000', NULL, 0, 0, NULL, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', '28a90c40-987f-409d-92b5-7acb86ac4684', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('36f602a7-9bf3-46ff-b186-164204d15105', 'CONVERTIDOR', 'CONVERTIDOR', 'CODE128', 'CONVERTIDOR', 0, 1000, '000', '000', NULL, 0, 0, NULL, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', '4af9e015-65e6-4dec-81c7-4f31278f1b68', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('3941df9e-4d01-4bce-81f8-12dea263db79', 'TINTA GENERICA L210 L375', 'TINTA GENERICA L210 L375', 'CODE128', 'TINTA GENERICA EPSON L210 L375', 4000, 10000, '20e46da3-5a9c-486d-a779-b75d0fd09025', '000', NULL, 0, 0, NULL, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', '28a90c40-987f-409d-92b5-7acb86ac4684', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('39949465-403b-455f-9077-c352fadbbfcd', 'TECLADO KB-225', 'TECLADO KB-225', 'CODE128', 'TECLADO GENIUS KB-225 MULTIMEDIA USB', 24000, 32000, '20e46da3-5a9c-486d-a779-b75d0fd09025', '000', NULL, 0, 0, 0x38, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', '28a90c40-987f-409d-92b5-7acb86ac4684', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('3b7394d3-05aa-4f4e-a115-4f8cb88884ac', 'DISCO DURO TOSHIBA EXT', 'DISCO DURO TOSHIBA EXT', 'CODE128', 'DISCO DURO EXTERNO TOSHIBA 1TB', 165000, 195000, '20e46da3-5a9c-486d-a779-b75d0fd09025', '000', NULL, 0, 0, 0x39, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', '28a90c40-987f-409d-92b5-7acb86ac4684', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('3ed8c73c-dd5e-4cfd-ac14-e0a7704fda2b', 'CARGADOR LENOVO MINI', 'CARGADOR LENOVO MINI', 'CODE128', 'CARGADOR MINI DE LENOVO', 0, 50000, 'c6b39e18-09b6-4ebb-8eb8-069e265341a4', '000', NULL, 0, 0, NULL, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', '4af9e015-65e6-4dec-81c7-4f31278f1b68', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('3f43d708-b1c2-48d6-9929-d25b0ee93152', 'CAJA DE PASO', 'CAJA DE PASO', 'CODE128', 'CAJA DE PASO 10X10', 1500, 5000, '000', '000', NULL, 0, 0, 0x3130, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', 'd7155529-c498-41de-b4ae-3f7bbd63f8c2', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('4152580f-d9b5-4a49-a8bf-ba10ff0c82da', 'BASE REFRIGERANTE', 'BASE REFRIGERANTE', 'CODE128', 'BASE REFRIGERANTE', 15000, 30000, '20e46da3-5a9c-486d-a779-b75d0fd09025', '000', NULL, 0, 0, 0x3131, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', '28a90c40-987f-409d-92b5-7acb86ac4684', NULL, NULL),
('4190711b-4381-4742-9730-489f4bd02e05', 'ADAPTADOR INHALAMBRICO', 'ADAPTADOR INHALAMBRICO', 'CODE128', 'ADAPTADOR INHALAMBRICO', 18000, 25000, '000', '000', NULL, 0, 0, 0x3132, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', '28a90c40-987f-409d-92b5-7acb86ac4684', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('4237eb40-bf15-411d-a7dc-bc089dc91d09', 'TACO DE 20 V', 'TACO DE 20 V', 'CODE128', 'TACO DE 20', 0, 12000, '000', '000', NULL, 0, 0, NULL, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', '4af9e015-65e6-4dec-81c7-4f31278f1b68', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('42e7efbb-59ac-461e-a101-b0744e79357d', 'DISCO DURO 2TB', 'DISCO DURO 2TB', 'CODE128', 'DISCO DURO TOHIBA 2TB', 200000, 200000, 'ca02c77a-0df1-44c9-bd95-227835719cfd', '000', NULL, 0, 0, NULL, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', '4af9e015-65e6-4dec-81c7-4f31278f1b68', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('477b129b-f25d-4fe3-b122-c9cb1a2bb005', 'FUENTE 5V', 'FUENTE 5V', 'CODE128', 'FUENTE DE PODER 5V ROUTER', 0, 10000, 'c6b39e18-09b6-4ebb-8eb8-069e265341a4', '000', NULL, 0, 0, NULL, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', '4af9e015-65e6-4dec-81c7-4f31278f1b68', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('4ebb1e34-6595-4961-acdb-82d679f6e46d', 'HP PUNTA AGUJA', 'HP PUNTA AGUJA', 'CODE128', 'CARGADOR HP DE AGUJA', 0, 50000, 'c6b39e18-09b6-4ebb-8eb8-069e265341a4', '000', NULL, 0, 0, NULL, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', '4af9e015-65e6-4dec-81c7-4f31278f1b68', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('52602630-bf45-4d1a-9829-e4e9955eb71b', 'CAJON MONEDERO', 'CAJON MONEDERO', 'CODE128', 'CAJON MONEDERO', 140000, 180000, 'b102dc65-46aa-44d9-b97b-57e08cf0aa20', '000', NULL, 0, 0, 0x3133, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', '28a90c40-987f-409d-92b5-7acb86ac4684', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('5fc18d75-75dd-4230-9e2f-c12127ad7ffc', 'RJ45 6E', 'RJ45 6E', 'CODE128', 'RJ45 CATEGORIA 6', 250, 500, '000', '000', NULL, 0, 0, NULL, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', 'd7155529-c498-41de-b4ae-3f7bbd63f8c2', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('5fe5ba81-aad3-4d67-9aba-8ca93bd629d5', 'RJ11', 'RJ11', 'CODE128', 'RJ11', 0, 300, '000', '000', NULL, 0, 0, NULL, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', '4af9e015-65e6-4dec-81c7-4f31278f1b68', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('61c6b4b9-8986-4c45-862c-dee267867b89', 'TINTA AZUL', 'TINTA AZUL', 'CODE128', 'TINTA AZUL EPSON', 4000, 15000, '20e46da3-5a9c-486d-a779-b75d0fd09025', '000', NULL, 0, 0, NULL, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', '28a90c40-987f-409d-92b5-7acb86ac4684', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('6b7efc03-a955-4269-9ca5-ca2bf04c3d48', 'CINTA NEGRA', 'CINTA NEGRA', 'CODE128', 'CINTA NEGRA', 3000, 3000, 'b102dc65-46aa-44d9-b97b-57e08cf0aa20', '000', NULL, 0, 0, 0x3135, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', '4af9e015-65e6-4dec-81c7-4f31278f1b68', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('6d75ad29-6f01-4aed-a5eb-4f9f5ef34de0', 'CLAVIJA', 'CLAVIJA', 'CODE128', 'CLAVIJA', 0, 100, '000', '000', NULL, 0, 0, NULL, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', '4af9e015-65e6-4dec-81c7-4f31278f1b68', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('76b24bf0-14a4-498a-a9d3-b9fe55991f4e', 'TECLADO KB-125', 'TECLADO KB-125', 'CODE128', 'TECLADO GENIUS KB-125 USB', 17500, 25000, '20e46da3-5a9c-486d-a779-b75d0fd09025', '000', NULL, 0, 0, 0x3136, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', '28a90c40-987f-409d-92b5-7acb86ac4684', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('7b237373-319b-4f0a-8fbd-efbaddc282ad', 'PACHCOT', 'PACHCOT', 'CODE128', 'PACH CORT CABLE DE RED', 0, 4000, '000', '000', NULL, 0, 0, NULL, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', '4af9e015-65e6-4dec-81c7-4f31278f1b68', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('7ea10e52-23cc-48d7-8273-dc405cc02a9f', 'RCA', 'RCA', 'CODE128', 'RCA', 250, 500, '000', '000', NULL, 0, 0, NULL, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', '4af9e015-65e6-4dec-81c7-4f31278f1b68', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('81109003-89b0-4da1-8ab2-d0f06ffa839a', 'APUNTADORES ', 'APUNTADORES ', 'CODE128', 'APUNTADORES', 50000, 50000, 'b662ee65-92bc-4167-bcad-37f2ec749ba8', '000', NULL, 0, 0, 0x3137, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', '28a90c40-987f-409d-92b5-7acb86ac4684', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('8574460b-daa1-4be7-b42f-86def1f7e5aa', 'CABLE E6 XMETERO', 'CABLE E6 XMETRO', 'CODE128', 'CABLE EXTERIOR XMETRO', 600, 1000, '000', '000', NULL, 0, 0, NULL, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', '28a90c40-987f-409d-92b5-7acb86ac4684', '09220980-bc0f-4409-9a96-586d2b8a1918', NULL),
('8615e923-0a25-4747-9d36-58e0d6c264b5', 'IMPRESORA TMT2011', 'IMPRESORA TMT2011', 'CODE128', 'IMPRESORA TERMICA EPSON', 515000, 640000, '20e46da3-5a9c-486d-a779-b75d0fd09025', '000', NULL, 0, 0, NULL, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', '28a90c40-987f-409d-92b5-7acb86ac4684', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('89cda22c-1255-4946-bd31-92e92ae3c298', 'CLOULE INTEL', 'CLOULE INTEL', 'CODE128', 'CLOULE INTEL', 35000, 30000, 'b102dc65-46aa-44d9-b97b-57e08cf0aa20', '000', NULL, 0, 0, NULL, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', '4af9e015-65e6-4dec-81c7-4f31278f1b68', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('8c50663a-cd2a-4eb1-8666-1cd784e9fb79', 'PLUS 12V', 'PLUS 12V', 'CODE128', 'PLUS DE 12 V', 0, 500, '000', '000', NULL, 0, 0, NULL, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', '4af9e015-65e6-4dec-81c7-4f31278f1b68', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('8e09f4ba-494a-4c9d-ac49-a22ebabca609', 'POWER OVER', 'POWER OVER', 'CODE128', 'POWER OVER', 23000, 30000, '000', '000', NULL, 0, 0, NULL, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', '4af9e015-65e6-4dec-81c7-4f31278f1b68', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('8e3f67a3-8341-499d-8082-b397ae0a9a7e', 'BALA METALICA 2.8-12MM', 'BALA METALICA 2.8-12MM', 'CODE128', 'BALA METALICA DE 2.8-12MM ', 110000, 210000, 'b662ee65-92bc-4167-bcad-37f2ec749ba8', '000', NULL, 0, 0, 0x3136, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', 'e7343158-b7d1-4e15-a3f9-928640e7ec83', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('8e98d6c6-631a-4a5c-9e22-3cf615373b49', 'QUEMADOR DVD LENOVO EXT', 'QUEMADOR DVD LENOVO EXT', 'CODE128', 'QUEMADOR DE DVD LENOVO EXTERNA', 55000, 70000, '20e46da3-5a9c-486d-a779-b75d0fd09025', '000', NULL, 0, 0, NULL, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', '28a90c40-987f-409d-92b5-7acb86ac4684', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('94d9fe4a-147b-443f-8cd6-151f034e9850', 'CAJA TX', 'CAJA TX', 'CODE128', 'CAJA TX', 60000, 80000, '000', '000', NULL, 0, 0, NULL, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', '28a90c40-987f-409d-92b5-7acb86ac4684', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('9621839b-65fb-49cd-96f3-9e1fa0c11449', 'TINTA AMARILLA', 'TINTA AMARILLA', 'CODE128', 'TINTA AMARILLA EPSON', 4000, 15000, '20e46da3-5a9c-486d-a779-b75d0fd09025', '000', NULL, 0, 0, NULL, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', '28a90c40-987f-409d-92b5-7acb86ac4684', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('9673907f-9439-4e58-a00b-cb867528b01d', 'T ELECTRICA', 'T ELECTRICA', 'CODE128', 'T ELECTRICA', 0, 1000, '000', '000', NULL, 0, 0, NULL, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', '4af9e015-65e6-4dec-81c7-4f31278f1b68', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('97ba6646-6dc8-4abf-9e7d-5bc84794bf20', 'IMPREDORA L380', 'IMPREDORA L380', 'CODE128', 'IMPRESORA EPSON L380', 380000, 530000, '20e46da3-5a9c-486d-a779-b75d0fd09025', '000', NULL, 0, 0, NULL, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', '28a90c40-987f-409d-92b5-7acb86ac4684', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('982f28a9-c8bb-47c1-8aa2-dba92db5f939', 'HP PUNTA AZUL', 'HP PUNTA AZUL', 'CODE128', 'CARGADOR DE HP PUNTA AZUL', 0, 50000, 'c6b39e18-09b6-4ebb-8eb8-069e265341a4', '000', NULL, 0, 0, NULL, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', '4af9e015-65e6-4dec-81c7-4f31278f1b68', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('9975dffd-a8e1-43df-9712-611140de31db', 'MOUSE GENIUS', 'MOUSE GENIUS', 'CODE128', 'MOUSE GENIUS USB', 12500, 18000, '20e46da3-5a9c-486d-a779-b75d0fd09025', '000', NULL, 0, 0, 0x3137, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', '28a90c40-987f-409d-92b5-7acb86ac4684', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('a5abe161-9651-4d2a-bb83-722c4fec5d58', 'ANTENA MIMI', 'ANTENA MIMI', 'CODE128', 'ANTENA INHALAMBRICA DIRECCIONAL MIMO D300 MBPS 2X2', 165000, 215000, '000', '000', NULL, 0, 0, 0x3138, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', NULL, NULL),
('a7b3e1d8-80dc-41ae-840c-7c7e351e50f3', 'TELEFONO', 'TELEFONO', 'CODE128', 'TELEFONO GRANDSTREAM', 210000, 210000, '000', '000', NULL, 0, 0, NULL, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', 'dce6204b-3dd1-4109-828f-b179520fed91', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('a8d0101c-5e74-43ab-9427-a45a60bda3bf', 'CARGADOR SAMSUNG', 'CARGADOR SAMSUNG', 'CODE128', 'CARGADOR DE MONITOR SAMSUNG', 0, 50000, 'c6b39e18-09b6-4ebb-8eb8-069e265341a4', '000', NULL, 0, 0, NULL, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', '4af9e015-65e6-4dec-81c7-4f31278f1b68', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('a8fce4e3-9f66-44bb-9925-709275fddb51', 'UNION RJ45', 'UNION RJ45', 'CODE128', 'UNION DE RJ45', 5000, 7000, '000', '000', NULL, 0, 0, NULL, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', '4af9e015-65e6-4dec-81c7-4f31278f1b68', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('aac4c6b0-f568-4374-afc3-d4fa1ea6c998', 'MOUSE', 'MOUSE', 'CODE128', 'MOUSE ECONOMICO', 7000, 7000, '20e46da3-5a9c-486d-a779-b75d0fd09025', '000', NULL, 0, 0, NULL, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', '4af9e015-65e6-4dec-81c7-4f31278f1b68', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('aae1a692-d6ed-44ea-8350-096a9f308e65', 'DVR 16CH', 'DVR 16CH', 'CODE128', 'DVR 16CH 2MP 1HDD 4CH AUDIO HDMI VGA', 280000, 480000, 'b662ee65-92bc-4167-bcad-37f2ec749ba8', '000', NULL, 0, 0, NULL, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', 'e7343158-b7d1-4e15-a3f9-928640e7ec83', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('abbc4560-5d38-4e05-a31e-ddb6bbe81c1b', 'CABLE DE PODER', 'CABLE DE PODER', 'CODE128', 'CABLE DE PODER', 0, 5000, '000', '000', NULL, 0, 0, NULL, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', '4af9e015-65e6-4dec-81c7-4f31278f1b68', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('abe789c1-189b-4bf9-af4e-85c591da2c50', 'FUENTE DE MONITOR', 'FUENTE DE MONITOR', 'CODE128', 'FUENTE LG DE CORRIENTE PARA MONITOR', 0, 70000, 'c6b39e18-09b6-4ebb-8eb8-069e265341a4', '000', NULL, 0, 0, NULL, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', '4af9e015-65e6-4dec-81c7-4f31278f1b68', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('abfac013-6f59-49a4-b1b8-233f3fb4971f', 'SERVICIO', 'SERVICIO', 'EAN-13', 'SERVICIOS TECNICOS OFICINA ', 0, 0, 'b102dc65-46aa-44d9-b97b-57e08cf0aa20', '000', NULL, 0, 0, NULL, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', '4af9e015-65e6-4dec-81c7-4f31278f1b68', NULL, NULL),
('b4d9023c-6a17-4f94-95af-fa5685cfdc58', 'BALA METALICA 3.6MM 720P', 'BALA METALICA 3.6MM 720P', 'CODE128', 'BALA METALICA 3.6MM 720P', 35000, 90000, 'b662ee65-92bc-4167-bcad-37f2ec749ba8', '000', NULL, 0, 0, 0x3139, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', '28a90c40-987f-409d-92b5-7acb86ac4684', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('b54a4b44-eb73-4d79-8fd0-30c8b87ec4ef', 'RJ45 5E', 'RJ45 5E', 'CODE128', 'RJ45 CATEGORIA 5', 150, 400, '000', '000', NULL, 0, 0, NULL, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', 'd7155529-c498-41de-b4ae-3f7bbd63f8c2', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('b7ca7357-fb1a-4bbf-b250-47443c34a90b', 'DVR 4CH', 'DVR 4CH', 'CODE128', 'DVR 4CH 2MP 1HDD ACH AUDIO HSMI VGA', 128000, 250000, 'b662ee65-92bc-4167-bcad-37f2ec749ba8', '000', NULL, 0, 0, NULL, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', 'e7343158-b7d1-4e15-a3f9-928640e7ec83', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('b8926e57-09b2-48b9-806a-56990b92a218', 'PLUS 2.5', 'PLUS 2.5', 'CODE128', 'PLUS 2.5 A RCA HEMBRA', 0, 3000, '000', '000', NULL, 0, 0, NULL, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', '4af9e015-65e6-4dec-81c7-4f31278f1b68', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('b93a886a-d95e-48af-a3dc-7aa051ef3a19', 'INTERRUPTOR', 'INTERRUPTOR', 'CODE128', 'INTERRUPTOR', 0, 700, '000', '000', NULL, 0, 0, NULL, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', '4af9e015-65e6-4dec-81c7-4f31278f1b68', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('bc76f6ec-4be4-4249-a3dc-b517880c8647', 'ALTAVOCES Z506', 'ALTAVOCES Z506', 'EAN-13', 'ALTAVOCES COMPACTOS LOGITECH 5.1 Z506', 200000, 280000, '20e46da3-5a9c-486d-a779-b75d0fd09025', '000', NULL, 0, 0, NULL, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', '28a90c40-987f-409d-92b5-7acb86ac4684', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('c0e46984-db68-4a88-aebf-f3680facd694', 'CABLE UTP 5E', 'CABLE UTP 5E', 'CODE128', 'CABLE UTP 5E INTERIOR X305MT', 68000, 140000, '000', '000', NULL, 0, 0, NULL, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', 'd7155529-c498-41de-b4ae-3f7bbd63f8c2', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('c3934860-bef3-4b73-adcd-2efdf629def1', 'DIADEMA A-80', 'DIADEMA A-80', 'CODE128', 'DIADEMA A-80 CON MICRO', 15000, 20500, '20e46da3-5a9c-486d-a779-b75d0fd09025', '000', NULL, 0, 0, 0x3230, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', '28a90c40-987f-409d-92b5-7acb86ac4684', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('c5bf9e40-6ebc-4c08-bac0-6ae769bd5abc', 'PLUS 2.5 HEMBRA', 'PLUS 2.5 HEMBRA', 'CODE128', 'PLUS 2.5 HEMBRA', 0, 500, '000', '000', NULL, 0, 0, NULL, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', '4af9e015-65e6-4dec-81c7-4f31278f1b68', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('c7b19666-822f-400a-842f-60bfca4d8980', 'DVR 8CH', 'DVR 8CH', 'CODE128', 'DVR 8CH 2MP 1HDD 4CH AUDIO HDMI VGA', 156000, 280000, 'b662ee65-92bc-4167-bcad-37f2ec749ba8', '000', NULL, 0, 0, NULL, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', 'e7343158-b7d1-4e15-a3f9-928640e7ec83', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('c7c5a4de-6cb1-4f31-b4b6-5af7eb529cc4', 'PARLANTES G-SYSTEM', 'PARLANTES G-SYSTEM', 'CODE128', 'PARLANTES MODELO G-012', 20000, 20000, '20e46da3-5a9c-486d-a779-b75d0fd09025', '000', NULL, 0, 0, NULL, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', '4af9e015-65e6-4dec-81c7-4f31278f1b68', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('c8c70dd3-7a47-44db-934d-8ee11819dc17', 'FUENTE DE PODER', 'FUENTE DE PODER', 'CODE128', 'FUENTE DE PODER', 25000, 35000, 'ca02c77a-0df1-44c9-bd95-227835719cfd', '000', NULL, 0, 0, NULL, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', '28a90c40-987f-409d-92b5-7acb86ac4684', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('cbb780ca-12df-4b19-ab88-50dd81e8de0c', 'CANALETA 10*10', 'CANALETA 10*10', 'CODE128', 'CANALETA 10*10', 3500, 3500, 'b102dc65-46aa-44d9-b97b-57e08cf0aa20', '000', NULL, 0, 0, 0x3231, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', '4af9e015-65e6-4dec-81c7-4f31278f1b68', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('cdbe7ac3-455f-41ca-8bf8-163ea104914a', 'BATERIA DE HP', 'BATERIA DE HP', 'CODE128', 'BATERIA DE HP DELGADA', 0, 80000, 'c6b39e18-09b6-4ebb-8eb8-069e265341a4', '000', NULL, 0, 0, NULL, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', '4af9e015-65e6-4dec-81c7-4f31278f1b68', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('ce638b72-3d7f-4558-9f7a-3d9a3f7e2cec', 'DOMO 2.8MM', 'DOMO 2.8MM', 'CODE128', 'DOMO 2.8MM 24LED 1MP 720P', 28000, 65000, 'b662ee65-92bc-4167-bcad-37f2ec749ba8', '000', NULL, 0, 0, 0x3232, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', 'e7343158-b7d1-4e15-a3f9-928640e7ec83', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('d80aef84-aec7-4965-9541-efffa57db37f', 'TINTA ROSADA', 'TINTA ROSADA', 'CODE128', 'TINTA ROSADA EPSON', 4000, 15000, '20e46da3-5a9c-486d-a779-b75d0fd09025', '000', NULL, 0, 0, NULL, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', '28a90c40-987f-409d-92b5-7acb86ac4684', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('d8dce3ae-39d4-4580-a347-1a002ba65d7f', 'FUENTE 12V', 'FUENTE 12V', 'CODE128', 'FUENTE CORRIENTE 12V 1000MA', 6000, 11000, 'b662ee65-92bc-4167-bcad-37f2ec749ba8', '000', NULL, 0, 0, NULL, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', 'e7343158-b7d1-4e15-a3f9-928640e7ec83', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('d8fbd110-16d9-4fd1-b73a-7bbdd8617c79', 'DISCO DURO TOSHIBA INT 2TB', 'DISCO DURO TOSHIBA INT 2TB', 'CODE128', 'DISCO DURO INTERNO TOSHIBA 2TB FOR DESKTOP', 178000, 240000, 'e64bd4c0-3a51-44d4-a528-9bfdeab40c8a', '000', NULL, 0, 0, 0x3233, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', '28a90c40-987f-409d-92b5-7acb86ac4684', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('d9ba7d33-0a13-4c1a-80bf-064da39c8187', 'CABLE VGA', 'CABLE VGA', 'CODE128', 'CABLE VGA', 0, 10000, 'c6b39e18-09b6-4ebb-8eb8-069e265341a4', '000', NULL, 0, 0, NULL, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', '4af9e015-65e6-4dec-81c7-4f31278f1b68', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('dd07a061-237e-4322-a01f-ae6356b538a9', 'GPS', 'GPS', 'CODE128', 'GPS', 350000, 350000, 'b662ee65-92bc-4167-bcad-37f2ec749ba8', '000', NULL, 0, 0, NULL, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', '4af9e015-65e6-4dec-81c7-4f31278f1b68', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('dda3b042-f1ec-4cf2-8b38-244a9c32f289', 'VIDEO BALUM', 'VIDEO BALUM', 'CODE128', 'VIDEO BALUM PASIVO (PAR) 400MT', 6000, 10000, 'b662ee65-92bc-4167-bcad-37f2ec749ba8', '000', NULL, 0, 0, 0x3234, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', 'e7343158-b7d1-4e15-a3f9-928640e7ec83', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('e08eb3e8-39fb-4d6e-b0a5-861e51b31141', 'MEMORIA DDR II 2GB', 'MEMORIA DDR II 2GB', 'CODE128', 'MEMORIA DDR II DE 2GB', 50000, 70000, 'e64bd4c0-3a51-44d4-a528-9bfdeab40c8a', '000', NULL, 0, 0, NULL, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', '28a90c40-987f-409d-92b5-7acb86ac4684', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('e53a3977-d9f0-40f6-b6df-fcdfd3259b1d', 'UPS', 'UPS', 'CODE128', 'UPS', 150000, 210000, 'b662ee65-92bc-4167-bcad-37f2ec749ba8', '000', NULL, 0, 0, 0x3235, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', '28a90c40-987f-409d-92b5-7acb86ac4684', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('e5478b71-9b0e-43a7-998f-4435e10a294c', 'GABINETE PEQUEÑO', 'GABINETE PEQUEÑO', 'CODE128', 'GABINETE PEQUEÑO', 45000, 90000, '000', '000', NULL, 0, 0, NULL, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', '28a90c40-987f-409d-92b5-7acb86ac4684', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('e8bcfdd1-0818-48c6-b609-3f6344d3d0cb', 'SWICH 8 PUERTOS', 'SWICH 8 PUERTOS', 'CODE128', 'SWICH 8 PORT NETIS 10/100', 23000, 40000, '000', '000', NULL, 0, 0, NULL, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', '28a90c40-987f-409d-92b5-7acb86ac4684', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('e8da77c6-432c-47bd-aad3-919cd4ff6ab9', 'CLAVIJA HEMBRA', 'CLAVIJA HEMBRA', 'CODE128', 'CLAVIJA HEMBRA', 0, 1000, '000', '000', NULL, 0, 0, NULL, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', '4af9e015-65e6-4dec-81c7-4f31278f1b68', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('ebaa8478-68fd-4ad7-86fd-798696189d49', 'MEMORIA DDR III 4GB', 'MEMORIA DDR III 4GB', 'CODE128', 'MEMORIA DDR III DE PORTATIL 4GB', 75000, 90000, 'e64bd4c0-3a51-44d4-a528-9bfdeab40c8a', '000', NULL, 0, 0, NULL, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', '28a90c40-987f-409d-92b5-7acb86ac4684', NULL, NULL),
('ee1ef151-1f9b-48a1-96cc-3de25fbb481e', 'DISCO DURO TOSHIBA INT', 'DISCO DURO TOSHIBA INT', 'CODE128', 'DISCO DURO INTERNO TOSHIBA 1TB', 130000, 180000, 'e64bd4c0-3a51-44d4-a528-9bfdeab40c8a', '000', NULL, 0, 0, NULL, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', '28a90c40-987f-409d-92b5-7acb86ac4684', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('ee621994-b1f1-491f-bc8d-105821436a9a', 'BOLSO HP', 'BOLSO HP', 'CODE128', 'BOLSO HP', 32000, 40000, 'b102dc65-46aa-44d9-b97b-57e08cf0aa20', '000', NULL, 0, 0, 0x3232, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', '28a90c40-987f-409d-92b5-7acb86ac4684', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('ef2d0ded-7b0f-49e2-9c26-b6f2582757c9', 'ALTAVOCES Z213', 'ALTAVOCES Z213', 'CODE128', 'ALTAVOCES COMPACTO LOGITECH 2.1 Z213', 65000, 91000, '20e46da3-5a9c-486d-a779-b75d0fd09025', '000', NULL, 0, 0, NULL, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', '28a90c40-987f-409d-92b5-7acb86ac4684', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('f23c026f-4975-4bdd-91e9-fe2ff31cfd23', 'CABLE PAR TRENZADO', 'CABLE PAR TRENZADO', 'CODE128', 'CABLE PAR TRENZADO X200MTRS', 50000, 80000, '000', '000', NULL, 0, 0, NULL, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', '28a90c40-987f-409d-92b5-7acb86ac4684', 'aa9490d4-774f-4b59-b9f1-cb00b009c4d2', NULL),
('f4eb5041-8f60-4d9b-8ed1-848d5771174c', 'PAD MOUSE', 'PAD MOUSE', 'CODE128', 'PAD MOUSE GENERICO', 1800, 4000, '20e46da3-5a9c-486d-a779-b75d0fd09025', '000', NULL, 0, 0, NULL, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', '28a90c40-987f-409d-92b5-7acb86ac4684', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('f65236e2-5a72-405a-8ca8-9a1ae71a0888', 'IMPRESORA L575', 'IMPRESORA L575', 'CODE128', 'IMPRESORA EPSON L575', 790000, 1100000, '20e46da3-5a9c-486d-a779-b75d0fd09025', '000', NULL, 0, 0, NULL, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', '28a90c40-987f-409d-92b5-7acb86ac4684', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('f6a5e356-723b-4f6e-8ae9-556953e0d6f4', 'VNC', 'VNC', 'CODE128', 'VNC', 0, 1000, '000', '000', NULL, 0, 0, NULL, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', '4af9e015-65e6-4dec-81c7-4f31278f1b68', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('f8e1ee31-0109-4db6-a563-aaad7341ff53', 'HP PUNTA AMARILLA', 'HP PUNTA AMARILLA', 'CODE128', 'CARGADOR HP PUNTA AMARILLA', 0, 50000, 'c6b39e18-09b6-4ebb-8eb8-069e265341a4', '000', NULL, 0, 0, NULL, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', '4af9e015-65e6-4dec-81c7-4f31278f1b68', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('fab8075c-0632-4158-8fc8-bd715bbadc3f', 'DISCO DURO INT PORTATIL', 'DISCO DURO INT PORTATIL', 'CODE128', 'DISCO DURO INTERNO DE PORTATIL 1TB', 145000, 190000, 'e64bd4c0-3a51-44d4-a528-9bfdeab40c8a', '000', NULL, 0, 0, NULL, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', '28a90c40-987f-409d-92b5-7acb86ac4684', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('fe9f7587-7bc7-4d81-91b1-cae543cc647e', 'CARGADOR COMPUMAX', 'CARGADOR COMPUMAX', 'CODE128', 'CARGADOR COMPUMAX', 0, 50000, 'c6b39e18-09b6-4ebb-8eb8-069e265341a4', '000', NULL, 0, 0, NULL, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '', 0, 0, '', 0, 0, '1', '4af9e015-65e6-4dec-81c7-4f31278f1b68', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', NULL),
('xxx999_999xxx_x9x9x9', 'MINI MOUSE', 'MINI MOUSE', 'CODE128', 'MINI MOUSE 3BUMEN RETRACTIL', 10000, 14000, '20e46da3-5a9c-486d-a779-b75d0fd09025', '000', NULL, 0, 0, 0x3233, b'1', b'1', b'1', b'1', b'1', b'1', NULL, '<html><center>MINI MOUSE', 0, 0, 'USAR PARA ITEMS SIN GRABAR NO BORRAR', 0, 0, '0', '28a90c40-987f-409d-92b5-7acb86ac4684', '935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', '1900-01-01 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products_bundle`
--

CREATE TABLE `products_bundle` (
  `id` varchar(255) NOT NULL,
  `product` varchar(255) NOT NULL,
  `product_bundle` varchar(255) NOT NULL,
  `quantity` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products_cat`
--

CREATE TABLE `products_cat` (
  `product` varchar(255) NOT NULL,
  `catorder` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `products_cat`
--

INSERT INTO `products_cat` (`product`, `catorder`) VALUES
('0060f534-964c-48d5-9ced-fb55eaf5569e', NULL),
('010cf75d-015c-4d4a-b6f3-844e0a59cd52', NULL),
('08e09e9d-42eb-4690-90de-d19b6b8a0052', NULL),
('08e2052d-cbc8-48c7-9cec-d0c24d76a287', NULL),
('0cac3866-4100-48ac-a229-588d49808ec9', NULL),
('0f3f6dc5-b2a8-44c9-b8de-24bbdcc49d73', NULL),
('14497dc1-8d2e-4277-ade6-7eca54d87860', NULL),
('15bd0371-6990-43ea-832d-9e55eb3b7916', NULL),
('16a10d31-af9a-410e-a72d-650bacc52a59', NULL),
('173c9da7-791e-410d-9e1f-8825a1e69e07', NULL),
('1dd66e05-660f-43b8-8c06-07b8767ea4dd', NULL),
('1fe7037a-89ac-45c6-9db1-c5882cc62228', NULL),
('2031c239-3158-45e4-852d-cc1c14956b6a', NULL),
('2210ff62-20d3-499b-ab64-1344d6b02da5', NULL),
('23539908-f5de-4db6-a47d-824ade6b2663', NULL),
('26629ed1-9d86-46bc-8c9a-8271847c1a78', NULL),
('26bcebd0-96bf-423d-b669-0c18cd912827', NULL),
('2bc44efd-bea7-4d31-ab55-f85215ed491d', NULL),
('326f0b79-457f-4125-8365-84874fb3c303', NULL),
('342fa52c-7c53-42a6-a2a6-63cfaac7671c', NULL),
('36f602a7-9bf3-46ff-b186-164204d15105', NULL),
('3941df9e-4d01-4bce-81f8-12dea263db79', NULL),
('39949465-403b-455f-9077-c352fadbbfcd', NULL),
('3b7394d3-05aa-4f4e-a115-4f8cb88884ac', NULL),
('3ed8c73c-dd5e-4cfd-ac14-e0a7704fda2b', NULL),
('3f43d708-b1c2-48d6-9929-d25b0ee93152', NULL),
('4152580f-d9b5-4a49-a8bf-ba10ff0c82da', NULL),
('4190711b-4381-4742-9730-489f4bd02e05', NULL),
('4237eb40-bf15-411d-a7dc-bc089dc91d09', NULL),
('42e7efbb-59ac-461e-a101-b0744e79357d', NULL),
('477b129b-f25d-4fe3-b122-c9cb1a2bb005', NULL),
('4ebb1e34-6595-4961-acdb-82d679f6e46d', NULL),
('52602630-bf45-4d1a-9829-e4e9955eb71b', NULL),
('5fc18d75-75dd-4230-9e2f-c12127ad7ffc', NULL),
('5fe5ba81-aad3-4d67-9aba-8ca93bd629d5', NULL),
('61c6b4b9-8986-4c45-862c-dee267867b89', NULL),
('6b7efc03-a955-4269-9ca5-ca2bf04c3d48', NULL),
('6d75ad29-6f01-4aed-a5eb-4f9f5ef34de0', NULL),
('76b24bf0-14a4-498a-a9d3-b9fe55991f4e', NULL),
('7b237373-319b-4f0a-8fbd-efbaddc282ad', NULL),
('7ea10e52-23cc-48d7-8273-dc405cc02a9f', NULL),
('81109003-89b0-4da1-8ab2-d0f06ffa839a', NULL),
('8574460b-daa1-4be7-b42f-86def1f7e5aa', NULL),
('8615e923-0a25-4747-9d36-58e0d6c264b5', NULL),
('89cda22c-1255-4946-bd31-92e92ae3c298', NULL),
('8c50663a-cd2a-4eb1-8666-1cd784e9fb79', NULL),
('8e09f4ba-494a-4c9d-ac49-a22ebabca609', NULL),
('8e3f67a3-8341-499d-8082-b397ae0a9a7e', NULL),
('8e98d6c6-631a-4a5c-9e22-3cf615373b49', NULL),
('94d9fe4a-147b-443f-8cd6-151f034e9850', NULL),
('9621839b-65fb-49cd-96f3-9e1fa0c11449', NULL),
('9673907f-9439-4e58-a00b-cb867528b01d', NULL),
('97ba6646-6dc8-4abf-9e7d-5bc84794bf20', NULL),
('982f28a9-c8bb-47c1-8aa2-dba92db5f939', NULL),
('9975dffd-a8e1-43df-9712-611140de31db', NULL),
('a5abe161-9651-4d2a-bb83-722c4fec5d58', NULL),
('a7b3e1d8-80dc-41ae-840c-7c7e351e50f3', NULL),
('a8d0101c-5e74-43ab-9427-a45a60bda3bf', NULL),
('a8fce4e3-9f66-44bb-9925-709275fddb51', NULL),
('aac4c6b0-f568-4374-afc3-d4fa1ea6c998', NULL),
('aae1a692-d6ed-44ea-8350-096a9f308e65', NULL),
('abbc4560-5d38-4e05-a31e-ddb6bbe81c1b', NULL),
('abe789c1-189b-4bf9-af4e-85c591da2c50', NULL),
('abfac013-6f59-49a4-b1b8-233f3fb4971f', NULL),
('b4d9023c-6a17-4f94-95af-fa5685cfdc58', NULL),
('b54a4b44-eb73-4d79-8fd0-30c8b87ec4ef', NULL),
('b7ca7357-fb1a-4bbf-b250-47443c34a90b', NULL),
('b8926e57-09b2-48b9-806a-56990b92a218', NULL),
('b93a886a-d95e-48af-a3dc-7aa051ef3a19', NULL),
('bc76f6ec-4be4-4249-a3dc-b517880c8647', NULL),
('c0e46984-db68-4a88-aebf-f3680facd694', NULL),
('c3934860-bef3-4b73-adcd-2efdf629def1', NULL),
('c5bf9e40-6ebc-4c08-bac0-6ae769bd5abc', NULL),
('c7b19666-822f-400a-842f-60bfca4d8980', NULL),
('c7c5a4de-6cb1-4f31-b4b6-5af7eb529cc4', NULL),
('c8c70dd3-7a47-44db-934d-8ee11819dc17', NULL),
('cbb780ca-12df-4b19-ab88-50dd81e8de0c', NULL),
('cdbe7ac3-455f-41ca-8bf8-163ea104914a', NULL),
('ce638b72-3d7f-4558-9f7a-3d9a3f7e2cec', NULL),
('d80aef84-aec7-4965-9541-efffa57db37f', NULL),
('d8dce3ae-39d4-4580-a347-1a002ba65d7f', NULL),
('d8fbd110-16d9-4fd1-b73a-7bbdd8617c79', NULL),
('d9ba7d33-0a13-4c1a-80bf-064da39c8187', NULL),
('dd07a061-237e-4322-a01f-ae6356b538a9', NULL),
('dda3b042-f1ec-4cf2-8b38-244a9c32f289', NULL),
('e08eb3e8-39fb-4d6e-b0a5-861e51b31141', NULL),
('e53a3977-d9f0-40f6-b6df-fcdfd3259b1d', NULL),
('e5478b71-9b0e-43a7-998f-4435e10a294c', NULL),
('e8bcfdd1-0818-48c6-b609-3f6344d3d0cb', NULL),
('e8da77c6-432c-47bd-aad3-919cd4ff6ab9', NULL),
('ebaa8478-68fd-4ad7-86fd-798696189d49', NULL),
('ee1ef151-1f9b-48a1-96cc-3de25fbb481e', NULL),
('ee621994-b1f1-491f-bc8d-105821436a9a', NULL),
('ef2d0ded-7b0f-49e2-9c26-b6f2582757c9', NULL),
('f23c026f-4975-4bdd-91e9-fe2ff31cfd23', NULL),
('f4eb5041-8f60-4d9b-8ed1-848d5771174c', NULL),
('f65236e2-5a72-405a-8ca8-9a1ae71a0888', NULL),
('f6a5e356-723b-4f6e-8ae9-556953e0d6f4', NULL),
('f8e1ee31-0109-4db6-a563-aaad7341ff53', NULL),
('fab8075c-0632-4158-8fc8-bd715bbadc3f', NULL),
('fe9f7587-7bc7-4d81-91b1-cae543cc647e', NULL),
('xxx999_999xxx_x9x9x9', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products_com`
--

CREATE TABLE `products_com` (
  `id` varchar(255) NOT NULL,
  `product` varchar(255) NOT NULL,
  `product2` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id_proveedor` int(11) NOT NULL,
  `identificacion_proveedor` int(11) NOT NULL,
  `nombre_proveedor` varchar(40) NOT NULL,
  `tipo_proveedor` text NOT NULL,
  `producto_provee` varchar(30) NOT NULL,
  `direccion` varchar(60) NOT NULL,
  `telefono` int(11) NOT NULL,
  `valor_producto` double NOT NULL,
  `identificacion_usuario` int(11) DEFAULT NULL,
  `hora_registro` time NOT NULL,
  `fecha_registro` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `receipts`
--

CREATE TABLE `receipts` (
  `id` varchar(255) NOT NULL,
  `money` varchar(255) NOT NULL,
  `datenew` datetime NOT NULL,
  `attributes` mediumblob,
  `person` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `receipts`
--

INSERT INTO `receipts` (`id`, `money`, `datenew`, `attributes`, `person`) VALUES
('01fbe7b8-7afe-4e1d-b503-ae8c19496d85', 'e146aba7-157a-4f0d-8aeb-915d42b2b440', '2018-07-19 08:23:54', 0x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0d0a3c21444f43545950452070726f706572746965732053595354454d2022687474703a2f2f6a6176612e73756e2e636f6d2f6474642f70726f706572746965732e647464223e0d0a3c70726f706572746965733e0d0a3c636f6d6d656e743e756e6943656e7461206f504f533c2f636f6d6d656e743e0d0a3c2f70726f706572746965733e0d0a, NULL),
('0318a889-3cf3-4f7b-974f-2b04c8de7ed4', 'e146aba7-157a-4f0d-8aeb-915d42b2b440', '2018-06-05 14:08:47', 0x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0d0a3c21444f43545950452070726f706572746965732053595354454d2022687474703a2f2f6a6176612e73756e2e636f6d2f6474642f70726f706572746965732e647464223e0d0a3c70726f706572746965733e0d0a3c636f6d6d656e743e756e6943656e7461206f504f533c2f636f6d6d656e743e0d0a3c2f70726f706572746965733e0d0a, NULL),
('03665f96-773d-4a9d-84db-72e043e7259e', 'e146aba7-157a-4f0d-8aeb-915d42b2b440', '2018-06-13 11:48:54', 0x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0d0a3c21444f43545950452070726f706572746965732053595354454d2022687474703a2f2f6a6176612e73756e2e636f6d2f6474642f70726f706572746965732e647464223e0d0a3c70726f706572746965733e0d0a3c636f6d6d656e743e756e6943656e7461206f504f533c2f636f6d6d656e743e0d0a3c2f70726f706572746965733e0d0a, NULL),
('05aff32a-c5ce-48c8-a2f2-03cda09e3585', 'eb2d066c-436c-4109-af6f-04d095f53619', '2018-04-28 11:17:33', 0x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0d0a3c21444f43545950452070726f706572746965732053595354454d2022687474703a2f2f6a6176612e73756e2e636f6d2f6474642f70726f706572746965732e647464223e0d0a3c70726f706572746965733e0d0a3c636f6d6d656e743e756e6943656e7461206f504f533c2f636f6d6d656e743e0d0a3c2f70726f706572746965733e0d0a, NULL),
('06fec5e0-fb6c-4c4b-a125-241c76d54390', 'e146aba7-157a-4f0d-8aeb-915d42b2b440', '2018-06-09 15:43:04', 0x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0d0a3c21444f43545950452070726f706572746965732053595354454d2022687474703a2f2f6a6176612e73756e2e636f6d2f6474642f70726f706572746965732e647464223e0d0a3c70726f706572746965733e0d0a3c636f6d6d656e743e756e6943656e7461206f504f533c2f636f6d6d656e743e0d0a3c2f70726f706572746965733e0d0a, NULL),
('07a4e03a-65f9-4f45-be2f-4cae67b74c85', 'e146aba7-157a-4f0d-8aeb-915d42b2b440', '2018-08-02 14:31:07', 0x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0d0a3c21444f43545950452070726f706572746965732053595354454d2022687474703a2f2f6a6176612e73756e2e636f6d2f6474642f70726f706572746965732e647464223e0d0a3c70726f706572746965733e0d0a3c636f6d6d656e743e756e6943656e7461206f504f533c2f636f6d6d656e743e0d0a3c2f70726f706572746965733e0d0a, NULL),
('07b84fac-3e16-4367-8dcf-21419b31e672', 'e146aba7-157a-4f0d-8aeb-915d42b2b440', '2018-06-07 17:27:26', 0x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0d0a3c21444f43545950452070726f706572746965732053595354454d2022687474703a2f2f6a6176612e73756e2e636f6d2f6474642f70726f706572746965732e647464223e0d0a3c70726f706572746965733e0d0a3c636f6d6d656e743e756e6943656e7461206f504f533c2f636f6d6d656e743e0d0a3c2f70726f706572746965733e0d0a, NULL),
('07e69745-c30c-40b6-affd-48846d714716', 'e146aba7-157a-4f0d-8aeb-915d42b2b440', '2018-06-09 15:26:05', 0x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0d0a3c21444f43545950452070726f706572746965732053595354454d2022687474703a2f2f6a6176612e73756e2e636f6d2f6474642f70726f706572746965732e647464223e0d0a3c70726f706572746965733e0d0a3c636f6d6d656e743e756e6943656e7461206f504f533c2f636f6d6d656e743e0d0a3c2f70726f706572746965733e0d0a, NULL),
('0962e48a-0ed0-46e9-83c9-09b6a183613f', '050bd17a-2152-40df-bf6c-cbd0bce32cd5', '2018-05-08 18:11:25', 0x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0d0a3c21444f43545950452070726f706572746965732053595354454d2022687474703a2f2f6a6176612e73756e2e636f6d2f6474642f70726f706572746965732e647464223e0d0a3c70726f706572746965733e0d0a3c636f6d6d656e743e756e6943656e7461206f504f533c2f636f6d6d656e743e0d0a3c2f70726f706572746965733e0d0a, NULL),
('09c26f75-84e3-4380-a891-954518d2875e', 'e146aba7-157a-4f0d-8aeb-915d42b2b440', '2018-08-03 15:04:19', 0x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0d0a3c21444f43545950452070726f706572746965732053595354454d2022687474703a2f2f6a6176612e73756e2e636f6d2f6474642f70726f706572746965732e647464223e0d0a3c70726f706572746965733e0d0a3c636f6d6d656e743e756e6943656e7461206f504f533c2f636f6d6d656e743e0d0a3c2f70726f706572746965733e0d0a, NULL),
('09d23089-55ad-4c3d-8ec1-06a85dc85cad', 'e146aba7-157a-4f0d-8aeb-915d42b2b440', '2018-05-21 10:10:17', 0x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0d0a3c21444f43545950452070726f706572746965732053595354454d2022687474703a2f2f6a6176612e73756e2e636f6d2f6474642f70726f706572746965732e647464223e0d0a3c70726f706572746965733e0d0a3c636f6d6d656e743e756e6943656e7461206f504f533c2f636f6d6d656e743e0d0a3c2f70726f706572746965733e0d0a, NULL),
('0d91839e-b0a4-44ff-a75c-2add133e2c73', 'eb2d066c-436c-4109-af6f-04d095f53619', '2018-05-05 13:43:04', 0x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0d0a3c21444f43545950452070726f706572746965732053595354454d2022687474703a2f2f6a6176612e73756e2e636f6d2f6474642f70726f706572746965732e647464223e0d0a3c70726f706572746965733e0d0a3c636f6d6d656e743e756e6943656e7461206f504f533c2f636f6d6d656e743e0d0a3c2f70726f706572746965733e0d0a, NULL),
('0ee2803c-f5e1-41c7-b18d-7c0e5c14426f', 'e146aba7-157a-4f0d-8aeb-915d42b2b440', '2018-05-19 12:00:52', 0x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0d0a3c21444f43545950452070726f706572746965732053595354454d2022687474703a2f2f6a6176612e73756e2e636f6d2f6474642f70726f706572746965732e647464223e0d0a3c70726f706572746965733e0d0a3c636f6d6d656e743e756e6943656e7461206f504f533c2f636f6d6d656e743e0d0a3c2f70726f706572746965733e0d0a, NULL),
('100ee8d1-cdc5-431e-8588-b90993184edd', 'e146aba7-157a-4f0d-8aeb-915d42b2b440', '2018-06-12 09:37:22', 0x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0d0a3c21444f43545950452070726f706572746965732053595354454d2022687474703a2f2f6a6176612e73756e2e636f6d2f6474642f70726f706572746965732e647464223e0d0a3c70726f706572746965733e0d0a3c636f6d6d656e743e756e6943656e7461206f504f533c2f636f6d6d656e743e0d0a3c2f70726f706572746965733e0d0a, NULL),
('1075a9ee-9a2e-46a4-95b1-337ac7bebb46', 'e146aba7-157a-4f0d-8aeb-915d42b2b440', '2018-05-29 16:46:57', 0x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0d0a3c21444f43545950452070726f706572746965732053595354454d2022687474703a2f2f6a6176612e73756e2e636f6d2f6474642f70726f706572746965732e647464223e0d0a3c70726f706572746965733e0d0a3c636f6d6d656e743e756e6943656e7461206f504f533c2f636f6d6d656e743e0d0a3c2f70726f706572746965733e0d0a, NULL),
('1629889c-0044-4c0f-b25d-a54a428628a5', 'e146aba7-157a-4f0d-8aeb-915d42b2b440', '2018-06-19 14:18:27', 0x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0d0a3c21444f43545950452070726f706572746965732053595354454d2022687474703a2f2f6a6176612e73756e2e636f6d2f6474642f70726f706572746965732e647464223e0d0a3c70726f706572746965733e0d0a3c636f6d6d656e743e756e6943656e7461206f504f533c2f636f6d6d656e743e0d0a3c2f70726f706572746965733e0d0a, NULL),
('162d5d4b-9a43-449f-af69-8b46ec668437', 'e146aba7-157a-4f0d-8aeb-915d42b2b440', '2018-05-19 14:28:52', 0x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0d0a3c21444f43545950452070726f706572746965732053595354454d2022687474703a2f2f6a6176612e73756e2e636f6d2f6474642f70726f706572746965732e647464223e0d0a3c70726f706572746965733e0d0a3c636f6d6d656e743e756e6943656e7461206f504f533c2f636f6d6d656e743e0d0a3c2f70726f706572746965733e0d0a, NULL),
('182a889c-022f-4c55-a4da-1125450034d7', 'e146aba7-157a-4f0d-8aeb-915d42b2b440', '2018-05-30 15:59:07', 0x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0d0a3c21444f43545950452070726f706572746965732053595354454d2022687474703a2f2f6a6176612e73756e2e636f6d2f6474642f70726f706572746965732e647464223e0d0a3c70726f706572746965733e0d0a3c636f6d6d656e743e756e6943656e7461206f504f533c2f636f6d6d656e743e0d0a3c2f70726f706572746965733e0d0a, NULL),
('1a348ddd-0199-4ff0-8f52-fd8aaea278ab', 'e146aba7-157a-4f0d-8aeb-915d42b2b440', '2018-07-16 15:48:39', 0x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0d0a3c21444f43545950452070726f706572746965732053595354454d2022687474703a2f2f6a6176612e73756e2e636f6d2f6474642f70726f706572746965732e647464223e0d0a3c70726f706572746965733e0d0a3c636f6d6d656e743e756e6943656e7461206f504f533c2f636f6d6d656e743e0d0a3c2f70726f706572746965733e0d0a, NULL),
('1b566833-3e13-4492-88ab-8f98e6a117ca', '050bd17a-2152-40df-bf6c-cbd0bce32cd5', '2018-05-08 18:09:08', 0x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0d0a3c21444f43545950452070726f706572746965732053595354454d2022687474703a2f2f6a6176612e73756e2e636f6d2f6474642f70726f706572746965732e647464223e0d0a3c70726f706572746965733e0d0a3c636f6d6d656e743e756e6943656e7461206f504f533c2f636f6d6d656e743e0d0a3c2f70726f706572746965733e0d0a, NULL),
('20992dd7-d5a9-4400-8844-9b03305f2745', 'e146aba7-157a-4f0d-8aeb-915d42b2b440', '2018-07-09 09:34:19', 0x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0d0a3c21444f43545950452070726f706572746965732053595354454d2022687474703a2f2f6a6176612e73756e2e636f6d2f6474642f70726f706572746965732e647464223e0d0a3c70726f706572746965733e0d0a3c636f6d6d656e743e756e6943656e7461206f504f533c2f636f6d6d656e743e0d0a3c2f70726f706572746965733e0d0a, NULL),
('228d053a-303a-41d6-99d4-cae2338fab64', 'eb2d066c-436c-4109-af6f-04d095f53619', '2018-05-07 15:03:38', 0x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0d0a3c21444f43545950452070726f706572746965732053595354454d2022687474703a2f2f6a6176612e73756e2e636f6d2f6474642f70726f706572746965732e647464223e0d0a3c70726f706572746965733e0d0a3c636f6d6d656e743e756e6943656e7461206f504f533c2f636f6d6d656e743e0d0a3c2f70726f706572746965733e0d0a, NULL),
('23040426-f1f6-406f-aea3-83208d6bc946', 'e146aba7-157a-4f0d-8aeb-915d42b2b440', '2018-05-31 08:54:56', 0x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0d0a3c21444f43545950452070726f706572746965732053595354454d2022687474703a2f2f6a6176612e73756e2e636f6d2f6474642f70726f706572746965732e647464223e0d0a3c70726f706572746965733e0d0a3c636f6d6d656e743e756e6943656e7461206f504f533c2f636f6d6d656e743e0d0a3c2f70726f706572746965733e0d0a, NULL),
('29d25aa2-0398-40fe-ae1e-a723ed7a85a5', 'e146aba7-157a-4f0d-8aeb-915d42b2b440', '2018-05-19 11:13:01', 0x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0d0a3c21444f43545950452070726f706572746965732053595354454d2022687474703a2f2f6a6176612e73756e2e636f6d2f6474642f70726f706572746965732e647464223e0d0a3c70726f706572746965733e0d0a3c636f6d6d656e743e756e6943656e7461206f504f533c2f636f6d6d656e743e0d0a3c2f70726f706572746965733e0d0a, NULL),
('2c8d1022-bc9b-4c86-ae90-eae340b754dd', '5943f404-c4f8-418c-98c5-fb0329e68c70', '2018-05-18 08:46:31', 0x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0d0a3c21444f43545950452070726f706572746965732053595354454d2022687474703a2f2f6a6176612e73756e2e636f6d2f6474642f70726f706572746965732e647464223e0d0a3c70726f706572746965733e0d0a3c636f6d6d656e743e756e6943656e7461206f504f533c2f636f6d6d656e743e0d0a3c2f70726f706572746965733e0d0a, NULL),
('2e4b3ab6-0ec8-475b-bc19-9fdc2d98b5ad', 'e146aba7-157a-4f0d-8aeb-915d42b2b440', '2018-07-27 10:46:16', 0x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0d0a3c21444f43545950452070726f706572746965732053595354454d2022687474703a2f2f6a6176612e73756e2e636f6d2f6474642f70726f706572746965732e647464223e0d0a3c70726f706572746965733e0d0a3c636f6d6d656e743e756e6943656e7461206f504f533c2f636f6d6d656e743e0d0a3c2f70726f706572746965733e0d0a, NULL),
('35544bed-3d30-4dda-a99e-386714db79b6', 'e146aba7-157a-4f0d-8aeb-915d42b2b440', '2018-05-22 11:16:44', 0x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0d0a3c21444f43545950452070726f706572746965732053595354454d2022687474703a2f2f6a6176612e73756e2e636f6d2f6474642f70726f706572746965732e647464223e0d0a3c70726f706572746965733e0d0a3c636f6d6d656e743e756e6943656e7461206f504f533c2f636f6d6d656e743e0d0a3c2f70726f706572746965733e0d0a, NULL),
('3aeeaad1-23e8-462a-94d5-614126056919', '050bd17a-2152-40df-bf6c-cbd0bce32cd5', '2018-05-08 17:36:02', 0x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0d0a3c21444f43545950452070726f706572746965732053595354454d2022687474703a2f2f6a6176612e73756e2e636f6d2f6474642f70726f706572746965732e647464223e0d0a3c70726f706572746965733e0d0a3c636f6d6d656e743e756e6943656e7461206f504f533c2f636f6d6d656e743e0d0a3c2f70726f706572746965733e0d0a, NULL),
('3e976685-0da2-4626-aa1d-1f6264ea013c', 'e146aba7-157a-4f0d-8aeb-915d42b2b440', '2018-08-03 15:03:08', 0x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0d0a3c21444f43545950452070726f706572746965732053595354454d2022687474703a2f2f6a6176612e73756e2e636f6d2f6474642f70726f706572746965732e647464223e0d0a3c70726f706572746965733e0d0a3c636f6d6d656e743e756e6943656e7461206f504f533c2f636f6d6d656e743e0d0a3c2f70726f706572746965733e0d0a, NULL),
('4178d88b-59b3-4125-9140-c17558de4c9e', 'eb2d066c-436c-4109-af6f-04d095f53619', '2018-05-05 14:14:29', 0x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0d0a3c21444f43545950452070726f706572746965732053595354454d2022687474703a2f2f6a6176612e73756e2e636f6d2f6474642f70726f706572746965732e647464223e0d0a3c70726f706572746965733e0d0a3c636f6d6d656e743e756e6943656e7461206f504f533c2f636f6d6d656e743e0d0a3c2f70726f706572746965733e0d0a, NULL),
('436c4bcb-1b8c-434b-b6f1-ba1d67761601', 'e146aba7-157a-4f0d-8aeb-915d42b2b440', '2018-06-11 09:52:07', 0x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0d0a3c21444f43545950452070726f706572746965732053595354454d2022687474703a2f2f6a6176612e73756e2e636f6d2f6474642f70726f706572746965732e647464223e0d0a3c70726f706572746965733e0d0a3c636f6d6d656e743e756e6943656e7461206f504f533c2f636f6d6d656e743e0d0a3c2f70726f706572746965733e0d0a, NULL),
('443c5679-19d9-4953-b2a3-9a556c697ac7', 'e146aba7-157a-4f0d-8aeb-915d42b2b440', '2018-08-02 15:44:21', 0x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0d0a3c21444f43545950452070726f706572746965732053595354454d2022687474703a2f2f6a6176612e73756e2e636f6d2f6474642f70726f706572746965732e647464223e0d0a3c70726f706572746965733e0d0a3c636f6d6d656e743e756e6943656e7461206f504f533c2f636f6d6d656e743e0d0a3c2f70726f706572746965733e0d0a, NULL),
('44b5f289-95c5-4938-8bb0-5f8601d0a8fd', 'e146aba7-157a-4f0d-8aeb-915d42b2b440', '2018-06-23 16:06:13', 0x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0d0a3c21444f43545950452070726f706572746965732053595354454d2022687474703a2f2f6a6176612e73756e2e636f6d2f6474642f70726f706572746965732e647464223e0d0a3c70726f706572746965733e0d0a3c636f6d6d656e743e756e6943656e7461206f504f533c2f636f6d6d656e743e0d0a3c2f70726f706572746965733e0d0a, NULL),
('466e792b-2526-4795-8983-3b531c7bd519', 'e146aba7-157a-4f0d-8aeb-915d42b2b440', '2018-06-08 09:21:59', 0x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0d0a3c21444f43545950452070726f706572746965732053595354454d2022687474703a2f2f6a6176612e73756e2e636f6d2f6474642f70726f706572746965732e647464223e0d0a3c70726f706572746965733e0d0a3c636f6d6d656e743e756e6943656e7461206f504f533c2f636f6d6d656e743e0d0a3c2f70726f706572746965733e0d0a, NULL),
('47d32ca3-3546-4355-8100-a2f95d79b483', 'adf115c3-884b-4d52-9b0d-bec4eb826ca7', '2018-05-11 11:42:18', 0x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0d0a3c21444f43545950452070726f706572746965732053595354454d2022687474703a2f2f6a6176612e73756e2e636f6d2f6474642f70726f706572746965732e647464223e0d0a3c70726f706572746965733e0d0a3c636f6d6d656e743e756e6943656e7461206f504f533c2f636f6d6d656e743e0d0a3c2f70726f706572746965733e0d0a, NULL),
('48a5593e-b616-4b06-9df5-c25ad770ba9a', 'adf115c3-884b-4d52-9b0d-bec4eb826ca7', '2018-05-12 09:46:00', 0x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0d0a3c21444f43545950452070726f706572746965732053595354454d2022687474703a2f2f6a6176612e73756e2e636f6d2f6474642f70726f706572746965732e647464223e0d0a3c70726f706572746965733e0d0a3c636f6d6d656e743e756e6943656e7461206f504f533c2f636f6d6d656e743e0d0a3c2f70726f706572746965733e0d0a, NULL),
('58875cb0-a728-41a3-a842-f6a38746fa7a', 'eb2d066c-436c-4109-af6f-04d095f53619', '2018-04-26 14:18:27', 0x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0d0a3c21444f43545950452070726f706572746965732053595354454d2022687474703a2f2f6a6176612e73756e2e636f6d2f6474642f70726f706572746965732e647464223e0d0a3c70726f706572746965733e0d0a3c636f6d6d656e743e756e6943656e7461206f504f533c2f636f6d6d656e743e0d0a3c2f70726f706572746965733e0d0a, NULL),
('594baa4a-d86c-4a00-9ea2-116f382d2dcb', 'eb2d066c-436c-4109-af6f-04d095f53619', '2018-05-02 17:20:32', 0x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0d0a3c21444f43545950452070726f706572746965732053595354454d2022687474703a2f2f6a6176612e73756e2e636f6d2f6474642f70726f706572746965732e647464223e0d0a3c70726f706572746965733e0d0a3c636f6d6d656e743e756e6943656e7461206f504f533c2f636f6d6d656e743e0d0a3c2f70726f706572746965733e0d0a, NULL),
('59ff4ab4-9ba2-45d2-b631-294ea788fd63', 'eb2d066c-436c-4109-af6f-04d095f53619', '2018-04-26 17:57:45', 0x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0d0a3c21444f43545950452070726f706572746965732053595354454d2022687474703a2f2f6a6176612e73756e2e636f6d2f6474642f70726f706572746965732e647464223e0d0a3c70726f706572746965733e0d0a3c636f6d6d656e743e756e6943656e7461206f504f533c2f636f6d6d656e743e0d0a3c2f70726f706572746965733e0d0a, NULL),
('5ab62cd5-846f-4ff5-a714-0e6208c5ef0d', '5943f404-c4f8-418c-98c5-fb0329e68c70', '2018-05-18 11:31:05', 0x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0d0a3c21444f43545950452070726f706572746965732053595354454d2022687474703a2f2f6a6176612e73756e2e636f6d2f6474642f70726f706572746965732e647464223e0d0a3c70726f706572746965733e0d0a3c636f6d6d656e743e756e6943656e7461206f504f533c2f636f6d6d656e743e0d0a3c2f70726f706572746965733e0d0a, NULL),
('609017ac-302b-425f-97e6-9c403e84d3bb', 'e146aba7-157a-4f0d-8aeb-915d42b2b440', '2018-07-26 08:44:45', 0x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0d0a3c21444f43545950452070726f706572746965732053595354454d2022687474703a2f2f6a6176612e73756e2e636f6d2f6474642f70726f706572746965732e647464223e0d0a3c70726f706572746965733e0d0a3c636f6d6d656e743e756e6943656e7461206f504f533c2f636f6d6d656e743e0d0a3c2f70726f706572746965733e0d0a, NULL),
('65495e91-fe6e-475b-96ec-c3d9b753d5e6', 'e146aba7-157a-4f0d-8aeb-915d42b2b440', '2018-05-28 11:27:04', 0x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0d0a3c21444f43545950452070726f706572746965732053595354454d2022687474703a2f2f6a6176612e73756e2e636f6d2f6474642f70726f706572746965732e647464223e0d0a3c70726f706572746965733e0d0a3c636f6d6d656e743e756e6943656e7461206f504f533c2f636f6d6d656e743e0d0a3c2f70726f706572746965733e0d0a, NULL),
('6651d21e-f826-4f22-8cdc-1dbf06fc2b49', 'eb2d066c-436c-4109-af6f-04d095f53619', '2018-05-07 09:28:53', 0x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0d0a3c21444f43545950452070726f706572746965732053595354454d2022687474703a2f2f6a6176612e73756e2e636f6d2f6474642f70726f706572746965732e647464223e0d0a3c70726f706572746965733e0d0a3c636f6d6d656e743e756e6943656e7461206f504f533c2f636f6d6d656e743e0d0a3c2f70726f706572746965733e0d0a, NULL),
('6787ae2f-ea3d-43cd-983e-ca09c3bc1f01', '050bd17a-2152-40df-bf6c-cbd0bce32cd5', '2018-05-08 18:06:08', 0x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0d0a3c21444f43545950452070726f706572746965732053595354454d2022687474703a2f2f6a6176612e73756e2e636f6d2f6474642f70726f706572746965732e647464223e0d0a3c70726f706572746965733e0d0a3c636f6d6d656e743e756e6943656e7461206f504f533c2f636f6d6d656e743e0d0a3c2f70726f706572746965733e0d0a, NULL),
('6ac66d4e-b115-49b7-ac71-4243234c052c', 'e146aba7-157a-4f0d-8aeb-915d42b2b440', '2018-08-01 10:28:32', 0x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0d0a3c21444f43545950452070726f706572746965732053595354454d2022687474703a2f2f6a6176612e73756e2e636f6d2f6474642f70726f706572746965732e647464223e0d0a3c70726f706572746965733e0d0a3c636f6d6d656e743e756e6943656e7461206f504f533c2f636f6d6d656e743e0d0a3c2f70726f706572746965733e0d0a, NULL),
('6be45ed6-4fcf-45d2-ad34-a56c0aea18b6', 'eb2d066c-436c-4109-af6f-04d095f53619', '2018-05-05 13:45:59', 0x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0d0a3c21444f43545950452070726f706572746965732053595354454d2022687474703a2f2f6a6176612e73756e2e636f6d2f6474642f70726f706572746965732e647464223e0d0a3c70726f706572746965733e0d0a3c636f6d6d656e743e756e6943656e7461206f504f533c2f636f6d6d656e743e0d0a3c2f70726f706572746965733e0d0a, NULL),
('6d914aa3-3d6c-4051-b550-c4fc1d47c917', 'e146aba7-157a-4f0d-8aeb-915d42b2b440', '2018-07-11 11:22:41', 0x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0d0a3c21444f43545950452070726f706572746965732053595354454d2022687474703a2f2f6a6176612e73756e2e636f6d2f6474642f70726f706572746965732e647464223e0d0a3c70726f706572746965733e0d0a3c636f6d6d656e743e756e6943656e7461206f504f533c2f636f6d6d656e743e0d0a3c2f70726f706572746965733e0d0a, NULL),
('7401a5e0-16c1-4a40-881d-eb9436615ec0', 'eb2d066c-436c-4109-af6f-04d095f53619', '2018-05-03 14:04:46', 0x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0d0a3c21444f43545950452070726f706572746965732053595354454d2022687474703a2f2f6a6176612e73756e2e636f6d2f6474642f70726f706572746965732e647464223e0d0a3c70726f706572746965733e0d0a3c636f6d6d656e743e756e6943656e7461206f504f533c2f636f6d6d656e743e0d0a3c2f70726f706572746965733e0d0a, NULL),
('74dce755-d188-4c5d-bcec-edef072a2efc', 'e146aba7-157a-4f0d-8aeb-915d42b2b440', '2018-06-09 15:40:56', 0x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0d0a3c21444f43545950452070726f706572746965732053595354454d2022687474703a2f2f6a6176612e73756e2e636f6d2f6474642f70726f706572746965732e647464223e0d0a3c70726f706572746965733e0d0a3c636f6d6d656e743e756e6943656e7461206f504f533c2f636f6d6d656e743e0d0a3c2f70726f706572746965733e0d0a, NULL),
('787effa3-ecc7-426a-ae68-4fbdfa45ffa7', 'eb2d066c-436c-4109-af6f-04d095f53619', '2018-05-08 15:27:22', 0x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0d0a3c21444f43545950452070726f706572746965732053595354454d2022687474703a2f2f6a6176612e73756e2e636f6d2f6474642f70726f706572746965732e647464223e0d0a3c70726f706572746965733e0d0a3c636f6d6d656e743e756e6943656e7461206f504f533c2f636f6d6d656e743e0d0a3c2f70726f706572746965733e0d0a, NULL),
('7ff68bfd-10af-4cd8-9699-2aa32c253aa6', 'e146aba7-157a-4f0d-8aeb-915d42b2b440', '2018-07-06 16:11:35', 0x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0d0a3c21444f43545950452070726f706572746965732053595354454d2022687474703a2f2f6a6176612e73756e2e636f6d2f6474642f70726f706572746965732e647464223e0d0a3c70726f706572746965733e0d0a3c636f6d6d656e743e756e6943656e7461206f504f533c2f636f6d6d656e743e0d0a3c2f70726f706572746965733e0d0a, NULL),
('880455b6-da66-432a-bfe6-38a42945133d', 'e146aba7-157a-4f0d-8aeb-915d42b2b440', '2018-07-05 09:47:40', 0x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0d0a3c21444f43545950452070726f706572746965732053595354454d2022687474703a2f2f6a6176612e73756e2e636f6d2f6474642f70726f706572746965732e647464223e0d0a3c70726f706572746965733e0d0a3c636f6d6d656e743e756e6943656e7461206f504f533c2f636f6d6d656e743e0d0a3c2f70726f706572746965733e0d0a, NULL),
('89882b29-cac3-41cd-9a8e-3d9c6410a6f5', '050bd17a-2152-40df-bf6c-cbd0bce32cd5', '2018-05-08 18:10:52', 0x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0d0a3c21444f43545950452070726f706572746965732053595354454d2022687474703a2f2f6a6176612e73756e2e636f6d2f6474642f70726f706572746965732e647464223e0d0a3c70726f706572746965733e0d0a3c636f6d6d656e743e756e6943656e7461206f504f533c2f636f6d6d656e743e0d0a3c2f70726f706572746965733e0d0a, NULL),
('8d5644fa-2992-4337-a5ba-92b4575af56b', 'e146aba7-157a-4f0d-8aeb-915d42b2b440', '2018-05-21 18:10:02', 0x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0d0a3c21444f43545950452070726f706572746965732053595354454d2022687474703a2f2f6a6176612e73756e2e636f6d2f6474642f70726f706572746965732e647464223e0d0a3c70726f706572746965733e0d0a3c636f6d6d656e743e756e6943656e7461206f504f533c2f636f6d6d656e743e0d0a3c2f70726f706572746965733e0d0a, NULL),
('8e2ae580-a5b2-4a8e-b291-c1c4cb2ac9d0', 'e146aba7-157a-4f0d-8aeb-915d42b2b440', '2018-05-25 16:27:16', 0x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0d0a3c21444f43545950452070726f706572746965732053595354454d2022687474703a2f2f6a6176612e73756e2e636f6d2f6474642f70726f706572746965732e647464223e0d0a3c70726f706572746965733e0d0a3c636f6d6d656e743e756e6943656e7461206f504f533c2f636f6d6d656e743e0d0a3c2f70726f706572746965733e0d0a, NULL),
('98ea0468-8336-4503-801a-a0f72a0350cf', 'eb2d066c-436c-4109-af6f-04d095f53619', '2018-05-05 14:08:26', 0x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0d0a3c21444f43545950452070726f706572746965732053595354454d2022687474703a2f2f6a6176612e73756e2e636f6d2f6474642f70726f706572746965732e647464223e0d0a3c70726f706572746965733e0d0a3c636f6d6d656e743e756e6943656e7461206f504f533c2f636f6d6d656e743e0d0a3c2f70726f706572746965733e0d0a, NULL),
('9a2498b5-0fbc-4083-90da-921c53792f1b', 'e146aba7-157a-4f0d-8aeb-915d42b2b440', '2018-07-06 15:22:53', 0x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0d0a3c21444f43545950452070726f706572746965732053595354454d2022687474703a2f2f6a6176612e73756e2e636f6d2f6474642f70726f706572746965732e647464223e0d0a3c70726f706572746965733e0d0a3c636f6d6d656e743e756e6943656e7461206f504f533c2f636f6d6d656e743e0d0a3c2f70726f706572746965733e0d0a, NULL),
('9a3d3b8d-449c-400c-b159-cc638482844e', 'eb2d066c-436c-4109-af6f-04d095f53619', '2018-04-26 14:27:16', 0x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0d0a3c21444f43545950452070726f706572746965732053595354454d2022687474703a2f2f6a6176612e73756e2e636f6d2f6474642f70726f706572746965732e647464223e0d0a3c70726f706572746965733e0d0a3c636f6d6d656e743e756e6943656e7461206f504f533c2f636f6d6d656e743e0d0a3c2f70726f706572746965733e0d0a, NULL),
('9c52480f-8017-4b8d-a475-f25da3cff897', 'e146aba7-157a-4f0d-8aeb-915d42b2b440', '2018-07-06 14:57:17', 0x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0d0a3c21444f43545950452070726f706572746965732053595354454d2022687474703a2f2f6a6176612e73756e2e636f6d2f6474642f70726f706572746965732e647464223e0d0a3c70726f706572746965733e0d0a3c636f6d6d656e743e756e6943656e7461206f504f533c2f636f6d6d656e743e0d0a3c2f70726f706572746965733e0d0a, NULL),
('9c66fc40-492f-44de-958d-dbf7f5a100c5', '050bd17a-2152-40df-bf6c-cbd0bce32cd5', '2018-05-08 18:04:16', 0x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0d0a3c21444f43545950452070726f706572746965732053595354454d2022687474703a2f2f6a6176612e73756e2e636f6d2f6474642f70726f706572746965732e647464223e0d0a3c70726f706572746965733e0d0a3c636f6d6d656e743e756e6943656e7461206f504f533c2f636f6d6d656e743e0d0a3c2f70726f706572746965733e0d0a, NULL),
('a3581d8e-2a38-43c1-b3b2-16f0639d940d', 'e146aba7-157a-4f0d-8aeb-915d42b2b440', '2018-07-06 16:14:42', 0x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0d0a3c21444f43545950452070726f706572746965732053595354454d2022687474703a2f2f6a6176612e73756e2e636f6d2f6474642f70726f706572746965732e647464223e0d0a3c70726f706572746965733e0d0a3c636f6d6d656e743e756e6943656e7461206f504f533c2f636f6d6d656e743e0d0a3c2f70726f706572746965733e0d0a, NULL),
('a60f60da-591e-4f9d-bc6c-1f4440b5c429', 'e146aba7-157a-4f0d-8aeb-915d42b2b440', '2018-05-18 17:20:32', 0x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0d0a3c21444f43545950452070726f706572746965732053595354454d2022687474703a2f2f6a6176612e73756e2e636f6d2f6474642f70726f706572746965732e647464223e0d0a3c70726f706572746965733e0d0a3c636f6d6d656e743e756e6943656e7461206f504f533c2f636f6d6d656e743e0d0a3c2f70726f706572746965733e0d0a, NULL),
('a86a5893-d372-4a0c-abe5-2248f183f4f6', 'e146aba7-157a-4f0d-8aeb-915d42b2b440', '2018-05-26 10:52:51', 0x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0d0a3c21444f43545950452070726f706572746965732053595354454d2022687474703a2f2f6a6176612e73756e2e636f6d2f6474642f70726f706572746965732e647464223e0d0a3c70726f706572746965733e0d0a3c636f6d6d656e743e756e6943656e7461206f504f533c2f636f6d6d656e743e0d0a3c2f70726f706572746965733e0d0a, NULL),
('ab7617b0-ab0f-4c2e-a121-c16690a02984', 'e146aba7-157a-4f0d-8aeb-915d42b2b440', '2018-06-07 11:33:08', 0x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0d0a3c21444f43545950452070726f706572746965732053595354454d2022687474703a2f2f6a6176612e73756e2e636f6d2f6474642f70726f706572746965732e647464223e0d0a3c70726f706572746965733e0d0a3c636f6d6d656e743e756e6943656e7461206f504f533c2f636f6d6d656e743e0d0a3c2f70726f706572746965733e0d0a, NULL),
('abdf7967-28a5-4012-83c5-77bf4df81a45', '397a0dd9-c69d-409f-8311-ac38bcc46376', '2018-05-16 16:03:54', 0x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0d0a3c21444f43545950452070726f706572746965732053595354454d2022687474703a2f2f6a6176612e73756e2e636f6d2f6474642f70726f706572746965732e647464223e0d0a3c70726f706572746965733e0d0a3c636f6d6d656e743e756e6943656e7461206f504f533c2f636f6d6d656e743e0d0a3c2f70726f706572746965733e0d0a, NULL),
('abfce397-1e03-4a59-a4c7-8944ac8c0d86', 'eb2d066c-436c-4109-af6f-04d095f53619', '2018-04-30 16:14:03', 0x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0d0a3c21444f43545950452070726f706572746965732053595354454d2022687474703a2f2f6a6176612e73756e2e636f6d2f6474642f70726f706572746965732e647464223e0d0a3c70726f706572746965733e0d0a3c636f6d6d656e743e756e6943656e7461206f504f533c2f636f6d6d656e743e0d0a3c2f70726f706572746965733e0d0a, NULL),
('aea6c580-040d-491d-84a3-036747f288df', 'eb2d066c-436c-4109-af6f-04d095f53619', '2018-04-26 17:44:33', 0x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0d0a3c21444f43545950452070726f706572746965732053595354454d2022687474703a2f2f6a6176612e73756e2e636f6d2f6474642f70726f706572746965732e647464223e0d0a3c70726f706572746965733e0d0a3c636f6d6d656e743e756e6943656e7461206f504f533c2f636f6d6d656e743e0d0a3c2f70726f706572746965733e0d0a, NULL),
('b008fe18-d5c1-4ac9-b761-1a6979c1264b', 'e146aba7-157a-4f0d-8aeb-915d42b2b440', '2018-05-21 14:31:06', 0x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0d0a3c21444f43545950452070726f706572746965732053595354454d2022687474703a2f2f6a6176612e73756e2e636f6d2f6474642f70726f706572746965732e647464223e0d0a3c70726f706572746965733e0d0a3c636f6d6d656e743e756e6943656e7461206f504f533c2f636f6d6d656e743e0d0a3c2f70726f706572746965733e0d0a, NULL),
('b0bdd32d-5b1a-49dc-908e-216ed2ee5786', 'e146aba7-157a-4f0d-8aeb-915d42b2b440', '2018-05-21 15:59:48', 0x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0d0a3c21444f43545950452070726f706572746965732053595354454d2022687474703a2f2f6a6176612e73756e2e636f6d2f6474642f70726f706572746965732e647464223e0d0a3c70726f706572746965733e0d0a3c636f6d6d656e743e756e6943656e7461206f504f533c2f636f6d6d656e743e0d0a3c2f70726f706572746965733e0d0a, NULL),
('b140f772-8376-4f9b-84d5-efa0b7fd8322', 'e146aba7-157a-4f0d-8aeb-915d42b2b440', '2018-06-06 17:10:13', 0x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0d0a3c21444f43545950452070726f706572746965732053595354454d2022687474703a2f2f6a6176612e73756e2e636f6d2f6474642f70726f706572746965732e647464223e0d0a3c70726f706572746965733e0d0a3c636f6d6d656e743e756e6943656e7461206f504f533c2f636f6d6d656e743e0d0a3c2f70726f706572746965733e0d0a, NULL),
('b3e3b918-9c4b-4e4b-858c-030c6a80c504', 'eb2d066c-436c-4109-af6f-04d095f53619', '2018-04-26 13:40:55', 0x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0d0a3c21444f43545950452070726f706572746965732053595354454d2022687474703a2f2f6a6176612e73756e2e636f6d2f6474642f70726f706572746965732e647464223e0d0a3c70726f706572746965733e0d0a3c636f6d6d656e743e756e6943656e7461206f504f533c2f636f6d6d656e743e0d0a3c2f70726f706572746965733e0d0a, NULL),
('b4e2dfca-3622-48b2-a9ac-6987706a87b5', 'e146aba7-157a-4f0d-8aeb-915d42b2b440', '2018-07-06 15:39:34', 0x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0d0a3c21444f43545950452070726f706572746965732053595354454d2022687474703a2f2f6a6176612e73756e2e636f6d2f6474642f70726f706572746965732e647464223e0d0a3c70726f706572746965733e0d0a3c636f6d6d656e743e756e6943656e7461206f504f533c2f636f6d6d656e743e0d0a3c2f70726f706572746965733e0d0a, NULL),
('b805329e-b01b-44b4-b9cf-6abd44019383', 'e146aba7-157a-4f0d-8aeb-915d42b2b440', '2018-07-23 16:43:02', 0x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0d0a3c21444f43545950452070726f706572746965732053595354454d2022687474703a2f2f6a6176612e73756e2e636f6d2f6474642f70726f706572746965732e647464223e0d0a3c70726f706572746965733e0d0a3c636f6d6d656e743e756e6943656e7461206f504f533c2f636f6d6d656e743e0d0a3c2f70726f706572746965733e0d0a, NULL),
('ba593fed-aa36-4e27-b244-0dbc34f07a09', 'e146aba7-157a-4f0d-8aeb-915d42b2b440', '2018-07-12 14:53:40', 0x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0d0a3c21444f43545950452070726f706572746965732053595354454d2022687474703a2f2f6a6176612e73756e2e636f6d2f6474642f70726f706572746965732e647464223e0d0a3c70726f706572746965733e0d0a3c636f6d6d656e743e756e6943656e7461206f504f533c2f636f6d6d656e743e0d0a3c2f70726f706572746965733e0d0a, NULL),
('bb8afa89-26c6-44ef-b524-c491404ed05b', 'eb2d066c-436c-4109-af6f-04d095f53619', '2018-04-26 14:19:29', 0x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0d0a3c21444f43545950452070726f706572746965732053595354454d2022687474703a2f2f6a6176612e73756e2e636f6d2f6474642f70726f706572746965732e647464223e0d0a3c70726f706572746965733e0d0a3c636f6d6d656e743e756e6943656e7461206f504f533c2f636f6d6d656e743e0d0a3c2f70726f706572746965733e0d0a, NULL),
('bef4d334-d56d-4455-ae27-78a85574f9df', 'e146aba7-157a-4f0d-8aeb-915d42b2b440', '2018-06-11 09:43:25', 0x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0d0a3c21444f43545950452070726f706572746965732053595354454d2022687474703a2f2f6a6176612e73756e2e636f6d2f6474642f70726f706572746965732e647464223e0d0a3c70726f706572746965733e0d0a3c636f6d6d656e743e756e6943656e7461206f504f533c2f636f6d6d656e743e0d0a3c2f70726f706572746965733e0d0a, NULL),
('c49a0d12-06c9-4051-8f53-67b2feaf5452', 'e146aba7-157a-4f0d-8aeb-915d42b2b440', '2018-05-21 14:29:04', 0x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0d0a3c21444f43545950452070726f706572746965732053595354454d2022687474703a2f2f6a6176612e73756e2e636f6d2f6474642f70726f706572746965732e647464223e0d0a3c70726f706572746965733e0d0a3c636f6d6d656e743e756e6943656e7461206f504f533c2f636f6d6d656e743e0d0a3c2f70726f706572746965733e0d0a, NULL),
('c57f9f1f-f742-4764-a1e0-2ec9bb7907c4', '050bd17a-2152-40df-bf6c-cbd0bce32cd5', '2018-05-08 18:01:56', NULL, NULL),
('c7daa965-c7d2-4424-a989-3887a2d4be9d', 'eb2d066c-436c-4109-af6f-04d095f53619', '2018-05-05 14:14:02', 0x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0d0a3c21444f43545950452070726f706572746965732053595354454d2022687474703a2f2f6a6176612e73756e2e636f6d2f6474642f70726f706572746965732e647464223e0d0a3c70726f706572746965733e0d0a3c636f6d6d656e743e756e6943656e7461206f504f533c2f636f6d6d656e743e0d0a3c2f70726f706572746965733e0d0a, NULL),
('da2e2793-b4cd-48cf-80e1-d0faa7224814', '5943f404-c4f8-418c-98c5-fb0329e68c70', '2018-05-17 16:02:32', 0x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0d0a3c21444f43545950452070726f706572746965732053595354454d2022687474703a2f2f6a6176612e73756e2e636f6d2f6474642f70726f706572746965732e647464223e0d0a3c70726f706572746965733e0d0a3c636f6d6d656e743e756e6943656e7461206f504f533c2f636f6d6d656e743e0d0a3c2f70726f706572746965733e0d0a, NULL),
('e6ead73a-ba84-44d1-b7d0-af9754aafd10', 'e146aba7-157a-4f0d-8aeb-915d42b2b440', '2018-07-17 09:01:12', 0x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0d0a3c21444f43545950452070726f706572746965732053595354454d2022687474703a2f2f6a6176612e73756e2e636f6d2f6474642f70726f706572746965732e647464223e0d0a3c70726f706572746965733e0d0a3c636f6d6d656e743e756e6943656e7461206f504f533c2f636f6d6d656e743e0d0a3c2f70726f706572746965733e0d0a, NULL),
('ec90122c-6bd9-445b-b9bf-de56a8fe49c1', 'eb2d066c-436c-4109-af6f-04d095f53619', '2018-04-27 10:20:29', 0x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0d0a3c21444f43545950452070726f706572746965732053595354454d2022687474703a2f2f6a6176612e73756e2e636f6d2f6474642f70726f706572746965732e647464223e0d0a3c70726f706572746965733e0d0a3c636f6d6d656e743e756e6943656e7461206f504f533c2f636f6d6d656e743e0d0a3c2f70726f706572746965733e0d0a, NULL),
('f3931893-d27a-4712-abb6-2dd877761d86', 'eb2d066c-436c-4109-af6f-04d095f53619', '2018-05-02 17:17:33', 0x3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0d0a3c21444f43545950452070726f706572746965732053595354454d2022687474703a2f2f6a6176612e73756e2e636f6d2f6474642f70726f706572746965732e647464223e0d0a3c70726f706572746965733e0d0a3c636f6d6d656e743e756e6943656e7461206f504f533c2f636f6d6d656e743e0d0a3c2f70726f706572746965733e0d0a, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservations`
--

CREATE TABLE `reservations` (
  `id` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `datenew` datetime NOT NULL DEFAULT '2017-01-01 00:00:00',
  `title` varchar(255) NOT NULL,
  `chairs` int(11) NOT NULL,
  `isdone` bit(1) NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservation_customers`
--

CREATE TABLE `reservation_customers` (
  `id` varchar(255) NOT NULL,
  `customer` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resources`
--

CREATE TABLE `resources` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `restype` int(11) NOT NULL,
  `content` mediumblob
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `resources`
--

INSERT INTO `resources` (`id`, `name`, `restype`, `content`) VALUES
('0', 'Menu.Root', 0, 0x3234),
('1', '.01', 1, 0x3235),
('17', 'cash', 1, 0x3236),
('18', 'cashdrawer', 1, 0x3237),
('19', 'discount', 1, 0x3238),
('2', '.02', 1, 0x3239),
('20', 'discount_b', 1, 0x3330),
('21', 'empty', 1, 0x3331),
('22', 'heart', 1, 0x3332),
('23', 'keyboard_48', 1, 0x3333),
('24', 'kit_print', 1, 0x3334),
('25', 'no_photo', 1, 0x3335),
('26', 'refundit', 1, 0x3336),
('27', 'run_script', 1, 0x3337),
('28', 'ticket_print', 1, 0x3337),
('29', 'img.posapps', 1, 0x3338),
('3', '.05', 1, 0x3339),
('30', 'Printer.CloseCash.Preview', 0, 0x3430),
('31', 'Printer.CloseCash', 0, 0x3431),
('32', 'Printer.CustomerPaid', 0, 0x3432),
('33', 'Printer.CustomerPaid2', 0, 0x3433),
('34', 'Printer.FiscalTicket', 0, 0x3434),
('35', 'Printer.Inventory', 0, 0x3435),
('36', 'Printer.OpenDrawer', 0, 0x3436),
('37', 'Printer.PartialCash', 0, 0x3437),
('38', 'Printer.PrintLastTicket', 0, 0x3438),
('39', 'Printer.Product', 0, 0x3439),
('4', '.10', 1, 0x3530),
('40', 'Printer.ReprintTicket', 0, 0x3531),
('41', 'Printer.Start', 0, 0x3532),
('42', 'Printer.Ticket.P1', 0, 0x3533),
('43', 'Printer.Ticket.P2', 0, 0x3534),
('44', 'Printer.Ticket.P3', 0, 0x3535),
('45', 'Printer.Ticket.P4', 0, 0x3536),
('46', 'Printer.Ticket.P5', 0, 0x3537),
('47', 'Printer.Ticket.P6', 0, 0x3538),
('48', 'Printer.Ticket', 0, 0x3539),
('49', 'Printer.Ticket2', 0, 0x3630),
('5', '.20', 1, 0x3631),
('50', 'Printer.TicketClose', 0, 0x3632),
('52', 'Printer.TicketLine', 0, 0x3633),
('53', 'Printer.TicketNew', 0, 0x3634),
('53e87e82-acdf-4635-a1b2-685012497160', 'PRINCIPAL/properties', 0, 0x3635),
('54', 'Printer.TicketPreview', 0, 0x3636),
('55', 'Printer.TicketTotal', 0, 0x3637),
('57', 'script.AddLineNote', 0, 0x3638),
('58', 'script.Event.Total', 0, 0x3639),
('59', 'script.Keyboard', 0, 0x3730),
('6', '.50', 1, 0x3731),
('60', 'script.Linediscount', 0, 0x3732),
('61', 'script.ReceiptConsolidate', 0, 0x3733),
('62', 'script.Refundit', 0, 0x3734),
('62c563e8-3ba8-41b0-ac60-8e605e6c4ffe', '.005', 1, 0x3735),
('64', 'script.ServiceCharge', 0, 0x3736),
('65', 'script.SetPerson', 0, 0x3737),
('66', 'script.StockCurrentAdd', 0, 0x3738),
('67', 'script.StockCurrentSet', 0, 0x3739),
('68', 'script.Totaldiscount', 0, NULL),
('6801743d-e2a1-4e00-848a-5753d6f8e711', '.2', 1, 0x3830),
('69', 'payment.cash', 0, 0x3831),
('70', 'ticket.addline', 0, NULL),
('71', 'ticket.change', 0, 0x3832),
('72', 'Ticket.Buttons', 0, 0x3833),
('73', 'Ticket.Close', 0, 0x3834),
('74', 'Ticket.Discount', 0, 0x3835),
('747fde03-5832-4dd9-b2b5-75caef2c7624', '.1', 1, 0x3836),
('75', 'Ticket.Line', 0, 0x3837),
('76', 'ticket.removeline', 0, NULL),
('77', 'ticket.setline', 0, NULL),
('78', 'Ticket.TicketLineTaxesIncluded', 0, 0x3838),
('79', 'Window.Logo', 1, NULL),
('80', 'Window.Title', 0, 0x50554e544f205041474f20504f53205041524120434f4d505554524f4e53),
('82', 'Cash.Close', 0, 0x3839),
('8236e15d-cc3c-44f6-84a9-0c52530e0cad', '.5', 1, 0x3930),
('cf345cef-6881-4436-909f-8c4041f01577', 'DESKTOP-HS2Q6PT/properties', 0, 0x3931),
('e57a4649-e8bd-4d69-af02-e42bbdc473ef', '.100', 1, 0x3932);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `retenciones`
--

CREATE TABLE `retenciones` (
  `id_retencion` int(11) NOT NULL,
  `nombre_retencion` text NOT NULL,
  `porcentaje_retencion` varchar(5) NOT NULL,
  `identificacion_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `retenciones`
--

INSERT INTO `retenciones` (`id_retencion`, `nombre_retencion`, `porcentaje_retencion`, `identificacion_usuario`) VALUES
(3, 'si', '81', 100000000),
(4, 'pan', '34', 100000000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `permissions` mediumblob
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `name`, `permissions`) VALUES
('0', 'DISEÑADOR', 0x3933),
('1', 'DUEÑO', 0x3934),
('2', 'CAJERO', 0x3935),
('3', 'MINIMO / CONSULTAS', 0x3936),
('604550e9-cc17-4003-9c1c-d1705ef51fb8', 'CAJERO ADMIN', 0x3937),
('d73b9003-a441-43af-a41a-d407d5c0ea52', 'BODEGA', 0x3938);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sharedtickets`
--

CREATE TABLE `sharedtickets` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content` mediumblob,
  `appuser` varchar(255) DEFAULT NULL,
  `pickupid` smallint(6) NOT NULL DEFAULT '0',
  `locked` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `shifts`
--

CREATE TABLE `shifts` (
  `id` varchar(255) NOT NULL,
  `startshift` datetime NOT NULL,
  `endshift` datetime DEFAULT NULL,
  `pplid` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `shifts`
--

INSERT INTO `shifts` (`id`, `startshift`, `endshift`, `pplid`) VALUES
('0', '2016-01-01 00:00:00', '2016-01-01 00:00:00', '0'),
('f16162c0-c230-4c30-9472-895176c037fc', '2018-05-08 18:08:17', NULL, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `shift_breaks`
--

CREATE TABLE `shift_breaks` (
  `ID` varchar(255) NOT NULL,
  `SHIFTID` varchar(255) NOT NULL,
  `BREAKID` varchar(255) NOT NULL,
  `STARTTIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ENDTIME` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `shift_breaks`
--

INSERT INTO `shift_breaks` (`ID`, `SHIFTID`, `BREAKID`, `STARTTIME`, `ENDTIME`) VALUES
('0', '0', '0', '2016-01-01 05:00:00', '2017-05-01 05:00:00'),
('67dcf270-6186-4a9b-93f8-ec9c4d7d853c', 'f16162c0-c230-4c30-9472-895176c037fc', 'fd2b2f07-85a5-4512-b949-0c4cb709e20b', '2018-05-08 23:08:28', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stockcurrent`
--

CREATE TABLE `stockcurrent` (
  `location` varchar(255) NOT NULL,
  `product` varchar(255) NOT NULL,
  `attributesetinstance_id` varchar(255) DEFAULT NULL,
  `units` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `stockcurrent`
--

INSERT INTO `stockcurrent` (`location`, `product`, `attributesetinstance_id`, `units`) VALUES
('0', 'ef2d0ded-7b0f-49e2-9c26-b6f2582757c9', NULL, 2),
('0', 'bc76f6ec-4be4-4249-a3dc-b517880c8647', NULL, 1),
('0', 'c3934860-bef3-4b73-adcd-2efdf629def1', NULL, 4),
('0', '326f0b79-457f-4125-8365-84874fb3c303', NULL, 1),
('0', '3b7394d3-05aa-4f4e-a115-4f8cb88884ac', NULL, 2),
('0', '97ba6646-6dc8-4abf-9e7d-5bc84794bf20', NULL, 3),
('0', 'f65236e2-5a72-405a-8ca8-9a1ae71a0888', NULL, 0),
('0', '8615e923-0a25-4747-9d36-58e0d6c264b5', NULL, 2),
('0', 'f4eb5041-8f60-4d9b-8ed1-848d5771174c', NULL, 39),
('0', '16a10d31-af9a-410e-a72d-650bacc52a59', NULL, 49),
('0', '8e98d6c6-631a-4a5c-9e22-3cf615373b49', NULL, 4),
('0', '2031c239-3158-45e4-852d-cc1c14956b6a', NULL, 8),
('0', '0060f534-964c-48d5-9ced-fb55eaf5569e', NULL, 2),
('0', '76b24bf0-14a4-498a-a9d3-b9fe55991f4e', NULL, 24),
('0', '39949465-403b-455f-9077-c352fadbbfcd', NULL, 9),
('0', '9621839b-65fb-49cd-96f3-9e1fa0c11449', NULL, 9),
('0', '61c6b4b9-8986-4c45-862c-dee267867b89', NULL, 11),
('0', '3941df9e-4d01-4bce-81f8-12dea263db79', NULL, 87),
('0', 'd80aef84-aec7-4965-9541-efffa57db37f', NULL, 13),
('0', '52602630-bf45-4d1a-9829-e4e9955eb71b', NULL, 1),
('0', 'fab8075c-0632-4158-8fc8-bd715bbadc3f', NULL, 4),
('0', 'ee1ef151-1f9b-48a1-96cc-3de25fbb481e', NULL, 5),
('0', 'd8fbd110-16d9-4fd1-b73a-7bbdd8617c79', NULL, 1),
('0', 'ebaa8478-68fd-4ad7-86fd-798696189d49', NULL, 2),
('0', 'a5abe161-9651-4d2a-bb83-722c4fec5d58', NULL, 2),
('0', '15bd0371-6990-43ea-832d-9e55eb3b7916', NULL, 5),
('0', '08e2052d-cbc8-48c7-9cec-d0c24d76a287', NULL, 1),
('0', 'e8bcfdd1-0818-48c6-b609-3f6344d3d0cb', NULL, 5),
('0', 'xxx999_999xxx_x9x9x9', NULL, 4),
('0', '8e3f67a3-8341-499d-8082-b397ae0a9a7e', NULL, 19),
('0', 'ce638b72-3d7f-4558-9f7a-3d9a3f7e2cec', NULL, 4),
('0', 'aae1a692-d6ed-44ea-8350-096a9f308e65', NULL, 3),
('0', 'b7ca7357-fb1a-4bbf-b250-47443c34a90b', NULL, 3),
('0', 'c7b19666-822f-400a-842f-60bfca4d8980', NULL, 2),
('0', 'd8dce3ae-39d4-4580-a347-1a002ba65d7f', NULL, 95),
('0', 'dda3b042-f1ec-4cf2-8b38-244a9c32f289', NULL, 207),
('0', '4152580f-d9b5-4a49-a8bf-ba10ff0c82da', NULL, 5),
('0', '14497dc1-8d2e-4277-ade6-7eca54d87860', NULL, 33),
('0', '342fa52c-7c53-42a6-a2a6-63cfaac7671c', NULL, 4),
('0', 'c8c70dd3-7a47-44db-934d-8ee11819dc17', NULL, 1),
('0', '26bcebd0-96bf-423d-b669-0c18cd912827', NULL, 0),
('0', '9975dffd-a8e1-43df-9712-611140de31db', NULL, 20),
('0', '4190711b-4381-4742-9730-489f4bd02e05', NULL, 18),
('0', 'b4d9023c-6a17-4f94-95af-fa5685cfdc58', NULL, 8),
('0', 'e53a3977-d9f0-40f6-b6df-fcdfd3259b1d', NULL, 0),
('0', '0f3f6dc5-b2a8-44c9-b8de-24bbdcc49d73', NULL, 1),
('0', 'ee621994-b1f1-491f-bc8d-105821436a9a', NULL, 0),
('0', 'c0e46984-db68-4a88-aebf-f3680facd694', NULL, 5),
('0', '3f43d708-b1c2-48d6-9929-d25b0ee93152', NULL, 278),
('0', 'b54a4b44-eb73-4d79-8fd0-30c8b87ec4ef', NULL, 81),
('0', '5fc18d75-75dd-4230-9e2f-c12127ad7ffc', NULL, 54),
('0', '2bc44efd-bea7-4d31-ab55-f85215ed491d', NULL, 3),
('0', 'e08eb3e8-39fb-4d6e-b0a5-861e51b31141', NULL, 2),
('0', 'f23c026f-4975-4bdd-91e9-fe2ff31cfd23', NULL, 5),
('0', '94d9fe4a-147b-443f-8cd6-151f034e9850', NULL, 1),
('0', 'e5478b71-9b0e-43a7-998f-4435e10a294c', NULL, -1),
('0', '173c9da7-791e-410d-9e1f-8825a1e69e07', NULL, 3),
('0', '8574460b-daa1-4be7-b42f-86def1f7e5aa', NULL, 1220),
('0', 'c7c5a4de-6cb1-4f31-b4b6-5af7eb529cc4', NULL, 0),
('0', 'a8fce4e3-9f66-44bb-9925-709275fddb51', NULL, 15),
('0', '8e09f4ba-494a-4c9d-ac49-a22ebabca609', NULL, 1),
('0', '7ea10e52-23cc-48d7-8273-dc405cc02a9f', NULL, 24),
('0', '5fe5ba81-aad3-4d67-9aba-8ca93bd629d5', NULL, 25),
('0', 'f6a5e356-723b-4f6e-8ae9-556953e0d6f4', NULL, 12),
('0', '6d75ad29-6f01-4aed-a5eb-4f9f5ef34de0', NULL, 1),
('0', '9673907f-9439-4e58-a00b-cb867528b01d', NULL, 1),
('0', '36f602a7-9bf3-46ff-b186-164204d15105', NULL, 1),
('0', 'b93a886a-d95e-48af-a3dc-7aa051ef3a19', NULL, 2),
('0', 'b8926e57-09b2-48b9-806a-56990b92a218', NULL, 1),
('0', 'c5bf9e40-6ebc-4c08-bac0-6ae769bd5abc', NULL, 2),
('0', '8c50663a-cd2a-4eb1-8666-1cd784e9fb79', NULL, 4),
('0', 'e8da77c6-432c-47bd-aad3-919cd4ff6ab9', NULL, 1),
('0', '08e09e9d-42eb-4690-90de-d19b6b8a0052', NULL, 1),
('0', '7b237373-319b-4f0a-8fbd-efbaddc282ad', NULL, 6),
('0', '1fe7037a-89ac-45c6-9db1-c5882cc62228', NULL, 1),
('0', '26629ed1-9d86-46bc-8c9a-8271847c1a78', NULL, 1),
('0', '4237eb40-bf15-411d-a7dc-bc089dc91d09', NULL, 1),
('0', '4ebb1e34-6595-4961-acdb-82d679f6e46d', NULL, 3),
('0', '010cf75d-015c-4d4a-b6f3-844e0a59cd52', NULL, 1),
('0', 'a8d0101c-5e74-43ab-9427-a45a60bda3bf', NULL, 1),
('0', 'fe9f7587-7bc7-4d81-91b1-cae543cc647e', NULL, 1),
('0', '982f28a9-c8bb-47c1-8aa2-dba92db5f939', NULL, 1),
('0', 'f8e1ee31-0109-4db6-a563-aaad7341ff53', NULL, 1),
('0', '477b129b-f25d-4fe3-b122-c9cb1a2bb005', NULL, 1),
('0', 'abe789c1-189b-4bf9-af4e-85c591da2c50', NULL, 0),
('0', '1dd66e05-660f-43b8-8c06-07b8767ea4dd', NULL, 1),
('0', '3ed8c73c-dd5e-4cfd-ac14-e0a7704fda2b', NULL, 1),
('0', '23539908-f5de-4db6-a47d-824ade6b2663', NULL, 1),
('0', 'cdbe7ac3-455f-41ca-8bf8-163ea104914a', NULL, 1),
('0', 'd9ba7d33-0a13-4c1a-80bf-064da39c8187', NULL, 2),
('0', 'abbc4560-5d38-4e05-a31e-ddb6bbe81c1b', NULL, 12),
('0', '0cac3866-4100-48ac-a229-588d49808ec9', NULL, 1),
('0', '6b7efc03-a955-4269-9ca5-ca2bf04c3d48', NULL, -2),
('0', '2210ff62-20d3-499b-ab64-1344d6b02da5', NULL, -11),
('0', 'cbb780ca-12df-4b19-ab88-50dd81e8de0c', NULL, 1),
('0', '89cda22c-1255-4946-bd31-92e92ae3c298', NULL, 2),
('0', 'aac4c6b0-f568-4374-afc3-d4fa1ea6c998', NULL, 15),
('0', 'abfac013-6f59-49a4-b1b8-233f3fb4971f', NULL, -3),
('0', 'a7b3e1d8-80dc-41ae-840c-7c7e351e50f3', NULL, 3),
('0', 'dd07a061-237e-4322-a01f-ae6356b538a9', NULL, 2),
('0', '81109003-89b0-4da1-8ab2-d0f06ffa839a', NULL, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stockdiary`
--

CREATE TABLE `stockdiary` (
  `id` varchar(255) NOT NULL,
  `datenew` datetime NOT NULL,
  `reason` int(11) NOT NULL,
  `location` varchar(255) NOT NULL,
  `product` varchar(255) NOT NULL,
  `attributesetinstance_id` varchar(255) DEFAULT NULL,
  `units` double NOT NULL,
  `price` double NOT NULL,
  `appuser` varchar(255) DEFAULT NULL,
  `supplier` varchar(255) DEFAULT NULL,
  `supplierdoc` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `stockdiary`
--

INSERT INTO `stockdiary` (`id`, `datenew`, `reason`, `location`, `product`, `attributesetinstance_id`, `units`, `price`, `appuser`, `supplier`, `supplierdoc`) VALUES
('025e4649-bba8-4e73-8d89-d678867f2db5', '2018-04-23 13:58:00', -3, '0', '2031c239-3158-45e4-852d-cc1c14956b6a', NULL, -1, 27000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('02c44f4a-4bf5-46b7-be20-7033d7d15655', '2018-04-23 17:56:00', -2, '0', 'b4d9023c-6a17-4f94-95af-fa5685cfdc58', NULL, -7, 210000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('030834ac-78f2-4495-8c01-ee5b1904d049', '2018-04-28 11:17:33', -1, '0', '76b24bf0-14a4-498a-a9d3-b9fe55991f4e', NULL, -10, 25000, 'GERENCIA', NULL, NULL),
('041135be-cc26-4c88-89a7-9ac80d195f08', '2018-05-05 14:08:27', 2, '0', 'c7b19666-822f-400a-842f-60bfca4d8980', NULL, 1, 280000, 'GERENCIA', NULL, NULL),
('04f790e2-641a-46c0-af83-04326d5969d5', '2018-04-23 14:16:00', 1, '0', 'dda3b042-f1ec-4cf2-8b38-244a9c32f289', NULL, 28, 6000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('053159dc-a2ea-4c40-85fd-f8bb89122b35', '2018-05-03 14:04:46', -1, '0', 'b54a4b44-eb73-4d79-8fd0-30c8b87ec4ef', NULL, -4, 400, 'GERENCIA', NULL, NULL),
('0554bd0d-ca51-46f3-942a-aea02ad57ae4', '2018-05-02 17:17:33', -1, '0', '9975dffd-a8e1-43df-9712-611140de31db', NULL, -1, 18000, 'GERENCIA', NULL, NULL),
('064ebe62-0fc2-4fbc-9ed9-bd426386294a', '2018-04-23 13:43:00', 1, '0', 'f4eb5041-8f60-4d9b-8ed1-848d5771174c', NULL, 1, 1800, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('067f10a4-e36b-4c2f-a7c1-eac46046dce0', '2018-05-03 14:04:46', -1, '0', 'c3934860-bef3-4b73-adcd-2efdf629def1', NULL, -1, 20500, 'GERENCIA', NULL, NULL),
('06fab8d7-553d-4892-a6f7-591105dd1bfa', '2018-05-25 16:27:16', -1, '0', 'dda3b042-f1ec-4cf2-8b38-244a9c32f289', NULL, -1, 10000, 'GERENCIA', NULL, NULL),
('07517876-61a2-43ed-b47d-f6da0c03d512', '2018-05-21 15:56:00', 1, '0', '81109003-89b0-4da1-8ab2-d0f06ffa839a', NULL, 1, 50000, 'GERENCIA', '73e8a2eb-456d-4b1e-856f-0bdc19a998e5', ''),
('07f8aa55-f615-4f90-9731-f55bbacf1e2d', '2018-05-02 17:20:32', -1, '0', '3941df9e-4d01-4bce-81f8-12dea263db79', NULL, -1, 10000, 'GERENCIA', NULL, NULL),
('09deb536-b952-4d85-9ddd-93c8b1875910', '2018-05-26 10:52:51', 2, '0', 'd8dce3ae-39d4-4580-a347-1a002ba65d7f', NULL, 1, 11000, 'GERENCIA', NULL, NULL),
('0a5c3131-a1dd-4491-8785-4848d844769f', '2018-04-23 17:42:00', -2, '0', '76b24bf0-14a4-498a-a9d3-b9fe55991f4e', NULL, -1, 17500, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('0b6458ac-4d45-4632-8db0-d3c7bdbcf042', '2018-04-23 14:49:00', 1, '0', 'b4d9023c-6a17-4f94-95af-fa5685cfdc58', NULL, 1, 110000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('0bd9ff1a-52dc-4ca8-a134-3185baa6afca', '2018-04-26 17:57:00', 1, '0', 'abbc4560-5d38-4e05-a31e-ddb6bbe81c1b', NULL, 12, 0, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('0dc5fff9-e81a-4215-9f41-c43e4e98ab8d', '2018-04-23 13:43:00', 1, '0', 'f4eb5041-8f60-4d9b-8ed1-848d5771174c', NULL, 1, 1800, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('0e6c5076-b034-414b-829c-ca8ed823cd9d', '2018-04-23 13:43:00', 1, '0', 'f4eb5041-8f60-4d9b-8ed1-848d5771174c', NULL, 1, 1800, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('0e8c287f-dfa9-47ba-8d4a-0cdc70008998', '2018-07-23 16:43:02', -1, '0', 'aac4c6b0-f568-4374-afc3-d4fa1ea6c998', NULL, -1, 7000, 'GERENCIA', NULL, NULL),
('0eaeb53f-54dd-4885-a211-c5ac5e8c5db9', '2018-08-01 10:28:32', -1, '0', '3f43d708-b1c2-48d6-9929-d25b0ee93152', NULL, -1, 5000, 'GERENCIA', NULL, NULL),
('0f3c3fd0-2db6-44d4-8ee6-fe3cfc7c9d48', '2018-05-03 14:04:46', -1, '0', 'd8fbd110-16d9-4fd1-b73a-7bbdd8617c79', NULL, -1, 240000, 'GERENCIA', NULL, NULL),
('0f926fad-8e9f-4d01-b0b1-c7d12347dad3', '2018-05-21 15:59:48', -1, '0', '81109003-89b0-4da1-8ab2-d0f06ffa839a', NULL, -1, 50000, 'GERENCIA', NULL, NULL),
('12ee852a-65d1-4736-93d4-77af24a48393', '2018-04-26 17:44:33', -1, '0', 'c7c5a4de-6cb1-4f31-b4b6-5af7eb529cc4', NULL, -1, 20000, 'GERENCIA', NULL, NULL),
('13119c33-0435-4c64-b5cb-93b2735e2890', '2018-04-23 13:43:00', 1, '0', 'f4eb5041-8f60-4d9b-8ed1-848d5771174c', NULL, 1, 1800, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('13d489d7-ea10-4fcb-9dce-9d98b309f996', '2018-04-23 15:53:00', 1, '0', 'd8dce3ae-39d4-4580-a347-1a002ba65d7f', NULL, 85, 6000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('14261b84-6a30-42a6-8afd-9e79284a16a2', '2018-05-02 15:09:00', -1, '0', 'c7b19666-822f-400a-842f-60bfca4d8980', NULL, -1, 280000, 'GERENCIA', NULL, NULL),
('14439799-5e88-4a7c-a69b-1bdd7f6c2b87', '2018-04-23 14:16:00', 1, '0', 'd8dce3ae-39d4-4580-a347-1a002ba65d7f', NULL, 28, 6000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('14adfac8-2c29-445c-88b8-0dbda99bfe8c', '2018-04-23 13:38:00', 1, '0', '97ba6646-6dc8-4abf-9e7d-5bc84794bf20', NULL, 1, 380000, 'GERENCIA', '28a90c40-987f-409d-92b5-7acb86ac4684', ''),
('16898930-d5e7-409f-bf84-d2b2cf4d9b37', '2018-06-19 14:18:27', -1, '0', 'ce638b72-3d7f-4558-9f7a-3d9a3f7e2cec', NULL, -4, 65000, 'GERENCIA', NULL, NULL),
('16979645-8932-410f-b67a-61dfc44b9dcf', '2018-05-11 14:13:00', 1, '0', 'dd07a061-237e-4322-a01f-ae6356b538a9', NULL, 1, 350000, 'GERENCIA', 'dce6204b-3dd1-4109-828f-b179520fed91', ''),
('17041e65-812a-4ac1-a629-2b5da72209a6', '2018-04-26 17:48:00', 1, '0', 'c5bf9e40-6ebc-4c08-bac0-6ae769bd5abc', NULL, 2, 0, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('181a9b8d-7ee6-42f3-b92f-c72dc85a3977', '2018-04-23 15:55:00', 1, '0', '3f43d708-b1c2-48d6-9929-d25b0ee93152', NULL, 1, 1500, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('188b2e76-befb-48f4-9d11-1194d23347b8', '2018-04-23 15:55:00', -2, '0', '3f43d708-b1c2-48d6-9929-d25b0ee93152', NULL, -1, 1500, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('19501c18-44b6-411f-8698-c0ff2a6bfbca', '2018-04-23 13:43:00', 1, '0', 'f4eb5041-8f60-4d9b-8ed1-848d5771174c', NULL, 1, 1800, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('195de8fe-d9c7-4ebf-a3a2-5632b548740e', '2018-05-08 15:59:00', 1, '0', 'a7b3e1d8-80dc-41ae-840c-7c7e351e50f3', NULL, 3, 210000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('1ae48a27-7981-4bff-9611-9a4be1a8d070', '2018-04-26 17:47:00', 1, '0', '9673907f-9439-4e58-a00b-cb867528b01d', NULL, 1, 0, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('1b3b3a3c-0798-4108-a8b4-b5509b6fafd7', '2018-05-28 11:27:04', -1, '0', '2210ff62-20d3-499b-ab64-1344d6b02da5', NULL, -2, 5000, 'GERENCIA', NULL, NULL),
('1b769f80-7914-4a04-9864-b306f55f4e9e', '2018-04-23 13:43:00', 1, '0', 'f4eb5041-8f60-4d9b-8ed1-848d5771174c', NULL, 1, 1800, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('1bf4d6d7-814a-4c34-b2bd-95cbe679b4db', '2018-05-02 16:55:11', -1, '0', '2031c239-3158-45e4-852d-cc1c14956b6a', NULL, -1, 38000, 'GERENCIA', NULL, NULL),
('1cac09a5-ad93-4367-92e5-ba4673620a0e', '2018-04-23 13:38:00', 1, '0', '97ba6646-6dc8-4abf-9e7d-5bc84794bf20', NULL, 1, 380000, 'GERENCIA', '28a90c40-987f-409d-92b5-7acb86ac4684', ''),
('1d0ab34f-c162-4082-95aa-fcba62a985dd', '2018-04-23 15:15:00', -2, '0', '3941df9e-4d01-4bce-81f8-12dea263db79', NULL, -1, 4000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('1db101e9-3466-49f6-b89b-31fe85098e15', '2018-05-05 14:08:27', 2, '0', '2210ff62-20d3-499b-ab64-1344d6b02da5', NULL, 5, 5000, 'GERENCIA', NULL, NULL),
('1db6b373-33e8-46de-a4e0-79f33c3830ff', '2018-04-23 13:43:00', 1, '0', 'f4eb5041-8f60-4d9b-8ed1-848d5771174c', NULL, 1, 1800, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('1f89fb50-8f89-4b3b-842a-e97a74adc2eb', '2018-04-23 13:31:00', 1, '0', 'c3934860-bef3-4b73-adcd-2efdf629def1', NULL, 1, 15000, 'GERENCIA', '28a90c40-987f-409d-92b5-7acb86ac4684', ''),
('1fecd9c0-8537-441a-b9c8-a46033126874', '2018-05-05 14:08:26', -1, '0', 'ee1ef151-1f9b-48a1-96cc-3de25fbb481e', NULL, -1, 180000, 'GERENCIA', NULL, NULL),
('2054f072-b72a-4143-8899-4bead8d8d522', '2018-06-19 14:18:27', -1, '0', '2bc44efd-bea7-4d31-ab55-f85215ed491d', NULL, -1, 160000, 'GERENCIA', NULL, NULL),
('20b03158-9a0b-406f-9ff3-d49048e00120', '2018-07-11 11:22:41', -1, '0', 'e53a3977-d9f0-40f6-b6df-fcdfd3259b1d', NULL, -1, 210000, 'GERENCIA', NULL, NULL),
('20b44784-1317-477d-84d5-187aa2b5319f', '2018-04-23 13:52:00', 1, '0', 'ebaa8478-68fd-4ad7-86fd-798696189d49', NULL, 2, 75000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('20cbeb21-fb71-4415-8f79-93289d77bb15', '2018-05-18 17:20:32', -1, '0', '26bcebd0-96bf-423d-b669-0c18cd912827', NULL, -1, 50000, 'GERENCIA', NULL, NULL),
('21287d50-95f3-4a81-a89b-eb9f9914ece5', '2018-04-30 16:14:03', -1, '0', '3f43d708-b1c2-48d6-9929-d25b0ee93152', NULL, -2, 5000, 'GERENCIA', NULL, NULL),
('220935c0-bb25-430e-837f-4a157563ed2c', '2018-04-23 13:45:00', 1, '0', '16a10d31-af9a-410e-a72d-650bacc52a59', NULL, 1, 2000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('226336a5-cc93-488a-97a1-c0c7bba84080', '2018-07-19 08:23:54', -1, '0', '16a10d31-af9a-410e-a72d-650bacc52a59', NULL, -1, 5000, 'GERENCIA', NULL, NULL),
('233c2ce6-67dd-4c16-bdf9-d1116bbfd814', '2018-04-23 13:38:00', 1, '0', '97ba6646-6dc8-4abf-9e7d-5bc84794bf20', NULL, 1, 380000, 'GERENCIA', '28a90c40-987f-409d-92b5-7acb86ac4684', ''),
('248066f3-ee61-4d58-9291-f4ead8c92f4d', '2018-05-21 14:31:06', -1, '0', 'ce638b72-3d7f-4558-9f7a-3d9a3f7e2cec', NULL, -2, 65000, 'GERENCIA', NULL, NULL),
('249a3e08-8656-4250-882d-3c6d67d0aae5', '2018-07-27 10:46:16', -1, '0', '4152580f-d9b5-4a49-a8bf-ba10ff0c82da', NULL, -1, 30000, 'CAJA ADMIN', NULL, NULL),
('253203f6-e71d-4244-8f9d-eb24f067f498', '2018-05-29 16:46:57', -1, '0', '2bc44efd-bea7-4d31-ab55-f85215ed491d', NULL, -1, 160000, 'GERENCIA', NULL, NULL),
('25ddccb5-da40-4e53-ac7a-08e1620a7dc8', '2018-04-23 13:52:00', 1, '0', 'a5abe161-9651-4d2a-bb83-722c4fec5d58', NULL, 1, 165000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('25f7cb31-89e1-4482-b82c-bdf6c4b091c8', '2018-04-23 17:51:00', 1, '0', 'e08eb3e8-39fb-4d6e-b0a5-861e51b31141', NULL, 2, 50000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('265026af-a964-44c7-a66d-368e03bf4ced', '2018-04-23 13:33:00', 1, '0', '3b7394d3-05aa-4f4e-a115-4f8cb88884ac', NULL, 1, 165000, 'GERENCIA', '28a90c40-987f-409d-92b5-7acb86ac4684', ''),
('2681f0d0-0aaf-4750-abe7-9feb7673bdad', '2018-04-23 13:43:00', 1, '0', 'f4eb5041-8f60-4d9b-8ed1-848d5771174c', NULL, 1, 1800, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('27f15d14-53b4-4f18-86cf-2f80cf6e1ab9', '2018-04-26 17:51:00', 1, '0', 'a8d0101c-5e74-43ab-9427-a45a60bda3bf', NULL, 1, 0, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('28f6853e-e379-48a0-8aa8-8f872d28f2e2', '2018-04-30 16:14:03', -1, '0', '2210ff62-20d3-499b-ab64-1344d6b02da5', NULL, -6, 5000, 'GERENCIA', NULL, NULL),
('2901ada8-a8f2-4965-abcb-36cf05eeb143', '2018-04-26 17:55:00', 1, '0', '3ed8c73c-dd5e-4cfd-ac14-e0a7704fda2b', NULL, 1, 0, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('2901c50f-5d36-4759-bd72-6411808d5a78', '2018-04-23 13:40:00', 1, '0', '8615e923-0a25-4747-9d36-58e0d6c264b5', NULL, 1, 515000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('290c3ddf-e4e3-4cfb-bd86-cf91690f2e4b', '2018-05-21 18:10:02', -1, '0', '3941df9e-4d01-4bce-81f8-12dea263db79', NULL, -1, 10000, 'GERENCIA', NULL, NULL),
('29693868-f575-4ff7-809f-1a08702b1a1a', '2018-08-02 15:44:21', -1, '0', 'd80aef84-aec7-4965-9541-efffa57db37f', NULL, -1, 15000, 'GERENCIA', NULL, NULL),
('29ecf4fc-30d5-4862-8b2a-b882b3d4ec3b', '2018-04-23 13:26:00', 1, '0', 'ef2d0ded-7b0f-49e2-9c26-b6f2582757c9', NULL, 1, 3, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('2a81d765-9915-45f0-8533-fe58b96c0cad', '2018-05-08 16:31:00', 1, '0', 'a7b3e1d8-80dc-41ae-840c-7c7e351e50f3', NULL, 1, 210000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('2bc88803-c7fb-4468-8ab9-998512a6e767', '2018-04-23 13:43:00', 1, '0', 'f4eb5041-8f60-4d9b-8ed1-848d5771174c', NULL, 1, 1800, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('2cf5c81b-361c-44be-91d4-72097c2d09df', '2018-04-23 14:21:00', -3, '0', '3941df9e-4d01-4bce-81f8-12dea263db79', NULL, -3, 4000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('2d93b6fd-8092-4550-9f09-3c596ffec89e', '2018-04-23 15:48:00', 1, '0', 'c0e46984-db68-4a88-aebf-f3680facd694', NULL, 5, 68000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('2e625297-6079-4ff2-8c82-f87191ae5fcd', '2018-04-26 17:43:00', 1, '0', 'c7c5a4de-6cb1-4f31-b4b6-5af7eb529cc4', NULL, 1, 20000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('2efe2903-19ee-4866-b265-a11ad7d15a00', '2018-05-21 14:29:04', -1, '0', '3941df9e-4d01-4bce-81f8-12dea263db79', NULL, -1, 10000, 'GERENCIA', NULL, NULL),
('2fa4f815-5147-4059-9ad5-2d12ef412a08', '2018-06-19 14:18:27', -1, '0', '6b7efc03-a955-4269-9ca5-ca2bf04c3d48', NULL, -2, 3000, 'GERENCIA', NULL, NULL),
('306f5ed3-e267-4e12-8bc0-0b047bd65f6b', '2018-04-26 18:04:00', 1, '0', 'cbb780ca-12df-4b19-ab88-50dd81e8de0c', NULL, 1, 3500, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('306f69e8-4e42-44b9-8f79-de01b04aec67', '2018-04-23 15:56:00', 1, '0', '3f43d708-b1c2-48d6-9929-d25b0ee93152', NULL, 1, 1500, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('310bfa42-9545-432c-a4b2-0736f2a19c73', '2018-04-26 17:51:00', 1, '0', '010cf75d-015c-4d4a-b6f3-844e0a59cd52', NULL, 1, 0, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('31aea8c7-5e0b-44bd-8181-79d87290cb0d', '2018-04-26 14:19:29', -1, '0', '2031c239-3158-45e4-852d-cc1c14956b6a', NULL, -1, 38000, 'GERENCIA', NULL, NULL),
('32381e2f-afa5-420a-a25e-7c118c2a613c', '2018-04-23 13:43:00', 1, '0', 'f4eb5041-8f60-4d9b-8ed1-848d5771174c', NULL, 1, 1800, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('32dadb30-466f-42d2-89ec-4b1987a22a21', '2018-05-02 11:48:56', -1, '0', 'd8dce3ae-39d4-4580-a347-1a002ba65d7f', NULL, -7, 11000, 'GERENCIA', NULL, NULL),
('331329ad-e45f-4a70-a36a-48dc440f2193', '2018-04-23 13:52:00', 1, '0', 'd8fbd110-16d9-4fd1-b73a-7bbdd8617c79', NULL, 2, 178000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('333cde28-1ebb-402e-b42e-4a79ac391943', '2018-04-23 13:43:00', 1, '0', 'f4eb5041-8f60-4d9b-8ed1-848d5771174c', NULL, 1, 1800, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('353066f2-6806-4612-a5fb-b7aaace2e3de', '2018-04-23 15:00:00', -3, '0', '76b24bf0-14a4-498a-a9d3-b9fe55991f4e', NULL, -1, 25000, 'GERENCIA', '28a90c40-987f-409d-92b5-7acb86ac4684', ''),
('36538ae3-05da-4ec1-92ca-8f349b3038b9', '2018-04-23 14:45:00', 1, '0', 'e53a3977-d9f0-40f6-b6df-fcdfd3259b1d', NULL, 1, 150000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('3668312a-139f-48e4-ac9f-a90119b78ee1', '2018-04-23 14:12:00', 1, '0', 'ce638b72-3d7f-4558-9f7a-3d9a3f7e2cec', NULL, 14, 28000, 'GERENCIA', 'e7343158-b7d1-4e15-a3f9-928640e7ec83', ''),
('3699d263-2518-47b6-b219-0759158f8739', '2018-04-23 18:06:00', 1, '0', 'e5478b71-9b0e-43a7-998f-4435e10a294c', NULL, 1, 45000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('3702cf9e-a8bc-47dd-9e75-9aaf0001b356', '2018-04-23 13:43:00', 1, '0', 'f4eb5041-8f60-4d9b-8ed1-848d5771174c', NULL, 1, 1800, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('371117c9-7207-43dd-9b64-aff65d748867', '2018-07-06 14:57:17', -1, '0', '3941df9e-4d01-4bce-81f8-12dea263db79', NULL, -1, 10000, 'GERENCIA', NULL, NULL),
('37ef6bb8-2bef-4f44-bb1f-a5adf4caef38', '2018-07-16 15:48:39', -1, '0', '9621839b-65fb-49cd-96f3-9e1fa0c11449', NULL, -1, 15000, 'GERENCIA', NULL, NULL),
('38446614-30b8-426f-b234-73006728c02e', '2018-05-19 08:58:00', -2, '0', '81109003-89b0-4da1-8ab2-d0f06ffa839a', NULL, -1, 50000, 'GERENCIA', '73e8a2eb-456d-4b1e-856f-0bdc19a998e5', ''),
('3a546cd4-4c78-4b31-a86a-2b0dd9d88dcb', '2018-05-21 18:10:02', -1, '0', 'd80aef84-aec7-4965-9541-efffa57db37f', NULL, -1, 15000, 'GERENCIA', NULL, NULL),
('3a7bae17-c71b-4f3a-82bc-24d3f3ae7ae9', '2018-05-05 14:14:29', -1, '0', '6b7efc03-a955-4269-9ca5-ca2bf04c3d48', NULL, -1, 3000, 'GERENCIA', NULL, NULL),
('3adc4029-fcd4-44ef-bc9f-70b9b138a85e', '2018-06-09 15:26:05', -1, '0', 'b54a4b44-eb73-4d79-8fd0-30c8b87ec4ef', NULL, -10, 400, 'GERENCIA', NULL, NULL),
('3b72591c-a01d-4e03-89ce-81127ff0e31a', '2018-07-06 15:22:53', -1, '0', '3f43d708-b1c2-48d6-9929-d25b0ee93152', NULL, -3, 5000, 'GERENCIA', NULL, NULL),
('3be690ed-ce71-40a1-b5f6-ced9789edff1', '2018-05-08 18:11:25', 2, '0', 'abfac013-6f59-49a4-b1b8-233f3fb4971f', NULL, 1, 1000, 'GERENCIA', NULL, NULL),
('3bea601c-b07e-4873-a722-16a0d6c48f58', '2018-05-11 11:42:18', -1, '0', 'd80aef84-aec7-4965-9541-efffa57db37f', NULL, -2, 15000, 'GERENCIA', NULL, NULL),
('3c2d9060-1eb5-41d1-af10-cf1db8486a75', '2018-04-26 17:48:00', 1, '0', 'b93a886a-d95e-48af-a3dc-7aa051ef3a19', NULL, 2, 0, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('3d8c905e-6a43-456e-9ddc-4b3bb9491693', '2018-05-05 14:14:29', -1, '0', 'dda3b042-f1ec-4cf2-8b38-244a9c32f289', NULL, -7, 10000, 'GERENCIA', NULL, NULL),
('3e655493-a391-49f3-b910-d25ead28df4f', '2018-05-28 11:27:04', -1, '0', 'dda3b042-f1ec-4cf2-8b38-244a9c32f289', NULL, -1, 10000, 'GERENCIA', NULL, NULL),
('3f946dd5-e2d4-496d-a5a6-673b0497709c', '2018-04-23 15:01:00', -2, '0', '342fa52c-7c53-42a6-a2a6-63cfaac7671c', NULL, -1, 70000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('3fb321cd-72aa-4f48-8bc3-ed529031f042', '2018-04-26 13:40:55', -1, '0', '3b7394d3-05aa-4f4e-a115-4f8cb88884ac', NULL, -1, 195000, 'GERENCIA', NULL, NULL),
('41196018-d051-40d5-ab44-a029bba51f4a', '2018-05-26 10:52:51', 2, '0', 'dda3b042-f1ec-4cf2-8b38-244a9c32f289', NULL, 1, 10000, 'GERENCIA', NULL, NULL),
('41b6c727-b737-41e2-a9d5-3af11bff8b05', '2018-04-23 13:24:00', 1, '0', 'ef2d0ded-7b0f-49e2-9c26-b6f2582757c9', NULL, 1, 65000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('41fb3c56-3cce-4d80-acc1-a16732a3ef8b', '2018-06-05 14:08:47', -1, '0', '15bd0371-6990-43ea-832d-9e55eb3b7916', NULL, -1, 80000, 'GERENCIA', NULL, NULL),
('42f4ff16-8405-4d42-b632-a19d8c060c81', '2018-04-26 17:45:00', 1, '0', 'a8fce4e3-9f66-44bb-9925-709275fddb51', NULL, 15, 5000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('44768024-906b-439e-bbc9-0e417a87b241', '2018-04-23 13:43:00', 1, '0', 'f4eb5041-8f60-4d9b-8ed1-848d5771174c', NULL, 1, 1800, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('44ce1345-0be6-4ac3-b4e5-7ee5cbbdaffb', '2018-08-01 10:28:32', -1, '0', 'dda3b042-f1ec-4cf2-8b38-244a9c32f289', NULL, -3, 10000, 'GERENCIA', NULL, NULL),
('45476ae4-4cba-4e85-9c24-6937b6358b77', '2018-04-23 15:00:00', -3, '0', '76b24bf0-14a4-498a-a9d3-b9fe55991f4e', NULL, -1, 17500, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('4735d4a0-b9c1-4d9f-ae80-798865c64bc2', '2018-05-31 08:54:56', -1, '0', '6b7efc03-a955-4269-9ca5-ca2bf04c3d48', NULL, -1, 3000, 'GERENCIA', NULL, NULL),
('47c0b9af-0562-4346-8f76-7e8e2859d80f', '2018-04-23 15:51:00', 1, '0', '2bc44efd-bea7-4d31-ab55-f85215ed491d', NULL, 4, 55000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('47f72f09-69e6-470f-878a-814fdc157cd0', '2018-05-05 14:14:30', 2, '0', 'dda3b042-f1ec-4cf2-8b38-244a9c32f289', NULL, 7, 10000, 'GERENCIA', NULL, NULL),
('480a7e7b-c7d5-4b0b-bae8-62482ac9a1a6', '2018-04-23 15:00:00', 1, '0', '76b24bf0-14a4-498a-a9d3-b9fe55991f4e', NULL, 7, 17500, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('4ab34db4-85ca-4ce8-ac7e-8671220b2c29', '2018-06-12 09:37:22', -1, '0', '4190711b-4381-4742-9730-489f4bd02e05', NULL, -1, 25000, 'GERENCIA', NULL, NULL),
('4c3cf408-cb17-40b4-acf6-75bd4b18877d', '2018-04-23 13:48:00', 1, '0', '39949465-403b-455f-9077-c352fadbbfcd', NULL, 10, 24000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('4cc0c47f-b12e-4e9c-a1aa-c0c01613490f', '2018-04-23 14:15:00', 1, '0', 'aae1a692-d6ed-44ea-8350-096a9f308e65', NULL, 1, 280000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('4d870599-8c81-4584-887e-043b1012b495', '2018-04-23 13:24:00', 1, '0', 'ef2d0ded-7b0f-49e2-9c26-b6f2582757c9', NULL, 1, 65000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('4f2a9191-eeca-4882-b33f-8279838ce430', '2018-04-23 18:08:00', 1, '0', '8574460b-daa1-4be7-b42f-86def1f7e5aa', NULL, 1220, 180000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('4f331aa5-dd33-47aa-86ef-a86003eacc5f', '2018-05-08 18:06:08', -1, '0', 'abfac013-6f59-49a4-b1b8-233f3fb4971f', NULL, -1, 1000, 'GERENCIA', NULL, NULL),
('4f7cdf3a-3095-4a06-aefd-fe1640af2f95', '2018-04-23 17:41:00', -2, '0', '8e98d6c6-631a-4a5c-9e22-3cf615373b49', NULL, -1, 70000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('4faea7f6-8b49-427b-b672-560f9c47342e', '2018-04-23 15:50:00', 1, '0', '5fc18d75-75dd-4230-9e2f-c12127ad7ffc', NULL, 100, 250, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('505040d0-dd9b-405a-b413-e7ddfc2bdace', '2018-04-23 14:46:00', 1, '0', '0f3f6dc5-b2a8-44c9-b8de-24bbdcc49d73', NULL, 2, 130000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('50564d7e-0076-49cf-b39a-4137898779f6', '2018-06-11 09:43:25', 2, '0', 'ce638b72-3d7f-4558-9f7a-3d9a3f7e2cec', NULL, 2, 65000, 'GERENCIA', NULL, NULL),
('50ad7a74-5a13-4fae-afde-947ee5d6f68e', '2018-06-11 09:43:25', 2, '0', 'dda3b042-f1ec-4cf2-8b38-244a9c32f289', NULL, 2, 10000, 'GERENCIA', NULL, NULL),
('5116252d-3051-4635-a979-45e10018ae19', '2018-04-23 13:41:00', 1, '0', 'f4eb5041-8f60-4d9b-8ed1-848d5771174c', NULL, 1, 1800, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('512a573f-2430-45fc-baf3-d57fd83e05aa', '2018-05-02 11:45:11', -1, '0', '8e3f67a3-8341-499d-8082-b397ae0a9a7e', NULL, -2, 90000, 'GERENCIA', NULL, NULL),
('52dc1db6-dc8f-4942-8db6-b788b6f56d94', '2018-05-28 11:27:04', -1, '0', 'd8dce3ae-39d4-4580-a347-1a002ba65d7f', NULL, -1, 11000, 'GERENCIA', NULL, NULL),
('53054ad8-c1fb-4bcd-b023-1a33a9546a35', '2018-04-26 17:50:00', 1, '0', '26629ed1-9d86-46bc-8c9a-8271847c1a78', NULL, 1, 0, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('531e82b5-a289-4535-befb-3365d3c9a1a8', '2018-05-05 14:14:04', 2, '0', '2031c239-3158-45e4-852d-cc1c14956b6a', NULL, 1, 38000, 'GERENCIA', NULL, NULL),
('532903a2-bbd3-4cdf-b9c9-27c391b60fa8', '2018-04-23 14:43:00', 1, '0', '4190711b-4381-4742-9730-489f4bd02e05', NULL, 19, 18000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('534df49a-63e2-4ffb-a6de-f62645fa99ff', '2018-04-26 17:50:00', 1, '0', '1fe7037a-89ac-45c6-9db1-c5882cc62228', NULL, 1, 0, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('53e9e7ab-1b4b-4b39-8e57-779f01dec771', '2018-08-02 15:44:21', -1, '0', '9621839b-65fb-49cd-96f3-9e1fa0c11449', NULL, -1, 15000, 'GERENCIA', NULL, NULL),
('555639df-3882-44af-9c34-40108b28af98', '2018-04-26 13:40:55', -1, '0', '76b24bf0-14a4-498a-a9d3-b9fe55991f4e', NULL, -1, 25000, 'GERENCIA', NULL, NULL),
('56040c3a-84ee-4c1d-9633-5bb4c5ec6b46', '2018-05-22 11:16:44', -1, '0', '5fc18d75-75dd-4230-9e2f-c12127ad7ffc', NULL, -10, 500, 'GERENCIA', NULL, NULL),
('5651cedd-fca2-4d20-93ea-27216aebb5bc', '2018-04-23 17:59:00', 1, '0', 'dda3b042-f1ec-4cf2-8b38-244a9c32f289', NULL, 111, 6000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('56f91fc7-8da6-4e00-a3bb-d8ca976ec424', '2018-07-06 16:14:42', -1, '0', 'b54a4b44-eb73-4d79-8fd0-30c8b87ec4ef', NULL, -4, 400, 'GERENCIA', NULL, NULL),
('57443d88-8f27-4907-9b72-4b324b2ca675', '2018-04-26 17:52:00', 1, '0', 'f8e1ee31-0109-4db6-a563-aaad7341ff53', NULL, 1, 0, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('575a8aa1-483f-4505-bf18-22b9ed8d5c84', '2018-05-17 16:02:32', -1, '0', '61c6b4b9-8986-4c45-862c-dee267867b89', NULL, -1, 15000, 'GERENCIA', NULL, NULL),
('58e82d27-92c1-431b-9bef-a13b6c9a01a5', '2018-06-19 14:18:27', -1, '0', 'ee1ef151-1f9b-48a1-96cc-3de25fbb481e', NULL, -1, 180000, 'GERENCIA', NULL, NULL),
('59f03e8e-321f-453a-a7a4-bfcbd17e9278', '2018-04-23 14:55:00', -3, '0', 'c8c70dd3-7a47-44db-934d-8ee11819dc17', NULL, -1, 35000, 'GERENCIA', '28a90c40-987f-409d-92b5-7acb86ac4684', ''),
('5a5de978-e490-427f-bb41-a1c4332604b0', '2018-05-26 10:52:51', 2, '0', '3f43d708-b1c2-48d6-9929-d25b0ee93152', NULL, 1, 5000, 'GERENCIA', NULL, NULL),
('5a69287a-2081-4892-bdb4-a263cba3910c', '2018-04-23 15:54:00', 1, '0', 'dda3b042-f1ec-4cf2-8b38-244a9c32f289', NULL, 1, 6000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('5ab7c11a-9a02-434d-841e-df444c72ff85', '2018-04-23 13:52:00', 1, '0', 'a5abe161-9651-4d2a-bb83-722c4fec5d58', NULL, 1, 165000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('5b120562-e6c3-48c9-b260-19062956ebaf', '2018-04-23 13:31:00', 1, '0', 'c3934860-bef3-4b73-adcd-2efdf629def1', NULL, 1, 15000, 'GERENCIA', '28a90c40-987f-409d-92b5-7acb86ac4684', ''),
('5bf140ae-f5c5-4877-aac9-fc31734d810a', '2018-04-23 17:58:00', -2, '0', 'c7b19666-822f-400a-842f-60bfca4d8980', NULL, -1, 156000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('5f2b6517-3ecc-4ade-8421-8af6f0118ffe', '2018-07-05 09:47:40', -1, '0', '2031c239-3158-45e4-852d-cc1c14956b6a', NULL, -1, 38000, 'GERENCIA', NULL, NULL),
('5fe8c034-43e3-4a3e-b91f-649efc2281b6', '2018-05-08 18:09:08', -1, '0', 'abfac013-6f59-49a4-b1b8-233f3fb4971f', NULL, -1, 0, 'CAJA ADMIN', NULL, NULL),
('602ffc4d-d0d4-489c-8af9-e69bc0ed1108', '2018-04-26 17:52:00', 1, '0', '477b129b-f25d-4fe3-b122-c9cb1a2bb005', NULL, 1, 0, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('60c37ea4-35a1-41f2-be58-8d822d27fef6', '2018-05-21 15:54:00', 1, '0', '81109003-89b0-4da1-8ab2-d0f06ffa839a', NULL, 3, 50000, 'GERENCIA', '73e8a2eb-456d-4b1e-856f-0bdc19a998e5', ''),
('611d82df-e8d3-4d84-ad03-802a7c19fc73', '2018-04-23 13:46:00', 1, '0', '16a10d31-af9a-410e-a72d-650bacc52a59', NULL, 20, 2000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('6170d790-1acb-4814-a0e2-b21b7c8d49d6', '2018-04-23 17:58:00', -2, '0', 'd8dce3ae-39d4-4580-a347-1a002ba65d7f', NULL, -1, 6000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('62f5ec45-3e6c-4e71-ba51-153faca49045', '2018-05-08 16:32:00', -2, '0', 'a7b3e1d8-80dc-41ae-840c-7c7e351e50f3', NULL, -1, 210000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('63042580-efa6-4502-bb8c-c996ba5eb43d', '2018-05-02 15:09:00', -1, '0', 'ee1ef151-1f9b-48a1-96cc-3de25fbb481e', NULL, -1, 180000, 'GERENCIA', NULL, NULL),
('63adb598-7acc-41e5-a90c-53f1a7d1582a', '2018-04-23 14:47:00', 1, '0', '342fa52c-7c53-42a6-a2a6-63cfaac7671c', NULL, 1, 45000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('642a96d9-cf93-46ef-819b-b42f114ebbf5', '2018-06-07 17:27:26', -1, '0', 'aac4c6b0-f568-4374-afc3-d4fa1ea6c998', NULL, -1, 7000, 'GERENCIA', NULL, NULL),
('6498c05c-bd83-4e60-8f94-e0d91c643526', '2018-04-23 13:43:00', 1, '0', 'f4eb5041-8f60-4d9b-8ed1-848d5771174c', NULL, 1, 1800, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('656eb413-efdb-4361-bcd8-93645724ac5e', '2018-04-26 17:49:00', 1, '0', '08e09e9d-42eb-4690-90de-d19b6b8a0052', NULL, 1, 0, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('660c296d-a0b4-4dcd-bb2d-ff145e96a049', '2018-04-23 15:15:00', 1, '0', '3941df9e-4d01-4bce-81f8-12dea263db79', NULL, 1, 4000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('685b07f8-017b-4034-9a0b-9958b38cf8b6', '2018-04-23 13:43:00', 1, '0', 'f4eb5041-8f60-4d9b-8ed1-848d5771174c', NULL, 1, 1800, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('68bfe18f-5c4a-4f99-a551-b536e22803f8', '2018-05-05 13:46:01', 2, '0', '8e3f67a3-8341-499d-8082-b397ae0a9a7e', NULL, 2, 90000, 'GERENCIA', NULL, NULL),
('69645b65-7bfa-4020-acde-690dafb84558', '2018-04-26 17:55:00', 1, '0', '23539908-f5de-4db6-a47d-824ade6b2663', NULL, 1, 0, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('6ada69e6-23c2-4119-9110-a98faf808c93', '2018-05-08 17:36:02', -1, '0', 'abfac013-6f59-49a4-b1b8-233f3fb4971f', NULL, -1, 0, 'GERENCIA', NULL, NULL),
('6b33afb2-8a55-4ea0-81d5-3144a3993789', '2018-05-30 15:59:07', -1, '0', '2210ff62-20d3-499b-ab64-1344d6b02da5', NULL, -2, 5000, 'GERENCIA', NULL, NULL),
('6d9f3efb-fe84-4340-9247-9c4c9dd20aea', '2018-04-26 18:05:00', 1, '0', '89cda22c-1255-4946-bd31-92e92ae3c298', NULL, 2, 35000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('6dadde03-fc95-4714-ac16-c9088d22fb15', '2018-05-21 10:10:17', -1, '0', 'f65236e2-5a72-405a-8ca8-9a1ae71a0888', NULL, -1, 850000, 'GERENCIA', NULL, NULL),
('6e2b2c0e-1d13-4d72-b21c-a22b7799bf54', '2018-06-19 14:18:27', -1, '0', 'dda3b042-f1ec-4cf2-8b38-244a9c32f289', NULL, -4, 10000, 'GERENCIA', NULL, NULL),
('6e99edbf-9737-4361-9f94-de9c005f42fd', '2018-04-23 13:43:00', 1, '0', 'f4eb5041-8f60-4d9b-8ed1-848d5771174c', NULL, 1, 1800, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('6fd94d21-754e-4ca8-930d-b03458b640f4', '2018-04-26 18:04:00', 1, '0', '0cac3866-4100-48ac-a229-588d49808ec9', NULL, 1, 130000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('6fee20ed-3ad0-47bf-b23b-9992f5d7d2e9', '2018-06-11 09:52:07', -1, '0', '3f43d708-b1c2-48d6-9929-d25b0ee93152', NULL, -5, 5000, 'GERENCIA', NULL, NULL),
('704e9a38-e7e5-4ea9-9b59-038130ec6967', '2018-05-05 14:14:30', 2, '0', 'd8dce3ae-39d4-4580-a347-1a002ba65d7f', NULL, 7, 11000, 'GERENCIA', NULL, NULL),
('70ca3fd7-b81a-4943-bcb4-800e37910c94', '2018-05-11 11:42:18', -1, '0', '9621839b-65fb-49cd-96f3-9e1fa0c11449', NULL, -2, 15000, 'GERENCIA', NULL, NULL),
('7178dea3-afd9-4442-b83f-1e3cb896db5b', '2018-05-07 15:03:38', -1, '0', '15bd0371-6990-43ea-832d-9e55eb3b7916', NULL, -1, 80000, 'GERENCIA', NULL, NULL),
('71870234-c53d-4c43-af9a-f78cecb5fef4', '2018-04-23 15:51:00', 1, '0', 'd8dce3ae-39d4-4580-a347-1a002ba65d7f', NULL, 1, 6000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('71ae8d65-d830-4c77-b03c-df30f35582e2', '2018-04-23 13:31:00', 1, '0', 'c3934860-bef3-4b73-adcd-2efdf629def1', NULL, 1, 15000, 'GERENCIA', '28a90c40-987f-409d-92b5-7acb86ac4684', ''),
('731e1a01-d9f8-4983-938d-539f1756e1d5', '2018-04-23 13:53:00', 1, '0', '08e2052d-cbc8-48c7-9cec-d0c24d76a287', NULL, 2, 20000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('73552742-f340-4f0d-835a-07704811d3cd', '2018-04-23 13:43:00', 1, '0', 'f4eb5041-8f60-4d9b-8ed1-848d5771174c', NULL, 1, 1800, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('73b2fe44-9074-47d8-a86d-a6887df35f50', '2018-08-01 10:28:32', -1, '0', 'ce638b72-3d7f-4558-9f7a-3d9a3f7e2cec', NULL, -1, 65000, 'GERENCIA', NULL, NULL),
('769add80-c94a-43e1-864f-f4b420cc585a', '2018-04-23 17:41:00', -2, '0', '26bcebd0-96bf-423d-b669-0c18cd912827', NULL, -1, 50000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('778e944c-55e5-4b4b-93cf-0cc03b2a337d', '2018-04-23 14:15:00', -3, '0', 'aae1a692-d6ed-44ea-8350-096a9f308e65', NULL, -3, 280000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('79f142fe-77e6-48ac-ab57-276f7b2a6bff', '2018-04-23 13:41:00', 1, '0', 'f4eb5041-8f60-4d9b-8ed1-848d5771174c', NULL, 1, 1800, 'GERENCIA', '28a90c40-987f-409d-92b5-7acb86ac4684', ''),
('7a4ce742-27d7-466f-95f5-3be734f60d66', '2018-05-05 14:08:26', -1, '0', 'c7b19666-822f-400a-842f-60bfca4d8980', NULL, -1, 280000, 'GERENCIA', NULL, NULL),
('7af1730a-8ef5-4440-8238-b41047e9f842', '2018-07-09 09:34:19', -1, '0', '5fc18d75-75dd-4230-9e2f-c12127ad7ffc', NULL, -6, 500, 'GERENCIA', NULL, NULL),
('7b24c5f1-f65b-4e32-a7cb-6fc8b9a8be07', '2018-04-23 13:23:00', 1, '0', 'ef2d0ded-7b0f-49e2-9c26-b6f2582757c9', NULL, 1, 65000, 'BODEGA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('7b892d8e-34a0-4a1e-94f1-6456502ac999', '2018-05-16 16:03:54', -1, '0', '97ba6646-6dc8-4abf-9e7d-5bc84794bf20', NULL, -1, 500000, 'GERENCIA', NULL, NULL),
('7bfc7082-a5d5-4474-9581-46e84ba3f9e2', '2018-05-25 16:27:16', -1, '0', 'd8dce3ae-39d4-4580-a347-1a002ba65d7f', NULL, -1, 11000, 'GERENCIA', NULL, NULL),
('7c199b59-0779-4cbd-a8b1-304042f3d1ef', '2018-04-23 13:46:00', -3, '0', '16a10d31-af9a-410e-a72d-650bacc52a59', NULL, -2, 2000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('7f391a1e-6cde-4fb9-90c1-a32480f96df9', '2018-04-23 13:44:00', 1, '0', '16a10d31-af9a-410e-a72d-650bacc52a59', NULL, 10, 2000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('7f816c09-3be1-44c9-a939-c5884cb3efb4', '2018-04-23 13:34:00', 1, '0', '3b7394d3-05aa-4f4e-a115-4f8cb88884ac', NULL, 1, 165000, 'GERENCIA', '28a90c40-987f-409d-92b5-7acb86ac4684', ''),
('801178ac-a2dd-4dfd-9070-36b8486755b0', '2018-04-26 17:48:00', 1, '0', '8c50663a-cd2a-4eb1-8666-1cd784e9fb79', NULL, 4, 0, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('80bcf48e-0153-41ae-95f9-77c605109266', '2018-04-26 17:46:00', 1, '0', '7ea10e52-23cc-48d7-8273-dc405cc02a9f', NULL, 16, 250, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('80dbd705-229e-427e-9395-ed1b822cce71', '2018-04-23 14:11:00', 1, '0', '8e3f67a3-8341-499d-8082-b397ae0a9a7e', NULL, 14, 35000, 'GERENCIA', 'e7343158-b7d1-4e15-a3f9-928640e7ec83', ''),
('829ca994-ac13-479e-9892-c84ad81cb3f3', '2018-05-28 11:27:04', -1, '0', 'b4d9023c-6a17-4f94-95af-fa5685cfdc58', NULL, -1, 90000, 'GERENCIA', NULL, NULL),
('836462f2-9b55-48e2-bcf3-1ba365572cc4', '2018-04-23 13:31:00', 1, '0', 'c3934860-bef3-4b73-adcd-2efdf629def1', NULL, 1, 15000, 'GERENCIA', '28a90c40-987f-409d-92b5-7acb86ac4684', ''),
('84d343cd-f403-4052-8e63-7f448c380ac7', '2018-05-11 14:13:00', 1, '0', 'dd07a061-237e-4322-a01f-ae6356b538a9', NULL, 1, 350000, 'GERENCIA', 'dce6204b-3dd1-4109-828f-b179520fed91', ''),
('85750006-d3f8-446a-a7e7-80e1ede49f67', '2018-04-23 18:05:00', 1, '0', 'f23c026f-4975-4bdd-91e9-fe2ff31cfd23', NULL, 5, 50000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('85de3efc-901e-405f-9e14-0fc7bb53db26', '2018-05-08 15:58:00', 1, '0', 'a7b3e1d8-80dc-41ae-840c-7c7e351e50f3', NULL, 1, 210000, 'GERENCIA', '4af9e015-65e6-4dec-81c7-4f31278f1b68', ''),
('85e506e3-c836-46a5-ab66-28a4cfc7dee9', '2018-06-11 09:52:07', -1, '0', '2210ff62-20d3-499b-ab64-1344d6b02da5', NULL, -6, 5000, 'GERENCIA', NULL, NULL),
('85fb0881-ebdf-40e8-bf6d-9d41d079b076', '2018-04-23 15:55:00', -2, '0', '3f43d708-b1c2-48d6-9929-d25b0ee93152', NULL, -1, 1500, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('866968a1-80e2-43bc-850f-bfe75cc66925', '2018-04-23 13:43:00', 1, '0', 'f4eb5041-8f60-4d9b-8ed1-848d5771174c', NULL, 1, 1800, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('86ca5397-56bb-4a38-9abd-34e3c9dc274c', '2018-04-23 17:49:00', -2, '0', '5fc18d75-75dd-4230-9e2f-c12127ad7ffc', NULL, -16, 250, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('8761c337-f628-4b84-8305-8d4fb9a8b7e3', '2018-06-11 09:52:07', -1, '0', 'e5478b71-9b0e-43a7-998f-4435e10a294c', NULL, -1, 90000, 'GERENCIA', NULL, NULL),
('8959b0b3-3918-4d96-9da0-3daf8a609da1', '2018-05-07 09:28:53', -1, '0', 'c7b19666-822f-400a-842f-60bfca4d8980', NULL, -1, 280000, 'GERENCIA', NULL, NULL),
('8a10c3c6-87bd-4d03-b330-e692319a83a5', '2018-04-26 17:55:00', 1, '0', 'cdbe7ac3-455f-41ca-8bf8-163ea104914a', NULL, 1, 0, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('8a263027-c70d-4b27-bce0-f15d6d4e5244', '2018-08-02 15:44:21', -1, '0', '61c6b4b9-8986-4c45-862c-dee267867b89', NULL, -1, 15000, 'GERENCIA', NULL, NULL),
('8c5612c0-5185-4a6a-82d2-11537d9292e0', '2018-04-23 13:43:00', 1, '0', 'f4eb5041-8f60-4d9b-8ed1-848d5771174c', NULL, 1, 1800, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('8cd27596-adef-46d5-8f84-093412ac8f8c', '2018-04-23 14:47:00', 1, '0', '26bcebd0-96bf-423d-b669-0c18cd912827', NULL, 1, 50000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('8e46e932-db3e-47c3-97f7-a661b21a53dd', '2018-04-23 13:40:00', 1, '0', 'f65236e2-5a72-405a-8ca8-9a1ae71a0888', NULL, 1, 790000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('8f0962bb-9ba8-43e0-888f-c35836a3b9ce', '2018-04-23 13:43:00', 1, '0', 'f4eb5041-8f60-4d9b-8ed1-848d5771174c', NULL, 1, 1800, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('8f1085b3-4b6c-4a6f-b234-b19d5421ea79', '2018-04-23 13:32:00', 1, '0', '326f0b79-457f-4125-8365-84874fb3c303', NULL, 1, 205000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('90850cb8-2cdc-4fa1-a06b-d1ac5b980fde', '2018-04-26 17:51:00', 1, '0', '4ebb1e34-6595-4961-acdb-82d679f6e46d', NULL, 3, 0, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('90b912a8-463c-4184-aabb-06c42e6fd3b5', '2018-05-08 15:57:00', 1, '0', 'a7b3e1d8-80dc-41ae-840c-7c7e351e50f3', NULL, 3, 210000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('9183964f-f7dd-410a-9419-dae8f3fe0198', '2018-04-26 18:04:00', 1, '0', '6b7efc03-a955-4269-9ca5-ca2bf04c3d48', NULL, 4, 3000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('929c24a4-423e-416d-9686-a93f6bd8bbb7', '2018-04-26 17:49:00', 1, '0', 'e8da77c6-432c-47bd-aad3-919cd4ff6ab9', NULL, 1, 0, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('9323c6a0-194e-4583-bc28-27b96c04cbd8', '2018-07-06 16:11:35', -1, '0', 'd8dce3ae-39d4-4580-a347-1a002ba65d7f', NULL, -1, 11000, 'GERENCIA', NULL, NULL),
('936c7a18-54eb-4eb7-9303-528ba86c1e98', '2018-04-23 13:48:00', 1, '0', '76b24bf0-14a4-498a-a9d3-b9fe55991f4e', NULL, 31, 17500, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('9392c3fe-bbcb-46cd-bca8-561a4932f2bd', '2018-04-23 13:49:00', 1, '0', '9621839b-65fb-49cd-96f3-9e1fa0c11449', NULL, 9, 4000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('95204d8a-d902-4173-a40c-1df53e1fc780', '2018-05-19 08:57:00', 1, '0', '81109003-89b0-4da1-8ab2-d0f06ffa839a', NULL, 1, 50000, 'GERENCIA', '73e8a2eb-456d-4b1e-856f-0bdc19a998e5', ''),
('952dc373-12f5-4a8f-ac24-39638aba4be5', '2018-05-19 08:57:00', 1, '0', '81109003-89b0-4da1-8ab2-d0f06ffa839a', NULL, 1, 50000, 'GERENCIA', '73e8a2eb-456d-4b1e-856f-0bdc19a998e5', ''),
('9604c576-5e13-4397-b92a-b4caf54b11c9', '2018-04-23 14:55:00', 1, '0', 'c8c70dd3-7a47-44db-934d-8ee11819dc17', NULL, 1, 25000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('96478025-edac-4b9e-82ac-7946878e6665', '2018-05-05 13:43:07', 2, '0', 'b4d9023c-6a17-4f94-95af-fa5685cfdc58', NULL, 5, 210000, 'GERENCIA', NULL, NULL),
('965c33bb-5fd8-44ad-8840-c2f447bc6b8c', '2018-04-23 14:14:00', -3, '0', 'aae1a692-d6ed-44ea-8350-096a9f308e65', NULL, -1, 480000, 'GERENCIA', 'e7343158-b7d1-4e15-a3f9-928640e7ec83', ''),
('96b7a5bb-18a2-4b4b-bda1-4f6fa4a05bcf', '2018-06-08 09:21:59', -1, '0', 'f4eb5041-8f60-4d9b-8ed1-848d5771174c', NULL, -1, 4000, 'GERENCIA', NULL, NULL),
('9761230d-16e4-46cc-8de0-cfdddf819fd1', '2018-04-23 13:43:00', 1, '0', 'f4eb5041-8f60-4d9b-8ed1-848d5771174c', NULL, 1, 1800, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('983bb2af-9e66-401a-a70f-0e14161e5912', '2018-04-23 18:06:00', 1, '0', '173c9da7-791e-410d-9e1f-8825a1e69e07', NULL, 4, 180000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('99cb7901-3c7c-487c-b235-7289221e1796', '2018-04-26 14:27:16', -1, '0', '3f43d708-b1c2-48d6-9929-d25b0ee93152', NULL, -3, 5000, 'GERENCIA', NULL, NULL),
('99e6d167-9f16-4c96-ad1e-40af0745903d', '2018-04-23 13:40:00', 1, '0', 'f4eb5041-8f60-4d9b-8ed1-848d5771174c', NULL, 1, 1800, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('9a0ad9d7-1602-4e53-b372-e63a2ce712ba', '2018-04-23 17:53:00', 1, '0', 'b4d9023c-6a17-4f94-95af-fa5685cfdc58', NULL, 1, 110000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('9a0b482d-0962-445d-8338-d38a73297971', '2018-07-17 09:01:12', -1, '0', '173c9da7-791e-410d-9e1f-8825a1e69e07', NULL, -1, 280000, 'GERENCIA', NULL, NULL),
('9a12474c-3577-4275-b383-9b7ca015c5c5', '2018-04-23 13:43:00', 1, '0', 'f4eb5041-8f60-4d9b-8ed1-848d5771174c', NULL, 1, 1800, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('9a85d0c1-bb27-41d4-bed7-0f8a8cc6d589', '2018-06-09 15:43:04', -1, '0', 'd8dce3ae-39d4-4580-a347-1a002ba65d7f', NULL, -1, 11000, 'GERENCIA', NULL, NULL),
('9db82e1d-2781-45b5-990b-a03df7ed1ba4', '2018-04-23 13:43:00', 1, '0', 'f4eb5041-8f60-4d9b-8ed1-848d5771174c', NULL, 1, 1800, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('9e73a1e2-ecb7-4493-9e17-f06895f9d8f5', '2018-08-01 10:28:32', -1, '0', '0f3f6dc5-b2a8-44c9-b8de-24bbdcc49d73', NULL, -1, 230000, 'GERENCIA', NULL, NULL),
('a0eadf92-99ef-45c9-b060-8e15ccb028a7', '2018-04-23 14:15:00', 1, '0', 'b7ca7357-fb1a-4bbf-b250-47443c34a90b', NULL, 3, 128000, 'GERENCIA', '28a90c40-987f-409d-92b5-7acb86ac4684', ''),
('a2563ecd-fd73-481c-89b1-6e0030dba47f', '2018-04-23 15:50:00', 1, '0', '2bc44efd-bea7-4d31-ab55-f85215ed491d', NULL, 1, 55000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('a392c4f5-2aea-4d47-a28b-705b8a9248df', '2018-06-19 14:18:27', -1, '0', 'c7b19666-822f-400a-842f-60bfca4d8980', NULL, -1, 280000, 'GERENCIA', NULL, NULL),
('a3c4231b-a471-4c65-9b44-cc5c40975280', '2018-04-23 14:12:00', 1, '0', 'aae1a692-d6ed-44ea-8350-096a9f308e65', NULL, 6, 280000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('a3e74774-cb71-40eb-8b45-8f54dcf9335c', '2018-04-26 14:18:27', -1, '0', 'e5478b71-9b0e-43a7-998f-4435e10a294c', NULL, -1, 90000, 'GERENCIA', NULL, NULL),
('a3f16c6b-bea2-4411-b19e-906a905787f0', '2018-04-26 18:04:00', 1, '0', '2210ff62-20d3-499b-ab64-1344d6b02da5', NULL, 10, 5000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('a4d4b8a9-b73a-4ece-ae87-e24b474b15cc', '2018-06-19 14:18:27', -1, '0', 'd8dce3ae-39d4-4580-a347-1a002ba65d7f', NULL, -4, 11000, 'GERENCIA', NULL, NULL),
('a5bd0170-0c2b-4aba-a6b5-7c1c65a2a230', '2018-04-23 13:43:00', 1, '0', 'f4eb5041-8f60-4d9b-8ed1-848d5771174c', NULL, 1, 1800, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('a60132d4-1042-4d3f-9e1a-b2aa893f1d21', '2018-04-23 13:43:00', 1, '0', 'f4eb5041-8f60-4d9b-8ed1-848d5771174c', NULL, 1, 1800, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('a676797c-0f86-45b2-9ee9-ceca28758297', '2018-04-23 13:43:00', 1, '0', 'f4eb5041-8f60-4d9b-8ed1-848d5771174c', NULL, 1, 1800, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('a6810ea8-e965-4536-b1cc-b6e6039e4ceb', '2018-04-23 13:57:00', -3, '0', '2031c239-3158-45e4-852d-cc1c14956b6a', NULL, -1, 38000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('a81d1572-e92a-4a98-8ba6-4e82723885ab', '2018-04-23 13:36:00', 1, '0', '3b7394d3-05aa-4f4e-a115-4f8cb88884ac', NULL, 1, 165000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('a855140c-151e-4036-af71-7d68bb22b6df', '2018-05-02 17:17:33', -1, '0', '39949465-403b-455f-9077-c352fadbbfcd', NULL, -1, 32000, 'GERENCIA', NULL, NULL),
('a9332765-7c77-4f29-a86c-831979de2211', '2018-08-02 14:31:07', -1, '0', '61c6b4b9-8986-4c45-862c-dee267867b89', NULL, -1, 10000, 'GERENCIA', NULL, NULL),
('a96a93ce-e781-49f8-b2ee-1ee2fe4db97f', '2018-04-26 17:49:00', 1, '0', '7b237373-319b-4f0a-8fbd-efbaddc282ad', NULL, 6, 0, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('aa6fdd8e-edd1-4cec-8d92-4f5f7d434f4a', '2018-04-23 14:37:00', 1, '0', '4152580f-d9b5-4a49-a8bf-ba10ff0c82da', NULL, 8, 15000, 'GERENCIA', '28a90c40-987f-409d-92b5-7acb86ac4684', ''),
('abb84411-99de-4af6-a31b-644719774247', '2018-04-23 13:43:00', 1, '0', 'f4eb5041-8f60-4d9b-8ed1-848d5771174c', NULL, 1, 1800, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('abc51360-60cb-4661-9f4b-61f8b9ec182c', '2018-04-23 14:16:00', 1, '0', 'c7b19666-822f-400a-842f-60bfca4d8980', NULL, 6, 156000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('ac75e90d-cfb9-42cd-9175-84d4308d6abf', '2018-04-23 14:41:00', 1, '0', '9621839b-65fb-49cd-96f3-9e1fa0c11449', NULL, 6, 4000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('ae3da20c-166c-441d-b5ea-66679a918b50', '2018-05-19 14:28:52', -1, '0', '15bd0371-6990-43ea-832d-9e55eb3b7916', NULL, -1, 80000, 'GERENCIA', NULL, NULL),
('ae70f17d-c5e6-45e8-8154-83a9bec9d47f', '2018-04-23 17:57:00', -2, '0', 'ce638b72-3d7f-4558-9f7a-3d9a3f7e2cec', NULL, -3, 28000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('af283499-e758-45e3-9430-63767c23387a', '2018-04-23 17:45:00', -2, '0', 'ee1ef151-1f9b-48a1-96cc-3de25fbb481e', NULL, -1, 130000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('af3baa7a-4fbb-4fe7-aa51-a94949961592', '2018-06-09 15:40:56', -1, '0', 'd8dce3ae-39d4-4580-a347-1a002ba65d7f', NULL, -1, 11000, 'GERENCIA', NULL, NULL),
('af40e152-37dc-4b2c-b87c-8331b09f8984', '2018-05-30 15:59:07', -1, '0', '3f43d708-b1c2-48d6-9929-d25b0ee93152', NULL, -1, 5000, 'GERENCIA', NULL, NULL),
('b02e1f70-5a5c-4bc4-a23c-a7d8891f9a4e', '2018-04-23 17:53:00', 1, '0', '8e3f67a3-8341-499d-8082-b397ae0a9a7e', NULL, 8, 35000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('b0378c9a-19c2-4ef9-ac93-6e8c207bbfc3', '2018-04-23 14:44:00', 1, '0', 'b4d9023c-6a17-4f94-95af-fa5685cfdc58', NULL, 1, 110000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('b0459fe0-b01d-430b-b19a-29d582e95e97', '2018-04-23 13:51:00', 1, '0', '52602630-bf45-4d1a-9829-e4e9955eb71b', NULL, 1, 140000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('b0d8f2dc-4676-48f9-805b-c5145d50ecba', '2018-05-05 14:08:27', 2, '0', 'ee1ef151-1f9b-48a1-96cc-3de25fbb481e', NULL, 1, 180000, 'GERENCIA', NULL, NULL),
('b1ad3a57-c6d5-4299-89c3-759a3c4d8837', '2018-05-25 16:27:16', -1, '0', 'b4d9023c-6a17-4f94-95af-fa5685cfdc58', NULL, -1, 90000, 'GERENCIA', NULL, NULL),
('b361abac-48ca-4649-b1b6-83e07bc771f0', '2018-05-02 11:48:56', -1, '0', 'dda3b042-f1ec-4cf2-8b38-244a9c32f289', NULL, -7, 10000, 'GERENCIA', NULL, NULL),
('b3da8d1a-78d5-4068-b454-c51dff125f10', '2018-05-08 15:27:22', -1, '0', 'abfac013-6f59-49a4-b1b8-233f3fb4971f', NULL, -1, 30000, 'GERENCIA', NULL, NULL),
('b4b0c7b5-1ebf-4d61-b55f-eb1d858b0406', '2018-04-23 13:49:00', 1, '0', '3941df9e-4d01-4bce-81f8-12dea263db79', NULL, 98, 4000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('b54852f1-5ae5-47c4-bce6-fcc6cc27e7cd', '2018-06-19 14:18:27', -1, '0', '3f43d708-b1c2-48d6-9929-d25b0ee93152', NULL, -4, 5000, 'GERENCIA', NULL, NULL),
('b5798211-8f0b-49ac-9fe6-b55a097c06bc', '2018-04-23 18:06:00', 1, '0', '94d9fe4a-147b-443f-8cd6-151f034e9850', NULL, 1, 60000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('b620852a-601b-44a2-8f97-1c20e3328272', '2018-04-23 15:00:00', 1, '0', '76b24bf0-14a4-498a-a9d3-b9fe55991f4e', NULL, 1, 17500, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('b7217cc6-1e4b-4454-a3b6-cdb7e63eb1f5', '2018-04-26 17:46:00', 1, '0', '8e09f4ba-494a-4c9d-ac49-a22ebabca609', NULL, 1, 23000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('b7270d17-b289-4924-967e-b714f6a5a5a3', '2018-04-30 08:10:00', 1, '0', '7ea10e52-23cc-48d7-8273-dc405cc02a9f', NULL, 8, 250, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('b72cedab-37c1-4e34-ac4d-2321b235dfa9', '2018-04-23 13:38:00', 1, '0', '97ba6646-6dc8-4abf-9e7d-5bc84794bf20', NULL, 1, 380000, 'GERENCIA', '28a90c40-987f-409d-92b5-7acb86ac4684', ''),
('b8957d40-e9a7-48ce-a9e2-70e140765182', '2018-04-26 17:54:00', 1, '0', 'abe789c1-189b-4bf9-af4e-85c591da2c50', NULL, 1, 0, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('b8c4e896-14c0-475c-b7b2-ca4ba551f36b', '2018-08-02 15:44:21', -1, '0', '3941df9e-4d01-4bce-81f8-12dea263db79', NULL, -1, 10000, 'GERENCIA', NULL, NULL),
('b8d9a3d9-c2ff-4e40-b329-ae6cebd5dca4', '2018-07-06 16:14:42', -1, '0', '5fc18d75-75dd-4230-9e2f-c12127ad7ffc', NULL, -14, 500, 'GERENCIA', NULL, NULL),
('b8ef841d-9507-4fa8-873b-0d39d50533cb', '2018-04-23 14:41:00', 1, '0', '26bcebd0-96bf-423d-b669-0c18cd912827', NULL, 2, 50000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('ba05236c-89ab-42cf-a4c0-db4512521085', '2018-04-26 17:48:00', 1, '0', 'b8926e57-09b2-48b9-806a-56990b92a218', NULL, 1, 0, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('bac2c54f-cf3a-45e4-9852-02deb6ffa8e6', '2018-05-21 15:57:00', -2, '0', '81109003-89b0-4da1-8ab2-d0f06ffa839a', NULL, -1, 50000, 'GERENCIA', '73e8a2eb-456d-4b1e-856f-0bdc19a998e5', ''),
('bbb32298-0a96-4978-96ca-979c39d6296f', '2018-08-01 10:28:32', -1, '0', 'd8dce3ae-39d4-4580-a347-1a002ba65d7f', NULL, -1, 11000, 'GERENCIA', NULL, NULL),
('bbd0f902-8c19-4bd7-b5ec-5920461394b2', '2018-04-23 13:57:00', 1, '0', '2031c239-3158-45e4-852d-cc1c14956b6a', NULL, 1, 27000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('bbe952da-2097-4007-ad43-9a4148502df4', '2018-04-23 15:53:00', 1, '0', 'd8dce3ae-39d4-4580-a347-1a002ba65d7f', NULL, 2, 6000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('bc6514d8-cb9e-493e-a83a-d6b9df69d4a3', '2018-04-23 13:47:00', 1, '0', '8e98d6c6-631a-4a5c-9e22-3cf615373b49', NULL, 5, 55000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('bcf8c13a-6a6f-4ef7-bbd4-6ea484e3cc54', '2018-05-29 16:46:57', -1, '0', '6b7efc03-a955-4269-9ca5-ca2bf04c3d48', NULL, -2, 3000, 'GERENCIA', NULL, NULL),
('bed0dbb9-be21-49a7-afd5-398e663c0958', '2018-04-23 15:14:00', 1, '0', 'ee621994-b1f1-491f-bc8d-105821436a9a', NULL, 1, 32000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('befde579-a0a7-40c8-b6fb-5f6d45e85190', '2018-04-23 13:40:00', 1, '0', '8615e923-0a25-4747-9d36-58e0d6c264b5', NULL, 1, 515000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('c16ede7e-2ad1-4334-a6f2-1aeabf09b13b', '2018-04-23 17:48:00', -2, '0', '76b24bf0-14a4-498a-a9d3-b9fe55991f4e', NULL, -1, 17500, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('c1f28d6a-bd29-4142-ad75-d61b7ca9be6b', '2018-04-23 15:54:00', 1, '0', 'dda3b042-f1ec-4cf2-8b38-244a9c32f289', NULL, 86, 6000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('c25fff58-487b-44d0-ad39-0f98de60b4aa', '2018-04-23 13:53:00', 1, '0', 'e8bcfdd1-0818-48c6-b609-3f6344d3d0cb', NULL, 5, 23000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('c2863e3b-c19d-47a5-bf7f-c86d60af326c', '2018-04-23 13:43:00', 1, '0', 'f4eb5041-8f60-4d9b-8ed1-848d5771174c', NULL, 1, 1800, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('c4f0f4ad-9577-43fe-97bc-2cbf9c0a8111', '2018-04-26 17:52:00', 1, '0', '982f28a9-c8bb-47c1-8aa2-dba92db5f939', NULL, 1, 0, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('c56b0111-fba3-455e-959f-a2d13cfad07b', '2018-04-23 14:41:00', 1, '0', '9975dffd-a8e1-43df-9712-611140de31db', NULL, 22, 12500, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('c670aaf3-6aaa-4c14-9f90-9bfc8cb94d9c', '2018-06-11 09:43:25', 2, '0', 'd8dce3ae-39d4-4580-a347-1a002ba65d7f', NULL, 2, 11000, 'GERENCIA', NULL, NULL),
('c686c0c5-5875-4835-9f6b-0b8c77e7f0fe', '2018-04-26 17:57:45', -1, '0', 'abe789c1-189b-4bf9-af4e-85c591da2c50', NULL, -1, 70000, 'GERENCIA', NULL, NULL),
('c6e94486-de01-4ff3-b236-a8cc924ec350', '2018-05-21 15:54:00', -2, '0', '81109003-89b0-4da1-8ab2-d0f06ffa839a', NULL, -1, 50000, 'GERENCIA', '73e8a2eb-456d-4b1e-856f-0bdc19a998e5', '');
INSERT INTO `stockdiary` (`id`, `datenew`, `reason`, `location`, `product`, `attributesetinstance_id`, `units`, `price`, `appuser`, `supplier`, `supplierdoc`) VALUES
('c76c21ab-faad-4433-b764-7cddb54f5b1d', '2018-05-05 13:43:04', -1, '0', 'b4d9023c-6a17-4f94-95af-fa5685cfdc58', NULL, -5, 90000, 'GERENCIA', NULL, NULL),
('c7c45840-0c60-4c85-94f9-19b9fc1cd8e0', '2018-07-27 10:46:16', -1, '0', '4152580f-d9b5-4a49-a8bf-ba10ff0c82da', NULL, -1, 30000, 'CAJA ADMIN', NULL, NULL),
('c7cd313e-0a06-4320-af5d-6408e1d0a8ae', '2018-04-23 13:45:00', 1, '0', '16a10d31-af9a-410e-a72d-650bacc52a59', NULL, 1, 2000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('c816e202-2161-47c4-b255-741ab8b84c58', '2018-05-21 14:31:06', -1, '0', 'd8dce3ae-39d4-4580-a347-1a002ba65d7f', NULL, -2, 11000, 'GERENCIA', NULL, NULL),
('c8a3290d-7f5a-4c41-80c8-dce1a9bb2a5a', '2018-04-23 17:41:00', -2, '0', '4152580f-d9b5-4a49-a8bf-ba10ff0c82da', NULL, -1, 15000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('c8ba5bcc-66ca-41bb-9a31-9b258dc48679', '2018-04-23 15:49:00', 1, '0', '3f43d708-b1c2-48d6-9929-d25b0ee93152', NULL, 300, 1500, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('ca9c9f23-59ba-4b4a-8a9b-d03588fc379c', '2018-04-23 13:43:00', 1, '0', 'f4eb5041-8f60-4d9b-8ed1-848d5771174c', NULL, 1, 1800, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('cb5f789e-5a44-491d-a9f3-b95f70237943', '2018-04-23 13:29:00', 1, '0', 'bc76f6ec-4be4-4249-a3dc-b517880c8647', NULL, 1, 200000, 'GERENCIA', '28a90c40-987f-409d-92b5-7acb86ac4684', ''),
('cc4eac52-e5bf-42b3-ba0d-73f2d00fa928', '2018-05-08 18:10:52', 2, '0', 'abfac013-6f59-49a4-b1b8-233f3fb4971f', NULL, 1, 10000, 'GERENCIA', NULL, NULL),
('cc69610f-0f2e-4e5b-a51c-bd3c7cb9d8d0', '2018-04-23 13:54:00', 1, '0', 'xxx999_999xxx_x9x9x9', NULL, 4, 10000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('ce327216-4e32-44f1-92d1-b429507eecc7', '2018-05-05 13:45:59', -1, '0', '8e3f67a3-8341-499d-8082-b397ae0a9a7e', NULL, -2, 210000, 'GERENCIA', NULL, NULL),
('ce41aa83-b585-4d00-9e55-012ff9e7edb7', '2018-05-21 14:31:06', -1, '0', 'dda3b042-f1ec-4cf2-8b38-244a9c32f289', NULL, -2, 10000, 'GERENCIA', NULL, NULL),
('d05e9c90-dfe7-45c2-bb43-0074022ccdf4', '2018-05-08 15:58:00', 1, '0', 'a7b3e1d8-80dc-41ae-840c-7c7e351e50f3', NULL, 1, 210000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('d21982ea-040d-4936-a248-7648fc7f41f0', '2018-04-23 13:47:00', 1, '0', '0060f534-964c-48d5-9ced-fb55eaf5569e', NULL, 2, 120000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('d4407b2e-8cde-416e-97db-f81f2d5722cf', '2018-05-02 11:48:56', -1, '0', '6b7efc03-a955-4269-9ca5-ca2bf04c3d48', NULL, -1, 3000, 'GERENCIA', NULL, NULL),
('d4ac121e-04a2-48f3-9233-63a306b1b62d', '2018-05-05 14:14:29', -1, '0', 'd8dce3ae-39d4-4580-a347-1a002ba65d7f', NULL, -7, 11000, 'GERENCIA', NULL, NULL),
('d4b2ae4b-7a69-4a1d-869b-aa64b4527696', '2018-04-23 13:52:00', 1, '0', 'ee1ef151-1f9b-48a1-96cc-3de25fbb481e', NULL, 9, 130000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('d510ab0e-355c-42e7-9a72-644033d2f36b', '2018-05-05 14:14:30', 2, '0', '6b7efc03-a955-4269-9ca5-ca2bf04c3d48', NULL, 1, 3000, 'GERENCIA', NULL, NULL),
('d63eba16-bc07-4bd2-9461-7263039319e3', '2018-04-26 17:46:00', 1, '0', '5fe5ba81-aad3-4d67-9aba-8ca93bd629d5', NULL, 25, 0, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('d6a65858-495c-4a7e-9b71-e80a0751decf', '2018-05-02 15:09:00', -1, '0', '2210ff62-20d3-499b-ab64-1344d6b02da5', NULL, -5, 5000, 'GERENCIA', NULL, NULL),
('d6ddc151-4790-4496-9942-1df95b938661', '2018-04-23 17:49:00', 1, '0', 'b54a4b44-eb73-4d79-8fd0-30c8b87ec4ef', NULL, 9, 150, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('d6ff7e69-5300-4ae7-9d8f-c3fbb7edd0fd', '2018-04-23 17:42:00', 1, '0', '76b24bf0-14a4-498a-a9d3-b9fe55991f4e', NULL, 1, 17500, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('d838771e-862a-4a8d-9c40-fb1c1eaa8a1d', '2018-05-11 11:42:18', -1, '0', '61c6b4b9-8986-4c45-862c-dee267867b89', NULL, -2, 15000, 'GERENCIA', NULL, NULL),
('d8600037-36a3-408a-b359-39b9e5f7b74f', '2018-04-26 17:51:00', 1, '0', '4237eb40-bf15-411d-a7dc-bc089dc91d09', NULL, 1, 0, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('d888e486-e4eb-4dd0-ac88-78d9a8645e36', '2018-05-05 14:14:02', -1, '0', '2031c239-3158-45e4-852d-cc1c14956b6a', NULL, -1, 38000, 'GERENCIA', NULL, NULL),
('d94accea-8843-4add-9c18-feaabe4cf3df', '2018-04-23 13:49:00', 1, '0', '61c6b4b9-8986-4c45-862c-dee267867b89', NULL, 9, 4000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('d9dc708a-ea49-4495-920e-ea953a6f5fde', '2018-04-23 15:49:00', 1, '0', 'b54a4b44-eb73-4d79-8fd0-30c8b87ec4ef', NULL, 90, 150, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('da1cb5c2-7fa7-492f-ba9c-6e3d67b648c5', '2018-07-12 14:53:40', -1, '0', 'ee621994-b1f1-491f-bc8d-105821436a9a', NULL, -1, 40000, 'GERENCIA', NULL, NULL),
('dac31a31-f8fa-4939-aa54-d75f340585d0', '2018-05-29 16:46:57', -1, '0', '3f43d708-b1c2-48d6-9929-d25b0ee93152', NULL, -1, 5000, 'GERENCIA', NULL, NULL),
('dbda0cc1-1a35-4a14-8ce1-908d44fc8231', '2018-04-23 13:45:00', 1, '0', '16a10d31-af9a-410e-a72d-650bacc52a59', NULL, 20, 2000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('ddf5d563-d05d-4504-abee-b914be6e4063', '2018-04-23 13:43:00', 1, '0', 'f4eb5041-8f60-4d9b-8ed1-848d5771174c', NULL, 1, 1800, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('de52695c-7b7f-4799-9e8e-1998fd9e8477', '2018-04-23 13:51:00', 1, '0', 'fab8075c-0632-4158-8fc8-bd715bbadc3f', NULL, 5, 145000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('e02fa2b6-4760-46af-a8ba-8178c8287168', '2018-04-26 13:40:55', -1, '0', '9975dffd-a8e1-43df-9712-611140de31db', NULL, -1, 18000, 'GERENCIA', NULL, NULL),
('e1eb7fa6-05c4-4767-ba35-d57511bd83df', '2018-04-23 14:54:00', 1, '0', 'c8c70dd3-7a47-44db-934d-8ee11819dc17', NULL, 1, 25000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('e21339a6-5525-4fb0-a8b6-0d9eb7bf6f8a', '2018-04-26 17:52:00', 1, '0', 'fe9f7587-7bc7-4d81-91b1-cae543cc647e', NULL, 1, 0, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('e2b9b73b-9c9d-4743-94f4-27058ae5178f', '2018-08-01 10:28:32', -1, '0', '8e3f67a3-8341-499d-8082-b397ae0a9a7e', NULL, -1, 210000, 'GERENCIA', NULL, NULL),
('e2ecefbb-9a32-423b-bf86-9eb6b49a875e', '2018-05-21 18:10:02', -1, '0', '61c6b4b9-8986-4c45-862c-dee267867b89', NULL, -1, 15000, 'GERENCIA', NULL, NULL),
('e3086204-09f0-4e7b-b6af-c5f1f7c95de4', '2018-07-06 15:22:53', -1, '0', '08e2052d-cbc8-48c7-9cec-d0c24d76a287', NULL, -1, 28000, 'GERENCIA', NULL, NULL),
('e4332cbd-6de2-4b4e-a1ce-c0a753c77a2f', '2018-07-26 08:44:45', -1, '0', '76b24bf0-14a4-498a-a9d3-b9fe55991f4e', NULL, -1, 25000, 'GERENCIA', NULL, NULL),
('e5227562-8bad-4ea6-b5c0-0d5b2e4a1486', '2018-04-23 13:50:00', 1, '0', 'd80aef84-aec7-4965-9541-efffa57db37f', NULL, 9, 4000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('e53b0e55-94e7-4955-86e3-d1c83619b06a', '2018-04-23 14:40:00', 1, '0', 'c8c70dd3-7a47-44db-934d-8ee11819dc17', NULL, 1, 25000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('e56be801-5c42-4b75-91b0-d44fe3e96fd5', '2018-05-26 10:52:51', 2, '0', 'b4d9023c-6a17-4f94-95af-fa5685cfdc58', NULL, 1, 90000, 'GERENCIA', NULL, NULL),
('e5e4a647-54a4-49be-af93-2191ac051ff1', '2018-06-13 11:48:54', -1, '0', '3941df9e-4d01-4bce-81f8-12dea263db79', NULL, -1, 10000, 'GERENCIA', NULL, NULL),
('e5ff9d0c-5221-4c77-9f7b-6b0d4ad261c0', '2018-04-23 15:56:00', 1, '0', '3f43d708-b1c2-48d6-9929-d25b0ee93152', NULL, 1, 1500, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('e671358c-b423-41d7-bf8f-0abf1de36df9', '2018-04-23 13:43:00', 1, '0', 'f4eb5041-8f60-4d9b-8ed1-848d5771174c', NULL, 1, 1800, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('e6738375-b70d-4f43-bdb2-8009da8de121', '2018-04-23 13:43:00', 1, '0', 'f4eb5041-8f60-4d9b-8ed1-848d5771174c', NULL, 1, 1800, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('e7c5e845-31d1-4777-bcb0-cc7be65bb476', '2018-04-23 13:38:00', 1, '0', '97ba6646-6dc8-4abf-9e7d-5bc84794bf20', NULL, 1, 380000, 'GERENCIA', '28a90c40-987f-409d-92b5-7acb86ac4684', ''),
('e8202cdf-ca89-4a42-9b2c-b533d30dbe9a', '2018-08-02 14:31:07', -1, '0', '3941df9e-4d01-4bce-81f8-12dea263db79', NULL, -1, 10000, 'GERENCIA', NULL, NULL),
('e88c84a6-513f-4560-a0bb-4556865cf9a7', '2018-05-21 18:10:02', -1, '0', '9621839b-65fb-49cd-96f3-9e1fa0c11449', NULL, -1, 15000, 'GERENCIA', NULL, NULL),
('e88da815-eff4-419a-b332-c22d1e07c871', '2018-05-08 16:05:00', -2, '0', 'a7b3e1d8-80dc-41ae-840c-7c7e351e50f3', NULL, -5, 210000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('e8921d99-3e03-449c-a3a3-057e804bbff8', '2018-05-17 16:02:32', -1, '0', '9621839b-65fb-49cd-96f3-9e1fa0c11449', NULL, -1, 15000, 'GERENCIA', NULL, NULL),
('eb0611cb-03bb-46d9-88b4-752a4e9e8415', '2018-04-26 17:54:00', 1, '0', '1dd66e05-660f-43b8-8c06-07b8767ea4dd', NULL, 1, 0, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('eb5dd28d-3536-4b2e-8fae-bd27005e35ff', '2018-04-26 17:47:00', 1, '0', '36f602a7-9bf3-46ff-b186-164204d15105', NULL, 1, 0, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('ebc6e54b-7d0c-4e33-ab90-a96f291d5414', '2018-04-23 14:17:00', 1, '0', 'dda3b042-f1ec-4cf2-8b38-244a9c32f289', NULL, 1, 6000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('ec91c860-34ca-45b3-b0c8-e55694c2c067', '2018-05-29 16:46:57', -1, '0', 'dda3b042-f1ec-4cf2-8b38-244a9c32f289', NULL, -5, 10000, 'GERENCIA', NULL, NULL),
('eca7a2a4-cd01-420b-a998-e451ada280a8', '2018-05-29 16:46:57', -1, '0', 'ce638b72-3d7f-4558-9f7a-3d9a3f7e2cec', NULL, -2, 65000, 'GERENCIA', NULL, NULL),
('ed0d3c08-064f-4c1d-8a6d-e086aea29016', '2018-04-23 14:44:00', 1, '0', 'b4d9023c-6a17-4f94-95af-fa5685cfdc58', NULL, 18, 110000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('ed47c8f1-a217-4a98-a31c-8454add56244', '2018-04-23 14:40:00', 1, '0', '342fa52c-7c53-42a6-a2a6-63cfaac7671c', NULL, 4, 45000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('edb9670c-7dd7-4ed1-a259-09b88fed41b0', '2018-04-23 14:55:00', -3, '0', 'c8c70dd3-7a47-44db-934d-8ee11819dc17', NULL, -1, 25000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('edc7f232-90e4-49b7-beae-c1fdfd717a45', '2018-04-23 13:43:00', 1, '0', 'f4eb5041-8f60-4d9b-8ed1-848d5771174c', NULL, 1, 1800, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('ee757fc0-ad5d-46d2-942b-d5e05f5359c8', '2018-05-19 11:13:01', -1, '0', 'fab8075c-0632-4158-8fc8-bd715bbadc3f', NULL, -1, 190000, 'GERENCIA', NULL, NULL),
('f01c3c7c-6ad6-4f9c-9142-60d5a7221b7f', '2018-04-26 17:47:00', 1, '0', '6d75ad29-6f01-4aed-a5eb-4f9f5ef34de0', NULL, 1, 0, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('f0ef9a58-0297-449b-8ce3-733b7d66b77f', '2018-05-22 11:16:44', -1, '0', '15bd0371-6990-43ea-832d-9e55eb3b7916', NULL, -1, 80000, 'GERENCIA', NULL, NULL),
('f10c72ad-f968-4ae1-b5aa-c6954228ac50', '2018-04-23 14:39:00', 1, '0', '14497dc1-8d2e-4277-ade6-7eca54d87860', NULL, 33, 98000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('f32e8c79-e6da-4b6c-9c6d-d00f48627f43', '2018-05-29 16:46:57', -1, '0', 'd8dce3ae-39d4-4580-a347-1a002ba65d7f', NULL, -4, 11000, 'GERENCIA', NULL, NULL),
('f33fc594-02fc-46bf-941a-ddeb04f14c89', '2018-05-05 14:08:26', -1, '0', '2210ff62-20d3-499b-ab64-1344d6b02da5', NULL, -5, 5000, 'GERENCIA', NULL, NULL),
('f3996866-d52d-4f87-a66c-2556ac137418', '2018-05-28 11:27:04', -1, '0', '3f43d708-b1c2-48d6-9929-d25b0ee93152', NULL, -3, 5000, 'GERENCIA', NULL, NULL),
('f42ff72c-074d-498e-a7cd-30634b93b107', '2018-04-23 13:43:00', 1, '0', 'f4eb5041-8f60-4d9b-8ed1-848d5771174c', NULL, 1, 1800, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('f4788c16-1362-409c-ab76-9bbc36bc46f2', '2018-04-23 13:43:00', 1, '0', 'f4eb5041-8f60-4d9b-8ed1-848d5771174c', NULL, 1, 1800, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('f4a66289-cadc-43c0-9cc8-7caa03d0c6b2', '2018-04-23 14:42:00', 1, '0', '61c6b4b9-8986-4c45-862c-dee267867b89', NULL, 8, 4000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('f5268592-5238-42e5-a17e-be0454bed5e2', '2018-05-02 11:46:42', -1, '0', 'b4d9023c-6a17-4f94-95af-fa5685cfdc58', NULL, -5, 210000, 'GERENCIA', NULL, NULL),
('f645e7c5-278e-4da6-bc99-8d7e0a3fd0c1', '2018-04-26 17:47:00', 1, '0', 'f6a5e356-723b-4f6e-8ae9-556953e0d6f4', NULL, 12, 0, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('f69cd89a-95e7-4cd5-b893-a939678be975', '2018-04-23 13:43:00', 1, '0', 'f4eb5041-8f60-4d9b-8ed1-848d5771174c', NULL, 1, 1800, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('f733e149-50f8-40ee-8b77-9da79245b674', '2018-04-23 13:25:00', -3, '0', 'ef2d0ded-7b0f-49e2-9c26-b6f2582757c9', NULL, -1, 1, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('f7f44f5a-c03f-4c8e-b113-9cdf4f2b4e3f', '2018-04-28 08:20:00', 1, '0', 'aac4c6b0-f568-4374-afc3-d4fa1ea6c998', NULL, 17, 7000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('f8acb2d6-e239-40c3-9fc6-077dc90f4669', '2018-04-23 14:42:00', 1, '0', 'd80aef84-aec7-4965-9541-efffa57db37f', NULL, 8, 4000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('f90d6d14-488f-4bb8-a93b-179f14f34fa0', '2018-04-23 17:45:00', -2, '0', '3941df9e-4d01-4bce-81f8-12dea263db79', NULL, -1, 4000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('fa31cc83-7026-45fb-82c0-4393b6fda414', '2018-04-23 13:31:00', 1, '0', 'c3934860-bef3-4b73-adcd-2efdf629def1', NULL, 1, 15000, 'GERENCIA', '28a90c40-987f-409d-92b5-7acb86ac4684', ''),
('fa6ed395-b68b-43c7-8d71-9f5c77ce1722', '2018-05-12 09:46:00', -1, '0', '97ba6646-6dc8-4abf-9e7d-5bc84794bf20', NULL, -1, 530000, 'GERENCIA', NULL, NULL),
('faecf5f5-e13c-4f8e-8988-393baa315798', '2018-04-23 13:53:00', 1, '0', '15bd0371-6990-43ea-832d-9e55eb3b7916', NULL, 9, 50000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('fb14abc1-56c3-40d5-a4d5-b0d37862d7bc', '2018-06-23 16:06:13', -1, '0', 'ee1ef151-1f9b-48a1-96cc-3de25fbb481e', NULL, -1, 160000, 'GERENCIA', NULL, NULL),
('fcd44ad4-1e63-414d-be94-549a064dc262', '2018-04-26 17:55:00', 1, '0', 'd9ba7d33-0a13-4c1a-80bf-064da39c8187', NULL, 2, 0, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('fd5a55b4-6a02-4c0b-a142-eed103079fee', '2018-04-23 13:28:00', -3, '0', 'ef2d0ded-7b0f-49e2-9c26-b6f2582757c9', NULL, -1, 91000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('fe027953-d39e-44a7-bf2c-0c6124f2a4b1', '2018-04-23 13:43:00', 1, '0', 'f4eb5041-8f60-4d9b-8ed1-848d5771174c', NULL, 1, 1800, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('fe3f0e46-b161-433d-9262-e523c7cd4433', '2018-04-23 13:47:00', 1, '0', '2031c239-3158-45e4-852d-cc1c14956b6a', NULL, 12, 27000, 'GERENCIA', 'e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', ''),
('fe8d7042-bcf6-493d-8ce3-64efe3b4b770', '2018-05-08 18:04:16', -1, '0', 'abfac013-6f59-49a4-b1b8-233f3fb4971f', NULL, -1, 10000, 'GERENCIA', NULL, NULL),
('fea351f7-1253-4741-b6b4-d19dd353b792', '2018-05-18 08:46:31', -1, '0', '26bcebd0-96bf-423d-b669-0c18cd912827', NULL, -1, 50000, 'GERENCIA', NULL, NULL),
('fefafa47-57e2-404f-b17a-82ea057544df', '2018-05-25 16:27:16', -1, '0', '3f43d708-b1c2-48d6-9929-d25b0ee93152', NULL, -1, 5000, 'GERENCIA', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stocklevel`
--

CREATE TABLE `stocklevel` (
  `id` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `product` varchar(255) NOT NULL,
  `stocksecurity` double DEFAULT NULL,
  `stockmaximum` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `suppliers`
--

CREATE TABLE `suppliers` (
  `id` varchar(255) NOT NULL,
  `searchkey` varchar(255) NOT NULL,
  `taxid` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `maxdebt` double NOT NULL DEFAULT '0',
  `address` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `postal` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `phone2` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `visible` bit(1) NOT NULL DEFAULT b'1',
  `curdate` datetime DEFAULT NULL,
  `curdebt` double DEFAULT '0',
  `vatid` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `suppliers`
--

INSERT INTO `suppliers` (`id`, `searchkey`, `taxid`, `name`, `maxdebt`, `address`, `address2`, `postal`, `city`, `region`, `country`, `firstname`, `lastname`, `email`, `phone`, `phone2`, `fax`, `notes`, `visible`, `curdate`, `curdebt`, `vatid`) VALUES
('28a90c40-987f-409d-92b5-7acb86ac4684', 'DISCOVERY', '901082924-0', 'DISCOVERY ', 0, 'CC. SANANDRESITO CENTRO PISO 4 LOCAL C29', NULL, NULL, 'BUCARAMANGA', 'SANTANDER', 'COLOMBIA', 'DISCOVERY', NULL, NULL, '6414400', '6525605', NULL, '', b'1', NULL, NULL, ''),
('4af9e015-65e6-4dec-81c7-4f31278f1b68', 'GENERAL', 'GENERICO', 'GENERAL', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1', NULL, 0, NULL),
('73e8a2eb-456d-4b1e-856f-0bdc19a998e5', '', '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1', NULL, 0, NULL),
('d7155529-c498-41de-b4ae-3f7bbd63f8c2', 'TYCO', '901135846', 'TYCO CONNECT SAS', 0, NULL, NULL, NULL, NULL, NULL, NULL, 'TYCO', 'CONNECT', NULL, '3374221', NULL, NULL, NULL, b'1', NULL, 0, NULL),
('dce6204b-3dd1-4109-828f-b179520fed91', 'ALEJANDRO', '', 'ALEJANDRO LIZCANO', 12000000, 'CALLE 11 SUR NO 7A 02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3005698267', NULL, NULL, '', b'1', NULL, NULL, ''),
('e1c0fca7-1dc0-4d45-9cb0-75c0ae431679', 'BIGLINKS', '901058522-1', 'BIGLINKS SAS', 0, 'CLL 77 16 A 38', NULL, NULL, 'BOGOTA', 'CUNDINAMARCA', 'COLOMBIA', 'BIG', 'LINGS', 'BIGLINKS1@OUTLOOK.COM', '7568327', NULL, NULL, '', b'1', NULL, NULL, ''),
('e7343158-b7d1-4e15-a3f9-928640e7ec83', 'TACTICAS', '900961291-4', 'TACTICAS EN SEGURIDAD ELECTRONICA SAS', 0, 'AV. 37# 75-10', NULL, NULL, 'MEDELLIN', 'ANTIOQUIA', 'COLOMBIA', 'TACTICAS', 'SEGURIDAD', NULL, '4449051', '3006576763', NULL, '', b'1', NULL, NULL, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `taxcategories`
--

CREATE TABLE `taxcategories` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `taxcategories`
--

INSERT INTO `taxcategories` (`id`, `name`) VALUES
('000', 'EXENTO'),
('a62b540e-b4a8-4dd2-901c-8f3835a38edb', 'INC 8%'),
('001', 'IVA 19%'),
('002', 'IVA 5%');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `taxcustcategories`
--

CREATE TABLE `taxcustcategories` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `taxes`
--

CREATE TABLE `taxes` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `custcategory` varchar(255) DEFAULT NULL,
  `parentid` varchar(255) DEFAULT NULL,
  `rate` double NOT NULL DEFAULT '0',
  `ratecascade` bit(1) NOT NULL DEFAULT b'0',
  `rateorder` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `taxes`
--

INSERT INTO `taxes` (`id`, `name`, `category`, `custcategory`, `parentid`, `rate`, `ratecascade`, `rateorder`) VALUES
('000', 'EXENTO', '000', NULL, NULL, 0, b'1', NULL),
('001', 'IVA 19%', '001', NULL, NULL, 0.19, b'1', NULL),
('002', 'IVA 5%', '002', NULL, NULL, 0.05, b'1', NULL),
('8e4ca2ee-f7a1-4b08-8d2d-5d43674d0dc6', 'INC 8%', 'a62b540e-b4a8-4dd2-901c-8f3835a38edb', NULL, NULL, 0.08, b'1', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `taxlines`
--

CREATE TABLE `taxlines` (
  `id` varchar(255) NOT NULL,
  `receipt` varchar(255) NOT NULL,
  `taxid` varchar(255) NOT NULL,
  `base` double NOT NULL DEFAULT '0',
  `amount` double NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `taxlines`
--

INSERT INTO `taxlines` (`id`, `receipt`, `taxid`, `base`, `amount`) VALUES
('053c962a-1b97-44d7-9447-4bfcf057abea', '74dce755-d188-4c5d-bcec-edef072a2efc', '000', 11000, 0),
('0a0d89d2-3233-44d7-b912-f9e080d25ac2', '09d23089-55ad-4c3d-8ec1-06a85dc85cad', '000', 850000, 0),
('0af15f8f-e35b-420c-8737-d2515515c654', 'da2e2793-b4cd-48cf-80e1-d0faa7224814', '000', 30000, 0),
('0d31ca54-3eec-47ce-a27b-d02442c88c0f', '594baa4a-d86c-4a00-9ea2-116f382d2dcb', '000', 10000, 0),
('0eeaefab-1c89-42ac-b386-fbb197103961', '23040426-f1f6-406f-aea3-83208d6bc946', '000', 3000, 0),
('159410d5-0f46-4324-9ceb-4da13dae93c2', '4178d88b-59b3-4125-9140-c17558de4c9e', '000', 150000, 0),
('1913870b-5471-4774-8bf4-56def5217751', '58875cb0-a728-41a3-a842-f6a38746fa7a', '000', 90000, 0),
('1d9a1fff-c897-4293-a427-b40f3b6e70f9', '48a5593e-b616-4b06-9df5-c25ad770ba9a', '000', 530000, 0),
('2b944bfe-9c01-4d92-8148-343d68d7f328', '1075a9ee-9a2e-46a4-95b1-337ac7bebb46', '000', 395000, 0),
('2da94120-1887-4ab0-8771-23766dc81f6d', '07b84fac-3e16-4367-8dcf-21419b31e672', '000', 7000, 0),
('31256df7-555c-48ac-8159-60dec904abb4', '20992dd7-d5a9-4400-8844-9b03305f2745', '000', 3000, 0),
('32d40c18-b033-459e-b7c0-58f3cd45fdfb', '07e69745-c30c-40b6-affd-48846d714716', '000', 4000, 0),
('395dad22-1af3-40a1-8eb4-e3464dbe0453', 'aea6c580-040d-491d-84a3-036747f288df', '000', 20000, 0),
('3ac725c8-e045-4f6e-aaa0-efa2f0e9c402', '89882b29-cac3-41cd-9a8e-3d9c6410a6f5', '000', -10000, 0),
('450594d0-940e-4ff3-9d50-385d6904faa1', '07a4e03a-65f9-4f45-be2f-4cae67b74c85', '000', 20000, 0),
('4a056ad1-ab90-4e2a-aba7-63c56ef0c185', '44b5f289-95c5-4938-8bb0-5f8601d0a8fd', '000', 160000, 0),
('4bdcaac7-8c29-4781-bb5b-027991314272', '466e792b-2526-4795-8983-3b531c7bd519', '000', 4000, 0),
('4c034a20-53c0-45c3-abce-3b5cd57b999a', '29d25aa2-0398-40fe-ae1e-a723ed7a85a5', '000', 190000, 0),
('4f6fc7e7-34ee-494c-9eaa-1b532476d80f', '59ff4ab4-9ba2-45d2-b631-294ea788fd63', '000', 70000, 0),
('509a20c1-b60e-4311-8a47-546d9d03e9b3', 'bb8afa89-26c6-44ef-b524-c491404ed05b', '000', 38000, 0),
('5359c4de-7ae2-4044-ad9a-8df249ef6625', '0962e48a-0ed0-46e9-83c9-09b6a183613f', '000', -1000, 0),
('575cff26-4ca4-4c79-93f1-c94c83ad84f4', '8e2ae580-a5b2-4a8e-b291-c1c4cb2ac9d0', '000', 116000, 0),
('5e023da9-aa51-423d-a96d-84269c25ef35', '880455b6-da66-432a-bfe6-38a42945133d', '000', 38000, 0),
('611e2ea2-a2a8-481c-b39a-5e7891e96478', '8d5644fa-2992-4337-a5ba-92b4575af56b', '000', 55000, 0),
('68c2e6a1-79e9-4712-b77b-a60c6cb1fcbc', '7ff68bfd-10af-4cd8-9699-2aa32c253aa6', '000', 11000, 0),
('6ff3803c-2bdf-466c-a42c-d19225bda788', '162d5d4b-9a43-449f-af69-8b46ec668437', '000', 80000, 0),
('702243ca-2da4-4ae6-a4ad-8bd89e3adb3d', 'a60f60da-591e-4f9d-bc6c-1f4440b5c429', '000', 50000, 0),
('752ae3a0-f27e-47e6-85d4-a3550efcdc4b', '98ea0468-8336-4503-801a-a0f72a0350cf', '000', 485000, 0),
('75ae9907-9279-4b0b-aa28-14cc9cdf0cf1', '6787ae2f-ea3d-43cd-983e-ca09c3bc1f01', '000', 1000, 0),
('78ed19b0-2f7c-4033-b28e-ecc8632cafd9', '2c8d1022-bc9b-4c86-ae90-eae340b754dd', '000', 50000, 0),
('7d777f23-413e-49e0-8174-782e6eae9d74', '6651d21e-f826-4f22-8cdc-1dbf06fc2b49', '000', 280000, 0),
('7e28dac5-0994-4372-b057-2bf94a530413', '47d32ca3-3546-4355-8100-a2f95d79b483', '000', 90000, 0),
('7e7661aa-c536-4969-82d1-2273ce317b44', '228d053a-303a-41d6-99d4-cae2338fab64', '000', 80000, 0),
('80e0218b-9bef-4698-96f0-438778f9a3d2', '1b566833-3e13-4492-88ab-8f98e6a117ca', '000', 0, 0),
('839cb7cd-8ff3-4c50-812a-a437448244b0', 'a86a5893-d372-4a0c-abe5-2248f183f4f6', '000', -116000, 0),
('8b29f652-8c04-49e2-9114-6309d51c8242', '1629889c-0044-4c0f-b25d-a54a428628a5', '000', 990000, 0),
('8b90ec11-b334-4f20-a92a-627df59faffa', 'c49a0d12-06c9-4051-8f53-67b2feaf5452', '000', 10000, 0),
('8cac40e3-4304-49c7-b058-885fd6792ea0', 'b0bdd32d-5b1a-49dc-908e-216ed2ee5786', '000', 50000, 0),
('93235459-e93e-4ad7-94a2-2010f14cb911', '9a2498b5-0fbc-4083-90da-921c53792f1b', '000', 43000, 0),
('940894a0-a1d8-4d65-8fea-db5638fe1c2e', 'b805329e-b01b-44b4-b9cf-6abd44019383', '000', 7000, 0),
('94af2645-776c-4dd9-ba1b-40c15fa86e9b', '787effa3-ecc7-426a-ae68-4fbdfa45ffa7', '000', 30000, 0),
('957ecdd3-c669-4b55-a1be-f5ef40fcdace', '3aeeaad1-23e8-462a-94d5-614126056919', '000', 0, 0),
('99b3c68d-800d-4c52-9ec8-5dacd3a9fa5c', 'e6ead73a-ba84-44d1-b7d0-af9754aafd10', '000', 280000, 0),
('9b01a893-e40c-43e3-8621-9241d8cec5e3', '1a348ddd-0199-4ff0-8f52-fd8aaea278ab', '000', 15000, 0),
('9b57d97e-5e92-4b67-ab42-074548857944', '6ac66d4e-b115-49b7-ac71-4243234c052c', '000', 551000, 0),
('9dadaa70-37ee-4eae-932f-5356998e4a96', '06fec5e0-fb6c-4c4b-a125-241c76d54390', '000', 11000, 0),
('a669de5e-71c6-4da9-a7b2-aec05659a48f', 'abdf7967-28a5-4012-83c5-77bf4df81a45', '000', 500000, 0),
('a6a47d02-6752-40c0-b490-2ec0848e74dc', '100ee8d1-cdc5-431e-8588-b90993184edd', '000', 25000, 0),
('aa06b791-2ea8-4099-a865-552489e3432e', '0318a889-3cf3-4f7b-974f-2b04c8de7ed4', '000', 80000, 0),
('aa50de0a-c394-4a10-8339-4b6b3d7aaca0', '65495e91-fe6e-475b-96ec-c3d9b753d5e6', '000', 136000, 0),
('ad1027c9-f451-4d82-9725-3b634d07429f', '0d91839e-b0a4-44ff-a75c-2add133e2c73', '000', 450000, 0),
('ad6fee15-9966-47be-8aae-b0f15904fd06', '436c4bcb-1b8c-434b-b6f1-ba1d67761601', '000', 145000, 0),
('cb5e42d2-4fe0-4627-93ad-a4fca8d87c19', 'b008fe18-d5c1-4ac9-b761-1a6979c1264b', '000', 172000, 0),
('cc9754d9-a05e-4c92-a218-a42f1d8533a9', '6be45ed6-4fcf-45d2-ad34-a56c0aea18b6', '000', 420000, 0),
('cee3a18c-8052-4160-989a-19f3069e8aa5', '443c5679-19d9-4953-b2a3-9a556c697ac7', '000', 55000, 0),
('cf9a6bf0-40de-44a4-8e2c-70ebd27b1c4b', 'a3581d8e-2a38-43c1-b3b2-16f0639d940d', '000', 8600, 0),
('d01e4f03-92f9-4263-a6b7-247906c8d0a5', 'b3e3b918-9c4b-4e4b-858c-030c6a80c504', '000', 238000, 0),
('d28fb2f7-4f36-4b33-8e7e-98360b76df28', '9c66fc40-492f-44de-958d-dbf7f5a100c5', '000', 10000, 0),
('d306b7a5-3dce-4218-b00e-367dc6babd1c', '9c52480f-8017-4b8d-a475-f25da3cff897', '000', 10000, 0),
('d31cdf3e-450e-41be-987c-7cfcb7bdc1ab', '9a3d3b8d-449c-400c-b159-cc638482844e', '000', 15000, 0),
('d77b47e3-0766-4cbb-b533-a3459e5fc86d', '2e4b3ab6-0ec8-475b-bc19-9fdc2d98b5ad', '000', 60000, 0),
('da2ffa15-d69b-4db8-96ab-450f3c01b02e', '01fbe7b8-7afe-4e1d-b503-ae8c19496d85', '000', 5000, 0),
('e0a84c4b-10a1-44aa-b432-4fac5a7972c7', '6d914aa3-3d6c-4051-b550-c4fc1d47c917', '000', 210000, 0),
('e2c21f86-2687-489f-9f3c-c7e57fbe70b6', 'ba593fed-aa36-4e27-b244-0dbc34f07a09', '000', 40000, 0),
('e2e51a00-7f37-441f-afef-505ab451d08a', '609017ac-302b-425f-97e6-9c403e84d3bb', '000', 25000, 0),
('e57ff0a3-b2c9-4fa5-b055-3205acd74c3b', 'f3931893-d27a-4712-abb6-2dd877761d86', '000', 50000, 0),
('e857dad0-906d-4d3f-8390-a399f422ef97', '35544bed-3d30-4dda-a99e-386714db79b6', '000', 85000, 0),
('ee374030-8805-4c6d-9a7a-843745b35c6a', '7401a5e0-16c1-4a40-881d-eb9436615ec0', '000', 262100, 0),
('f12ff2bc-b5af-4105-9a8a-80b44cce0e31', 'abfce397-1e03-4a59-a4c7-8944ac8c0d86', '000', 40000, 0),
('f6f4d2c4-465f-4dea-8a4b-4ce3a7aa1f29', 'bef4d334-d56d-4455-ae27-78a85574f9df', '000', -172000, 0),
('fa3b7256-5056-49ee-a99a-e31f3b82973e', '05aff32a-c5ce-48c8-a2f2-03cda09e3585', '000', 250000, 0),
('faaada8a-0689-4743-8477-f0a9cee9c863', 'c7daa965-c7d2-4424-a989-3887a2d4be9d', '000', 38000, 0),
('fb9352f0-e80b-449f-bd57-4d00243c18b9', '182a889c-022f-4c55-a4da-1125450034d7', '000', 15000, 0),
('ff5093af-21df-458e-820d-94f265984389', '03665f96-773d-4a9d-84db-72e043e7259e', '000', 10000, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `taxsuppcategories`
--

CREATE TABLE `taxsuppcategories` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `thirdparties`
--

CREATE TABLE `thirdparties` (
  `id` varchar(255) NOT NULL,
  `cif` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `contactcomm` varchar(255) DEFAULT NULL,
  `contactfact` varchar(255) DEFAULT NULL,
  `payrule` varchar(255) DEFAULT NULL,
  `faxnumber` varchar(255) DEFAULT NULL,
  `phonenumber` varchar(255) DEFAULT NULL,
  `mobilenumber` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `webpage` varchar(255) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ticketlines`
--

CREATE TABLE `ticketlines` (
  `ticket` varchar(255) NOT NULL,
  `line` int(11) NOT NULL,
  `product` varchar(255) DEFAULT NULL,
  `attributesetinstance_id` varchar(255) DEFAULT NULL,
  `units` double NOT NULL,
  `price` double NOT NULL,
  `taxid` varchar(255) NOT NULL,
  `attributes` mediumblob
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `ticketlines`
--

INSERT INTO `ticketlines` (`ticket`, `line`, `product`, `attributesetinstance_id`, `units`, `price`, `taxid`, `attributes`) VALUES
('01fbe7b8-7afe-4e1d-b503-ae8c19496d85', 0, '16a10d31-af9a-410e-a72d-650bacc52a59', NULL, 1, 5000, '000', 0x3939),
('0318a889-3cf3-4f7b-974f-2b04c8de7ed4', 0, '15bd0371-6990-43ea-832d-9e55eb3b7916', NULL, 1, 80000, '000', 0x313030),
('03665f96-773d-4a9d-84db-72e043e7259e', 0, '3941df9e-4d01-4bce-81f8-12dea263db79', NULL, 1, 10000, '000', 0x313031),
('05aff32a-c5ce-48c8-a2f2-03cda09e3585', 0, '76b24bf0-14a4-498a-a9d3-b9fe55991f4e', NULL, 10, 25000, '000', 0x313032),
('06fec5e0-fb6c-4c4b-a125-241c76d54390', 0, 'd8dce3ae-39d4-4580-a347-1a002ba65d7f', NULL, 1, 11000, '000', 0x313033),
('07a4e03a-65f9-4f45-be2f-4cae67b74c85', 0, '3941df9e-4d01-4bce-81f8-12dea263db79', NULL, 1, 10000, '000', 0x313034),
('07a4e03a-65f9-4f45-be2f-4cae67b74c85', 1, '61c6b4b9-8986-4c45-862c-dee267867b89', NULL, 1, 10000, '000', 0x313035),
('07b84fac-3e16-4367-8dcf-21419b31e672', 0, 'aac4c6b0-f568-4374-afc3-d4fa1ea6c998', NULL, 1, 7000, '000', 0x313036),
('07e69745-c30c-40b6-affd-48846d714716', 0, 'b54a4b44-eb73-4d79-8fd0-30c8b87ec4ef', NULL, 10, 400, '000', 0x313037),
('0962e48a-0ed0-46e9-83c9-09b6a183613f', 0, 'abfac013-6f59-49a4-b1b8-233f3fb4971f', NULL, -1, 1000, '000', 0x313038),
('09d23089-55ad-4c3d-8ec1-06a85dc85cad', 0, 'f65236e2-5a72-405a-8ca8-9a1ae71a0888', NULL, 1, 850000, '000', 0x313039),
('0d91839e-b0a4-44ff-a75c-2add133e2c73', 0, 'b4d9023c-6a17-4f94-95af-fa5685cfdc58', NULL, 5, 90000, '000', 0x313130),
('100ee8d1-cdc5-431e-8588-b90993184edd', 0, '4190711b-4381-4742-9730-489f4bd02e05', NULL, 1, 25000, '000', 0x313131),
('1075a9ee-9a2e-46a4-95b1-337ac7bebb46', 0, 'dda3b042-f1ec-4cf2-8b38-244a9c32f289', NULL, 5, 10000, '000', 0x313132),
('1075a9ee-9a2e-46a4-95b1-337ac7bebb46', 1, 'd8dce3ae-39d4-4580-a347-1a002ba65d7f', NULL, 4, 11000, '000', 0x313133),
('1075a9ee-9a2e-46a4-95b1-337ac7bebb46', 2, 'ce638b72-3d7f-4558-9f7a-3d9a3f7e2cec', NULL, 2, 65000, '000', 0x313134),
('1075a9ee-9a2e-46a4-95b1-337ac7bebb46', 3, '2bc44efd-bea7-4d31-ab55-f85215ed491d', NULL, 1, 160000, '000', 0x313135),
('1075a9ee-9a2e-46a4-95b1-337ac7bebb46', 4, '3f43d708-b1c2-48d6-9929-d25b0ee93152', NULL, 1, 5000, '000', 0x313136),
('1075a9ee-9a2e-46a4-95b1-337ac7bebb46', 5, '6b7efc03-a955-4269-9ca5-ca2bf04c3d48', NULL, 2, 3000, '000', 0x313137),
('1629889c-0044-4c0f-b25d-a54a428628a5', 0, 'ce638b72-3d7f-4558-9f7a-3d9a3f7e2cec', NULL, 4, 65000, '000', 0x313138),
('1629889c-0044-4c0f-b25d-a54a428628a5', 1, 'c7b19666-822f-400a-842f-60bfca4d8980', NULL, 1, 280000, '000', 0x313139),
('1629889c-0044-4c0f-b25d-a54a428628a5', 2, 'dda3b042-f1ec-4cf2-8b38-244a9c32f289', NULL, 4, 10000, '000', 0x313230),
('1629889c-0044-4c0f-b25d-a54a428628a5', 3, 'd8dce3ae-39d4-4580-a347-1a002ba65d7f', NULL, 4, 11000, '000', 0x313231),
('1629889c-0044-4c0f-b25d-a54a428628a5', 4, '3f43d708-b1c2-48d6-9929-d25b0ee93152', NULL, 4, 5000, '000', 0x313232),
('1629889c-0044-4c0f-b25d-a54a428628a5', 5, 'ee1ef151-1f9b-48a1-96cc-3de25fbb481e', NULL, 1, 180000, '000', 0x313233),
('1629889c-0044-4c0f-b25d-a54a428628a5', 6, '6b7efc03-a955-4269-9ca5-ca2bf04c3d48', NULL, 2, 3000, '000', 0x313234),
('1629889c-0044-4c0f-b25d-a54a428628a5', 7, '2bc44efd-bea7-4d31-ab55-f85215ed491d', NULL, 1, 160000, '000', 0x313235),
('162d5d4b-9a43-449f-af69-8b46ec668437', 0, '15bd0371-6990-43ea-832d-9e55eb3b7916', NULL, 1, 80000, '000', 0x313236),
('182a889c-022f-4c55-a4da-1125450034d7', 0, '2210ff62-20d3-499b-ab64-1344d6b02da5', NULL, 2, 5000, '000', 0x313237),
('182a889c-022f-4c55-a4da-1125450034d7', 1, '3f43d708-b1c2-48d6-9929-d25b0ee93152', NULL, 1, 5000, '000', 0x313238),
('1a348ddd-0199-4ff0-8f52-fd8aaea278ab', 0, '9621839b-65fb-49cd-96f3-9e1fa0c11449', NULL, 1, 15000, '000', 0x313239),
('1b566833-3e13-4492-88ab-8f98e6a117ca', 0, 'abfac013-6f59-49a4-b1b8-233f3fb4971f', NULL, 1, 0, '000', 0x313330),
('20992dd7-d5a9-4400-8844-9b03305f2745', 0, '5fc18d75-75dd-4230-9e2f-c12127ad7ffc', NULL, 6, 500, '000', 0x313331),
('228d053a-303a-41d6-99d4-cae2338fab64', 0, '15bd0371-6990-43ea-832d-9e55eb3b7916', NULL, 1, 80000, '000', 0x313332),
('23040426-f1f6-406f-aea3-83208d6bc946', 0, '6b7efc03-a955-4269-9ca5-ca2bf04c3d48', NULL, 1, 3000, '000', 0x313333),
('29d25aa2-0398-40fe-ae1e-a723ed7a85a5', 0, 'fab8075c-0632-4158-8fc8-bd715bbadc3f', NULL, 1, 190000, '000', 0x313334),
('2c8d1022-bc9b-4c86-ae90-eae340b754dd', 0, '26bcebd0-96bf-423d-b669-0c18cd912827', NULL, 1, 50000, '000', 0x313335),
('2e4b3ab6-0ec8-475b-bc19-9fdc2d98b5ad', 0, '4152580f-d9b5-4a49-a8bf-ba10ff0c82da', NULL, 1, 30000, '000', 0x313336),
('2e4b3ab6-0ec8-475b-bc19-9fdc2d98b5ad', 1, '4152580f-d9b5-4a49-a8bf-ba10ff0c82da', NULL, 1, 30000, '000', 0x313337),
('35544bed-3d30-4dda-a99e-386714db79b6', 0, '5fc18d75-75dd-4230-9e2f-c12127ad7ffc', NULL, 10, 500, '000', 0x313338),
('35544bed-3d30-4dda-a99e-386714db79b6', 1, '15bd0371-6990-43ea-832d-9e55eb3b7916', NULL, 1, 80000, '000', 0x313339),
('3aeeaad1-23e8-462a-94d5-614126056919', 0, 'abfac013-6f59-49a4-b1b8-233f3fb4971f', NULL, 1, 0, '000', 0x313430),
('4178d88b-59b3-4125-9140-c17558de4c9e', 0, 'dda3b042-f1ec-4cf2-8b38-244a9c32f289', NULL, 7, 10000, '000', 0x313431),
('4178d88b-59b3-4125-9140-c17558de4c9e', 1, 'd8dce3ae-39d4-4580-a347-1a002ba65d7f', NULL, 7, 11000, '000', 0x313432),
('4178d88b-59b3-4125-9140-c17558de4c9e', 2, '6b7efc03-a955-4269-9ca5-ca2bf04c3d48', NULL, 1, 3000, '000', 0x313433),
('436c4bcb-1b8c-434b-b6f1-ba1d67761601', 0, '3f43d708-b1c2-48d6-9929-d25b0ee93152', NULL, 5, 5000, '000', 0x313434),
('436c4bcb-1b8c-434b-b6f1-ba1d67761601', 1, '2210ff62-20d3-499b-ab64-1344d6b02da5', NULL, 6, 5000, '000', 0x313435),
('436c4bcb-1b8c-434b-b6f1-ba1d67761601', 2, 'e5478b71-9b0e-43a7-998f-4435e10a294c', NULL, 1, 90000, '000', 0x313436),
('443c5679-19d9-4953-b2a3-9a556c697ac7', 0, '9621839b-65fb-49cd-96f3-9e1fa0c11449', NULL, 1, 15000, '000', 0x313437),
('443c5679-19d9-4953-b2a3-9a556c697ac7', 1, '61c6b4b9-8986-4c45-862c-dee267867b89', NULL, 1, 15000, '000', 0x313438),
('443c5679-19d9-4953-b2a3-9a556c697ac7', 2, 'd80aef84-aec7-4965-9541-efffa57db37f', NULL, 1, 15000, '000', 0x313439),
('443c5679-19d9-4953-b2a3-9a556c697ac7', 3, '3941df9e-4d01-4bce-81f8-12dea263db79', NULL, 1, 10000, '000', 0x313530),
('44b5f289-95c5-4938-8bb0-5f8601d0a8fd', 0, 'ee1ef151-1f9b-48a1-96cc-3de25fbb481e', NULL, 1, 160000, '000', 0x313531),
('466e792b-2526-4795-8983-3b531c7bd519', 0, 'f4eb5041-8f60-4d9b-8ed1-848d5771174c', NULL, 1, 4000, '000', 0x313532),
('47d32ca3-3546-4355-8100-a2f95d79b483', 0, '9621839b-65fb-49cd-96f3-9e1fa0c11449', NULL, 2, 15000, '000', 0x313533),
('47d32ca3-3546-4355-8100-a2f95d79b483', 1, '61c6b4b9-8986-4c45-862c-dee267867b89', NULL, 2, 15000, '000', 0x313534),
('47d32ca3-3546-4355-8100-a2f95d79b483', 2, 'd80aef84-aec7-4965-9541-efffa57db37f', NULL, 2, 15000, '000', 0x313535),
('48a5593e-b616-4b06-9df5-c25ad770ba9a', 0, '97ba6646-6dc8-4abf-9e7d-5bc84794bf20', NULL, 1, 530000, '000', 0x313536),
('58875cb0-a728-41a3-a842-f6a38746fa7a', 0, 'e5478b71-9b0e-43a7-998f-4435e10a294c', NULL, 1, 90000, '000', 0x313537),
('594baa4a-d86c-4a00-9ea2-116f382d2dcb', 0, '3941df9e-4d01-4bce-81f8-12dea263db79', NULL, 1, 10000, '000', 0x313538),
('59ff4ab4-9ba2-45d2-b631-294ea788fd63', 0, 'abe789c1-189b-4bf9-af4e-85c591da2c50', NULL, 1, 70000, '000', 0x313539),
('609017ac-302b-425f-97e6-9c403e84d3bb', 0, '76b24bf0-14a4-498a-a9d3-b9fe55991f4e', NULL, 1, 25000, '000', 0x313630),
('65495e91-fe6e-475b-96ec-c3d9b753d5e6', 0, 'b4d9023c-6a17-4f94-95af-fa5685cfdc58', NULL, 1, 90000, '000', 0x313631),
('65495e91-fe6e-475b-96ec-c3d9b753d5e6', 1, '3f43d708-b1c2-48d6-9929-d25b0ee93152', NULL, 3, 5000, '000', 0x313632),
('65495e91-fe6e-475b-96ec-c3d9b753d5e6', 2, '2210ff62-20d3-499b-ab64-1344d6b02da5', NULL, 2, 5000, '000', 0x313633),
('65495e91-fe6e-475b-96ec-c3d9b753d5e6', 3, 'd8dce3ae-39d4-4580-a347-1a002ba65d7f', NULL, 1, 11000, '000', 0x313634),
('65495e91-fe6e-475b-96ec-c3d9b753d5e6', 4, 'dda3b042-f1ec-4cf2-8b38-244a9c32f289', NULL, 1, 10000, '000', 0x313635),
('6651d21e-f826-4f22-8cdc-1dbf06fc2b49', 0, 'c7b19666-822f-400a-842f-60bfca4d8980', NULL, 1, 280000, '000', 0x313636),
('6787ae2f-ea3d-43cd-983e-ca09c3bc1f01', 0, 'abfac013-6f59-49a4-b1b8-233f3fb4971f', NULL, 1, 1000, '000', 0x313637),
('6ac66d4e-b115-49b7-ac71-4243234c052c', 0, '8e3f67a3-8341-499d-8082-b397ae0a9a7e', NULL, 1, 210000, '000', 0x313638),
('6ac66d4e-b115-49b7-ac71-4243234c052c', 1, 'd8dce3ae-39d4-4580-a347-1a002ba65d7f', NULL, 1, 11000, '000', 0x313639),
('6ac66d4e-b115-49b7-ac71-4243234c052c', 2, 'dda3b042-f1ec-4cf2-8b38-244a9c32f289', NULL, 3, 10000, '000', 0x313730),
('6ac66d4e-b115-49b7-ac71-4243234c052c', 3, '0f3f6dc5-b2a8-44c9-b8de-24bbdcc49d73', NULL, 1, 230000, '000', 0x313731),
('6ac66d4e-b115-49b7-ac71-4243234c052c', 4, 'ce638b72-3d7f-4558-9f7a-3d9a3f7e2cec', NULL, 1, 65000, '000', 0x313732),
('6ac66d4e-b115-49b7-ac71-4243234c052c', 5, '3f43d708-b1c2-48d6-9929-d25b0ee93152', NULL, 1, 5000, '000', 0x313733),
('6be45ed6-4fcf-45d2-ad34-a56c0aea18b6', 0, '8e3f67a3-8341-499d-8082-b397ae0a9a7e', NULL, 2, 210000, '000', 0x313734),
('6d914aa3-3d6c-4051-b550-c4fc1d47c917', 0, 'e53a3977-d9f0-40f6-b6df-fcdfd3259b1d', NULL, 1, 210000, '000', 0x313735),
('7401a5e0-16c1-4a40-881d-eb9436615ec0', 0, 'd8fbd110-16d9-4fd1-b73a-7bbdd8617c79', NULL, 1, 240000, '000', 0x313736),
('7401a5e0-16c1-4a40-881d-eb9436615ec0', 1, 'c3934860-bef3-4b73-adcd-2efdf629def1', NULL, 1, 20500, '000', 0x313737),
('7401a5e0-16c1-4a40-881d-eb9436615ec0', 2, 'b54a4b44-eb73-4d79-8fd0-30c8b87ec4ef', NULL, 4, 400, '000', 0x313738),
('74dce755-d188-4c5d-bcec-edef072a2efc', 0, 'd8dce3ae-39d4-4580-a347-1a002ba65d7f', NULL, 1, 11000, '000', 0x313739),
('787effa3-ecc7-426a-ae68-4fbdfa45ffa7', 0, 'abfac013-6f59-49a4-b1b8-233f3fb4971f', NULL, 1, 30000, '000', 0x313830),
('7ff68bfd-10af-4cd8-9699-2aa32c253aa6', 0, 'd8dce3ae-39d4-4580-a347-1a002ba65d7f', NULL, 1, 11000, '000', 0x313831),
('880455b6-da66-432a-bfe6-38a42945133d', 0, '2031c239-3158-45e4-852d-cc1c14956b6a', NULL, 1, 38000, '000', 0x313832),
('89882b29-cac3-41cd-9a8e-3d9c6410a6f5', 0, 'abfac013-6f59-49a4-b1b8-233f3fb4971f', NULL, -1, 10000, '000', 0x313833),
('8d5644fa-2992-4337-a5ba-92b4575af56b', 0, '9621839b-65fb-49cd-96f3-9e1fa0c11449', NULL, 1, 15000, '000', 0x313834),
('8d5644fa-2992-4337-a5ba-92b4575af56b', 1, '61c6b4b9-8986-4c45-862c-dee267867b89', NULL, 1, 15000, '000', 0x313835),
('8d5644fa-2992-4337-a5ba-92b4575af56b', 2, '3941df9e-4d01-4bce-81f8-12dea263db79', NULL, 1, 10000, '000', 0x313836),
('8d5644fa-2992-4337-a5ba-92b4575af56b', 3, 'd80aef84-aec7-4965-9541-efffa57db37f', NULL, 1, 15000, '000', 0x313837),
('8e2ae580-a5b2-4a8e-b291-c1c4cb2ac9d0', 0, 'b4d9023c-6a17-4f94-95af-fa5685cfdc58', NULL, 1, 90000, '000', 0x313838),
('8e2ae580-a5b2-4a8e-b291-c1c4cb2ac9d0', 1, 'dda3b042-f1ec-4cf2-8b38-244a9c32f289', NULL, 1, 10000, '000', 0x313839),
('8e2ae580-a5b2-4a8e-b291-c1c4cb2ac9d0', 2, 'd8dce3ae-39d4-4580-a347-1a002ba65d7f', NULL, 1, 11000, '000', 0x313930),
('8e2ae580-a5b2-4a8e-b291-c1c4cb2ac9d0', 3, '3f43d708-b1c2-48d6-9929-d25b0ee93152', NULL, 1, 5000, '000', 0x313931),
('98ea0468-8336-4503-801a-a0f72a0350cf', 0, '2210ff62-20d3-499b-ab64-1344d6b02da5', NULL, 5, 5000, '000', 0x313932),
('98ea0468-8336-4503-801a-a0f72a0350cf', 1, 'c7b19666-822f-400a-842f-60bfca4d8980', NULL, 1, 280000, '000', 0x313933),
('98ea0468-8336-4503-801a-a0f72a0350cf', 2, 'ee1ef151-1f9b-48a1-96cc-3de25fbb481e', NULL, 1, 180000, '000', 0x313934),
('9a2498b5-0fbc-4083-90da-921c53792f1b', 0, '3f43d708-b1c2-48d6-9929-d25b0ee93152', NULL, 3, 5000, '000', 0x313935),
('9a2498b5-0fbc-4083-90da-921c53792f1b', 1, '08e2052d-cbc8-48c7-9cec-d0c24d76a287', NULL, 1, 28000, '000', 0x313936),
('9a3d3b8d-449c-400c-b159-cc638482844e', 0, '3f43d708-b1c2-48d6-9929-d25b0ee93152', NULL, 3, 5000, '000', 0x313937),
('9c52480f-8017-4b8d-a475-f25da3cff897', 0, '3941df9e-4d01-4bce-81f8-12dea263db79', NULL, 1, 10000, '000', 0x313938),
('9c66fc40-492f-44de-958d-dbf7f5a100c5', 0, 'abfac013-6f59-49a4-b1b8-233f3fb4971f', NULL, 1, 10000, '000', 0x313939),
('a3581d8e-2a38-43c1-b3b2-16f0639d940d', 0, '5fc18d75-75dd-4230-9e2f-c12127ad7ffc', NULL, 14, 500, '000', 0x323030),
('a3581d8e-2a38-43c1-b3b2-16f0639d940d', 1, 'b54a4b44-eb73-4d79-8fd0-30c8b87ec4ef', NULL, 4, 400, '000', 0x323031),
('a60f60da-591e-4f9d-bc6c-1f4440b5c429', 0, '26bcebd0-96bf-423d-b669-0c18cd912827', NULL, 1, 50000, '000', 0x323032),
('a86a5893-d372-4a0c-abe5-2248f183f4f6', 0, 'b4d9023c-6a17-4f94-95af-fa5685cfdc58', NULL, -1, 90000, '000', 0x323033),
('a86a5893-d372-4a0c-abe5-2248f183f4f6', 1, 'dda3b042-f1ec-4cf2-8b38-244a9c32f289', NULL, -1, 10000, '000', 0x323034),
('a86a5893-d372-4a0c-abe5-2248f183f4f6', 2, 'd8dce3ae-39d4-4580-a347-1a002ba65d7f', NULL, -1, 11000, '000', 0x323034),
('a86a5893-d372-4a0c-abe5-2248f183f4f6', 3, '3f43d708-b1c2-48d6-9929-d25b0ee93152', NULL, -1, 5000, '000', 0x323035),
('abdf7967-28a5-4012-83c5-77bf4df81a45', 0, '97ba6646-6dc8-4abf-9e7d-5bc84794bf20', NULL, 1, 500000, '000', 0x323036),
('abfce397-1e03-4a59-a4c7-8944ac8c0d86', 0, '3f43d708-b1c2-48d6-9929-d25b0ee93152', NULL, 2, 5000, '000', 0x323037),
('abfce397-1e03-4a59-a4c7-8944ac8c0d86', 1, '2210ff62-20d3-499b-ab64-1344d6b02da5', NULL, 6, 5000, '000', 0x323038),
('aea6c580-040d-491d-84a3-036747f288df', 0, 'c7c5a4de-6cb1-4f31-b4b6-5af7eb529cc4', NULL, 1, 20000, '000', 0x323039),
('b008fe18-d5c1-4ac9-b761-1a6979c1264b', 0, 'ce638b72-3d7f-4558-9f7a-3d9a3f7e2cec', NULL, 2, 65000, '000', 0x333130),
('b008fe18-d5c1-4ac9-b761-1a6979c1264b', 1, 'dda3b042-f1ec-4cf2-8b38-244a9c32f289', NULL, 2, 10000, '000', 0x323131),
('b008fe18-d5c1-4ac9-b761-1a6979c1264b', 2, 'd8dce3ae-39d4-4580-a347-1a002ba65d7f', NULL, 2, 11000, '000', 0x323132),
('b0bdd32d-5b1a-49dc-908e-216ed2ee5786', 0, '81109003-89b0-4da1-8ab2-d0f06ffa839a', NULL, 1, 50000, '000', 0x323133),
('b3e3b918-9c4b-4e4b-858c-030c6a80c504', 0, '3b7394d3-05aa-4f4e-a115-4f8cb88884ac', NULL, 1, 195000, '000', 0x323134),
('b3e3b918-9c4b-4e4b-858c-030c6a80c504', 1, '9975dffd-a8e1-43df-9712-611140de31db', NULL, 1, 18000, '000', 0x323135),
('b3e3b918-9c4b-4e4b-858c-030c6a80c504', 2, '76b24bf0-14a4-498a-a9d3-b9fe55991f4e', NULL, 1, 25000, '000', 0x323136),
('b805329e-b01b-44b4-b9cf-6abd44019383', 0, 'aac4c6b0-f568-4374-afc3-d4fa1ea6c998', NULL, 1, 7000, '000', 0x323137),
('ba593fed-aa36-4e27-b244-0dbc34f07a09', 0, 'ee621994-b1f1-491f-bc8d-105821436a9a', NULL, 1, 40000, '000', 0x323138),
('bb8afa89-26c6-44ef-b524-c491404ed05b', 0, '2031c239-3158-45e4-852d-cc1c14956b6a', NULL, 1, 38000, '000', 0x323139),
('bef4d334-d56d-4455-ae27-78a85574f9df', 0, 'ce638b72-3d7f-4558-9f7a-3d9a3f7e2cec', NULL, -2, 65000, '000', 0x323230),
('bef4d334-d56d-4455-ae27-78a85574f9df', 1, 'dda3b042-f1ec-4cf2-8b38-244a9c32f289', NULL, -2, 10000, '000', 0x323231),
('bef4d334-d56d-4455-ae27-78a85574f9df', 2, 'd8dce3ae-39d4-4580-a347-1a002ba65d7f', NULL, -2, 11000, '000', 0x323232),
('c49a0d12-06c9-4051-8f53-67b2feaf5452', 0, '3941df9e-4d01-4bce-81f8-12dea263db79', NULL, 1, 10000, '000', 0x323233),
('c7daa965-c7d2-4424-a989-3887a2d4be9d', 0, '2031c239-3158-45e4-852d-cc1c14956b6a', NULL, 1, 38000, '000', 0x323234),
('da2e2793-b4cd-48cf-80e1-d0faa7224814', 0, '9621839b-65fb-49cd-96f3-9e1fa0c11449', NULL, 1, 15000, '000', 0x323235),
('da2e2793-b4cd-48cf-80e1-d0faa7224814', 1, '61c6b4b9-8986-4c45-862c-dee267867b89', NULL, 1, 15000, '000', 0x323236),
('e6ead73a-ba84-44d1-b7d0-af9754aafd10', 0, '173c9da7-791e-410d-9e1f-8825a1e69e07', NULL, 1, 280000, '000', 0x323237),
('f3931893-d27a-4712-abb6-2dd877761d86', 0, '39949465-403b-455f-9077-c352fadbbfcd', NULL, 1, 32000, '000', 0x323238),
('f3931893-d27a-4712-abb6-2dd877761d86', 1, '9975dffd-a8e1-43df-9712-611140de31db', NULL, 1, 18000, '000', 0x323239);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tickets`
--

CREATE TABLE `tickets` (
  `id` varchar(255) NOT NULL,
  `tickettype` int(11) NOT NULL DEFAULT '0',
  `ticketid` int(11) NOT NULL,
  `person` varchar(255) NOT NULL,
  `customer` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `tickets`
--

INSERT INTO `tickets` (`id`, `tickettype`, `ticketid`, `person`, `customer`, `status`) VALUES
('01fbe7b8-7afe-4e1d-b503-ae8c19496d85', 0, 65, '1', 'd59108eb-c366-419a-b071-7aba14d0314e', 0),
('0318a889-3cf3-4f7b-974f-2b04c8de7ed4', 0, 44, '1', '38509036-8eda-4546-8450-fcd1f9b67947', 0),
('03665f96-773d-4a9d-84db-72e043e7259e', 0, 52, '1', '71b7b489-bc26-410f-b4ab-32ec5c208300', 0),
('05aff32a-c5ce-48c8-a2f2-03cda09e3585', 0, 8, '1', '3f3aa57d-9d3d-4e32-92ef-02b1ebfdc9aa', 0),
('06fec5e0-fb6c-4c4b-a125-241c76d54390', 0, 49, '1', '38509036-8eda-4546-8450-fcd1f9b67947', 0),
('07a4e03a-65f9-4f45-be2f-4cae67b74c85', 0, 70, '1', NULL, 0),
('07b84fac-3e16-4367-8dcf-21419b31e672', 0, 45, '1', NULL, 0),
('07e69745-c30c-40b6-affd-48846d714716', 0, 47, '1', '71b7b489-bc26-410f-b4ab-32ec5c208300', 0),
('0962e48a-0ed0-46e9-83c9-09b6a183613f', 1, 3, '1', NULL, 23),
('09c26f75-84e3-4380-a891-954518d2875e', 2, 9, '1', '6d5d5b75-44ca-43a3-9404-4319e66f0b43', 0),
('09d23089-55ad-4c3d-8ec1-06a85dc85cad', 0, 33, '1', '3f3aa57d-9d3d-4e32-92ef-02b1ebfdc9aa', 0),
('0d91839e-b0a4-44ff-a75c-2add133e2c73', 0, 11, '1', '6d5d5b75-44ca-43a3-9404-4319e66f0b43', 0),
('0ee2803c-f5e1-41c7-b18d-7c0e5c14426f', 2, 4, '1', 'f15246e2-db79-43fe-baa5-d81d3a20d764', 0),
('100ee8d1-cdc5-431e-8588-b90993184edd', 0, 51, '1', '0b9027d7-3ba9-4032-8a9d-937102f177f6', 0),
('1075a9ee-9a2e-46a4-95b1-337ac7bebb46', 0, 41, '1', 'c004c832-c564-4b76-af6c-4c8e623bd25a', 0),
('1629889c-0044-4c0f-b25d-a54a428628a5', 0, 53, '1', '0ed8a037-a174-4e19-9009-82ab1c098b0c', 0),
('162d5d4b-9a43-449f-af69-8b46ec668437', 0, 32, '1', '38509036-8eda-4546-8450-fcd1f9b67947', 0),
('182a889c-022f-4c55-a4da-1125450034d7', 0, 42, '1', '1e8a1a1f-5193-4c7f-8477-d781cc2cfff0', 0),
('1a348ddd-0199-4ff0-8f52-fd8aaea278ab', 0, 63, '1', 'd59108eb-c366-419a-b071-7aba14d0314e', 0),
('1b566833-3e13-4492-88ab-8f98e6a117ca', 0, 24, '05ddd703-90ff-470f-b42c-17a5919630c2', NULL, 0),
('20992dd7-d5a9-4400-8844-9b03305f2745', 0, 60, '1', '38509036-8eda-4546-8450-fcd1f9b67947', 0),
('228d053a-303a-41d6-99d4-cae2338fab64', 0, 19, '1', '71b7b489-bc26-410f-b4ab-32ec5c208300', 0),
('23040426-f1f6-406f-aea3-83208d6bc946', 0, 43, '1', '38509036-8eda-4546-8450-fcd1f9b67947', 0),
('29d25aa2-0398-40fe-ae1e-a723ed7a85a5', 0, 31, '1', '38509036-8eda-4546-8450-fcd1f9b67947', 0),
('2c8d1022-bc9b-4c86-ae90-eae340b754dd', 0, 29, '1', NULL, 0),
('2e4b3ab6-0ec8-475b-bc19-9fdc2d98b5ad', 0, 68, '05ddd703-90ff-470f-b42c-17a5919630c2', NULL, 0),
('35544bed-3d30-4dda-a99e-386714db79b6', 0, 38, '1', '38509036-8eda-4546-8450-fcd1f9b67947', 0),
('3aeeaad1-23e8-462a-94d5-614126056919', 0, 21, '1', NULL, 0),
('3e976685-0da2-4626-aa1d-1f6264ea013c', 2, 8, '1', '3f3aa57d-9d3d-4e32-92ef-02b1ebfdc9aa', 0),
('4178d88b-59b3-4125-9140-c17558de4c9e', 0, 12, '1', '6d5d5b75-44ca-43a3-9404-4319e66f0b43', 0),
('436c4bcb-1b8c-434b-b6f1-ba1d67761601', 0, 50, '1', '6d5d5b75-44ca-43a3-9404-4319e66f0b43', 0),
('443c5679-19d9-4953-b2a3-9a556c697ac7', 0, 71, '1', '71b7b489-bc26-410f-b4ab-32ec5c208300', 0),
('44b5f289-95c5-4938-8bb0-5f8601d0a8fd', 0, 54, '1', NULL, 0),
('466e792b-2526-4795-8983-3b531c7bd519', 0, 46, '1', NULL, 0),
('47d32ca3-3546-4355-8100-a2f95d79b483', 0, 25, '1', '3f3aa57d-9d3d-4e32-92ef-02b1ebfdc9aa', 0),
('48a5593e-b616-4b06-9df5-c25ad770ba9a', 0, 26, '1', 'f15246e2-db79-43fe-baa5-d81d3a20d764', 0),
('58875cb0-a728-41a3-a842-f6a38746fa7a', 0, 3, '1', '6d5d5b75-44ca-43a3-9404-4319e66f0b43', 0),
('594baa4a-d86c-4a00-9ea2-116f382d2dcb', 0, 16, '1', NULL, 0),
('59ff4ab4-9ba2-45d2-b631-294ea788fd63', 0, 7, '1', 'f173950d-d222-4364-9ff7-23110780cf11', 0),
('5ab62cd5-846f-4ff5-a714-0e6208c5ef0d', 2, 3, '1', 'f15246e2-db79-43fe-baa5-d81d3a20d764', 0),
('609017ac-302b-425f-97e6-9c403e84d3bb', 0, 67, '1', NULL, 0),
('65495e91-fe6e-475b-96ec-c3d9b753d5e6', 0, 40, '1', '6d5d5b75-44ca-43a3-9404-4319e66f0b43', 0),
('6651d21e-f826-4f22-8cdc-1dbf06fc2b49', 0, 18, '1', 'c004c832-c564-4b76-af6c-4c8e623bd25a', 0),
('6787ae2f-ea3d-43cd-983e-ca09c3bc1f01', 0, 23, '1', NULL, 3),
('6ac66d4e-b115-49b7-ac71-4243234c052c', 0, 69, '1', '3f3aa57d-9d3d-4e32-92ef-02b1ebfdc9aa', 0),
('6be45ed6-4fcf-45d2-ad34-a56c0aea18b6', 0, 10, '1', '6d5d5b75-44ca-43a3-9404-4319e66f0b43', 0),
('6d914aa3-3d6c-4051-b550-c4fc1d47c917', 0, 61, '1', '38509036-8eda-4546-8450-fcd1f9b67947', 0),
('7401a5e0-16c1-4a40-881d-eb9436615ec0', 0, 17, '1', '3f3aa57d-9d3d-4e32-92ef-02b1ebfdc9aa', 0),
('74dce755-d188-4c5d-bcec-edef072a2efc', 0, 48, '1', '1e8a1a1f-5193-4c7f-8477-d781cc2cfff0', 0),
('787effa3-ecc7-426a-ae68-4fbdfa45ffa7', 0, 20, '1', NULL, 0),
('7ff68bfd-10af-4cd8-9699-2aa32c253aa6', 0, 58, '1', '38509036-8eda-4546-8450-fcd1f9b67947', 0),
('880455b6-da66-432a-bfe6-38a42945133d', 0, 55, '1', '71b7b489-bc26-410f-b4ab-32ec5c208300', 0),
('89882b29-cac3-41cd-9a8e-3d9c6410a6f5', 1, 2, '1', NULL, 22),
('8d5644fa-2992-4337-a5ba-92b4575af56b', 0, 37, '1', '64963bb7-7666-41bb-b6b7-7c756ff4da95', 0),
('8e2ae580-a5b2-4a8e-b291-c1c4cb2ac9d0', 0, 39, '1', '8aee8051-f5d8-4c7f-8aa1-bf3545a285d4', 4),
('98ea0468-8336-4503-801a-a0f72a0350cf', 0, 13, '1', '6d5d5b75-44ca-43a3-9404-4319e66f0b43', 0),
('9a2498b5-0fbc-4083-90da-921c53792f1b', 0, 57, '1', '0b9027d7-3ba9-4032-8a9d-937102f177f6', 0),
('9a3d3b8d-449c-400c-b159-cc638482844e', 0, 5, '1', '6d5d5b75-44ca-43a3-9404-4319e66f0b43', 0),
('9c52480f-8017-4b8d-a475-f25da3cff897', 0, 56, '1', '71b7b489-bc26-410f-b4ab-32ec5c208300', 0),
('9c66fc40-492f-44de-958d-dbf7f5a100c5', 0, 22, '1', NULL, 2),
('a3581d8e-2a38-43c1-b3b2-16f0639d940d', 0, 59, '1', '38509036-8eda-4546-8450-fcd1f9b67947', 0),
('a60f60da-591e-4f9d-bc6c-1f4440b5c429', 0, 30, '1', NULL, 0),
('a86a5893-d372-4a0c-abe5-2248f183f4f6', 1, 4, '1', '8aee8051-f5d8-4c7f-8aa1-bf3545a285d4', 39),
('ab7617b0-ab0f-4c2e-a121-c16690a02984', 2, 6, '1', '64963bb7-7666-41bb-b6b7-7c756ff4da95', 0),
('abdf7967-28a5-4012-83c5-77bf4df81a45', 0, 27, '1', NULL, 0),
('abfce397-1e03-4a59-a4c7-8944ac8c0d86', 0, 9, '1', '6d5d5b75-44ca-43a3-9404-4319e66f0b43', 0),
('aea6c580-040d-491d-84a3-036747f288df', 0, 6, '1', '71b7b489-bc26-410f-b4ab-32ec5c208300', 0),
('b008fe18-d5c1-4ac9-b761-1a6979c1264b', 0, 35, '1', 'c004c832-c564-4b76-af6c-4c8e623bd25a', 5),
('b0bdd32d-5b1a-49dc-908e-216ed2ee5786', 0, 36, '1', '71b7b489-bc26-410f-b4ab-32ec5c208300', 0),
('b140f772-8376-4f9b-84d5-efa0b7fd8322', 2, 5, '1', '1db6d3b2-a3fe-49b9-8026-91db5f2f8765', 0),
('b3e3b918-9c4b-4e4b-858c-030c6a80c504', 0, 2, '1', '71b7b489-bc26-410f-b4ab-32ec5c208300', 0),
('b4e2dfca-3622-48b2-a9ac-6987706a87b5', 2, 7, '1', '71b7b489-bc26-410f-b4ab-32ec5c208300', 0),
('b805329e-b01b-44b4-b9cf-6abd44019383', 0, 66, '1', '29c56615-2acf-4f8f-bfb6-a2ca888111b1', 0),
('ba593fed-aa36-4e27-b244-0dbc34f07a09', 0, 62, '1', '64963bb7-7666-41bb-b6b7-7c756ff4da95', 0),
('bb8afa89-26c6-44ef-b524-c491404ed05b', 0, 4, '1', '71b7b489-bc26-410f-b4ab-32ec5c208300', 0),
('bef4d334-d56d-4455-ae27-78a85574f9df', 1, 5, '1', 'c004c832-c564-4b76-af6c-4c8e623bd25a', 35),
('c49a0d12-06c9-4051-8f53-67b2feaf5452', 0, 34, '1', '71b7b489-bc26-410f-b4ab-32ec5c208300', 0),
('c7daa965-c7d2-4424-a989-3887a2d4be9d', 0, 14, '1', '6d5d5b75-44ca-43a3-9404-4319e66f0b43', 0),
('da2e2793-b4cd-48cf-80e1-d0faa7224814', 0, 28, '1', '23cf1268-0e2b-46d1-a8c0-71bf47a640be', 0),
('e6ead73a-ba84-44d1-b7d0-af9754aafd10', 0, 64, '1', 'c004c832-c564-4b76-af6c-4c8e623bd25a', 0),
('ec90122c-6bd9-445b-b9bf-de56a8fe49c1', 2, 2, '1', 'f173950d-d222-4364-9ff7-23110780cf11', 0),
('f3931893-d27a-4712-abb6-2dd877761d86', 0, 15, '1', '1db6d3b2-a3fe-49b9-8026-91db5f2f8765', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ticketsnum`
--

CREATE TABLE `ticketsnum` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `ticketsnum`
--

INSERT INTO `ticketsnum` (`id`) VALUES
(71);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ticketsnum_payment`
--

CREATE TABLE `ticketsnum_payment` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `ticketsnum_payment`
--

INSERT INTO `ticketsnum_payment` (`id`) VALUES
(9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ticketsnum_refund`
--

CREATE TABLE `ticketsnum_refund` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `ticketsnum_refund`
--

INSERT INTO `ticketsnum_refund` (`id`) VALUES
(5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `uom`
--

CREATE TABLE `uom` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `uom`
--

INSERT INTO `uom` (`id`, `name`) VALUES
('09220980-bc0f-4409-9a96-586d2b8a1918', 'METRO'),
('935c3030-4d7d-4ba5-ae0b-5b9d927eb73b', 'UNIDAD'),
('aa9490d4-774f-4b59-b9f1-cb00b009c4d2', 'CAJA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_provee`
--

CREATE TABLE `user_provee` (
  `identificacion_usuario` int(11) DEFAULT NULL,
  `id_proveedor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nombre_usuario` text NOT NULL,
  `apellido_usuario` text NOT NULL,
  `identificacion` int(11) NOT NULL,
  `correo` text NOT NULL,
  `clave` varchar(20) NOT NULL,
  `pais` text NOT NULL,
  `nombre_empresa` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre_usuario`, `apellido_usuario`, `identificacion`, `correo`, `clave`, `pais`, `nombre_empresa`) VALUES
(7, '', '', 98, 'jj', 'jj', 'Colombia', 'plus'),
(10, '', '', 222, 'rp', 'rp', 'Colombia', 'rp'),
(11, '', '', 8829, 'emp', 'emp', 'Colombia', 'emp'),
(6, '', '', 123456, 'alberto', 'alberto', 'Colombia', 'Alberto'),
(8, '', '', 16142625, 'alixfuentes@hotmail.com', '123456', 'Colombia', 'variedades plenosol'),
(4, '', '', 16146862, 'rodolfo', 'rodolfo', 'Colombia', 'rodolfo'),
(5, '', '', 23456789, 'plus', 'plus', 'Panama', 'plus'),
(12, 'br22', 'b23', 100000000, 'brayan', 'brayan', 'Colombia', 'MiProyect12'),
(3, '', '', 107827073, 'javire12@hotmail.com', 'javier', 'Colombia', 'freenet comunicaciones'),
(13, '', '', 321465778, 'cami', 'cami', 'Colombia', 'emCmila'),
(9, '', '', 1090377197, 'creandoimpresion.publicidad@gmail.com', 'publicidad2018', 'Colombia', 'creando impresion');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_empresa`
--

CREATE TABLE `usuarios_empresa` (
  `id_usuario_empresa` int(11) NOT NULL,
  `nombre_usuario_empresa` text NOT NULL,
  `apellido_usuario_empresa` text NOT NULL,
  `correo_usuario_empresa` varchar(30) NOT NULL,
  `contrasena_usuario_empresa` varchar(30) NOT NULL,
  `perfil_usuario_empresa` text NOT NULL,
  `identificacion_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios_empresa`
--

INSERT INTO `usuarios_empresa` (`id_usuario_empresa`, `nombre_usuario_empresa`, `apellido_usuario_empresa`, `correo_usuario_empresa`, `contrasena_usuario_empresa`, `perfil_usuario_empresa`, `identificacion_usuario`) VALUES
(1, 'juan', 'garcia', 'juanga@gmail.com', 'juan', 'usuario', 100000000),
(4, 'juean', 'lol', 'loo', '666r', 'usuario', 100000000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vendedores`
--

CREATE TABLE `vendedores` (
  `id_vendedor` int(11) NOT NULL,
  `nombre_vendedor` text NOT NULL,
  `apellido_vendedor` text NOT NULL,
  `identificacion_vendedor` int(11) NOT NULL,
  `identificacion_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `vendedores`
--

INSERT INTO `vendedores` (`id_vendedor`, `nombre_vendedor`, `apellido_vendedor`, `identificacion_vendedor`, `identificacion_usuario`) VALUES
(5, 'mario', 'fernandez', 121, 100000000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vouchers`
--

CREATE TABLE `vouchers` (
  `id` varchar(100) NOT NULL,
  `voucher_number` varchar(100) DEFAULT NULL,
  `customer` varchar(100) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `status` char(1) DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `applications`
--
ALTER TABLE `applications`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `attribute`
--
ALTER TABLE `attribute`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `attributeinstance`
--
ALTER TABLE `attributeinstance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attinst_att` (`attribute_id`),
  ADD KEY `attinst_set` (`attributesetinstance_id`);

--
-- Indices de la tabla `attributeset`
--
ALTER TABLE `attributeset`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `attributesetinstance`
--
ALTER TABLE `attributesetinstance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attsetinst_set` (`attributeset_id`);

--
-- Indices de la tabla `attributeuse`
--
ALTER TABLE `attributeuse`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `attuse_line` (`attributeset_id`,`lineno`),
  ADD KEY `attuse_att` (`attribute_id`);

--
-- Indices de la tabla `attributevalue`
--
ALTER TABLE `attributevalue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attval_att` (`attribute_id`);

--
-- Indices de la tabla `bancos`
--
ALTER TABLE `bancos`
  ADD PRIMARY KEY (`id_banco`),
  ADD KEY `identificacion_usuario` (`identificacion_usuario`),
  ADD KEY `identificacion_usuario_2` (`identificacion_usuario`);

--
-- Indices de la tabla `breaks`
--
ALTER TABLE `breaks`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`),
  ADD KEY `identificacion_usuario` (`identificacion_usuario`);

--
-- Indices de la tabla `categorias_item`
--
ALTER TABLE `categorias_item`
  ADD PRIMARY KEY (`id_categoria_item`),
  ADD KEY `id_categoria` (`id_categorizacion_rama6`),
  ADD KEY `id_categorizacion_rama5` (`id_categorizacion_rama6`);

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_name_inx` (`name`),
  ADD KEY `categories_fk_1` (`parentid`);

--
-- Indices de la tabla `categorizacion_rama2`
--
ALTER TABLE `categorizacion_rama2`
  ADD PRIMARY KEY (`id_categorizacion_rama2`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Indices de la tabla `categorizacion_rama3`
--
ALTER TABLE `categorizacion_rama3`
  ADD PRIMARY KEY (`id_categorizacion_rama3`),
  ADD KEY `id_categorizacion_rama2` (`id_categorizacion_rama2`),
  ADD KEY `id_categorizacion_rama2_2` (`id_categorizacion_rama2`);

--
-- Indices de la tabla `categorizacion_rama4`
--
ALTER TABLE `categorizacion_rama4`
  ADD PRIMARY KEY (`id_categorizacion_rama4`),
  ADD KEY `id_categorizacion_rama3` (`id_categorizacion_rama3`);

--
-- Indices de la tabla `categorizacion_rama5`
--
ALTER TABLE `categorizacion_rama5`
  ADD PRIMARY KEY (`id_categorizacion_rama5`),
  ADD KEY `id_categorizacion_rama4` (`id_categorizacion_rama4`);

--
-- Indices de la tabla `categorizacion_rama6`
--
ALTER TABLE `categorizacion_rama6`
  ADD PRIMARY KEY (`id_categorizacion_rama6`),
  ADD KEY `id_categorizacion_rama5` (`id_categorizacion_rama5`);

--
-- Indices de la tabla `closedcash`
--
ALTER TABLE `closedcash`
  ADD PRIMARY KEY (`money`),
  ADD UNIQUE KEY `closedcash_inx_seq` (`host`,`hostsequence`),
  ADD KEY `closedcash_inx_1` (`datestart`);

--
-- Indices de la tabla `configuraciones`
--
ALTER TABLE `configuraciones`
  ADD UNIQUE KEY `id_configuracion` (`id_configuracion`),
  ADD KEY `identificacion_usuario` (`identificacion_usuario`);

--
-- Indices de la tabla `cotizaciones`
--
ALTER TABLE `cotizaciones`
  ADD PRIMARY KEY (`cod_cotizacion`),
  ADD UNIQUE KEY `id_cotizacion` (`id_cotizacion`),
  ADD KEY `identificacion_usuario` (`identificacion_usuario`);

--
-- Indices de la tabla `csvimport`
--
ALTER TABLE `csvimport`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customers_skey_inx` (`searchkey`),
  ADD KEY `customers_card_inx` (`card`),
  ADD KEY `customers_name_inx` (`name`),
  ADD KEY `customers_taxcat` (`taxcategory`),
  ADD KEY `customers_taxid_inx` (`taxid`),
  ADD KEY `identificacion_usuario` (`identificacion_usuario`);

--
-- Indices de la tabla `descuentos`
--
ALTER TABLE `descuentos`
  ADD PRIMARY KEY (`id_descuento`),
  ADD UNIQUE KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`identificacion_empleado`),
  ADD UNIQUE KEY `id_empleado` (`id_empleado`),
  ADD KEY `identificacion_usuario` (`identificacion_usuario`);

--
-- Indices de la tabla `entradas`
--
ALTER TABLE `entradas`
  ADD PRIMARY KEY (`id_entrada`);

--
-- Indices de la tabla `floors`
--
ALTER TABLE `floors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `floors_name_inx` (`name`);

--
-- Indices de la tabla `gastos`
--
ALTER TABLE `gastos`
  ADD PRIMARY KEY (`id_gasto`),
  ADD KEY `identificacion_usuario` (`identificacion_usuario`);

--
-- Indices de la tabla `impuestos`
--
ALTER TABLE `impuestos`
  ADD PRIMARY KEY (`id_impuesto`),
  ADD KEY `identificacion_usuario` (`identificacion_usuario`);

--
-- Indices de la tabla `inventarios`
--
ALTER TABLE `inventarios`
  ADD PRIMARY KEY (`id_inventario`),
  ADD KEY `identificacion_usuario` (`identificacion_usuario`);

--
-- Indices de la tabla `inventarios_item`
--
ALTER TABLE `inventarios_item`
  ADD PRIMARY KEY (`id_inventario_item`),
  ADD KEY `id_categoria_item` (`id_categoria_item`);

--
-- Indices de la tabla `item_factura`
--
ALTER TABLE `item_factura`
  ADD PRIMARY KEY (`id_item_factura`);

--
-- Indices de la tabla `leaves`
--
ALTER TABLE `leaves`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leaves_pplid` (`pplid`);

--
-- Indices de la tabla `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `locations_name_inx` (`name`);

--
-- Indices de la tabla `log_usuarios`
--
ALTER TABLE `log_usuarios`
  ADD PRIMARY KEY (`id_log_usuario`),
  ADD KEY `identificacion_usuario` (`identificacion_usuario`);

--
-- Indices de la tabla `materiales`
--
ALTER TABLE `materiales`
  ADD PRIMARY KEY (`id_material`),
  ADD KEY `identificacion_usuario` (`identificacion_usuario`);

--
-- Indices de la tabla `notas`
--
ALTER TABLE `notas`
  ADD PRIMARY KEY (`id_nota`),
  ADD KEY `identificacion_usuario` (`identificacion_usuario`);

--
-- Indices de la tabla `numeraciones`
--
ALTER TABLE `numeraciones`
  ADD PRIMARY KEY (`id_numeracion`),
  ADD KEY `identificacion_usuario` (`identificacion_usuario`);

--
-- Indices de la tabla `numeraciones_generales`
--
ALTER TABLE `numeraciones_generales`
  ADD PRIMARY KEY (`id_numeracion_general`),
  ADD KEY `identificacion_usuario` (`identificacion_usuario`);

--
-- Indices de la tabla `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`id_pago`),
  ADD KEY `identificacion_usuario` (`identificacion_usuario`);

--
-- Indices de la tabla `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_fk_receipt` (`receipt`),
  ADD KEY `payments_inx_1` (`payment`);

--
-- Indices de la tabla `people`
--
ALTER TABLE `people`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `people_name_inx` (`name`),
  ADD KEY `people_card_inx` (`card`),
  ADD KEY `people_fk_1` (`role`);

--
-- Indices de la tabla `places`
--
ALTER TABLE `places`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `places_name_inx` (`name`);

--
-- Indices de la tabla `plazos`
--
ALTER TABLE `plazos`
  ADD PRIMARY KEY (`id_plazo`),
  ADD KEY `identificacion_usuario` (`identificacion_usuario`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `identificacion_usuario` (`identificacion_usuario`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_inx_0` (`reference`),
  ADD UNIQUE KEY `products_inx_1` (`code`),
  ADD KEY `products_attrset_fx` (`attributeset_id`),
  ADD KEY `products_fk_1` (`category`),
  ADD KEY `products_name_inx` (`name`),
  ADD KEY `products_taxcat_fk` (`taxcat`);

--
-- Indices de la tabla `products_bundle`
--
ALTER TABLE `products_bundle`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pbundle_inx_prod` (`product`,`product_bundle`),
  ADD KEY `products_bundle_fk_2` (`product_bundle`);

--
-- Indices de la tabla `products_cat`
--
ALTER TABLE `products_cat`
  ADD PRIMARY KEY (`product`),
  ADD KEY `products_cat_inx_1` (`catorder`);

--
-- Indices de la tabla `products_com`
--
ALTER TABLE `products_com`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pcom_inx_prod` (`product`,`product2`),
  ADD KEY `products_com_fk_2` (`product2`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`identificacion_proveedor`),
  ADD UNIQUE KEY `id_proveedor` (`id_proveedor`),
  ADD KEY `identificacion_usuario` (`identificacion_usuario`);

--
-- Indices de la tabla `receipts`
--
ALTER TABLE `receipts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `receipts_fk_money` (`money`),
  ADD KEY `receipts_inx_1` (`datenew`);

--
-- Indices de la tabla `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reservations_inx_1` (`datenew`);

--
-- Indices de la tabla `reservation_customers`
--
ALTER TABLE `reservation_customers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `res_cust_fk_2` (`customer`);

--
-- Indices de la tabla `resources`
--
ALTER TABLE `resources`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `resources_name_inx` (`name`);

--
-- Indices de la tabla `retenciones`
--
ALTER TABLE `retenciones`
  ADD PRIMARY KEY (`id_retencion`),
  ADD KEY `identificacion_usuario` (`identificacion_usuario`),
  ADD KEY `identificacion_usuario_2` (`identificacion_usuario`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_inx` (`name`);

--
-- Indices de la tabla `sharedtickets`
--
ALTER TABLE `sharedtickets`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `shifts`
--
ALTER TABLE `shifts`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `shift_breaks`
--
ALTER TABLE `shift_breaks`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `SHIFT_BREAKS_BREAKID` (`BREAKID`),
  ADD KEY `SHIFT_BREAKS_SHIFTID` (`SHIFTID`);

--
-- Indices de la tabla `stockcurrent`
--
ALTER TABLE `stockcurrent`
  ADD UNIQUE KEY `stockcurrent_inx` (`location`,`product`,`attributesetinstance_id`),
  ADD KEY `stockcurrent_attsetinst` (`attributesetinstance_id`),
  ADD KEY `stockcurrent_fk_1` (`product`);

--
-- Indices de la tabla `stockdiary`
--
ALTER TABLE `stockdiary`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stockdiary_attsetinst` (`attributesetinstance_id`),
  ADD KEY `stockdiary_fk_1` (`product`),
  ADD KEY `stockdiary_fk_2` (`location`),
  ADD KEY `stockdiary_inx_1` (`datenew`);

--
-- Indices de la tabla `stocklevel`
--
ALTER TABLE `stocklevel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stocklevel_location` (`location`),
  ADD KEY `stocklevel_product` (`product`);

--
-- Indices de la tabla `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `suppliers_skey_inx` (`searchkey`),
  ADD KEY `suppliers_name_inx` (`name`);

--
-- Indices de la tabla `taxcategories`
--
ALTER TABLE `taxcategories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `taxcat_name_inx` (`name`);

--
-- Indices de la tabla `taxcustcategories`
--
ALTER TABLE `taxcustcategories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `taxcustcat_name_inx` (`name`);

--
-- Indices de la tabla `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `taxes_name_inx` (`name`),
  ADD KEY `taxes_cat_fk` (`category`),
  ADD KEY `taxes_custcat_fk` (`custcategory`),
  ADD KEY `taxes_taxes_fk` (`parentid`);

--
-- Indices de la tabla `taxlines`
--
ALTER TABLE `taxlines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `taxlines_receipt` (`receipt`),
  ADD KEY `taxlines_tax` (`taxid`);

--
-- Indices de la tabla `taxsuppcategories`
--
ALTER TABLE `taxsuppcategories`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `thirdparties`
--
ALTER TABLE `thirdparties`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `thirdparties_cif_inx` (`cif`),
  ADD UNIQUE KEY `thirdparties_name_inx` (`name`);

--
-- Indices de la tabla `ticketlines`
--
ALTER TABLE `ticketlines`
  ADD PRIMARY KEY (`ticket`,`line`),
  ADD KEY `ticketlines_attsetinst` (`attributesetinstance_id`),
  ADD KEY `ticketlines_fk_2` (`product`),
  ADD KEY `ticketlines_fk_3` (`taxid`);

--
-- Indices de la tabla `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tickets_customers_fk` (`customer`),
  ADD KEY `tickets_fk_2` (`person`),
  ADD KEY `tickets_ticketid` (`tickettype`,`ticketid`);

--
-- Indices de la tabla `ticketsnum_payment`
--
ALTER TABLE `ticketsnum_payment`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `uom`
--
ALTER TABLE `uom`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `user_provee`
--
ALTER TABLE `user_provee`
  ADD KEY `identificacion_usuario` (`identificacion_usuario`),
  ADD KEY `id_proveedor` (`id_proveedor`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`identificacion`),
  ADD UNIQUE KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `usuarios_empresa`
--
ALTER TABLE `usuarios_empresa`
  ADD PRIMARY KEY (`id_usuario_empresa`),
  ADD KEY `identificacion_usuario` (`identificacion_usuario`);

--
-- Indices de la tabla `vendedores`
--
ALTER TABLE `vendedores`
  ADD PRIMARY KEY (`id_vendedor`),
  ADD KEY `identificacion_usuario` (`identificacion_usuario`);

--
-- Indices de la tabla `vouchers`
--
ALTER TABLE `vouchers`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `bancos`
--
ALTER TABLE `bancos`
  MODIFY `id_banco` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `categorias_item`
--
ALTER TABLE `categorias_item`
  MODIFY `id_categoria_item` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categorizacion_rama2`
--
ALTER TABLE `categorizacion_rama2`
  MODIFY `id_categorizacion_rama2` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `categorizacion_rama3`
--
ALTER TABLE `categorizacion_rama3`
  MODIFY `id_categorizacion_rama3` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `categorizacion_rama4`
--
ALTER TABLE `categorizacion_rama4`
  MODIFY `id_categorizacion_rama4` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT de la tabla `categorizacion_rama5`
--
ALTER TABLE `categorizacion_rama5`
  MODIFY `id_categorizacion_rama5` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `categorizacion_rama6`
--
ALTER TABLE `categorizacion_rama6`
  MODIFY `id_categorizacion_rama6` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `configuraciones`
--
ALTER TABLE `configuraciones`
  MODIFY `id_configuracion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cotizaciones`
--
ALTER TABLE `cotizaciones`
  MODIFY `id_cotizacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `descuentos`
--
ALTER TABLE `descuentos`
  MODIFY `id_descuento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `id_empleado` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `entradas`
--
ALTER TABLE `entradas`
  MODIFY `id_entrada` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `gastos`
--
ALTER TABLE `gastos`
  MODIFY `id_gasto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `impuestos`
--
ALTER TABLE `impuestos`
  MODIFY `id_impuesto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `inventarios`
--
ALTER TABLE `inventarios`
  MODIFY `id_inventario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inventarios_item`
--
ALTER TABLE `inventarios_item`
  MODIFY `id_inventario_item` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `item_factura`
--
ALTER TABLE `item_factura`
  MODIFY `id_item_factura` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `log_usuarios`
--
ALTER TABLE `log_usuarios`
  MODIFY `id_log_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `materiales`
--
ALTER TABLE `materiales`
  MODIFY `id_material` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `notas`
--
ALTER TABLE `notas`
  MODIFY `id_nota` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `numeraciones`
--
ALTER TABLE `numeraciones`
  MODIFY `id_numeracion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `numeraciones_generales`
--
ALTER TABLE `numeraciones_generales`
  MODIFY `id_numeracion_general` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `orders`
--
ALTER TABLE `orders`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `id_pago` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `plazos`
--
ALTER TABLE `plazos`
  MODIFY `id_plazo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id_proveedor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `retenciones`
--
ALTER TABLE `retenciones`
  MODIFY `id_retencion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `usuarios_empresa`
--
ALTER TABLE `usuarios_empresa`
  MODIFY `id_usuario_empresa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `vendedores`
--
ALTER TABLE `vendedores`
  MODIFY `id_vendedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `attributeinstance`
--
ALTER TABLE `attributeinstance`
  ADD CONSTRAINT `attinst_att` FOREIGN KEY (`attribute_id`) REFERENCES `attribute` (`id`),
  ADD CONSTRAINT `attinst_set` FOREIGN KEY (`attributesetinstance_id`) REFERENCES `attributesetinstance` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `attributesetinstance`
--
ALTER TABLE `attributesetinstance`
  ADD CONSTRAINT `attsetinst_set` FOREIGN KEY (`attributeset_id`) REFERENCES `attributeset` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `attributeuse`
--
ALTER TABLE `attributeuse`
  ADD CONSTRAINT `attuse_att` FOREIGN KEY (`attribute_id`) REFERENCES `attribute` (`id`),
  ADD CONSTRAINT `attuse_set` FOREIGN KEY (`attributeset_id`) REFERENCES `attributeset` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `attributevalue`
--
ALTER TABLE `attributevalue`
  ADD CONSTRAINT `attval_att` FOREIGN KEY (`attribute_id`) REFERENCES `attribute` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `bancos`
--
ALTER TABLE `bancos`
  ADD CONSTRAINT `bancos_ibfk_1` FOREIGN KEY (`identificacion_usuario`) REFERENCES `usuarios` (`identificacion`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD CONSTRAINT `categorias_ibfk_1` FOREIGN KEY (`identificacion_usuario`) REFERENCES `usuarios` (`identificacion`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `categorias_item`
--
ALTER TABLE `categorias_item`
  ADD CONSTRAINT `categorias_item_ibfk_1` FOREIGN KEY (`id_categorizacion_rama6`) REFERENCES `categorizacion_rama6` (`id_categorizacion_rama6`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_fk_1` FOREIGN KEY (`parentid`) REFERENCES `categories` (`id`);

--
-- Filtros para la tabla `categorizacion_rama2`
--
ALTER TABLE `categorizacion_rama2`
  ADD CONSTRAINT `categorizacion_rama2_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `categorizacion_rama3`
--
ALTER TABLE `categorizacion_rama3`
  ADD CONSTRAINT `categorizacion_rama3_ibfk_1` FOREIGN KEY (`id_categorizacion_rama2`) REFERENCES `categorizacion_rama2` (`id_categorizacion_rama2`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `categorizacion_rama4`
--
ALTER TABLE `categorizacion_rama4`
  ADD CONSTRAINT `categorizacion_rama4_ibfk_1` FOREIGN KEY (`id_categorizacion_rama3`) REFERENCES `categorizacion_rama3` (`id_categorizacion_rama3`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `categorizacion_rama5`
--
ALTER TABLE `categorizacion_rama5`
  ADD CONSTRAINT `categorizacion_rama5_ibfk_1` FOREIGN KEY (`id_categorizacion_rama4`) REFERENCES `categorizacion_rama4` (`id_categorizacion_rama4`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `categorizacion_rama6`
--
ALTER TABLE `categorizacion_rama6`
  ADD CONSTRAINT `categorizacion_rama6_ibfk_1` FOREIGN KEY (`id_categorizacion_rama5`) REFERENCES `categorizacion_rama5` (`id_categorizacion_rama5`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `configuraciones`
--
ALTER TABLE `configuraciones`
  ADD CONSTRAINT `configuraciones_ibfk_1` FOREIGN KEY (`identificacion_usuario`) REFERENCES `usuarios` (`identificacion`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `cotizaciones`
--
ALTER TABLE `cotizaciones`
  ADD CONSTRAINT `cotizaciones_ibfk_1` FOREIGN KEY (`identificacion_usuario`) REFERENCES `usuarios` (`identificacion`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`identificacion_usuario`) REFERENCES `usuarios` (`identificacion`),
  ADD CONSTRAINT `customers_taxcat` FOREIGN KEY (`taxcategory`) REFERENCES `taxcustcategories` (`id`);

--
-- Filtros para la tabla `descuentos`
--
ALTER TABLE `descuentos`
  ADD CONSTRAINT `descuentos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`identificacion`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`identificacion_usuario`) REFERENCES `usuarios` (`identificacion`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `gastos`
--
ALTER TABLE `gastos`
  ADD CONSTRAINT `gastos_ibfk_1` FOREIGN KEY (`identificacion_usuario`) REFERENCES `usuarios` (`identificacion`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `impuestos`
--
ALTER TABLE `impuestos`
  ADD CONSTRAINT `impuestos_ibfk_1` FOREIGN KEY (`identificacion_usuario`) REFERENCES `usuarios` (`identificacion`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `inventarios`
--
ALTER TABLE `inventarios`
  ADD CONSTRAINT `inventarios_ibfk_1` FOREIGN KEY (`identificacion_usuario`) REFERENCES `usuarios` (`identificacion`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `inventarios_item`
--
ALTER TABLE `inventarios_item`
  ADD CONSTRAINT `inventarios_item_ibfk_1` FOREIGN KEY (`id_categoria_item`) REFERENCES `categorias_item` (`id_categoria_item`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `leaves`
--
ALTER TABLE `leaves`
  ADD CONSTRAINT `leaves_pplid` FOREIGN KEY (`pplid`) REFERENCES `people` (`id`);

--
-- Filtros para la tabla `log_usuarios`
--
ALTER TABLE `log_usuarios`
  ADD CONSTRAINT `log_usuarios_ibfk_1` FOREIGN KEY (`identificacion_usuario`) REFERENCES `usuarios` (`identificacion`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `materiales`
--
ALTER TABLE `materiales`
  ADD CONSTRAINT `materiales_ibfk_1` FOREIGN KEY (`identificacion_usuario`) REFERENCES `usuarios` (`identificacion`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `notas`
--
ALTER TABLE `notas`
  ADD CONSTRAINT `notas_ibfk_1` FOREIGN KEY (`identificacion_usuario`) REFERENCES `usuarios` (`identificacion`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `numeraciones`
--
ALTER TABLE `numeraciones`
  ADD CONSTRAINT `numeraciones_ibfk_1` FOREIGN KEY (`identificacion_usuario`) REFERENCES `usuarios` (`identificacion`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `numeraciones_generales`
--
ALTER TABLE `numeraciones_generales`
  ADD CONSTRAINT `numeraciones_generales_ibfk_1` FOREIGN KEY (`identificacion_usuario`) REFERENCES `usuarios` (`identificacion`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`identificacion_usuario`) REFERENCES `usuarios` (`identificacion`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_fk_receipt` FOREIGN KEY (`receipt`) REFERENCES `receipts` (`id`);

--
-- Filtros para la tabla `people`
--
ALTER TABLE `people`
  ADD CONSTRAINT `people_fk_1` FOREIGN KEY (`role`) REFERENCES `roles` (`id`);

--
-- Filtros para la tabla `plazos`
--
ALTER TABLE `plazos`
  ADD CONSTRAINT `plazos_ibfk_1` FOREIGN KEY (`identificacion_usuario`) REFERENCES `usuarios` (`identificacion`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`identificacion_usuario`) REFERENCES `usuarios` (`identificacion`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_attrset_fk` FOREIGN KEY (`attributeset_id`) REFERENCES `attributeset` (`id`),
  ADD CONSTRAINT `products_fk_1` FOREIGN KEY (`category`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_taxcat_fk` FOREIGN KEY (`taxcat`) REFERENCES `taxcategories` (`id`);

--
-- Filtros para la tabla `products_bundle`
--
ALTER TABLE `products_bundle`
  ADD CONSTRAINT `products_bundle_fk_1` FOREIGN KEY (`product`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `products_bundle_fk_2` FOREIGN KEY (`product_bundle`) REFERENCES `products` (`id`);

--
-- Filtros para la tabla `products_cat`
--
ALTER TABLE `products_cat`
  ADD CONSTRAINT `products_cat_fk_1` FOREIGN KEY (`product`) REFERENCES `products` (`id`);

--
-- Filtros para la tabla `products_com`
--
ALTER TABLE `products_com`
  ADD CONSTRAINT `products_com_fk_1` FOREIGN KEY (`product`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `products_com_fk_2` FOREIGN KEY (`product2`) REFERENCES `products` (`id`);

--
-- Filtros para la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD CONSTRAINT `proveedores_ibfk_1` FOREIGN KEY (`identificacion_usuario`) REFERENCES `usuarios` (`identificacion`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `receipts`
--
ALTER TABLE `receipts`
  ADD CONSTRAINT `receipts_fk_money` FOREIGN KEY (`money`) REFERENCES `closedcash` (`money`);

--
-- Filtros para la tabla `reservation_customers`
--
ALTER TABLE `reservation_customers`
  ADD CONSTRAINT `res_cust_fk_1` FOREIGN KEY (`id`) REFERENCES `reservations` (`id`),
  ADD CONSTRAINT `res_cust_fk_2` FOREIGN KEY (`customer`) REFERENCES `customers` (`id`);

--
-- Filtros para la tabla `shift_breaks`
--
ALTER TABLE `shift_breaks`
  ADD CONSTRAINT `SHIFT_BREAKS_BREAKID` FOREIGN KEY (`BREAKID`) REFERENCES `breaks` (`id`),
  ADD CONSTRAINT `SHIFT_BREAKS_SHIFTID` FOREIGN KEY (`SHIFTID`) REFERENCES `shifts` (`id`);

--
-- Filtros para la tabla `stockcurrent`
--
ALTER TABLE `stockcurrent`
  ADD CONSTRAINT `stockcurrent_attsetinst` FOREIGN KEY (`attributesetinstance_id`) REFERENCES `attributesetinstance` (`id`),
  ADD CONSTRAINT `stockcurrent_fk_1` FOREIGN KEY (`product`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `stockcurrent_fk_2` FOREIGN KEY (`location`) REFERENCES `locations` (`id`);

--
-- Filtros para la tabla `stockdiary`
--
ALTER TABLE `stockdiary`
  ADD CONSTRAINT `stockdiary_attsetinst` FOREIGN KEY (`attributesetinstance_id`) REFERENCES `attributesetinstance` (`id`),
  ADD CONSTRAINT `stockdiary_fk_1` FOREIGN KEY (`product`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `stockdiary_fk_2` FOREIGN KEY (`location`) REFERENCES `locations` (`id`);

--
-- Filtros para la tabla `stocklevel`
--
ALTER TABLE `stocklevel`
  ADD CONSTRAINT `stocklevel_location` FOREIGN KEY (`location`) REFERENCES `locations` (`id`),
  ADD CONSTRAINT `stocklevel_product` FOREIGN KEY (`product`) REFERENCES `products` (`id`);

--
-- Filtros para la tabla `taxes`
--
ALTER TABLE `taxes`
  ADD CONSTRAINT `taxes_cat_fk` FOREIGN KEY (`category`) REFERENCES `taxcategories` (`id`),
  ADD CONSTRAINT `taxes_custcat_fk` FOREIGN KEY (`custcategory`) REFERENCES `taxcustcategories` (`id`),
  ADD CONSTRAINT `taxes_taxes_fk` FOREIGN KEY (`parentid`) REFERENCES `taxes` (`id`);

--
-- Filtros para la tabla `taxlines`
--
ALTER TABLE `taxlines`
  ADD CONSTRAINT `taxlines_receipt` FOREIGN KEY (`receipt`) REFERENCES `receipts` (`id`),
  ADD CONSTRAINT `taxlines_tax` FOREIGN KEY (`taxid`) REFERENCES `taxes` (`id`);

--
-- Filtros para la tabla `ticketlines`
--
ALTER TABLE `ticketlines`
  ADD CONSTRAINT `ticketlines_attsetinst` FOREIGN KEY (`attributesetinstance_id`) REFERENCES `attributesetinstance` (`id`),
  ADD CONSTRAINT `ticketlines_fk_2` FOREIGN KEY (`product`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `ticketlines_fk_3` FOREIGN KEY (`taxid`) REFERENCES `taxes` (`id`),
  ADD CONSTRAINT `ticketlines_fk_ticket` FOREIGN KEY (`ticket`) REFERENCES `tickets` (`id`);

--
-- Filtros para la tabla `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_customers_fk` FOREIGN KEY (`customer`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `tickets_fk_2` FOREIGN KEY (`person`) REFERENCES `people` (`id`),
  ADD CONSTRAINT `tickets_fk_id` FOREIGN KEY (`id`) REFERENCES `receipts` (`id`);

--
-- Filtros para la tabla `vendedores`
--
ALTER TABLE `vendedores`
  ADD CONSTRAINT `vendedores_ibfk_1` FOREIGN KEY (`identificacion_usuario`) REFERENCES `usuarios` (`identificacion`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
