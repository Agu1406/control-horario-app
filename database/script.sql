/*
* AUTOR DEL SQL: AGUSTÍN. A MARQUEZ PIÑA
*
* CREACIÓN DEL SQL: 13/07/2025
* ULTIMA MODIFICACIÓN: 13/07/2025
* MODELO DE BASE DE DATOS: MySQL
* VERSION: 1.0.1
*/

DROP DATABASE IF EXISTS db_work_schedule_app;
CREATE DATABASE db_work_schedule_app;
USE db_work_schedule_app;

/*
* Tabla encargada del almacenamiento de los usuarios (users) si no existe.
*
* Esta tabla almacena los usuarios de la aplicación, se espera que el usuario tenga un 
* nombre de usuario, un nombre, un apellido, un email, una contraseña y su fecha de 
* contratación (antigüedad).
*
* @author Agustín A. Marquez P.
* @version 1.0.0
*/
CREATE TABLE IF NOT EXISTS `users` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `username` VARCHAR(50) UNIQUE,
    `first_name` VARCHAR(255) NOT NULL,
    `last_name` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL UNIQUE,
    `password_hash` VARCHAR(255) NULL,
    -- Fecha de contratación en la empresa para calcular antigüedad
    `hire_date` DATE NULL,
    -- Estado del usuario, 1: activo, 0: inactivo.
    `is_active` TINYINT(1) NOT NULL DEFAULT 1,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB;

/*
*
* Tabla encargada del almacenamiento de los proveedores OAuth para usuarios (user_oauth_providers) 
* si no existe.
*
* Esta tabla almacena los proveedores OAuth para usuarios, se espera que el usuario tenga un proveedor 
* OAuth y que este proveedor OAuth tenga un token de acceso y un token de actualización.
*
* @author Agustín A. Marquez P.
* @version 1.0.0
*/
CREATE TABLE IF NOT EXISTS `user_oauth_providers` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `user_id` INT NOT NULL,
    `provider` ENUM('google', 'facebook', 'github') NOT NULL,
    `provider_user_id` VARCHAR(255) NOT NULL,
    `access_token` TEXT,
    `refresh_token` TEXT,
    `expires_at` TIMESTAMP NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE,
    UNIQUE KEY `provider_user_unique` (`provider`, `provider_user_id`)
) ENGINE = InnoDB;

/*
* Tabla encargada del almacenamiento de los permisos de usuario (user_authorities) si no existe.
*
* Esta tabla almacena los permisos de usuario, se espera que el usuario tenga un rol y que
* este rol tenga permisos. Su diseño está pensado para funcionar con JWT.
*
* @author Agustín A. Marquez P.
* @version 1.0.0
*/
CREATE TABLE IF NOT EXISTS `user_authorities` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `user_id` INT NOT NULL,
    -- Autoridades del usuario, ejemplo: 'ADMIN', 'SYSTEM', 'USER'.
    `authorities` VARCHAR(50) NOT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    -- Clave única para evitar duplicados de autoridades por usuario.
    UNIQUE KEY `user_id_authorities_unique` (`user_id`, `authorities`),
    -- Clave foránea para relacionar el usuario con sus autoridades.
    CONSTRAINT `fk_user_authorities_users`
    FOREIGN KEY (`user_id`)
    REFERENCES `users` (`id`)
    -- En eliminación o actualización de usuario, no se elimina o actualiza la autoridad.
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

/*
* Tabla encargada del almacenamiento de los registros de jornada (time_records) si no existe.
*
* Esta tabla almacena los registros de jornada de los usuarios, se espera que el usuario
* indique su hora de entrada y de salida así como la fecha en que se registró, el
* calculo del total de horas es automático y la descripción es opcional.
*
* @author Agustín A. Marquez P.
* @version 1.0.0
*/
CREATE TABLE IF NOT EXISTS `time_records` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `user_id` INT NOT NULL,
    `record_date` DATE NOT NULL,
    `start_time` TIME NOT NULL,
    `end_time` TIME NOT NULL,
    `total_hours` DECIMAL(5,2) NOT NULL,
    `description` VARCHAR(255) DEFAULT `Sin descripción`,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    -- Clave foránea para relacionar el usuario con sus registros de jornada.
    CONSTRAINT `fk_time_records_users`
    FOREIGN KEY (`user_id`)
    REFERENCES `users` (`id`)
    -- En eliminación o actualización de usuario, no se elimina o actualiza el registro de jornada.
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

/*
* Tabla encargada del almacenamiento de las imágenes de los horarios de trabajo (schedule_images) 
* si no existe. Esta tabla almacena las imágenes de los horarios de trabajo (sus rutas) para
* garantizar que los empleados puedan acceder a ellas.
*
* @author Agustín A. Marquez P.
* @version 1.0.0
*/
CREATE TABLE IF NOT EXISTS `schedule_images` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `schedule_name` VARCHAR(255) NOT NULL,
    `image_path` VARCHAR(500) NOT NULL,
    `valid_from` DATE NOT NULL, -- Desde qué fecha es válido
    `valid_to` DATE NULL, -- Hasta qué fecha (NULL = vigente)
    `uploaded_by` INT NULL, -- Quién subió la imagen
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`uploaded_by`) REFERENCES `users`(`id`)
) ENGINE = InnoDB;