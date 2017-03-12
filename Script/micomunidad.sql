CREATE DATABASE micomunidad_1;

USE micomunidad_1;


CREATE TABLE rol(
    pkIdRol int AUTO_INCREMENT PRIMARY KEY,
    rol VARCHAR(100) NOT NULL,
    estado CHARACTER(1) NOT NULL
);


CREATE TABLE permiso(
    pkIdPermiso int AUTO_INCREMENT PRIMARY KEY,
    fkIdRolPermiso int NOT NULL,
    agregar CHARACTER(1),
    modificar CHARACTER(1),
    consultar CHARACTER(1)
);

CREATE TABLE pais(
    pkIdPais int AUTO_INCREMENT PRIMARY KEY,
    pais VARCHAR(60) NOT NULL
);

CREATE TABLE provincia(
    pkIdProvincia int AUTO_INCREMENT PRIMARY KEY,
    fkIdPaisProvincia int NOT NULL,
    provincia VARCHAR(60) NOT NULL
);

CREATE TABLE canton(
    pkIdCanton int AUTO_INCREMENT PRIMARY KEY,
    fkIdProvinciaCanton int NOT NULL,
    canton VARCHAR(60) NOT NULL
);

CREATE TABLE distrito(
    pkIdDistrito int AUTO_INCREMENT PRIMARY KEY,
    fkIdCantonDistrito int NOT NULL,
    distrito VARCHAR(80) NOT NULL
);


CREATE TABLE usuario(
    pkIdUsuario int AUTO_INCREMENT PRIMARY KEY,
    fkIdRolUsuario int,
    nombre VARCHAR(50) NOT NULL,
    apellido1 VARCHAR(40),
    apellido2 VARCHAR(40),
    correo VARCHAR(50),
    usuario VARCHAR(30) NOT NULL,
    contrasenna VARCHAR(40) NOT NULL,
    UNIQUE (usuario)
);

CREATE TABLE comunidad(
    pkIdComunidad int AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(200),
    estado CHARACTER(1)
);

CREATE TABLE iglesia(
    pkIdIglesia int AUTO_INCREMENT PRIMARY KEY,
    fkIdPaisIglesia int,
    fkIdProvinciaIglesia int,
    fkIdCantonIglesia int,
    fkIdDistritoIglesia int,
    fkIdComunidadIglesia int,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(200),
    detalleDireccion VARCHAR(250),
    estado CHARACTER(1)
);



CREATE TABLE celula(
    pkIdCelula int AUTO_INCREMENT PRIMARY KEY,
    fkIdPaisCelula int,
    fkIdProvinciaCelula int,
    fkIdCantonCelula int,
    fkIdDistritoCelula int,
    fkIdIglesiaCelula int,
    fkIdUsuarioCelula int,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(200) NOT NULL,
    detalleDireccion VARCHAR(250),
    estado CHARACTER(1)
);

CREATE TABLE reunionCelula(
    pkIdReunionCelula int AUTO_INCREMENT PRIMARY KEY,
    fkIdCelulaReunionCelula int NOT NULL,
    fecha datetime NOT NULL
);

CREATE TABLE reunionIglesia(
    pkIdReunionIglesia int AUTO_INCREMENT PRIMARY KEY,
    fkIdIglesiaReunionIglesia int NOT NULL,
    fecha datetime NOT NULL
);

CREATE TABLE usuarioIglesia(
    pkIdUsuarioIglesia int AUTO_INCREMENT PRIMARY KEY,
    fkIdIglesiaUsuarioIglesia int NOT NULL,
    fkIdUsuarioUsuarioIglesia int NOT NULL
);


CREATE TABLE usuarioCelula(
    pkIdUsuarioCelula int AUTO_INCREMENT PRIMARY KEY,
    fkIdCelulaUsuarioCelula int NOT NULL,
    fkIdUsuarioUsuarioCelula int NOT NULL
);


CREATE TABLE asistenciaCelula(
    pkIdAsistenciaCelula int AUTO_INCREMENT PRIMARY KEY,
    fkIdUsuarioAsistenciaCelula int NOT NULL,
    fkIdReunionCelula int NOT NULL,
    Ofrenda numeric
);


CREATE TABLE asistenciaIglesia(
    pkIdAsistenciaIglesia int AUTO_INCREMENT PRIMARY KEY,
    fkIdUsuarioAsistenciaIglesia int NOT NULL,
    fkIdReunionIglesia int NOT NULL,
    Ofrenda numeric
);

CREATE TABLE noticias(
    pkIdNoticias int AUTO_INCREMENT PRIMARY KEY,
    fkIdIglesiaNoticias int,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(250) NOT NULL,
    fecha DATE,
    estado CHARACTER(1)
);



ALTER TABLE usuario ADD CONSTRAINT fkIdRolUsuario FOREIGN KEY (fkIdRolUsuario) REFERENCES rol(pkIdRol);

ALTER TABLE provincia ADD CONSTRAINT fkIdPaisProvincia FOREIGN KEY (fkIdPaisProvincia) REFERENCES pais (pkIdPais);

ALTER TABLE canton ADD CONSTRAINT fkIdProvinciaCanton FOREIGN KEY (fkIdProvinciaCanton) REFERENCES provincia (pkIdProvincia);

ALTER TABLE distrito ADD CONSTRAINT fkIdCantonDistrito FOREIGN KEY (fkIdCantonDistrito) REFERENCES canton(pkIdCanton);

ALTER TABLE iglesia ADD CONSTRAINT fkIdPaisIglesia FOREIGN KEY (fkIdPaisIglesia) REFERENCES pais(pkIdPais);
ALTER TABLE iglesia ADD CONSTRAINT fkIdProvinciaIglesia FOREIGN KEY (fkIdProvinciaIglesia) REFERENCES provincia(pkIdProvincia);
ALTER TABLE iglesia ADD CONSTRAINT fkIdCantonIglesia FOREIGN KEY (fkIdCantonIglesia) REFERENCES canton(pkIdCanton);
ALTER TABLE iglesia ADD CONSTRAINT fkIdDistritoIglesia FOREIGN KEY (fkIdDistritoIglesia) REFERENCES distrito(pkIdDistrito);
ALTER TABLE iglesia ADD CONSTRAINT fkIdComunidadIglesia FOREIGN KEY (fkIdComunidadIglesia) REFERENCES comunidad(pkIdComunidad);

ALTER TABLE celula ADD CONSTRAINT fkIdPaisCelula FOREIGN KEY (fkIdPaisCelula) REFERENCES pais(pkIdPais);
ALTER TABLE celula ADD CONSTRAINT fkIdProvinciaCelula FOREIGN KEY (fkIdProvinciaCelula) REFERENCES provincia(pkIdProvincia);
ALTER TABLE celula ADD CONSTRAINT fkIdCantonCelula FOREIGN KEY (fkIdCantonCelula) REFERENCES canton(pkIdCanton);
ALTER TABLE celula ADD CONSTRAINT fkIdDistritoCelula FOREIGN KEY (fkIdDistritoCelula) REFERENCES distrito(pkIdDistrito);
ALTER TABLE celula ADD CONSTRAINT fkIdIglesiaCelula FOREIGN KEY (fkIdIglesiaCelula) REFERENCES iglesia(pkIdIglesia);
ALTER TABLE celula ADD CONSTRAINT fkIdUsuarioCelula FOREIGN KEY (fkIdUsuarioCelula) REFERENCES usuario(pkIdUsuario);

ALTER TABLE reunionCelula ADD CONSTRAINT fkIdCelulaReunionCelula FOREIGN KEY(fkIdCelulaReunionCelula) REFERENCES celula(pkIdCelula);

ALTER TABLE reunionIglesia ADD CONSTRAINT fkIdIglesiaReunionIglesia FOREIGN KEY(fkIdIglesiaReunionIglesia) REFERENCES iglesia(pkIdIglesia);

ALTER TABLE permiso ADD CONSTRAINT fkIdRolPermiso FOREIGN KEY(fkIdRolPermiso) REFERENCES rol(pkIdRol);

ALTER TABLE usuarioIglesia ADD CONSTRAINT fkIdUsuarioUsuarioIglesia FOREIGN KEY(fkIdUsuarioUsuarioIglesia) REFERENCES usuario(pkIdUsuario);
ALTER TABLE usuarioIglesia ADD CONSTRAINT fkIdIglesiaUsuarioIglesia FOREIGN KEY(fkIdIglesiaUsuarioIglesia) REFERENCES iglesia(pkIdIglesia);

ALTER TABLE usuarioCelula ADD CONSTRAINT fkIdCelulaUsuarioCelula FOREIGN KEY (fkIdCelulaUsuarioCelula) REFERENCES celula(pkIdCelula);
ALTER TABLE usuarioCelula ADD CONSTRAINT fkIdUsuarioUsuarioCelula FOREIGN KEY (fkIdUsuarioUsuarioCelula) REFERENCES usuario(pkIdUsuario);

ALTER TABLE asistenciaCelula ADD CONSTRAINT fkIdReunionCelula FOREIGN KEY (fkIdReunionCelula) REFERENCES reunionCelula (pkIdReunionCelula);
ALTER TABLE asistenciaCelula ADD CONSTRAINT fkIdUsuarioAsistenciaCelula FOREIGN KEY (fkIdUsuarioAsistenciaCelula) REFERENCES usuario (pkIdUsuario);

ALTER TABLE asistenciaIglesia ADD CONSTRAINT fkIdReunionIglesia FOREIGN KEY (fkIdReunionIglesia) REFERENCES reunionIglesia (pkIdReunionIglesia);
ALTER TABLE asistenciaIglesia ADD CONSTRAINT fkIdUsuarioAsistenciaIglesia FOREIGN KEY (fkIdUsuarioAsistenciaIglesia) REFERENCES usuario (pkIdUsuario);

ALTER TABLE noticias ADD CONSTRAINT fkIdIglesiaNoticias FOREIGN KEY (fkIdIglesiaNoticias) REFERENCES iglesia (pkIdIglesia);

INSERT INTO `micomunidad_1`.`rol` (`pkIdRol`, `rol`, `estado`) VALUES (NULL, 'Administrador', 'A');

INSERT INTO `micomunidad_1`.`usuario` (`pkIdUsuario`, `nombre`, `apellido1`,`apellido2`, `correo`, `usuario`, `contrasenna`, `fkIdRolUsuario`) VALUES (NULL, 'admin', 'apellido', 'apellido2', 'correo@correo.com', 'admin', 'admin', 1);

INSERT INTO `micomunidad_1`.`comunidad` (`pkIdComunidad`, `nombre`, `descripcion`, `estado`) VALUES (NULL, 'Iglesia Bautista', NULL, 'A');



