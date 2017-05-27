-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-02-2017 a las 21:40:51
-- Versión del servidor: 5.6.26
-- Versión de PHP: 5.5.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sgrrhh_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rhco_concepto`
--

CREATE TABLE IF NOT EXISTS `rhco_concepto` (
  `cot_cod` int(15) NOT NULL COMMENT 'Codigo',
  `cot_des` varchar(30) COLLATE utf8_bin NOT NULL COMMENT 'Descripcion'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Deposito de Concepto';

--
-- Volcado de datos para la tabla `rhco_concepto`
--

INSERT INTO `rhco_concepto` (`cot_cod`, `cot_des`) VALUES
(1, 'Pago de Salario'),
(2, 'Nuevo '),
(3, 'otro'),
(4, 'Liquidaciones otros');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rhco_rubro`
--

CREATE TABLE IF NOT EXISTS `rhco_rubro` (
  `rub_cod` int(15) NOT NULL COMMENT 'Codigo',
  `rub_des` varchar(100) NOT NULL COMMENT 'Descripcion'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Deposito de Rubros';

--
-- Volcado de datos para la tabla `rhco_rubro`
--

INSERT INTO `rhco_rubro` (`rub_cod`, `rub_des`) VALUES
(1, 'Ingreso'),
(2, 'Egreso');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rhco_tipobonificacion`
--

CREATE TABLE IF NOT EXISTS `rhco_tipobonificacion` (
  `tbon_cod` int(15) NOT NULL COMMENT 'Codigo',
  `tbon_des` varchar(30) COLLATE utf8_bin NOT NULL COMMENT 'Descripcion',
  `tbon_porcentaje` varchar(3) COLLATE utf8_bin NOT NULL COMMENT 'Porcentaje'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Deposito de Tipo de Bonificacion';

--
-- Volcado de datos para la tabla `rhco_tipobonificacion`
--

INSERT INTO `rhco_tipobonificacion` (`tbon_cod`, `tbon_des`, `tbon_porcentaje`) VALUES
(1, 'Ayuda Familiar', '200'),
(2, 'Ayuda Familiar', '100');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rhco_tipodescuento`
--

CREATE TABLE IF NOT EXISTS `rhco_tipodescuento` (
  `tdes_nro` int(15) NOT NULL COMMENT 'Numero',
  `tdes_des` varchar(30) COLLATE utf8_bin NOT NULL COMMENT 'Descripcion',
  `tdes_porcentaje` varchar(3) COLLATE utf8_bin NOT NULL COMMENT 'Porcentaje'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Deposito de Tipo de Descuentos';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rhco_tipodocumento`
--

CREATE TABLE IF NOT EXISTS `rhco_tipodocumento` (
  `tdo_cod` int(15) NOT NULL COMMENT 'Codigo',
  `tdo_des` varchar(200) NOT NULL COMMENT 'Descripcion'
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='Deposito del Tipo de Documentos';

--
-- Volcado de datos para la tabla `rhco_tipodocumento`
--

INSERT INTO `rhco_tipodocumento` (`tdo_cod`, `tdo_des`) VALUES
(1, 'Cedula de Identidad'),
(2, 'RUC'),
(3, 'RUC5646'),
(6, ''),
(7, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rhco_tipopersona`
--

CREATE TABLE IF NOT EXISTS `rhco_tipopersona` (
  `tper_cod` int(15) NOT NULL COMMENT 'Codigo',
  `tper_des` varchar(30) NOT NULL COMMENT 'Descripcion'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Deposito del Tipo de Persona';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rhes_ausencia`
--

CREATE TABLE IF NOT EXISTS `rhes_ausencia` (
  `aus_nro` int(15) NOT NULL COMMENT 'Numero',
  `aus_fecin` date NOT NULL COMMENT 'Fecha de Inicio',
  `aus_fecfin` date NOT NULL COMMENT 'Fecha de Finalizacion',
  `aus_des` varchar(30) COLLATE utf8_bin NOT NULL COMMENT 'Descripcion',
  `aus_codper` int(15) NOT NULL COMMENT 'Codigo de la Persona',
  `aus_codtpaus` int(15) NOT NULL COMMENT 'Codigo del tipo de ausencia'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Deposito de Ausencia';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rhes_entradasalida`
--

CREATE TABLE IF NOT EXISTS `rhes_entradasalida` (
  `ens_nro` int(15) NOT NULL COMMENT 'Numero',
  `ens_fecent` date NOT NULL COMMENT 'Fecha de entrada',
  `ens_fecsal` date NOT NULL COMMENT 'Fecha de salida',
  `ens_hent` varchar(5) COLLATE utf8_bin NOT NULL COMMENT 'Hora de entrada',
  `ens_hsal` varchar(5) COLLATE utf8_bin NOT NULL COMMENT 'Hora de salida',
  `ens_codper` int(15) NOT NULL COMMENT 'Codigo de la Persona',
  `ens_tpes` int(15) NOT NULL COMMENT 'Codigo del Tipo de entrada/salida'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Deposito de Entrada/Salida';

--
-- Volcado de datos para la tabla `rhes_entradasalida`
--

INSERT INTO `rhes_entradasalida` (`ens_nro`, `ens_fecent`, `ens_fecsal`, `ens_hent`, `ens_hsal`, `ens_codper`, `ens_tpes`) VALUES
(2, '2016-05-01', '2016-05-01', '18:00', '06:00', 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rhes_horario`
--

CREATE TABLE IF NOT EXISTS `rhes_horario` (
  `hor_cod` int(15) NOT NULL COMMENT 'Codigo',
  `hor_des` varchar(30) COLLATE utf8_bin NOT NULL COMMENT 'Descripcion',
  `hor_hent` varchar(5) COLLATE utf8_bin NOT NULL COMMENT 'Hora de entrada',
  `hor_hsal` varchar(5) COLLATE utf8_bin NOT NULL COMMENT 'Hora de salida'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Deposito de Horarios';

--
-- Volcado de datos para la tabla `rhes_horario`
--

INSERT INTO `rhes_horario` (`hor_cod`, `hor_des`, `hor_hent`, `hor_hsal`) VALUES
(1, 'Horario Diurno', '06:00', '17:00'),
(2, 'Horario Nocturno', '17:30', '05:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rhes_horarioasignado`
--

CREATE TABLE IF NOT EXISTS `rhes_horarioasignado` (
  `has_nro` int(15) NOT NULL COMMENT 'Numero',
  `has_des` varchar(30) COLLATE utf8_bin NOT NULL COMMENT 'Descripcion',
  `has_fec` date NOT NULL COMMENT 'Fecha',
  `has_codper` int(15) NOT NULL COMMENT 'Codigo de la Persona',
  `has_codhor` int(15) NOT NULL COMMENT 'Codigo del Horario'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Deposito de Horarios asignados';

--
-- Volcado de datos para la tabla `rhes_horarioasignado`
--

INSERT INTO `rhes_horarioasignado` (`has_nro`, `has_des`, `has_fec`, `has_codper`, `has_codhor`) VALUES
(1, 'Primera Hora', '2014-05-09', 1, 1),
(2, 'Segunda Hora', '2014-05-09', 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rhes_llegadatardia`
--

CREATE TABLE IF NOT EXISTS `rhes_llegadatardia` (
  `lle_nro` int(15) NOT NULL COMMENT 'Numero',
  `lle_des` varchar(30) COLLATE utf8_bin NOT NULL COMMENT 'Descripcion',
  `lle_cant` int(3) NOT NULL COMMENT 'Cantidad',
  `lle_nroes` int(15) NOT NULL COMMENT 'Numero de entrada/salida'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Deposito de Llegada Tardia';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rhes_tipoausencia`
--

CREATE TABLE IF NOT EXISTS `rhes_tipoausencia` (
  `tau_cod` int(15) NOT NULL COMMENT 'Codigo',
  `tau_des` varchar(30) COLLATE utf8_bin NOT NULL COMMENT 'Descripcion'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Deposito de Tipo de Ausencia';

--
-- Volcado de datos para la tabla `rhes_tipoausencia`
--

INSERT INTO `rhes_tipoausencia` (`tau_cod`, `tau_des`) VALUES
(1, 'Permiso Justificado'),
(2, 'Ausencia Justificada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rhes_tipoentradasalida`
--

CREATE TABLE IF NOT EXISTS `rhes_tipoentradasalida` (
  `tes_cod` int(15) NOT NULL COMMENT 'Codigo',
  `tes_des` varchar(30) COLLATE utf8_bin NOT NULL COMMENT 'Descripcion'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Deposito de Tipo de Entrada/Salida';

--
-- Volcado de datos para la tabla `rhes_tipoentradasalida`
--

INSERT INTO `rhes_tipoentradasalida` (`tes_cod`, `tes_des`) VALUES
(1, 'Funcionario'),
(2, 'Visitante');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rhlq_bonificacion`
--

CREATE TABLE IF NOT EXISTS `rhlq_bonificacion` (
  `bod_num` int(15) NOT NULL COMMENT 'Numero',
  `bod_codtpbon` int(15) NOT NULL COMMENT 'Codigo del Tipo de Bonificacion',
  `bod_monto` float(15,2) NOT NULL COMMENT 'Monto',
  `bod_codper` int(15) NOT NULL COMMENT 'Codigo de la Persona',
  `bod_estado` varchar(30) NOT NULL COMMENT 'Numero',
  `bod_fechahora` datetime NOT NULL COMMENT 'Fecha y Hora',
  `bod_obs` varchar(200) NOT NULL COMMENT 'Observacion'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Deposito del Detalle de las Bonificaciones';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rhlq_descuento`
--

CREATE TABLE IF NOT EXISTS `rhlq_descuento` (
  `deb_num` int(15) NOT NULL COMMENT 'Numero',
  `deb_codtpdes` int(15) NOT NULL COMMENT 'Codigo del Tipo de Descuento',
  `deb_monto` float(15,2) NOT NULL COMMENT 'Monto',
  `deb_fechahora` datetime NOT NULL COMMENT 'Fecha y Hora',
  `deb_codper` int(15) NOT NULL COMMENT 'Codigo de la Persona',
  `deb_estado` varchar(30) NOT NULL COMMENT 'Estado',
  `deb_obs` varchar(200) NOT NULL COMMENT 'Observacion'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Deposito del Detalle de los Descuentos';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rhlq_haber`
--

CREATE TABLE IF NOT EXISTS `rhlq_haber` (
  `hab_nro` int(15) NOT NULL COMMENT 'Numero',
  `hab_monto` float(15,2) NOT NULL COMMENT 'Monto',
  `hab_fec` date NOT NULL COMMENT 'Fecha',
  `hab_obs` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT 'Observacion',
  `hab_codrubro` int(15) NOT NULL COMMENT 'Codigo del Rubro'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Deposito de Haber';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rhlq_haber_detalle`
--

CREATE TABLE IF NOT EXISTS `rhlq_haber_detalle` (
  `had_nro` int(15) NOT NULL COMMENT 'Numero',
  `had_codconcep` int(15) NOT NULL COMMENT 'Codigo Concepto',
  `had_nroliq` int(15) NOT NULL COMMENT 'Numero de Liquidacion',
  `had_coddescue` int(15) DEFAULT NULL COMMENT 'Codigo del Descuento',
  `had_codboni` int(15) DEFAULT NULL COMMENT 'Codigo de la Bonificacion'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Deposito del detalle de Haber';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rhlq_liquidacion`
--

CREATE TABLE IF NOT EXISTS `rhlq_liquidacion` (
  `liq_nro` int(15) NOT NULL COMMENT 'Numero',
  `liq_fecha` date NOT NULL COMMENT 'Fecha',
  `liq_monto` float(15,2) NOT NULL COMMENT 'Monto',
  `liq_codper` int(15) NOT NULL COMMENT 'Codigo de la Persona',
  `liq_obs` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT 'Observacion'
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Deposito de Liquidacion';

--
-- Volcado de datos para la tabla `rhlq_liquidacion`
--

INSERT INTO `rhlq_liquidacion` (`liq_nro`, `liq_fecha`, `liq_monto`, `liq_codper`, `liq_obs`) VALUES
(1, '2016-05-10', 3000000.00, 1, NULL),
(2, '2016-05-06', 2000000.00, 2, NULL),
(8, '2017-02-18', 2646549.00, 6, '1'),
(9, '2017-02-18', 2646549.00, 7, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rhlq_liquidacion_detalle`
--

CREATE TABLE IF NOT EXISTS `rhlq_liquidacion_detalle` (
  `lqd_id` int(15) NOT NULL COMMENT 'ID',
  `lqd_codconcepto` int(11) NOT NULL COMMENT 'código de concepto',
  `lqd_nroliquidacion` int(11) NOT NULL,
  `lqd_montoparcial` decimal(12,4) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `rhlq_liquidacion_detalle`
--

INSERT INTO `rhlq_liquidacion_detalle` (`lqd_id`, `lqd_codconcepto`, `lqd_nroliquidacion`, `lqd_montoparcial`) VALUES
(1, 3, 9, '456554.0000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rhrl_cargo`
--

CREATE TABLE IF NOT EXISTS `rhrl_cargo` (
  `car_cod` int(15) NOT NULL COMMENT 'Codigo',
  `car_des` varchar(30) COLLATE utf8_bin NOT NULL COMMENT 'Descripcion',
  `car_codfun` int(15) NOT NULL COMMENT 'Codigo de la Funcion',
  `car_coddep` int(15) NOT NULL COMMENT 'Codigo del Departamento'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Deposito de Cargo';

--
-- Volcado de datos para la tabla `rhrl_cargo`
--

INSERT INTO `rhrl_cargo` (`car_cod`, `car_des`, `car_codfun`, `car_coddep`) VALUES
(1, 'Encargado/a RRHH', 2, 1),
(2, 'Auxiliar de RRHH', 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rhrl_contrato`
--

CREATE TABLE IF NOT EXISTS `rhrl_contrato` (
  `con_nro` int(15) NOT NULL COMMENT 'Numero',
  `con_des` varchar(30) COLLATE utf8_bin NOT NULL COMMENT 'Descripcion',
  `con_fecin` date NOT NULL COMMENT 'Fecha de Ingreso',
  `con_nrosal` int(15) NOT NULL COMMENT 'Numero del Salario',
  `con_codper` int(15) NOT NULL COMMENT 'Codigo de la Persona',
  `con_codcar` int(15) NOT NULL COMMENT 'Codigo del Cargo'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Deposito de Contrato';

--
-- Volcado de datos para la tabla `rhrl_contrato`
--

INSERT INTO `rhrl_contrato` (`con_nro`, `con_des`, `con_fecin`, `con_nrosal`, `con_codper`, `con_codcar`) VALUES
(1, 'R01ADM-2016', '2010-07-04', 1, 2, 1),
(2, 'R02AUX-2016', '2010-06-20', 2, 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rhrl_departamento`
--

CREATE TABLE IF NOT EXISTS `rhrl_departamento` (
  `dep_cod` int(15) NOT NULL COMMENT 'Codigo',
  `dep_des` varchar(30) COLLATE utf8_bin NOT NULL COMMENT 'Descripcion'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Deposito de Departamento';

--
-- Volcado de datos para la tabla `rhrl_departamento`
--

INSERT INTO `rhrl_departamento` (`dep_cod`, `dep_des`) VALUES
(1, 'RRHHH'),
(2, 'Administracion');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rhrl_detalle_persona`
--

CREATE TABLE IF NOT EXISTS `rhrl_detalle_persona` (
  `dpe_cod` int(15) NOT NULL COMMENT 'Codigo',
  `dpe_codper` int(15) NOT NULL COMMENT 'Codigo de la Persona',
  `dpe_codtipper` int(15) NOT NULL COMMENT 'Codigo del Tipo de Persona'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Deposito del Detalle de las Personas';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rhrl_funcion`
--

CREATE TABLE IF NOT EXISTS `rhrl_funcion` (
  `fun_cod` int(15) NOT NULL COMMENT 'Codigo',
  `fun_des` varchar(30) COLLATE utf8_bin NOT NULL COMMENT 'Descripcion'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Deposito de Funcion';

--
-- Volcado de datos para la tabla `rhrl_funcion`
--

INSERT INTO `rhrl_funcion` (`fun_cod`, `fun_des`) VALUES
(1, 'Formacion'),
(2, 'Administracion del personal');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rhrl_persona`
--

CREATE TABLE IF NOT EXISTS `rhrl_persona` (
  `per_cod` int(15) NOT NULL COMMENT 'Codigo',
  `per_docu` varchar(30) COLLATE utf8_bin NOT NULL COMMENT 'Documento',
  `per_nom` varchar(30) COLLATE utf8_bin NOT NULL COMMENT 'Nombre',
  `per_ape` varchar(30) COLLATE utf8_bin NOT NULL COMMENT 'Apellido',
  `per_fecnac` date NOT NULL COMMENT 'Fecha de Nacimiento',
  `per_nacion` varchar(30) COLLATE utf8_bin NOT NULL COMMENT 'Nacionalidad',
  `per_domi` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT 'Domicilio',
  `per_ciu` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT 'Ciudad',
  `per_estciv` varchar(30) COLLATE utf8_bin NOT NULL COMMENT 'Estado civil 1-Soltero/a,2-Casado/a,3-Divorciado/a',
  `per_sex` varchar(30) COLLATE utf8_bin NOT NULL COMMENT 'Sexo 1-Masculino,2-Femenino',
  `per_tel` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT 'Telefono',
  `per_email` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT 'Correo Electronico',
  `per_obs` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT 'Observacion',
  `per_est` varchar(30) COLLATE utf8_bin NOT NULL COMMENT 'Estado 1-Activo,2-Inactivo',
  `per_codtpdocu` int(15) DEFAULT NULL COMMENT 'Codigo del Tipo de Documento',
  `per_imagen` longblob COMMENT 'Imagen de la Persona'
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Deposito de Persona';

--
-- Volcado de datos para la tabla `rhrl_persona`
--

INSERT INTO `rhrl_persona` (`per_cod`, `per_docu`, `per_nom`, `per_ape`, `per_fecnac`, `per_nacion`, `per_domi`, `per_ciu`, `per_estciv`, `per_sex`, `per_tel`, `per_email`, `per_obs`, `per_est`, `per_codtpdocu`, `per_imagen`) VALUES
(1, '3333', 'Rodrigo', 'Lopez', '1984-07-20', 'Paraguaya', 'Aaaa', 'Cde', 'Casado/a', 'Masculino', '', '', '', 'Activo', 1, 0x89504e470d0a1a0a0000000d49484452000000cc000000f7080300000066414bae0000015c504c5445ffffff6f85cdffd2a20f0c1cffddae000000eec19bffd3a2ded2d5c8e5fdc9e5fd7188d1ffe1b1738cd7564f6700000e000013ffe5b4ffd7a600001800000cc5a097000015f8cca1000007ffdba96a80cbffb582efc49bedbf9a667abdf5c99e76757aa9a8aceeeeef94949700002059575effd099807e83615f65d2d1d45766a06073b20d0f299f9ea21419358d8c8f6b6a6f505f94b4b3b6e1e1e21e2442485686766657a0bae6859dd8c6c5c8141325443e53292f4df2f4ff374167bbbabe90a9deacc7ec1b1d324d4b53d2b893977d66efd0a5bfa585424d79b5d2f21f1c2b403a4e876f5fd6af9a413f48a88b70caa684493c37251f26deb69c32323ee9ad8a66584c342b2d2d355837353c7990d295afe15a4a42d3ae8ac1ddf82a1d21b8987a181d35222432a3856d2d2526a39287928279cba67e190f14cab28e4c42388a7a66f7e3dffdc6a6feba8efbd8c9e3c2b8e5c1b3d5a592e2ab905368dbb80000200049444154789cd59d8b5bdad8d6f081b0c41a6802a404385c146bbd50eb05a5953ada2a174bad085ab016fb51ed7967ac73e69d79fbff3fcfb7d6ce850402c40ec4336b9eb15e90ec5fd67def9dadcbf500b29e7b88ab4e46f661eda187300e598065fc38ff0f81d9df54fecd6532faf73273b30b8beccb5910af3384f48f809907816e7d660d207cbdc8beb5bf00101560013f9d038e83a5cc9af88f80c901279ce4e6d6ab386a2e4243de390481a32fae5dae4d417c7fcd4905e0fe11306b08210208118e09cc1e42f59c7d1a39cf2c82f8fef16b91fde09f0053881438a3440adaf0b9421522d78f1f3f662f109694d7ff3733ed03f73a628479fd581b3e4995beaa2a3a6389662d9219f5960f270bd2f5e3eb482fccb9f6d5e32e8c40f1601f18d3f2ce438fbb57723972ffc86b6db4061ad5ceb8f7c4f25afd016cba72e1087edc3f84ff320f42e78ee4302ed3cdef33b4f7da37aa06d408973b1138617616a2118e65d2ff16598d0006e2cd6b913cfcb1290420cdb5feb958e8aa2d2c92c244497c5d45b28726d065b300ecde4324f2ba4f334853e58648017f23c245971e984175db9d73e88ede14bc6cc963c5a924a09261e1c1603898a7c0ba7cd885c1a4f8f85cbc078ac8828216efc2f0600aaa62aa5f27cfdd0c1b54d36b64c385651e833261ee8160388cb2129ccc655c3b923ebafbd99892875e1bbef1505954640944046e71297c3f04338c9145ad0c1c978ca0250de93e5e621634b36be3d7b0f8202cae8cd893ec7f8ec6f885187d2897c98d05c628914f0f5608ec086387395c7d209a392ea2579063a3010c8ecea3649660cc202a0e97736536d70f371d6459ae46278142330534db81d9cb419875980c0bd248541c49b34ec248a387f57704569d8411260752c0ea0e9c6ca497260843ed8da39de7c2444299ca829daae864b979382918d6aa56235507593227f76a5aee23348970ed2cccf94fd7fca3447c4d2d0138983433d713d30c57784f4d92834933c345aac36accb08862a9bcb028485120894a92280ebc2782733d5a4e8c9cbf1fac9c483d7f7797ff1e819e978425097fd2a914492a9d9bbb7c5b94ac0dd6c144930334ed01204214ea5e3f8ab75c698271a842a356f606837e5d82f89a5acbb2ca7370c23647d3b01653172288cdd269c2e7f3a0f8425e7fa50551415404f2dea037e461e2f38442212f8a3fe8ed842de2bcb4ee184c86e6217bed2c02e1bb5b1c63486161120a252ab5d23149e94a23310812f9fde5667fd9ea643db34e89da74434568defa11a477b8be902e7d282a903f58eba57134d1ac8a8f4d3d7304f2e5e0a0d18e9450b008e6381075729266338a30ef75d548f5a219c547a6e653feeb53968578cb9c89c6d1427347322c5d84855ad0dbc5c00fb29c4e2712532489b43c02c49746e458b961a471d2ca5cfbcfbbd3dd61eeb6cb22a71506a32446c024a6641feaa6daa5899c3b0933a74cde8b8ca5a8b3c84892ec83991a0983bce837619d267ced24ccfc0115b7af293a8b95a05783f179d21630c9d1305309d91fbcd57dd0d160e69a1568c29b2602843b64f17647d68b435f0cf71a9ff242d9ebaf758b01276116a26467a89870a38c2cc64846389ab3a499246cc14cc97e7f5ed38de8204be63ca22ef809a5600f8c09078150ecc1204d51538d936d730eaa91f78f69238958f4234c7f2a31e04c2513c3538dceedaf68304e563373c0a259e1b5d820166fff00cdda19cad28509d6b4e938c1c195dad9285b8b7c2f845b416b184a9e3ace8870a6bd2c1dbcd3e39983cdd99220b1c5c848a4deef321eaa00649978d26a3cb3072307f500e0643f7322bc473bab6275d6b284f1a8a540023f6048b30dd3d4bb8a88636933c3459445e2c7110663f06f569ab1ffa9d694996a4615671a4cc8df85716e7e068399b27a5fbdfed60323535ed1926502ab4ca6219b30deefddf24c3c7408664785792d461ac11efff7a9c24a67ac9c93886413c65b6e192a67a742c02a5c2b1b2bb000f05bbb8c4785511a81a12c7217c6387de5d4aac66254d9078701a031c0ff151d31a71915cd0c30c696c6293b5b1238da3a7a4ed34d9630ac37238fa180208f3033038c69092bea8c9d2d0854a5633b737dcd95ad8a19b5df4cab85995d98a2695ec3213b9b55eee0e3d70855f65bc174910868288c4f561bba84ffd604e3909dada917a5fd880833f4be33c719fa823485f084a9ce5455e3889dcd697710618a969559cf7847be803c2b112c99977d9db1b39dae39500b3012a67ff0dabca061eed31bf2574cb367916b479a9a9c0e1396cad63573ffd4665742b1ababd34aa55339bd9263a1502ce60bc542310c8bc1226758f8857d27585c19cd1cc251eacdbab73bc6ee36fe9bb89aa22f2c8962a72d495025d2bcb96973e170e3b84ca584bfdcd6ef935353e7fac259b8ecd7f24c28e6e994f2c7b5ce55a2930f47a32035f21d8f054ea86434a688b2281516a0c6688215ad0a70acd93c51fa0ea1c35ab3186a2576da06498c8882042029a891882474faa6cb63a5013b5580cd267883154973ff8c331301ea9e06a9c39a66af2f946ef7ae9229126d9d9a69429d813b88e098bd5b516bd068adf07ad21bb6e6cfcf3f2923972a0a4c28d118b42f200c37469a5072c832759468fc65ed375b95db4e7bc21de721b4db6acc892a30fe7263c8e2b3609c9b0935f554120e8b128a10e9e2418dde4ffb79bb74570ee661922cb35009069b8a22e0962eeef7d6d99761810d2d6c061339238c3c551724f65ff85b3ddfb93aed949a2d7d615aa41945bfba1c10161a9c50ae4d1266196ecaa56251b9bfc026cdfc79f695d8bee9e0d0eaf56f9c18950411b1f0de579b574633fb904e9fdedc20c4d5553ac6023946c1abe33a1745915a158a008a9ad1caa6ae845a7e927301eb62598842bea1c05064562baa70434ec83434aa95af304a37ebad76fe34610a67f2072a28951ad9a777a5f84b8962a552297afd0c8669267c959e4a366ebe4ff2e100295f138bc76a7405b20a755d453ac541a67dca00e986c7e4b4af276dfad21ff489c134fe6cea0a25412f0ab1b576268a99459a584c5f71a5d624d703a176dc92d377aa99b150ca9ec8143a3411936434ea72acaf6f01d0973cd3614257b5da69323175d5a97512ca32ba2a2c6b8a57f89a53a8fd36c962136af9963c955622003097a98100dfafd4e94b39245f75707cb58e55cb76a6c1a0e75c79fc311ff39b74e7a6ecd7595868668a99aa4165a27540344f3068002c34b39ced2f962a6ab7984874d0bb2b9dce9555218330dad24de93496aeb5bf355af9532ae63c451d46c93352856e4cbe5e99684fb3f4adc6e188d26d56510595eb07e5a47abf4b89c47155a458769ce89f1af0a92e933c4e878e450930e289d0ba8aa1cb78bb3014ccc4538269374b134d339b7003e8ea891bf29a6a501b423a4973b1c71dff8d248a401be1016ab13e9a0fcafce07128c101272d1e46b8ebb92abed0e832ac9c89b039c4fa5d7eb25bb5a0269510e62a4ca94087f1929de59321ace0c5c3cd734e5cc82c403ed66b6a2a4ce814aa87304b3b3dd12796d41253d5cc2d951755d47522c995be4fb60f38a937eb3872b91ec682c33088f4d4297e1356abb0b349b1811ea66f9a75e35360929e533871cd4a026dc0a7dd0b8b4a19a3c2b0aab981ef375584dab7f989c2ccff765c25a729895cc408e393d1c6b1390c63b5abeee45b8563b3dfc8aa666873fc3ccb55ec81b94ca31ed40dcddf915861530c4d5d4167c2d3e7cb7007e49d680d62be0b43a32ed1d36f87ac1ea01b9ed96c97cc7b5058018061e2dbff2cbb322722963be7b9dcdcbf7ff5d11b687bb64833e17a4b28cbb5686dd21334701c46a79131d38877aa75285b9662ede65cceb57c1889446091c6988ef52cdca699663045c67eadadce2d7c6bd5ffa7f32b96021e4300f0df228c789ce4dac1e3d67174c2fdd942bdd99613a7d08a8846c7a5d1863cbf76fefdef2646d4d35f3dfd3300be042bcdc8deb04af0c8b227a6cd131860289a892539ff2dd86c3627bdef74f5b7662329375b155130f8ad3aaba1546531d3063a338cac6c14f2784ce58e1106f38c503b8de6bdadfcf7d909c3e4e018334debcedf88f6c3189c5d59d7ecf199b43a21289b7f2c1bec8c2a80703d5af796e16ea29519936afbdbb1dc6a6213d831c3c8435148a67c562fc17f8d4ec3da8b92375881dae4b79dcdb6da75b904ad1654ba3021cd78b4bb6eb990d9637bb226c608106c8539b12327fc77ad3b98f8fccc26e485ab7425df349a59c834b8514bb2261efac70883e958a0e6a8959f70314392817cb4465baa5a75739ef1681b007e420c30792c72b09bc194d99a9d388cebb0de6ea6135e7f09bcbd303f2b3e034c49103b5427548a4ecc36cfff96179294de94d99971c0183553a3b21c25e880cb5070aeb119333f1c072700d302a56b4d802353e7e74d36fb80c1795c66d685f117853a8349149dd90fbc28b09edd5fecd6ee76362fdb83a9c031b332f9b8eac8c4f9b29a6182ad8666677f93a51b9b51dd35c5ca1a0e2dd0a09da977510b017f57335d9816c5656439756a81660d94b921bfd40c8e5733fe32272a2ed3746aa3764e5b192aa95463d38cbf18ad3397b982c976cc06a1b500761fb5c908eb210e40b4f8b60ed3813cc1a4f3ce6da0cd1cc21d4d73fb9b8d2166e63bb3dc372b7fe8c7d14a00f4ff126d70b872f4649045a89783149d2b03f6cfb2515bd7ce531fa6fa6834987a148359faaae14c5cd6645f8412394d73d0fe59cf99fcc1dace7c676767bd3f5161ca8d68272dd720ecf0611a9975e0da207d1f00239f793c1f7a6634d452c1e7f9e039eb3135cdff2352a9d38205e7cf055a5e17d766eb96303e99eefd07f3734d6ae1e3433bf3f9ce64138d96ffa3058082337b33fa65b1a5ef6be863f14d3df96018b2322f1693cf9e3cc1effa6831a70fa603999d873b856eedb7dec73474169a297bf2a46b4f04134b3c41613ff5999e11506126ba203b5256a3e5be3da71a0bcd2ed1d065cdd87cf2076251e3826f2ad13bd9e4bf0b3f24cc3e147b35d365619646a34f2bdb83934f9868a667a45123b363458ca52cb3f573138c6c8cbb3e05e00346e33305e5890135a9bb9496661ef46cc01ccb9a269833b3cd690c9a98924fd2e85028df1ee84830453270d303239b636e1f8d75c5a6c0941fec183d45ae6961c3ec333de3c4b4626091adab02256edf3ed0c1739a2cb47b61fac4e74ba8381fce06b02830c13b47cf68e997c59645d2ecc79193676753f2e08db48a66be3fdc419a4c58a2b13139a33ebb310c06db4c61ed4155b30316bb81ed3c6a6e660b29730a17c03979e654af642836f78ef3ec83ae8c411ac120672cce42ac337be14e5dc0f543d5990853cd077bcb990f984c7c21792aa9092b68688b90bae7893eca18d94c30fef26f7b3c1fc83e879307ab3517bef7f80c156498ef3f7efc972e1f7fa4439e64f2a326f4e9fffd9fa116603015c8f26e371fd800587a20d759e3ca7e33ccd913f9c75fb9e93fcf0c387ffc307c81f2e3cf1f3f7a61da5b6e263c7f048e1ed7d695a5fe0820fbe48ffffaf3975f7ee92162541f7f9cfd393dfde71f3f4cbfc2667bb779779ce104d0753e3d40fe5c02a9d4e7341ea2f9e36cfa975f34a23f5408e55b7f7efc97b9822398e370ca1d7f73a9e2ac849d3c7d4a63d90eb7fdfdb3804483bef2d774ee1745f47fa7fffc81fa499a7f2184ee1f3d428f79f4e8edab38f1f0a81c87cf715f800df757ce2a6dfae41f9af3fff5d79fd31984f8ebc7c78f7f28dfeb996bf25129037b7cfceda399478fdebd8aab9ee3680d8d2cbc7b977501bd302acd1fbfffeffffe87b98ac16f3ef64e0e9262220d31a5c03c9a5171b69dd4cd21b25cf27b90b77c5ad3e7219adfd1b47e37c7801fbdd52629e6385283acfbd5cc0cd1a0b191efa06e1c3b18600156e29fbfc4b7a3ecd1933e18ea24511ffff9fdf7ff98c259b2afdc24c5c05d11612e1185d1cc3cfa4ccad972aa8d5e828df8cb992fee15603b02ac8a4d5ffa475f649eeadf228c8a6987cb09058654c3d4f38e77f32b0e9d0db4ce581e3dbacc42b83e608a36cd1ea24deab93f99a4dd33bd33d02cf9d78204e37e4b5a61b636f3e8cba53beb4c7c5e4496b774d557298eeb9f08502491f0984a4dfaacef78009f37e895ea7e7f82aa99f8ab2f331acca32f7c2a723ef1c226b77a0e47c882b7f1cb65ea800bb72c55430f94a68d1ee2a3eff486328cca4d28fbb102a0d22c1effacea06ff7f132f4cb8b0c92009c05e9c2ce2d13b2c4076450e6eac9be704ede734ecc5b278063d448b321db63c4230242f35cf41988b0b902686b37908b0b50717c432f3e82d05d03d315c87a27540a38d2349ad1760cffda67b15e3f58aed604836c0c499eba0bc091c5c04b2bb009368409717019e6fa7dc85aff19774b1972cb71d09d1db56d8b27bf6e98f616bd27b6e0b534cd99f90fdb73a0ce25cbea348f026b0bb452dce05c0ec78ebceccea35487bd900efde12539fc95f582a70f31b10ad94c3e1a2d533dbbe740f4cefac9a37d88152509e92a99d717725fe0a713ef37b1cef7e75194fed618f33be28bdb38ee6b511e72f292fafbc2296574a81cb6741a805cb031edaf6194ea24a4e257a937f0cadab1df44ef5c1602478f3e5335e8bc704f0f6924f6d63073a96389d9b6fc0f3a36c9c7ff5f6733c0b47975fba2c6e774a10ee82fe72b8b74b53693cea2974ec10badea2cc5fe61a6864490693729b24eebe44adbb9945bf7dc5c737b6a031ff379d27b3bf0470b18276fcf91d79fcd601393f66344d5205e1d8ef5568fa61f4b91aab890d6fb92e26fcf494871cac493d30a4f515c8c6dfb060f0ee331f5f21e7f91bd6965b6bc08bed141fbfa408f3258ef76ae50dab35ba7220e5d5472c8bf7dbab11f236e12ae665be14ac452c60b2b0c2bf7aa4146c5f5e5ec6b3471158f8b9e99bccce82a214fecd3b767bd0b476b750316f4d57dc15daca5e912a57ec7fd0c45a28aaf9fc986142a1043bd12d587ada0fe34e5161aec2306b8ba7b65fc0a7d57b5b5b6eed93aa94975fd4378be3bb6ff3976fccb76f4f6aa93b5ffe5ff836666797269dcfe0f1f8efa016f22907cfc8c13b2b18b774c4c7bf283033ac737b13276b13ee676d3baaa7c45fa9198c6e4c9ce9dd1d37c31c45c3ea325eba259c7a861e33a1b050fa49c7eea014d23211c23cb76009142eb0787ef576461fc30cc6b8781643b56d6bcbac7e82a7a414fef397ae9231499247f23d174437a2430e489ea5ebd0b141c3ca9a1b38d6f4c2605e58c1ec1e04284c5f7e568d83956de83c14aa1b76ac6d1973caee8a9bd7953233a36b66c302260bdaeea66721b98da693187e6e063ba051ae41becb4207826d59c060a209b04fe26e65305a27fa2a6e2bb6cd611d79844a8993d32bbf3b33a3de10d242b6ef8a5911d4e7f99e2145138da737d15bb054a0892c896417c64a33783ddd93e2fccb2f5a5bad384fea088665d21c565f5f375029fc4bcdb8663453a529204b985441db4a1fa227358e211feb2bf40d2c6985a54d2cdd32c7dfb40a0068d62b5d4b40077e37a36b878d68e33948d69974ff046bfb6c20ce0a23b5497ac4ea7175368b664cfa61dc5fa33565df1905665fac046d6f6290728825a9b21861bcedb05534a3e869f8324e7759bbc53334efc1cad0beba2d331fc192d81d88bb99d37705ed8bd7e217bf1dedbf646017eed4fd8dcf68bcb11ab4cae9be625f117a0c52be85efac1e30c2d42d6102d25e8f8f62fbf6a53b34bccb811466d273e3d2aee2f43c6f8cc48abf917176d5be2d5ac0eca96746a8309ed8a9182eca535671803d0f780b75e54736605838ebc5d12313731e8c0e58b7c1a2d22564364f207c9442a52899be1bd589dcf83efc116751741c41d36b84f184120da878a792c6a6d9a79cb4cb4e9852598c30e56f052b18aa9b2dbe4d895c1fe817b41c3ebb27d0544e6e8dc3eadead667ad54fd4575dc67bdfbb6071c10d6899613c14a2efe8694bbd69d64e3f4e788be2378dd108c359c358243605876ebc967bd079dc810d84d924a7e7b5f26b469fb752f4d777a3ac60b2f05485d17b000a6aed72483d214b1f74422e97e09bfee0b311463ab01a33abce2c7fd0b536666c7136c9b60a685f8ad6f49462885f3de3de3bb0786b4c342a4cec994e13eb8423156f4866e76aa7d3697ab62651bce3209fd691bb30a122ec5a0e39205d0c806195018e7b4687d941189eb50c9aa3b06afb73af7d6930175b7dfec8128d5a027461c871dad0be2d17cb24c5e26de7b8cd0197bf323cf468802981f5a059e73c583437d761583337d38579f7aadfbe34f9ba6b01e33ed01f4033c07842a14e0b1a00023b2908a0d13e3e4d9b1ee0ecc278ebd1de18acc2581450661c666d26182d4132a71f88e2e639ab4b62a2a959c0a0e3c8a7b5d34e0da5733a954efb623d8fa26a30c94419ccd9b12ba9413f30f05cbe7cebee87b1727a93c09115cc85fe1c7cef0ec7ee1f39b0da10a0c378ef0463dd627af3af5fad8ca107c7edd67d462dc4de0eb12f45ac630b251a55337d87000c150d26ede522c2006bc20aca2a66f7bfce00c38a9611284a4f6ef1ed0dd08e6d883d1b8dd00793f457803b1834641b7666869931152d837fc1da1bf17db447697e0626e90db6447177d088f90b8bdc3600669e42b36552b1f8856dc1f2db5951e0ac22802d98244dcdce717b833c034739286f5ac1d8e1507e61afbfec23498597b4c2f9fe30b23f58bfce0cb1257ed78e6a1066ff7e3005cb34e3763f5d5dec769bb6e5197b568656333697876413f454eb1cd40b733fcdb807dcbfc08b7557b8755faff185e88027da015c75ad5af449dd711e0d8adb66987b69664030a34473e2dad10ccd36cd337f8258d063365deb2f868e62ab901a354a05266a1f6650c8e7f7245ae6bc5f447be6f5261234dbd63877b91a03fd9fbdbf0d43bb37cc45c1fa9248893dde79a37c8f64832c5e995e7d83b69e1911b0f002a322da7d610283ee0f733e57ae5b078ca679165367416fe9f499fd11d5a4dbbd2b8c30b47bc2a0b207de1e8936ed6cea25da481a8dc51b6c4b19976b2d3ceada29cebadf31c3acd987195c25052ed89f5959549e791c4dd365a9a1f7e75c87566d92f9e21b23aa9a7bc2040e06d6af782936377208fa5965c3688c2cb3ae5cce65598cf75c626fb82922cca66b4db20b33ace24b29cf2464ae1bfa31728395f34c7d85df7f07ebaecc7466d9461ec116706821703f98a1b578e0b9728c774ed0266a48399638cfb4e76583e53aac21cb34cd43d8b83ec6e721c6783f98406188616392566713c14063a19c675db5d440da219669d7e18bd1fd170ee068587cbe17ccf0e25509ce243b48e337e03c33a368113978db80f58c0b51a6331938b2038315270c8ecf0a8c60eb8db0d11f4acdeb3b2a77e09be1f8456a3e9f11117ef0e90f64fb8b6d3857d4822c52048edc766e694af83a0ac69666d0628786463538334be384a2e1842d8528d6fd1c519a50c58031cd587292c8edc1c10a6fab321e18f61418d19666021730fc3a1bdd0d95b973b8f1fbbdd6e2f756da505d75296aa148762d5c04560ee0223b1a2730b87e4698399b30f8d2119d780a22ddcd3ab350bff506ad7828847d52c238b160d570b80a84b1cdd134f1c872f2eba0b2e61e30eeafd653c15d091c48d75d9a9d73a8df148bdea0e90fb506bde59bdfb4937e0826b38695d927968bf9d411c7965287e7f954d46aed538789d880b1d11ef14782786ed848b5b9100568358f6f3a95db62b178755ba91d375b004bda6b32d3b9dc12269a1dedadf9d4f65728ec65dd812197c2310f98fa2498c5f068185bfd4416e639238d2bb33cbf7e78adfc696326d787b39bdd1764323b55f4d9cc82a8bf35ef5ed913e0606f251518a8207e40b6b10f7361b1c6d4f72258cb71d5bed5c54c2687b29ccb657ace935f9e85935c667ad9e48cc8b0722100b7bb9d25204ba28b41f35db660ec4df6f0170d57eedaeee6dd9d138079aacb667ba324f11c6d01705b7b1bd9144f483d173fb06aa27190abb63433d2fbd9bbd1d2556681f2fa28a175c7ea6ac6959b9ece59650e1afdcad12e5aa850d83dda58c9a6dc7c20c0b0500229eeabc5e5edc1608569a7a8552be75510863fd4bb3c7708704e0ac470965b1b5463d2b0532bdb7b5f157fe30abb177b4747db241b7bd04fa3c03c1da9196ee0d4a9f9ed5eb0ca397708e2bce5fed0cccee6225a1754d7c8b3589ec935864616a609777665637bef62eb40eac6927e1fb60783e1c3622383e50b7f532c6c79012f77b2bab9bfbf83b2bfb939b7bab8f449096b276bfbca8b58fecfcd8d6cfe75a600891ac403fd63b605c3a786b611c65766f58a26b3b9780d4611ab27b3f39b3b0677528a994ff6946eefeaf3a361ec846555cccf22614026c1c06c111294ca6cdf9e37da1106333b1c6654b56c7aedc5a791814c27658a39b4dacaf4736207c65e5856df6fc3fe03fd4c31cbb6162b6c5e3c8ba5d17018da2d6bff7a29fb277931c5ac3ffdfb10fa4847c3d80dcb4ac0e177399baa51e2b28d1926db321a86c2b2add089e9ed687b03ab109b47f94d2bf5bfedd06217e6f910183b6199e7b3544a0187c5c7c196cd07f898622c37154c0c067be551f70eabc25d800b2c72dda914bef885ad80c61ab3555b5a1f170cfe7c8451f3ee8d0338d84ee9752dcbc3a3850273e67cf0169f9f835974ad0f86097c15875e8ee7370aacd3357e6fcf4e7856e2f2d81226bbf070981161990f104adf1c444ab071469152968dd1fd476b86b35e28572490fd0a07d9fe761d1b86913180b9ccecf8b23fbbee5098a1619977ef81b8613df3b055b563659993b1bacc0898141456526ecb3e1c9d0506cea8b2b06203c67ecd674b86c2f02bbb05800876ad59b796e055716777613735386e8c8a012cfdef8c35303398d9216616706737f6bed21fb62becee617e5fc99260d35780c2c6d0b9baf0f0bfb9ca02f3bce53ee649c1b8993e90081bf1dd8382a0f75907172bc3e7ecd108873edcc2ac6c696bac8a190da3be8cbad4540ab5b2b282da490d9d71547e634b1809238cb1c864d7b407a3bf9cef9fc21af8c6430a4eb5621e6bcad4606c2dc1ddf79db7871c22373d8194796fcddcebad2f061fb2c0ac6cf6f978153341cda01406fd795f65edaf7131e6cb4e1206df7b408d96535c667cddbf7ec1c96906e3b37533c05836c79c325598a509c10c741b66658b4fc7cc326118b7fbb9d581d88acb54c7ed329386b1761b655a76ec2ee3764f5833966ec360c6ef321387a11eba6f59507199f0d859149891fbd6fe8ebce83d054799638e8cdd6508667db230fd45dad8e7987599384c7f91c660c65e98914c1e86b28d696f80d2cb8c5e7abcbfa4106661b230eed453e31ca7e23276f6f6dfff420ec0f02bc6f5b469a5fd1f732fc3c40986cd2feb000001254944415418f369784c31f3c3777bfda43802e3e6bfea7fe54bd996753e914b3a04938205a3cbe4c63c63a68a333054d6cc19ac6c7312815981391cf0b0d23825b00bdd9d0caec38934ea8ec1b8dd70a2b94c2e33ce954c83380683f1795e7599cc242a66120566226fdd23015608a85636990b12cc985716068a74a82ccb4c289611cc9253306cd7e1b4dd87187e461c84a10d4599cc74ce35be7d4c3de2284c0a6bb469d764ea32122761a846cb65d0fd27f5fe8ec2e0d5d65cfb93e831b5b72718279226097f71b2dc18b0f97d0ca2c0b0cfec0fe93e12304956929ea702931237c29cc3cf4ab44f24450426a22211266192a712849ff6cbf3c1f242f968215bfd8230fb9baacc0d94550b99b792b5e1b2d823b3ecff5955d6d98721b23450161459fbffa2d387d8331dcb4c0000000049454e44ae426082),
(2, '789654', 'Ariel', 'Britez', '1985-07-04', 'Paraguaya', NULL, NULL, '1', '1', NULL, NULL, NULL, '1', 1, ''),
(3, '3456885', 'CARLOS', 'PEREZ', '1975-04-21', 'PARAGUAYA', 'EUSEBIO AYALA 2373', 'ASUNCION', 'Casado/a', 'Masculino', '021736494', 'CPEREZ@gmail.com', '', 'Activo', 1, ''),
(4, '4720641', 'Nueva', 'Amarilla', '2017-01-22', 'Paraguaya', 'km. 14', 'Minga Guazú', 'Soltero', 'Masculino', '0973640015', 'denis_saul87@hotmail.com', 'observacion', 'V', 2, NULL),
(5, '40640', 'Nueva', 'Amarilla', '2017-02-18', 'Paraguaya', 'km. 14', 'Minga Guazú', 'Soltero', 'Masculino', '0973640015', 'denis_saul87@hotmail.com', 'observacion', 'V', 3, NULL),
(6, '40640', 'Nueva', 'Amarilla', '2017-02-18', 'Paraguaya', 'km. 14', 'Minga Guazú', 'Soltero', 'Masculino', '0973640015', 'denis_saul87@hotmail.com', 'observacion', 'V', 6, NULL),
(7, '40232640', 'Nueva', 'Amarilla', '2017-02-18', 'Paraguaya', 'km. 14', 'Minga Guazú', 'Soltero', 'Masculino', '0973640015', 'denis_saul87@hotmail.com', 'observacion', 'V', 7, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rhrl_salario`
--

CREATE TABLE IF NOT EXISTS `rhrl_salario` (
  `sal_nro` int(15) NOT NULL COMMENT 'Numero',
  `sal_des` varchar(30) COLLATE utf8_bin NOT NULL COMMENT 'Descripcion',
  `sal_monto` float(15,2) NOT NULL COMMENT 'Monto'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Deposito de Salario';

--
-- Volcado de datos para la tabla `rhrl_salario`
--

INSERT INTO `rhrl_salario` (`sal_nro`, `sal_des`, `sal_monto`) VALUES
(1, 'Salario Base', 2000000.00),
(2, 'Salario base encargado', 3000000.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sec_apps`
--

CREATE TABLE IF NOT EXISTS `sec_apps` (
  `app_name` varchar(128) NOT NULL,
  `app_type` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sec_apps`
--

INSERT INTO `sec_apps` (`app_name`, `app_type`, `description`) VALUES
('app_change_pswd', 'contr', 'Security Application'),
('app_form_add_users', 'form', 'Security Application'),
('app_form_edit_users', 'form', 'Security Application'),
('app_form_sec_apps', 'form', 'Security Application'),
('app_form_sec_groups', 'form', 'Security Application'),
('app_form_sec_groups_apps', 'form', 'Security Application'),
('app_grid_sec_apps', 'cons', 'Security Application'),
('app_grid_sec_groups', 'cons', 'Security Application'),
('app_grid_sec_users', 'cons', 'Security Application'),
('app_logged', 'contr', 'Security Application'),
('app_logged_users', 'cons', 'Security Application'),
('app_Login', 'contr', 'Security Application'),
('app_retrieve_pswd', 'contr', 'Security Application'),
('app_search_sec_groups', 'filter', 'Security Application'),
('app_sync_apps', 'contr', 'Security Application'),
('form_rhlq_concepto', 'form', ''),
('form_rhlq_rubro', 'form', ''),
('form_rhrl_cargo', 'form', ''),
('form_rhrl_contrato', 'form', ''),
('form_rhrl_persona', 'form', ''),
('grid_rhlq_salario', 'cons', ''),
('grid_rhrl_cargo', 'cons', ''),
('grid_rhrl_contrato', 'cons', ''),
('grid_rhrl_departamento', 'cons', ''),
('grid_rhrl_funcion', 'cons', ''),
('grid_rhrl_persona', 'cons', ''),
('menu', 'menu', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sec_groups`
--

CREATE TABLE IF NOT EXISTS `sec_groups` (
  `group_id` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sec_groups`
--

INSERT INTO `sec_groups` (`group_id`, `description`) VALUES
(1, 'Administrador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sec_groups_apps`
--

CREATE TABLE IF NOT EXISTS `sec_groups_apps` (
  `group_id` int(11) NOT NULL,
  `app_name` varchar(128) NOT NULL,
  `priv_access` varchar(1) DEFAULT NULL,
  `priv_insert` varchar(1) DEFAULT NULL,
  `priv_delete` varchar(1) DEFAULT NULL,
  `priv_update` varchar(1) DEFAULT NULL,
  `priv_export` varchar(1) DEFAULT NULL,
  `priv_print` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sec_groups_apps`
--

INSERT INTO `sec_groups_apps` (`group_id`, `app_name`, `priv_access`, `priv_insert`, `priv_delete`, `priv_update`, `priv_export`, `priv_print`) VALUES
(1, 'app_change_pswd', 'Y', 'N', 'N', 'N', 'N', 'N'),
(1, 'app_form_add_users', 'Y', 'Y', 'Y', 'Y', 'N', 'N'),
(1, 'app_form_edit_users', 'Y', 'Y', 'Y', 'Y', 'N', 'N'),
(1, 'app_form_sec_apps', 'Y', 'Y', 'Y', 'Y', 'N', 'N'),
(1, 'app_form_sec_groups', 'Y', 'Y', 'Y', 'Y', 'N', 'N'),
(1, 'app_form_sec_groups_apps', 'Y', 'Y', 'Y', 'Y', 'N', 'N'),
(1, 'app_grid_sec_apps', 'Y', 'N', 'N', 'N', 'Y', 'Y'),
(1, 'app_grid_sec_groups', 'Y', 'N', 'N', 'N', 'Y', 'Y'),
(1, 'app_grid_sec_users', 'Y', 'N', 'N', 'N', 'Y', 'Y'),
(1, 'app_logged', 'Y', 'N', 'N', 'N', 'N', 'N'),
(1, 'app_logged_users', 'Y', 'N', 'N', 'N', 'Y', 'Y'),
(1, 'app_Login', 'Y', 'N', 'N', 'N', 'N', 'N'),
(1, 'app_retrieve_pswd', 'Y', 'N', 'N', 'N', 'N', 'N'),
(1, 'app_search_sec_groups', 'Y', 'N', 'N', 'N', 'N', 'N'),
(1, 'app_sync_apps', 'Y', 'N', 'N', 'N', 'N', 'N'),
(1, 'form_rhlq_concepto', 'Y', 'Y', 'Y', 'Y', 'N', 'N'),
(1, 'form_rhlq_rubro', 'Y', 'Y', 'Y', 'Y', 'N', 'N'),
(1, 'form_rhrl_cargo', 'Y', 'Y', 'Y', 'Y', 'N', 'N'),
(1, 'form_rhrl_contrato', 'Y', 'Y', 'Y', 'Y', 'N', 'N'),
(1, 'form_rhrl_persona', 'Y', 'Y', 'Y', 'Y', 'N', 'N'),
(1, 'grid_rhlq_salario', 'Y', 'N', 'N', 'N', 'Y', 'Y'),
(1, 'grid_rhrl_cargo', 'Y', 'N', 'N', 'N', 'Y', 'Y'),
(1, 'grid_rhrl_contrato', 'Y', 'N', 'N', 'N', 'Y', 'Y'),
(1, 'grid_rhrl_departamento', 'Y', 'N', 'N', 'N', 'Y', 'Y'),
(1, 'grid_rhrl_funcion', 'Y', 'N', 'N', 'N', 'Y', 'Y'),
(1, 'grid_rhrl_persona', 'Y', 'N', 'N', 'N', 'Y', 'Y'),
(1, 'menu', 'Y', 'N', 'N', 'N', 'N', 'N');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sec_logged`
--

CREATE TABLE IF NOT EXISTS `sec_logged` (
  `login` varchar(255) NOT NULL,
  `date_login` varchar(128) DEFAULT NULL,
  `sc_session` varchar(32) DEFAULT NULL,
  `ip` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sec_logged`
--

INSERT INTO `sec_logged` (`login`, `date_login`, `sc_session`, `ip`) VALUES
('admin', '1484172421.99', '57c5d41002c29d5bfce42bc0f4609338', '190.211.242.174');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sec_users`
--

CREATE TABLE IF NOT EXISTS `sec_users` (
  `login` varchar(255) NOT NULL,
  `pswd` varchar(32) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `active` varchar(1) DEFAULT NULL,
  `activation_code` varchar(32) DEFAULT NULL,
  `priv_admin` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sec_users`
--

INSERT INTO `sec_users` (`login`, `pswd`, `name`, `email`, `active`, `activation_code`, `priv_admin`) VALUES
('admin', '21232f297a57a5a743894a0e4a801fc3', 'Admin', 'admin@admin.com', 'Y', NULL, 'Y'),
('usuario', 'e10adc3949ba59abbe56e057f20f883e', 'Usuario Prueba', 'asd@prueba.com', 'Y', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sec_users_groups`
--

CREATE TABLE IF NOT EXISTS `sec_users_groups` (
  `login` varchar(255) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sec_users_groups`
--

INSERT INTO `sec_users_groups` (`login`, `group_id`) VALUES
('admin', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `rhco_concepto`
--
ALTER TABLE `rhco_concepto`
  ADD PRIMARY KEY (`cot_cod`);

--
-- Indices de la tabla `rhco_rubro`
--
ALTER TABLE `rhco_rubro`
  ADD PRIMARY KEY (`rub_cod`);

--
-- Indices de la tabla `rhco_tipobonificacion`
--
ALTER TABLE `rhco_tipobonificacion`
  ADD PRIMARY KEY (`tbon_cod`);

--
-- Indices de la tabla `rhco_tipodescuento`
--
ALTER TABLE `rhco_tipodescuento`
  ADD PRIMARY KEY (`tdes_nro`);

--
-- Indices de la tabla `rhco_tipodocumento`
--
ALTER TABLE `rhco_tipodocumento`
  ADD PRIMARY KEY (`tdo_cod`);

--
-- Indices de la tabla `rhco_tipopersona`
--
ALTER TABLE `rhco_tipopersona`
  ADD PRIMARY KEY (`tper_cod`);

--
-- Indices de la tabla `rhes_ausencia`
--
ALTER TABLE `rhes_ausencia`
  ADD PRIMARY KEY (`aus_nro`),
  ADD KEY `fk_persona` (`aus_codper`),
  ADD KEY `fk_tipoausencia` (`aus_codtpaus`);

--
-- Indices de la tabla `rhes_entradasalida`
--
ALTER TABLE `rhes_entradasalida`
  ADD PRIMARY KEY (`ens_nro`),
  ADD KEY `fk_persona` (`ens_codper`),
  ADD KEY `fk_tipoentradasalida` (`ens_tpes`);

--
-- Indices de la tabla `rhes_horario`
--
ALTER TABLE `rhes_horario`
  ADD PRIMARY KEY (`hor_cod`);

--
-- Indices de la tabla `rhes_horarioasignado`
--
ALTER TABLE `rhes_horarioasignado`
  ADD PRIMARY KEY (`has_nro`),
  ADD KEY `fk_persona` (`has_codper`),
  ADD KEY `fk_horario` (`has_codhor`);

--
-- Indices de la tabla `rhes_llegadatardia`
--
ALTER TABLE `rhes_llegadatardia`
  ADD PRIMARY KEY (`lle_nro`),
  ADD KEY `fk_llegadatardia` (`lle_nroes`);

--
-- Indices de la tabla `rhes_tipoausencia`
--
ALTER TABLE `rhes_tipoausencia`
  ADD PRIMARY KEY (`tau_cod`);

--
-- Indices de la tabla `rhes_tipoentradasalida`
--
ALTER TABLE `rhes_tipoentradasalida`
  ADD PRIMARY KEY (`tes_cod`);

--
-- Indices de la tabla `rhlq_bonificacion`
--
ALTER TABLE `rhlq_bonificacion`
  ADD PRIMARY KEY (`bod_num`),
  ADD KEY `bod_codtpbon` (`bod_codtpbon`,`bod_codper`),
  ADD KEY `bod_codper` (`bod_codper`);

--
-- Indices de la tabla `rhlq_descuento`
--
ALTER TABLE `rhlq_descuento`
  ADD PRIMARY KEY (`deb_num`),
  ADD KEY `deb_codtpdes` (`deb_codtpdes`,`deb_codper`);

--
-- Indices de la tabla `rhlq_haber`
--
ALTER TABLE `rhlq_haber`
  ADD PRIMARY KEY (`hab_nro`),
  ADD KEY `hab_codrubro` (`hab_codrubro`);

--
-- Indices de la tabla `rhlq_haber_detalle`
--
ALTER TABLE `rhlq_haber_detalle`
  ADD PRIMARY KEY (`had_nro`),
  ADD KEY `had_codconcep` (`had_codconcep`,`had_nroliq`,`had_coddescue`,`had_codboni`),
  ADD KEY `rhlq_haber_detalle_liquidacion` (`had_nroliq`),
  ADD KEY `rhlq_haber_detalle_descuento` (`had_coddescue`),
  ADD KEY `rhlq_haber_detalle_bonificacion` (`had_codboni`);

--
-- Indices de la tabla `rhlq_liquidacion`
--
ALTER TABLE `rhlq_liquidacion`
  ADD PRIMARY KEY (`liq_nro`),
  ADD KEY `fk_persona` (`liq_codper`);

--
-- Indices de la tabla `rhlq_liquidacion_detalle`
--
ALTER TABLE `rhlq_liquidacion_detalle`
  ADD PRIMARY KEY (`lqd_id`),
  ADD KEY `lqd_nroliquidacion` (`lqd_nroliquidacion`),
  ADD KEY `lqd_codconcepto` (`lqd_codconcepto`);

--
-- Indices de la tabla `rhrl_cargo`
--
ALTER TABLE `rhrl_cargo`
  ADD PRIMARY KEY (`car_cod`),
  ADD KEY `fk_funcion` (`car_codfun`),
  ADD KEY `fk_departamento` (`car_coddep`);

--
-- Indices de la tabla `rhrl_contrato`
--
ALTER TABLE `rhrl_contrato`
  ADD PRIMARY KEY (`con_nro`),
  ADD KEY `fk_salario` (`con_nrosal`),
  ADD KEY `fk_persona` (`con_codper`),
  ADD KEY `fk_contrato` (`con_codcar`);

--
-- Indices de la tabla `rhrl_departamento`
--
ALTER TABLE `rhrl_departamento`
  ADD PRIMARY KEY (`dep_cod`);

--
-- Indices de la tabla `rhrl_detalle_persona`
--
ALTER TABLE `rhrl_detalle_persona`
  ADD PRIMARY KEY (`dpe_cod`),
  ADD KEY `dpe_codper` (`dpe_codper`,`dpe_codtipper`),
  ADD KEY `dpe_codtipper` (`dpe_codtipper`);

--
-- Indices de la tabla `rhrl_funcion`
--
ALTER TABLE `rhrl_funcion`
  ADD PRIMARY KEY (`fun_cod`);

--
-- Indices de la tabla `rhrl_persona`
--
ALTER TABLE `rhrl_persona`
  ADD PRIMARY KEY (`per_cod`),
  ADD KEY `per_codtpdocu` (`per_codtpdocu`);

--
-- Indices de la tabla `rhrl_salario`
--
ALTER TABLE `rhrl_salario`
  ADD PRIMARY KEY (`sal_nro`);

--
-- Indices de la tabla `sec_apps`
--
ALTER TABLE `sec_apps`
  ADD PRIMARY KEY (`app_name`);

--
-- Indices de la tabla `sec_groups`
--
ALTER TABLE `sec_groups`
  ADD PRIMARY KEY (`group_id`),
  ADD UNIQUE KEY `description` (`description`);

--
-- Indices de la tabla `sec_groups_apps`
--
ALTER TABLE `sec_groups_apps`
  ADD PRIMARY KEY (`group_id`,`app_name`),
  ADD KEY `sec_groups_apps_ibfk_2` (`app_name`);

--
-- Indices de la tabla `sec_users`
--
ALTER TABLE `sec_users`
  ADD PRIMARY KEY (`login`);

--
-- Indices de la tabla `sec_users_groups`
--
ALTER TABLE `sec_users_groups`
  ADD PRIMARY KEY (`login`,`group_id`),
  ADD KEY `sec_users_groups_ibfk_2` (`group_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `rhco_concepto`
--
ALTER TABLE `rhco_concepto`
  MODIFY `cot_cod` int(15) NOT NULL AUTO_INCREMENT COMMENT 'Codigo',AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `rhco_rubro`
--
ALTER TABLE `rhco_rubro`
  MODIFY `rub_cod` int(15) NOT NULL AUTO_INCREMENT COMMENT 'Codigo',AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `rhco_tipobonificacion`
--
ALTER TABLE `rhco_tipobonificacion`
  MODIFY `tbon_cod` int(15) NOT NULL AUTO_INCREMENT COMMENT 'Codigo',AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `rhco_tipodescuento`
--
ALTER TABLE `rhco_tipodescuento`
  MODIFY `tdes_nro` int(15) NOT NULL AUTO_INCREMENT COMMENT 'Numero';
--
-- AUTO_INCREMENT de la tabla `rhco_tipodocumento`
--
ALTER TABLE `rhco_tipodocumento`
  MODIFY `tdo_cod` int(15) NOT NULL AUTO_INCREMENT COMMENT 'Codigo',AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `rhco_tipopersona`
--
ALTER TABLE `rhco_tipopersona`
  MODIFY `tper_cod` int(15) NOT NULL AUTO_INCREMENT COMMENT 'Codigo';
--
-- AUTO_INCREMENT de la tabla `rhes_ausencia`
--
ALTER TABLE `rhes_ausencia`
  MODIFY `aus_nro` int(15) NOT NULL AUTO_INCREMENT COMMENT 'Numero';
--
-- AUTO_INCREMENT de la tabla `rhes_entradasalida`
--
ALTER TABLE `rhes_entradasalida`
  MODIFY `ens_nro` int(15) NOT NULL AUTO_INCREMENT COMMENT 'Numero',AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `rhes_horario`
--
ALTER TABLE `rhes_horario`
  MODIFY `hor_cod` int(15) NOT NULL AUTO_INCREMENT COMMENT 'Codigo',AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `rhes_horarioasignado`
--
ALTER TABLE `rhes_horarioasignado`
  MODIFY `has_nro` int(15) NOT NULL AUTO_INCREMENT COMMENT 'Numero',AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `rhes_llegadatardia`
--
ALTER TABLE `rhes_llegadatardia`
  MODIFY `lle_nro` int(15) NOT NULL AUTO_INCREMENT COMMENT 'Numero';
--
-- AUTO_INCREMENT de la tabla `rhes_tipoausencia`
--
ALTER TABLE `rhes_tipoausencia`
  MODIFY `tau_cod` int(15) NOT NULL AUTO_INCREMENT COMMENT 'Codigo',AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `rhes_tipoentradasalida`
--
ALTER TABLE `rhes_tipoentradasalida`
  MODIFY `tes_cod` int(15) NOT NULL AUTO_INCREMENT COMMENT 'Codigo',AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `rhlq_bonificacion`
--
ALTER TABLE `rhlq_bonificacion`
  MODIFY `bod_num` int(15) NOT NULL AUTO_INCREMENT COMMENT 'Numero';
--
-- AUTO_INCREMENT de la tabla `rhlq_descuento`
--
ALTER TABLE `rhlq_descuento`
  MODIFY `deb_num` int(15) NOT NULL AUTO_INCREMENT COMMENT 'Numero';
--
-- AUTO_INCREMENT de la tabla `rhlq_haber`
--
ALTER TABLE `rhlq_haber`
  MODIFY `hab_nro` int(15) NOT NULL AUTO_INCREMENT COMMENT 'Numero';
--
-- AUTO_INCREMENT de la tabla `rhlq_haber_detalle`
--
ALTER TABLE `rhlq_haber_detalle`
  MODIFY `had_nro` int(15) NOT NULL AUTO_INCREMENT COMMENT 'Numero';
--
-- AUTO_INCREMENT de la tabla `rhlq_liquidacion`
--
ALTER TABLE `rhlq_liquidacion`
  MODIFY `liq_nro` int(15) NOT NULL AUTO_INCREMENT COMMENT 'Numero',AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `rhlq_liquidacion_detalle`
--
ALTER TABLE `rhlq_liquidacion_detalle`
  MODIFY `lqd_id` int(15) NOT NULL AUTO_INCREMENT COMMENT 'ID',AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `rhrl_cargo`
--
ALTER TABLE `rhrl_cargo`
  MODIFY `car_cod` int(15) NOT NULL AUTO_INCREMENT COMMENT 'Codigo',AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `rhrl_contrato`
--
ALTER TABLE `rhrl_contrato`
  MODIFY `con_nro` int(15) NOT NULL AUTO_INCREMENT COMMENT 'Numero',AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `rhrl_departamento`
--
ALTER TABLE `rhrl_departamento`
  MODIFY `dep_cod` int(15) NOT NULL AUTO_INCREMENT COMMENT 'Codigo',AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `rhrl_detalle_persona`
--
ALTER TABLE `rhrl_detalle_persona`
  MODIFY `dpe_cod` int(15) NOT NULL AUTO_INCREMENT COMMENT 'Codigo';
--
-- AUTO_INCREMENT de la tabla `rhrl_funcion`
--
ALTER TABLE `rhrl_funcion`
  MODIFY `fun_cod` int(15) NOT NULL AUTO_INCREMENT COMMENT 'Codigo',AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `rhrl_persona`
--
ALTER TABLE `rhrl_persona`
  MODIFY `per_cod` int(15) NOT NULL AUTO_INCREMENT COMMENT 'Codigo',AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `rhrl_salario`
--
ALTER TABLE `rhrl_salario`
  MODIFY `sal_nro` int(15) NOT NULL AUTO_INCREMENT COMMENT 'Numero',AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `sec_groups`
--
ALTER TABLE `sec_groups`
  MODIFY `group_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `rhes_ausencia`
--
ALTER TABLE `rhes_ausencia`
  ADD CONSTRAINT `es_ausencia_persona` FOREIGN KEY (`aus_codper`) REFERENCES `rhrl_persona` (`per_cod`),
  ADD CONSTRAINT `es_ausencia_tipoausencia` FOREIGN KEY (`aus_codtpaus`) REFERENCES `rhes_tipoausencia` (`tau_cod`);

--
-- Filtros para la tabla `rhes_entradasalida`
--
ALTER TABLE `rhes_entradasalida`
  ADD CONSTRAINT `es_entradasalida_persona` FOREIGN KEY (`ens_codper`) REFERENCES `rhrl_persona` (`per_cod`),
  ADD CONSTRAINT `es_entradasalida_tipoentradasalida` FOREIGN KEY (`ens_tpes`) REFERENCES `rhes_tipoentradasalida` (`tes_cod`);

--
-- Filtros para la tabla `rhes_horarioasignado`
--
ALTER TABLE `rhes_horarioasignado`
  ADD CONSTRAINT `rl_horarioasignado_horario` FOREIGN KEY (`has_codhor`) REFERENCES `rhes_horario` (`hor_cod`),
  ADD CONSTRAINT `rl_horarioasignado_persona` FOREIGN KEY (`has_codper`) REFERENCES `rhrl_persona` (`per_cod`);

--
-- Filtros para la tabla `rhes_llegadatardia`
--
ALTER TABLE `rhes_llegadatardia`
  ADD CONSTRAINT `es_llegadatardia_entradasalida` FOREIGN KEY (`lle_nroes`) REFERENCES `rhes_entradasalida` (`ens_nro`);

--
-- Filtros para la tabla `rhlq_bonificacion`
--
ALTER TABLE `rhlq_bonificacion`
  ADD CONSTRAINT `rhlq_bonificacion_ibfk_1` FOREIGN KEY (`bod_codtpbon`) REFERENCES `rhco_tipobonificacion` (`tbon_cod`),
  ADD CONSTRAINT `rhlq_bonificacion_ibfk_2` FOREIGN KEY (`bod_codper`) REFERENCES `rhrl_persona` (`per_cod`);

--
-- Filtros para la tabla `rhlq_haber`
--
ALTER TABLE `rhlq_haber`
  ADD CONSTRAINT `rhlq_haber_ibfk_1` FOREIGN KEY (`hab_codrubro`) REFERENCES `rhco_rubro` (`rub_cod`);

--
-- Filtros para la tabla `rhlq_haber_detalle`
--
ALTER TABLE `rhlq_haber_detalle`
  ADD CONSTRAINT `rhlq_haber_detalle_bonificacion` FOREIGN KEY (`had_codboni`) REFERENCES `rhlq_bonificacion` (`bod_num`),
  ADD CONSTRAINT `rhlq_haber_detalle_concepto` FOREIGN KEY (`had_codconcep`) REFERENCES `rhco_concepto` (`cot_cod`),
  ADD CONSTRAINT `rhlq_haber_detalle_descuento` FOREIGN KEY (`had_coddescue`) REFERENCES `rhlq_descuento` (`deb_num`),
  ADD CONSTRAINT `rhlq_haber_detalle_liquidacion` FOREIGN KEY (`had_nroliq`) REFERENCES `rhlq_liquidacion` (`liq_nro`);

--
-- Filtros para la tabla `rhlq_liquidacion`
--
ALTER TABLE `rhlq_liquidacion`
  ADD CONSTRAINT `lq_liquidacion_persona` FOREIGN KEY (`liq_codper`) REFERENCES `rhrl_persona` (`per_cod`);

--
-- Filtros para la tabla `rhlq_liquidacion_detalle`
--
ALTER TABLE `rhlq_liquidacion_detalle`
  ADD CONSTRAINT `rhlq_liquidacion_detalle_ibfk_1` FOREIGN KEY (`lqd_nroliquidacion`) REFERENCES `rhlq_liquidacion` (`liq_nro`),
  ADD CONSTRAINT `rhlq_liquidacion_detalle_ibfk_2` FOREIGN KEY (`lqd_codconcepto`) REFERENCES `rhco_concepto` (`cot_cod`);

--
-- Filtros para la tabla `rhrl_cargo`
--
ALTER TABLE `rhrl_cargo`
  ADD CONSTRAINT `rl_cargo_departamento` FOREIGN KEY (`car_coddep`) REFERENCES `rhrl_departamento` (`dep_cod`),
  ADD CONSTRAINT `rl_cargo_funcion` FOREIGN KEY (`car_codfun`) REFERENCES `rhrl_funcion` (`fun_cod`);

--
-- Filtros para la tabla `rhrl_contrato`
--
ALTER TABLE `rhrl_contrato`
  ADD CONSTRAINT `rl_contrato_cargo` FOREIGN KEY (`con_codcar`) REFERENCES `rhrl_cargo` (`car_cod`),
  ADD CONSTRAINT `rl_contrato_persona` FOREIGN KEY (`con_codper`) REFERENCES `rhrl_persona` (`per_cod`),
  ADD CONSTRAINT `rl_contrato_salario` FOREIGN KEY (`con_nrosal`) REFERENCES `rhrl_salario` (`sal_nro`);

--
-- Filtros para la tabla `rhrl_detalle_persona`
--
ALTER TABLE `rhrl_detalle_persona`
  ADD CONSTRAINT `rhrl_detalle_persona_ibfk_1` FOREIGN KEY (`dpe_codper`) REFERENCES `rhrl_persona` (`per_codtpdocu`),
  ADD CONSTRAINT `rhrl_detalle_persona_ibfk_2` FOREIGN KEY (`dpe_codtipper`) REFERENCES `rhco_tipopersona` (`tper_cod`);

--
-- Filtros para la tabla `rhrl_persona`
--
ALTER TABLE `rhrl_persona`
  ADD CONSTRAINT `rhrl_persona_ibfk_tipodocumento` FOREIGN KEY (`per_codtpdocu`) REFERENCES `rhco_tipodocumento` (`tdo_cod`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
