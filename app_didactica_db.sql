-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-10-2024 a las 05:50:42
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `app_didactica_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividades`
--

CREATE TABLE `actividades` (
  `id_actividad` int(11) NOT NULL,
  `nombre_actividad` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `nivel_dificultad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `juegos`
--

CREATE TABLE `juegos` (
  `id_juego` int(11) NOT NULL,
  `nombre_juego` varchar(100) NOT NULL,
  `tipo_juego` varchar(50) DEFAULT NULL,
  `nivel_dificultad` int(11) DEFAULT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfiles`
--

CREATE TABLE `perfiles` (
  `id_perfil` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `notificaciones` tinyint(1) DEFAULT 1,
  `tema_preferido` varchar(100) DEFAULT NULL,
  `nivel_preferido` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `perfiles`
--

INSERT INTO `perfiles` (`id_perfil`, `id_usuario`, `notificaciones`, `tema_preferido`, `nivel_preferido`) VALUES
(1, 12, 1, 'default', 1),
(2, 13, 1, 'default', 1),
(3, 23, 1, 'default', 1),
(4, 24, 1, 'default', 1),
(5, 25, 1, 'default', 1),
(6, 26, 1, 'default', 1),
(7, 27, 1, 'default', 1),
(8, 28, 1, 'default', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ranking`
--

CREATE TABLE `ranking` (
  `id_ranking` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `puntaje_total` int(11) DEFAULT NULL,
  `ranking_posicion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ranking`
--

INSERT INTO `ranking` (`id_ranking`, `id_usuario`, `puntaje_total`, `ranking_posicion`) VALUES
(1, 26, 120, NULL),
(2, 26, 1200, NULL),
(3, 26, 0, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resultados`
--

CREATE TABLE `resultados` (
  `id_resultado` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_juego` int(11) DEFAULT NULL,
  `id_actividad` int(11) DEFAULT NULL,
  `puntuacion` int(11) DEFAULT NULL,
  `tiempo_juego` time DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `revokedtokens`
--

CREATE TABLE `revokedtokens` (
  `id` int(11) NOT NULL,
  `jti` varchar(255) NOT NULL,
  `fecha_revocacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `revokedtokens`
--

INSERT INTO `revokedtokens` (`id`, `jti`, `fecha_revocacion`) VALUES
(1, '1b3a9797-78ca-4327-8c46-e49aeb2fb87a', '2024-10-21 13:17:16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id_rol` int(11) NOT NULL,
  `nombre_rol` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `contraseña` varchar(255) NOT NULL,
  `edad` int(11) DEFAULT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre`, `correo`, `contraseña`, `edad`, `fecha_registro`) VALUES
(1, 'Test User', 'testuser@example.com', '$2b$12$7A1KIGBBuv0f5eVwgN8qReuhjN/pIZUC6ZxAvJ5usC4BZcePs7e8m', 25, '2024-10-21 05:03:47'),
(2, 'Test User', 'testuser1@example.com', '$2b$12$zU68wRYY5SG/kRI31wPgw.xhnkWirs./9OdcrAlGt3vuSyOtRfBJ6', 5, '2024-10-21 05:27:29'),
(4, 'Test User', 'testuser2@example.com', '$2b$12$bzZU8RwjNcIc50RW/O47leiA8F.jCE5ihuVZGJa1hv7/tzcNN9Q1S', 5, '2024-10-21 05:33:09'),
(6, 'Test User', 'testuser3@example.com', '$2b$12$NXwa6jdcZoEvRAleAQ8CNOKYysRTURc16oMZkChQseNk9golrBKGi', 5, '2024-10-21 12:25:53'),
(7, 'Test User', 'testuser4@example.com', '$2b$12$WN8JU.EJwATanApOw2wOD.Y9mcd8z4Ufypq0CxrGwikvFjkj1lgQq', 5, '2024-10-21 13:17:05'),
(9, 'Test User', 'testuser5@example.com', '$2b$12$PIjbYs.oFqxGsAbVxvChyuNwN2IWRlX0cibhhbsupZOJUbcpro.v.', 5, '2024-10-21 13:20:56'),
(10, 'Test User', 'testuser6@example.com', '$2b$12$p6dbHpCns96jqa.MqQfbD.YMtn/h7MlLV12rp7YTHqGzn0UkbTCEa', 5, '2024-10-21 13:25:14'),
(11, 'Test User', 'testuser7@example.com', '$2b$12$t.SQHWM4lLbx4DQYiqBeg.qFqSnocVU5U0d7zRsli5plRJR4GMjni', 5, '2024-10-21 13:46:33'),
(12, 'Test User', 'testuser8@example.com', '$2b$12$/B56HXVx3Yk6bB9mRtroxOjDlbl13xemxJG/sNwFLFvfyyApmRHIm', 5, '2024-10-21 14:00:43'),
(13, 'Gerardo Fabian', 'gerardogonzalezm1403@gmail.com', '$2b$12$zBnAaLFCOfK6AL1n.AVaCelNeStn0IQ.jhhRk3YFbSm7gXUsehhpe', 21, '2024-10-22 01:32:05'),
(23, 'UserPrueba', 'user@gmail.com', '$2b$12$3tmLWH/ABr/wpJ4yW604O.OJ0wxN2uuPuGoLY/z.s4e.QcaZjbHAK', 20, '2024-10-22 01:37:50'),
(24, 'test', 'test@test.com', '$2b$12$4uYOZes7nmbS6h6S.eXfjuxYhty.VesgqdrpPB9lm/uavZBRVAE9a', 20, '2024-10-22 01:44:25'),
(25, 'admin', 'admin@us.com', '$2b$12$Z6pfvWPTq1sAiuB2yNL44.WCufZxv1HL/dsJmv.bZMRsVoXI4BXfS', 1, '2024-10-22 02:07:24'),
(26, 'Test User', 'testuser9@example.com', '$2b$12$EVT4SJPKtJ5EF1ayJDz3WuIr47MfVTpsifcpcIZU/SiDmjOxmLvfW', 5, '2024-10-22 04:06:39'),
(27, 'Gerardo', 'test1@test.com', '$2b$12$EvRS48XR6/x3Ajxgboiz9uDFNvv4gNtD3Ri6I3ZjVbUA/t0BczhUS', 20, '2024-10-22 15:01:56'),
(28, 'Angie', 'angie@gmail.com', '$2b$12$3pyaiPjpRamdwUjsof/s3uNI0AnygDSKNmF7q2drfzA3bm5TK4Tp2', 23, '2024-10-22 20:32:02');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actividades`
--
ALTER TABLE `actividades`
  ADD PRIMARY KEY (`id_actividad`);

--
-- Indices de la tabla `juegos`
--
ALTER TABLE `juegos`
  ADD PRIMARY KEY (`id_juego`);

--
-- Indices de la tabla `perfiles`
--
ALTER TABLE `perfiles`
  ADD PRIMARY KEY (`id_perfil`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `ranking`
--
ALTER TABLE `ranking`
  ADD PRIMARY KEY (`id_ranking`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `resultados`
--
ALTER TABLE `resultados`
  ADD PRIMARY KEY (`id_resultado`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_juego` (`id_juego`),
  ADD KEY `id_actividad` (`id_actividad`);

--
-- Indices de la tabla `revokedtokens`
--
ALTER TABLE `revokedtokens`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_rol`),
  ADD UNIQUE KEY `nombre_rol` (`nombre_rol`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `actividades`
--
ALTER TABLE `actividades`
  MODIFY `id_actividad` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `juegos`
--
ALTER TABLE `juegos`
  MODIFY `id_juego` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `perfiles`
--
ALTER TABLE `perfiles`
  MODIFY `id_perfil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `ranking`
--
ALTER TABLE `ranking`
  MODIFY `id_ranking` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `resultados`
--
ALTER TABLE `resultados`
  MODIFY `id_resultado` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `revokedtokens`
--
ALTER TABLE `revokedtokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `perfiles`
--
ALTER TABLE `perfiles`
  ADD CONSTRAINT `perfiles_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `ranking`
--
ALTER TABLE `ranking`
  ADD CONSTRAINT `ranking_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `resultados`
--
ALTER TABLE `resultados`
  ADD CONSTRAINT `resultados_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `resultados_ibfk_2` FOREIGN KEY (`id_juego`) REFERENCES `juegos` (`id_juego`),
  ADD CONSTRAINT `resultados_ibfk_3` FOREIGN KEY (`id_actividad`) REFERENCES `actividades` (`id_actividad`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
