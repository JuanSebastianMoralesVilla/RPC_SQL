-- inserts
-- por favor ponerlos en el orden de las tablas

-- insert pais
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

-- insert ciudad

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


-- insert rol
INSERT INTO rol VALUES ('R01','ADMIN','Acceso total al sistema');
INSERT INTO rol VALUES ('R02','CAPEquipo','Acceso parcial al sistema, excepto el permiso de delete');
INSERT INTO rol VALUES ('R03','Usuario','Acceso parcial al sistema, excepto el permiso de delete');


-- insert equuipo
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

-- insert permiso
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

-- insert credencial

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