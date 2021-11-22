
--- modelo  grupal * rpc lunes 22 de octubre 

DROP TABLE pais CASCADE CONSTRAINTS;
DROP TABLE ciudad CASCADE CONSTRAINTS;
DROP TABLE institucion CASCADE CONSTRAINTS;
DROP TABLE rol CASCADE CONSTRAINTS;
DROP TABLE usuario CASCADE CONSTRAINTS;
DROP TABLE competencia CASCADE CONSTRAINTS;
DROP TABLE equipo CASCADE CONSTRAINTS;
DROP TABLE credencial CASCADE CONSTRAINTS;
DROP TABLE permiso CASCADE CONSTRAINTS;
DROP TABLE usuario_equipo CASCADE CONSTRAINTS;
DROP TABLE equipo_competencia CASCADE CONSTRAINTS;
DROP TABLE rol_permiso CASCADE CONSTRAINTS;

Create table pais(
codigo_pais VARCHAR(20),
nombre_pais VARCHAR(20) NOT NULL,
PRIMARY KEY(codigo_pais)
);



Create table ciudad(
codigo_ciudad VARCHAR(20),
nombre_ciudad VARCHAR(20) NOT NULL,
codigo_pais VARCHAR(20),
PRIMARY KEY(codigo_ciudad),
FOREIGN KEY (codigo_pais) REFERENCES pais(codigo_pais)
);


-- cambios 
Create table institucion (

codigo_institucion  VARCHAR(50) NOT NULL,
codigo_ciudad VARCHAR(20),
codigo_tipo_institucion VARCHAR(20),
PRIMARY KEY(codigo_institucion),
FOREIGN KEY (codigo_ciudad) REFERENCES ciudad(codigo_ciudad)
FOREIGN KEY (codigo_tipo_institucion) REFERENCES codigo_tipo_institucion(codigo_tipo_institucion)
);


Create table rol(
codigo_rol VARCHAR(20),
nombre VARCHAR(50) NOT NULL,
descripcion VARCHAR(100),
PRIMARY KEY (codigo_rol)
);


-- cambios (add atributes correo, contraseña , modificate the Primary key and relation with pais).
Create table usuario(
username VARCHAR(20) UNIQUE,
nombre VARCHAR(50) NOT NULL,
apellido VARCHAR(50) NOT NULL,
descripcion VARCHAR(300),
codigo_institucion VARCHAR(50),
codigo_rol VARCHAR(20),
contraseña VARCHAR (20) NOT NULL,
codigo_pais VARCHAR (100),
correoUser VARCHAR (100) UNIQUE,
PRIMARY KEY(correo),
FOREIGN KEY (codigo_institucion) REFERENCES institucion(codigo_institucion),
FOREIGN KEY (codigo_rol) REFERENCES rol(codigo_rol)
FOREIGN KEY (codigo_pais) REFERENCES pais(codigo_pais)
);


--- cambios add atribute cantidaEquipo
Create table competencia(
codigo_competencia VARCHAR(20),
fecha_finalizacion DATE NOT NULL,
fecha_inicio DATE NOT NULL,
fecha_fin_ins DATE NOT NULL,
fecha_inicio_ins DATE NOT NULL,
nombre VARCHAR(50) NOT NULL,
categoria  VARCHAR(20),
numero_equipos Integer,
CantidadPorEquipo Integer,
PRIMARY KEY(codigo_competencia),
CHECK (fecha_fin_ins > fecha_inicio_ins),
CHECK (fecha_inicio > fecha_fin_ins),
CHECK (fecha_finalizacion > fecha_inicio)
);

Create table equipo(
codigo_equipo VARCHAR(20),
nombre VARCHAR(50) NOT NULL,
PRIMARY KEY(codigo_equipo)
);

Create table credencial(
codigo_credencial VARCHAR(20),
correo VARCHAR(100) NOT NULL,
token VARCHAR(200) NOT NULL,
username VARCHAR(20),
PRIMARY KEY(codigo_credencial, username),
FOREIGN KEY (username) REFERENCES usuario(username)
);

Create table permiso(
codigo_permiso VARCHAR(20),
entidad VARCHAR(20) NOT NULL,
c NUMBER(1,0) NOT NULL,
r NUMBER(1,0) NOT NULL,
u NUMBER(1,0) NOT NULL,
d NUMBER(1,0) NOT NULL,
PRIMARY KEY(codigo_permiso)
);

-- create table direccion
Create table direccion(

codigo_direccion VARCHAR(20),
direccion VARCHAR (100),
PRIMARY KEY(codigo_direccion)
)

-- create table tipo_instituccion 

Create table tipo_institucion{

    codigo_tipo_institucion VARCHAR(20),
    tipo_institucion VARCHAR(50),

    PRIMARY KEY(codigo_tipo_institucion)

}
-- relaciones n a n---
Create table usuario_equipo(
codigo_equipo VARCHAR(20),
username VARCHAR(20),
PRIMARY KEY(codigo_equipo,username),
FOREIGN KEY (username) REFERENCES usuario(username),
FOREIGN KEY (codigo_equipo) REFERENCES equipo(codigo_equipo)
);

-- relaciones n a n---
Create table equipo_competencia(
codigo_equipo VARCHAR(20),
codigo_competencia VARCHAR(20),
PRIMARY KEY(codigo_equipo,codigo_competencia),
FOREIGN KEY (codigo_equipo) REFERENCES equipo(codigo_equipo),
FOREIGN KEY (codigo_competencia) REFERENCES competencia(codigo_competencia)
);


-- relaciones n a n---
Create table rol_permiso(
codigo_permiso VARCHAR(20),
codigo_rol VARCHAR(20),
PRIMARY KEY (codigo_permiso, codigo_rol),
FOREIGN KEY (codigo_permiso) REFERENCES permiso(codigo_permiso),
FOREIGN KEY (codigo_rol) REFERENCES rol(codigo_rol)
);


-- relaciojn institucion competencia 
Create table es_sede {
codigo_institucion VARCHAR(50),
codigo_competencia VARCHAR(20),
PRIMARY KEY (codigo_institucion, codigo_competencia),
FOREIGN KEY (codigo_institucion) REFERENCES institucion(codigo_institucion),
FOREIGN KEY (codigo_competencia) REFERENCES institucion(codigo_competencia),
}
    



-- inserts pais --


INSERT INTO pais VALUES ('p01','Colombia');
INSERT INTO pais VALUES ('p02','Canada');
INSERT INTO pais VALUES ('p03','Brasil');
INSERT INTO pais VALUES ('p04','China');
INSERT INTO pais VALUES ('p05','Rusia');
INSERT INTO pais VALUES ('p06','Estados unidos');
INSERT INTO pais VALUES ('p07','Mexico');
INSERT INTO pais VALUES ('p08','Alemania');
INSERT INTO pais VALUES ('p09','España');
INSERT INTO pais VALUES ('p010','Portugal');


-- insert ciudad--

INSERT INTO ciudad VALUES ('c01','Cali','p01');
INSERT INTO ciudad VALUES ('c02','Medellin','p01');
INSERT INTO ciudad VALUES ('c03','Barcelona','p09');
INSERT INTO ciudad VALUES ('c04','Madrid','p09');
INSERT INTO ciudad VALUES ('c05','Texas','p06');
INSERT INTO ciudad VALUES ('c06','Bogota DC','p01');
INSERT INTO ciudad VALUES ('c07','New york','p06');
INSERT INTO ciudad VALUES ('c08','Popayan','p01');
INSERT INTO ciudad VALUES ('c09','Boston','p06');
INSERT INTO ciudad VALUES ('c010','Washintong','p06');
-- insert universidad ---

INSERT INTO institucion VALUES ('A001','ICESI','c01', 'tpi_01');
INSERT INTO institucion VALUES ('A002','Universidad de los andes','c01', 'tpi_01');
INSERT INTO institucion VALUES ('A003','Universidad santiago de cali','c01', 'tpi_01');
INSERT INTO institucion VALUES ('A004','Universidad de Barcelona','c03', 'tpi_01');
INSERT INTO institucion VALUES ('A005','Universidad Autonoma de Barcelona','c03', 'tpi_01');
INSERT INTO institucion VALUES ('A006','HARVARD','c07','tpi_01');
INSERT INTO institucion VALUES ('A007','MIT','c07', 'tpi_01');
INSERT INTO institucion VALUES ('A008','EAFIT','c02', 'tpi_01');
INSERT INTO institucion VALUES ('A009','UAO CAUCA','c08', 'tpi_01');
INSERT INTO institucion VALUES ('A010','U de madrid','c04', 'tpi_01');
-- insert rol-- 
INSERT INTO rol VALUES ('R01','ADMIN','Acceso total al sistema');
INSERT INTO rol VALUES ('R02','CAPEquipo','Acceso parcial al sistema, excepto el permiso de delete');
INSERT INTO rol VALUES ('R03','Usuario','Acceso parcial al sistema, excepto el permiso de delete');
-- inserts usuarios --

INSERT INTO usuario VALUES ('ThemadProgramer01','sebastian','morales',' ababaa','A001','R03');
INSERT INTO usuario VALUES ('TheBestProgramer01','angela','villota',' not null','A001','R03');
INSERT INTO usuario VALUES ('Thebest','diego','pachon',' not this ','A001','R03');
INSERT INTO usuario VALUES ('yourDad','Manuel',' reyes',' no exception ','A001','R03');
INSERT INTO usuario VALUES ('hola123','juan','martinez',' sin description ','A002','R01');
INSERT INTO usuario VALUES ('iamTheBest','diego','perafan',' ','A001','R01');
INSERT INTO usuario VALUES ('mp2011','martin','pino',' programar es mi pasion ','A002','R03');
INSERT INTO usuario VALUES ('si2021','manuel','morales',' RPC LIVE ','A001','R03');
INSERT INTO usuario VALUES ('ThesoftwareMal','nhora','ochoa',' u .u ','A003','R03');
INSERT INTO usuario VALUES ('authenticateTrue','antonio','perez',' XDDDD ','A003','R03');
INSERT INTO usuario VALUES ('miPrecioso','Frodo','Bolson','ES MIO, SOLO MIO ','A002','R02');

-- insert Competencia

INSERT INTO competencia VALUES ('0001',TO_DATE('25/01/2022 08:00:00', 'dd/mm/yyyy hh24:mi:ss'),TO_DATE('20/01/2022 08:00:00', 'dd/mm/yyyy hh24:mi:ss'),TO_DATE('19/01/2022 08:00:00', 'dd/mm/yyyy hh24:mi:ss'),TO_DATE('12/01/2022 08:00:00', 'dd/mm/yyyy hh24:mi:ss'),'RPC Cali-ICPC','3','20','4');
INSERT INTO competencia VALUES ('0002',TO_DATE('09/12/2021 08:00:00', 'dd/mm/yyyy hh24:mi:ss'),TO_DATE('06/12/2021 08:00:00', 'dd/mm/yyyy hh24:mi:ss'),TO_DATE('05/12/2021 08:00:00', 'dd/mm/yyyy hh24:mi:ss'),TO_DATE('01/12/2021 08:00:00', 'dd/mm/yyyy hh24:mi:ss'),'RPC BOGOTA REGIONAL','3','20', '3');
INSERT INTO competencia VALUES ('0003',TO_DATE('15/12/2021 08:00:00', 'dd/mm/yyyy hh24:mi:ss'),TO_DATE('12/12/2021 08:00:00', 'dd/mm/yyyy hh24:mi:ss'),TO_DATE('11/12/2021 08:00:00', 'dd/mm/yyyy hh24:mi:ss'),TO_DATE('04/12/2021 08:00:00', 'dd/mm/yyyy hh24:mi:ss'),'RPC AMERICA CHALLENGE','1','20', '3');
INSERT INTO competencia VALUES ('0004',TO_DATE('24/12/2021 08:00:00', 'dd/mm/yyyy hh24:mi:ss'),TO_DATE('21/12/2021 08:00:00', 'dd/mm/yyyy hh24:mi:ss'),TO_DATE('20/12/2021 08:00:00', 'dd/mm/yyyy hh24:mi:ss'),TO_DATE('13/12/2021 08:00:00', 'dd/mm/yyyy hh24:mi:ss'),'RPC INVITATIONAL','2','20', '4');
INSERT INTO competencia VALUES ('0005',TO_DATE('27/12/2021 08:00:00', 'dd/mm/yyyy hh24:mi:ss'),TO_DATE('24/12/2021 08:00:00', 'dd/mm/yyyy hh24:mi:ss'),TO_DATE('23/12/2021 08:00:00', 'dd/mm/yyyy hh24:mi:ss'),TO_DATE('16/12/2021 08:00:00', 'dd/mm/yyyy hh24:mi:ss'),'RPC END YEAR','1','20', '4');
INSERT INTO competencia VALUES ('0006',TO_DATE('12/01/2022 08:00:00', 'dd/mm/yyyy hh24:mi:ss'),TO_DATE('09/01/2022 08:00:00', 'dd/mm/yyyy hh24:mi:ss'),TO_DATE('08/01/2022 08:00:00', 'dd/mm/yyyy hh24:mi:ss'),TO_DATE('01/01/2022 08:00:00', 'dd/mm/yyyy hh24:mi:ss'),'RPC NEW START','1','20', '4');
INSERT INTO competencia VALUES ('0007',TO_DATE('15/01/2022 08:00:00', 'dd/mm/yyyy hh24:mi:ss'),TO_DATE('12/01/2022 08:00:00', 'dd/mm/yyyy hh24:mi:ss'),TO_DATE('11/01/2022 08:00:00', 'dd/mm/yyyy hh24:mi:ss'),TO_DATE('04/01/2022 08:00:00', 'dd/mm/yyyy hh24:mi:ss'),'RPC CALI REGIONAL','3','20', '4');
INSERT INTO competencia VALUES ('0008',TO_DATE('20/01/2022 08:00:00', 'dd/mm/yyyy hh24:mi:ss'),TO_DATE('17/01/2022 08:00:00', 'dd/mm/yyyy hh24:mi:ss'),TO_DATE('16/01/2022 08:00:00', 'dd/mm/yyyy hh24:mi:ss'),TO_DATE('09/01/2022 08:00:00', 'dd/mm/yyyy hh24:mi:ss'),'RPC MEXICO REGIONAL','3','20', '3');
INSERT INTO competencia VALUES ('0009',TO_DATE('21/01/2022 08:00:00', 'dd/mm/yyyy hh24:mi:ss'),TO_DATE('18/01/2022 08:00:00', 'dd/mm/yyyy hh24:mi:ss'),TO_DATE('17/01/2022 08:00:00', 'dd/mm/yyyy hh24:mi:ss'),TO_DATE('10/01/2022 08:00:00', 'dd/mm/yyyy hh24:mi:ss'),'RPC ARGENTINA REGIONAL','3','20', '3');
INSERT INTO competencia VALUES ('0010',TO_DATE('25/01/2022 08:00:00', 'dd/mm/yyyy hh24:mi:ss'),TO_DATE('20/01/2022 08:00:00', 'dd/mm/yyyy hh24:mi:ss'),TO_DATE('19/01/2022 08:00:00', 'dd/mm/yyyy hh24:mi:ss'),TO_DATE('12/01/2022 08:00:00', 'dd/mm/yyyy hh24:mi:ss'),'RPC PRE-ICPC','5','20','3' );

-- insert equipo

INSERT INTO equipo VALUES ('E01','APO1_EXCEPTION');
INSERT INTO equipo VALUES ('E02','besteam');
INSERT INTO equipo VALUES ('E03','Nullpointer');
INSERT INTO equipo VALUES ('E04','dreamteam');
INSERT INTO equipo VALUES ('E05','colombia_programes');
INSERT INTO equipo VALUES ('E06','Usa_programers');
INSERT INTO equipo VALUES ('E07','AlienVip');
INSERT INTO equipo VALUES ('E08','Rudy');
INSERT INTO equipo VALUES ('E09','butTeam');
INSERT INTO equipo VALUES ('E010','turingequipe');

-- insert credenciales
INSERT INTO credencial VALUES ('RPC1','ThemadProgramer01@gmail.com','494da41e6a3cdc7fc6cac5a8b335af83','TheBestProgramer01');
INSERT INTO credencial VALUES ('RPC2','TheBestProgramer01@gmail.com','a26be9e6adc64abe919242aa51e8df3a','Thebest');
INSERT INTO credencial VALUES ('RPC3','Thebest@gmail.com','d79c4527ca03ec4dc6c46be2abcbc30c','yourDad');
INSERT INTO credencial VALUES ('RPC4','hola123@gmail.com','9450476b384b32d8ad8b758e76c98a69','hola123');
INSERT INTO credencial VALUES ('RPC5','iamTheBest@gmail.com','0e7aedd88c2ae1367a714f8812c326ef','iamTheBest');
INSERT INTO credencial VALUES ('RPC6','mp2011@gmail.com','4580b42ca0890462b00e18a9ac754fa6','mp2011');
INSERT INTO credencial VALUES ('RPC7','si2021@gmail.com','13f5da87ef7d982127099146ad95d117','si2021');
INSERT INTO credencial VALUES ('RPC8','ThesoftwareMal@gmail.com','af2f4e3c8f1d48125be22ff4f105b14a','ThesoftwareMal');
INSERT INTO credencial VALUES ('RPC9','authenticateTrue@gmail.com','2a5e15800b8c925d60c697411b2b9bd9','authenticateTrue');
INSERT INTO credencial VALUES ('RPC10','smiggle@gmail.com','9f21729c55fb934d64ea5cdd247492a3','miPrecioso');

--  insert permiso

INSERT INTO permiso VALUES ('P001','competencia',1,1,1,1);
INSERT INTO permiso VALUES ('P002','competencia',0,1,0,0);
INSERT INTO permiso VALUES ('P003','equipo',1,1,1,1);
INSERT INTO permiso VALUES ('P004','equipo',0,1,0,1);
INSERT INTO permiso VALUES ('P005','equipo_competencia',1,1,1,1);
INSERT INTO permiso VALUES ('P006','rol',1,1,1,1);
INSERT INTO permiso VALUES ('P007','rol_permiso',1,1,1,1);
INSERT INTO permiso VALUES ('P008','permiso',1,1,1,1);
INSERT INTO permiso VALUES ('P009','credencial',1,1,1,1);
INSERT INTO permiso VALUES ('P010','rol',0,1,0,0);

-- insert usuario_equipo

INSERT INTO usuario_equipo VALUES ('E001','Thebest');
INSERT INTO usuario_equipo VALUES ('E001','miPrecioso');
INSERT INTO usuario_equipo VALUES ('E001','TheBestProgramer01');

INSERT INTO usuario_equipo VALUES ('E004','yourDad');
INSERT INTO usuario_equipo VALUES ('E004','hola123');

INSERT INTO usuario_equipo VALUES ('E002','mp2011');

INSERT INTO usuario_equipo VALUES ('E003','ThesoftwareMal');
INSERT INTO usuario_equipo VALUES ('E003','authenticateTrue');

INSERT INTO usuario_equipo VALUES ('E009','Thebest');
INSERT INTO usuario_equipo VALUES ('E009','miPrecioso');

-- insert equipo_competencia

INSERT INTO equipo_competencia VALUES ('E001','0001');
INSERT INTO equipo_competencia VALUES ('E001','0010');
INSERT INTO equipo_competencia VALUES ('E001','0008');
INSERT INTO equipo_competencia VALUES ('E002','0001');
INSERT INTO equipo_competencia VALUES ('E002','0010');
INSERT INTO equipo_competencia VALUES ('E009','0007');
INSERT INTO equipo_competencia VALUES ('E009','0008');
INSERT INTO equipo_competencia VALUES ('E003','0002');
INSERT INTO equipo_competencia VALUES ('E004','0001');
INSERT INTO equipo_competencia VALUES ('E004','0010');

-- insert rol_permiso

INSERT INTO rol_permiso VALUES ('P001','R01');
INSERT INTO rol_permiso VALUES ('P010','R03');
INSERT INTO rol_permiso VALUES ('P003','R03');
INSERT INTO rol_permiso VALUES ('P005','R02');
INSERT INTO rol_permiso VALUES ('P006','R01');
INSERT INTO rol_permiso VALUES ('P007','R01');
INSERT INTO rol_permiso VALUES ('P008','R01');
INSERT INTO rol_permiso VALUES ('P009','R01');
INSERT INTO rol_permiso VALUES ('P009','R02');
INSERT INTO rol_permiso VALUES ('P009','R03');
INSERT INTO rol_permiso VALUES ('P004','R01');