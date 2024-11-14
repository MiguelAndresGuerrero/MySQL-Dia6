CREATE TABLE `EMPLEADO`(
    `id_empleado` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nombre` VARCHAR(255) NULL,
    `apellido` VARCHAR(255) NULL,
    `direccion` VARCHAR(255) NULL,
    `ciudad_residencia` VARCHAR(255) NULL,
    `cedula` INT NULL,
    `celular` INT NULL,
    `correo_electronico` VARCHAR(255) NULL,
    `id_alquiler` INT NULL
);
ALTER TABLE
    `EMPLEADO` ADD INDEX `empleado_id_alquiler_index`(`id_alquiler`);
CREATE TABLE `SUCURSAL_ALQUILER`(
    `id_sucursal_alquiler` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `id_sucursal` INT NULL,
    `id_alquiler` INT NULL
);
ALTER TABLE
    `SUCURSAL_ALQUILER` ADD INDEX `sucursal_alquiler_id_sucursal_index`(`id_sucursal`);
ALTER TABLE
    `SUCURSAL_ALQUILER` ADD INDEX `sucursal_alquiler_id_alquiler_index`(`id_alquiler`);
CREATE TABLE `VEHICULO_ALQUILER`(
    `id_vehiculo_alquiler` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `id_alquiler` INT NULL,
    `id_vehiculo` INT NULL
);
ALTER TABLE
    `VEHICULO_ALQUILER` ADD INDEX `vehiculo_alquiler_id_alquiler_index`(`id_alquiler`);
ALTER TABLE
    `VEHICULO_ALQUILER` ADD INDEX `vehiculo_alquiler_id_vehiculo_index`(`id_vehiculo`);
CREATE TABLE `ALQUILER_CLIENTE`(
    `id_alquiler_cliente` BIGINT NOT NULL,
    `id_alquiler` BIGINT NULL,
    `id_cliente` BIGINT UNSIGNED NULL,
    PRIMARY KEY(`id_alquiler_cliente`)
);
ALTER TABLE
    `ALQUILER_CLIENTE` ADD INDEX `alquiler_cliente_id_alquiler_index`(`id_alquiler`);
ALTER TABLE
    `ALQUILER_CLIENTE` ADD INDEX `alquiler_cliente_id_cliente_index`(`id_cliente`);
CREATE TABLE `ALQUILER`(
    `id_alquiler` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `vehiculo` VARCHAR(255) NULL,
    `fecha_salida` DATE NULL,
    `porcentaje_descuento` INT NULL,
    `valor_alquiler_dia` INT NULL,
    `valor_alquiler_semana` INT NULL,
    `fecha_llegada` INT NULL,
    `valor_cotizado` BIGINT NULL,
    `valor_pagado` INT NULL,
    `id_cliente` INT NULL,
    `id_empleado` INT NULL,
    `id_sucursal` VARCHAR(255) NULL,
    `id_vehiculo` INT NULL
);
ALTER TABLE
    `ALQUILER` ADD INDEX `alquiler_id_cliente_index`(`id_cliente`);
ALTER TABLE
    `ALQUILER` ADD INDEX `alquiler_id_empleado_index`(`id_empleado`);
ALTER TABLE
    `ALQUILER` ADD INDEX `alquiler_id_sucursal_index`(`id_sucursal`);
ALTER TABLE
    `ALQUILER` ADD INDEX `alquiler_id_vehiculo_index`(`id_vehiculo`);
CREATE TABLE `VEHICULO`(
    `id_vehiculo` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `tipo_vehiculo` VARCHAR(255) NULL,
    `color` VARCHAR(255) NULL,
    `sunroof` VARCHAR(255) NULL,
    `modelos` VARCHAR(255) NULL,
    `referencia` VARCHAR(255) NULL,
    `capacidad` VARCHAR(255) NULL,
    `motor` VARCHAR(255) NULL,
    `puertas` VARCHAR(255) NULL,
    `placa` VARCHAR(255) NULL
);
CREATE TABLE `CLIENTE`(
    `id_cliente` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nombre` VARCHAR(255) NULL,
    `apellidos` VARCHAR(255) NULL,
    `direccion` VARCHAR(255) NULL,
    `ciudad_residencia` VARCHAR(255) NULL,
    `cedula` INT NULL,
    `celular` INT NULL,
    `correo_electronico` VARCHAR(255) NULL
);
CREATE TABLE `EMPLEADO_ALQUILER`(
    `id_empleado_alquiler` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `id_alquiler` INT NULL,
    `id_empleado` INT NULL
);
ALTER TABLE
    `EMPLEADO_ALQUILER` ADD INDEX `empleado_alquiler_id_alquiler_index`(`id_alquiler`);
ALTER TABLE
    `EMPLEADO_ALQUILER` ADD INDEX `empleado_alquiler_id_empleado_index`(`id_empleado`);
CREATE TABLE `SUCURSAL`(
    `id_sucursal` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY
);
ALTER TABLE
    `ALQUILER` ADD CONSTRAINT `alquiler_id_cliente_foreign` FOREIGN KEY(`id_cliente`) REFERENCES `ALQUILER_CLIENTE`(`id_cliente`);
ALTER TABLE
    `ALQUILER` ADD CONSTRAINT `alquiler_id_vehiculo_foreign` FOREIGN KEY(`id_vehiculo`) REFERENCES `VEHICULO_ALQUILER`(`id_vehiculo`);
ALTER TABLE
    `SUCURSAL_ALQUILER` ADD CONSTRAINT `sucursal_alquiler_id_alquiler_foreign` FOREIGN KEY(`id_alquiler`) REFERENCES `ALQUILER`(`id_alquiler`);
ALTER TABLE
    `ALQUILER` ADD CONSTRAINT `alquiler_id_empleado_foreign` FOREIGN KEY(`id_empleado`) REFERENCES `EMPLEADO_ALQUILER`(`id_empleado`);
ALTER TABLE
    `EMPLEADO_ALQUILER` ADD CONSTRAINT `empleado_alquiler_id_alquiler_foreign` FOREIGN KEY(`id_alquiler`) REFERENCES `ALQUILER`(`id_alquiler`);
ALTER TABLE
    `SUCURSAL_ALQUILER` ADD CONSTRAINT `sucursal_alquiler_id_sucursal_foreign` FOREIGN KEY(`id_sucursal`) REFERENCES `SUCURSAL`(`id_sucursal`);
ALTER TABLE
    `SUCURSAL_ALQUILER` ADD CONSTRAINT `sucursal_alquiler_id_sucursal_foreign` FOREIGN KEY(`id_sucursal`) REFERENCES `ALQUILER`(`id_sucursal`);
ALTER TABLE
    `ALQUILER_CLIENTE` ADD CONSTRAINT `alquiler_cliente_id_cliente_foreign` FOREIGN KEY(`id_cliente`) REFERENCES `CLIENTE`(`id_cliente`);
ALTER TABLE
    `EMPLEADO` ADD CONSTRAINT `empleado_id_alquiler_foreign` FOREIGN KEY(`id_alquiler`) REFERENCES `EMPLEADO_ALQUILER`(`id_empleado`);
ALTER TABLE
    `ALQUILER_CLIENTE` ADD CONSTRAINT `alquiler_cliente_id_alquiler_foreign` FOREIGN KEY(`id_alquiler`) REFERENCES `ALQUILER`(`id_alquiler`);
ALTER TABLE
    `VEHICULO_ALQUILER` ADD CONSTRAINT `vehiculo_alquiler_id_vehiculo_foreign` FOREIGN KEY(`id_vehiculo`) REFERENCES `VEHICULO`(`id_vehiculo`);
ALTER TABLE
    `VEHICULO_ALQUILER` ADD CONSTRAINT `vehiculo_alquiler_id_alquiler_foreign` FOREIGN KEY(`id_alquiler`) REFERENCES `ALQUILER`(`id_alquiler`);